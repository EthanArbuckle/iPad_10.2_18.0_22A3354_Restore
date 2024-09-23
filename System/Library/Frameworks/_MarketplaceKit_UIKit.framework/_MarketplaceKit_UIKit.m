unint64_t ActionButton.ButtonImagePlacement.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 4;
  if (result < 4)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t ActionButton.ButtonImagePlacement.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2355D7334(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2355D7348()
{
  sub_2355E5BD4();
  sub_2355E5BE0();
  return sub_2355E5BEC();
}

uint64_t sub_2355D738C()
{
  return sub_2355E5BE0();
}

uint64_t sub_2355D73B4()
{
  sub_2355E5BD4();
  sub_2355E5BE0();
  return sub_2355E5BEC();
}

unint64_t sub_2355D73F4@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return ActionButton.ButtonImagePlacement.init(rawValue:)(*a1, a2);
}

void sub_2355D73FC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t ActionButton.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DFC50(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, a1, type metadata accessor for ActionButton.Action);
  return swift_release();
}

uint64_t type metadata accessor for ActionButton.Action(uint64_t a1)
{
  return sub_2355D78A0(a1, qword_25624CA78);
}

id ActionButton.__allocating_init(action:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ActionButton.init(action:)(a1);
}

id ActionButton.init(action:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  objc_class *v24;
  char *v25;
  id v26;
  objc_class *v27;
  id v28;
  objc_super v30;
  objc_super v31;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25624C960);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *(_QWORD *)v5 = 32;
  *((_QWORD *)v5 + 1) = 0xE100000000000000;
  v6 = &v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor;
  v8 = (void *)objc_opt_self();
  v9 = v1;
  *(_QWORD *)&v1[v7] = objc_msgSend(v8, sel_whiteColor);
  *(_QWORD *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth] = 0;
  v10 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor;
  *(_QWORD *)&v9[v10] = objc_msgSend(v8, sel_clearColor);
  v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = 1;
  v11 = &v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize] = 0x4028000000000000;
  v12 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView;
  *(_QWORD *)&v9[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDD30]), sel_init);
  v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction] = 0;
  sub_2355DFC50(a1, (uint64_t)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action], type metadata accessor for ActionButton.Action);
  v13 = *MEMORY[0x24BDDB360];
  v14 = sub_2355E588C();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 104))(v4, v13, v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v4, 0, 1, v14);
  v16 = objc_msgSend(v8, sel_whiteColor);
  v17 = objc_msgSend(v16, sel_CGColor);

  v18 = objc_msgSend(v8, sel_blueColor);
  v19 = objc_msgSend(v18, sel_CGColor);

  v20 = objc_msgSend(v8, sel_clearColor);
  v21 = objc_msgSend(v20, sel_CGColor);

  v22 = objc_allocWithZone((Class)sub_2355E58A4());
  v23 = (void *)sub_2355E5898();
  v24 = (objc_class *)type metadata accessor for SecureButtonContentDelegate();
  v25 = (char *)objc_allocWithZone(v24);
  *(_QWORD *)&v25[OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag] = v23;
  v31.receiver = v25;
  v31.super_class = v24;
  v26 = v23;
  *(_QWORD *)&v9[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate] = objc_msgSendSuper2(&v31, sel_init);

  v27 = (objc_class *)type metadata accessor for ActionButton(0);
  v30.receiver = v9;
  v30.super_class = v27;
  v28 = objc_msgSendSuper2(&v30, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_2355DA550();

  sub_2355DFAE4(a1, type metadata accessor for ActionButton.Action);
  return v28;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D0408]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ActionButton(uint64_t a1)
{
  return sub_2355D78A0(a1, (uint64_t *)&unk_25624C9F0);
}

uint64_t sub_2355D78A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

id sub_2355D79AC(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v6;
  id v7;
  objc_super v9;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v6 = a1;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for ActionButton(0);
  v7 = objc_msgSendSuper2(&v9, *a4);
  swift_release();

  swift_release();
  return v7;
}

uint64_t sub_2355D7AE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v8;
  objc_super v10;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v8 = a1;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for ActionButton(0);
  objc_msgSendSuper2(&v10, *a5, a3);
  sub_2355DA428();
  swift_release();

  return swift_release();
}

id sub_2355D7CBC()
{
  uint64_t v0;
  id v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1 = *(id *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355D7E74(void *a1)
{
  char *v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (a1)
  {
    v3 = a1;
  }
  else
  {
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v3 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    swift_release();
  }
  v4 = a1;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = *(void **)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor];
  *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor] = v3;
  swift_release();

  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v6 = *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v7 = sub_2355DAA50();
  v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t sub_2355D8284(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  void *v5;
  objc_super v7;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ActionButton(0);
  objc_msgSendSuper2(&v7, sel_setTintColor_, a1);
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v4 = sub_2355DAA50();
  v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t sub_2355D83F8()
{
  uint64_t v0;
  uint64_t v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355D84FC(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = &v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  swift_release();
  swift_bridgeObjectRelease();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v7 = sub_2355DAA50();
  v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D86BC(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  sub_2355E5A00();
  a1[3] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label + 8);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  *a1 = v4;
  a1[1] = v3;
  return sub_2355D8820;
}

uint64_t sub_2355D8820(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2355D84FC(v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2355D84FC(*a1, v2);
  }
  return swift_release();
}

uint64_t sub_2355D887C()
{
  uint64_t v0;
  uint64_t v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355D8980(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = &v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  swift_release();
  swift_bridgeObjectRelease();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v7 = sub_2355DAA50();
  v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D8B40(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  sub_2355E5A00();
  a1[3] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName + 8);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  *a1 = v4;
  a1[1] = v3;
  return sub_2355D8CA4;
}

uint64_t sub_2355D8CA4(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2355D8980(v3, v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2355D8980(*a1, v2);
  }
  return swift_release();
}

uint64_t sub_2355D8D00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t result;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = *(_BYTE *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement);
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2355D8DF8(char *a1)
{
  _BYTE *v1;
  char v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = *a1;
  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = v2;
  swift_release();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v4 = sub_2355DAA50();
  v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D8FA4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _BYTE *v3;
  char v4;

  *a1 = v1;
  sub_2355E5A00();
  a1[1] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = a1 + 2;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement);
  swift_release();
  swift_release();
  *v3 = v4;
  return sub_2355D9100;
}

uint64_t sub_2355D9100(uint64_t a1, char a2)
{
  char *v2;
  char v4;
  char v5;

  if ((a2 & 1) != 0)
  {
    v4 = *(_BYTE *)(a1 + 16);
    v2 = &v4;
  }
  else
  {
    v5 = *(_BYTE *)(a1 + 16);
    v2 = &v5;
  }
  sub_2355D8DF8(v2);
  return swift_release();
}

double sub_2355D914C()
{
  uint64_t v0;
  double v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1 = *(double *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355D9250(double a1, double a2)
{
  char *v2;
  double *v5;
  uint64_t v6;
  id v7;
  void *v8;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = (double *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  *v5 = a1;
  v5[1] = a2;
  swift_release();
  objc_msgSend(v2, sel_frame);
  objc_msgSend(v2, sel_setFrame_);
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v7 = sub_2355DAA50();
  v8 = *(void **)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v7;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v2, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D942C(_QWORD *a1))(double *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  sub_2355E5A00();
  a1[3] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size + 8);
  swift_release();
  swift_release();
  *a1 = v3;
  a1[1] = v4;
  return sub_2355D9590;
}

uint64_t sub_2355D9590(double *a1)
{
  sub_2355D9250(*a1, a1[1]);
  return swift_release();
}

double sub_2355D95B8()
{
  return sub_2355D9B4C(143, 42, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
}

uint64_t sub_2355D95CC(double a1)
{
  return sub_2355D9C6C(a1, 146, 42, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
}

uint64_t (*sub_2355D95E0(_QWORD *a1))(double *a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  sub_2355E5A00();
  a1[2] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2355D9740;
}

uint64_t sub_2355D9740(double *a1, uint64_t a2)
{
  return sub_2355D9F94(a1, a2, (void (*)(double))sub_2355D95CC);
}

uint64_t sub_2355D974C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *a1;
  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(v3, sel__cornerRadius);
  v5 = v4;
  result = swift_release();
  *a2 = v5;
  return result;
}

double sub_2355D97FC()
{
  void *v0;
  double v1;
  double v2;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(v0, sel__cornerRadius);
  v2 = v1;
  swift_release();
  return v2;
}

uint64_t sub_2355D98A0(double a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  void *v5;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(v1, sel__setCornerRadius_, a1);
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v3 = *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v4 = sub_2355DAA50();
  v5 = *(void **)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v4;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D9A00(_QWORD *a1))(double *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  sub_2355E5A00();
  a1[2] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(v1, sel__cornerRadius);
  v4 = v3;
  swift_release();
  *a1 = v4;
  return sub_2355D9B10;
}

uint64_t sub_2355D9B10(double *a1)
{
  sub_2355D98A0(*a1);
  return swift_release();
}

double sub_2355D9B38()
{
  return sub_2355D9B4C(163, 38, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
}

double sub_2355D9B4C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  double v5;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = *(double *)(v3 + *a3);
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_2355D9C58(double a1)
{
  return sub_2355D9C6C(a1, 166, 38, &OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
}

uint64_t sub_2355D9C6C(double a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  char *v4;
  uint64_t v7;
  id v8;
  void *v9;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(double *)&v4[*a4] = a1;
  swift_release();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v7 = *(_QWORD *)&v4[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v8 = sub_2355DAA50();
  v9 = *(void **)(v7 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v7 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v8;

  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v4, sel_setNeedsLayout);
  swift_release();
  return swift_release();
}

uint64_t (*sub_2355D9E28(_QWORD *a1))(double *a1, uint64_t a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  sub_2355E5A00();
  a1[2] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2355D9F88;
}

uint64_t sub_2355D9F88(double *a1, uint64_t a2)
{
  return sub_2355D9F94(a1, a2, (void (*)(double))sub_2355D9C58);
}

uint64_t sub_2355D9F94(double *a1, uint64_t a2, void (*a3)(double))
{
  a3(*a1);
  return swift_release();
}

id sub_2355D9FBC()
{
  uint64_t v0;
  id v1;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v1 = *(id *)(v0 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2355DA0B8(void *a1)
{
  char *v1;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = a1;
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = *(void **)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor];
  *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor] = v3;
  swift_release();

  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355DA428();
  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate];
  v6 = sub_2355DAA50();
  v7 = *(void **)(v5 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit27SecureButtonContentDelegate_templateTag) = v6;

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel__updateContent);
  objc_msgSend(v1, sel_setNeedsLayout);
  swift_release();

  return swift_release();
}

uint64_t (*sub_2355DA278(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  id v3;

  a1[1] = v1;
  sub_2355E5A00();
  a1[2] = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = *(id *)(v1 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor);
  swift_release();
  swift_release();
  *a1 = v3;
  return sub_2355DA3D8;
}

uint64_t sub_2355DA3D8(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    sub_2355DA0B8(v3);

  }
  else
  {
    sub_2355DA0B8(v2);
  }
  return swift_release();
}

uint64_t sub_2355DA428()
{
  char *v0;
  id v1;
  _BOOL4 v2;
  void *v3;
  unsigned int v4;
  double v5;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (objc_msgSend(v0, sel_isEnabled))
  {
    v1 = objc_msgSend(v0, sel_traitCollection);
    v2 = objc_msgSend(v1, sel_userInterfaceStyle) == (id)2;

    v3 = *(void **)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView];
    v4 = objc_msgSend(v0, sel_isHighlighted);
    v5 = dbl_2355E6160[v2];
    if (!v4)
      v5 = 1.0;
    objc_msgSend(v3, sel_setAlpha_, v5);
  }
  else
  {
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView], sel_setAlpha_, 0.25);
  }
  return swift_release();
}

void sub_2355DA550()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  char *v6;
  uint64_t v7;

  v1 = v0;
  type metadata accessor for ActionButton.Action(0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = *(void **)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView];
  objc_msgSend(v4, sel__setContentDelegate_, *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate]);
  objc_msgSend(v0, sel_addTarget_action_forControlEvents_, v0, sel_defaultAction_event_, 64);
  v5 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  objc_msgSend(v1, sel_setIsAccessibilityElement_, 1);
  sub_2355DFC50((uint64_t)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action], (uint64_t)v3, type metadata accessor for ActionButton.Action);
  v6 = (char *)&loc_2355DA6D8 + *((int *)qword_2355DAA40 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

uint64_t sub_2355DA6E8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;

  swift_bridgeObjectRelease();
  swift_release();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_bridgeObjectRetain();
  swift_release();
  v3 = (void *)sub_2355E597C();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setAccessibilityIdentifier_, v3);

  objc_msgSend(v1, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_addSubview_, v1);
  v4 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB00);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2355E6170;
  v6 = objc_msgSend(v1, sel_centerXAnchor);
  v7 = objc_msgSend(v0, sel_centerXAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v5 + 32) = v8;
  v9 = objc_msgSend(v1, sel_centerYAnchor);
  v10 = objc_msgSend(v0, sel_centerYAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v5 + 40) = v11;
  *(_QWORD *)(v2 - 112) = v5;
  sub_2355E59C4();
  sub_2355DFDC4();
  v12 = (void *)sub_2355E59B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v12);

  LODWORD(v13) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v13);
  LODWORD(v14) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 0, v14);
  return swift_release();
}

