void AMSUIPaymentSheetViewProvider.__allocating_init(context:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  AMSUIPaymentSheetViewProvider.init(context:)(a1);
  OUTLINED_FUNCTION_5();
}

id AMSUIPaymentSheetViewProvider.init(context:)(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  uint64_t v4;
  void **v5;
  uint64_t *v6;
  uint64_t *v7;
  char *v8;
  uint64_t *v9;
  char *v10;
  void *v11;
  id v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t (*v31)();
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)();
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v41;
  char v42;
  char *v43;
  objc_super v44;
  _BYTE v45[24];
  uint64_t v46;

  v2 = v1;
  v3 = a1;
  v4 = OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_context;
  *(_QWORD *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_context] = 0;
  v5 = (void **)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_request];
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  v6 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header];
  *v6 = 0;
  v6[1] = 0;
  v7 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content];
  *v7 = 0;
  v7[1] = 0;
  v8 = &v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent];
  *v9 = 0;
  v9[1] = 0;
  v10 = &v2[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  if (!a1)
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_7();
    *(_OWORD *)(OUTLINED_FUNCTION_2() + 16) = xmmword_22D9766F0;
    OUTLINED_FUNCTION_3();
    v46 = MEMORY[0x24BEE0D00];
    OUTLINED_FUNCTION_6();
    sub_22D960044((uint64_t)v45);
    sub_22D96E97C();
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v11 = *(void **)&v2[v4];
  *(_QWORD *)&v2[v4] = a1;
  v12 = a1;
  v13 = v2;

  v3 = v12;
  v14 = (void *)sub_22D97009C(v3);
  if (!v14)
  {

    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_7();
    *(_OWORD *)(OUTLINED_FUNCTION_2() + 16) = xmmword_22D9766F0;
    OUTLINED_FUNCTION_3();
    v46 = MEMORY[0x24BEE0D00];
    OUTLINED_FUNCTION_6();
    sub_22D960044((uint64_t)v45);
    sub_22D96E97C();

    goto LABEL_8;
  }
  v17 = v16;
  v42 = v15 & 1;
  v43 = v13;
  v18 = *v5;
  *v5 = v14;
  v5[1] = v15;
  v5[2] = (void *)v16;
  v19 = v14;
  swift_bridgeObjectRetain();
  v20 = sub_22D9600A4(v18);
  v21 = OUTLINED_FUNCTION_9((uint64_t)v20, sel_secondarySalableInfo);
  if (v21)
  {
    v22 = v21;
    v23 = OUTLINED_FUNCTION_9((uint64_t)v21, sel_salableInfo);

    if (v23)
    {
      v24 = v22;
      v41 = v22;
    }
    else
    {
      v41 = 0;
    }
    v26 = OUTLINED_FUNCTION_9((uint64_t)v24, sel_secondaryContentItems);
    sub_22D9609B8();
    v27 = sub_22D976088();

    v28 = swift_allocObject();
    v25 = v42;
    *(_QWORD *)(v28 + 16) = v41;
    *(_QWORD *)(v28 + 24) = v19;
    *(_BYTE *)(v28 + 32) = v42;
    *(_QWORD *)(v28 + 40) = v17;
    *(_QWORD *)(v28 + 48) = v27;
    OUTLINED_FUNCTION_1();
    v29 = *v9;
    *v9 = (uint64_t)sub_22D960A30;
    v9[1] = v28;
    v30 = v19;
    swift_bridgeObjectRetain();
    sub_22D9609A8(v29);
    v13 = v43;
  }
  else
  {
    v25 = v42;
  }
  type metadata accessor for HeaderViewProvider();
  v31 = sub_22D974970(v19, v25, v17);
  v33 = v32;
  OUTLINED_FUNCTION_1();
  v34 = *v6;
  *v6 = (uint64_t)v31;
  v6[1] = v33;
  sub_22D9609A8(v34);
  type metadata accessor for ContentViewProvider();
  v35 = sub_22D9745B0(v19, v25, v17);
  v37 = v36;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
  v38 = *v7;
  *v7 = (uint64_t)v35;
  v7[1] = v37;
  sub_22D9609A8(v38);

LABEL_13:
  v44.receiver = v2;
  v44.super_class = (Class)type metadata accessor for AMSUIPaymentSheetViewProvider();
  v39 = objc_msgSendSuper2(&v44, sel_init);

  return v39;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31D16C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22D960044(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AMSUIPaymentSheetViewProvider()
{
  return objc_opt_self();
}

void *sub_22D9600A4(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22D9600D0(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = a3 & 1;
  v7 = a1;
  sub_22D97047C(a2, v6, a4);
  sub_22D960C84();
  swift_bridgeObjectRetain();
  return sub_22D975EF0();
}

uint64_t sub_22D960154@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  result = sub_22D960238();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_22D961138;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_22D9601B8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_22D961160;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_22D960A40(v1);
  return sub_22D960244((uint64_t)v4, v3);
}

uint64_t sub_22D960238()
{
  return sub_22D9606F4(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header);
}

uint64_t sub_22D960244(uint64_t a1, uint64_t a2)
{
  return sub_22D960750(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header);
}

void sub_22D960250()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D960280@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  result = sub_22D960364();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_22D961138;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_22D9602E4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_22D961160;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_22D960A40(v1);
  return sub_22D960370((uint64_t)v4, v3);
}

uint64_t sub_22D960364()
{
  return sub_22D9606F4(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content);
}

uint64_t sub_22D960370(uint64_t a1, uint64_t a2)
{
  return sub_22D960750(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content);
}

void sub_22D96037C()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D9603AC@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  result = sub_22D960490();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_22D961138;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_22D960410(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_22D961160;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_22D960A40(v1);
  return sub_22D96049C((uint64_t)v4, v3);
}

uint64_t sub_22D960490()
{
  return sub_22D9606F4(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer);
}

uint64_t sub_22D96049C(uint64_t a1, uint64_t a2)
{
  return sub_22D960750(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer);
}

void sub_22D9604A8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D9604D8@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  result = sub_22D9605BC();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_22D961138;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_22D96053C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_22D961160;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_22D960A40(v1);
  return sub_22D9605C8((uint64_t)v4, v3);
}

uint64_t sub_22D9605BC()
{
  return sub_22D9606F4(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent);
}

uint64_t sub_22D9605C8(uint64_t a1, uint64_t a2)
{
  return sub_22D960750(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent);
}

void sub_22D9605D4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D960604@<X0>(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)@<X0>(uint64_t *@<X8>);

  result = sub_22D9606E8();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_22D960C38;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_22D960668(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_22D960C08;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_22D960A40(v1);
  return sub_22D960744((uint64_t)v4, v3);
}

uint64_t sub_22D9606E8()
{
  return sub_22D9606F4(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter);
}

uint64_t sub_22D9606F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  OUTLINED_FUNCTION_1();
  v3 = *v2;
  sub_22D960A40(*v2);
  return v3;
}

uint64_t sub_22D960744(uint64_t a1, uint64_t a2)
{
  return sub_22D960750(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter);
}

uint64_t sub_22D960750(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)(v3 + *a3);
  OUTLINED_FUNCTION_1();
  v7 = *v6;
  *v6 = a1;
  v6[1] = a2;
  return sub_22D9609A8(v7);
}

void sub_22D9607A4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
}

id AMSUIPaymentSheetViewProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AMSUIPaymentSheetViewProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AMSUIPaymentSheetViewProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMSUIPaymentSheetViewProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22D9608E4(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  AMSUIPaymentSheetViewProvider.__allocating_init(context:)(a1);
  *a2 = v3;
}

uint64_t sub_22D960908()
{
  return sub_22D960238();
}

uint64_t sub_22D960928()
{
  return sub_22D960364();
}

uint64_t sub_22D960948()
{
  return sub_22D960490();
}

uint64_t sub_22D960968()
{
  return sub_22D9605BC();
}

uint64_t sub_22D960988()
{
  return sub_22D9606E8();
}

uint64_t sub_22D9609A8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_22D9609B8()
{
  unint64_t result;

  result = qword_255DA7010;
  if (!qword_255DA7010)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA7010);
  }
  return result;
}

uint64_t sub_22D9609F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D960A30()
{
  uint64_t v0;

  return sub_22D9600D0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_22D960A40(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t method lookup function for AMSUIPaymentSheetViewProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.__allocating_init(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t sub_22D960C08()
{
  uint64_t v0;
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t sub_22D960C38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_22D960C60()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_22D960C84()
{
  unint64_t result;

  result = qword_255DA7018;
  if (!qword_255DA7018)
  {
    result = MEMORY[0x22E31D184](&unk_22D977B28, &type metadata for SecondaryContentView);
    atomic_store(result, (unint64_t *)&qword_255DA7018);
  }
  return result;
}

void sub_22D960CC0()
{
  uint64_t *v0;

  sub_22D961000(*v0, (void (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22D960CE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22D9610B0();
  *a1 = result;
  return result;
}

void sub_22D960D0C()
{
  uint64_t *v0;

  sub_22D961000(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22D960D2C()
{
  return sub_22D960E24();
}

uint64_t sub_22D960D34()
{
  return sub_22D962A7C();
}

uint64_t sub_22D960D3C()
{
  return sub_22D962AE8();
}

uint64_t sub_22D960D48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22D975FE0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22D960D8C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22D960DB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22D960DB8()
{
  sub_22D960F2C((unint64_t *)&qword_253F34C40, (uint64_t)&unk_22D976900);
  sub_22D960F2C(&qword_255DA7038, (uint64_t)&unk_22D976854);
  return sub_22D976184();
}

uint64_t sub_22D960E24()
{
  sub_22D976004();
  sub_22D97601C();
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IconAdornmentMerchandizedIAPViewModifier(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IconAdornmentMerchandizedIAPViewModifier(uint64_t result, int a2, int a3)
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

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_22D9610F8(a1, &qword_255DA7020);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_22D9610F8(a1, &qword_253F34C50);
}

void sub_22D960EE4()
{
  sub_22D960F2C(&qword_255DA7028, (uint64_t)&unk_22D976818);
}

void sub_22D960F08()
{
  sub_22D960F2C(&qword_255DA7030, (uint64_t)&unk_22D9767EC);
}

void sub_22D960F2C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    type metadata accessor for Key(255);
    atomic_store(MEMORY[0x22E31D184](a2, v4), a1);
  }
  OUTLINED_FUNCTION_5();
}

void sub_22D960F68()
{
  sub_22D960F2C(&qword_253F34C48, (uint64_t)&unk_22D976888);
}

uint64_t sub_22D960F8C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22D975FEC();
  *a2 = 0;
  return result;
}

void sub_22D961000(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_22D976004();
  a2(v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D961034(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22D975FF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22D9610B0()
{
  uint64_t v0;

  sub_22D976004();
  v0 = sub_22D975FE0();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_22D9610F8(a1, &qword_253F34C28);
}

void sub_22D9610F8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_22D975F44();
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22D9609A8(*(_QWORD *)(v1 + a1));
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_22D975F98();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_22D975FB0();
}

id OUTLINED_FUNCTION_9(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_22D961204@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = sub_22D976004();
  sub_22D9614F4(v4, v5, a1, &v11);
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_22D9628A4((uint64_t)&v11, &qword_253F34C88);
    goto LABEL_6;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    v6 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v6 = 0;
  v7 = 0;
  switch(v10)
  {
    case 1:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      v7 = 0xEB00000000636973;
      OUTLINED_FUNCTION_5_0();
      v6 = 0x756D000000000000;
      break;
    case 2:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      v7 = 0xEA00000000007377;
      OUTLINED_FUNCTION_5_0();
      v6 = 0x656E000000000000;
      break;
    case 3:
    case 4:
    case 5:
      break;
    case 6:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      v7 = 0xEC00000065646163;
      OUTLINED_FUNCTION_5_0();
      v6 = 0x7261000000000000;
      break;
    case 7:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      v7 = 0xED00007373656E74;
      OUTLINED_FUNCTION_5_0();
      v6 = 0x6966000000000000;
      break;
    case 8:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      v7 = 0xE900000000000065;
      OUTLINED_FUNCTION_5_0();
      v6 = 0x6E6F000000000000;
      break;
    case 9:
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12();
      v7 = 0xE800000000000000;
      OUTLINED_FUNCTION_4_0();
      sub_22D96E8A8();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_5_0();
      v6 = 0x7674000000000000;
      break;
    default:
      v7 = 0;
      break;
  }
LABEL_7:
  *(_QWORD *)&v11 = 0xD00000000000004DLL;
  *((_QWORD *)&v11 + 1) = 0x800000022D977F70;
  v12 = v6;
  v13 = v7;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0x4035000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_22D96158C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = 0xD00000000000004DLL;
  a2[1] = 0x800000022D977F70;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = 0;
  a2[5] = 0;
  a2[6] = v8;
  a2[7] = 0x4035000000000000;
  return result;
}

double sub_22D9614F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_22D962278(a1, a2), (v7 & 1) != 0))
  {
    OUTLINED_FUNCTION_13(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_22D961540@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_22D962318(a1), (v6 & 1) != 0))
  {
    OUTLINED_FUNCTION_13(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_22D96158C()
{
  uint64_t v0;
  _BYTE v2[16];
  _QWORD v3[2];

  sub_22D9628DC(v0 + 16, (uint64_t)v2, &qword_253F34BF8);
  sub_22D9628DC((uint64_t)v2, (uint64_t)v3, &qword_253F34BF8);
  if (v3[1])
  {
    sub_22D961644();
    swift_bridgeObjectRetain();
    sub_22D962204((uint64_t)v2);
    if (sub_22D962194())
      return sub_22D975ED8();
    sub_22D96222C((uint64_t)v2);
  }
  return 0;
}

unint64_t sub_22D961644()
{
  unint64_t result;

  result = qword_255DA7040;
  if (!qword_255DA7040)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA7040);
  }
  return result;
}

uint64_t sub_22D961680@<X0>(uint64_t a1@<X8>)
{
  double *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[144];

  v3 = sub_22D975BE4();
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D975EA8();
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B80);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  if (!*((_QWORD *)v1 + 6))
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v14);
  v28 = v15;
  v29 = v14;
  v30 = a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
  swift_retain();
  v18 = sub_22D975EC0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v19 = v1[7];
  v20 = sub_22D975F2C();
  sub_22D9619A0(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v36, 0.0, 1, v19, 0, v20, v21, v18, 0, 1, 0);
  swift_release();
  OUTLINED_FUNCTION_22(v37);
  OUTLINED_FUNCTION_22(&v35);
  if (*((_QWORD *)v1 + 5))
  {
    v22 = *((_QWORD *)v1 + 4);
    v23 = *((_QWORD *)v1 + 5);
  }
  else
  {
    v22 = 0;
    v23 = 0xE000000000000000;
  }
  v33 = v22;
  v34 = v23;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B70);
  sub_22D96272C();
  sub_22D962840();
  sub_22D975E18();
  OUTLINED_FUNCTION_20();
  sub_22D96287C((uint64_t)v37);
  sub_22D975BD8();
  v25 = v28;
  v26 = v29;
  sub_22D975AD0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v32);
  sub_22D9628A4((uint64_t)v12, &qword_253F34B80);
  sub_22D9628DC(v25, (uint64_t)v17, &qword_253F34B80);
  v27 = v30;
  sub_22D9628DC((uint64_t)v17, v30, &qword_253F34B80);
  return __swift_storeEnumTagSinglePayload(v27, 0, 1, v26);
}

uint64_t sub_22D9619A0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, char a19)
{
  uint64_t v20;
  int v23;
  void *v30;
  _BYTE __src[112];

  v20 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  v23 = a8 & 1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if (v23)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_22D9760E8();
    v30 = (void *)sub_22D975C44();
    sub_22D975A64();

    v20 = a17;
  }
  sub_22D975AF4();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v20;
  *(_BYTE *)(a9 + 16) = a18 & 1;
  *(_BYTE *)(a9 + 17) = a19 & 1;
  memcpy((void *)(a9 + 24), __src, 0x70uLL);
  return swift_retain();
}

uint64_t sub_22D961B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  char v57;
  double v58;
  char v59;
  double v60;
  char v61;
  char v62;
  char v63;
  double v64;
  double v65;
  double v66;
  char v67;
  double v68;
  double v69;
  double v71;
  double v72;
  double v73;
  void *v75;
  __int128 v76;
  uint64_t v77;

  OUTLINED_FUNCTION_9_0();
  a49 = v51;
  a50 = v52;
  v54 = v53;
  v66 = OUTLINED_FUNCTION_0_0(v55);
  if (!v67)
    v66 = -INFINITY;
  v68 = v56;
  if ((v57 & 1) != 0)
    v68 = v66;
  v69 = v58;
  if ((v59 & 1) != 0)
    v69 = v68;
  if (v66 > v68 || v68 > v69)
    goto LABEL_22;
  v71 = v60;
  if ((v61 & 1) != 0)
    v71 = -INFINITY;
  v72 = v65;
  if ((v63 & 1) != 0)
    v72 = v71;
  v73 = v64;
  if ((v62 & 1) != 0)
    v73 = v72;
  if (v71 > v72 || v72 > v73)
  {
LABEL_22:
    sub_22D9760E8();
    v75 = (void *)OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_2_0();

  }
  sub_22D975AF4();
  v76 = *(_OWORD *)(v50 + 16);
  *(_OWORD *)v54 = *(_OWORD *)v50;
  *(_OWORD *)(v54 + 16) = v76;
  *(_OWORD *)(v54 + 32) = *(_OWORD *)(v50 + 32);
  *(_QWORD *)(v54 + 48) = *(_QWORD *)(v50 + 48);
  OUTLINED_FUNCTION_15((void *)(v54 + 56), &a24);
  OUTLINED_FUNCTION_8();
  return sub_22D962CFC(v77);
}

void *sub_22D961C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_11(v0, v1, v3, v4, v5, v6, v7, v8, &qword_255DA7060, &qword_255DA7068);
}

#error "22D961D88: call analysis failed (funcsize=53)"

uint64_t sub_22D961DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  const void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  char v57;
  double v58;
  char v59;
  double v60;
  char v61;
  double v62;
  double v63;
  BOOL v64;
  double v65;
  double v66;
  double v67;
  BOOL v68;
  void *v69;
  uint64_t v70;

  OUTLINED_FUNCTION_9_0();
  a49 = v51;
  a50 = v52;
  v54 = v53;
  v60 = OUTLINED_FUNCTION_0_0(v55);
  if (!v61)
    v60 = -INFINITY;
  v62 = v56;
  if ((v57 & 1) != 0)
    v62 = v60;
  v63 = v58;
  if ((v59 & 1) != 0)
    v63 = v62;
  v64 = v60 > v62 || v62 > v63;
  if (v64 || ((OUTLINED_FUNCTION_10(), v67 <= v65) ? (v68 = v65 > v66) : (v68 = 1), v68))
  {
    sub_22D9760E8();
    v69 = (void *)OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_2_0();

  }
  sub_22D975AF4();
  memcpy((void *)v54, v50, 0x51uLL);
  OUTLINED_FUNCTION_15((void *)(v54 + 88), &a24);
  OUTLINED_FUNCTION_8();
  return sub_22D962C80(v70);
}

void *sub_22D961EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_11(v0, v1, v3, v4, v5, v6, v7, v8, &qword_255DA7050, &qword_255DA7058);
}

void *sub_22D961F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10)
{
  uint64_t v10;
  uint64_t *v12;
  double v13;
  char v14;
  double v15;
  char v16;
  double v17;
  char v18;
  char v19;
  char v20;
  double v21;
  double v22;
  double v23;
  char v24;
  double v25;
  double v26;
  double v28;
  double v29;
  double v30;
  void *v32;
  uint64_t v33;
  _BYTE v35[120];

  v12 = a10;
  v23 = OUTLINED_FUNCTION_0_0(a1);
  if (!v24)
    v23 = -INFINITY;
  v25 = v13;
  if ((v14 & 1) != 0)
    v25 = v23;
  v26 = v15;
  if ((v16 & 1) != 0)
    v26 = v25;
  if (v23 > v25 || v25 > v26)
    goto LABEL_22;
  v28 = v17;
  if ((v18 & 1) != 0)
    v28 = -INFINITY;
  v29 = v22;
  if ((v20 & 1) != 0)
    v29 = v28;
  v30 = v21;
  if ((v19 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    sub_22D9760E8();
    v32 = (void *)sub_22D975C44();
    sub_22D975A64();

    v12 = a10;
  }
  sub_22D975AF4();
  sub_22D962CD0(v10, a2, a9);
  v33 = __swift_instantiateConcreteTypeFromMangledName(v12);
  return OUTLINED_FUNCTION_15((void *)(a2 + *(int *)(v33 + 36)), v35);
}

#error "22D962170: call analysis failed (funcsize=53)"

id sub_22D962194()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_22D975FE0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

uint64_t sub_22D962204(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D96222C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D96225C()
{
  return sub_22D975E0C();
}

unint64_t sub_22D962278(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22D9761B4();
  sub_22D97601C();
  v4 = sub_22D9761D8();
  return sub_22D962398(a1, a2, v4);
}

uint64_t sub_22D9622DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22D962318(uint64_t a1)
{
  uint64_t v2;

  sub_22D976004();
  sub_22D9761B4();
  sub_22D97601C();
  v2 = sub_22D9761D8();
  swift_bridgeObjectRelease();
  return sub_22D962908(a1, v2);
}

unint64_t sub_22D962398(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22D97619C() & 1) == 0)
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
      while (!v14 && (sub_22D97619C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t initializeBufferWithCopyOfBuffer for AppleLogoHeaderView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppleLogoHeaderView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for AppleLogoHeaderView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AppleLogoHeaderView(_QWORD *a1, _QWORD *a2)
{
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
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppleLogoHeaderView(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleLogoHeaderView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleLogoHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleLogoHeaderView()
{
  return &type metadata for AppleLogoHeaderView;
}

uint64_t sub_22D962710()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_22D96272C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F34B68;
  if (!qword_253F34B68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34B70);
    v2[0] = sub_22D9627DC();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F34B68);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31D178](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22D9627DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F34B48;
  if (!qword_253F34B48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34B50);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F34B48);
  }
  return result;
}

unint64_t sub_22D962840()
{
  unint64_t result;

  result = qword_253F34BE8;
  if (!qword_253F34BE8)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F34BE8);
  }
  return result;
}

uint64_t sub_22D96287C(uint64_t a1)
{
  swift_release();
  return a1;
}

void sub_22D9628A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

void sub_22D9628DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_18(a1, a2, a3);
  OUTLINED_FUNCTION_23(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

unint64_t sub_22D962908(uint64_t a1, uint64_t a2)
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
    v6 = sub_22D976004();
    v8 = v7;
    if (v6 == sub_22D976004() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22D97619C();
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
          v13 = sub_22D976004();
          v15 = v14;
          if (v13 == sub_22D976004() && v15 == v16)
            break;
          v18 = sub_22D97619C();
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

uint64_t sub_22D962A7C()
{
  uint64_t v0;

  sub_22D976004();
  sub_22D9761B4();
  sub_22D97601C();
  v0 = sub_22D9761D8();
  OUTLINED_FUNCTION_20();
  return v0;
}

uint64_t sub_22D962AE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22D976004();
  v2 = v1;
  if (v0 == sub_22D976004() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22D97619C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

unint64_t sub_22D962B70()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_253F34B90;
  if (!qword_253F34B90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34B88);
    v2 = sub_22D962BD4();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253F34B90);
  }
  return result;
}

unint64_t sub_22D962BD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F34B78;
  if (!qword_253F34B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34B80);
    v2[0] = sub_22D96272C();
    v2[1] = sub_22D962C40();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F34B78);
  }
  return result;
}

unint64_t sub_22D962C40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA7048;
  if (!qword_255DA7048)
  {
    v1 = sub_22D975C38();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_255DA7048);
  }
  return result;
}

uint64_t sub_22D962C80(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_BYTE *)(a1 + 32);
  v4 = *(id *)a1;
  sub_22D962CC4(v2, v3);
  return a1;
}

uint64_t sub_22D962CC4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

void sub_22D962CD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_18(a1, a2, a3);
  OUTLINED_FUNCTION_23(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D962CFC(uint64_t a1)
{
  swift_retain();
  swift_retain();
  return a1;
}

double OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  return *(double *)&a1;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_22D975A64();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0x5F454C505041;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_22D975AF4();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_22D9760E8();
}

void *OUTLINED_FUNCTION_11@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10)
{
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  LOBYTE(a6) = v13;
  LOBYTE(a4) = v11;
  return sub_22D961F24(a1, a2, v10, a4, v12, a6, v14, v15, a9, a10);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return type metadata accessor for Localizations();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2)
{
  return sub_22D9622DC(a1, a2);
}

void *OUTLINED_FUNCTION_14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char __src)
{
  _QWORD *v24;
  uint64_t v25;

  *v24 = v25;
  return memcpy(v24 + 1, &__src, 0x70uLL);
}

void *OUTLINED_FUNCTION_15(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return a19;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_22D975C44();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_22(void *a1)
{
  uint64_t v1;

  return memcpy(a1, (const void *)(v1 + 200), 0x88uLL);
}

uint64_t OUTLINED_FUNCTION_23@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_22D962ED4(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v7 = a1;
  v8 = swift_bridgeObjectRetain();
  v9 = OUTLINED_FUNCTION_0_1(v8, sel_salableInfo);

  if (v9)
  {
    v10 = OUTLINED_FUNCTION_0_1((uint64_t)v10, sel_salableInfo);
    v9 = v10;
  }
  v11 = OUTLINED_FUNCTION_0_1((uint64_t)v10, sel_paymentContentItems);
  sub_22D9609B8();
  v12 = sub_22D976088();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_22D976178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v14 = swift_bridgeObjectRelease();
  if (v13 < 1)
  {
    v16 = 0;
  }
  else
  {
    v15 = OUTLINED_FUNCTION_0_1(v14, sel_paymentContentItems);
    v16 = sub_22D976088();

  }
  swift_bridgeObjectRelease();

  *a4 = v7;
  a4[1] = a2 & 1;
  a4[2] = a3;
  a4[3] = v16;
  a4[4] = v9;
}

void destroy for CardOnFileView(id *a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for CardOnFileView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = v5;
  return a1;
}

uint64_t assignWithCopy for CardOnFileView(uint64_t a1, uint64_t a2)
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

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  v9 = v8;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CardOnFileView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CardOnFileView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CardOnFileView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CardOnFileView()
{
  return &type metadata for CardOnFileView;
}

uint64_t sub_22D96325C()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_22D96326C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int16 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[5];
  __int16 v11;

  v3 = sub_22D975BF0();
  sub_22D9632DC(v1, (uint64_t)v10);
  v4 = v11;
  result = (__n128)v10[0];
  v6 = v10[1];
  v7 = v10[2];
  v8 = v10[3];
  v9 = v10[4];
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 72) = v8;
  *(_OWORD *)(a1 + 88) = v9;
  *(_WORD *)(a1 + 104) = v4;
  return result;
}

uint64_t sub_22D9632DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int16 v19;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[8];
  void *v24;
  unsigned __int8 v25;
  void *v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  _BYTE v33[8];
  uint64_t v34;

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = *(_QWORD *)a1;
    v6 = *(unsigned __int8 *)(a1 + 8);
    v7 = *(_QWORD *)(a1 + 16);
    v8 = v4;
    v9 = sub_22D97047C(v5, v6, v7);
    sub_22D9710F8(v8, v9, 0, (uint64_t)v23);
    v10 = v23[0];
    v11 = v24;
    v12 = v25;
    v13 = v26;
    v14 = v27;
    v15 = v30;
    v16 = v31;
    v22 = v32;
    v17 = v28 | ((unint64_t)v29 << 8);
    v21 = 256;
  }
  else
  {
    v21 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v17 = 0;
    v15 = 0;
    v16 = 0;
    v22 = 0;
  }
  sub_22D9634AC(a1 + 24, (uint64_t)v33);
  sub_22D9634AC((uint64_t)v33, (uint64_t)&v34);
  v18 = v34;
  v19 = v21;
  if (!v34)
    v19 = 0;
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 32) = v14;
  *(_QWORD *)(a2 + 40) = v17;
  *(_QWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 64) = v22;
  *(_QWORD *)(a2 + 72) = v18;
  *(_WORD *)(a2 + 80) = v19;
  sub_22D9634F4(v10, v11, v12, v13, v14, v17, v15, v16);
  swift_bridgeObjectRetain();
  sub_22D963544((uint64_t)v33);
  swift_bridgeObjectRelease();
  return sub_22D96356C(v10, v11, v12, v13, v14, v17, v15, v16);
}