id sub_2355DAA50()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id result;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25624C960);
  MEMORY[0x24BDAC7A8]();
  sub_2355E5A00();
  v14 = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v12 = *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label + 8];
  v13 = *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  swift_bridgeObjectRetain();
  swift_release();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v11 = *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  swift_bridgeObjectRetain();
  swift_release();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_release();
  sub_2355E5880();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v2 = *(id *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor];
  swift_release();
  v3 = objc_msgSend(v2, sel_CGColor, v11, v12, v13, v14);

  result = objc_msgSend(v0, sel_tintColor);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, sel_CGColor);

    objc_msgSend(v1, sel__cornerRadius);
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    swift_release();
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    swift_release();
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    swift_release();
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v7 = *(id *)&v1[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor];
    swift_release();
    v8 = objc_msgSend(v7, sel_CGColor);

    v9 = objc_allocWithZone((Class)sub_2355E58A4());
    v10 = sub_2355E5898();
    swift_release();
    return (id)v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2355DAF60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7[14] = a6;
  v7[15] = a7;
  v7[12] = a4;
  v7[13] = a5;
  v8 = sub_2355E5958();
  v7[16] = v8;
  v7[17] = *(_QWORD *)(v8 - 8);
  v7[18] = swift_task_alloc();
  v9 = sub_2355E58D4();
  v7[19] = v9;
  v7[20] = *(_QWORD *)(v9 - 8);
  v7[21] = swift_task_alloc();
  v7[22] = swift_task_alloc();
  v10 = sub_2355E58B0();
  v7[23] = v10;
  v7[24] = *(_QWORD *)(v10 - 8);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  v7[28] = type metadata accessor for ActionButton.Action(0);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  v7[32] = type metadata accessor for InstallConfiguration(0);
  v7[33] = swift_task_alloc();
  v11 = sub_2355E582C();
  v7[34] = v11;
  v7[35] = *(_QWORD *)(v11 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  v12 = sub_2355E5910();
  v7[38] = v12;
  v7[39] = *(_QWORD *)(v12 - 8);
  v7[40] = swift_task_alloc();
  v13 = sub_2355E5928();
  v7[41] = v13;
  v7[42] = *(_QWORD *)(v13 - 8);
  v7[43] = swift_task_alloc();
  v14 = sub_2355E58E0();
  v7[44] = v14;
  v7[45] = *(_QWORD *)(v14 - 8);
  v7[46] = swift_task_alloc();
  v15 = sub_2355E5904();
  v7[47] = v15;
  v7[48] = *(_QWORD *)(v15 - 8);
  v7[49] = swift_task_alloc();
  v7[50] = sub_2355E5A00();
  v7[51] = sub_2355E59F4();
  v7[52] = sub_2355E59E8();
  v7[53] = v16;
  return swift_task_switch();
}

uint64_t sub_2355DB1B4()
{
  _QWORD *v0;
  void *v1;
  id v2;
  _QWORD *v3;

  v1 = (void *)v0[13];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[45] + 16))(v0[46], v0[12], v0[44]);
  v2 = v1;
  sub_2355E58F8();
  v3 = (_QWORD *)swift_task_alloc();
  v0[54] = v3;
  *v3 = v0;
  v3[1] = sub_2355DB240;
  return sub_2355E58EC();
}

uint64_t sub_2355DB240()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355DB2A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int **v13;
  int *v14;
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
  uint64_t v37;
  _QWORD *v39;
  int *v40;
  _QWORD *v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;

  v2 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 304);
  sub_2355E591C();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BDDB420])
  {
    v5 = *(_QWORD *)(v0 + 320);
    v6 = *(_QWORD *)(v0 + 296);
    v7 = *(_QWORD *)(v0 + 272);
    v8 = *(_QWORD *)(v0 + 280);
    v9 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 112);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 312) + 96))(v5, *(_QWORD *)(v0 + 304));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v5, v7);
    sub_2355DFC50(v10 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v9, type metadata accessor for ActionButton.Action);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v12 = *(_QWORD *)(v0 + 256);
      v11 = *(_QWORD *)(v0 + 264);
      sub_2355DFA58(*(_QWORD *)(v0 + 248), v11);
      v13 = (int **)(v11 + *(int *)(v12 + 20));
      v14 = *v13;
      *(_QWORD *)(v0 + 448) = v13[1];
      v42 = (uint64_t (*)(uint64_t))((char *)v14 + *v14);
      swift_retain();
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 456) = v15;
      *v15 = v0;
      v15[1] = sub_2355DBCDC;
      v16 = v0 + 40;
      return v42(v16);
    }
    v23 = *(_QWORD *)(v0 + 384);
    v43 = *(_QWORD *)(v0 + 392);
    v24 = *(_QWORD *)(v0 + 376);
    v26 = *(_QWORD *)(v0 + 336);
    v25 = *(_QWORD *)(v0 + 344);
    v27 = *(_QWORD *)(v0 + 328);
    v29 = *(_QWORD *)(v0 + 296);
    v30 = *(_QWORD *)(v0 + 272);
    v28 = *(_QWORD *)(v0 + 280);
    v31 = *(_QWORD *)(v0 + 248);
LABEL_8:
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v43, v24);
    sub_2355DFAE4(v31, type metadata accessor for ActionButton.Action);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v4 == *MEMORY[0x24BDDB428])
  {
    v17 = *(_QWORD *)(v0 + 320);
    v19 = *(_QWORD *)(v0 + 280);
    v18 = *(_QWORD *)(v0 + 288);
    v20 = *(_QWORD *)(v0 + 272);
    v21 = *(_QWORD *)(v0 + 240);
    v22 = *(_QWORD *)(v0 + 112);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 312) + 96))(v17, *(_QWORD *)(v0 + 304));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v17, v20);
    sub_2355DFC50(v22 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v21, type metadata accessor for ActionButton.Action);
    if (!swift_getEnumCaseMultiPayload())
    {
      v39 = *(_QWORD **)(v0 + 240);
      *(_QWORD *)(v0 + 504) = *v39;
      v40 = (int *)v39[1];
      *(_QWORD *)(v0 + 512) = v39[2];
      v42 = (uint64_t (*)(uint64_t))((char *)v40 + *v40);
      v41 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 520) = v41;
      *v41 = v0;
      v41[1] = sub_2355DC740;
      v16 = v0 + 64;
      return v42(v16);
    }
    v23 = *(_QWORD *)(v0 + 384);
    v43 = *(_QWORD *)(v0 + 392);
    v24 = *(_QWORD *)(v0 + 376);
    v26 = *(_QWORD *)(v0 + 336);
    v25 = *(_QWORD *)(v0 + 344);
    v27 = *(_QWORD *)(v0 + 328);
    v28 = *(_QWORD *)(v0 + 280);
    v29 = *(_QWORD *)(v0 + 288);
    v30 = *(_QWORD *)(v0 + 272);
    v31 = *(_QWORD *)(v0 + 240);
    goto LABEL_8;
  }
  if (v4 == *MEMORY[0x24BDDB430])
  {
    v33 = *(_QWORD *)(v0 + 384);
    v32 = *(_QWORD *)(v0 + 392);
    v34 = *(_QWORD *)(v0 + 376);
    v36 = *(_QWORD *)(v0 + 336);
    v35 = *(_QWORD *)(v0 + 344);
    v37 = *(_QWORD *)(v0 + 328);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    *(_BYTE *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
    swift_release();
    goto LABEL_13;
  }
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_release();
  return sub_2355E5ACC();
}

void sub_2355DB7A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v0[48];
  v1 = v0[49];
  v3 = v0[47];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (void *)v0[55];
  sub_2355E5934();
  v5 = v4;
  v6 = v4;
  v7 = sub_2355E594C();
  v8 = sub_2355E5A24();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v9 = 136446210;
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v18 = v0[17];
    v19 = v0[16];
    v20 = v0[18];
    swift_getErrorValue();
    v10 = *(_QWORD *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v10 + 16))();
    v11 = sub_2355E5988();
    v13 = v12;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2355E23CC(v11, v13, &v22);
    sub_2355E5A54();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2355D5000, v7, v8, "[ActionButton] Error performing action: %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7D048C](v21, -1, -1);
    MEMORY[0x23B7D048C](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v15 = v0[17];
    v14 = v0[18];
    v16 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  sub_2355DFC50(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  v17 = (char *)&loc_2355DBA44 + dword_2355DBCCC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2355DBA54()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 120);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2355E5AD8();
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_10;
  }
  sub_2355E5874();
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x2355DBCCCLL);
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = 0;
    do
    {
      MEMORY[0x23B7D0000](v4++, *(_QWORD *)(v1 + 120));
      sub_2355E5868();
      sub_2355E5844();
      swift_unknownObjectRelease();
      swift_release();
    }
    while (v3 != v4);
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 120) + 32;
    do
    {
      v5 += 8;
      swift_retain();
      sub_2355E5868();
      sub_2355E5844();
      swift_release();
      swift_release();
      --v3;
    }
    while (v3);
  }
LABEL_10:
  swift_bridgeObjectRelease();

  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(_BYTE *)(*(_QWORD *)(v1 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2355DBCDC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2355DBD30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  v2 = v0[5];
  v1 = v0[6];
  v0[58] = v2;
  v0[59] = v1;
  v3 = (void *)v0[7];
  v0[60] = v3;
  if (v1)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      v4 = v3;
      v5 = objc_msgSend(v4, sel_externalizedContext);
      if (v5)
      {
        v6 = v5;
        v23 = sub_2355E5820();
        v8 = v7;

LABEL_9:
        v10 = v0[37];
        v11 = v0[34];
        v12 = v0[35];
        v13 = v0[27];
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CAF8);
        v15 = (_QWORD *)(v13 + *(int *)(v14 + 48));
        v16 = (uint64_t *)(v13 + *(int *)(v14 + 64));
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v10, v11);
        *v15 = v2;
        v15[1] = v1;
        *v16 = v23;
        v16[1] = v8;
        v9 = (unsigned int *)MEMORY[0x24BDDB398];
        goto LABEL_10;
      }

    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v23 = 0;
    v8 = 0xF000000000000000;
    goto LABEL_9;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[35] + 16))(v0[27], v0[37], v0[34]);
  v9 = (unsigned int *)MEMORY[0x24BDDB390];
LABEL_10:
  v17 = v0[26];
  v18 = v0[27];
  v19 = v0[23];
  v20 = v0[24];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v18, *v9, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v17, v18, v19);
  sub_2355E58C8();
  v21 = (_QWORD *)swift_task_alloc();
  v0[61] = v21;
  *v21 = v0;
  v21[1] = sub_2355DBEBC;
  return sub_2355E58BC();
}

uint64_t sub_2355DBEBC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 496) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355DBF1C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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

  v1 = *(_QWORD *)(v0 + 472);
  v2 = *(void **)(v0 + 480);
  v3 = *(_QWORD *)(v0 + 464);
  v19 = *(_QWORD *)(v0 + 376);
  v20 = *(_QWORD *)(v0 + 392);
  v17 = *(_QWORD *)(v0 + 344);
  v18 = *(_QWORD *)(v0 + 384);
  v15 = *(_QWORD *)(v0 + 336);
  v16 = *(_QWORD *)(v0 + 328);
  v13 = *(_QWORD *)(v0 + 272);
  v14 = *(_QWORD *)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 176);
  v9 = *(_QWORD *)(v0 + 152);
  v8 = *(_QWORD *)(v0 + 160);
  swift_release();
  sub_2355DFD94(v3, v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_2355DFAE4(v11, type metadata accessor for InstallConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(_BYTE *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2355DC158()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
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

  v1 = v0[59];
  v2 = (void *)v0[60];
  v3 = v0[58];
  v35 = v0[47];
  v36 = v0[49];
  v31 = v0[43];
  v33 = v0[48];
  v28 = v0[42];
  v29 = v0[41];
  v26 = v0[34];
  v27 = v0[37];
  v24 = v0[33];
  v25 = v0[35];
  v4 = v0[27];
  v5 = v0[23];
  v6 = v0[24];
  v7 = v0[22];
  v9 = v0[19];
  v8 = v0[20];
  swift_release();
  sub_2355DFD94(v3, v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  sub_2355DFAE4(v24, type metadata accessor for InstallConfiguration);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v29);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v36, v35);
  v10 = (void *)v0[62];
  sub_2355E5934();
  v11 = v10;
  v12 = v10;
  v13 = sub_2355E594C();
  v14 = sub_2355E5A24();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v38 = v37;
    *(_DWORD *)v15 = 136446210;
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v30 = v0[17];
    v32 = v0[16];
    v34 = v0[18];
    swift_getErrorValue();
    v16 = *(_QWORD *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v16 + 16))();
    v17 = sub_2355E5988();
    v19 = v18;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2355E23CC(v17, v19, &v38);
    sub_2355E5A54();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2355D5000, v13, v14, "[ActionButton] Error performing action: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7D048C](v37, -1, -1);
    MEMORY[0x23B7D048C](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v34, v32);
  }
  else
  {
    v21 = v0[17];
    v20 = v0[18];
    v22 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  sub_2355DFC50(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  v23 = (char *)&loc_2355DC4A8 + *((int *)qword_2355DC730 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

uint64_t sub_2355DC4B8()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 120);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2355E5AD8();
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_10;
  }
  sub_2355E5874();
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x2355DC730);
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = 0;
    do
    {
      MEMORY[0x23B7D0000](v4++, *(_QWORD *)(v1 + 120));
      sub_2355E5868();
      sub_2355E5844();
      swift_unknownObjectRelease();
      swift_release();
    }
    while (v3 != v4);
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 120) + 32;
    do
    {
      v5 += 8;
      swift_retain();
      sub_2355E5868();
      sub_2355E5844();
      swift_release();
      swift_release();
      --v3;
    }
    while (v3);
  }
LABEL_10:
  swift_bridgeObjectRelease();

  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(_BYTE *)(*(_QWORD *)(v1 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2355DC740()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355DC78C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int *v8;
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
  _QWORD *v20;

  v2 = v0[8];
  v1 = (void *)v0[9];
  v0[66] = v2;
  v0[67] = v1;
  if (v2)
  {
    if (v1)
    {
      swift_bridgeObjectRetain();
      v3 = v1;
      v4 = objc_msgSend(v3, sel_externalizedContext);
      if (v4)
      {
        v5 = v4;
        v1 = (void *)sub_2355E5820();
        v7 = v6;

LABEL_9:
        v10 = v0[35];
        v9 = v0[36];
        v11 = v0[34];
        v12 = v0[25];
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CAF0);
        v14 = *(int *)(v13 + 48);
        v15 = (_QWORD *)(v12 + *(int *)(v13 + 64));
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v9, v11);
        *(_QWORD *)(v12 + v14) = v2;
        *v15 = v1;
        v15[1] = v7;
        v8 = (unsigned int *)MEMORY[0x24BDDB3A8];
        goto LABEL_10;
      }

      v1 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v7 = 0xF000000000000000;
    goto LABEL_9;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[35] + 16))(v0[25], v0[36], v0[34]);
  v8 = (unsigned int *)MEMORY[0x24BDDB3A0];
LABEL_10:
  v16 = v0[25];
  v17 = v0[26];
  v18 = v0[23];
  v19 = v0[24];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v16, *v8, v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
  sub_2355E58C8();
  v20 = (_QWORD *)swift_task_alloc();
  v0[68] = v20;
  *v20 = v0;
  v20[1] = sub_2355DC90C;
  return sub_2355E58BC();
}

uint64_t sub_2355DC90C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 552) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2355DC96C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(void **)(v0 + 536);
  v2 = *(_QWORD *)(v0 + 528);
  v17 = *(_QWORD *)(v0 + 376);
  v18 = *(_QWORD *)(v0 + 392);
  v15 = *(_QWORD *)(v0 + 344);
  v16 = *(_QWORD *)(v0 + 384);
  v13 = *(_QWORD *)(v0 + 336);
  v14 = *(_QWORD *)(v0 + 328);
  v10 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 272);
  v12 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 168);
  v8 = *(_QWORD *)(v0 + 152);
  swift_release();
  sub_2355DFD68(v2, v1);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(_BYTE *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2355DCBA4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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

  v1 = (void *)v0[67];
  v2 = v0[66];
  v33 = v0[47];
  v34 = v0[49];
  v29 = v0[43];
  v31 = v0[48];
  v26 = v0[42];
  v27 = v0[41];
  v23 = v0[35];
  v24 = v0[34];
  v25 = v0[36];
  v3 = v0[24];
  v4 = v0[25];
  v5 = v0[23];
  v6 = v0[20];
  v7 = v0[21];
  v8 = v0[19];
  swift_release();
  sub_2355DFD68(v2, v1);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v29, v27);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v34, v33);
  v9 = (void *)v0[69];
  sub_2355E5934();
  v10 = v9;
  v11 = v9;
  v12 = sub_2355E594C();
  v13 = sub_2355E5A24();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v36 = v35;
    *(_DWORD *)v14 = 136446210;
    sub_2355E59F4();
    sub_2355E59E8();
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor();
    v28 = v0[17];
    v30 = v0[16];
    v32 = v0[18];
    swift_getErrorValue();
    v15 = *(_QWORD *)(v0[3] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v15 + 16))();
    v16 = sub_2355E5988();
    v18 = v17;
    swift_release();
    swift_task_dealloc();
    v0[11] = sub_2355E23CC(v16, v18, &v36);
    sub_2355E5A54();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2355D5000, v12, v13, "[ActionButton] Error performing action: %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7D048C](v35, -1, -1);
    MEMORY[0x23B7D048C](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v32, v30);
  }
  else
  {
    v20 = v0[17];
    v19 = v0[18];
    v21 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  sub_2355DFC50(v0[14] + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, v0[29], type metadata accessor for ActionButton.Action);
  v22 = (char *)&loc_2355DCEF0 + *((int *)qword_2355DD178 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

uint64_t sub_2355DCF00()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 120);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2355E5AD8();
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_10;
  }
  sub_2355E5874();
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x2355DD178);
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = 0;
    do
    {
      MEMORY[0x23B7D0000](v4++, *(_QWORD *)(v1 + 120));
      sub_2355E5868();
      sub_2355E5844();
      swift_unknownObjectRelease();
      swift_release();
    }
    while (v3 != v4);
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 120) + 32;
    do
    {
      v5 += 8;
      swift_retain();
      sub_2355E5868();
      sub_2355E5844();
      swift_release();
      swift_release();
      --v3;
    }
    while (v3);
  }