double sub_22D963474@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_22D96326C(a1).n128_u64[0];
  return result;
}

uint64_t sub_22D9634AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D9634F4(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v10;
  id v11;
  id v12;
  uint64_t result;

  if (a2)
  {
    v10 = a8 & 1;
    v11 = a4;
    v12 = a2;
    sub_22D962CC4(a7, v10);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22D963544(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D96356C(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  if (a2)
  {

    sub_22D9635C0(a7, a8 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22D9635C0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

unint64_t sub_22D9635D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA7078;
  if (!qword_255DA7078)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7080);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_255DA7078);
  }
  return result;
}

id OUTLINED_FUNCTION_0_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_22D96361C()
{
  id result;

  sub_22D961644();
  result = sub_22D962194();
  qword_255DA8C10 = (uint64_t)result;
  return result;
}

uint64_t sub_22D963664()
{
  id v0;
  uint64_t result;

  if (qword_255DA6FA8 != -1)
    swift_once();
  v0 = (id)qword_255DA8C10;
  result = sub_22D975E6C();
  qword_255DA7088 = result;
  return result;
}

uint64_t static Color.borderColor.getter()
{
  if (qword_255DA6FB0 != -1)
    swift_once();
  return swift_retain();
}

void sub_22D96371C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  char v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  if (!*(_QWORD *)(a1 + 16))
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_22D96615C(a1, (uint64_t)&v16);
  if (!v18)
  {
LABEL_8:
    __break(1u);
    return;
  }
  sub_22D96698C(&v16, (uint64_t)v19);
  OUTLINED_FUNCTION_48();
  sub_22D9669A4(0, 1);
  __swift_project_boxed_opaque_existential_1(v19, v20);
  sub_22D975DDC();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
  v1 = *(_QWORD *)(v21 + 16);
  if (v1)
  {
    v2 = v21 + 32;
    do
    {
      sub_22D966AF0(v2, (uint64_t)v19);
      v3 = v16;
      v4 = v17;
      __swift_project_boxed_opaque_existential_1(v19, v20);
      sub_22D966B34(v3, *((uint64_t *)&v3 + 1), v4);
      swift_bridgeObjectRetain();
      sub_22D975DDC();
      v5 = sub_22D975D94();
      v10 = v6;
      v11 = v5;
      v9 = v7;
      v12 = v8;
      sub_22D9663A8(v13, v14, v15);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_24();
      *(_QWORD *)&v16 = v11;
      *((_QWORD *)&v16 + 1) = v10;
      v17 = v9 & 1;
      v18 = v12;
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
      v2 += 40;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
}

void sub_22D9638E0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  sub_22D96371C(a1);
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(_QWORD *)(a2 + 24) = v6;
}

void sub_22D963910(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_22D9638E0(*v1, a1);
}

void sub_22D963918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t aBlock;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;

  v2 = sub_22D975998();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_34();
  v32 = 0;
  v30 = 0;
  v31 = 0;
  v4 = *(void **)(v0 + 32);
  v5 = objc_msgSend(v4, sel_length);
  v6 = OUTLINED_FUNCTION_50();
  *(_QWORD *)(v6 + 16) = &v32;
  *(_QWORD *)(v6 + 24) = &v30;
  v7 = OUTLINED_FUNCTION_50();
  *(_QWORD *)(v7 + 16) = sub_22D96637C;
  *(_QWORD *)(v7 + 24) = v6;
  v28 = sub_22D966388;
  v29 = v7;
  aBlock = MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_22D9717AC;
  v27 = &block_descriptor;
  v8 = _Block_copy(&aBlock);
  OUTLINED_FUNCTION_43();
  swift_release();
  objc_msgSend(v4, sel_enumerateAttributesInRange_options_usingBlock_, 0, v5, 0, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v5 & 1) == 0)
  {
    v9 = v31;
    v10 = v32;
    if (v31)
    {
      v11 = v30;
      v12 = v30 == 0x656E696C64616568 && v31 == 0xE800000000000000;
      if (v12 || (OUTLINED_FUNCTION_1_1() & 1) != 0)
      {
        sub_22D975D10();
LABEL_23:
        v15 = objc_msgSend(v4, sel_string);
        v16 = sub_22D976004();
        v18 = v17;

        aBlock = v16;
        v25 = v18;
        sub_22D97598C();
        sub_22D962840();
        sub_22D976130();
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
        swift_bridgeObjectRelease();
        swift_retain();
        sub_22D966284();
        swift_release();
        v19 = sub_22D975D70();
        v21 = v20;
        v23 = v22;
        swift_bridgeObjectRelease();
        swift_release();
        OUTLINED_FUNCTION_43();
        sub_22D975DA0();
        swift_release_n();
        sub_22D9663A8(v19, v21, v23 & 1);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_49();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_17_0();
        return;
      }
      v13 = v11 == 0x65746F6E746F6F66 && v9 == 0xE800000000000000;
      if (v13 || (OUTLINED_FUNCTION_1_1() & 1) != 0)
      {
LABEL_21:
        sub_22D975D04();
        goto LABEL_23;
      }
      v14 = v11 == 0x656772616CLL && v9 == 0xE500000000000000;
      if (v14 || (OUTLINED_FUNCTION_1_1() & 1) != 0)
      {
        sub_22D975C98();
        goto LABEL_23;
      }
    }
    if (!v10)
    {
      sub_22D975CF8();
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_22D963CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, _QWORD *a6)
{
  id v9;
  unsigned __int8 v10;
  id v11;
  uint64_t result;
  id v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v9 = (id)*MEMORY[0x24BE07F00];
  sub_22D961540((uint64_t)v9, a1, &v15);

  if (v16)
  {
    sub_22D966800(0, &qword_253F34C58);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = objc_msgSend(v13, sel_BOOLValue);

      *a5 = v10;
    }
  }
  else
  {
    sub_22D960044((uint64_t)&v15);
  }
  v11 = (id)*MEMORY[0x24BE07F58];
  sub_22D961540((uint64_t)v11, a1, &v15);

  if (!v16)
    return sub_22D960044((uint64_t)&v15);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    *a6 = v13;
    a6[1] = v14;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_22D963E08(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_22D963918();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
}

id sub_22D963E38(uint64_t a1, double a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_46(a1, (unint64_t *)&qword_255DA7090);
  v3 = OUTLINED_FUNCTION_41();
  sub_22D963F50(v3, v4);
  v5 = OUTLINED_FUNCTION_41();
  v7 = sub_22D96F7F0(v5, v6, a2);
  if (v7)
  {
    OUTLINED_FUNCTION_42();
  }
  else
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_5_1();
    *(_OWORD *)(OUTLINED_FUNCTION_54() + 16) = xmmword_22D976A70;
    v8 = sub_22D975F98();
    OUTLINED_FUNCTION_11_0(v8, v9, v10, v11, v12, v13, v14, v15, 0xD000000000000035);
    sub_22D96E97C();
    OUTLINED_FUNCTION_42();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_22D963F50(uint64_t a1, unint64_t a2)
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

uint64_t sub_22D963F94(uint64_t a1, unint64_t a2)
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

uint64_t sub_22D963FD8(void *a1)
{
  id v1;

  v1 = a1;
  sub_22D975E84();
  return sub_22D975DD0();
}

BOOL sub_22D964000(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_22D964010()
{
  return sub_22D9761C0();
}

uint64_t sub_22D964034()
{
  sub_22D9761B4();
  sub_22D9761C0();
  return sub_22D9761D8();
}

uint64_t sub_22D964078@<X0>(uint64_t a1@<X8>)
{
  void **v1;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  result = sub_22D963FD8(*v1);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

BOOL sub_22D9640AC(char *a1, char *a2)
{
  return sub_22D964000(*a1, *a2);
}

uint64_t sub_22D9640B8()
{
  return sub_22D964034();
}

uint64_t sub_22D9640C0()
{
  return sub_22D964010();
}

uint64_t sub_22D9640C8()
{
  sub_22D9761B4();
  sub_22D9761C0();
  return sub_22D9761D8();
}

id sub_22D964108(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;

  sub_22D9643E8(a1, a2, a3);
  if (!v5)
  {
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_4_1();
    *(_OWORD *)(OUTLINED_FUNCTION_9_1() + 16) = xmmword_22D976A70;
    OUTLINED_FUNCTION_12_0();
    sub_22D976148();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_20_0();
    v11 = OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_11_0(v11, v12, v13, v14, v15, v16, v17, v18, v36);
    OUTLINED_FUNCTION_39();
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  v6 = v4;
  v7 = v5;
  OUTLINED_FUNCTION_46(v4, (unint64_t *)&qword_255DA7040);
  v8 = sub_22D962194();
  if (!v8)
  {
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_40();
    *(_OWORD *)(OUTLINED_FUNCTION_9_1() + 16) = xmmword_22D976A70;
    OUTLINED_FUNCTION_12_0();
    sub_22D976148();
    OUTLINED_FUNCTION_36();
    v19 = sub_22D975F98();
    OUTLINED_FUNCTION_11_0(v19, v20, v21, v22, v23, v24, v25, v26, 0xD000000000000063);
    sub_22D96E97C();
    goto LABEL_8;
  }
  v9 = v8;
  v10 = sub_22D964924(v6, v7, v8, a3 != 3);
  OUTLINED_FUNCTION_44();
  if (!v10)
  {
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_40();
    *(_OWORD *)(OUTLINED_FUNCTION_9_1() + 16) = xmmword_22D976A70;
    OUTLINED_FUNCTION_12_0();
    sub_22D976148();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_20_0();
    sub_22D976040();
    sub_22D976040();
    v27 = sub_22D975F98();
    OUTLINED_FUNCTION_11_0(v27, v28, v29, v30, v31, v32, v33, v34, v36);
    sub_22D96E97C();

    goto LABEL_8;
  }
  OUTLINED_FUNCTION_20_0();

  return v10;
}

void sub_22D9643E8(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_22D964414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = sub_22D976010();
  if (v1 != 13617 || v2 != 0xE200000000000000)
  {
    v0 = v1;
    v4 = v2;
    if ((OUTLINED_FUNCTION_0_2() & 1) == 0)
    {
      if (v0 == 14385 && v4 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_0_2();
        OUTLINED_FUNCTION_19_0();
        if ((v0 & 1) == 0)
          return 0;
      }
      OUTLINED_FUNCTION_10_0();
      return v0;
    }
  }
  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_22D964924(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id result;
  void *v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  CGColor *v17;
  double Width;
  double v19;
  double v20;
  double v21;
  size_t BitsPerComponent;
  CGColorSpace *v24;
  uint32_t BitmapInfo;
  CGContext *v26;
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
  CGContext *v39;
  CGContext *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  result = objc_msgSend((id)objc_opt_self(), sel_screenScale);
  if (!result)
    goto LABEL_32;
  v9 = result;
  *(double *)&v46 = 0.0;
  LOBYTE(v47) = 1;
  result = (id)MEMORY[0x22E31CC98](result, &v46);
  if ((v47 & 1) != 0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v10 = *(double *)&v46;

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD5F0]), sel_initForTextStyle_, *MEMORY[0x24BEBE1E8]);
  objc_msgSend(v11, sel_scaledValueForValue_, 11.0);
  v13 = v12;

  v14 = sub_22D964EC8(a1, a2, a3);
  if (!v14)
    return 0;
  v15 = v14;
  v16 = objc_msgSend((id)objc_opt_self(), sel_ams_primaryText);
  v17 = (CGColor *)objc_msgSend(v16, sel_CGColor);

  if (!v17)
  {
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_25();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_22D9766F0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7098);
    OUTLINED_FUNCTION_32();
    v27 = sub_22D975F98();
    OUTLINED_FUNCTION_31(v27, v28, v29, v30);
    v48 = MEMORY[0x24BEE0D00];
    *(double *)&v46 = -2.31584178e77;
    v47 = 0x800000022D9780F0;
    v31 = sub_22D975F98();
    OUTLINED_FUNCTION_31(v31, v32, v33, v34);
    sub_22D96E97C();

LABEL_24:
    swift_bridgeObjectRelease();
    return 0;
  }
  Width = (double)(uint64_t)CGImageGetWidth((CGImageRef)v15);
  result = (id)CGImageGetHeight((CGImageRef)v15);
  v19 = v13 / (double)(uint64_t)result;
  v20 = v10 * (v19 * Width) + 2.0;
  if (v20 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v20 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v21 = v10 * (v19 * (double)(uint64_t)result) + 2.0;
  if ((*(_QWORD *)&v20 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v21 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_29;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  BitsPerComponent = CGImageGetBitsPerComponent((CGImageRef)v15);
  v24 = CGImageGetColorSpace((CGImageRef)v15);
  if (v24
    || (result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]), (v24 = (CGColorSpace *)result) != 0))
  {
    BitmapInfo = CGImageGetBitmapInfo((CGImageRef)v15);
    v26 = CGBitmapContextCreate(0, (uint64_t)v20, (uint64_t)v21, BitsPerComponent, 0, v24, BitmapInfo);

    if (v26)
    {
      if ((a4 & 1) != 0)
      {
        sub_22D9760C4();
      }
      else
      {
        CGContextSetInterpolationQuality(v26, kCGInterpolationHigh);
        CGContextSetBlendMode(v26, kCGBlendModeNormal);
        v39 = (CGContext *)OUTLINED_FUNCTION_38();
        CGContextClipToMask(v39, v49, (CGImageRef)v15);
        CGContextSetFillColorWithColor(v26, v17);
        v40 = (CGContext *)OUTLINED_FUNCTION_38();
        CGContextFillRect(v40, v50);
      }
      if (CGBitmapContextCreateImage(v26))
      {
        sub_22D975BC0();
        sub_22D975DAC();
        v41 = sub_22D975ECC();

        return (id)v41;
      }
      type metadata accessor for Log();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_25();
      *(_OWORD *)(OUTLINED_FUNCTION_54() + 16) = xmmword_22D9766F0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7098);
      OUTLINED_FUNCTION_32();
      v42 = sub_22D975F98();
      OUTLINED_FUNCTION_31(v42, v43, v44, v45);
      sub_22D975F44();
      sub_22D96E97C();

    }
    else
    {
      OUTLINED_FUNCTION_16_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
      OUTLINED_FUNCTION_5_1();
      OUTLINED_FUNCTION_25();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_22D9766F0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7098);
      OUTLINED_FUNCTION_32();
      v35 = sub_22D975F98();
      OUTLINED_FUNCTION_31(v35, v36, v37, v38);
      sub_22D975F44();
      sub_22D96E97C();

    }
    goto LABEL_24;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_22D964EA4()
{
  swift_retain();
  return sub_22D975DD0();
}

id sub_22D964EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;

  OUTLINED_FUNCTION_46(a1, (unint64_t *)&qword_255DA7090);
  v5 = a3;
  OUTLINED_FUNCTION_48();
  v6 = OUTLINED_FUNCTION_41();
  v8 = sub_22D965208(v6, v7, a3);
  if (!v8)
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_25();
    *(_OWORD *)(OUTLINED_FUNCTION_9_1() + 16) = xmmword_22D9766F0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7098);
    v18 = OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_11_0(v18, v19, v20, v21, v22, v23, v24, v25, v52);
    OUTLINED_FUNCTION_12_0();
    sub_22D976148();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_2_1();
    v26 = OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_11_0(v26, v27, v28, v29, v30, v31, v32, v33, v53);
    OUTLINED_FUNCTION_39();
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = v8;
  v10 = objc_msgSend(v8, sel_imageAsset);
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_currentTraitCollection);
  v13 = objc_msgSend(v12, sel_userInterfaceStyle);

  v14 = objc_msgSend(v11, sel_traitCollectionWithUserInterfaceStyle_, v13);
  if (!v10 || (v15 = objc_msgSend(v10, sel_imageWithTraitCollection_, v14)) == 0)
  {
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_25();
    *(_OWORD *)(OUTLINED_FUNCTION_9_1() + 16) = xmmword_22D9766F0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7098);
    v34 = OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_11_0(v34, v35, v36, v37, v38, v39, v40, v41, v52);
    OUTLINED_FUNCTION_12_0();
    sub_22D976148();
    OUTLINED_FUNCTION_48();
    swift_bridgeObjectRelease();
    sub_22D976040();
    v42 = objc_msgSend(v14, sel_description);
    sub_22D976004();

    sub_22D976040();
    swift_bridgeObjectRelease();
    sub_22D976040();
    v43 = sub_22D975F98();
    OUTLINED_FUNCTION_11_0(v43, v44, v45, v46, v47, v48, v49, v50, a1);
    sub_22D96E97C();

    goto LABEL_7;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, sel_CGImage);

  return v17;
}

id sub_22D965208(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  if (a2)
  {
    v4 = (void *)sub_22D975FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_, v4, a3);

  return v5;
}

void sub_22D965284(uint64_t a1)
{
  swift_release();
  swift_release();

}

uint64_t sub_22D9652B4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain();
  swift_retain();
  v6 = v5;
  return a1;
}

uint64_t sub_22D965314(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  v6 = *(void **)(a2 + 32);
  v7 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  v8 = v6;

  return a1;
}

uint64_t sub_22D965394(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  void *v6;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();
  v5 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v5;
  swift_release();
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t sub_22D9653F8(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D965438(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for AttributedStringRowComponent()
{
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_22D96548C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_release();
}

uint64_t sub_22D9654C8(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_22D965528(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t sub_22D965564(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 9))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D9655A4(uint64_t result, int a2, int a3)
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

void type metadata accessor for RatingRowComponent()
{
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_22D9655F0()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D965620(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D96568C(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_22D965734(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  uint64_t v6;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();
  v5 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v5;
  swift_release();
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D9657A0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D9657E0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for TextEncapsulationRowComponent()
{
  OUTLINED_FUNCTION_13_0();
}

void type metadata accessor for ImageRowComponent()
{
  OUTLINED_FUNCTION_13_0();
}

void type metadata accessor for CombinedRowView()
{
  OUTLINED_FUNCTION_13_0();
}

_QWORD *initializeBufferWithCopyOfBuffer for TitleHeaderView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TitleHeaderView()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for TitleHeaderView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for TitleHeaderView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TitleHeaderView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TitleHeaderView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for StringRowComponent()
{
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_22D96597C()
{
  return MEMORY[0x24BDF1F80];
}

uint64_t sub_22D965988@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  result = sub_22D964EA4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22D9659BC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22D965A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v4;
  char v5;

  result = sub_22D9659BC(*v1);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_22D965A3C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D965A4C()
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
  uint64_t v19;
  char *v20;
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t KeyPath;
  uint64_t v56;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70C0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6_1();
  v50 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70C8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_1();
  v49 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70D0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_6_1();
  v46 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70D8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70E0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_34();
  v11 = sub_22D975D64();
  v12 = *(_QWORD *)(v11 - 8);
  v52 = v11;
  v53 = v12;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_1();
  v51 = v13;
  sub_22D9759F8();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_22D9759C8();
  v47 = *(_QWORD *)(v15 - 8);
  v48 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v45 - v19;
  swift_bridgeObjectRetain();
  sub_22D9759EC();
  sub_22D9759D4();
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_43();
  v21 = sub_22D966284();
  swift_release();
  v56 = v21;
  sub_22D966854();
  sub_22D9759BC();
  OUTLINED_FUNCTION_47();
  v22 = sub_22D966284();
  OUTLINED_FUNCTION_49();
  v23 = sub_22D975D34();
  OUTLINED_FUNCTION_26(v0, v24, v25, v23);
  v26 = sub_22D975D40();
  OUTLINED_FUNCTION_26((uint64_t)v9, v27, v28, v26);
  v29 = sub_22D975D4C();
  OUTLINED_FUNCTION_26(v46, v30, v31, v29);
  v32 = sub_22D975D28();
  __swift_storeEnumTagSinglePayload(v49, 1, 1, v32);
  v45[1] = v22;
  swift_retain();
  v33 = v51;
  sub_22D975D58();
  v54 = swift_getKeyPath();
  swift_getKeyPath();
  v34 = v50;
  v35 = v33;
  v36 = v52;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v50, v35, v52);
  __swift_storeEnumTagSinglePayload(v34, 0, 1, v36);
  sub_22D96690C();
  OUTLINED_FUNCTION_41();
  v37 = v20;
  v45[0] = v20;
  sub_22D9759BC();
  v38 = v47;
  v39 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v18, v37, v48);
  v40 = sub_22D975DB8();
  v42 = v41;
  LOBYTE(v22) = v43 & 1;
  sub_22D975D04();
  sub_22D975DA0();
  v50 = v44;
  swift_release();
  sub_22D9663A8(v40, v42, v22);
  swift_release();
  OUTLINED_FUNCTION_44();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v52);
  (*(void (**)(_QWORD, uint64_t))(v38 + 8))(v45[0], v39);
  OUTLINED_FUNCTION_17_0();
}

void sub_22D965E70()
{
  sub_22D966854();
  sub_22D975A04();
  __break(1u);
}

uint64_t sub_22D965E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_22D975FD4() & 1;
}

uint64_t sub_22D965EE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_22D975FC8();
}

void sub_22D965F28()
{
  sub_22D96690C();
  sub_22D975A04();
  __break(1u);
}

void sub_22D965F4C(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_22D965A4C();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
}

unint64_t sub_22D965F7C(uint64_t a1)
{
  unint64_t result;

  result = sub_22D965FA0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D965FA0()
{
  unint64_t result;

  result = qword_253F34B18;
  if (!qword_253F34B18)
  {
    result = MEMORY[0x22E31D184](&unk_22D976CE4, &unk_24F9778A0);
    atomic_store(result, (unint64_t *)&qword_253F34B18);
  }
  return result;
}

unint64_t sub_22D965FDC(uint64_t a1)
{
  unint64_t result;

  result = sub_22D966000();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D966000()
{
  unint64_t result;

  result = qword_253F34B00;
  if (!qword_253F34B00)
  {
    result = MEMORY[0x22E31D184](&unk_22D976B54, &unk_24F977A80);
    atomic_store(result, (unint64_t *)&qword_253F34B00);
  }
  return result;
}

unint64_t sub_22D96603C(uint64_t a1)
{
  unint64_t result;

  result = sub_22D966060();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D966060()
{
  unint64_t result;

  result = qword_255DA70A0;
  if (!qword_255DA70A0)
  {
    result = MEMORY[0x22E31D184](&unk_22D976C94, &unk_24F977928);
    atomic_store(result, (unint64_t *)&qword_255DA70A0);
  }
  return result;
}

unint64_t sub_22D96609C(uint64_t a1)
{
  unint64_t result;

  result = sub_22D9660C0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D9660C0()
{
  unint64_t result;

  result = qword_255DA70A8;
  if (!qword_255DA70A8)
  {
    result = MEMORY[0x22E31D184](&unk_22D976C44, &unk_24F9779A8);
    atomic_store(result, (unint64_t *)&qword_255DA70A8);
  }
  return result;
}

unint64_t sub_22D9660FC(uint64_t a1)
{
  unint64_t result;

  result = sub_22D966120();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D966120()
{
  unint64_t result;

  result = qword_255DA70B0;
  if (!qword_255DA70B0)
  {
    result = MEMORY[0x22E31D184](&unk_22D976BF4, &unk_24F9779D8);
    atomic_store(result, (unint64_t *)&qword_255DA70B0);
  }
  return result;
}

double sub_22D96615C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_22D966AF0(a1 + 32, a2);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

double sub_22D966180()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_45();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_33();
  if ((v1 & 1) != 0)
    return *(double *)&v0;
  OUTLINED_FUNCTION_47();
  sub_22D9760E8();
  v4 = sub_22D975C44();
  if (OUTLINED_FUNCTION_35(v4))
  {
    OUTLINED_FUNCTION_52();
    v8 = OUTLINED_FUNCTION_30();
    *(_DWORD *)v2 = 136315138;
    *(_QWORD *)(v2 + 4) = sub_22D9663B8(0x74616F6C464743, 0xE700000000000000, &v8);
    OUTLINED_FUNCTION_18_0(&dword_22D95E000, v5, v6, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_15_0();
  }

  sub_22D975B78();
  OUTLINED_FUNCTION_28();
  sub_22D9635C0(v0, 0);
  OUTLINED_FUNCTION_27();
  return *(double *)&v8;
}

uint64_t sub_22D966284()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_45();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_47();
  if ((v1 & 1) == 0)
  {
    sub_22D9760E8();
    v4 = sub_22D975C44();
    if (OUTLINED_FUNCTION_35(v4))
    {
      OUTLINED_FUNCTION_52();
      v8 = OUTLINED_FUNCTION_30();
      *(_DWORD *)v2 = 136315138;
      *(_QWORD *)(v2 + 4) = sub_22D9663B8(0x726F6C6F43, 0xE500000000000000, &v8);
      OUTLINED_FUNCTION_18_0(&dword_22D95E000, v5, v6, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_15_0();
    }

    sub_22D975B78();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_27();
    return v8;
  }
  return v0;
}

uint64_t sub_22D96637C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_22D963CD0(a1, a2, a3, a4, *(unsigned __int8 **)(v4 + 16), *(_QWORD **)(v4 + 24));
}

void sub_22D966388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_22D971790(a1, a2, a3, a4, *(void (**)(void))(v4 + 16));
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

uint64_t sub_22D9663A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_22D9663B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22D966488(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22D9622DC((uint64_t)v12, *a3);
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
      sub_22D9622DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

unint64_t sub_22D966488(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_22D966584(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_22D97616C();
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

uint64_t sub_22D966584(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22D966618(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22D966714(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22D966714((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22D966618(uint64_t a1, unint64_t a2)
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
      v3 = sub_22D9666B0(v2, 0);
      result = sub_22D976154();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_22D97604C();
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

_QWORD *sub_22D9666B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22D966714(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA70B8);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v8] <= v12)
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

uint64_t sub_22D966800(uint64_t a1, unint64_t *a2)
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

void sub_22D966838()
{
  sub_22D9759B0();
  __break(1u);
}

unint64_t sub_22D966854()
{
  unint64_t result;

  result = qword_255DA70E8;
  if (!qword_255DA70E8)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEACB8], MEMORY[0x24BDEACC8]);
    atomic_store(result, (unint64_t *)&qword_255DA70E8);
  }
  return result;
}

uint64_t sub_22D96689C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_22D9668A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D965E94(a1, a2, a3, &qword_255DA7100) & 1;
}

uint64_t sub_22D9668C8(uint64_t a1, uint64_t a2)
{
  return sub_22D965EE8(a1, a2, &qword_255DA7100);
}

_QWORD *sub_22D9668E4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_22D9668F0()
{
  sub_22D9759A4();
  __break(1u);
}

unint64_t sub_22D96690C()
{
  unint64_t result;

  result = qword_255DA70F0;
  if (!qword_255DA70F0)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEAC40], MEMORY[0x24BDEAC50]);
    atomic_store(result, (unint64_t *)&qword_255DA70F0);
  }
  return result;
}

uint64_t sub_22D966950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D965E94(a1, a2, a3, &qword_255DA70F8) & 1;
}

uint64_t sub_22D966970(uint64_t a1, uint64_t a2)
{
  return sub_22D965EE8(a1, a2, &qword_255DA70F8);
}

uint64_t sub_22D96698C(__int128 *a1, uint64_t a2)
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

uint64_t sub_22D9669A4(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_22D972E10(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = (char *)&v4[5 * v6 + 4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B10);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_16;
  v13 = v4[2];
  if (__OFSUB__(v13, a2))
    goto LABEL_22;
  result = (uint64_t)sub_22D973174((char *)&v4[5 * a2 + 4], v13 - a2, v12);
  v14 = v4[2];
  v15 = __OFADD__(v14, v8);
  v16 = v14 - v7;
  if (!v15)
  {
    v4[2] = v16;
LABEL_16:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return OUTLINED_FUNCTION_23_0();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_22D966AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22D966B34(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_22D966B50(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_22D966BD8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D966C24 + 4 * byte_22D976A89[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22D966C58 + 4 * byte_22D976A84[v4]))();
}

uint64_t sub_22D966C58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D966C60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D966C68);
  return result;
}

uint64_t sub_22D966C74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D966C7CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22D966C80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D966C88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D966C94(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D966CA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for RatingRowComponent.RatingSystem()
{
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_22D966CB4()
{
  return MEMORY[0x24BDF1F80];
}

unint64_t sub_22D966CC4()
{
  unint64_t result;

  result = qword_255DA7108;
  if (!qword_255DA7108)
  {
    result = MEMORY[0x22E31D184](&unk_22D976EF0, &unk_24F977C20);
    atomic_store(result, (unint64_t *)&qword_255DA7108);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_22D97619C();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_22D97619C();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_22D976040();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_22D975FB0();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_22D975FB0();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_22D960044((uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_15_0()
{
  JUMPOUT(0x22E31D214);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return type metadata accessor for Log();
}

void OUTLINED_FUNCTION_18_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_22D975F98();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_22D975F98();
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  sub_22D9663A8(v0, v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return 0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_22D960044((uint64_t)va);
}

BOOL OUTLINED_FUNCTION_35(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_22D975B84();
}

uint64_t OUTLINED_FUNCTION_38()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_22D96E97C();
}

uint64_t OUTLINED_FUNCTION_41()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  unint64_t v0;
  uint64_t v1;

  return sub_22D963F94(v1, v0);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1, unint64_t *a2)
{
  return sub_22D966800(0, a2);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return 8;
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_allocObject();
}

void sub_22D967050()
{
  sub_22D96B408(&qword_253F34AB8, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
}

unint64_t sub_22D96707C(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_22D96708C(uint64_t result)
{
  return result;
}

void sub_22D967094(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD00000000000002BLL;
  else
    v3 = 0xD000000000000032;
  if (v2)
    v4 = 0x800000022D977D80;
  else
    v4 = 0x800000022D977DC0;
  if ((a2 & 1) != 0)
    v5 = 0xD00000000000002BLL;
  else
    v5 = 0xD000000000000032;
  if ((a2 & 1) != 0)
    v6 = 0x800000022D977DC0;
  else
    v6 = 0x800000022D977D80;
  if (v3 != v5 || v4 != v6)
    sub_22D97619C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_2();
}

void sub_22D967130(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_22D967180(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22D9671E0 + 4 * byte_22D976F24[a2]))(0x65746F6E746F6F66);
}

uint64_t sub_22D9671E0(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x65746F6E746F6F66 && v1 == 0xE800000000000000)
    v3 = 1;
  else
    v3 = sub_22D97619C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22D967270()
{
  unsigned __int8 *v0;

  return sub_22D96D118(*v0);
}

void sub_22D967278()
{
  sub_22D9672D8();
}

uint64_t sub_22D967280()
{
  sub_22D97601C();
  return OUTLINED_FUNCTION_3_2();
}

void sub_22D9672D8()
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_5();
}

void sub_22D9672F0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22D967330()
{
  sub_22D97601C();
  return OUTLINED_FUNCTION_3_2();
}

uint64_t sub_22D967384(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_22D96D174(a1, *v1);
}

unint64_t sub_22D96738C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_22D96707C(*a1);
  *a2 = result;
  return result;
}

void sub_22D9673B4(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_22D96708C(*v1);
  OUTLINED_FUNCTION_5();
}

void sub_22D9673D8(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v11;
  uint64_t KeyPath;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v21 = a3 & 1;
  sub_22D966800(0, (unint64_t *)&qword_255DA7040);
  v11 = sub_22D962194();
  KeyPath = swift_getKeyPath();
  v13 = sub_22D9674E8(a1, 11043042, 0xA300000000000000, a4, a5);
  swift_bridgeObjectRelease();
  v14 = sub_22D96E0DC(a1, a2);
  v16 = v15;
  v18 = v17;
  v20 = v19;

  *(_QWORD *)a6 = v11;
  *(_QWORD *)(a6 + 8) = v13;
  *(_BYTE *)(a6 + 16) = v21;
  *(_QWORD *)(a6 + 24) = v14;
  *(_QWORD *)(a6 + 32) = v16;
  *(_QWORD *)(a6 + 40) = v18;
  *(_QWORD *)(a6 + 48) = v20;
  *(_QWORD *)(a6 + 56) = KeyPath;
  *(_BYTE *)(a6 + 64) = 0;
}

uint64_t sub_22D9674E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  char v38;
  id v39;
  unint64_t v40;
  char v41;
  char v42;
  id v43;
  unint64_t v44;
  char v45;
  int v46;
  id v47;
  unint64_t v48;
  char v49;
  int v50;
  uint64_t v51;
  id v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char v69;
  id v70;
  unint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v78;
  uint64_t v79;
  uint64_t v80;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  char v87;
  char v88;
  char v89;
  uint64_t v90;
  id v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;

  v105 = a4;
  v106 = a5;
  v8 = type metadata accessor for FlexListItem();
  v103 = *(_QWORD *)(v8 - 8);
  v104 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v113 = (uint64_t)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v94 - v11;
  v111 = a1;
  v13 = objc_msgSend(a1, sel_string);
  v14 = sub_22D976004();
  v16 = v15;

  *(_QWORD *)&v114 = v14;
  *((_QWORD *)&v114 + 1) = v16;
  v112 = a2;
  v117 = a2;
  v118 = a3;
  sub_22D962840();
  v17 = sub_22D976124();
  swift_bridgeObjectRelease();
  v116 = MEMORY[0x24BEE4AF8];
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v19 = 0;
    v110 = v17;
    v20 = v17 + 40;
    while (1)
    {
      if ((*(_QWORD *)v20 & 0x1000000000000000) != 0)
        v21 = sub_22D976058();
      else
        v21 = sub_22D976064();
      v22 = v21;
      v23 = objc_msgSend(v111, sel_attributedSubstringFromRange_, v19, v21);
      if ((uint64_t)objc_msgSend(v23, sel_length) >= 1)
      {
        v24 = v23;
        MEMORY[0x22E31CC5C]();
        if (*(_QWORD *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22D9760A0();
        sub_22D9760AC();
        sub_22D976094();
      }
      v25 = sub_22D976028();

      v26 = v22 + v25;
      if (__OFADD__(v22, v25))
        break;
      v27 = __OFADD__(v19, v26);
      v19 += v26;
      if (v27)
        goto LABEL_155;
      v20 += 16;
      if (!--v18)
      {
        result = swift_bridgeObjectRelease();
        v20 = v116;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_155:
    __break(1u);
  }
  else
  {
    result = swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
LABEL_15:
    if (!(v20 >> 62))
    {
      v29 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v29)
        goto LABEL_157;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRetain();
  v29 = sub_22D976178();
  result = swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_17:
    if (v29 < 1)
    {
      __break(1u);
      return result;
    }
    v30 = 0;
    v109 = v20 & 0xC000000000000001;
    v100 = (id)*MEMORY[0x24BE07F20];
    v99 = (id)*MEMORY[0x24BE07EE8];
    v98 = (id)*MEMORY[0x24BE07F00];
    v97 = (id)*MEMORY[0x24BE07F58];
    v96 = (id)*MEMORY[0x24BE07F60];
    v112 = *MEMORY[0x24BE07F78];
    v107 = *MEMORY[0x24BE07F70];
    v94 = *MEMORY[0x24BE07F68];
    v95 = (id)*MEMORY[0x24BE07F80];
    v31 = MEMORY[0x24BEE4AF8];
    v108 = MEMORY[0x24BEE4AD8] + 8;
    v101 = v29;
    v102 = (_QWORD *)v20;
    while (1)
    {
      v32 = v109 ? (id)MEMORY[0x22E31CD40](v30, v20) : *(id *)(v20 + 8 * v30 + 32);
      v33 = v32;
      v34 = objc_msgSend(v32, sel_attributesAtIndex_effectiveRange_, 0, 0, v94);
      type metadata accessor for Key(0);
      sub_22D96B408(&qword_253F34C40, type metadata accessor for Key);
      v35 = sub_22D975FBC();

      if (!*(_QWORD *)(v35 + 16))
        break;
      v36 = v100;
      v37 = sub_22D962318((uint64_t)v36);
      if ((v38 & 1) != 0)
      {
        sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v37, (uint64_t)&v114);
      }
      else
      {
        v114 = 0u;
        v115 = 0u;
      }

      if (!*((_QWORD *)&v115 + 1))
        goto LABEL_33;
      if ((swift_dynamicCast() & 1) == 0 || v117 != 3 && v117 != 2 && v117 != 1)
        goto LABEL_34;

      swift_bridgeObjectRelease();
LABEL_150:
      if (v29 == ++v30)
        goto LABEL_158;
    }
    v114 = 0u;
    v115 = 0u;
LABEL_33:
    sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
LABEL_34:
    if (*(_QWORD *)(v35 + 16))
    {
      v39 = v99;
      v40 = sub_22D962318((uint64_t)v39);
      if ((v41 & 1) != 0)
      {
        sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v40, (uint64_t)&v114);
      }
      else
      {
        v114 = 0u;
        v115 = 0u;
      }

      if (*((_QWORD *)&v115 + 1))
      {
        if (swift_dynamicCast())
        {
          v42 = v117;
          goto LABEL_44;
        }
LABEL_43:
        v42 = 0;
LABEL_44:
        if (*(_QWORD *)(v35 + 16))
        {
          v43 = v98;
          v44 = sub_22D962318((uint64_t)v43);
          if ((v45 & 1) != 0)
          {
            sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v44, (uint64_t)&v114);
          }
          else
          {
            v114 = 0u;
            v115 = 0u;
          }

          if (*((_QWORD *)&v115 + 1))
          {
            if (swift_dynamicCast())
            {
              v46 = v117;
              goto LABEL_54;
            }
LABEL_53:
            v46 = 0;
LABEL_54:
            if (*(_QWORD *)(v35 + 16))
            {
              v47 = v97;
              v48 = sub_22D962318((uint64_t)v47);
              if ((v49 & 1) != 0)
              {
                sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v48, (uint64_t)&v114);
              }
              else
              {
                v114 = 0u;
                v115 = 0u;
              }

              if (*((_QWORD *)&v115 + 1))
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v50 = sub_22D969B54();
                  if (v50 != 4)
                  {
LABEL_65:
                    LODWORD(v110) = v50;
                    v51 = *(_QWORD *)(v35 + 16);
                    LODWORD(v111) = v46;
                    if (v51)
                    {
                      v52 = v96;
                      v53 = sub_22D962318((uint64_t)v52);
                      if ((v54 & 1) != 0)
                      {
                        sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v53, (uint64_t)&v114);
                      }
                      else
                      {
                        v114 = 0u;
                        v115 = 0u;
                      }

                      if (*((_QWORD *)&v115 + 1))
                      {
                        if ((swift_dynamicCast() & 1) != 0)
                        {
                          v56 = v117;
                          v55 = v118;
                          goto LABEL_75;
                        }
LABEL_74:
                        v56 = 0;
                        v55 = 0;
LABEL_75:
                        v57 = sub_22D976004();
                        if (v55)
                        {
                          if (v56 == v57 && v55 == v58)
                          {
                            swift_bridgeObjectRelease();
LABEL_91:
                            swift_bridgeObjectRelease();
                            v65 = 1;
                            goto LABEL_105;
                          }
                          v60 = sub_22D97619C();
                          swift_bridgeObjectRelease();
                          if ((v60 & 1) != 0)
                            goto LABEL_91;
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                        v61 = sub_22D976004();
                        if (v55)
                        {
                          if (v56 == v61 && v55 == v62)
                          {
                            swift_bridgeObjectRelease();
LABEL_101:
                            swift_bridgeObjectRelease();
                            v65 = 2;
                            goto LABEL_105;
                          }
                          v64 = sub_22D97619C();
                          swift_bridgeObjectRelease();
                          if ((v64 & 1) != 0)
                            goto LABEL_101;
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                        v66 = sub_22D976004();
                        if (!v55)
                        {
                          swift_bridgeObjectRelease();
                          v65 = 0;
                          goto LABEL_105;
                        }
                        if (v56 == v66 && v55 == v67)
                        {
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                        }
                        else
                        {
                          v69 = sub_22D97619C();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          v65 = 0;
                          if ((v69 & 1) == 0)
                          {
LABEL_105:
                            if (*(_QWORD *)(v35 + 16))
                            {
                              v70 = v95;
                              v71 = sub_22D962318((uint64_t)v70);
                              if ((v72 & 1) != 0)
                              {
                                sub_22D9622DC(*(_QWORD *)(v35 + 56) + 32 * v71, (uint64_t)&v114);
                              }
                              else
                              {
                                v114 = 0u;
                                v115 = 0u;
                              }

                            }
                            else
                            {
                              v114 = 0u;
                              v115 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            if (*((_QWORD *)&v115 + 1))
                            {
                              if ((swift_dynamicCast() & 1) != 0)
                              {
                                v74 = v117;
                                v73 = v118;
                                goto LABEL_116;
                              }
                            }
                            else
                            {
                              sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
                            }
                            v74 = 0;
                            v73 = 0;
LABEL_116:
                            v75 = sub_22D976004();
                            if (v73)
                            {
                              if (v74 == v75 && v73 == v76)
                              {
                                swift_bridgeObjectRelease();
LABEL_132:
                                swift_bridgeObjectRelease();
                                v83 = 1;
                                goto LABEL_144;
                              }
                              v78 = sub_22D97619C();
                              swift_bridgeObjectRelease();
                              if ((v78 & 1) != 0)
                                goto LABEL_132;
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                            }
                            v79 = sub_22D976004();
                            if (v73)
                            {
                              if (v74 == v79 && v73 == v80)
                              {
                                swift_bridgeObjectRelease();
LABEL_142:
                                swift_bridgeObjectRelease();
                                v83 = 2;
                                goto LABEL_144;
                              }
                              v82 = sub_22D97619C();
                              swift_bridgeObjectRelease();
                              if ((v82 & 1) != 0)
                                goto LABEL_142;
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                            }
                            v84 = sub_22D976004();
                            if (v73)
                            {
                              if (v74 == v84 && v73 == v85)
                              {
                                swift_bridgeObjectRelease();
                                swift_bridgeObjectRelease();
                                v88 = (char)v111;
                                v89 = v110;
                              }
                              else
                              {
                                v87 = sub_22D97619C();
                                swift_bridgeObjectRelease();
                                swift_bridgeObjectRelease();
                                v83 = 0;
                                v88 = (char)v111;
                                v89 = v110;
                                if ((v87 & 1) == 0)
                                {
LABEL_145:
                                  v90 = v106;
                                  *(_QWORD *)v12 = v105;
                                  *((_QWORD *)v12 + 1) = v90;
                                  v12[16] = v42;
                                  v12[17] = v88;
                                  v12[18] = v89;
                                  v12[19] = v65;
                                  v12[20] = v83;
                                  *((_QWORD *)v12 + 3) = v33;
                                  swift_bridgeObjectRetain();
                                  v91 = v33;
                                  sub_22D975A28();
                                  sub_22D96A900((uint64_t)v12, v113);
                                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                                    v31 = sub_22D973028(0, *(_QWORD *)(v31 + 16) + 1, 1, v31);
                                  v29 = v101;
                                  v93 = *(_QWORD *)(v31 + 16);
                                  v92 = *(_QWORD *)(v31 + 24);
                                  if (v93 >= v92 >> 1)
                                    v31 = sub_22D973028(v92 > 1, v93 + 1, 1, v31);
                                  *(_QWORD *)(v31 + 16) = v93 + 1;
                                  sub_22D96A944(v113, v31+ ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80))+ *(_QWORD *)(v103 + 72) * v93);

                                  sub_22D96A988((uint64_t)v12);
                                  v20 = (unint64_t)v102;
                                  goto LABEL_150;
                                }
                              }
                              v83 = 3;
                              goto LABEL_145;
                            }
                            swift_bridgeObjectRelease();
                            v83 = 0;
LABEL_144:
                            v88 = (char)v111;
                            v89 = v110;
                            goto LABEL_145;
                          }
                        }
                        v65 = 3;
                        goto LABEL_105;
                      }
                    }
                    else
                    {
                      v114 = 0u;
                      v115 = 0u;
                    }
                    sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
                    goto LABEL_74;
                  }
                }
LABEL_64:
                v50 = 0;
                goto LABEL_65;
              }
            }
            else
            {
              v114 = 0u;
              v115 = 0u;
            }
            sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
            goto LABEL_64;
          }
        }
        else
        {
          v114 = 0u;
          v115 = 0u;
        }
        sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
        goto LABEL_53;
      }
    }
    else
    {
      v114 = 0u;
      v115 = 0u;
    }
    sub_22D9628A4((uint64_t)&v114, &qword_253F34C88);
    goto LABEL_43;
  }
LABEL_157:
  v31 = MEMORY[0x24BEE4AF8];
LABEL_158:
  swift_bridgeObjectRelease();
  return v31;
}

void sub_22D968074(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_22D975BB4();
  *(_QWORD *)(a1 + 8) = 0x4030000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7128);
  sub_22D9680B8(v1, (_QWORD *)(a1 + *(int *)(v3 + 44)));
  OUTLINED_FUNCTION_5();
}

void sub_22D9680B8(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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
  void *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[32];
  void *v45;
  unsigned __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7130);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7138);
  v7 = MEMORY[0x24BDAC7A8](v40);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v35 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - v13;
  sub_22D9628DC((uint64_t)(a1 + 3), (uint64_t)v44, &qword_255DA7140);
  sub_22D9628DC((uint64_t)v44, (uint64_t)&v45, &qword_255DA7140);
  v38 = v14;
  v39 = v9;
  v37 = v48;
  if (v48)
  {
    v35 = v47;
    v36 = v45;
    v41 = v46;
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v41 = 0;
  }
  sub_22D96AD90((uint64_t)v44);
  *(_QWORD *)v6 = sub_22D975BF0();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7148);
  v42 = a1[1];
  v43 = v42;
  v15 = swift_allocObject();
  memcpy((void *)(v15 + 16), a1, 0x41uLL);
  sub_22D963544((uint64_t)&v43);
  sub_22D96AE54((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C00);
  sub_22D975A34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7150);
  sub_22D96B6C0(&qword_253F34C08, &qword_253F34C00);
  sub_22D96B6C0(&qword_255DA7158, &qword_255DA7150);
  sub_22D96B408(&qword_253F34AC8, (void (*)(uint64_t))type metadata accessor for FlexListItem);
  sub_22D975F20();
  v16 = sub_22D975C5C();
  v17 = sub_22D975C68();
  v18 = sub_22D975C80();
  sub_22D975C80();
  if (sub_22D975C80() != v16)
    v18 = sub_22D975C80();
  sub_22D975C80();
  if (sub_22D975C80() != v17)
    v18 = sub_22D975C80();
  v20 = (uint64_t)v38;
  v19 = (uint64_t)v39;
  v22 = v36;
  v21 = v37;
  v23 = v35;
  sub_22D975A70();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_22D962CD0((uint64_t)v6, (uint64_t)v12, &qword_255DA7130);
  v32 = &v12[*(int *)(v40 + 36)];
  *v32 = v18;
  *((_QWORD *)v32 + 1) = v25;
  *((_QWORD *)v32 + 2) = v27;
  *((_QWORD *)v32 + 3) = v29;
  *((_QWORD *)v32 + 4) = v31;
  v32[40] = 0;
  sub_22D9628A4((uint64_t)v6, &qword_255DA7130);
  sub_22D9628DC((uint64_t)v12, v20, &qword_255DA7138);
  sub_22D962CD0(v20, v19, &qword_255DA7138);
  v33 = v41;
  *a2 = v22;
  a2[1] = v33;
  a2[2] = v23;
  a2[3] = v21;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7160);
  sub_22D962CD0(v19, (uint64_t)a2 + *(int *)(v34 + 48), &qword_255DA7138);
  sub_22D96ADC0(v22, v33, v23, v21);
  sub_22D9628A4(v20, &qword_255DA7138);
  sub_22D9628A4(v19, &qword_255DA7138);
  sub_22D96AEC4(v22, v33, v23, v21);
}

void sub_22D968498(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
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
  unsigned __int8 v44;
  uint64_t v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7168);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v42 = (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  v14 = *(unsigned __int8 *)(a1 + 20);
  if (*(_BYTE *)(a1 + 20))
  {
    sub_22D975F2C();
    v41 = 1;
    sub_22D975AAC();
    v39 = v44;
    v40 = v43;
    v37 = v46;
    v38 = v45;
    v35 = v48;
    v36 = v47;
  }
  else
  {
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v37 = 0;
    v35 = 0;
  }
  *(_QWORD *)v11 = sub_22D975BB4();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7170);
  sub_22D968D24(v3, a1, (uint64_t)&v11[*(int *)(v15 + 44)]);
  sub_22D9628DC((uint64_t)v11, (uint64_t)v13, &qword_255DA7168);
  v16 = *(unsigned __int8 *)(a1 + 19);
  if (*(_BYTE *)(a1 + 19))
  {
    sub_22D975F2C();
    v34 = 1;
    sub_22D975AAC();
    v33 = v49;
    v32 = v50;
    v17 = v51;
    v18 = v52;
    v20 = v53;
    v19 = v54;
  }
  else
  {
    v34 = 0;
    v33 = 0;
    v32 = 0;
    v17 = 0;
    v18 = 0;
    v20 = 0;
    v19 = 0;
  }
  v21 = v16 == 0;
  v22 = v14 == 0;
  v23 = v42;
  sub_22D962CD0((uint64_t)v13, v42, &qword_255DA7168);
  v24 = v41;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v24;
  v25 = v39;
  *(_QWORD *)(a2 + 16) = v40;
  *(_QWORD *)(a2 + 24) = v25;
  v26 = v37;
  *(_QWORD *)(a2 + 32) = v38;
  *(_QWORD *)(a2 + 40) = v26;
  v27 = v35;
  *(_QWORD *)(a2 + 48) = v36;
  *(_QWORD *)(a2 + 56) = v27;
  *(_BYTE *)(a2 + 64) = v22;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7178);
  sub_22D962CD0(v23, a2 + *(int *)(v28 + 48), &qword_255DA7168);
  v29 = a2 + *(int *)(v28 + 64);
  v30 = v34;
  *(_QWORD *)v29 = 0;
  *(_QWORD *)(v29 + 8) = v30;
  v31 = v32;
  *(_QWORD *)(v29 + 16) = v33;
  *(_QWORD *)(v29 + 24) = v31;
  *(_QWORD *)(v29 + 32) = v17;
  *(_QWORD *)(v29 + 40) = v18;
  *(_QWORD *)(v29 + 48) = v20;
  *(_QWORD *)(v29 + 56) = v19;
  *(_BYTE *)(v29 + 64) = v21;
  sub_22D9628A4((uint64_t)v13, &qword_255DA7168);
  sub_22D9628A4(v23, &qword_255DA7168);
}

void sub_22D968778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  uint64_t v38;
  id v39;
  unsigned int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  char v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v86 = a7;
  v88 = a1;
  v11 = sub_22D975998();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(a5, sel_string);
  if (!v15)
  {
    __break(1u);
    return;
  }
  v87 = v15;
  v16 = objc_msgSend(v15, sel_substringWithRange_, a2, a3);
  v17 = sub_22D976004();
  v19 = v18;

  *(_QWORD *)&v90 = v17;
  *((_QWORD *)&v90 + 1) = v19;
  sub_22D975980();
  v85 = sub_22D962840();
  v20 = sub_22D976130();
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0)
    v23 = v20 & 0xFFFFFFFFFFFFLL;
  if (v23)
  {
    v24 = *(_QWORD *)a6;
    v25 = *(_QWORD *)(a6 + 8);
    v26 = *(_BYTE *)(a6 + 16);
    sub_22D966B34(*(_QWORD *)a6, v25, v26);
    swift_bridgeObjectRetain();
    v27 = sub_22D975D94();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    swift_bridgeObjectRelease();
    sub_22D9663A8(v24, v25, v26);
    swift_bridgeObjectRelease();
    v34 = *(_QWORD *)a6;
    v35 = *(_QWORD *)(a6 + 8);
    v36 = *(_BYTE *)(a6 + 16);
    *(_QWORD *)a6 = v27;
    *(_QWORD *)(a6 + 8) = v29;
    *(_BYTE *)(a6 + 16) = v31 & 1;
    *(_QWORD *)(a6 + 24) = v33;
    sub_22D9663A8(v34, v35, v36);
  }
  swift_bridgeObjectRelease();
  v37 = (id)*MEMORY[0x24BE07F90];
  v38 = v88;
  sub_22D961540((uint64_t)v37, v88, &v90);

  if (!v91)
    goto LABEL_13;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v39 = (id)*MEMORY[0x24BE07F98];
    sub_22D961540((uint64_t)v39, v38, &v90);

    if (v91)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        if ((unint64_t)v89 > 2)
          v40 = (unsigned int *)MEMORY[0x24BDF40B8];
        else
          v40 = (unsigned int *)qword_24F978010[(_QWORD)v89];
        v41 = sub_22D975EB4();
        v42 = *(_QWORD *)(v41 - 8);
        v43 = v86;
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v86, v41);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v42 + 104))(v43, *v40, v41);
        v44 = sub_22D975E9C();
        swift_retain();
        v45 = sub_22D975DD0();
        v47 = v46;
        v49 = v48;
        v86 = v50;
        v51 = (id)*MEMORY[0x24BE07F88];
        sub_22D961540((uint64_t)v51, v38, &v90);

        v84 = v44;
        if (v91)
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v52 = *(_QWORD *)a6;
            v53 = *(_QWORD *)(a6 + 8);
            v54 = *(_BYTE *)(a6 + 16);
            v81 = v54;
            v90 = v89;
            sub_22D966B34(v52, v53, v54);
            swift_bridgeObjectRetain();
            v55 = sub_22D975D88();
            v80 = v47;
            v56 = v55;
            v79 = v45;
            v58 = v57;
            v60 = v59;
            swift_bridgeObjectRelease();
            v61 = v60 & 1;
            v62 = v81;
            v85 = sub_22D975D94();
            v83 = v63;
            v82 = v64;
            v88 = v65;
            swift_release();
            sub_22D9663A8(v79, v80, v49 & 1);

            swift_bridgeObjectRelease();
            sub_22D9663A8(v56, v58, v61);
            swift_bridgeObjectRelease();
            sub_22D9663A8(v52, v53, v62);
            swift_bridgeObjectRelease();
            v66 = *(_QWORD *)a6;
            v67 = *(_QWORD *)(a6 + 8);
            v68 = *(_BYTE *)(a6 + 16);
            v69 = v83;
            *(_QWORD *)a6 = v85;
            *(_QWORD *)(a6 + 8) = v69;
            v70 = v82;
LABEL_23:
            *(_BYTE *)(a6 + 16) = v70 & 1;
            *(_QWORD *)(a6 + 24) = v88;
            sub_22D9663A8(v66, v67, v68);
            swift_bridgeObjectRelease();
            return;
          }
        }
        else
        {
          sub_22D9628A4((uint64_t)&v90, &qword_253F34C88);
        }
        v71 = *(_QWORD *)a6;
        v72 = *(_QWORD *)(a6 + 8);
        v73 = *(_BYTE *)(a6 + 16);
        sub_22D966B34(*(_QWORD *)a6, v72, v73);
        swift_bridgeObjectRetain();
        v85 = sub_22D975D94();
        v75 = v74;
        LODWORD(v83) = v76;
        v88 = v77;
        swift_release();
        sub_22D9663A8(v45, v47, v49 & 1);

        swift_bridgeObjectRelease();
        sub_22D9663A8(v71, v72, v73);
        swift_bridgeObjectRelease();
        v66 = *(_QWORD *)a6;
        v67 = *(_QWORD *)(a6 + 8);
        v68 = *(_BYTE *)(a6 + 16);
        *(_QWORD *)a6 = v85;
        *(_QWORD *)(a6 + 8) = v75;
        v70 = v83;
        goto LABEL_23;
      }
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
LABEL_13:

    sub_22D9628A4((uint64_t)&v90, &qword_253F34C88);
    return;
  }
LABEL_15:

}