LABEL_10:
  swift_bridgeObjectRelease();

  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  *(_BYTE *)(*(_QWORD *)(v1 + 112) + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2355DD188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2355E5A18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2355E5A0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2355DFC94(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2355E59E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id ActionButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ActionButton.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ActionButton.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActionButton(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2355DD4C8()
{
  unint64_t result;

  result = qword_25624C9C0;
  if (!qword_25624C9C0)
  {
    result = MEMORY[0x23B7D0420](&protocol conformance descriptor for ActionButton.ButtonImagePlacement, &type metadata for ActionButton.ButtonImagePlacement);
    atomic_store(result, (unint64_t *)&qword_25624C9C0);
  }
  return result;
}

uint64_t sub_2355DD50C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2355D83F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2355DD534(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2355D84FC(v1, v2);
}

uint64_t sub_2355DD570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2355D887C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2355DD598(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_2355D8980(v1, v2);
}

uint64_t sub_2355DD5D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2355D8D00(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_2355DD60C(char *a1)
{
  char v2;

  v2 = *a1;
  return sub_2355D8DF8(&v2);
}

void sub_2355DD640(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(double *)a1 = sub_2355D914C();
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t sub_2355DD668(double *a1)
{
  return sub_2355D9250(*a1, a1[1]);
}

void sub_2355DD68C(double *a1@<X8>)
{
  *a1 = sub_2355D95B8();
}

uint64_t sub_2355DD6B4(double *a1)
{
  return sub_2355D95CC(*a1);
}

uint64_t sub_2355DD6DC(double *a1)
{
  return sub_2355D98A0(*a1);
}

void sub_2355DD700(double *a1@<X8>)
{
  *a1 = sub_2355D9B38();
}

uint64_t sub_2355DD728(double *a1)
{
  return sub_2355D9C58(*a1);
}

id sub_2355DD74C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_2355D9FBC();
  *a1 = result;
  return result;
}

uint64_t sub_2355DD774(id *a1)
{
  return sub_2355DA0B8(*a1);
}

uint64_t sub_2355DD834()
{
  return type metadata accessor for ActionButton(0);
}

uint64_t sub_2355DD83C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ActionButton.Action(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ActionButton()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActionButton.__allocating_init(action:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of ActionButton.label.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of ActionButton.label.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of ActionButton.label.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of ActionButton.imageName.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of ActionButton.imageName.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of ActionButton.imageName.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ActionButton.imagePlacement.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of ActionButton.size.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of ActionButton.size.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of ActionButton.size.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of ActionButton.fontSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of ActionButton.fontSize.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of ActionButton.fontSize.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ActionButton.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of ActionButton.borderWidth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of ActionButton.borderColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of ActionButton.borderColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of ActionButton.borderColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ActionButton.Action(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      a1[2] = a2[2];
      v11 = (int *)type metadata accessor for InstallMetadata(0);
      v12 = v11[6];
      v13 = (char *)a1 + v12;
      v14 = (char *)a2 + v12;
      v15 = sub_2355E5814();
      v16 = *(_QWORD *)(v15 - 8);
      v17 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
      swift_bridgeObjectRetain();
      v17(v13, v14, v15);
      *((_BYTE *)a1 + v11[7]) = *((_BYTE *)a2 + v11[7]);
      v18 = v11[8];
      v19 = (char *)a1 + v18;
      v20 = (char *)a2 + v18;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))((char *)a2 + v18, 1, v15))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v17(v19, v20, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v19, 0, 1, v15);
      }
      v22 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
      v23 = (_QWORD *)((char *)a1 + v22);
      v24 = (_QWORD *)((char *)a2 + v22);
      v25 = v24[1];
      *v23 = *v24;
      v23[1] = v25;
      swift_retain();
      goto LABEL_11;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v8;
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for ActionButton.Action(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    swift_bridgeObjectRelease();
    v3 = type metadata accessor for InstallMetadata(0);
    v4 = a1 + *(int *)(v3 + 24);
    v5 = sub_2355E5814();
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v7(v4, v5);
    v8 = a1 + *(int *)(v3 + 32);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5))
      v7(v8, v5);
    type metadata accessor for InstallConfiguration(0);
  }
  else
  {
    if ((_DWORD)result)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_release();
}

_QWORD *initializeWithCopy for ActionButton.Action(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    v9 = (int *)type metadata accessor for InstallMetadata(0);
    v10 = v9[6];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_2355E5814();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    swift_bridgeObjectRetain();
    v15(v11, v12, v13);
    *((_BYTE *)a1 + v9[7]) = *((_BYTE *)a2 + v9[7]);
    v16 = v9[8];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))((char *)a2 + v16, 1, v13))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v15(v17, v18, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
    }
    v20 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
    v21 = (_QWORD *)((char *)a1 + v20);
    v22 = (_QWORD *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    swift_retain();
    goto LABEL_9;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v7;
    swift_bridgeObjectRetain();
    swift_retain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for ActionButton.Action(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_2355DFAE4((uint64_t)a1, type metadata accessor for ActionButton.Action);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      v9 = (int *)type metadata accessor for InstallMetadata(0);
      v10 = v9[6];
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = sub_2355E5814();
      v14 = *(_QWORD *)(v13 - 8);
      v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
      swift_bridgeObjectRetain();
      v15(v11, v12, v13);
      *((_BYTE *)a1 + v9[7]) = *((_BYTE *)a2 + v9[7]);
      v16 = v9[8];
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))((char *)a2 + v16, 1, v13))
      {
        v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        v15(v17, v18, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      }
      v20 = *(int *)(type metadata accessor for InstallConfiguration(0) + 20);
      v21 = (_QWORD *)((char *)a1 + v20);
      v22 = (_QWORD *)((char *)a2 + v20);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      swift_retain();
      goto LABEL_10;
    }
    if (!EnumCaseMultiPayload)
    {
      *a1 = *a2;
      v7 = a2[1];
      v8 = a2[2];
      a1[1] = v7;
      a1[2] = v8;
      swift_bridgeObjectRetain();
      swift_retain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *initializeWithTake for ActionButton.Action(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v6 = (int *)type metadata accessor for InstallMetadata(0);
    v7 = v6[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2355E5814();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v12(v8, v9, v10);
    *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
    v13 = v6[8];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)a2 + v13, 1, v10))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
    }
    v17 = type metadata accessor for InstallConfiguration(0);
    *(_OWORD *)((char *)a1 + *(int *)(v17 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v17 + 20));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for ActionButton.Action(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 != a2)
  {
    sub_2355DFAE4((uint64_t)a1, type metadata accessor for ActionButton.Action);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = a2[2];
      v6 = (int *)type metadata accessor for InstallMetadata(0);
      v7 = v6[6];
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_2355E5814();
      v11 = *(_QWORD *)(v10 - 8);
      v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v12(v8, v9, v10);
      *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
      v13 = v6[8];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)a2 + v13, 1, v10))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
        memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        v12(v14, v15, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
      }
      v17 = type metadata accessor for InstallConfiguration(0);
      *(_OWORD *)((char *)a1 + *(int *)(v17 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(v17 + 20));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionButton.Action(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ActionButton.Action(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2355DE4C0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2355DE4D0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for InstallConfiguration(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ActionButton.ButtonImagePlacement(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ActionButton.ButtonImagePlacement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355DE638 + 4 * byte_2355E6195[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2355DE66C + 4 * byte_2355E6190[v4]))();
}

uint64_t sub_2355DE66C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355DE674(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355DE67CLL);
  return result;
}

uint64_t sub_2355DE688(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355DE690);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2355DE694(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355DE69C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355DE6A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2355DE6B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActionButton.ButtonImagePlacement()
{
  return &type metadata for ActionButton.ButtonImagePlacement;
}

uint64_t sub_2355DE6C8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2355DE72C;
  return v6(a1);
}

uint64_t sub_2355DE72C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2355DE778()
{
  _BYTE *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;

  v1 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__label];
  *v1 = 32;
  v1[1] = 0xE100000000000000;
  v2 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imageName];
  *v2 = 0;
  v2[1] = 0;
  v3 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor;
  v4 = (void *)objc_opt_self();
  *(_QWORD *)&v0[v3] = objc_msgSend(v4, sel_whiteColor);
  *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderWidth] = 0;
  v5 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor;
  *(_QWORD *)&v0[v5] = objc_msgSend(v4, sel_clearColor);
  v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__imagePlacement] = 1;
  v6 = &v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__size];
  *v6 = 0;
  v6[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__fontSize] = 0x4028000000000000;
  v7 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDD30]), sel_init);
  v0[OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction] = 0;

  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_release();
  result = sub_2355E5ACC();
  __break(1u);
  return result;
}