void sub_22D968D24(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  id v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  id v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  double v84;
  double v85;
  char v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  double v133;
  double v134;
  char v135;
  _BYTE v136[128];
  _OWORD v137[8];
  uint64_t v138;
  uint64_t aBlock;
  uint64_t v140;
  uint64_t (*v141)(uint64_t);
  void *v142;
  void (*v143)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v144;

  v123 = a1;
  v108 = a3;
  v4 = sub_22D975EA8();
  v102 = *(_QWORD *)(v4 - 8);
  v103 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v101 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34BE0);
  MEMORY[0x24BDAC7A8](v112);
  v113 = (uint64_t *)((char *)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_22D975EB4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v132 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v101 - v11;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B40);
  MEMORY[0x24BDAC7A8](v116);
  v114 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7060);
  MEMORY[0x24BDAC7A8](v14);
  v115 = (char *)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7068);
  MEMORY[0x24BDAC7A8](v16);
  v119 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7180);
  MEMORY[0x24BDAC7A8](v117);
  v121 = (uint64_t)&v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7188);
  MEMORY[0x24BDAC7A8](v118);
  v122 = (uint64_t)&v101 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7190);
  MEMORY[0x24BDAC7A8](v120);
  v125 = (char *)&v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7198);
  MEMORY[0x24BDAC7A8](v129);
  v109 = (uint64_t)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA71A0);
  v130 = *(_QWORD *)(v22 - 8);
  v131 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v128 = (char *)&v101 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA71A8);
  v24 = MEMORY[0x24BDAC7A8](v127);
  v107 = (uint64_t)&v101 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v126 = (char *)&v101 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v101 - v28;
  v124 = a2;
  v30 = *(void **)(a2 + 24);
  v137[0] = xmmword_22D977380;
  LOBYTE(v137[1]) = 0;
  *((_QWORD *)&v137[1] + 1) = MEMORY[0x24BEE4AF8];
  v31 = *MEMORY[0x24BDF40B8];
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v110 = v7;
  v32(v12, v31, v7);
  v33 = objc_msgSend(v30, sel_length);
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = v30;
  v34[3] = v137;
  v34[4] = v12;
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_22D96AF18;
  *(_QWORD *)(v35 + 24) = v34;
  v111 = v34;
  v143 = sub_22D966388;
  v144 = v35;
  aBlock = MEMORY[0x24BDAC760];
  v140 = 1107296256;
  v141 = sub_22D9717AC;
  v142 = &block_descriptor_0;
  v36 = _Block_copy(&aBlock);
  v37 = v30;
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_enumerateAttributesInRange_options_usingBlock_, 0, v33, 0, v36);
  _Block_release(v36);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v33 & 1) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v105 = v12;
  v106 = v29;
  v38 = v137[0];
  v39 = v137[1];
  v40 = *((_QWORD *)&v137[1] + 1);
  v104 = v8;
  v41 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v42 = v132;
  v43 = v110;
  v41(v132, v12, v110);
  KeyPath = swift_getKeyPath();
  v45 = v113;
  v41((char *)v113 + *(int *)(v112 + 28), v42, v43);
  *v45 = KeyPath;
  v46 = (uint64_t)v114;
  sub_22D962CD0((uint64_t)v45, (uint64_t)&v114[*(int *)(v116 + 36)], &qword_253F34BE0);
  *(_OWORD *)v46 = v38;
  *(_BYTE *)(v46 + 16) = v39;
  *(_QWORD *)(v46 + 24) = v40;
  swift_bridgeObjectRetain();
  sub_22D966B34(v38, *((uint64_t *)&v38 + 1), v39);
  swift_bridgeObjectRetain();
  sub_22D966B34(v38, *((uint64_t *)&v38 + 1), v39);
  sub_22D9628A4((uint64_t)v45, &qword_253F34BE0);
  v47 = *(void (**)(char *, uint64_t))(v104 + 8);
  v47(v132, v43);
  sub_22D9663A8(v38, *((uint64_t *)&v38 + 1), v39);
  swift_bridgeObjectRelease();
  v47(v105, v43);
  sub_22D9663A8(*(uint64_t *)&v137[0], *((uint64_t *)&v137[0] + 1), v137[1]);
  swift_release();
  swift_bridgeObjectRelease();
  v48 = v124;
  sub_22D96AFDC();
  v49 = (uint64_t)v115;
  sub_22D975E24();
  sub_22D9628A4(v46, &qword_253F34B40);
  v50 = *(_BYTE *)(v123 + 16);
  if ((v50 & 1) != 0)
    sub_22D975F2C();
  else
    sub_22D975F38();
  v51 = (uint64_t)v125;
  v52 = (uint64_t)v119;
  sub_22D961C9C();
  sub_22D9628A4(v49, &qword_255DA7060);
  v53 = swift_getKeyPath();
  v54 = v121;
  sub_22D962CD0(v52, v121, &qword_255DA7068);
  v55 = v54 + *(int *)(v117 + 36);
  *(_QWORD *)v55 = v53;
  *(_BYTE *)(v55 + 8) = 0;
  sub_22D9628A4(v52, &qword_255DA7068);
  v56 = sub_22D969B1C(v48);
  v57 = swift_getKeyPath();
  v58 = v122;
  sub_22D962CD0(v54, v122, &qword_255DA7180);
  v59 = (uint64_t *)(v58 + *(int *)(v118 + 36));
  *v59 = v57;
  v59[1] = v56;
  sub_22D9628A4(v54, &qword_255DA7180);
  v60 = sub_22D975E54();
  v61 = sub_22D975F2C();
  v63 = v62;
  sub_22D962CD0(v58, v51, &qword_255DA7188);
  v64 = (uint64_t *)(v51 + *(int *)(v120 + 36));
  *v64 = v60;
  v64[1] = v61;
  v64[2] = v63;
  sub_22D9628A4(v58, &qword_255DA7188);
  v65 = (uint64_t)v106;
  if (*(_BYTE *)(v48 + 17) != 1)
  {
    swift_retain();
    v72 = sub_22D966284();
    swift_release();
    v66 = v129;
    goto LABEL_11;
  }
  v66 = v129;
  if ((v50 & 1) == 0)
  {
    v72 = sub_22D975E60();
LABEL_11:
    v73 = swift_getKeyPath();
    v70 = v109;
    sub_22D962CD0(v51, v109, &qword_255DA7190);
    v74 = (uint64_t *)(v70 + *(int *)(v66 + 36));
    *v74 = v73;
    v74[1] = v72;
    sub_22D9628A4(v51, &qword_255DA7190);
    if (*(_BYTE *)(v48 + 16) != 1)
      goto LABEL_8;
    goto LABEL_12;
  }
  v67 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v68 = MEMORY[0x22E31CA58](v67);
  v69 = swift_getKeyPath();
  v70 = v109;
  sub_22D962CD0(v51, v109, &qword_255DA7190);
  v71 = (uint64_t *)(v70 + *(int *)(v66 + 36));
  *v71 = v69;
  v71[1] = v68;
  sub_22D9628A4(v51, &qword_255DA7190);
  if ((*(_BYTE *)(v48 + 16) & 1) == 0)
  {
LABEL_8:
    sub_22D975CC8();
    goto LABEL_13;
  }
LABEL_12:
  sub_22D975CD4();
LABEL_13:
  sub_22D96B108();
  v75 = v128;
  sub_22D975E00();
  sub_22D9628A4(v70, &qword_255DA7198);
  v77 = v130;
  v76 = v131;
  v78 = (uint64_t)v126;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v126, v75, v131);
  *(_WORD *)(v78 + *(int *)(v127 + 36)) = 256;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v75, v76);
  sub_22D9628DC(v78, v65, &qword_255DA71A8);
  v138 = 0;
  v133 = 0.0;
  v134 = 0.0;
  v135 = 1;
  v79 = *(void **)(v48 + 24);
  v80 = objc_msgSend(v79, sel_length);
  v81 = swift_allocObject();
  *(_QWORD *)(v81 + 16) = &v138;
  *(_QWORD *)(v81 + 24) = &v133;
  v82 = swift_allocObject();
  *(_QWORD *)(v82 + 16) = sub_22D96B440;
  *(_QWORD *)(v82 + 24) = v81;
  v143 = sub_22D96B738;
  v144 = v82;
  aBlock = MEMORY[0x24BDAC760];
  v140 = 1107296256;
  v141 = sub_22D9717AC;
  v142 = &block_descriptor_32;
  v83 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v79, sel_enumerateAttributesInRange_options_usingBlock_, 0, v80, 0, v83);
  _Block_release(v83);
  LOBYTE(v79) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v79 & 1) != 0)
  {
LABEL_22:
    __break(1u);
    return;
  }
  if (v138)
  {
    v84 = v133;
    v85 = v134;
    v86 = v135;
    swift_release();
    if ((v86 & 1) != 0)
    {
      v88 = v101;
      v87 = v102;
      v89 = v103;
      (*(void (**)(char *, _QWORD, uint64_t))(v102 + 104))(v101, *MEMORY[0x24BDF3FD0], v103);
      swift_retain();
      v90 = sub_22D975EC0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v89);
      aBlock = v90;
      sub_22D96B554((uint64_t)&aBlock);
    }
    else
    {
      v93 = v101;
      v92 = v102;
      v94 = v103;
      (*(void (**)(char *, _QWORD, uint64_t))(v102 + 104))(v101, *MEMORY[0x24BDF3FD0], v103);
      swift_retain();
      v95 = sub_22D975EC0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v94);
      v96 = sub_22D975F2C();
      ((void (*)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _BYTE, _QWORD, _BYTE, _QWORD, _QWORD, _QWORD))sub_22D961CD0)(&aBlock, 0, 1, 0, 1, v84 * (16.0 / v85), 0, 0, 1, 0, 1, 0x4030000000000000, 0, v96, v97, v95);
      swift_release();
      sub_22D96B5C4((uint64_t)&aBlock);
    }
    sub_22D9628DC((uint64_t)&aBlock, (uint64_t)v137, &qword_255DA71F0);
    swift_retain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA71F8);
    sub_22D96B560();
    sub_22D975C08();
    swift_release_n();
    swift_release();
    memcpy(v137, v136, 0x79uLL);
    memcpy(v136, v137, 0x79uLL);
    nullsub_1(v136);
    v91 = v136;
  }
  else
  {
    swift_release();
    sub_22D96B44C((uint64_t)v137);
    v91 = v137;
  }
  sub_22D9628DC((uint64_t)v91, (uint64_t)&aBlock, &qword_255DA71E0);
  v98 = v107;
  sub_22D962CD0(v65, v107, &qword_255DA71A8);
  sub_22D9628DC((uint64_t)&aBlock, (uint64_t)&v133, &qword_255DA71E0);
  v99 = v108;
  sub_22D962CD0(v98, v108, &qword_255DA71A8);
  v100 = v99 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA71E8) + 48);
  sub_22D9628DC((uint64_t)&v133, (uint64_t)v136, &qword_255DA71E0);
  sub_22D9628DC((uint64_t)v136, v100, &qword_255DA71E0);
  sub_22D96B4B0((uint64_t)v136, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_22D96B470);
  sub_22D9628A4(v65, &qword_255DA71A8);
  sub_22D9628DC((uint64_t)&v133, (uint64_t)v137, &qword_255DA71E0);
  sub_22D96B4B0((uint64_t)v137, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_22D96B514);
  sub_22D9628A4(v98, &qword_255DA71A8);
}

uint64_t sub_22D969B1C(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_22D969B3C + 4 * byte_22D976F2C[*(unsigned __int8 *)(a1 + 18)]))();
}

uint64_t sub_22D969B3C@<X0>(char a1@<W8>)
{
  if ((a1 & 1) != 0)
    return sub_22D975C98();
  else
    return sub_22D975D04();
}

uint64_t sub_22D969B54()
{
  unint64_t v0;

  v0 = sub_22D976190();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

void sub_22D969B9C(uint64_t a1@<X8>)
{
  const void *v1;
  _BYTE __dst[65];

  memcpy(__dst, v1, sizeof(__dst));
  sub_22D968074(a1);
}

uint64_t sub_22D969BDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22D969C10 + 4 * byte_22D976F30[a1]))(0x746C7561666564, 0xE700000000000000);
}

uint64_t sub_22D969C10()
{
  return 0x65746F6E746F6F66;
}

uint64_t sub_22D969C28()
{
  return 0x656E696C64616568;
}

uint64_t sub_22D969C40()
{
  return 0x656772616CLL;
}

void sub_22D969C54()
{
  OUTLINED_FUNCTION_11_1();
  sub_22D9761C0();
  sub_22D9761D8();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D969C88(char *a1)
{
  sub_22D967130(*a1);
}

void sub_22D969C94()
{
  sub_22D96D0F0();
}

void sub_22D969C9C(uint64_t a1)
{
  char *v1;

  sub_22D9672F0(a1, *v1);
}

void sub_22D969CA4()
{
  sub_22D96D150();
}

uint64_t sub_22D969CAC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D969B54();
  *a1 = result;
  return result;
}

uint64_t sub_22D969CD8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22D969BDC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22D969D00()
{
  sub_22D969C54();
}

void sub_22D969D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  id v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;

  if (!*(_QWORD *)(a1 + 16))
  {
    v39 = 0u;
    v40 = 0u;
    goto LABEL_11;
  }
  v9 = (id)*MEMORY[0x24BE07F18];
  v10 = sub_22D962318((uint64_t)v9);
  if ((v11 & 1) == 0)
  {
    v39 = 0u;
    v40 = 0u;

    goto LABEL_11;
  }
  sub_22D9622DC(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v39);

  if (!*((_QWORD *)&v40 + 1))
  {
LABEL_11:
    sub_22D9628A4((uint64_t)&v39, &qword_253F34C88);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_22D966800(0, (unint64_t *)&qword_255DA7090);
    v12 = qword_255DA6FA8;
    swift_bridgeObjectRetain();
    if (v12 != -1)
      swift_once();
    v13 = (void *)qword_255DA8C10;
    v14 = (id)qword_255DA8C10;
    v15 = sub_22D965208(v37, v38, v13);
    if (v15)
    {
      v16 = v15;
      v17 = v14;
      *a5 = sub_22D975ED8();
      swift_release();
      objc_msgSend(v16, sel_size);
      v19 = v18;
      objc_msgSend(v16, sel_scale);
      v21 = v19 / v20;
      objc_msgSend(v16, sel_size);
      v23 = v22;
      objc_msgSend(v16, sel_scale);
      v25 = v24;

      *(double *)a6 = v21;
      *(double *)(a6 + 8) = v23 / v25;
      *(_BYTE *)(a6 + 16) = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  if (*a5)
    return;
  v26 = (id)*MEMORY[0x24BE07EF0];
  sub_22D961540((uint64_t)v26, a1, &v39);

  if (!*((_QWORD *)&v40 + 1))
    goto LABEL_26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34BF0);
  if ((swift_dynamicCast() & 1) == 0)
    return;
  v27 = sub_22D976004();
  sub_22D9614F4(v27, v28, v37, &v39);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v40 + 1))
  {
    swift_bridgeObjectRelease();
LABEL_26:
    sub_22D9628A4((uint64_t)&v39, &qword_253F34C88);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v29 = sub_22D976004();
  sub_22D9614F4(v29, v30, v37, &v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v40 + 1))
  {
    sub_22D963F94(v37, v38);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) != 0
    && (sub_22D966800(0, (unint64_t *)&qword_255DA7090),
        sub_22D963F50(v37, v38),
        (v31 = sub_22D96F7F0(v37, v38, *(double *)&v37)) != 0))
  {
    v32 = v31;
    *a5 = sub_22D975E84();
    swift_release();
    objc_msgSend(v32, sel_size);
    v34 = v33 / *(double *)&v37;
    objc_msgSend(v32, sel_size);
    v36 = v35;
    sub_22D963F94(v37, v38);

    *(double *)a6 = v34;
    *(double *)(a6 + 8) = v36 / *(double *)&v37;
    *(_BYTE *)(a6 + 16) = 0;
  }
  else
  {
    sub_22D963F94(v37, v38);
  }
}

void sub_22D96A0E4(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if ((v4 || (sub_22D97619C() & 1) != 0)
    && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(a2 + 17)
    && (sub_22D967130(*(_BYTE *)(a1 + 18)), (v5 & 1) != 0)
    && *(unsigned __int8 *)(a1 + 19) == *(unsigned __int8 *)(a2 + 19)
    && *(unsigned __int8 *)(a1 + 20) == *(unsigned __int8 *)(a2 + 20)
    && (sub_22D966800(0, &qword_253F34C60), (sub_22D976100() & 1) != 0))
  {
    type metadata accessor for FlexListItem();
    sub_22D975A1C();
  }
  else
  {
    OUTLINED_FUNCTION_4_2();
  }
}

void sub_22D96A1D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;

  v2 = v1;
  sub_22D9761CC();
  sub_22D9761CC();
  sub_22D9672F0(a1, *(_BYTE *)(v2 + 18));
  sub_22D9761C0();
  sub_22D9761C0();
  v4 = *(id *)(v2 + 24);
  sub_22D97610C();

}

void sub_22D96A244()
{
  _BYTE v0[72];

  OUTLINED_FUNCTION_11_1();
  sub_22D96A1D0((uint64_t)v0);
  sub_22D9761D8();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_22D96A278()
{
  _BYTE v1[72];

  sub_22D9761B4();
  sub_22D96A1D0((uint64_t)v1);
  return sub_22D9761D8();
}

uint64_t sub_22D96A2B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for FlexListItem() + 44);
  v4 = OUTLINED_FUNCTION_9_2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void sub_22D96A2F8()
{
  sub_22D96B408(&qword_255DA7110, (void (*)(uint64_t))type metadata accessor for FlexListItem);
}

uint64_t type metadata accessor for FlexListItem()
{
  uint64_t result;

  result = qword_253F34AD0;
  if (!qword_253F34AD0)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_22D96A35C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  id v12;
  uint64_t v13;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
    v6 = (void *)a2[3];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(int *)(a3 + 44);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = sub_22D975A34();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v12 = v6;
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_22D96A41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_22D975A34();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_22D96A46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(int *)(a3 + 44);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D975A34();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_22D96A500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v6 = *(void **)(a2 + 24);
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  v8 = v6;

  v9 = *(int *)(a3 + 44);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_22D975A34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_22D96A5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 44);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_22D975A34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_22D96A62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_WORD *)(a1 + 19) = *(_WORD *)(a2 + 19);
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  v8 = *(int *)(a3 + 44);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_22D975A34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_22D96A6C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22D96A6D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_4_2();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_9_2();
    __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 44), a2, v6);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_22D96A748()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D96A754(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_9_2();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t sub_22D96A7BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D975A34();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for FlexListItem.Spacing()
{
  OUTLINED_FUNCTION_13_0();
}

void type metadata accessor for FlexListItem.Size()
{
  OUTLINED_FUNCTION_13_0();
}

unint64_t sub_22D96A87C()
{
  unint64_t result;

  result = qword_255DA7118;
  if (!qword_255DA7118)
  {
    result = MEMORY[0x22E31D184](&unk_22D9770C0, &unk_24F977DC8);
    atomic_store(result, (unint64_t *)&qword_255DA7118);
  }
  return result;
}

unint64_t sub_22D96A8BC()
{
  unint64_t result;

  result = qword_255DA7120;
  if (!qword_255DA7120)
  {
    result = MEMORY[0x22E31D184](&unk_22D977128, &unk_24F977D38);
    atomic_store(result, (unint64_t *)&qword_255DA7120);
  }
  return result;
}

uint64_t sub_22D96A900(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D96A944(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D96A988(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D96A9C4(uint64_t a1)
{
  void *v2;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 24);
    swift_bridgeObjectRelease();

  }
  return swift_release();
}

uint64_t sub_22D96AA08(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  __int128 v10;
  char v11;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = v4;
  swift_bridgeObjectRetain();
  if (v6)
  {
    v8 = *(void **)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    v9 = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v10;
  }
  v11 = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = v11;
  swift_retain();
  return a1;
}

uint64_t sub_22D96AAA4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  char v17;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = (_OWORD *)(a1 + 24);
  v8 = (_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    if (v9)
    {
      v10 = *(void **)(a1 + 24);
      v11 = *(void **)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v11;
      v12 = v11;

      *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
      *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_22D96ABDC((id *)(a1 + 24));
      v15 = *(_OWORD *)(a2 + 40);
      *v7 = *v8;
      *(_OWORD *)(a1 + 40) = v15;
    }
  }
  else if (v9)
  {
    v13 = *(void **)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v13;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    v14 = v13;
    swift_bridgeObjectRetain();
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 40);
    *v7 = *v8;
    *(_OWORD *)(a1 + 40) = v16;
  }
  v17 = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = v17;
  swift_retain();
  swift_release();
  return a1;
}

id *sub_22D96ABDC(id *a1)
{
  destroy for LeadingItem(a1);
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t sub_22D96AC18(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  char v8;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 48))
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 48);
  if (!v5)
  {
    sub_22D96ABDC((id *)(a1 + 24));
LABEL_5:
    v7 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v7;
    goto LABEL_6;
  }
  v6 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = v8;
  swift_release();
  return a1;
}

uint64_t sub_22D96ACE0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 65))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D96AD20(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for FlexListItemView()
{
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_22D96AD80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D96AD90(uint64_t a1)
{
  sub_22D96ADC0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return a1;
}

void *sub_22D96ADC0(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;

  if (a4)
  {
    v4 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22D96ADEC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 64))
  {

    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_deallocObject();
}

void sub_22D96AE38(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22D968498(a1, a2);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96AE54(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)a1;
  swift_bridgeObjectRetain();
  sub_22D96ADC0(v2, v3, v4, v5);
  swift_retain();
  return a1;
}

void sub_22D96AEC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_22D96AEF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D96AF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_22D968778(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_22D96AF40()
{
  sub_22D975B00();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96AF5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_22D975EB4();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22D975B0C();
}

unint64_t sub_22D96AFDC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_253F34B38;
  if (!qword_253F34B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34B40);
    sub_22D96B6C0(&qword_253F34BD8, &qword_253F34BE0);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_253F34B38);
  }
  return result;
}

void sub_22D96B068(uint64_t *a1@<X8>)
{
  *a1 = sub_22D975B60();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96B08C()
{
  swift_retain();
  return sub_22D975B6C();
}

void sub_22D96B0B8(uint64_t *a1@<X8>)
{
  *a1 = sub_22D975B30();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96B0DC()
{
  swift_retain();
  return sub_22D975B3C();
}

unint64_t sub_22D96B108()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA71B0;
  if (!qword_255DA71B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7198);
    v2 = sub_22D96B18C();
    sub_22D96B6C0(&qword_253F34BC8, &qword_253F34BD0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA71B0);
  }
  return result;
}

unint64_t sub_22D96B18C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA71B8;
  if (!qword_255DA71B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7190);
    v2 = sub_22D96B210();
    sub_22D96B6C0(&qword_253F34B98, &qword_253F34BA0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA71B8);
  }
  return result;
}

unint64_t sub_22D96B210()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA71C0;
  if (!qword_255DA71C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7188);
    v2 = sub_22D96B294();
    sub_22D96B6C0(&qword_253F34BB8, &qword_253F34BC0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA71C0);
  }
  return result;
}

unint64_t sub_22D96B294()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA71C8;
  if (!qword_255DA71C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7180);
    v2 = sub_22D96B318();
    sub_22D96B6C0(&qword_253F34BA8, &qword_253F34BB0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA71C8);
  }
  return result;
}

unint64_t sub_22D96B318()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA71D0;
  if (!qword_255DA71D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7068);
    v2[0] = sub_22D96B384();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA71D0);
  }
  return result;
}

unint64_t sub_22D96B384()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA71D8;
  if (!qword_255DA71D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7060);
    v2 = sub_22D96AFDC();
    sub_22D96B408(&qword_255DA7048, (void (*)(uint64_t))MEMORY[0x24BDF1088]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA71D8);
  }
  return result;
}

void sub_22D96B408(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_10_1();
  }
  OUTLINED_FUNCTION_5();
}

void sub_22D96B440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_22D969D08(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

double sub_22D96B44C(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 112) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_BYTE *)(a1 + 120) = -1;
  return result;
}

uint64_t sub_22D96B470(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255)
    return j__swift_retain(result, a2, a3, a4, a5, a6, a7);
  return result;
}

uint64_t sub_22D96B4B0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 120);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), v4);
  return a1;
}

uint64_t sub_22D96B514(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255)
    return j__swift_release(result, a2, a3, a4, a5, a6, a7);
  return result;
}

uint64_t sub_22D96B554(uint64_t result)
{
  *(_BYTE *)(result + 120) = 1;
  return result;
}

unint64_t sub_22D96B560()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA7200;
  if (!qword_255DA7200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA71F8);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA7200);
  }
  return result;
}

uint64_t sub_22D96B5C4(uint64_t result)
{
  *(_BYTE *)(result + 120) = 0;
  return result;
}

uint64_t sub_22D96B5CC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D96B618 + 4 * byte_22D976F39[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22D96B64C + 4 * byte_22D976F34[v4]))();
}

uint64_t sub_22D96B64C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96B654(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D96B65CLL);
  return result;
}

uint64_t sub_22D96B668(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D96B670);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22D96B674(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96B67C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for LeadingItemType()
{
  OUTLINED_FUNCTION_13_0();
}

void sub_22D96B694()
{
  sub_22D96B6C0(&qword_255DA7208, &qword_255DA7210);
}

void sub_22D96B6C0(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_10_1();
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_22D96B6F8()
{
  unint64_t result;

  result = qword_255DA7218;
  if (!qword_255DA7218)
  {
    result = MEMORY[0x22E31D184](&unk_22D977330, &unk_24F978000);
    atomic_store(result, (unint64_t *)&qword_255DA7218);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_22D9761C0();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_22D975A34();
}

void OUTLINED_FUNCTION_10_1()
{
  JUMPOUT(0x22E31D184);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_22D9761B4();
}

uint64_t destroy for FlexListView()
{
  return swift_bridgeObjectRelease();
}

void _s33AppleMediaServicesUIPaymentSheets12FlexListViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
}

uint64_t assignWithCopy for FlexListView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for FlexListView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlexListView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 10))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlexListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 10) = 1;
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
    *(_BYTE *)(result + 10) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FlexListView()
{
  return &type metadata for FlexListView;
}

uint64_t sub_22D96B918()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_22D96B928(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22D96B938()
{
  return sub_22D9761C0();
}

uint64_t sub_22D96B95C()
{
  sub_22D9761B4();
  sub_22D9761C0();
  return sub_22D9761D8();
}

BOOL sub_22D96B9A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22D96B928(*a1, *a2);
}

uint64_t sub_22D96B9AC()
{
  return sub_22D96B95C();
}

uint64_t sub_22D96B9B4()
{
  return sub_22D96B938();
}

void sub_22D96B9BC(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  char v3;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v3 = a2;
  v6 = HIBYTE(a2);
  v7 = a2 & 1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7220);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v3 & 1) != 0)
    v11 = sub_22D975BF0();
  else
    v11 = sub_22D975BFC();
  *(_QWORD *)v10 = v11;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7228);
  v12 = swift_bridgeObjectRetain();
  v13 = sub_22D96C13C(v12);
  swift_bridgeObjectRelease();
  v16[1] = v13;
  swift_getKeyPath();
  v14 = OUTLINED_FUNCTION_1_2();
  *(_QWORD *)(v14 + 16) = a1;
  *(_BYTE *)(v14 + 24) = v7;
  *(_BYTE *)(v14 + 25) = v6 & 1;
  v15 = OUTLINED_FUNCTION_1_2();
  *(_QWORD *)(v15 + 16) = sub_22D96C338;
  *(_QWORD *)(v15 + 24) = v14;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7230);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7238);
  sub_22D96C768(&qword_255DA7240, &qword_255DA7230, MEMORY[0x24BEE12D8]);
  sub_22D96C768(&qword_255DA7248, &qword_255DA7238, MEMORY[0x24BDF5428]);
  sub_22D975F14();
  sub_22D96C3EC((uint64_t)v10, a3, &qword_255DA7220);
}

void sub_22D96BB94(uint64_t a1@<X0>, void *a2@<X1>, __int16 a3@<W3>, uint64_t a4@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unsigned __int8 v23;
  char v24;
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
  char v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
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
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[2];
  char v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int8 v87;

  v74 = a4;
  v7 = sub_22D975F08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B58);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v72 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B60);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v79 = (uint64_t)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v78 = (uint64_t)&v72 - v20;
  v21 = objc_msgSend(a2, sel_label);
  LODWORD(v77) = a3 & 1;
  LOBYTE(a1) = sub_22D96C020(v21, a1, v22, a3 & 0x101);

  if ((a1 & 1) != 0)
  {
    sub_22D975EFC();
    v23 = sub_22D975C74();
    v24 = sub_22D975C80();
    sub_22D975C80();
    if (sub_22D975C80() != v23)
      v24 = sub_22D975C80();
    sub_22D975A70();
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
    v33 = &v14[*(int *)(v11 + 36)];
    *v33 = v24;
    *((_QWORD *)v33 + 1) = v26;
    *((_QWORD *)v33 + 2) = v28;
    *((_QWORD *)v33 + 3) = v30;
    *((_QWORD *)v33 + 4) = v32;
    v33[40] = 0;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_22D96C3EC((uint64_t)v14, (uint64_t)v16, &qword_253F34B58);
    v34 = v78;
    sub_22D96C3EC((uint64_t)v16, v78, &qword_253F34B58);
    v35 = 0;
  }
  else
  {
    v35 = 1;
    v34 = v78;
  }
  v36 = v77;
  __swift_storeEnumTagSinglePayload(v34, v35, 1, v11);
  v37 = objc_msgSend(a2, sel_label);
  v38 = objc_msgSend(a2, sel_image);
  v39 = objc_msgSend(a2, sel_accessibilityIdentifier);
  v40 = sub_22D976004();
  v42 = v41;

  sub_22D9673D8(v37, v38, v36, v40, v42, (uint64_t)v80);
  v43 = v80[1];
  v73 = (void *)v80[0];
  v44 = v81;
  v45 = v82;
  v46 = v83;
  v47 = v84;
  v48 = v85;
  v49 = v86;
  v75 = v87;
  LOBYTE(v37) = sub_22D975C74();
  v50 = sub_22D975C8C();
  v51 = sub_22D975C80();
  sub_22D975C80();
  if (sub_22D975C80() != v37)
    v51 = sub_22D975C80();
  sub_22D975C80();
  v52 = sub_22D975C80();
  v76 = v48;
  v77 = v49;
  v53 = v47;
  v54 = v46;
  v55 = v45;
  v56 = v73;
  if (v52 != v50)
    v51 = sub_22D975C80();
  v57 = v79;
  v58 = v74;
  sub_22D975A70();
  v60 = v59;
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v67 = v78;
  sub_22D96C3A4(v78, v57);
  sub_22D96C3A4(v57, v58);
  v68 = v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7250) + 48);
  *(_QWORD *)v68 = v56;
  *(_QWORD *)(v68 + 8) = v43;
  *(_BYTE *)(v68 + 16) = v44;
  *(_QWORD *)(v68 + 24) = v55;
  *(_QWORD *)(v68 + 32) = v54;
  v70 = v76;
  v69 = v77;
  *(_QWORD *)(v68 + 40) = v53;
  *(_QWORD *)(v68 + 48) = v70;
  *(_QWORD *)(v68 + 56) = v69;
  *(_BYTE *)(v68 + 64) = v75;
  *(_BYTE *)(v68 + 72) = v51;
  *(_QWORD *)(v68 + 80) = v60;
  *(_QWORD *)(v68 + 88) = v62;
  *(_QWORD *)(v68 + 96) = v64;
  *(_QWORD *)(v68 + 104) = v66;
  *(_BYTE *)(v68 + 112) = 0;
  v71 = v56;
  swift_bridgeObjectRetain();
  sub_22D96ADC0(v55, v54, v53, v70);
  swift_retain();
  sub_22D9628A4(v67, &qword_253F34B60);
  swift_bridgeObjectRelease();

  sub_22D96AEC4(v55, v54, v53, v70);
  swift_release();
  sub_22D9628A4(v79, &qword_253F34B60);
}

uint64_t sub_22D96C020(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned __int8 v8;
  __int128 v9;
  uint64_t v10;

  if (!a2)
    return (a4 >> 8) & 1;
  v4 = objc_msgSend(a1, sel_attributesAtIndex_effectiveRange_, 0, 0);
  type metadata accessor for Key(0);
  sub_22D96C42C();
  v5 = sub_22D975FBC();

  v6 = (id)*MEMORY[0x24BE07F10];
  sub_22D961540((uint64_t)v6, v5, &v9);

  swift_bridgeObjectRelease();
  if (v10)
  {
    if (swift_dynamicCast())
      return v8;
  }
  else
  {
    sub_22D9628A4((uint64_t)&v9, &qword_253F34C88);
  }
  return 1;
}

void sub_22D96C11C(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 9))
    v2 = 256;
  else
    v2 = 0;
  sub_22D96B9BC(*(_QWORD *)v1, v2 | *(unsigned __int8 *)(v1 + 8), a1);
}

uint64_t sub_22D96C13C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_33;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  for (result = swift_bridgeObjectRetain(); ; v2 = result)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v2)
      break;
    if (v2 < 1)
    {
      __break(1u);
      goto LABEL_35;
    }
    v5 = 0;
    v6 = 0;
    v7 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
    v8 = v1 & 0xC000000000000001;
    v25 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v8)
        v9 = (id)MEMORY[0x22E31CD40](v6, v1);
      else
        v9 = *(id *)(v1 + 8 * v6 + 32);
      v10 = v9;
      if (!v5)
      {
        v11 = v4[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_32;
        v12 = v1;
        v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1)
          v14 = 1;
        else
          v14 = v13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7258);
        v15 = (_QWORD *)swift_allocObject();
        v16 = (uint64_t)(_swift_stdlib_malloc_size(v15) - 32) / 16;
        v15[2] = v14;
        v15[3] = 2 * v16;
        v17 = (unint64_t)(v15 + 4);
        v18 = v4[3];
        v19 = v18 >> 1;
        if (v4[2])
        {
          if (v15 != v4 || v17 >= (unint64_t)&v4[2 * v19 + 4])
            memmove(v15 + 4, v4 + 4, 16 * v19);
          v4[2] = 0;
        }
        v7 = (_QWORD *)(v17 + 16 * v19);
        v5 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - (v18 >> 1);
        swift_release();
        v4 = v15;
        v1 = v12;
        v8 = v25;
      }
      v21 = __OFSUB__(v5--, 1);
      if (v21)
        break;
      *v7 = v6;
      v7[1] = v10;
      v7 += 2;
      if (v2 == ++v6)
        goto LABEL_27;
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    result = sub_22D976178();
  }
  v5 = 0;
LABEL_27:
  result = swift_bridgeObjectRelease();
  v22 = v4[3];
  if (v22 < 2)
    return (uint64_t)v4;
  v23 = v22 >> 1;
  v21 = __OFSUB__(v23, v5);
  v24 = v23 - v5;
  if (!v21)
  {
    v4[2] = v24;
    return (uint64_t)v4;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_22D96C314()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_22D96C338(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  __int16 v4;

  if (*(_BYTE *)(v3 + 25))
    v4 = 256;
  else
    v4 = 0;
  sub_22D96BB94(a1, a2, v4 | *(unsigned __int8 *)(v3 + 24), a3);
}

uint64_t sub_22D96C358()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D96C37C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_22D96C3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22D96C3EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

unint64_t sub_22D96C42C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F34C40;
  if (!qword_253F34C40)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x22E31D184](&unk_22D976900, v1);
    atomic_store(result, (unint64_t *)&qword_253F34C40);
  }
  return result;
}

uint64_t sub_22D96C46C(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(result + 16);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = result;
    result = swift_bridgeObjectRetain();
    v4 = 0;
    v5 = 0;
    v6 = v2 + 4;
    while (1)
    {
      v7 = *(_QWORD *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        result = OUTLINED_FUNCTION_2_2();
      }
      else
      {
        v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_28;
        v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        v10 = v9 <= 1 ? 1 : v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C80);
        v11 = (_QWORD *)OUTLINED_FUNCTION_1_2();
        v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        v13 = v11 + 4;
        v14 = v2[3] >> 1;
        v6 = &v11[2 * v14 + 4];
        v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v14;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= &v2[2 * v14 + 4])
            memmove(v13, v2 + 4, 16 * v14);
          OUTLINED_FUNCTION_2_2();
          v2[2] = 0;
        }
        else
        {
          OUTLINED_FUNCTION_2_2();
        }
        result = swift_release();
        v2 = v11;
      }
      v16 = __OFSUB__(v4--, 1);
      if (v16)
        break;
      *v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v4 = 0;
LABEL_23:
  v17 = v2[3];
  if (v17 < 2)
    return (uint64_t)v2;
  v18 = v17 >> 1;
  v16 = __OFSUB__(v18, v4);
  v19 = v18 - v4;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for PaymentRequestLayoutStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FlexListView.Layout(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D96C6B0 + 4 * byte_22D977395[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D96C6E4 + 4 * byte_22D977390[v4]))();
}

uint64_t sub_22D96C6E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96C6EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D96C6F4);
  return result;
}

uint64_t sub_22D96C700(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D96C708);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D96C70C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96C714(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22D96C720(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FlexListView.Layout()
{
  return &type metadata for FlexListView.Layout;
}

void sub_22D96C73C()
{
  sub_22D96C768(&qword_255DA7260, &qword_255DA7220, MEMORY[0x24BDF4700]);
}

void sub_22D96C768(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x22E31D184](a3, v5), a1);
  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_22D96C7A8()
{
  unint64_t result;

  result = qword_255DA7268;
  if (!qword_255DA7268)
  {
    result = MEMORY[0x22E31D184](&unk_22D977464, &type metadata for FlexListView.Layout);
    atomic_store(result, (unint64_t *)&qword_255DA7268);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for IconAdornmentMerchandizedIAPViewModifier()
{
  return &type metadata for IconAdornmentMerchandizedIAPViewModifier;
}

uint64_t sub_22D96C804()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D96C814@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7270);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  *(double *)(v12 + 16) = a3;
  *(double *)(v12 + 24) = a4;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *a2 = sub_22D96CFD4;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v12;
  return result;
}

uint64_t sub_22D96C8F8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *a2 = sub_22D975F2C();
  a2[1] = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7278);
  return sub_22D96C964(a1, (uint64_t *)((char *)a2 + *(int *)(v5 + 44)));
}

uint64_t sub_22D96C964@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  char *v3;
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
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  char *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v57 = a1;
  v67 = a2;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7280);
  MEMORY[0x24BDAC7A8](v60);
  v3 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7288);
  MEMORY[0x24BDAC7A8](v59);
  v65 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22D975C2C();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7290);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7298);
  MEMORY[0x24BDAC7A8](v58);
  v64 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA72A0);
  v12 = MEMORY[0x24BDAC7A8](v62);
  v56 = (uint64_t)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v66 = (uint64_t)&v56 - v14;
  v15 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v63 = MEMORY[0x22E31CA58](v15);
  sub_22D975AB8();
  v16 = &v7[*(int *)(v5 + 20)];
  v17 = *MEMORY[0x24BDEEB68];
  v18 = sub_22D975BCC();
  v19 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104);
  v19(v16, v17, v18);
  sub_22D975C14();
  *(_QWORD *)v7 = v20;
  *((_QWORD *)v7 + 1) = v21;
  *((_QWORD *)v7 + 2) = v22;
  *((_QWORD *)v7 + 3) = v23;
  v24 = (uint64_t)&v10[*(int *)(v8 + 36)];
  sub_22D96D028((uint64_t)v7, v24);
  *(_WORD *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA72A8) + 36)) = 256;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7270);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
  v61 = v10;
  v26(v10, v57, v25);
  sub_22D96D06C((uint64_t)v7);
  sub_22D975AB8();
  v19(&v7[*(int *)(v5 + 20)], v17, v18);
  sub_22D975C14();
  *(_QWORD *)v7 = v27;
  *((_QWORD *)v7 + 1) = v28;
  *((_QWORD *)v7 + 2) = v29;
  *((_QWORD *)v7 + 3) = v30;
  if (qword_255DA6FB0 != -1)
    swift_once();
  v31 = qword_255DA7088;
  swift_retain();
  sub_22D975A7C();
  v32 = v65;
  sub_22D96D028((uint64_t)v7, v65);
  v33 = *(double *)&v68 * 0.5;
  sub_22D96D028((uint64_t)v7, (uint64_t)v3);
  *(double *)&v3[*(int *)(sub_22D975C20() + 20)] = v33;
  v34 = &v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA72B0) + 36)];
  v35 = v69;
  *(_OWORD *)v34 = v68;
  *((_OWORD *)v34 + 1) = v35;
  *((_QWORD *)v34 + 4) = v70;
  v36 = v60;
  *(_QWORD *)&v3[*(int *)(v60 + 52)] = v31;
  *(_WORD *)&v3[*(int *)(v36 + 56)] = 256;
  v37 = sub_22D975F2C();
  v39 = v38;
  v40 = v32 + *(int *)(v59 + 68);
  v41 = (uint64_t *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA72B8) + 36));
  *v41 = v37;
  v41[1] = v39;
  sub_22D9628DC((uint64_t)v3, v40, &qword_255DA7280);
  sub_22D96D06C((uint64_t)v7);
  v42 = sub_22D975F2C();
  v44 = v43;
  v45 = (uint64_t)v64;
  v46 = (uint64_t)&v64[*(int *)(v58 + 36)];
  sub_22D962CD0(v32, v46, &qword_255DA7288);
  v47 = (uint64_t *)(v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA72C0) + 36));
  *v47 = v42;
  v47[1] = v44;
  v48 = (uint64_t)v61;
  sub_22D962CD0((uint64_t)v61, v45, &qword_255DA7290);
  sub_22D9628A4(v32, &qword_255DA7288);
  sub_22D9628A4(v48, &qword_255DA7290);
  sub_22D975AB8();
  sub_22D975AB8();
  sub_22D975F2C();
  sub_22D975AAC();
  v49 = v56;
  sub_22D962CD0(v45, v56, &qword_255DA7298);
  v50 = (_OWORD *)(v49 + *(int *)(v62 + 36));
  v51 = v72;
  *v50 = v71;
  v50[1] = v51;
  v50[2] = v73;
  sub_22D9628A4(v45, &qword_255DA7298);
  v52 = v66;
  sub_22D9628DC(v49, v66, &qword_255DA72A0);
  sub_22D962CD0(v52, v49, &qword_255DA72A0);
  v53 = v67;
  *v67 = v63;
  *((_WORD *)v53 + 4) = 256;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA72C8);
  sub_22D962CD0(v49, (uint64_t)v53 + *(int *)(v54 + 48), &qword_255DA72A0);
  swift_retain();
  sub_22D9628A4(v52, &qword_255DA72A0);
  sub_22D9628A4(v49, &qword_255DA72A0);
  return swift_release();
}

uint64_t sub_22D96CF50()
{
  return sub_22D975AA0();
}

uint64_t sub_22D96CF68@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  double *v2;

  return sub_22D96C814(a1, a2, *v2, v2[1]);
}

uint64_t sub_22D96CF70()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7270);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22D96CFD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7270) - 8) + 80);
  return sub_22D96C8F8(v1 + ((v3 + 32) & ~v3), a1);
}

uint64_t sub_22D96D028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D975C2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D96D06C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22D975C2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22D96D0AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA72D0;
  if (!qword_255DA72D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA72D8);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_255DA72D0);
  }
  return result;
}

void sub_22D96D0F0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10_2(v0);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D96D11C()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D96D144()
{
  sub_22D96D1A4();
}

void sub_22D96D150()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_2(v0);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D96D178()
{
  sub_22D9761B4();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D96D1A4()
{
  OUTLINED_FUNCTION_6_2();
  sub_22D97601C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_8_1();
}

unint64_t sub_22D96D210(unint64_t result)
{
  if (result >= 7)
    return 7;
  return result;
}

uint64_t getEnumTagSinglePayload for IconAdornmentStyle(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IconAdornmentStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_22D96D2F4 + 4 * byte_22D977515[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_22D96D328 + 4 * byte_22D977510[v4]))();
}

uint64_t sub_22D96D328(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96D330(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D96D338);
  return result;
}

uint64_t sub_22D96D344(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D96D34CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_22D96D350(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D96D358(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IconAdornmentStyle()
{
  return &type metadata for IconAdornmentStyle;
}

void sub_22D96D374()
{
  sub_22D96D11C();
}

uint64_t sub_22D96D38C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_22D96B740(a1, *v1);
}

void sub_22D96D394()
{
  sub_22D96D178();
}

unint64_t sub_22D96D3AC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_22D96D210(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22D96D3D4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_22D96708C(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_22D96D400()
{
  unint64_t result;

  result = qword_255DA72E0;
  if (!qword_255DA72E0)
  {
    result = MEMORY[0x22E31D184](&unk_22D9775AC, &type metadata for IconAdornmentStyle);
    atomic_store(result, (unint64_t *)&qword_255DA72E0);
  }
  return result;
}

void sub_22D96D43C(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
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
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v86 = a4;
  v87 = a2;
  v81 = a1;
  v80 = a3;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA72E8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_3();
  v12 = v11 - v10;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA72F0);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_6_1();
  v78 = v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA72F8);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2_3();
  v19 = v18 - v17;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7300);
  OUTLINED_FUNCTION_3_1();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v77 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v79 = (uint64_t)&v74 - v23;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7308);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_6_1();
  v84 = v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_2_3();
  v30 = v29 - v28;
  v31 = sub_22D975AE8();
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_2_3();
  v35 = (double *)(v34 - v33);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7310);
  OUTLINED_FUNCTION_3_1();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v39 = (uint64_t *)((char *)&v74 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v74 - v40;
  if (v80 == 1)
  {
    v42 = v87;
    v43 = sub_22D96DA18(v81, v87, 1u);
    v44 = sub_22D96DB48(a5, a6, v42, 1);
    v45 = (char *)v35 + *(int *)(v31 + 20);
    v46 = *MEMORY[0x24BDEEB68];
    v47 = sub_22D975BCC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 104))(v45, v46, v47);
    *v35 = v44;
    v35[1] = v44;
    sub_22D96DD38((uint64_t)v35, v30);
    *(_WORD *)(v30 + *(int *)(v26 + 36)) = 256;
    sub_22D962CD0(v30, (uint64_t)v39 + *(int *)(v82 + 36), &qword_253F34B30);
    *v39 = v43;
    swift_retain();
    sub_22D9628A4(v30, &qword_253F34B30);
    OUTLINED_FUNCTION_8_2();
    swift_release();
    sub_22D9628DC((uint64_t)v39, (uint64_t)v41, &qword_255DA7310);
    sub_22D962CD0((uint64_t)v41, v84, &qword_255DA7310);
    swift_storeEnumTagMultiPayload();
    sub_22D96DDB8();
    sub_22D96DE3C();
    sub_22D975C08();
    v48 = (uint64_t)v41;
    v49 = &qword_255DA7310;
  }
  else
  {
    v50 = sub_22D96DB48(a5, a6, v87, a3);
    v51 = (uint64_t)v35 + *(int *)(v31 + 20);
    sub_22D975BCC();
    OUTLINED_FUNCTION_11_2(v51);
    *v35 = v50;
    v35[1] = v50;
    v52 = *(int *)(v15 + 36);
    v74 = v19;
    v53 = v19 + v52;
    sub_22D96DD38((uint64_t)v35, v19 + v52);
    *(_WORD *)(v53 + *(int *)(v26 + 36)) = 256;
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7318);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(v19, v81, v54);
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_11_2((uint64_t)v35 + *(int *)(v31 + 20));
    *v35 = v50;
    v35[1] = v50;
    v55 = v87;
    swift_retain();
    sub_22D975A7C();
    v56 = v78;
    sub_22D96DD38((uint64_t)v35, v78);
    v57 = *(double *)&v88 * 0.5;
    sub_22D96DD38((uint64_t)v35, v12);
    *(double *)(v12 + *(int *)(sub_22D975ADC() + 20)) = v57;
    v58 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7320) + 36);
    v59 = v89;
    *(_OWORD *)v58 = v88;
    *(_OWORD *)(v58 + 16) = v59;
    *(_QWORD *)(v58 + 32) = v90;
    v60 = v76;
    *(_QWORD *)(v12 + *(int *)(v76 + 52)) = v55;
    *(_WORD *)(v12 + *(int *)(v60 + 56)) = 256;
    v61 = sub_22D975F2C();
    v63 = v62;
    v64 = v56 + *(int *)(v75 + 68);
    v65 = (uint64_t *)(v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7328) + 36));
    *v65 = v61;
    v65[1] = v63;
    sub_22D9628DC(v12, v64, &qword_255DA72E8);
    OUTLINED_FUNCTION_8_2();
    v66 = sub_22D975F2C();
    v68 = v67;
    v69 = (uint64_t)v77;
    v70 = (uint64_t)&v77[*(int *)(v85 + 36)];
    sub_22D962CD0(v56, v70, &qword_255DA72F0);
    v71 = (uint64_t *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7330) + 36));
    *v71 = v66;
    v71[1] = v68;
    v72 = v74;
    sub_22D962CD0(v74, v69, &qword_255DA72F8);
    sub_22D9628A4(v56, &qword_255DA72F0);
    sub_22D9628A4(v72, &qword_255DA72F8);
    v73 = v79;
    sub_22D9628DC(v69, v79, &qword_255DA7300);
    sub_22D962CD0(v73, v84, &qword_255DA7300);
    swift_storeEnumTagMultiPayload();
    sub_22D96DDB8();
    sub_22D96DE3C();
    sub_22D975C08();
    v48 = v73;
    v49 = &qword_255DA7300;
  }
  sub_22D9628A4(v48, v49);
}

uint64_t sub_22D96DA18(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v4 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7318);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7360);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  if (v4 == 1)
  {
    v12(v11, a1, v5);
    *(_OWORD *)&v11[*(int *)(v9 + 36)] = xmmword_22D977650;
    sub_22D96DF5C();
  }
  else
  {
    v12(v8, a1, v5);
    sub_22D96C768(&qword_255DA7350, &qword_255DA7318, MEMORY[0x24BDEFB78]);
  }
  return sub_22D975EF0();
}

double sub_22D96DB48(double a1, double a2, uint64_t a3, char a4)
{
  double v4;
  double result;

  v4 = 0.5;
  result = 2.0;
  switch(a4)
  {
    case 1:
      return result;
    case 2:
    case 3:
    case 6:
      return v4 * a2;
    case 4:
      v4 = 0.22;
      return v4 * a2;
    default:
      v4 = 0.11;
      return v4 * a2;
  }
}

void sub_22D96DB94(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_22D96D43C(a1, *(_QWORD *)v2, *(_BYTE *)(v2 + 16), a2, *(double *)(v2 + 8), *(double *)(v2 + 24));
}

uint64_t initializeWithCopy for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconAdornmentViewModifier(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IconAdornmentViewModifier(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IconAdornmentViewModifier()
{
  return &type metadata for IconAdornmentViewModifier;
}

uint64_t sub_22D96DD28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D96DD38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D975AE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D96DD7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22D975AE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22D96DDB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA7338;
  if (!qword_255DA7338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7310);
    sub_22D96C768(&qword_253F34B28, &qword_253F34B30, MEMORY[0x24BDEB950]);
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA7338);
  }
  return result;
}

unint64_t sub_22D96DE3C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA7340;
  if (!qword_255DA7340)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7300);
    v2 = sub_22D96DEC0();
    sub_22D96C768(&qword_255DA7358, &qword_255DA7330, MEMORY[0x24BDEDC10]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA7340);
  }
  return result;
}

unint64_t sub_22D96DEC0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255DA7348;
  if (!qword_255DA7348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA72F8);
    sub_22D96C768(&qword_255DA7350, &qword_255DA7318, MEMORY[0x24BDEFB78]);
    v3 = v2;
    sub_22D96C768(&qword_253F34B28, &qword_253F34B30, MEMORY[0x24BDEB950]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255DA7348);
  }
  return result;
}

unint64_t sub_22D96DF5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA7368;
  if (!qword_255DA7368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7360);
    sub_22D96C768(&qword_255DA7350, &qword_255DA7318, MEMORY[0x24BDEFB78]);
    v3[0] = v2;
    v3[1] = sub_22D96DFE0();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA7368);
  }
  return result;
}

unint64_t sub_22D96DFE0()
{
  unint64_t result;

  result = qword_255DA7370;
  if (!qword_255DA7370)
  {
    result = MEMORY[0x22E31D184](&unk_22D9774BC, &type metadata for IconAdornmentMerchandizedIAPViewModifier);
    atomic_store(result, (unint64_t *)&qword_255DA7370);
  }
  return result;
}

unint64_t sub_22D96E020()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA7378;
  if (!qword_255DA7378)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7380);
    v2[0] = sub_22D96DDB8();
    v2[1] = sub_22D96DE3C();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA7378);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_22D9761D8();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_22D9761B4();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;

  return sub_22D96DD7C(v0);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_22D9761C0();
}

void OUTLINED_FUNCTION_10_2(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_22D9672F0((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

void *sub_22D96E0DC(void *a1, void *a2)
{
  id v3;
  id v4;
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
  unint64_t v15;
  char v16;
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
  id v28;
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
  unint64_t v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v3 = objc_msgSend(a1, sel_attributesAtIndex_effectiveRange_, 0, 0);
  type metadata accessor for Key(0);
  sub_22D96C42C();
  sub_22D975FBC();

  v4 = (id)*MEMORY[0x24BE07F20];
  OUTLINED_FUNCTION_1_3((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, v42, v46, v49);

  if (!v52)
  {
    OUTLINED_FUNCTION_4_3(v12, &qword_253F34C88, v13, v14);
    goto LABEL_5;
  }
  if (!swift_dynamicCast())
  {
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v15 = v43;
LABEL_6:
  v16 = sub_22D96707C(v15);
  if (v16 != 4 && v16)
  {
    v17 = (id)*MEMORY[0x24BE07F30];
    OUTLINED_FUNCTION_1_3((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24, v43, v47, v50);

    if (v52)
      OUTLINED_FUNCTION_0_3();
    else
      OUTLINED_FUNCTION_4_3(v25, &qword_253F34C88, v26, v27);
    v28 = (id)*MEMORY[0x24BE07F28];
    OUTLINED_FUNCTION_1_3((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35, v44, v48, v51);

    v36 = swift_bridgeObjectRelease();
    if (v52)
    {
      if (OUTLINED_FUNCTION_0_3())
      {
        v39 = v45;
LABEL_17:
        sub_22D96D210(v39);
        v40 = a2;
        return a2;
      }
    }
    else
    {
      OUTLINED_FUNCTION_4_3(v36, &qword_253F34C88, v37, v38);
    }
    v39 = 0;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t destroy for LeadingItem(id *a1)
{

  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for LeadingItem()
{
  return &type metadata for LeadingItem;
}

void _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22D96E45C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LeadingItemView()
{
  return &type metadata for LeadingItemView;
}

uint64_t sub_22D96E4AC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D96E4BC(void *a1@<X0>, __int16 a2@<W1>, __n128 *a3@<X8>)
{
  unsigned __int8 v3;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  __int16 v30;
  __n128 v31;
  char v32;
  __int16 v33;
  uint64_t KeyPath;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;

  v3 = a2;
  v6 = HIBYTE(a2);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7388);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0uLL;
  if (v6 == 2)
  {
    if (a1)
    {
      KeyPath = swift_getKeyPath();
      v38 = (uint64_t)a1;
      v39 = 0x3FF0000000000000;
      v40 = (unint64_t)v3 << 8;
      v41 = KeyPath;
      v42 = 256;
      sub_22D96E758();
      v35 = a1;
      sub_22D975C08();
      v10 = OUTLINED_FUNCTION_3_4();
      if (v32)
        v33 = 0;
      else
        v33 = 256;
      goto LABEL_10;
    }
LABEL_11:
    v36 = -256;
    v31 = 0uLL;
    goto LABEL_12;
  }
  if (v6 != 3)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  sub_22D975E9C();
  v11 = sub_22D975DD0();
  v13 = v12;
  v15 = v14 & 1;
  v16 = sub_22D975CA4();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v16);
  sub_22D975CE0();
  sub_22D9628A4((uint64_t)v9, &qword_255DA7388);
  v17 = sub_22D975DA0();
  v19 = v18;
  v21 = v20;
  swift_release();
  v22 = v21 & 1;
  sub_22D9663A8(v11, v13, v15);
  swift_bridgeObjectRelease();
  v43 = sub_22D975E48();
  v23 = sub_22D975D7C();
  v25 = v24;
  v27 = v26;
  v29 = v28 & 1;
  sub_22D9663A8(v17, v19, v22);
  swift_release();
  swift_bridgeObjectRelease();
  v38 = v23;
  v39 = v25;
  v40 = v29;
  v41 = v27;
  v42 = 0;
  sub_22D96E758();
  sub_22D975C08();
  v10 = OUTLINED_FUNCTION_3_4();
  if (v32)
    v33 = 0;
  else
    v33 = 256;
LABEL_10:
  v36 = v33 | v30;
LABEL_12:
  *a3 = v10;
  a3[1] = v31;
  a3[2].n128_u16[0] = v36;
}

void sub_22D96E740(__n128 *a1@<X8>)
{
  uint64_t v1;

  sub_22D96E4BC(*(void **)v1, *(_WORD *)(v1 + 8), a1);
}

unint64_t sub_22D96E758()
{
  unint64_t result;

  result = qword_255DA7390;
  if (!qword_255DA7390)
  {
    result = MEMORY[0x22E31D184](&unk_22D977924, &type metadata for SalableIconView);
    atomic_store(result, (unint64_t *)&qword_255DA7390);
  }
  return result;
}

unint64_t sub_22D96E798()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255DA7398;
  if (!qword_255DA7398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA73A0);
    v2 = sub_22D96E7FC();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255DA7398);
  }
  return result;
}

unint64_t sub_22D96E7FC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_255DA73A8;
  if (!qword_255DA73A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA73B0);
    v2 = sub_22D96E758();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA73A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v11;

  return sub_22D961540(a1, v11, &a11);
}

__n128 OUTLINED_FUNCTION_3_4()
{
  uint64_t v0;

  return *(__n128 *)(v0 - 128);
}

void OUTLINED_FUNCTION_4_3(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_22D9628A4((uint64_t)va, a2);
}

uint64_t sub_22D96E8A8()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for Localizations();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_22D9759E0();

  return v2;
}

uint64_t sub_22D96E94C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Localizations()
{
  return objc_opt_self();
}

uint64_t sub_22D96E97C()
{
  os_log_type_t v0;

  v0 = sub_22D9760DC();
  return OUTLINED_FUNCTION_0_4(v0);
}

uint64_t sub_22D96E99C()
{
  uint64_t result;

  sub_22D96EB84();
  result = sub_22D976118();
  qword_255DA73B8 = result;
  return result;
}

uint64_t sub_22D96E9F8()
{
  os_log_type_t v0;

  v0 = sub_22D9760D0();
  return OUTLINED_FUNCTION_0_4(v0);
}

uint64_t sub_22D96EA18(os_log_type_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_255DA6FB8 != -1)
    swift_once();
  result = os_log_type_enabled((os_log_t)qword_255DA73B8, a1);
  if ((_DWORD)result)
  {
    sub_22D975F50();
    v3 = sub_22D975FA4();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7458);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_22D976A70;
    *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v6 + 64) = sub_22D96EB48();
    *(_QWORD *)(v6 + 32) = v3;
    *(_QWORD *)(v6 + 40) = v5;
    sub_22D975A58();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for Log()
{
  return objc_opt_self();
}

unint64_t sub_22D96EB48()
{
  unint64_t result;

  result = qword_255DA7460;
  if (!qword_255DA7460)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255DA7460);
  }
  return result;
}