uint64_t sub_2355DE924(void *a1)
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
  char *v10;
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
  uint64_t v23;
  char v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  id v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v42 = a1;
  v1 = sub_2355E5958();
  v44 = *(_QWORD *)(v1 - 8);
  v45 = v1;
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v37[1] = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v37[2] = (char *)v37 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v37 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v37 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CAB0);
  MEMORY[0x24BDAC7A8](v11);
  v40 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for InstallConfiguration(0);
  MEMORY[0x24BDAC7A8](v13);
  v37[3] = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for InstallMetadata(0);
  v37[0] = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v16 = type metadata accessor for ActionButton.Action(0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_2355E58E0();
  v39 = *(_QWORD *)(v38 - 8);
  v19 = *(_QWORD *)(v39 + 64);
  v20 = MEMORY[0x24BDAC7A8](v38);
  v37[4] = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v41 = (char *)v37 - v21;
  v22 = sub_2355E5A00();
  v46 = sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E59F4();
  v43 = v22;
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v23 = OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction;
  v24 = *(_BYTE *)(v47 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_performingAction);
  swift_release();
  if ((v24 & 1) != 0)
  {
    sub_2355E5934();
    v25 = sub_2355E594C();
    v26 = sub_2355E5A24();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2355D5000, v25, v26, "[ActionButton] Ignoring press for ongoing action", v27, 2u);
      MEMORY[0x23B7D048C](v27, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v44 + 8);
    v29 = v8;
  }
  else
  {
    v30 = objc_msgSend(v42, sel__authenticationMessage);
    if (v30)
    {
      v42 = v30;
      sub_2355E59F4();
      sub_2355E59E8();
      if ((swift_task_isCurrentExecutor() & 1) == 0)
        swift_task_reportUnexpectedExecutor();
      v31 = v47;
      *(_BYTE *)(v47 + v23) = 1;
      swift_release();
      v48 = MEMORY[0x24BEE4AF8];
      sub_2355DFC50(v31 + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, (uint64_t)v18, type metadata accessor for ActionButton.Action);
      v32 = (char *)&loc_2355DED54 + dword_2355DF87C[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    sub_2355E5934();
    v33 = sub_2355E594C();
    v34 = sub_2355E5A24();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_2355D5000, v33, v34, "[ActionButton] Unable to authenticate button press", v35, 2u);
      MEMORY[0x23B7D048C](v35, -1, -1);
    }

    v28 = *(void (**)(char *, uint64_t))(v44 + 8);
    v29 = v10;
  }
  v28(v29, v45);
  return swift_release();
}

uint64_t sub_2355DF88C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2355E58E0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2355DF944(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(sub_2355E58E0() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = v1 + v5;
  v11 = *(_QWORD *)(v1 + v6);
  v12 = *(_QWORD *)(v1 + v7);
  v13 = *(_QWORD *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_2355DFA10;
  return sub_2355DAF60(a1, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_2355DFA10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2355DFA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstallConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2355DFA9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25624CAC8;
  if (!qword_25624CAC8)
  {
    v1 = type metadata accessor for InstallMetadata(255);
    result = MEMORY[0x23B7D0420](&protocol conformance descriptor for InstallMetadata, v1);
    atomic_store(result, (unint64_t *)&qword_25624CAC8);
  }
  return result;
}

uint64_t sub_2355DFAE4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2355DFB20(uint64_t a1, unint64_t a2)
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

uint64_t sub_2355DFB64(uint64_t a1, unint64_t a2)
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

unint64_t sub_2355DFBA8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25624CAD8;
  if (!qword_25624CAD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25624CAD0);
    v2 = sub_2355DFA9C();
    result = MEMORY[0x23B7D0420](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25624CAD8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7D0414](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2355DFC50(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2355DFC94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CAB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2355DFCD4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355DFCF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2355DFA10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25624CAE0 + dword_25624CAE0))(a1, v4);
}

void sub_2355DFD68(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_bridgeObjectRelease();

  }
}

void sub_2355DFD94(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

  }
}

unint64_t sub_2355DFDC4()
{
  unint64_t result;

  result = qword_25624CB08;
  if (!qword_25624CB08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25624CB08);
  }
  return result;
}

uint64_t sub_2355DFE00()
{
  return 1;
}

uint64_t sub_2355DFE14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355E17B4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2355DFE3C()
{
  return 0;
}

void sub_2355DFE48(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2355DFE54()
{
  sub_2355E04B4();
  return sub_2355E5C10();
}

uint64_t sub_2355DFE7C()
{
  sub_2355E04B4();
  return sub_2355E5C1C();
}

uint64_t sub_2355DFEA4(char a1)
{
  return *(_QWORD *)&aProductpsearch[8 * a1];
}

uint64_t sub_2355DFEC4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726556656C707061;
  else
    return 0x657449656C707061;
}

uint64_t sub_2355DFF10()
{
  char *v0;

  return sub_2355DFEA4(*v0);
}

uint64_t sub_2355DFF18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355E1850(a1, a2);
  *a3 = result;
  return result;
}

void sub_2355DFF3C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2355DFF48()
{
  sub_2355E0470();
  return sub_2355E5C10();
}

uint64_t sub_2355DFF70()
{
  sub_2355E0470();
  return sub_2355E5C1C();
}

BOOL sub_2355DFF98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2355DFFB0()
{
  char *v0;

  return sub_2355DFEC4(*v0);
}

uint64_t sub_2355DFFB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355E19D4(a1, a2);
  *a3 = result;
  return result;
}

void sub_2355DFFDC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2355DFFE8()
{
  sub_2355E053C();
  return sub_2355E5C10();
}

uint64_t sub_2355E0010()
{
  sub_2355E053C();
  return sub_2355E5C1C();
}

uint64_t sub_2355E0038()
{
  sub_2355E5BD4();
  sub_2355E5BE0();
  return sub_2355E5BEC();
}

uint64_t sub_2355E0078()
{
  return sub_2355E5BE0();
}

uint64_t sub_2355E009C()
{
  sub_2355E5BD4();
  sub_2355E5BE0();
  return sub_2355E5BEC();
}

uint64_t sub_2355E00DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355E1AE4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2355E0104()
{
  sub_2355E04F8();
  return sub_2355E5C10();
}

uint64_t sub_2355E012C()
{
  sub_2355E04F8();
  return sub_2355E5C1C();
}

uint64_t MarketplaceDisplayOption.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
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
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB10);
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v23 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB18);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB20);
  v7 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB28);
  v31 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v1;
  v28 = v1[1];
  v29 = v13;
  v14 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355E0470();
  sub_2355E5C04();
  if (v14 >> 6)
  {
    if (v14 >> 6 == 1)
    {
      v36 = 1;
      sub_2355E04F8();
      v15 = v32;
      sub_2355E5B5C();
      v16 = v24;
      sub_2355E5B80();
      v17 = v22;
    }
    else
    {
      v37 = 2;
      sub_2355E04B4();
      v6 = v23;
      v15 = v32;
      sub_2355E5B5C();
      v16 = v27;
      sub_2355E5B80();
      v17 = v26;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v16);
  }
  else
  {
    v35 = 0;
    sub_2355E053C();
    v15 = v32;
    sub_2355E5B5C();
    v34 = 0;
    v18 = v30;
    v19 = v25;
    sub_2355E5BA4();
    if (!v18)
    {
      v33 = 1;
      sub_2355E5B74();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v12, v15);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2355E0470()
{
  unint64_t result;

  result = qword_25624CB30;
  if (!qword_25624CB30)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E68CC, &type metadata for MarketplaceDisplayOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB30);
  }
  return result;
}

unint64_t sub_2355E04B4()
{
  unint64_t result;

  result = qword_25624CB38;
  if (!qword_25624CB38)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E687C, &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB38);
  }
  return result;
}

unint64_t sub_2355E04F8()
{
  unint64_t result;

  result = qword_25624CB40;
  if (!qword_25624CB40)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E682C, &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB40);
  }
  return result;
}

unint64_t sub_2355E053C()
{
  unint64_t result;

  result = qword_25624CB48;
  if (!qword_25624CB48)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E67DC, &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB48);
  }
  return result;
}

uint64_t MarketplaceDisplayOption.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
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
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;

  v39 = a2;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB50);
  v43 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v45 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB58);
  v41 = *(_QWORD *)(v4 - 8);
  v42 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB60);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB68);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_2355E0470();
  v15 = v47;
  sub_2355E5BF8();
  if (v15)
    goto LABEL_9;
  v38 = v7;
  v17 = v44;
  v16 = v45;
  v47 = v11;
  v18 = sub_2355E5B50();
  if (*(_QWORD *)(v18 + 16) != 1)
  {
    v21 = sub_2355E5AA8();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25624CB70);
    *v23 = &type metadata for MarketplaceDisplayOption;
    sub_2355E5AFC();
    sub_2355E5A9C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v10);
LABEL_9:
    v24 = (uint64_t)v46;
    return __swift_destroy_boxed_opaque_existential_1(v24);
  }
  if (*(_BYTE *)(v18 + 32))
  {
    if (*(_BYTE *)(v18 + 32) == 1)
    {
      v51 = 1;
      sub_2355E04F8();
      v19 = v17;
      sub_2355E5AF0();
      v20 = v42;
      v29 = sub_2355E5B20();
      v31 = v30;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v20);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v10);
      v32 = 64;
    }
    else
    {
      v52 = 2;
      sub_2355E04B4();
      sub_2355E5AF0();
      v28 = v40;
      v29 = sub_2355E5B20();
      v31 = v35;
      (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v10);
      v32 = 0x80;
    }
    v24 = (uint64_t)v46;
  }
  else
  {
    v50 = 0;
    sub_2355E053C();
    v26 = v9;
    sub_2355E5AF0();
    v49 = 0;
    v27 = v6;
    v45 = (char *)sub_2355E5B44();
    v48 = 1;
    v33 = sub_2355E5B14();
    v34 = v47;
    v31 = v33;
    v32 = v37 & 1;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v10);
    v29 = (uint64_t)v45;
    v24 = (uint64_t)v46;
  }
  v36 = v39;
  *v39 = v29;
  v36[1] = v31;
  *((_BYTE *)v36 + 16) = v32;
  return __swift_destroy_boxed_opaque_existential_1(v24);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2355E0A94@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MarketplaceDisplayOption.init(from:)(a1, a2);
}

uint64_t sub_2355E0AA8(_QWORD *a1)
{
  return MarketplaceDisplayOption.encode(to:)(a1);
}

uint64_t UISceneConnectionOptions.marketplaceDisplayOption.getter()
{
  sub_2355E5A00();
  sub_2355E59F4();
  sub_2355E59E8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_2355E5838();
  sub_2355E0B7C();
  sub_2355E5A30();
  return swift_release();
}

unint64_t sub_2355E0B7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25624CB78;
  if (!qword_25624CB78)
  {
    v1 = sub_2355E5838();
    result = MEMORY[0x23B7D0420](&protocol conformance descriptor for MarketplaceSceneConnectionOptionDefinition, v1);
    atomic_store(result, (unint64_t *)&qword_25624CB78);
  }
  return result;
}

uint64_t (*(*static MarketplaceSceneConnectionOptionDefinition.sceneDelegateMethod.getter())(uint64_t a1))()
{
  return sub_2355E0C4C;
}

uint64_t sub_2355E0BD4(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  char v11;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  v7 = a3[3];
  v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  v10[0] = v4;
  v10[1] = v5;
  v11 = v6;
  return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v8 + 8))(a1, v10, v7, v8);
}