unint64_t sub_22D96EB84()
{
  unint64_t result;

  result = qword_255DA7468;
  if (!qword_255DA7468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA7468);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4(os_log_type_t a1)
{
  return sub_22D96EA18(a1);
}

uint64_t destroy for ParentalVerificationMessageViewModel(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ParentalVerificationMessageView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParentalVerificationMessageView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for ParentalVerificationMessageView(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  v6 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for ParentalVerificationMessageView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParentalVerificationMessageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ParentalVerificationMessageView()
{
  return &type metadata for ParentalVerificationMessageView;
}

uint64_t sub_22D96EDCC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D96EDDC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_22D975BF0();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7470);
  sub_22D96EE20(v1, a1 + *(int *)(v3 + 44));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96EE20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  id v27;
  uint64_t v28;
  _BYTE *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t KeyPath;
  _BYTE *v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE v88[12];
  unsigned int v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  uint64_t v99;
  _BYTE *v100;
  _BYTE *v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;

  v99 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7388);
  MEMORY[0x24BDAC7A8](v3);
  v98 = &v88[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7478);
  MEMORY[0x24BDAC7A8](v95);
  v6 = &v88[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_22D975AE8();
  v90 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v88[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7480);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v88[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7488);
  MEMORY[0x24BDAC7A8](v91);
  v14 = (uint64_t *)&v88[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7490);
  v15 = MEMORY[0x24BDAC7A8](v92);
  v101 = &v88[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v100 = &v88[-v17];
  v18 = *(void **)a1;
  v94 = *(_QWORD *)(a1 + 8);
  v93 = *(_QWORD *)(a1 + 16);
  v19 = *(_QWORD *)(a1 + 24);
  v96 = *(_QWORD *)(a1 + 32);
  v97 = v19;
  v20 = v18;
  v21 = sub_22D975E84();
  v22 = *(_QWORD *)(a1 + 40);
  v23 = &v9[*(int *)(v7 + 20)];
  v89 = *MEMORY[0x24BDEEB68];
  v24 = v89;
  v25 = sub_22D975BCC();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104);
  v26(v23, v24, v25);
  *(_QWORD *)v9 = v22;
  *((_QWORD *)v9 + 1) = v22;
  v27 = objc_msgSend((id)objc_opt_self(), sel_systemGrayColor);
  v28 = MEMORY[0x22E31CA58](v27);
  sub_22D975A7C();
  sub_22D96DD38((uint64_t)v9, (uint64_t)v12);
  v29 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7498) + 36)];
  v30 = v105;
  *(_OWORD *)v29 = v104;
  *((_OWORD *)v29 + 1) = v30;
  *((_QWORD *)v29 + 4) = v106;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA74A0);
  *(_QWORD *)&v12[*(int *)(v31 + 52)] = v28;
  *(_WORD *)&v12[*(int *)(v31 + 56)] = 256;
  v32 = sub_22D975F2C();
  v34 = v33;
  v35 = (uint64_t *)&v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA74A8) + 36)];
  *v35 = v32;
  v35[1] = v34;
  sub_22D96DD7C((uint64_t)v9);
  v36 = sub_22D975F2C();
  v38 = v37;
  sub_22D96F710((uint64_t)v12, (uint64_t)v6, &qword_255DA7480);
  v39 = (uint64_t *)&v6[*(int *)(v95 + 36)];
  *v39 = v36;
  v39[1] = v38;
  sub_22D96F710((uint64_t)v6, (uint64_t)v14 + *(int *)(v91 + 36), &qword_255DA7478);
  *v14 = v21;
  swift_retain();
  sub_22D96F754((uint64_t)v6, &qword_255DA7478);
  sub_22D96F754((uint64_t)v12, &qword_255DA7480);
  swift_release();
  v26(&v9[*(int *)(v90 + 20)], v89, v25);
  *(_QWORD *)v9 = v22;
  *((_QWORD *)v9 + 1) = v22;
  v40 = v101;
  v41 = (uint64_t)&v101[*(int *)(v92 + 36)];
  sub_22D96DD38((uint64_t)v9, v41);
  *(_WORD *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30) + 36)) = 256;
  sub_22D96F710((uint64_t)v14, (uint64_t)v40, &qword_255DA7488);
  sub_22D96DD7C((uint64_t)v9);
  sub_22D96F754((uint64_t)v14, &qword_255DA7488);
  sub_22D96F660((uint64_t)v40, (uint64_t)v100);
  v102 = v94;
  v103 = v93;
  v91 = sub_22D962840();
  swift_bridgeObjectRetain();
  v42 = sub_22D975DC4();
  v44 = v43;
  LOBYTE(v21) = v45 & 1;
  sub_22D975CB0();
  v90 = sub_22D975CA4();
  v46 = (uint64_t)v98;
  __swift_storeEnumTagSinglePayload((uint64_t)v98, 1, 1, v90);
  sub_22D975CE0();
  sub_22D96F754(v46, &qword_255DA7388);
  v47 = sub_22D975DA0();
  v49 = v48;
  LOBYTE(v26) = v50;
  swift_release();
  sub_22D9663A8(v42, v44, v21);
  swift_bridgeObjectRelease();
  sub_22D975CB0();
  v95 = sub_22D975D1C();
  v93 = v51;
  v94 = v52;
  LOBYTE(v21) = v53 & 1;
  sub_22D9663A8(v47, v49, v26 & 1);
  swift_bridgeObjectRelease();
  LODWORD(v92) = sub_22D975C50();
  sub_22D975A70();
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v102 = v97;
  v103 = v96;
  swift_bridgeObjectRetain();
  v62 = sub_22D975DC4();
  v64 = v63;
  LOBYTE(v47) = v65 & 1;
  sub_22D975CC8();
  __swift_storeEnumTagSinglePayload(v46, 1, 1, v90);
  sub_22D975CE0();
  sub_22D96F754(v46, &qword_255DA7388);
  v66 = sub_22D975DA0();
  v68 = v67;
  LOBYTE(v46) = v69;
  swift_release();
  LOBYTE(v40) = v46 & 1;
  sub_22D9663A8(v62, v64, v47);
  swift_bridgeObjectRelease();
  sub_22D975CC8();
  v70 = sub_22D975D1C();
  v72 = v71;
  v74 = v73;
  LOBYTE(v46) = v75 & 1;
  sub_22D9663A8(v66, v68, (char)v40);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v78 = v100;
  v77 = v101;
  sub_22D96F710((uint64_t)v100, (uint64_t)v101, &qword_255DA7490);
  LOBYTE(v102) = v21;
  v79 = (uint64_t)v77;
  v80 = v99;
  sub_22D96F710(v79, v99, &qword_255DA7490);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA74B0);
  v82 = v80 + *(int *)(v81 + 48);
  v83 = v95;
  v84 = v93;
  *(_QWORD *)v82 = v95;
  *(_QWORD *)(v82 + 8) = v84;
  *(_BYTE *)(v82 + 16) = v21;
  *(_QWORD *)(v82 + 24) = v94;
  *(_BYTE *)(v82 + 32) = v92;
  *(_QWORD *)(v82 + 40) = v55;
  *(_QWORD *)(v82 + 48) = v57;
  *(_QWORD *)(v82 + 56) = v59;
  *(_QWORD *)(v82 + 64) = v61;
  *(_BYTE *)(v82 + 72) = 0;
  v85 = v80 + *(int *)(v81 + 64);
  *(_QWORD *)v85 = v70;
  *(_QWORD *)(v85 + 8) = v72;
  *(_BYTE *)(v85 + 16) = v46;
  *(_QWORD *)(v85 + 24) = v74;
  *(_QWORD *)(v85 + 32) = KeyPath;
  *(_BYTE *)(v85 + 40) = 1;
  v86 = v83;
  sub_22D966B34(v83, v84, v21);
  swift_bridgeObjectRetain();
  sub_22D966B34(v70, v72, v46);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22D96F754((uint64_t)v78, &qword_255DA7490);
  sub_22D9663A8(v70, v72, v46);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22D9663A8(v86, v84, v102);
  swift_bridgeObjectRelease();
  return sub_22D96F754((uint64_t)v101, &qword_255DA7490);
}

void sub_22D96F628(uint64_t a1@<X8>)
{
  sub_22D96EDDC(a1);
}

uint64_t sub_22D96F660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22D96F6A8()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5();
}

void sub_22D96F6C4()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_5();
}

void sub_22D96F6E0()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_5();
}

void sub_22D96F6F8()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D96F710(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D96F754(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22D96F794()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA74B8;
  if (!qword_255DA74B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA74C0);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_255DA74B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_22D975B54();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_22D975B48();
}

id sub_22D96F7F0(uint64_t a1, unint64_t a2, double a3)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = (void *)sub_22D975A10();
  v8 = objc_msgSend(v6, sel_initWithData_scale_, v7, a3);
  sub_22D963F94(a1, a2);

  return v8;
}

id sub_22D96F874(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  id v22;
  id v23;
  uint64_t v25;
  double v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  if (a1)
  {
    v4 = OUTLINED_FUNCTION_2_5(0x7469547465656873, 0xEA0000000000656CLL, &v28);
    if (v29)
    {
      OUTLINED_FUNCTION_0_5();
      goto LABEL_6;
    }
  }
  else
  {
    v4 = OUTLINED_FUNCTION_4_4();
  }
  OUTLINED_FUNCTION_3_5(v2, v3, v4);
  if (!a1)
  {
    v7 = OUTLINED_FUNCTION_4_4();
LABEL_10:
    v8 = OUTLINED_FUNCTION_3_5(v5, v6, v7);
    if (!a1)
    {
      v16 = 0;
      v20 = OUTLINED_FUNCTION_4_4();
      v17 = 0xC000000000000000;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
LABEL_6:
  v7 = OUTLINED_FUNCTION_2_5(0x6F6349656C746974, 0xE90000000000006ELL, &v28);
  if (!v29)
    goto LABEL_10;
  v8 = OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v8)
  {
    v16 = v25;
    v17 = v27;
    goto LABEL_12;
  }
LABEL_11:
  v16 = 0;
  v17 = 0xC000000000000000;
LABEL_12:
  v20 = OUTLINED_FUNCTION_1_5(v8, v9, v10, v11, v12, v13, v14, v15, v25, v27, v28);
  if (!v29)
  {
LABEL_16:
    OUTLINED_FUNCTION_3_5(v18, v19, v20);
    goto LABEL_17;
  }
  if ((OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    v21 = v26;
    goto LABEL_18;
  }
LABEL_17:
  v21 = 1.0;
LABEL_18:
  sub_22D96FC0C();
  sub_22D963F50(v16, v17);
  v22 = sub_22D96F7F0(v16, v17, v21);
  if (!v22)
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v23 = v22;
  sub_22D963F94(v16, v17);
  return v23;
}

uint64_t sub_22D96FA10@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  id v35;
  id v36;
  uint64_t result;
  uint64_t v38;
  double v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;

  if (!a1)
  {
    v8 = OUTLINED_FUNCTION_4_4();
LABEL_6:
    OUTLINED_FUNCTION_3_5(v6, v7, v8);
    if (!a1)
    {
      v9 = 0;
      v13 = OUTLINED_FUNCTION_4_4();
      v10 = 0xE000000000000000;
LABEL_12:
      OUTLINED_FUNCTION_3_5(v11, v12, v13);
      if (!a1)
      {
        v14 = 0;
        v20 = OUTLINED_FUNCTION_4_4();
        v15 = 0xE000000000000000;
LABEL_18:
        v21 = OUTLINED_FUNCTION_3_5(v18, v19, v20);
        if (!a1)
        {
          v29 = 0;
          v33 = OUTLINED_FUNCTION_4_4();
          v30 = 0xC000000000000000;
          goto LABEL_24;
        }
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  v4 = OUTLINED_FUNCTION_5_2();
  v8 = OUTLINED_FUNCTION_2_5(v4 & 0xFFFFFFFFFFFFLL | 0x5474000000000000, 0xEC000000656C7469, v5);
  if (!v42)
    goto LABEL_6;
  if (OUTLINED_FUNCTION_0_5())
  {
    v9 = v38;
    v10 = v40;
    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
  v10 = 0xE000000000000000;
LABEL_8:
  v13 = OUTLINED_FUNCTION_2_5(0x6567617373656DLL, 0xE700000000000000, &v41);
  if (!v42)
    goto LABEL_12;
  if (OUTLINED_FUNCTION_0_5())
  {
    v14 = v38;
    v15 = v40;
    goto LABEL_14;
  }
LABEL_13:
  v14 = 0;
  v15 = 0xE000000000000000;
LABEL_14:
  v16 = OUTLINED_FUNCTION_5_2();
  v20 = OUTLINED_FUNCTION_2_5(v16 & 0xFFFFFFFFFFFFLL | 0x4974000000000000, 0xEB000000006E6F63, v17);
  if (!v42)
    goto LABEL_18;
  v21 = OUTLINED_FUNCTION_0_5();
  if ((_DWORD)v21)
  {
    v29 = v38;
    v30 = v40;
    goto LABEL_20;
  }
LABEL_19:
  v29 = 0;
  v30 = 0xC000000000000000;
LABEL_20:
  v33 = OUTLINED_FUNCTION_1_5(v21, v22, v23, v24, v25, v26, v27, v28, v38, v40, v41);
  if (!v42)
  {
LABEL_24:
    OUTLINED_FUNCTION_3_5(v31, v32, v33);
    goto LABEL_25;
  }
  if ((OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    v34 = v39;
    goto LABEL_26;
  }
LABEL_25:
  v34 = 1.0;
LABEL_26:
  sub_22D96FC0C();
  sub_22D963F50(v29, v30);
  v35 = sub_22D96F7F0(v29, v30, v34);
  if (!v35)
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_init);
  v36 = v35;
  result = sub_22D963F94(v29, v30);
  *a2 = v36;
  a2[1] = v9;
  a2[2] = v10;
  a2[3] = v14;
  a2[4] = v15;
  return result;
}

unint64_t sub_22D96FC0C()
{
  unint64_t result;

  result = qword_255DA7090;
  if (!qword_255DA7090)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA7090);
  }
  return result;
}

uint64_t destroy for PaymentSheetViewRequest(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s33AppleMediaServicesUIPaymentSheets20WalletTitleViewModelVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletTitleViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for WalletTitleViewModel(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaymentSheetViewRequest(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PaymentSheetViewRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WalletTitleViewModel()
{
  return &type metadata for WalletTitleViewModel;
}

_QWORD *initializeWithCopy for ParentalVerificationMessageViewModel(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  a1[4] = *(_QWORD *)(a2 + 32);
  v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParentalVerificationMessageViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ParentalVerificationMessageViewModel(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  v6 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ParentalVerificationMessageViewModel()
{
  return &type metadata for ParentalVerificationMessageViewModel;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v11;

  return sub_22D9614F4(0x63536E6565726373, 0xEB00000000656C61, v11, &a11);
}

double OUTLINED_FUNCTION_2_5@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_22D9614F4(a1, a2, v3, a3);
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_22D960044((uint64_t)va);
}

double OUTLINED_FUNCTION_4_4()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return 0x7865746E6F63;
}

uint64_t sub_22D96FF9C(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PaymentSheetViewRequest(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PaymentSheetViewRequest(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PaymentSheetViewRequest()
{
  return &type metadata for PaymentSheetViewRequest;
}

uint64_t sub_22D97009C(void *a1)
{
  id v2;
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
  uint64_t v59;
  __int128 v60;
  uint64_t v61;

  sub_22D976004();
  OUTLINED_FUNCTION_5_3();
  v2 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_22D9761A8());
  v3 = swift_unknownObjectRelease();
  if (v2)
  {
    OUTLINED_FUNCTION_9_4();
    v3 = swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_11_3(v3, v4, v5, v6);
  if (v61)
  {
    if ((OUTLINED_FUNCTION_2_6() & 1) != 0)
    {
      OUTLINED_FUNCTION_0_6();
      sub_22D970630();
    }
    else
    {
      OUTLINED_FUNCTION_0_6();
    }
  }
  else
  {
    v7 = OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_1_6(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  sub_22D976004();
  OUTLINED_FUNCTION_5_3();
  v15 = MEMORY[0x24BEE0D00];
  v16 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_22D9761A8());
  v17 = swift_unknownObjectRelease();
  if (v16)
  {
    OUTLINED_FUNCTION_9_4();
    v17 = swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_11_3(v17, v18, v19, v20);
  if (v61)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F34BF0);
    if ((OUTLINED_FUNCTION_2_6() & 1) != 0)
    {
      v21 = v59;
      OUTLINED_FUNCTION_0_6();
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_0_6();
  }
  else
  {
    v22 = OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_1_6(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  v21 = MEMORY[0x24BEE4B00];
LABEL_16:
  v30 = sub_22D976004();
  sub_22D9614F4(v30, v31, v21, &v60);
  v32 = OUTLINED_FUNCTION_0_6();
  if (!v61)
  {
    OUTLINED_FUNCTION_1_6(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_21;
  }
  if ((OUTLINED_FUNCTION_2_6() & 1) == 0)
  {
LABEL_21:
    OUTLINED_FUNCTION_16_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
    OUTLINED_FUNCTION_5_1();
    *(_OWORD *)(OUTLINED_FUNCTION_10_3() + 16) = xmmword_22D9766F0;
    OUTLINED_FUNCTION_4_5();
    v61 = v15;
    v49 = OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_1_6(v49, v50, v51, v52, v53, v54, v55, v56);
    sub_22D96E97C();
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease();

    return 0;
  }
  sub_22D966800(0, &qword_253F34C38);
  sub_22D966800(0, &qword_255DA74C8);
  v40 = sub_22D9760F4();
  v57 = v40;
  if (v40)
  {

    OUTLINED_FUNCTION_12_1();
    return v57;
  }
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
  OUTLINED_FUNCTION_5_1();
  *(_OWORD *)(OUTLINED_FUNCTION_10_3() + 16) = xmmword_22D9766F0;
  OUTLINED_FUNCTION_4_5();
  v61 = v15;
  v41 = OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_1_6(v41, v42, v43, v44, v45, v46, v47, v48);
  sub_22D96E97C();
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_12_1();
  return 0;
}

unint64_t sub_22D97047C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  __int128 v10;
  ValueMetadata *v11;

  sub_22D975F80();
  MEMORY[0x24BDAC7A8]();
  v4 = sub_22D976004();
  sub_22D9614F4(v4, v5, a3, &v10);
  OUTLINED_FUNCTION_20();
  if (!v11)
  {
    sub_22D960044((uint64_t)&v10);
    return 0;
  }
  if ((OUTLINED_FUNCTION_2_6() & 1) == 0)
    return 0;
  v6 = sub_22D96D210(v9);
  if (v6 == 7)
    return 0;
  v7 = v6;
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7008);
  OUTLINED_FUNCTION_5_1();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_22D976A70;
  sub_22D975F74();
  sub_22D975F68();
  v11 = &type metadata for IconAdornmentStyle;
  LOBYTE(v10) = v7;
  sub_22D975F5C();
  sub_22D960044((uint64_t)&v10);
  sub_22D975F68();
  sub_22D975F8C();
  sub_22D96E9F8();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_22D970630()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_22D976190();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

unint64_t sub_22D970680(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD00000000000002BLL;
  else
    return 0xD000000000000032;
}

void sub_22D9706BC(char *a1, char *a2)
{
  sub_22D967094(*a1, *a2);
}

void sub_22D9706C8()
{
  sub_22D96D144();
}

uint64_t sub_22D9706D0()
{
  return sub_22D967280();
}

void sub_22D9706D8()
{
  sub_22D96D1A4();
}

uint64_t sub_22D9706E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D970630();
  *a1 = result;
  return result;
}

unint64_t sub_22D97070C@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = sub_22D970680(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22D970734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;

  v4 = sub_22D976004();
  sub_22D9614F4(v4, v5, a3, &v8);
  OUTLINED_FUNCTION_0_6();
  if (!v9)
  {
    sub_22D960044((uint64_t)&v8);
    return 0;
  }
  if ((OUTLINED_FUNCTION_2_6() & 1) == 0)
    return 0;
  if (v7 >= 0xA)
    return 0;
  else
    return (0x3C6u >> v7) & 1;
}

uint64_t sub_22D9707D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for PaymentRequestLayoutStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D970864 + 4 * byte_22D977825[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D970898 + 4 * asc_22D977820[v4]))();
}

uint64_t sub_22D970898(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D9708A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D9708A8);
  return result;
}

uint64_t sub_22D9708B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D9708BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D9708C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D9708C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaymentRequestLayoutStyle()
{
  return &type metadata for PaymentRequestLayoutStyle;
}

unint64_t sub_22D9708E8()
{
  unint64_t result;

  result = qword_255DA74D0;
  if (!qword_255DA74D0)
  {
    result = MEMORY[0x22E31D184](&unk_22D9778E4, &type metadata for PaymentRequestLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_255DA74D0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_22D960044((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_22D975F98();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_22D975F44();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return sub_22D97613C();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_11_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  return sub_22D9707D0((uint64_t)va, (uint64_t)va1);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;
  unint64_t v1;

  return sub_22D963F94(v0, v1);
}

uint64_t destroy for SalableIconView(uint64_t a1)
{

  return sub_22D9635C0(*(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for SalableIconView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  v7 = v3;
  sub_22D962CC4(v5, v6);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for SalableIconView(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = a2;
  v4 = *(void **)a1;
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  v6 = v5;

  v7 = v2[1];
  *(_BYTE *)(a1 + 16) = *((_BYTE *)v2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 17) = *((_BYTE *)v2 + 17);
  v8 = (uint64_t)v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_22D962CC4(v8, (char)v2);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  sub_22D9635C0(v9, v10);
  return a1;
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

uint64_t assignWithTake for SalableIconView(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = v5;
  sub_22D9635C0(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SalableIconView(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SalableIconView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SalableIconView()
{
  return &type metadata for SalableIconView;
}

uint64_t sub_22D970BD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D970BE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[21];
  uint64_t v23[21];
  char v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  double v31;
  _BYTE v32[176];

  v3 = sub_22D975EA8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    if ((*(_BYTE *)(v1 + 16) & 1) != 0)
    {
      v8 = *(_QWORD *)(v1 + 24);
      v9 = *(_BYTE *)(v1 + 32);
      v10 = v7;
      sub_22D962CC4(v8, v9);
      sub_22D966180();
      sub_22D9635C0(v8, v9);
    }
    else
    {
      v11 = v7;
    }
    v12 = v7;
    sub_22D975E90();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF3FD0], v3);
    v13 = sub_22D975EC0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v14 = *(_BYTE *)(v1 + 17);
    v15 = sub_22D970E34();
    if (qword_255DA6FB0 != -1)
      swift_once();
    v25 = v13;
    v26 = 0;
    v27 = 1;
    v28 = qword_255DA7088;
    v29 = 0x3FE0000000000000;
    v30 = v14;
    v31 = v15;
    swift_retain();
    v16 = sub_22D970E34();
    v17 = sub_22D975F2C();
    LOBYTE(v21) = 0;
    LOBYTE(v20) = 1;
    sub_22D961B50(0, 1, 0, 1, v16, 0, 0, 1, 0, v20, 0x404B000000000000, v21, v17, v18, v22[0], v22[1], v22[2], v22[3], v22[4],
      v22[5],
      v22[6],
      v22[7],
      v22[8],
      v22[9],
      v22[10],
      v22[11],
      v22[12],
      v22[13],
      v22[14],
      v22[15],
      v22[16],
      v22[17],
      v22[18],
      v22[19],
      v22[20],
      v23[0],
      v23[1],
      v23[2],
      v23[3],
      v23[4],
      v23[5],
      v23[6],
      v23[7],
      v23[8],
      v23[9],
      v23[10],
      v23[11],
      v23[12],
      v23[13],
      v23[14]);
    swift_release();
    swift_release();

    memcpy(v23, v22, sizeof(v23));
    v24 = 1;
    nullsub_1(v23);
  }
  else
  {
    sub_22D970EAC(v23);
  }
  sub_22D970EB4((uint64_t)v23, (uint64_t)v32);
  return sub_22D970EB4((uint64_t)v32, a1);
}

double sub_22D970E34()
{
  uint64_t v0;
  int v1;
  CGImage *v2;
  int64_t Width;
  int64_t Height;
  BOOL v5;
  double result;

  if (!*(_QWORD *)v0)
    return 54.0;
  v1 = *(unsigned __int8 *)(v0 + 17);
  v2 = (CGImage *)*(id *)v0;
  Width = CGImageGetWidth(v2);
  Height = CGImageGetHeight(v2);

  v5 = v1 == 2 && Height < Width;
  result = 54.0;
  if (v5)
    return 72.0;
  return result;
}

void sub_22D970EAC(void *a1)
{
  bzero(a1, 0xA9uLL);
}

uint64_t sub_22D970EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA74D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D970F00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255DA74E0;
  if (!qword_255DA74E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA74D8);
    v2 = sub_22D971010(&qword_255DA74E8, &qword_255DA74F0, (uint64_t (*)(void))sub_22D970F84, (uint64_t (*)(void))sub_22D9710BC);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255DA74E0);
  }
  return result;
}

unint64_t sub_22D970F84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA74F8;
  if (!qword_255DA74F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7500);
    v2[0] = sub_22D971010(&qword_255DA7508, &qword_255DA7510, (uint64_t (*)(void))sub_22D9627DC, (uint64_t (*)(void))sub_22D971080);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA74F8);
  }
  return result;
}

uint64_t sub_22D971010(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D971080()
{
  unint64_t result;

  result = qword_255DA7518;
  if (!qword_255DA7518)
  {
    result = MEMORY[0x22E31D184](&unk_22D9775FC, &type metadata for IconAdornmentViewModifier);
    atomic_store(result, (unint64_t *)&qword_255DA7518);
  }
  return result;
}

unint64_t sub_22D9710BC()
{
  unint64_t result;

  result = qword_255DA7520;
  if (!qword_255DA7520)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF1438], MEMORY[0x24BDF1448]);
    atomic_store(result, (unint64_t *)&qword_255DA7520);
  }
  return result;
}

uint64_t sub_22D9710F8@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char *v4;
  id v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t result;
  char v31;
  char v32;
  uint64_t KeyPath;
  uint64_t v34;
  id v35;
  char *v36;
  uint64_t *v37;
  uint64_t v41;
  uint64_t v42;
  char v43[8];
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[3];
  _QWORD *v48;
  uint64_t v49;
  char v50;
  uint64_t aBlock;
  __int128 v52;
  void *v53;
  void (*v54)();
  uint64_t *v55;
  uint64_t v56;
  char v57;
  char v58;

  v4 = a1;
  v5 = objc_msgSend(v4, sel_label);
  v56 = MEMORY[0x24BEE4AF8];
  v6 = (__int128 *)objc_msgSend(v5, sel_length);
  v7 = OUTLINED_FUNCTION_1_2();
  *(_QWORD *)(v7 + 16) = &v56;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = (uint64_t *)OUTLINED_FUNCTION_1_2();
  v8[2] = (uint64_t)sub_22D972D74;
  v8[3] = v7;
  v54 = sub_22D972D88;
  v55 = v8;
  v9 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  *(_QWORD *)&v52 = 1107296256;
  *((_QWORD *)&v52 + 1) = sub_22D9717AC;
  v53 = &block_descriptor_1;
  v10 = _Block_copy(&aBlock);
  v11 = v5;
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_9_5(v11, sel_enumerateAttributesInRange_options_usingBlock_);
  _Block_release(v10);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v10 & 1) != 0)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    v4 = OUTLINED_FUNCTION_3_7(0, *((_QWORD *)v4 + 2) + 1);
    goto LABEL_22;
  }
  v37 = v11;
  v49 = 0;
  v50 = 1;
  v8 = (uint64_t *)objc_msgSend(v4, sel_label);
  v12 = OUTLINED_FUNCTION_1_2();
  *(_QWORD *)(v12 + 16) = &v49;
  v11 = (_QWORD *)OUTLINED_FUNCTION_1_2();
  v11[2] = sub_22D972DC8;
  v11[3] = v12;
  v54 = sub_22D973EAC;
  v55 = v11;
  aBlock = v9;
  *(_QWORD *)&v52 = 1107296256;
  *((_QWORD *)&v52 + 1) = sub_22D9717AC;
  v53 = &block_descriptor_13;
  v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_9_5(v8, sel_enumerateAttributesInRange_options_usingBlock_);

  _Block_release(v13);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v13 & 1) != 0)
    goto LABEL_29;
  v36 = v4;
  v35 = objc_msgSend(v4, sel_image);
  v34 = v49;
  v14 = v50;
  KeyPath = swift_getKeyPath();
  v58 = v14;
  v57 = 0;
  v4 = (char *)MEMORY[0x24BEE4AF8];
  v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v11 = *(_QWORD **)(v56 + 16);
  v41 = v56 + 32;
  v42 = v56;
  swift_bridgeObjectRetain();
  v15 = 0;
  v8 = &qword_253F34C20;
  while (1)
  {
    if ((_QWORD *)v15 == v11)
    {
      v15 = (unint64_t)v11;
      memset(v47, 0, sizeof(v47));
    }
    else
    {
      if (v15 >= *(_QWORD *)(v42 + 16))
      {
        __break(1u);
        goto LABEL_28;
      }
      v6 = &v44;
      sub_22D966AF0(v41 + 40 * v15, (uint64_t)&v44);
      *(_QWORD *)&v47[0] = v15;
      sub_22D96698C(&v44, (uint64_t)v47 + 8);
      ++v15;
    }
    sub_22D9628DC((uint64_t)v47, (uint64_t)&aBlock, &qword_253F34C20);
    if (!v54)
      break;
    sub_22D96698C(&v52, (uint64_t)v47);
    OUTLINED_FUNCTION_17_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B10);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      v16 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = OUTLINED_FUNCTION_3_7(0, *((_QWORD *)v4 + 2) + 1);
      v18 = *((_QWORD *)v4 + 2);
      v17 = *((_QWORD *)v4 + 3);
      if (v18 >= v17 >> 1)
        v4 = OUTLINED_FUNCTION_3_7((char *)(v17 > 1), v18 + 1);
      *((_QWORD *)v4 + 2) = v18 + 1;
      *(_QWORD *)&v4[8 * v18 + 32] = v16;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      OUTLINED_FUNCTION_17_1();
      v19 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v19 = OUTLINED_FUNCTION_14_1(0, v19[2] + 1);
        v48 = v19;
      }
      v6 = &v52;
      v21 = v19[2];
      v20 = v19[3];
      if (v21 >= v20 >> 1)
        v48 = OUTLINED_FUNCTION_14_1((_QWORD *)(v20 > 1), v21 + 1);
      v22 = v45;
      v23 = v46;
      v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v45);
      MEMORY[0x24BDAC7A8](v24);
      OUTLINED_FUNCTION_12_2();
      (*(void (**)(__int128 *))(v25 + 16))(&v52);
      sub_22D9734B8(v21, (uint64_t)&v52, (uint64_t *)&v48, v22, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    }
  }
  swift_bridgeObjectRelease();
  v6 = (__int128 *)v48;
  if (!v48[2])
  {
    swift_bridgeObjectRelease();
    v8 = (uint64_t *)v36;
    v28 = v36;
    v29 = v37;
    goto LABEL_26;
  }
  v8 = (uint64_t *)v36;
  v11 = v37;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_30;