uint64_t (*sub_2355E0C4C(uint64_t a1))()
{
  uint64_t v1;
  __int128 v3[2];

  sub_2355E1BC8(a1, (uint64_t)v3);
  v1 = swift_allocObject();
  sub_2355E1C30(v3, v1 + 16);
  return sub_2355E1C80;
}

unint64_t sub_2355E0CA8()
{
  unint64_t result;

  result = qword_25624CB80;
  if (!qword_25624CB80)
  {
    result = MEMORY[0x23B7D0420](&protocol conformance descriptor for MarketplaceDisplayOption, &type metadata for MarketplaceDisplayOption);
    atomic_store(result, (unint64_t *)&qword_25624CB80);
  }
  return result;
}

unint64_t sub_2355E0CF0()
{
  unint64_t result;

  result = qword_25624CB88;
  if (!qword_25624CB88)
  {
    result = MEMORY[0x23B7D0420](&protocol conformance descriptor for MarketplaceDisplayOption, &type metadata for MarketplaceDisplayOption);
    atomic_store(result, (unint64_t *)&qword_25624CB88);
  }
  return result;
}

uint64_t (*sub_2355E0D34())@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2355E0D44;
}

uint64_t sub_2355E0D44@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  __int128 v5[2];

  sub_2355E1BC8(a1, (uint64_t)v5);
  v3 = swift_allocObject();
  sub_2355E1C30(v5, v3 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_2355E1C48;
  *(_QWORD *)(result + 24) = v3;
  *a2 = sub_2355E1C50;
  a2[1] = result;
  return result;
}

uint64_t sub_2355E0DC0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  sub_2355E5970();
  return swift_release();
}

uint64_t sub_2355E0E54(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if ((a3 >> 6) - 1 <= 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for MarketplaceDisplayOption(uint64_t a1)
{
  return sub_2355E0E80(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_2355E0E80(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if ((a3 >> 6) - 1 <= 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2355E0E54(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MarketplaceDisplayOption(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2355E0E54(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2355E0E80(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MarketplaceDisplayOption(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2355E0E80(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 126);
  v3 = ((*(unsigned __int8 *)(a1 + 16) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MarketplaceDisplayOption(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 126;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_2355E1038(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_2355E1044(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_2355E1054(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption()
{
  return &type metadata for MarketplaceDisplayOption;
}

uint64_t dispatch thunk of MarketplaceSceneDelegate.scene(_:askedToDisplay:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketplaceDisplayOption.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355E115C + 4 * byte_2355E6355[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2355E1190 + 4 * byte_2355E6350[v4]))();
}

uint64_t sub_2355E1190(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E1198(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355E11A0);
  return result;
}

uint64_t sub_2355E11AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355E11B4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2355E11B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E11C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.CodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MarketplaceDisplayOption.ProductPageCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MarketplaceDisplayOption.ProductPageCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355E12B8 + 4 * byte_2355E635F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2355E12EC + 4 * byte_2355E635A[v4]))();
}

uint64_t sub_2355E12EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E12F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355E12FCLL);
  return result;
}

uint64_t sub_2355E1308(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355E1310);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2355E1314(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E131C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2355E1328(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.ProductPageCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys;
}

uint64_t sub_2355E1350()
{
  return 0;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.SearchResultsCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys;
}

uint64_t _s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionO23SearchResultsCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s21_MarketplaceKit_UIKit24MarketplaceDisplayOptionO23SearchResultsCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2355E13F8 + 4 * byte_2355E6364[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2355E1418 + 4 * byte_2355E6369[v4]))();
}

_BYTE *sub_2355E13F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2355E1418(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2355E1420(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2355E1428(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2355E1430(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2355E1438(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MarketplaceDisplayOption.AuthenticationCodingKeys()
{
  return &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys;
}

unint64_t sub_2355E1458()
{
  unint64_t result;

  result = qword_25624CB90;
  if (!qword_25624CB90)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E658C, &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB90);
  }
  return result;
}

unint64_t sub_2355E14A0()
{
  unint64_t result;

  result = qword_25624CB98;
  if (!qword_25624CB98)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6644, &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CB98);
  }
  return result;
}

unint64_t sub_2355E14E8()
{
  unint64_t result;

  result = qword_25624CBA0;
  if (!qword_25624CBA0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E66FC, &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBA0);
  }
  return result;
}

unint64_t sub_2355E1530()
{
  unint64_t result;

  result = qword_25624CBA8;
  if (!qword_25624CBA8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E67B4, &type metadata for MarketplaceDisplayOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBA8);
  }
  return result;
}

unint64_t sub_2355E1578()
{
  unint64_t result;

  result = qword_25624CBB0;
  if (!qword_25624CBB0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E666C, &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBB0);
  }
  return result;
}

unint64_t sub_2355E15C0()
{
  unint64_t result;

  result = qword_25624CBB8;
  if (!qword_25624CBB8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6694, &type metadata for MarketplaceDisplayOption.ProductPageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBB8);
  }
  return result;
}

unint64_t sub_2355E1608()
{
  unint64_t result;

  result = qword_25624CBC0;
  if (!qword_25624CBC0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E65B4, &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBC0);
  }
  return result;
}

unint64_t sub_2355E1650()
{
  unint64_t result;

  result = qword_25624CBC8;
  if (!qword_25624CBC8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E65DC, &type metadata for MarketplaceDisplayOption.SearchResultsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBC8);
  }
  return result;
}

unint64_t sub_2355E1698()
{
  unint64_t result;

  result = qword_25624CBD0;
  if (!qword_25624CBD0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E64FC, &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBD0);
  }
  return result;
}

unint64_t sub_2355E16E0()
{
  unint64_t result;

  result = qword_25624CBD8;
  if (!qword_25624CBD8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6524, &type metadata for MarketplaceDisplayOption.AuthenticationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBD8);
  }
  return result;
}

unint64_t sub_2355E1728()
{
  unint64_t result;

  result = qword_25624CBE0;
  if (!qword_25624CBE0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6724, &type metadata for MarketplaceDisplayOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBE0);
  }
  return result;
}

unint64_t sub_2355E1770()
{
  unint64_t result;

  result = qword_25624CBE8;
  if (!qword_25624CBE8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E674C, &type metadata for MarketplaceDisplayOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CBE8);
  }
  return result;
}

uint64_t sub_2355E17B4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x746E756F636361 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2355E5BBC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2355E1838()
{
  return 0x746E756F636361;
}

uint64_t sub_2355E1850(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x50746375646F7270 && a2 == 0xEB00000000656761;
  if (v3 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6552686372616573 && a2 == 0xED000073746C7573 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69746E6568747561 && a2 == 0xEE006E6F69746163)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2355E5BBC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2355E19D4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x657449656C707061 && a2 == 0xEB0000000044496DLL;
  if (v3 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726556656C707061 && a2 == 0xEE0044496E6F6973)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2355E5BBC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2355E1AE4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7972657571 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2355E5BBC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2355E1B60()
{
  return 0x7972657571;
}

uint64_t sub_2355E1B74()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2355E1B98(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_2355E1BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2355E1C0C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2355E1C30(__int128 *a1, uint64_t a2)
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

uint64_t sub_2355E1C48(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_2355E0BD4(a1, a2, (_QWORD *)(v2 + 16));
}

uint64_t sub_2355E1C50(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

id sub_2355E1D14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureButtonContentDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SecureButtonContentDelegate()
{
  return objc_opt_self();
}

void sub_2355E1D74(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2355E1DC4()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v4;
  _QWORD aBlock[6];

  if (qword_25624C898 != -1)
    swift_once();
  v0 = *(void **)(qword_25624CEF0 + 16);
  aBlock[4] = sub_2355E2154;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2355E1D74;
  aBlock[3] = &block_descriptor;
  v1 = _Block_copy(aBlock);
  v2 = objc_msgSend(v0, sel_synchronousRemoteObjectProxyWithErrorHandler_, v1);
  _Block_release(v1);
  sub_2355E5A6C();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25624CC80);
  swift_dynamicCast();
  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

id sub_2355E1EE0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XPCClient()), sel_init);
  qword_25624CEE8 = (uint64_t)result;
  return result;
}

id sub_2355E1FAC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XPCClient()
{
  return objc_opt_self();
}

id sub_2355E2004()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id result;

  type metadata accessor for RenderingService();
  v0 = swift_allocObject();
  v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v2 = (void *)sub_2355E597C();
  v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25625C318);
  objc_msgSend(v3, sel_setExportedInterface_, v4);

  if (qword_25624C890 != -1)
    swift_once();
  objc_msgSend(v3, sel_setExportedObject_, qword_25624CEE8);
  v5 = (id)UISSlotMachineInterface();
  objc_msgSend(v3, sel_setRemoteObjectInterface_, v5);

  result = objc_msgSend(v3, sel_resume);
  *(_QWORD *)(v0 + 16) = v3;
  qword_25624CEF0 = v0;
  return result;
}

uint64_t sub_2355E2154(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t ErrorValue;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_2355E5958();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355E5940();
  v6 = a1;
  v7 = a1;
  v8 = sub_2355E594C();
  v9 = sub_2355E5A24();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v21 = v3;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v23 = v12;
    *(_DWORD *)v11 = 136315138;
    v19[1] = v11 + 4;
    ErrorValue = swift_getErrorValue();
    v20 = v2;
    MEMORY[0x24BDAC7A8](ErrorValue);
    (*(void (**)(char *))(v15 + 16))((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    v16 = sub_2355E5988();
    v22 = sub_2355E23CC(v16, v17, &v23);
    sub_2355E5A54();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2355D5000, v8, v9, "Error fetching remote proxy: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7D048C](v12, -1, -1);
    MEMORY[0x23B7D048C](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v5, v20);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_2355E2388()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RenderingService()
{
  return objc_opt_self();
}

uint64_t sub_2355E23CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2355E249C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2355E2A0C((uint64_t)v12, *a3);
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
      sub_2355E2A0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2355E249C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2355E5A60();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2355E2654(a5, a6);
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
  v8 = sub_2355E5AB4();
  if (!v8)
  {
    sub_2355E5AC0();
    __break(1u);
LABEL_17:
    result = sub_2355E5AE4();
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

uint64_t sub_2355E2654(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2355E26E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2355E28C0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2355E28C0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2355E26E8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2355E285C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2355E5A84();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2355E5AC0();
      __break(1u);
LABEL_10:
      v2 = sub_2355E59A0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2355E5AE4();
    __break(1u);
LABEL_14:
    result = sub_2355E5AC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2355E285C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25624CD58);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2355E28C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25624CD58);
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
  result = sub_2355E5AE4();
  __break(1u);
  return result;
}

uint64_t sub_2355E2A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t InstallConfiguration.install.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2355E2A58(v1, a1);
}

uint64_t sub_2355E2A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for InstallMetadata(uint64_t a1)
{
  return sub_2355D78A0(a1, (uint64_t *)&unk_25624CE70);
}

uint64_t InstallConfiguration.confirmInstall.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for InstallConfiguration(0) + 20));
  swift_retain();
  return v1;
}

uint64_t type metadata accessor for InstallConfiguration(uint64_t a1)
{
  return sub_2355D78A0(a1, qword_25624CDE0);
}

uint64_t InstallConfiguration.init(install:confirmInstall:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  _QWORD *v8;

  sub_2355E2B48(a1, a4);
  result = type metadata accessor for InstallConfiguration(0);
  v8 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_2355E2B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t InstallMetadata.account.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallMetadata.appleItemID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t InstallMetadata.alternativeDistributionPackage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 24);
  v4 = sub_2355E5814();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t InstallMetadata.isUpdate.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InstallMetadata(0) + 28));
}

uint64_t InstallMetadata.appShareURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 32);
  return sub_2355E2C58(v3, a1);
}

uint64_t sub_2355E2C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t InstallMetadata.appShareURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for InstallMetadata(0) + 32);
  return sub_2355E2CD0(a1, v3);
}

uint64_t sub_2355E2CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*InstallMetadata.appShareURL.modify())()
{
  type metadata accessor for InstallMetadata(0);
  return nullsub_1;
}

uint64_t InstallMetadata.init(account:appleItemID:alternativeDistributionPackage:isUpdate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char *a6@<X8>)
{
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (int *)type metadata accessor for InstallMetadata(0);
  v13 = (uint64_t)&a6[v12[8]];
  v14 = sub_2355E5814();
  v15 = *(_QWORD *)(v14 - 8);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v17(v13, 1, 1, v14);
  *(_QWORD *)a6 = a1;
  *((_QWORD *)a6 + 1) = a2;
  *((_QWORD *)a6 + 2) = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(&a6[v12[6]], a4, v14);
  a6[v12[7]] = a5;
  sub_2355E2E20(v13);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v17)(v13, 1, 1, v14);
}

uint64_t sub_2355E2E20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2355E2E60(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2355E2E98 + 4 * byte_2355E69D0[a1]))(0xD00000000000001ELL, 0x80000002355E73C0);
}

uint64_t sub_2355E2E98()
{
  return 0x746E756F636361;
}

uint64_t sub_2355E2EB0()
{
  return 0x657449656C707061;
}

uint64_t sub_2355E2ED0()
{
  return 0x6574616470557369;
}

uint64_t sub_2355E2EE8()
{
  return 0x6572616853707061;
}

uint64_t sub_2355E2F08()
{
  unsigned __int8 *v0;

  return sub_2355E2E60(*v0);
}

uint64_t sub_2355E2F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2355E556C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2355E2F34(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2355E2F40()
{
  sub_2355E3170();
  return sub_2355E5C10();
}

uint64_t sub_2355E2F68()
{
  sub_2355E3170();
  return sub_2355E5C1C();
}

uint64_t InstallMetadata.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CD60);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2355E3170();
  sub_2355E5C04();
  v13 = 0;
  sub_2355E5B80();
  if (!v1)
  {
    v12 = 1;
    sub_2355E5BA4();
    type metadata accessor for InstallMetadata(0);
    v11 = 2;
    sub_2355E5814();
    sub_2355E3568(&qword_25624CD70, MEMORY[0x24BDCDAE0]);
    sub_2355E5B98();
    v10 = 3;
    sub_2355E5B8C();
    v9 = 4;
    sub_2355E5B68();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2355E3170()
{
  unint64_t result;

  result = qword_25624CD68;
  if (!qword_25624CD68)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6C30, &type metadata for InstallMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CD68);
  }
  return result;
}

uint64_t InstallMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v14;
  void (*v15)(void);
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
  _QWORD v29[2];
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;

  v30 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2355E5814();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CD78);
  v8 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InstallMetadata(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (_QWORD *)((char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(void (**)(void))(v6 + 56);
  v36 = (char *)v14 + *(int *)(v12 + 32);
  v15();
  v16 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_2355E3170();
  v34 = v10;
  v17 = v37;
  sub_2355E5BF8();
  if (v17)
  {
    v21 = (uint64_t)v36;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    return sub_2355E2E20(v21);
  }
  else
  {
    v18 = v8;
    v37 = v11;
    v19 = v5;
    v42 = 0;
    v20 = v33;
    v22 = (uint64_t)v14;
    *v14 = sub_2355E5B20();
    v14[1] = v23;
    v41 = 1;
    v14[2] = sub_2355E5B44();
    v40 = 2;
    v24 = sub_2355E3568(&qword_25624CD80, MEMORY[0x24BDCDB10]);
    sub_2355E5B38();
    v29[0] = v24;
    v29[1] = v6;
    v25 = v37;
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22 + *(int *)(v37 + 24), v32, v19);
    v39 = 3;
    *(_BYTE *)(v22 + *(int *)(v25 + 28)) = sub_2355E5B2C() & 1;
    v38 = 4;
    v26 = (uint64_t)v31;
    sub_2355E5B08();
    v27 = (uint64_t)v36;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v34, v20);
    sub_2355E2CD0(v26, v27);
    sub_2355E2A58(v22, v30);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    return sub_2355E35A8(v22);
  }
}

uint64_t sub_2355E3568(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2355E5814();
    result = MEMORY[0x23B7D0420](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2355E35A8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InstallMetadata(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2355E35E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InstallMetadata.init(from:)(a1, a2);
}

uint64_t sub_2355E35F8(_QWORD *a1)
{
  return InstallMetadata.encode(to:)(a1);
}

uint64_t sub_2355E3610(uint64_t result, uint64_t a2)
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
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v12 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v9)
        return 1;
      v13 = *(_QWORD *)(v5 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v9)
          return 1;
        v13 = *(_QWORD *)(v5 + 8 * v4);
        if (!v13)
        {
          v4 = v12 + 3;
          if (v12 + 3 >= v9)
            return 1;
          v13 = *(_QWORD *)(v5 + 8 * v4);
          if (!v13)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    v15 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11);
    v16 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 16 * v11);
    v17 = *v16;
    v18 = v16[1];
    v19 = sub_2355E37F0(v15);
    if ((v20 & 1) != 0)
    {
      v21 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v19);
      result = *v21;
      if (*v21 == v17 && v21[1] == v18)
        continue;
      result = sub_2355E5BBC();
      if ((result & 1) != 0)
        continue;
    }
    return 0;
  }
  v14 = v12 + 4;
  if (v14 >= v9)
    return 1;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return 1;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_23;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t BatchInstallConfiguration.installs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t BatchInstallConfiguration.confirmInstall.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t BatchInstallConfiguration.init(installs:confirmInstall:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

unint64_t sub_2355E37F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2355E5BC8();
  return sub_2355E3820(a1, v2);
}

unint64_t sub_2355E3820(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

BOOL _s21_MarketplaceKit_UIKit30BatchInstallConfirmationResultO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  v3 = *a1;
  v2 = (void *)a1[1];
  v5 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  if (!*a1)
  {
    if (!v5)
    {
      sub_2355DFD68(0, v2);
      sub_2355DFD68(0, v4);
      return 1;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_9:
    sub_2355E5788(*(_QWORD *)a2, *(void **)(a2 + 8));
    sub_2355E5788(v3, v2);
LABEL_11:
    sub_2355DFD68(v3, v2);
    sub_2355DFD68(v5, v4);
    return 0;
  }
  sub_2355E5788(*(_QWORD *)a2, *(void **)(a2 + 8));
  sub_2355E5788(v3, v2);
  v6 = v4;
  v7 = v2;
  if ((sub_2355E3610(v3, v5) & 1) == 0)
  {

    goto LABEL_11;
  }
  if (v2)
  {
    if (v4)
    {
      sub_2355E57B4();
      v8 = v7;
      v9 = v6;
      v10 = sub_2355E5A3C();

      sub_2355DFD68(v3, v2);
      sub_2355DFD68(v5, v4);

      return (v10 & 1) != 0;
    }
    sub_2355DFD68(v3, v2);
    sub_2355DFD68(v5, 0);
    v6 = v7;
LABEL_17:

    return 0;
  }
  sub_2355DFD68(v3, 0);
  sub_2355DFD68(v5, v4);
  if (v4)
    goto LABEL_17;
  return 1;
}

void destroy for InstallConfirmationResult(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 8) >= 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t _s21_MarketplaceKit_UIKit25InstallConfirmationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = *(void **)(a2 + 16);
    *(_QWORD *)(a1 + 16) = v4;
    swift_bridgeObjectRetain();
    v5 = v4;
  }
  return a1;
}

uint64_t assignWithCopy for InstallConfirmationResult(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  __int128 v10;

  v4 = a2[1];
  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = a2[1];
      v8 = (void *)a2[2];
      *(_QWORD *)(a1 + 16) = v8;
      swift_bridgeObjectRetain();
      v9 = v8;
      return a1;
    }