LABEL_22:
  v27 = *((_QWORD *)v4 + 2);
  v26 = *((_QWORD *)v4 + 3);
  if (v27 >= v26 >> 1)
    v4 = OUTLINED_FUNCTION_3_7((char *)(v26 > 1), v27 + 1);
  *((_QWORD *)v4 + 2) = v27 + 1;
  *(_QWORD *)&v4[8 * v27 + 32] = v6;
  v28 = (char *)v11;
  v29 = v8;
LABEL_26:

  swift_release();
  swift_release();
  result = OUTLINED_FUNCTION_20_0();
  v31 = v58;
  v32 = v57;
  *(_BYTE *)a4 = a2;
  *(_QWORD *)(a4 + 8) = v8;
  *(_BYTE *)(a4 + 16) = a3 & 1;
  *(_QWORD *)(a4 + 24) = v35;
  *(_QWORD *)(a4 + 32) = v34;
  *(_BYTE *)(a4 + 40) = v31;
  *(_BYTE *)(a4 + 41) = a2;
  *(_QWORD *)(a4 + 48) = KeyPath;
  *(_BYTE *)(a4 + 56) = v32;
  *(_QWORD *)(a4 + 64) = v4;
  return result;
}

void sub_22D971790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D9717AC(uint64_t a1)
{
  void (*v1)(void);

  v1 = *(void (**)(void))(a1 + 32);
  type metadata accessor for Key(0);
  sub_22D96C42C();
  sub_22D975FBC();
  v1();
  return swift_bridgeObjectRelease();
}

void sub_22D971834()
{
  sub_22D9761C0();
  OUTLINED_FUNCTION_5();
}

void sub_22D971854()
{
  sub_22D971834();
}

void sub_22D97185C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  id v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  uint64_t KeyPath;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  id v33;
  id v34;
  char v35;
  uint64_t v36;
  char v37;
  _QWORD *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;

  v11 = (id)*MEMORY[0x24BE07F00];
  sub_22D961540((uint64_t)v11, a1, &v68);

  if (v70)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = v66;
      goto LABEL_6;
    }
  }
  else
  {
    sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
  }
  v12 = 0;
LABEL_6:
  v13 = (id)*MEMORY[0x24BE07EF0];
  sub_22D961540((uint64_t)v13, a1, &v68);

  if (!v70)
  {
LABEL_15:
    sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34BF0);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_16;
  v14 = sub_22D976004();
  sub_22D9614F4(v14, v15, v66, &v68);
  swift_bridgeObjectRelease();
  if (!v70)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v16 = sub_22D976004();
  sub_22D9614F4(v16, v17, v66, &v68);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v70)
  {
    sub_22D963F94(v66, v67);
    sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0 || (sub_22D963F50(v66, v67), (v18 = sub_22D963E38(v66, *(double *)&v66)) == 0))
  {
    sub_22D963F94(v66, v67);
LABEL_16:
    v21 = (id)*MEMORY[0x24BE07FA0];
    sub_22D961540((uint64_t)v21, a1, &v68);

    if (v70)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        KeyPath = swift_getKeyPath();
        v23 = swift_getKeyPath();
        *(_QWORD *)&v68 = KeyPath;
        BYTE8(v68) = 0;
        v69 = v23;
        LOBYTE(v70) = 0;
        BYTE1(v70) = v12;
        v71 = v66;
        v72 = v67;
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_22D972CCC();
        v24 = *(_QWORD **)(*a5 + 16);
        sub_22D972D14(v24);
        sub_22D9732B4((uint64_t)v24, &v68, a5);
        swift_bridgeObjectRelease();
        swift_release();
LABEL_53:
        swift_release();
        return;
      }
    }
    else
    {
      sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    }
    v25 = (id)*MEMORY[0x24BE07F38];
    sub_22D961540((uint64_t)v25, a1, &v68);

    if (v70)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v26 = sub_22D964108(v66, v67, 3);
        if (v26)
          goto LABEL_33;
      }
    }
    else
    {
      sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    }
    v28 = (id)*MEMORY[0x24BE07F40];
    sub_22D961540((uint64_t)v28, a1, &v68);

    if (v70)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v26 = sub_22D964108(v66, v67, 0);
        if (v26)
          goto LABEL_33;
      }
    }
    else
    {
      sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    }
    v29 = (id)*MEMORY[0x24BE07F48];
    sub_22D961540((uint64_t)v29, a1, &v68);

    if (v70)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v26 = sub_22D964108(v66, v67, 1);
        if (v26)
        {
LABEL_33:
          v30 = (uint64_t)v26;
          v31 = v27;
          swift_retain();
          sub_22D972CCC();
          v32 = *(_QWORD **)(*a5 + 16);
          sub_22D972D14(v32);
          sub_22D973344((uint64_t)v32, v30, v31, a5);
          goto LABEL_53;
        }
      }
    }
    else
    {
      sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    }
    v33 = (id)*MEMORY[0x24BE07F50];
    sub_22D961540((uint64_t)v33, a1, &v68);

    if (v70)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v34 = sub_22D964108(v66, v67, 2);
        if (v34)
        {
          v36 = (uint64_t)v34;
          v37 = v35;
          swift_retain();
          sub_22D972CCC();
          v38 = *(_QWORD **)(*a5 + 16);
          sub_22D972D14(v38);
          sub_22D973344((uint64_t)v38, v36, v37, a5);
          goto LABEL_53;
        }
      }
    }
    else
    {
      sub_22D9628A4((uint64_t)&v68, &qword_253F34C88);
    }
    if (a3 == 1)
    {
      v39 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, 1);
      v40 = objc_msgSend(v39, sel_string);

      v41 = sub_22D976004();
      v43 = v42;

      if (v41 == 10 && v43 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v45 = sub_22D97619C();
        swift_bridgeObjectRelease();
        if ((v45 & 1) == 0)
          goto LABEL_46;
      }
      v59 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, 1);
      v60 = objc_msgSend(v59, sel_string);

      v61 = sub_22D976004();
      v63 = v62;

      sub_22D972CCC();
      v64 = *(_QWORD **)(*a5 + 16);
      sub_22D972D14(v64);
      sub_22D9733B8((uint64_t)v64, v61, v63, a5);
      return;
    }
LABEL_46:
    v46 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, a3);
    v47 = swift_getKeyPath();
    v48 = swift_getKeyPath();
    *(_QWORD *)&v68 = v47;
    BYTE8(v68) = 0;
    v69 = v48;
    LOBYTE(v70) = 0;
    v71 = (uint64_t)v46;
    v19 = v46;
    swift_retain();
    swift_retain();
    sub_22D972CCC();
    v49 = *(_QWORD **)(*a5 + 16);
    sub_22D972D14(v49);
    sub_22D973428((uint64_t)v49, (uint64_t)&v68, a5);
    v50 = objc_msgSend(v19, sel_string);
    v51 = sub_22D976004();
    v53 = v52;

    v54 = sub_22D9720A0(v51, v53);
    v56 = v55;
    swift_bridgeObjectRelease();
    if (v56)
    {
      if (v54 == 10 && v56 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v58 = sub_22D97619C();
        swift_bridgeObjectRelease();
        if ((v58 & 1) == 0)
          goto LABEL_52;
      }
      sub_22D972CCC();
      v65 = *(_QWORD **)(*a5 + 16);
      sub_22D972D14(v65);
      sub_22D9733B8((uint64_t)v65, 10, 0xE100000000000000, a5);
      swift_release();
      swift_release();

      goto LABEL_59;
    }
LABEL_52:
    swift_release();

    goto LABEL_53;
  }
  v19 = v18;
  sub_22D972CCC();
  v20 = *(_QWORD **)(*a5 + 16);
  sub_22D972D14(v20);
  sub_22D973248((uint64_t)v20, (uint64_t)v19, a5);
  sub_22D963F94(v66, v67);
LABEL_59:

}

uint64_t sub_22D9720A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  sub_22D976034();
  return sub_22D976070();
}

void sub_22D972118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v13 = 0u;
    v14 = 0u;
LABEL_10:
    sub_22D9628A4((uint64_t)&v13, &qword_253F34C88);
    return;
  }
  v7 = (id)*MEMORY[0x24BE07EF0];
  v8 = sub_22D962318((uint64_t)v7);
  if ((v9 & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;

    goto LABEL_10;
  }
  sub_22D9622DC(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)&v13);

  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34BF0);
  if ((swift_dynamicCast() & 1) == 0)
    return;
  v10 = sub_22D976004();
  sub_22D9614F4(v10, v11, v12, &v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_10;
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)a5 = v12;
    *(_BYTE *)(a5 + 8) = 0;
  }
}

void sub_22D97224C(uint64_t a1@<X8>)
{
  uint64_t v1;
  const void *v2;
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
  void *v21;
  int v22;
  uint64_t v23;
  char v24;
  unsigned __int8 v25;
  char v26;
  void *v27;
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
  char v47;
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
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71[8];
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
  uint64_t v96[25];
  _QWORD v97[27];
  char v98;
  char v99;
  uint64_t v100;
  char v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;

  v2 = (const void *)v1;
  v70 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7050);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_3();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7058);
  OUTLINED_FUNCTION_3_1();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v68 = (uint64_t)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v65 = (uint64_t)&v62 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7590);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2_3();
  v14 = v13 - v12;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7580);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_6_1();
  v67 = v16;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7570);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_6_1();
  v69 = v18;
  if (*(_QWORD *)(*(_QWORD *)(v1 + 64) + 16) == 1)
    v19 = sub_22D975BB4();
  else
    v19 = sub_22D975BA8();
  *(_QWORD *)v14 = v19;
  *(_QWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 16) = 0;
  v21 = *(void **)(v1 + 24);
  v20 = *(_QWORD *)(v1 + 32);
  v22 = *(unsigned __int8 *)(v1 + 40);
  LODWORD(v62) = *(unsigned __int8 *)(v1 + 41);
  HIDWORD(v62) = v22;
  v23 = *(_QWORD *)(v1 + 48);
  v24 = *(_BYTE *)(v1 + 56);
  v63 = v21;
  sub_22D962CC4(v23, v24);
  v25 = sub_22D975C8C();
  v26 = sub_22D975C80();
  sub_22D975C80();
  if (sub_22D975C80() != v25)
    v26 = sub_22D975C80();
  v27 = (void *)(v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA75C0) + 44));
  sub_22D975A70();
  v97[25] = v21;
  v97[26] = v20;
  v98 = BYTE4(v62);
  v99 = v62;
  v100 = v23;
  v101 = v24;
  v102 = v26;
  v103 = v28;
  v104 = v29;
  v105 = v30;
  v106 = v31;
  v107 = 0;
  v60 = sub_22D975F2C();
  v61 = v32;
  LOBYTE(v59) = 0;
  LOBYTE(v58) = 1;
  v33 = OUTLINED_FUNCTION_4_6();
  sub_22D961DAC(v33, v34, v35, v36, v37, v38, v39, v40, 0, v58, 0x7FF0000000000000, v59, v60, v61, v62, (uint64_t)v63, v64, v65, v66,
    v67,
    v68,
    v69,
    v70,
    v71[0],
    v72,
    v73,
    v74,
    v75,
    v76,
    v77,
    v78,
    v79,
    v80,
    v81,
    v82,
    v83,
    v84,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95,
    v96[0],
    v96[1]);

  sub_22D9635C0(v23, v24);
  *(_QWORD *)v6 = sub_22D975BFC();
  *(_QWORD *)(v6 + 8) = 0;
  *(_BYTE *)(v6 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA75A0);
  sub_22D972684(v2);
  sub_22D975F2C();
  v41 = v68;
  OUTLINED_FUNCTION_4_6();
  sub_22D961EF0();
  sub_22D9628A4(v6, &qword_255DA7050);
  v42 = v65;
  sub_22D9628DC(v41, v65, &qword_255DA7058);
  OUTLINED_FUNCTION_6_3(v42, v41);
  OUTLINED_FUNCTION_19_1(v96, v71);
  OUTLINED_FUNCTION_19_1(v27, v71);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA75C8);
  OUTLINED_FUNCTION_6_3(v41, (uint64_t)v27 + *(int *)(v43 + 48));
  sub_22D962C80((uint64_t)v96);
  OUTLINED_FUNCTION_8_3(v42);
  OUTLINED_FUNCTION_8_3(v41);
  OUTLINED_FUNCTION_19_1(v97, v71);
  sub_22D973CB4((uint64_t)v97);
  v44 = v67;
  OUTLINED_FUNCTION_6_3(v14, v67);
  *(_WORD *)(v44 + *(int *)(v66 + 36)) = 256;
  OUTLINED_FUNCTION_8_3(v14);
  v45 = v69;
  OUTLINED_FUNCTION_6_3(v44, v69);
  v46 = v45 + *(int *)(v64 + 36);
  *(_QWORD *)v46 = 0;
  *(_WORD *)(v46 + 8) = 1;
  OUTLINED_FUNCTION_8_3(v44);
  v47 = sub_22D975C50();
  sub_22D975A70();
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = v70;
  sub_22D962CD0(v45, v70, &qword_255DA7570);
  v57 = v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DA7540) + 36);
  *(_BYTE *)v57 = v47;
  *(_QWORD *)(v57 + 8) = v49;
  *(_QWORD *)(v57 + 16) = v51;
  *(_QWORD *)(v57 + 24) = v53;
  *(_QWORD *)(v57 + 32) = v55;
  *(_BYTE *)(v57 + 40) = 0;
  sub_22D9628A4(v45, &qword_255DA7570);
}

uint64_t sub_22D972684(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_bridgeObjectRetain();
  sub_22D96C46C(v2);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), a1, 0x48uLL);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_22D973BC8;
  *(_QWORD *)(v4 + 24) = v3;
  sub_22D973C18((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA75B0);
  sub_22D96C768(&qword_253F34C18, &qword_253F34C10, MEMORY[0x24BEE12D8]);
  sub_22D973A48(&qword_255DA75B8, &qword_255DA75B0, (uint64_t (*)(void))sub_22D973C78, MEMORY[0x24BDEDBB8]);
  return sub_22D975F14();
}

__n128 sub_22D9727E0@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  __n128 result;
  _QWORD v20[2];
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  __n128 v32;

  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    v5 = sub_22D975F2C();
  else
    v5 = sub_22D975F38();
  sub_22D9620B8(v20, 0, 1, 0, 1, 0x7FF0000000000000, 0, 0, 1, 0, 1, 0, 1, v5, v6, a1);
  v7 = v20[1];
  v8 = v21;
  v9 = v22;
  v10 = v23;
  v11 = v24;
  v12 = v25;
  v13 = v26;
  v14 = v27;
  v15 = v28;
  v16 = v29;
  v17 = v30;
  v18 = v31;
  result = v32;
  *(_QWORD *)a3 = v20[0];
  *(_QWORD *)(a3 + 8) = v7;
  *(_BYTE *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v9;
  *(_BYTE *)(a3 + 32) = v10;
  *(_QWORD *)(a3 + 40) = v11;
  *(_BYTE *)(a3 + 48) = v12;
  *(_QWORD *)(a3 + 56) = v13;
  *(_BYTE *)(a3 + 64) = v14;
  *(_QWORD *)(a3 + 72) = v15;
  *(_BYTE *)(a3 + 80) = v16;
  *(_QWORD *)(a3 + 88) = v17;
  *(_BYTE *)(a3 + 96) = v18;
  *(__n128 *)(a3 + 104) = result;
  return result;
}

uint64_t sub_22D9728C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  char v21;
  uint64_t v22;
  char v23;
  id v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7050);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19 - v8;
  v10 = *(_OWORD *)(a1 + 40);
  v19 = *(_OWORD *)(a1 + 24);
  v20 = v10;
  v21 = *(_BYTE *)(a1 + 56);
  sub_22D9628DC((uint64_t)&v19, (uint64_t)&v24, &qword_253F34C30);
  v22 = *((_QWORD *)&v20 + 1);
  v23 = v21;
  sub_22D973B34(&v24);
  sub_22D973B5C((uint64_t)&v22);
  *(_QWORD *)v9 = sub_22D975BFC();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA75A0);
  sub_22D972684((const void *)a1);
  v11 = v19;
  v12 = v20;
  v13 = BYTE1(v20);
  v14 = *((_QWORD *)&v20 + 1);
  v15 = v21;
  sub_22D962CD0((uint64_t)v9, (uint64_t)v7, &qword_255DA7050);
  v15 &= 1u;
  *(_OWORD *)a2 = v11;
  *(_BYTE *)(a2 + 16) = v12 & 1;
  *(_BYTE *)(a2 + 17) = v13;
  *(_QWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 32) = v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA75A8);
  sub_22D962CD0((uint64_t)v7, a2 + *(int *)(v16 + 48), &qword_255DA7050);
  v17 = (id)v11;
  sub_22D962CC4(v14, v15);
  sub_22D9628A4((uint64_t)v9, &qword_255DA7050);
  sub_22D9628A4((uint64_t)v7, &qword_255DA7050);

  return sub_22D9635C0(v14, v15);
}

void sub_22D972A74()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7540);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_3();
  v5 = v4 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7548);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_3();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7550);
  OUTLINED_FUNCTION_3_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_12_2();
  if (*(_BYTE *)(v0 + 16) == 1)
  {
    *(_QWORD *)v1 = sub_22D975BF0();
    *(_QWORD *)(v1 + 8) = 0;
    *(_BYTE *)(v1 + 16) = 1;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7598);
    sub_22D9728C8(v0, v1 + *(int *)(v11 + 44));
    OUTLINED_FUNCTION_6_3(v1, v9);
    swift_storeEnumTagMultiPayload();
    sub_22D96C768(&qword_255DA7558, &qword_255DA7550, MEMORY[0x24BDF4700]);
    sub_22D973A48(&qword_255DA7560, &qword_255DA7540, sub_22D973A24, MEMORY[0x24BDECC60]);
    OUTLINED_FUNCTION_13_1();
    sub_22D975C08();
    v12 = v1;
  }
  else
  {
    sub_22D97224C(v5);
    OUTLINED_FUNCTION_6_3(v5, v9);
    swift_storeEnumTagMultiPayload();
    sub_22D96C768(&qword_255DA7558, &qword_255DA7550, MEMORY[0x24BDF4700]);
    sub_22D973A48(&qword_255DA7560, &qword_255DA7540, sub_22D973A24, MEMORY[0x24BDECC60]);
    OUTLINED_FUNCTION_13_1();
    sub_22D975C08();
    v12 = v5;
  }
  OUTLINED_FUNCTION_8_3(v12);
}

void sub_22D972C58()
{
  const void *v0;
  _BYTE __dst[72];

  memcpy(__dst, v0, sizeof(__dst));
  sub_22D972A74();
}

void sub_22D972C98()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_16_1();
  *v0 = v1;
  OUTLINED_FUNCTION_5();
}

void sub_22D972CB4()
{
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5();
}

_QWORD *sub_22D972CCC()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *result;

  v1 = *v0;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_22D972E10(result, v1[2] + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

_QWORD *sub_22D972D14(_QWORD *result)
{
  _QWORD **v1;
  unint64_t v2;

  v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_22D972E10((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    *v1 = result;
  }
  return result;
}

uint64_t sub_22D972D50()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D972D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_22D97185C(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_22D972D7C()
{
  return OUTLINED_FUNCTION_1_7();
}

void sub_22D972D88()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_5();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_22D972DBC()
{
  return OUTLINED_FUNCTION_1_7();
}

void sub_22D972DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_22D972118(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_22D972DD0()
{
  return OUTLINED_FUNCTION_1_7();
}

void sub_22D972DDC()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_16_1();
  *v0 = v1;
  OUTLINED_FUNCTION_5();
}

void sub_22D972DF8()
{
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5();
}

_QWORD *sub_22D972E10(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C78);
    v10 = (_QWORD *)OUTLINED_FUNCTION_1_2();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B10);
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_20_0();
  return v10;
}

char *sub_22D972F2C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12)
      memmove(v12, v13, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_22D973028(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F34C68);
  v10 = *(_QWORD *)(type metadata accessor for FlexListItem() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FlexListItem() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v5 & 1) != 0)
  {
    sub_22D9731A8(a4 + v16, v8, (unint64_t)v13 + v16);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_20_0();
  return (size_t)v13;
}

char *sub_22D973174(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[40 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 40 * a2);
  return __src;
}