LABEL_7:
    v10 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_OWORD *)a1 = v10;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

    goto LABEL_7;
  }
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 16);
  v6 = (void *)a2[2];
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v6;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for InstallConfirmationResult(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for InstallConfirmationResult(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InstallConfirmationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_2355E3CF4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2355E3D0C(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallConfirmationResult()
{
  return &type metadata for InstallConfirmationResult;
}

_QWORD *initializeBufferWithCopyOfBuffer for InstallConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = (int *)type metadata accessor for InstallMetadata(0);
    v9 = v8[6];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_2355E5814();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    v14(v10, v11, v12);
    *((_BYTE *)v4 + v8[7]) = *((_BYTE *)a2 + v8[7]);
    v15 = v8[8];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))((char *)a2 + v15, 1, v12))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v14(v16, v17, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
    }
    v20 = *(int *)(a3 + 20);
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (_QWORD *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for InstallConfiguration(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  swift_bridgeObjectRelease();
  v2 = type metadata accessor for InstallMetadata(0);
  v3 = a1 + *(int *)(v2 + 24);
  v4 = sub_2355E5814();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  v7 = a1 + *(int *)(v2 + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  return swift_release();
}

_QWORD *initializeWithCopy for InstallConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = (int *)type metadata accessor for InstallMetadata(0);
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2355E5814();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  swift_bridgeObjectRetain();
  v13(v9, v10, v11);
  *((_BYTE *)a1 + v7[7]) = *((_BYTE *)a2 + v7[7]);
  v14 = v7[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))((char *)a2 + v14, 1, v11))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v13(v15, v16, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
  }
  v18 = *(int *)(a3 + 20);
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for InstallConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = (int *)type metadata accessor for InstallMetadata(0);
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2355E5814();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 24);
  v12(v8, v9, v10);
  *((_BYTE *)a1 + v6[7]) = *((_BYTE *)a2 + v6[7]);
  v13 = v6[8];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v9) = v16((char *)a1 + v13, 1, v10);
  v17 = v16(v15, 1, v10);
  if (!(_DWORD)v9)
  {
    if (!v17)
    {
      v12(v14, v15, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v15, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
LABEL_7:
  v19 = *(int *)(a3 + 20);
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for InstallConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void *, const void *, uint64_t);
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = (int *)type metadata accessor for InstallMetadata(0);
  v7 = v6[6];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2355E5814();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 32);
  v12(v8, v9, v10);
  *(_BYTE *)(a1 + v6[7]) = *(_BYTE *)(a2 + v6[7]);
  v13 = v6[8];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a2 + v13, 1, v10))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *assignWithTake for InstallConfiguration(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v7 = (int *)type metadata accessor for InstallMetadata(0);
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2355E5814();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  *((_BYTE *)a1 + v7[7]) = *((_BYTE *)a2 + v7[7]);
  v14 = v7[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  LODWORD(v10) = v17((char *)a1 + v14, 1, v11);
  v18 = v17(v16, 1, v11);
  if (!(_DWORD)v10)
  {
    if (!v18)
    {
      v13(v15, v16, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v16, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
LABEL_7:
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355E44A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for InstallMetadata(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for InstallConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355E4528(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for InstallMetadata(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2355E45A0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for InstallMetadata(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for InstallMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2355E5814();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    v13(v9, v10, v11);
    v14 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v16, 1, v11))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v13(v15, v16, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for InstallMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2355E5814();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v9(v4, v5);
  v7 = a1 + *(int *)(a2 + 32);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v5);
  return result;
}

_QWORD *initializeWithCopy for InstallMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2355E5814();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  v12(v8, v9, v10);
  v13 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v15, 1, v10))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  return a1;
}

_QWORD *assignWithCopy for InstallMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2355E5814();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v12 = a3[8];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v7) = v15((char *)a1 + v12, 1, v9);
  v16 = v15(v14, 1, v9);
  if (!(_DWORD)v7)
  {
    if (!v16)
    {
      v11(v13, v14, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for InstallMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2355E5814();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  return a1;
}

_QWORD *assignWithTake for InstallMetadata(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2355E5814();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v8) = v16((char *)a1 + v13, 1, v10);
  v17 = v16(v15, 1, v10);
  if (!(_DWORD)v8)
  {
    if (!v17)
    {
      v12(v14, v15, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v15, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355E4CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2355E5814();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for InstallMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2355E4D50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_2355E5814();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25624CA00);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2355E4DF0()
{
  unint64_t v0;
  unint64_t v1;

  sub_2355E5814();
  if (v0 <= 0x3F)
  {
    sub_2355E4E94();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2355E4E94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25624CE80)
  {
    sub_2355E5814();
    v0 = sub_2355E5A48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25624CE80);
  }
}

void destroy for BatchInstallConfirmationResult(uint64_t a1)
{
  if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t _s21_MarketplaceKit_UIKit30BatchInstallConfirmationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(void **)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
    v4 = v3;
  }
  return a1;
}

uint64_t assignWithCopy for BatchInstallConfirmationResult(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a1;
  v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      v9 = (void *)a2[1];
      *(_QWORD *)(a1 + 8) = v9;
      swift_bridgeObjectRetain();
      v10 = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();

    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 8);
  v7 = (void *)a2[1];
  *(_QWORD *)(a1 + 8) = v7;
  v8 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for BatchInstallConfirmationResult(uint64_t a1, uint64_t a2)
{
  void *v4;

  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();

LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for BatchInstallConfirmationResult(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BatchInstallConfirmationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_2355E514C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2355E5164(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for BatchInstallConfirmationResult()
{
  return &type metadata for BatchInstallConfirmationResult;
}

uint64_t destroy for BatchInstallConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s21_MarketplaceKit_UIKit25BatchInstallConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for BatchInstallConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BatchInstallConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatchInstallConfiguration(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatchInstallConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BatchInstallConfiguration()
{
  return &type metadata for BatchInstallConfiguration;
}

uint64_t getEnumTagSinglePayload for InstallMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InstallMetadata.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2355E5414 + 4 * byte_2355E69DA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2355E5448 + 4 * byte_2355E69D5[v4]))();
}

uint64_t sub_2355E5448(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E5450(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2355E5458);
  return result;
}

uint64_t sub_2355E5464(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2355E546CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2355E5470(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2355E5478(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InstallMetadata.CodingKeys()
{
  return &type metadata for InstallMetadata.CodingKeys;
}

unint64_t sub_2355E5498()
{
  unint64_t result;

  result = qword_25624CEC0;
  if (!qword_25624CEC0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6C08, &type metadata for InstallMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CEC0);
  }
  return result;
}

unint64_t sub_2355E54E0()
{
  unint64_t result;

  result = qword_25624CEC8;
  if (!qword_25624CEC8)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6B78, &type metadata for InstallMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CEC8);
  }
  return result;
}

unint64_t sub_2355E5528()
{
  unint64_t result;

  result = qword_25624CED0;
  if (!qword_25624CED0)
  {
    result = MEMORY[0x23B7D0420](&unk_2355E6BA0, &type metadata for InstallMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25624CED0);
  }
  return result;
}

uint64_t sub_2355E556C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746E756F636361 && a2 == 0xE700000000000000;
  if (v3 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657449656C707061 && a2 == 0xEB0000000044496DLL || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x80000002355E73C0 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574616470557369 && a2 == 0xE800000000000000 || (sub_2355E5BBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6572616853707061 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_2355E5BBC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2355E5788(uint64_t result, void *a2)
{
  id v2;

  if (result)
  {
    v2 = a2;
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2355E57B4()
{
  unint64_t result;

  result = qword_25624CED8;
  if (!qword_25624CED8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25624CED8);
  }
  return result;
}

uint64_t sub_2355E57F0()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2355E57FC()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2355E5808()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2355E5814()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2355E5820()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2355E582C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2355E5838()
{
  return MEMORY[0x24BDDB228]();
}

uint64_t sub_2355E5844()
{
  return MEMORY[0x24BDDB238]();
}

uint64_t sub_2355E5850()
{
  return MEMORY[0x24BDDB278]();
}

uint64_t sub_2355E585C()
{
  return MEMORY[0x24BDDB280]();
}

uint64_t sub_2355E5868()
{
  return MEMORY[0x24BDDB288]();
}

uint64_t sub_2355E5874()
{
  return MEMORY[0x24BDDB290]();
}

uint64_t sub_2355E5880()
{
  return MEMORY[0x24BDDB368]();
}

uint64_t sub_2355E588C()
{
  return MEMORY[0x24BDDB370]();
}

uint64_t sub_2355E5898()
{
  return MEMORY[0x24BDDB380]();
}

uint64_t sub_2355E58A4()
{
  return MEMORY[0x24BDDB388]();
}

uint64_t sub_2355E58B0()
{
  return MEMORY[0x24BDDB3B0]();
}

uint64_t sub_2355E58BC()
{
  return MEMORY[0x24BDDB3B8]();
}

uint64_t sub_2355E58C8()
{
  return MEMORY[0x24BDDB3C8]();
}

uint64_t sub_2355E58D4()
{
  return MEMORY[0x24BDDB3D0]();
}

uint64_t sub_2355E58E0()
{
  return MEMORY[0x24BDDB3F8]();
}

uint64_t sub_2355E58EC()
{
  return MEMORY[0x24BDDB400]();
}

uint64_t sub_2355E58F8()
{
  return MEMORY[0x24BDDB410]();
}

uint64_t sub_2355E5904()
{
  return MEMORY[0x24BDDB418]();
}

uint64_t sub_2355E5910()
{
  return MEMORY[0x24BDDB438]();
}

uint64_t sub_2355E591C()
{
  return MEMORY[0x24BDDB440]();
}

uint64_t sub_2355E5928()
{
  return MEMORY[0x24BDDB448]();
}

uint64_t sub_2355E5934()
{
  return MEMORY[0x24BDDB450]();
}

uint64_t sub_2355E5940()
{
  return MEMORY[0x24BDDAE20]();
}

uint64_t sub_2355E594C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2355E5958()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2355E5964()
{
  return MEMORY[0x24BEBC9B0]();
}

uint64_t sub_2355E5970()
{
  return MEMORY[0x24BEBC9B8]();
}

uint64_t sub_2355E597C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2355E5988()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2355E5994()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2355E59A0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2355E59AC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2355E59B8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2355E59C4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2355E59D0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2355E59DC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2355E59E8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2355E59F4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2355E5A00()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2355E5A0C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2355E5A18()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2355E5A24()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2355E5A30()
{
  return MEMORY[0x24BEBCDD0]();
}

uint64_t sub_2355E5A3C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2355E5A48()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2355E5A54()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2355E5A60()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2355E5A6C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2355E5A78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2355E5A84()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2355E5A90()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2355E5A9C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2355E5AA8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2355E5AB4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2355E5AC0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2355E5ACC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2355E5AD8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2355E5AE4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2355E5AF0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2355E5AFC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2355E5B08()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2355E5B14()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_2355E5B20()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2355E5B2C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2355E5B38()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2355E5B44()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_2355E5B50()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2355E5B5C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2355E5B68()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2355E5B74()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_2355E5B80()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2355E5B8C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2355E5B98()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2355E5BA4()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_2355E5BB0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2355E5BBC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2355E5BC8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2355E5BD4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2355E5BE0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2355E5BEC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2355E5BF8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2355E5C04()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2355E5C10()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2355E5C1C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t UISSlotMachineInterface()
{
  return MEMORY[0x24BEBEC80]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