uint64_t sub_22D9731A8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < a1
    || (result = type metadata accessor for FlexListItem(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for FlexListItem();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_22D973248(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  __int128 v8;
  void *v9;
  unint64_t v10;

  v9 = &unk_24F9779D8;
  v10 = sub_22D9735C4();
  *(_QWORD *)&v8 = a2;
  v6 = *a3;
  *(_QWORD *)(v6 + 16) = a1 + 1;
  return sub_22D96698C(&v8, v6 + 40 * a1 + 32);
}

uint64_t sub_22D9732B4(uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v10;
  void *v11;
  unint64_t v12;

  v11 = &unk_24F9779A8;
  v12 = sub_22D973600();
  v6 = (_OWORD *)swift_allocObject();
  *(_QWORD *)&v10 = v6;
  v7 = a2[1];
  v6[1] = *a2;
  v6[2] = v7;
  v6[3] = a2[2];
  v8 = *a3;
  *(_QWORD *)(v8 + 16) = a1 + 1;
  return sub_22D96698C(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_22D973344(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v8;
  __int128 v10;
  void *v11;
  unint64_t v12;

  v11 = &unk_24F977928;
  v12 = sub_22D973670();
  *(_QWORD *)&v10 = a2;
  BYTE8(v10) = a3;
  v8 = *a4;
  *(_QWORD *)(v8 + 16) = a1 + 1;
  return sub_22D96698C(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_22D9733B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  __int128 v10;
  void *v11;
  unint64_t v12;

  v11 = &unk_24F977A80;
  v12 = sub_22D9736AC();
  *(_QWORD *)&v10 = a2;
  *((_QWORD *)&v10 + 1) = a3;
  v8 = *a4;
  *(_QWORD *)(v8 + 16) = a1 + 1;
  return sub_22D96698C(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_22D973428(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v10;
  void *v11;
  unint64_t v12;

  v11 = &unk_24F9778A0;
  v12 = sub_22D9736E8();
  v6 = swift_allocObject();
  *(_QWORD *)&v10 = v6;
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 48) = *(_QWORD *)(a2 + 32);
  v8 = *a3;
  *(_QWORD *)(v8 + 16) = a1 + 1;
  return sub_22D96698C(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_22D9734B8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_22D96698C(&v12, v10 + 40 * a1 + 32);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
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

unint64_t sub_22D9735C4()
{
  unint64_t result;

  result = qword_255DA7528;
  if (!qword_255DA7528)
  {
    result = MEMORY[0x22E31D184](&unk_22D976DA4, &unk_24F9779D8);
    atomic_store(result, (unint64_t *)&qword_255DA7528);
  }
  return result;
}

unint64_t sub_22D973600()
{
  unint64_t result;

  result = qword_255DA7530;
  if (!qword_255DA7530)
  {
    result = MEMORY[0x22E31D184](&unk_22D976D88, &unk_24F9779A8);
    atomic_store(result, (unint64_t *)&qword_255DA7530);
  }
  return result;
}

uint64_t sub_22D97363C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_22D973670()
{
  unint64_t result;

  result = qword_255DA7538;
  if (!qword_255DA7538)
  {
    result = MEMORY[0x22E31D184](&unk_22D976D6C, &unk_24F977928);
    atomic_store(result, (unint64_t *)&qword_255DA7538);
  }
  return result;
}

unint64_t sub_22D9736AC()
{
  unint64_t result;

  result = qword_253F34B08;
  if (!qword_253F34B08)
  {
    result = MEMORY[0x22E31D184](&unk_22D976D50, &unk_24F977A80);
    atomic_store(result, (unint64_t *)&qword_253F34B08);
  }
  return result;
}

unint64_t sub_22D9736E8()
{
  unint64_t result;

  result = qword_253F34B20;
  if (!qword_253F34B20)
  {
    result = MEMORY[0x22E31D184](&unk_22D976D34, &unk_24F9778A0);
    atomic_store(result, (unint64_t *)&qword_253F34B20);
  }
  return result;
}

uint64_t sub_22D973724()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t destroy for SalableItemView(uint64_t a1)
{

  sub_22D9635C0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SalableItemView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_BYTE *)(a2 + 56);
  v9 = v4;
  v10 = v6;
  sub_22D962CC4(v7, v8);
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SalableItemView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  v11 = *(_QWORD *)(a2 + 48);
  v12 = *(_BYTE *)(a2 + 56);
  sub_22D962CC4(v11, v12);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v11;
  *(_BYTE *)(a1 + 56) = v12;
  sub_22D9635C0(v13, v14);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for SalableItemView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  v6 = *(_BYTE *)(a2 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v6;
  sub_22D9635C0(v7, v8);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SalableItemView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SalableItemView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SalableItemView()
{
  return &type metadata for SalableItemView;
}

uint64_t sub_22D973A14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D973A24()
{
  return sub_22D973A48(&qword_255DA7568, &qword_255DA7570, (uint64_t (*)(void))sub_22D973AB0, MEMORY[0x24BDEEC40]);
}

uint64_t sub_22D973A48(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D973AB0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA7578;
  if (!qword_255DA7578)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7580);
    sub_22D96C768(&qword_255DA7588, &qword_255DA7590, MEMORY[0x24BDF4498]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA7578);
  }
  return result;
}

id *sub_22D973B34(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_22D973B5C(uint64_t a1)
{
  sub_22D962CC4(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_22D973B88()
{
  uint64_t v0;

  sub_22D9635C0(*(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_22D973BC8@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;

  *(_QWORD *)&result = sub_22D9727E0(a1, v2 + 16, a2).n128_u64[0];
  return result;
}

uint64_t sub_22D973BD0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22D973BF4(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D973C18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_BYTE *)(a1 + 56);
  v5 = *(id *)(a1 + 24);
  v6 = v2;
  sub_22D962CC4(v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_22D973C78()
{
  unint64_t result;

  result = qword_253F34AF8;
  if (!qword_253F34AF8)
  {
    result = MEMORY[0x22E31D184](&unk_22D976BA4, &unk_24F977A00);
    atomic_store(result, (unint64_t *)&qword_253F34AF8);
  }
  return result;
}

uint64_t sub_22D973CB4(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_BYTE *)(a1 + 32);

  sub_22D9635C0(v2, v3);
  return a1;
}

uint64_t storeEnumTagSinglePayload for SalableItemView.Layout(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D973D44 + 4 * byte_22D977985[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D973D78 + 4 * byte_22D977980[v4]))();
}

uint64_t sub_22D973D78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D973D80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D973D88);
  return result;
}

uint64_t sub_22D973D94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D973D9CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D973DA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D973DA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SalableItemView.Layout()
{
  return &type metadata for SalableItemView.Layout;
}

unint64_t sub_22D973DC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA75D0;
  if (!qword_255DA75D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA75D8);
    sub_22D96C768(&qword_255DA7558, &qword_255DA7550, MEMORY[0x24BDF4700]);
    v3[0] = v2;
    v3[1] = sub_22D973A48(&qword_255DA7560, &qword_255DA7540, sub_22D973A24, MEMORY[0x24BDECC60]);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA75D0);
  }
  return result;
}

unint64_t sub_22D973E70()
{
  unint64_t result;

  result = qword_255DA75E0;
  if (!qword_255DA75E0)
  {
    result = MEMORY[0x22E31D184](&unk_22D977ADC, &type metadata for SalableItemView.Layout);
    atomic_store(result, (unint64_t *)&qword_255DA75E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_deallocObject();
}

char *OUTLINED_FUNCTION_3_7(char *a1, int64_t a2)
{
  char *v2;

  return sub_22D972F2C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return 0;
}

void OUTLINED_FUNCTION_6_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_22D962CD0(a1, a2, v2);
}

void OUTLINED_FUNCTION_8_3(uint64_t a1)
{
  uint64_t *v1;

  sub_22D9628A4(a1, v1);
}

id OUTLINED_FUNCTION_9_5(id a1, SEL a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(a1, a2, 0, v3, 0, v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_14_1(_QWORD *a1, int64_t a2)
{
  _QWORD *v2;

  return sub_22D972E10(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_22D975B24();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_22D975B18();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  uint64_t v0;

  return sub_22D966AF0(v0 - 256, v0 - 304);
}

void *OUTLINED_FUNCTION_19_1(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

uint64_t destroy for SecondaryContentView(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t _s33AppleMediaServicesUIPaymentSheets20SecondaryContentViewVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SecondaryContentView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for SecondaryContentView(uint64_t a1, uint64_t a2)
{

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecondaryContentView(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SecondaryContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SecondaryContentView()
{
  return &type metadata for SecondaryContentView;
}

uint64_t sub_22D974154()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_22D974164@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  __n128 result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[6];
  uint64_t v18;
  __int16 v19;

  v8 = sub_22D975BF0();
  sub_22D974204(a1, a2, a3, (uint64_t)v17);
  v9 = v18;
  v10 = v19;
  result = (__n128)v17[0];
  v12 = v17[1];
  v13 = v17[2];
  v14 = v17[3];
  v15 = v17[4];
  v16 = v17[5];
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 1;
  *(__n128 *)(a4 + 24) = result;
  *(_OWORD *)(a4 + 40) = v12;
  *(_OWORD *)(a4 + 56) = v13;
  *(_OWORD *)(a4 + 72) = v14;
  *(_OWORD *)(a4 + 88) = v15;
  *(_OWORD *)(a4 + 104) = v16;
  *(_QWORD *)(a4 + 120) = v9;
  *(_WORD *)(a4 + 128) = v10;
  return result;
}

uint64_t sub_22D974204@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v18;
  _BYTE v19[8];
  void *v20;
  unsigned __int8 v21;
  void *v22;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;

  if (a1)
  {
    sub_22D9710F8(a1, a3, 1, (uint64_t)v19);
    v6 = v19[0];
    v7 = v20;
    v8 = v21;
    v9 = v22;
    v10 = v23;
    v11 = v26;
    v12 = v27;
    v18 = v28;
    v13 = v24 | ((unint64_t)v25 << 8);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v13 = 0;
    v11 = 0;
    v12 = 0;
    v18 = 0;
  }
  if (a2)
  {
    v14 = sub_22D975BF0();
    v15 = 1;
    v16 = 257;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  *(_QWORD *)a4 = v6;
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)(a4 + 16) = v8;
  *(_QWORD *)(a4 + 24) = v9;
  *(_QWORD *)(a4 + 32) = v10;
  *(_QWORD *)(a4 + 40) = v13;
  *(_QWORD *)(a4 + 48) = v11;
  *(_QWORD *)(a4 + 56) = v12;
  *(_QWORD *)(a4 + 64) = v18;
  *(_QWORD *)(a4 + 72) = v14;
  *(_QWORD *)(a4 + 80) = 0;
  *(_QWORD *)(a4 + 88) = v15;
  *(_QWORD *)(a4 + 96) = a2;
  *(_WORD *)(a4 + 104) = v16;
  swift_bridgeObjectRetain();
  sub_22D9634F4(v6, v7, v8, v9, v10, v13, v11, v12);
  return sub_22D96356C(v6, v7, v8, v9, v10, v13, v11, v12);
}

double sub_22D97435C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_22D974164((void *)*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), a1).n128_u64[0];
  return result;
}

unint64_t sub_22D97436C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA75E8;
  if (!qword_255DA75E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA75F0);
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_255DA75E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TitleHeaderView()
{
  return &type metadata for TitleHeaderView;
}

uint64_t sub_22D9743C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D9743D0@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;

  sub_22D962840();
  swift_bridgeObjectRetain();
  v2 = sub_22D975DC4();
  v4 = v3;
  v6 = v5 & 1;
  sub_22D975CEC();
  v7 = sub_22D975DA0();
  v9 = v8;
  v11 = v10;
  swift_release();
  sub_22D9663A8(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_22D975CBC();
  v12 = sub_22D975D1C();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  sub_22D9663A8(v7, v9, v11 & 1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v16 & 1;
  *(_QWORD *)(a1 + 24) = v18;
  return result;
}

uint64_t sub_22D9744F8@<X0>(uint64_t a1@<X8>)
{
  return sub_22D9743D0(a1);
}

uint64_t sub_22D974500()
{
  return MEMORY[0x24BDF1F80];
}

uint64_t EnvironmentValues.primaryText.getter()
{
  return sub_22D974E08((void (*)(void))sub_22D974520);
}

unint64_t sub_22D974520()
{
  unint64_t result;

  result = qword_255DA7608;
  if (!qword_255DA7608)
  {
    result = MEMORY[0x22E31D184](&protocol conformance descriptor for PrimaryTextColorKey, &type metadata for PrimaryTextColorKey);
    atomic_store(result, (unint64_t *)&qword_255DA7608);
  }
  return result;
}

void sub_22D97455C(uint64_t *a1@<X8>)
{
  *a1 = EnvironmentValues.primaryText.getter();
  OUTLINED_FUNCTION_5();
}

void sub_22D974580()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_7_3();
  EnvironmentValues.primaryText.setter(v0);
  OUTLINED_FUNCTION_5();
}

uint64_t EnvironmentValues.primaryText.setter(uint64_t a1)
{
  return sub_22D974ED8(a1, (void (*)(void))sub_22D974520);
}

uint64_t (*sub_22D9745B0(void *a1, char a2, uint64_t a3))()
{
  char v5;
  uint64_t (*v6)();
  uint64_t v7;
  id v8;

  v5 = a2 & 1;
  if ((a2 & 1) != 0)
    v6 = sub_22D975134;
  else
    v6 = sub_22D975148;
  v7 = OUTLINED_FUNCTION_6_4();
  *(_QWORD *)(v7 + 16) = a1;
  *(_BYTE *)(v7 + 24) = v5;
  *(_QWORD *)(v7 + 32) = a3;
  v8 = a1;
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t sub_22D974634(void *a1, char a2, uint64_t a3)
{
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];

  v35 = a2 & 1;
  v37 = sub_22D975AE8();
  MEMORY[0x24BDAC7A8]();
  v6 = (_OWORD *)((char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7770);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22D975A4C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7778);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA7780);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1;
  swift_bridgeObjectRetain();
  sub_22D962ED4(v18, v35, a3, v38);
  sub_22D975A40();
  v19 = sub_22D975F2C();
  v21 = v20;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  v22 = (uint64_t *)&v8[*(int *)(v34 + 36)];
  *v22 = v19;
  v22[1] = v21;
  sub_22D975264((uint64_t)v8, (uint64_t)&v15[*(int *)(v13 + 36)], &qword_255DA7770);
  sub_22D975158((uint64_t)v38, (uint64_t)v15);
  sub_22D9751E8(v38, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D9751A0);
  sub_22D9628A4((uint64_t)v8, &qword_255DA7770);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_22D9751E8(v38, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D975218);
  v23 = (char *)v6 + *(int *)(v37 + 20);
  v24 = *MEMORY[0x24BDEEB68];
  v25 = sub_22D975BCC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  __asm { FMOV            V0.2D, #12.0 }
  *v6 = _Q0;
  v31 = (uint64_t)&v17[*(int *)(v36 + 36)];
  sub_22D96DD38((uint64_t)v6, v31);
  *(_WORD *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30) + 36)) = 256;
  sub_22D975264((uint64_t)v15, (uint64_t)v17, &qword_255DA7778);
  sub_22D96DD7C((uint64_t)v6);
  sub_22D9628A4((uint64_t)v15, &qword_255DA7778);
  sub_22D9752A4();
  return sub_22D975EF0();
}

uint64_t sub_22D974918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;

  sub_22D96FA10(a3, &v4);
  sub_22D97544C();
  return sub_22D975EF0();
}

uint64_t (*sub_22D974970(void *a1, char a2, uint64_t a3))()
{
  uint64_t v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v6 = OUTLINED_FUNCTION_6_4();
    *(_QWORD *)(v6 + 16) = a1;
    *(_BYTE *)(v6 + 24) = 1;
    *(_QWORD *)(v6 + 32) = a3;
    v7 = a1;
    swift_bridgeObjectRetain();
    return sub_22D9754B8;
  }
  else if (sub_22D974A3C(a1, 0, a3))
  {
    return sub_22D9754C8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_22D9749FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22D96F874(a3);
  sub_22D9754D0();
  return sub_22D975EF0();
}

uint64_t sub_22D974A3C(void *a1, char a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];

  v5 = a2 & 1;
  swift_bridgeObjectRetain();
  if ((sub_22D970734((uint64_t)a1, v5, a3) & 1) != 0)
  {
    sub_22D961204(a3, v11);
    sub_22D9750B8();
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(a1, sel_localizedNavigationTitle);
    v7 = sub_22D976004();
    v9 = v8;

    v11[0] = v7;
    v11[1] = v9;
    sub_22D97507C();
  }
  return sub_22D975EF0();
}

uint64_t sub_22D974AFC()
{
  uint64_t result;

  result = sub_22D975E30();
  qword_255DA75F8 = result;
  return result;
}

uint64_t static PrimaryTextColorKey.defaultValue.getter()
{
  return sub_22D974CA0(&qword_255DA6FC0);
}

uint64_t static PrimaryTextColorKey.defaultValue.setter(uint64_t a1)
{
  return sub_22D974D14(a1, &qword_255DA6FC0, &qword_255DA75F8);
}

void static PrimaryTextColorKey.defaultValue.modify()
{
  if (qword_255DA6FC0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D974BA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static PrimaryTextColorKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22D974BCC()
{
  sub_22D9750F4();
  return sub_22D975AC4();
}

void EnvironmentValues.primaryText.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_22D974520();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D974C5C(_QWORD *a1, char a2)
{
  return sub_22D974F64(a1, a2);
}

uint64_t sub_22D974C68()
{
  uint64_t result;

  result = sub_22D975E3C();
  qword_255DA7600 = result;
  return result;
}

uint64_t static SecondaryTextColorKey.defaultValue.getter()
{
  return sub_22D974CA0(&qword_255DA6FC8);
}

uint64_t sub_22D974CA0(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static SecondaryTextColorKey.defaultValue.setter(uint64_t a1)
{
  return sub_22D974D14(a1, &qword_255DA6FC8, &qword_255DA7600);
}

uint64_t sub_22D974D14(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = a1;
  return swift_release();
}

void static SecondaryTextColorKey.defaultValue.modify()
{
  if (qword_255DA6FC8 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D974DD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SecondaryTextColorKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t EnvironmentValues.secondaryText.getter()
{
  return sub_22D974E08((void (*)(void))sub_22D974E48);
}

uint64_t sub_22D974E08(void (*a1)(void))
{
  uint64_t v2;

  a1();
  sub_22D975B90();
  return v2;
}

unint64_t sub_22D974E48()
{
  unint64_t result;

  result = qword_255DA7610;
  if (!qword_255DA7610)
  {
    result = MEMORY[0x22E31D184](&protocol conformance descriptor for SecondaryTextColorKey, &type metadata for SecondaryTextColorKey);
    atomic_store(result, (unint64_t *)&qword_255DA7610);
  }
  return result;
}

void sub_22D974E84(uint64_t *a1@<X8>)
{
  *a1 = EnvironmentValues.secondaryText.getter();
  OUTLINED_FUNCTION_5();
}

void sub_22D974EA8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_7_3();
  EnvironmentValues.secondaryText.setter(v0);
  OUTLINED_FUNCTION_5();
}

uint64_t EnvironmentValues.secondaryText.setter(uint64_t a1)
{
  return sub_22D974ED8(a1, (void (*)(void))sub_22D974E48);
}

uint64_t sub_22D974ED8(uint64_t a1, void (*a2)(void))
{
  a2();
  return sub_22D975B9C();
}

void EnvironmentValues.secondaryText.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_22D974E48();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_22D974F58(_QWORD *a1, char a2)
{
  return sub_22D974F64(a1, a2);
}

uint64_t sub_22D974F64(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return OUTLINED_FUNCTION_2_7();
  swift_retain();
  OUTLINED_FUNCTION_2_7();
  return swift_release();
}

void sub_22D974FCC(uint64_t *a1@<X8>)
{
  *a1 = EnvironmentValues.primaryText.getter();
  OUTLINED_FUNCTION_5();
}

void sub_22D974FF4(uint64_t *a1@<X8>)
{
  *a1 = EnvironmentValues.secondaryText.getter();
  OUTLINED_FUNCTION_5();
}

uint64_t type metadata accessor for ContentViewProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HeaderViewProvider()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PrimaryTextColorKey()
{
  return &type metadata for PrimaryTextColorKey;
}

ValueMetadata *type metadata accessor for SecondaryTextColorKey()
{
  return &type metadata for SecondaryTextColorKey;
}

unint64_t sub_22D97507C()
{
  unint64_t result;

  result = qword_255DA7760;
  if (!qword_255DA7760)
  {
    result = MEMORY[0x22E31D184](&unk_22D977B94, &type metadata for TitleHeaderView);
    atomic_store(result, (unint64_t *)&qword_255DA7760);
  }
  return result;
}

unint64_t sub_22D9750B8()
{
  unint64_t result;

  result = qword_253F34AC0;
  if (!qword_253F34AC0)
  {
    result = MEMORY[0x22E31D184](&unk_22D976994, &type metadata for AppleLogoHeaderView);
    atomic_store(result, (unint64_t *)&qword_253F34AC0);
  }
  return result;
}

unint64_t sub_22D9750F4()
{
  unint64_t result;

  result = qword_255DA7768;
  if (!qword_255DA7768)
  {
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF3E60], MEMORY[0x24BDF3E48]);
    atomic_store(result, (unint64_t *)&qword_255DA7768);
  }
  return result;
}

uint64_t sub_22D975134()
{
  uint64_t v0;

  return sub_22D974918(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_22D975148()
{
  uint64_t v0;

  return sub_22D974634(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_22D975158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34AE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D9751A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  id v6;
  id v7;

  if (result)
  {
    v5 = (void *)result;
    v6 = a5;
    v7 = v5;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_22D9751E8(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4]);
  OUTLINED_FUNCTION_5();
}

void sub_22D975218(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

void sub_22D975264(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_5();
}

unint64_t sub_22D9752A4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA7788;
  if (!qword_255DA7788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7780);
    v2 = sub_22D975328();
    sub_22D96C768(&qword_253F34B28, &qword_253F34B30, MEMORY[0x24BDEB950]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA7788);
  }
  return result;
}

unint64_t sub_22D975328()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_255DA7790;
  if (!qword_255DA7790)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA7778);
    v2 = sub_22D9753AC();
    sub_22D96C768(&qword_255DA7798, &qword_255DA7770, MEMORY[0x24BDEF370]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255DA7790);
  }
  return result;
}

unint64_t sub_22D9753AC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_253F34AF0;
  if (!qword_253F34AF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F34AE8);
    v2 = sub_22D975410();
    result = MEMORY[0x22E31D184](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253F34AF0);
  }
  return result;
}

unint64_t sub_22D975410()
{
  unint64_t result;

  result = qword_253F34AE0;
  if (!qword_253F34AE0)
  {
    result = MEMORY[0x22E31D184](&unk_22D976A04, &type metadata for CardOnFileView);
    atomic_store(result, (unint64_t *)&qword_253F34AE0);
  }
  return result;
}

unint64_t sub_22D97544C()
{
  unint64_t result;

  result = qword_255DA77A0;
  if (!qword_255DA77A0)
  {
    result = MEMORY[0x22E31D184](&unk_22D977750, &type metadata for ParentalVerificationMessageView);
    atomic_store(result, (unint64_t *)&qword_255DA77A0);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D9754B8()
{
  uint64_t v0;

  return sub_22D9749FC(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_22D9754C8()
{
  return swift_retain();
}

unint64_t sub_22D9754D0()
{
  unint64_t result;

  result = qword_255DA77A8;
  if (!qword_255DA77A8)
  {
    result = MEMORY[0x22E31D184](&unk_22D977D24, &type metadata for WalletTitleView);
    atomic_store(result, (unint64_t *)&qword_255DA77A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_22D975B9C();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_22D975B90();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_retain();
}

ValueMetadata *type metadata accessor for WalletTitleView()
{
  return &type metadata for WalletTitleView;
}

uint64_t sub_22D975570()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D975580@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA77B0);
  MEMORY[0x24BDAC7A8](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA77B8);
  sub_22D97507C();
  sub_22D975808();
  sub_22D975EE4();
  sub_22D97588C(&qword_255DA77C8, &qword_255DA77B0, MEMORY[0x24BDF41A8]);
  result = sub_22D975EF0();
  *a1 = result;
  return result;
}

uint64_t sub_22D975694@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  id v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v20;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22D975AE8();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_OWORD *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = a1;
  v11 = sub_22D975E84();
  v12 = (char *)v9 + *(int *)(v7 + 20);
  v13 = *MEMORY[0x24BDEEB68];
  v14 = sub_22D975BCC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  __asm { FMOV            V0.2D, #5.0 }
  *v9 = _Q0;
  sub_22D96DD38((uint64_t)v9, (uint64_t)v6);
  *(_WORD *)&v6[*(int *)(v4 + 36)] = 256;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA77B8);
  sub_22D9758CC((uint64_t)v6, (uint64_t)a2 + *(int *)(v20 + 36));
  *a2 = v11;
  swift_retain();
  sub_22D975914((uint64_t)v6);
  sub_22D96DD7C((uint64_t)v9);
  return swift_release();
}

uint64_t sub_22D9757E4@<X0>(uint64_t *a1@<X8>)
{
  return sub_22D975580(a1);
}

uint64_t sub_22D9757F0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 32);
  *a1 = *(_QWORD *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D9757FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_22D975694(*(void **)(v1 + 16), a1);
}

unint64_t sub_22D975808()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA77C0;
  if (!qword_255DA77C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA77B8);
    v2 = sub_22D97588C(&qword_253F34B28, &qword_253F34B30, MEMORY[0x24BDEB950]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E31D184](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA77C0);
  }
  return result;
}

uint64_t sub_22D97588C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E31D184](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D9758CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D975914(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F34B30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D975954()
{
  return MEMORY[0x24BDF4760];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_22D975980()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_22D97598C()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t sub_22D975998()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22D9759A4()
{
  return MEMORY[0x24BDEAD30]();
}

uint64_t sub_22D9759B0()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_22D9759BC()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_22D9759C8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_22D9759D4()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_22D9759E0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22D9759EC()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_22D9759F8()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_22D975A04()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_22D975A10()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22D975A1C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_22D975A28()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22D975A34()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22D975A40()
{
  return MEMORY[0x24BE6FB18]();
}

uint64_t sub_22D975A4C()
{
  return MEMORY[0x24BE6FB20]();
}

uint64_t sub_22D975A58()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_22D975A64()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22D975A70()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_22D975A7C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_22D975A88()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22D975A94()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22D975AA0()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22D975AAC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_22D975AB8()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_22D975AC4()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_22D975AD0()
{
  return MEMORY[0x24BDED290]();
}

uint64_t sub_22D975ADC()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_22D975AE8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_22D975AF4()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_22D975B00()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_22D975B0C()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_22D975B18()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_22D975B24()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_22D975B30()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_22D975B3C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_22D975B48()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_22D975B54()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_22D975B60()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22D975B6C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22D975B78()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22D975B84()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22D975B90()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_22D975B9C()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_22D975BA8()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_22D975BB4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_22D975BC0()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_22D975BCC()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_22D975BD8()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_22D975BE4()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_22D975BF0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_22D975BFC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_22D975C08()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_22D975C14()
{
  return MEMORY[0x24BDEF5B8]();
}

uint64_t sub_22D975C20()
{
  return MEMORY[0x24BDEFEA8]();
}

uint64_t sub_22D975C2C()
{
  return MEMORY[0x24BDEFEC8]();
}

uint64_t sub_22D975C38()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_22D975C44()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22D975C50()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_22D975C5C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_22D975C68()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_22D975C74()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_22D975C80()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_22D975C8C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_22D975C98()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_22D975CA4()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_22D975CB0()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_22D975CBC()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_22D975CC8()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_22D975CD4()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_22D975CE0()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_22D975CEC()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_22D975CF8()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_22D975D04()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_22D975D10()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_22D975D1C()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_22D975D28()
{
  return MEMORY[0x24BDF1C40]();
}

uint64_t sub_22D975D34()
{
  return MEMORY[0x24BDF1C58]();
}

uint64_t sub_22D975D40()
{
  return MEMORY[0x24BDF1C70]();
}

uint64_t sub_22D975D4C()
{
  return MEMORY[0x24BDF1C90]();
}

uint64_t sub_22D975D58()
{
  return MEMORY[0x24BDF1CA0]();
}

uint64_t sub_22D975D64()
{
  return MEMORY[0x24BDF1CA8]();
}

uint64_t sub_22D975D70()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_22D975D7C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_22D975D88()
{
  return MEMORY[0x24BDF1D58]();
}

uint64_t sub_22D975D94()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_22D975DA0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_22D975DAC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22D975DB8()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_22D975DC4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22D975DD0()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_22D975DDC()
{
  return MEMORY[0x24BDF2018]();
}

uint64_t sub_22D975DE8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22D975DF4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22D975E00()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_22D975E0C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22D975E18()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_22D975E24()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_22D975E30()
{
  return MEMORY[0x24BE6FB40]();
}

uint64_t sub_22D975E3C()
{
  return MEMORY[0x24BE6FB48]();
}

uint64_t sub_22D975E48()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_22D975E54()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_22D975E60()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_22D975E6C()
{
  return MEMORY[0x24BDF3E88]();
}

uint64_t sub_22D975E78()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_22D975E84()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_22D975E90()
{
  return MEMORY[0x24BDF3F68]();
}

uint64_t sub_22D975E9C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_22D975EA8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_22D975EB4()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_22D975EC0()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_22D975ECC()
{
  return MEMORY[0x24BDF4128]();
}

uint64_t sub_22D975ED8()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_22D975EE4()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_22D975EF0()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_22D975EFC()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_22D975F08()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_22D975F14()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_22D975F20()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_22D975F2C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_22D975F38()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_22D975F44()
{
  return MEMORY[0x24BE5C758]();
}

uint64_t sub_22D975F50()
{
  return MEMORY[0x24BE5C760]();
}

uint64_t sub_22D975F5C()
{
  return MEMORY[0x24BE5C770]();
}

uint64_t sub_22D975F68()
{
  return MEMORY[0x24BE5C788]();
}

uint64_t sub_22D975F74()
{
  return MEMORY[0x24BE5C790]();
}

uint64_t sub_22D975F80()
{
  return MEMORY[0x24BE5C798]();
}

uint64_t sub_22D975F8C()
{
  return MEMORY[0x24BE5C7A0]();
}

uint64_t sub_22D975F98()
{
  return MEMORY[0x24BE5C7A8]();
}

uint64_t sub_22D975FA4()
{
  return MEMORY[0x24BE5C7B0]();
}

uint64_t sub_22D975FB0()
{
  return MEMORY[0x24BE5C7C0]();
}

uint64_t sub_22D975FBC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22D975FC8()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_22D975FD4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D975FE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D975FEC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22D975FF8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22D976004()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D976010()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_22D97601C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D976028()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22D976034()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_22D976040()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D97604C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D976058()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_22D976064()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_22D976070()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_22D97607C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22D976088()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D976094()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D9760A0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22D9760AC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22D9760B8()
{
  return MEMORY[0x24BDCFC60]();
}

uint64_t sub_22D9760C4()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_22D9760D0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22D9760DC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22D9760E8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22D9760F4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_22D976100()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D97610C()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_22D976118()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22D976124()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_22D976130()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_22D97613C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22D976148()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D976154()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D976160()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D97616C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D976178()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D976184()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22D976190()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22D97619C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D9761A8()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22D9761B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D9761C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D9761CC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22D9761D8()
{
  return MEMORY[0x24BEE4328]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

