uint64_t sub_2402178BC()
{
  return type metadata accessor for LegalDocumentWebViewCoordinator(0);
}

uint64_t type metadata accessor for LegalDocumentWebViewCoordinator(uint64_t a1)
{
  return sub_240219134(a1, (uint64_t *)&unk_256FDC700);
}

uint64_t sub_2402178D8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240226624();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id sub_240217944(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  id v9;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  type metadata accessor for LegalDocumentModel(0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2402192B0(v2 + *(int *)(a2 + 20), (uint64_t)v5, type metadata accessor for LegalDocumentModel);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256FDC820);
  sub_24022675C();
  v6 = v13;
  v7 = (objc_class *)type metadata accessor for LegalDocumentWebViewController(0);
  v8 = (char *)objc_allocWithZone(v7);
  sub_2402192B0((uint64_t)v5, (uint64_t)&v8[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_model], type metadata accessor for LegalDocumentModel);
  *(_QWORD *)&v8[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_coordinator] = v6;
  v12.receiver = v8;
  v12.super_class = v7;
  v9 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);
  sub_240218D54((uint64_t)v5, type metadata accessor for LegalDocumentModel);
  return v9;
}

uint64_t sub_240217A5C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t result;
  objc_super v10;

  v2 = sub_240226624();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24021AEC8((uint64_t)v5);
  v6 = (objc_class *)type metadata accessor for LegalDocumentWebViewCoordinator(0);
  v7 = objc_allocWithZone(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))((uint64_t)v7 + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator_openURL, v5, v2);
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v8;
  return result;
}

uint64_t sub_240217B2C()
{
  return sub_240226708();
}

uint64_t sub_240217B64()
{
  sub_240219270(&qword_256FDC818, (uint64_t)&unk_240227128);
  return sub_240226744();
}

uint64_t sub_240217BC4()
{
  sub_240219270(&qword_256FDC818, (uint64_t)&unk_240227128);
  return sub_240226714();
}

uint64_t sub_240217C24()
{
  return sub_240226870();
}

void sub_240217C3C()
{
  sub_240219270(&qword_256FDC818, (uint64_t)&unk_240227128);
  sub_240226738();
  __break(1u);
}

void sub_240217CC8()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  objc_class *ObjectType;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  objc_super v61;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_240226A14();
  MEMORY[0x24BDAC7A8]();
  v51 = sub_240226588();
  v2 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA920]), sel_init);
  objc_msgSend(v7, sel_setDataDetectorTypes_, 0);
  v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA8F8]), sel_init);
  objc_msgSend(v7, sel_setUserContentController_);
  v8 = objc_allocWithZone(MEMORY[0x24BDFA918]);
  v53 = v7;
  v9 = objc_msgSend(v8, sel_initWithFrame_configuration_, v7, 0.0, 0.0, 0.0, 0.0);
  v10 = *(_QWORD *)&v0[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_coordinator];
  objc_msgSend(v9, sel_setNavigationDelegate_, v10);
  v11 = objc_msgSend(v9, sel_scrollView);
  objc_msgSend(v11, sel_setDelegate_, v10);

  objc_msgSend(v9, sel_setAllowsLinkPreview_, 0);
  objc_msgSend(v9, sel_setOpaque_, 0);
  v12 = (void *)objc_opt_self();
  v13 = v9;
  v14 = objc_msgSend(v12, sel_clearColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  v15 = objc_msgSend(v13, sel_scrollView);
  objc_msgSend(v15, sel_setIndicatorStyle_, 0);

  v16 = &v0[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_model];
  v17 = type metadata accessor for LegalDocumentModel(0);
  sub_2402192B0((uint64_t)&v16[*(int *)(v17 + 20)], (uint64_t)v6, type metadata accessor for LegalDocumentModel.DocumentType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v18 = v51;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v6, v51);
    sub_240226A08();
    v59 = sub_2402269CC();
    v60 = v19;
    v57 = 0xD000000000000012;
    v58 = 0x80000002402283C0;
    v55 = 0xD00000000000006ELL;
    v56 = 0x80000002402283E0;
    sub_240218654();
    sub_240226A68();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
    swift_bridgeObjectRelease();
  }
  v20 = (void *)sub_2402269F0();
  swift_bridgeObjectRelease();

  v21 = objc_msgSend(v1, sel_view);
  if (!v21)
  {
    __break(1u);
    goto LABEL_10;
  }
  v22 = v21;
  objc_msgSend(v21, sel_addSubview_, v13);

  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC748);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_240227090;
  v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_readableContentGuide);

  v27 = objc_msgSend(v26, sel_leadingAnchor);
  v28 = objc_msgSend(v13, sel_leadingAnchor);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v23 + 32) = v29;
  v30 = objc_msgSend(v1, sel_view);
  if (!v30)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v31 = v30;
  v32 = objc_msgSend(v30, sel_readableContentGuide);

  v33 = objc_msgSend(v32, sel_topAnchor);
  v34 = objc_msgSend(v13, sel_topAnchor);
  v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(_QWORD *)(v23 + 40) = v35;
  v36 = objc_msgSend(v1, sel_view);
  if (!v36)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, sel_readableContentGuide);

  v39 = objc_msgSend(v38, sel_trailingAnchor);
  v40 = objc_msgSend(v13, sel_trailingAnchor);
  v41 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v40);

  *(_QWORD *)(v23 + 48) = v41;
  v42 = objc_msgSend(v1, sel_view);
  if (v42)
  {
    v43 = v42;
    v44 = (void *)objc_opt_self();
    v45 = objc_msgSend(v43, sel_readableContentGuide);

    v46 = objc_msgSend(v45, sel_bottomAnchor);
    v47 = objc_msgSend(v13, sel_bottomAnchor);
    v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

    *(_QWORD *)(v23 + 56) = v48;
    v59 = v23;
    sub_240226A50();
    sub_240218618();
    v49 = (void *)sub_240226A44();
    swift_bridgeObjectRelease();
    objc_msgSend(v44, sel_activateConstraints_, v49);

    v61.receiver = v1;
    v61.super_class = ObjectType;
    objc_msgSendSuper2(&v61, sel_viewDidLoad);

    return;
  }
LABEL_13:
  __break(1u);
}

id sub_2402184D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_240218544()
{
  return type metadata accessor for LegalDocumentWebViewController(0);
}

uint64_t type metadata accessor for LegalDocumentWebViewController(uint64_t a1)
{
  return sub_240219134(a1, (uint64_t *)&unk_256FDC738);
}

uint64_t sub_240218560()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LegalDocumentModel(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242680F10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_240218618()
{
  unint64_t result;

  result = qword_256FDC750;
  if (!qword_256FDC750)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256FDC750);
  }
  return result;
}

unint64_t sub_240218654()
{
  unint64_t result;

  result = qword_256FDC758;
  if (!qword_256FDC758)
  {
    result = MEMORY[0x242680F28](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256FDC758);
  }
  return result;
}

uint64_t sub_240218698(void *a1, uint64_t a2, uint64_t a3)
{
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
  id v15;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC760);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_240226528();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_240226588();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_navigationType))
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
  v15 = objc_msgSend(a1, sel_request);
  sub_240226510();

  sub_24022651C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_240218D18((uint64_t)v6, &qword_256FDC760);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v6, v11);
  sub_240226618();
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

_QWORD *sub_240218864(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_240226624();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v12 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
    v13 = &v10[v12];
    v14 = &v11[v12];
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = *((_QWORD *)v14 + 1);
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *((_QWORD *)v13 + 1) = v15;
      swift_bridgeObjectRetain();
    }
    else
    {
      v16 = sub_240226588();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2402189C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_240226624();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  v6 = v5 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_bridgeObjectRelease();
  v8 = sub_240226588();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
}

_QWORD *sub_240218A88(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_240226624();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *((_BYTE *)a1 + v7) = *((_BYTE *)a2 + v7);
  v10 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  v11 = &v8[v10];
  v12 = &v9[v10];
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    swift_bridgeObjectRetain();
  }
  else
  {
    v14 = sub_240226588();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_240218BB4(_QWORD *a1, _QWORD *a2, uint64_t a3)
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

  if (a1 != a2)
  {
    sub_240218D18((uint64_t)a1, &qword_256FDC768);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_240226624();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *((_BYTE *)a1 + v7) = *((_BYTE *)a2 + v7);
  v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    v11 = *(int *)(v10 + 20);
    v12 = &v8[v11];
    v13 = &v9[v11];
    sub_240218D54((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(_QWORD *)v12 = *(_QWORD *)v13;
      *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
      swift_bridgeObjectRetain();
    }
    else
    {
      v14 = sub_240226588();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_240218D18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240218D54(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_240218D90(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_240226624();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  a1[v8] = a2[v8];
  v11 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  v12 = &v9[v11];
  v13 = &v10[v11];
  v14 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = sub_240226588();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_240218EB8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_240218D18((uint64_t)a1, &qword_256FDC768);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_240226624();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  a1[v8] = a2[v8];
  v11 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    v12 = *(int *)(v11 + 20);
    v13 = &v9[v12];
    v14 = &v10[v12];
    sub_240218D54((uint64_t)&v9[v12], type metadata accessor for LegalDocumentModel.DocumentType);
    v15 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v16 = sub_240226588();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_240219010()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24021901C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC770);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for LegalDocumentModel(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_240219094()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2402190A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC770);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for LegalDocumentModel(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LegalDocumentWebView(uint64_t a1)
{
  return sub_240219134(a1, (uint64_t *)&unk_256FDC7D0);
}

uint64_t sub_240219134(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_240219168()
{
  unint64_t v0;
  unint64_t v1;

  sub_2402191EC();
  if (v0 <= 0x3F)
  {
    type metadata accessor for LegalDocumentModel(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2402191EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256FDC7E0)
  {
    sub_240226624();
    v0 = sub_2402265E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256FDC7E0);
  }
}

uint64_t sub_240219240()
{
  return sub_240219270(&qword_256FDC810, (uint64_t)&unk_2402271A0);
}

uint64_t sub_240219264()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_240219270(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LegalDocumentWebView(255);
    result = MEMORY[0x242680F28](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2402192B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LegalDocumentIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LegalDocumentIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_2402193E0 + 4 * byte_240227205[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_240219414 + 4 * byte_240227200[v4]))();
}

uint64_t sub_240219414(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24021941C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240219424);
  return result;
}

uint64_t sub_240219430(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240219438);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24021943C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240219444(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240219450(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_240219458(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentIdentifier()
{
  return &type metadata for LegalDocumentIdentifier;
}

void sub_240219470(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2402194A4()
{
  id v0;

  sub_2402266C0();
  if (qword_256FDC610 != -1)
    swift_once();
  v0 = (id)qword_256FDD028;
  return sub_240226804();
}

uint64_t sub_2402195E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240219624 + 4 * byte_240227213[a1]))(0xD000000000000012, 0x8000000240228110);
}

uint64_t sub_240219624()
{
  return 0x694C656369766564;
}

uint64_t sub_240219648()
{
  return 0x6157656369766564;
}

unint64_t sub_24021966C()
{
  return 0xD000000000000010;
}

uint64_t sub_240219688()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_2402196C0()
{
  return 0x4C646F50656D6F68;
}

uint64_t sub_2402196E4()
{
  return 0x57646F50656D6F68;
}

void sub_240219708(char *a1)
{
  sub_2402214AC(*a1);
}

uint64_t sub_240219714@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2402199D0();
  *a1 = result;
  return result;
}

uint64_t sub_240219740@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2402195E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24021976C()
{
  unint64_t result;

  result = qword_256FDC890;
  if (!qword_256FDC890)
  {
    result = MEMORY[0x242680F28](&unk_2402272E0, &type metadata for LegalDocumentIdentifier);
    atomic_store(result, (unint64_t *)&qword_256FDC890);
  }
  return result;
}

uint64_t sub_2402197B0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_240226AF8();
  sub_2402197FC((uint64_t)v3, v1);
  return sub_240226B10();
}

void sub_2402197F4(uint64_t a1)
{
  char *v1;

  sub_2402197FC(a1, *v1);
}

void sub_2402197FC(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_240219844()
{
  sub_240226A20();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021993C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_240226AF8();
  sub_2402197FC((uint64_t)v3, v1);
  return sub_240226B10();
}

void sub_24021997C(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

unint64_t sub_24021998C()
{
  unint64_t result;

  result = qword_256FDC898;
  if (!qword_256FDC898)
  {
    result = MEMORY[0x242680F28](&unk_240227280, &type metadata for LegalDocumentIdentifier);
    atomic_store(result, (unint64_t *)&qword_256FDC898);
  }
  return result;
}

uint64_t sub_2402199D0()
{
  unint64_t v0;

  v0 = sub_240226AD4();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t initializeBufferWithCopyOfBuffer for IndiaBISDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for IndiaBISDynamicLabel()
{
  return swift_release();
}

uint64_t assignWithCopy for IndiaBISDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for IndiaBISDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IndiaBISDynamicLabel(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IndiaBISDynamicLabel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for IndiaBISDynamicLabel()
{
  return &type metadata for IndiaBISDynamicLabel;
}

uint64_t sub_240219B7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_240219B8C@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
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

  v3 = a1 & 1;
  v4 = swift_retain();
  v5 = sub_24021B0E0(v4, v3);
  swift_release();
  swift_getKeyPath();
  v27 = v5;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v6 = *(unsigned __int8 *)(v5 + 17);
  swift_release();
  if (v6 != 1)
    goto LABEL_6;
  v7 = swift_retain();
  v8 = sub_24021B0E0(v7, v3);
  swift_release();
  swift_getKeyPath();
  v27 = v8;
  sub_2402265B8();
  swift_release();
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v8 + 32);
  swift_release();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v9 & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    v12 = sub_2402266E4();
    sub_240219E10(v3, (uint64_t)&v27);
    v13 = v27;
    v14 = v28;
    v15 = v29;
    v16 = v30;
    v17 = v31;
    v18 = v32;
    v19 = v33;
    v23 = v34;
    v24 = v36;
    v25 = v35;
    v26 = v37;
    v27 = v12;
    v28 = 0x3FF0000000000000;
    LOBYTE(v29) = 0;
    v30 = v13;
    v31 = v14;
    v32 = v15;
    LOBYTE(v33) = v16;
    v34 = v17;
    v35 = v18;
    v36 = v19;
    LOBYTE(v37) = v23;
    v38 = v25;
    v39 = v24;
    v40 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8B0);
    sub_24021A4A4();
    sub_2402268A0();
    swift_release();
    sub_24021A534(v14, v15, v16);
    swift_bridgeObjectRelease();
    sub_24021A534(v18, v19, v23);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8A8);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a2, 0, 1, v20);
  }
  else
  {
LABEL_6:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8A8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
  }
}

uint64_t sub_240219E10@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
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
  uint64_t KeyPath;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v3 = a1 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (id)SFIndiaBISRegulatoryImage();
  sub_2402268AC();
  v9 = *MEMORY[0x24BDF4068];
  v10 = sub_2402268DC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v7, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  v24 = sub_2402268D0();
  swift_release();
  sub_240218D18((uint64_t)v7, &qword_256FDC8C8);
  sub_24021A094(v3, (uint64_t)v25);
  v13 = v25[0];
  v12 = v25[1];
  LOBYTE(v11) = v26;
  v14 = v28;
  v23 = v27;
  v15 = v29;
  LOBYTE(v10) = v30;
  v16 = v31;
  v17 = sub_2402267B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v18 = sub_2402267D4();
  sub_240218D18((uint64_t)v5, &qword_256FDC8C0);
  KeyPath = swift_getKeyPath();
  v22[1] = KeyPath;
  v20 = v23;
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = v13;
  *(_QWORD *)(a2 + 16) = v12;
  *(_BYTE *)(a2 + 24) = v11;
  *(_QWORD *)(a2 + 32) = v20;
  *(_QWORD *)(a2 + 40) = v14;
  *(_QWORD *)(a2 + 48) = v15;
  *(_BYTE *)(a2 + 56) = v10;
  *(_QWORD *)(a2 + 64) = v16;
  *(_QWORD *)(a2 + 72) = KeyPath;
  *(_QWORD *)(a2 + 80) = v18;
  swift_retain();
  sub_24021A54C(v13, v12, v11);
  swift_bridgeObjectRetain();
  sub_24021A54C(v14, v15, v10);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24021A534(v13, v12, v11);
  swift_bridgeObjectRelease();
  sub_24021A534(v14, v15, v10);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021A094@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1 & 1;
  v4 = swift_retain();
  v5 = sub_24021B0E0(v4, v3);
  swift_release();
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v6 = *(_QWORD *)(v5 + 24);
  v7 = *(_QWORD *)(v5 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = 0;
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4AF8];
  *(_OWORD *)(a2 + 32) = xmmword_240227320;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = v8;
  sub_24021A54C(v6, v7, 0);
  swift_bridgeObjectRetain();
  sub_24021A54C(0x2E7369622E777777, 0xEE006E692E766F67, 0);
  swift_bridgeObjectRetain();
  sub_24021A534(0x2E7369622E777777, 0xEE006E692E766F67, 0);
  swift_bridgeObjectRelease();
  sub_24021A534(v6, v7, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021A208@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_240219B8C(*(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_24021A214@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 17);
  return result;
}

uint64_t sub_24021A2A0()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_24021A348@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24021A3D8()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  swift_bridgeObjectRetain();
  sub_2402265AC();
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24021A4A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDC8B8;
  if (!qword_256FDC8B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC8B0);
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256FDC8B8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242680F1C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24021A534(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_24021A54C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_24021A55C()
{
  uint64_t *v0;

  return sub_240222F50(v0[2], v0[3], v0[4]);
}

uint64_t sub_24021A578()
{
  uint64_t v0;

  return sub_240222F48(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_24021A598()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256FDC8D0;
  if (!qword_256FDC8D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC8D8);
    v2 = sub_24021A5FC();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDC8D0);
  }
  return result;
}

unint64_t sub_24021A5FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDC8E0;
  if (!qword_256FDC8E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC8A8);
    v2[0] = sub_24021A4A4();
    v2[1] = sub_24021A680((unint64_t *)&qword_256FDC8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDC8E0);
  }
  return result;
}

uint64_t sub_24021A680(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242680F28](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RegulatoryAndDynamicLabel()
{
  return &type metadata for RegulatoryAndDynamicLabel;
}

uint64_t sub_24021A6D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24021A6E4@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  char v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  char *v37;

  v5 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC908);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - v9;
  sub_24021A978(a1, v5);
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_24021AD70();
  v35 = sub_2402265F4();
  v36 = v11;
  v12 = sub_2402265F4();
  v34 = v13;
  v14 = sub_2402265F4();
  v33 = v15;
  v16 = sub_2402265F4();
  v32 = v17;
  v18 = sub_2402265F4();
  v31 = v19;
  v20 = sub_2402265F4();
  LOBYTE(a1) = v21;
  v37 = v8;
  sub_24021B87C((uint64_t)v10, (uint64_t)v8, &qword_256FDC908);
  sub_24021B87C((uint64_t)v8, a3, &qword_256FDC908);
  v22 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256FDC910);
  v23 = a3 + v22[12];
  *(_QWORD *)v23 = v35;
  *(_BYTE *)(v23 + 8) = v36 & 1;
  v24 = a3 + v22[16];
  *(_QWORD *)v24 = v12;
  *(_BYTE *)(v24 + 8) = v34 & 1;
  v25 = a3 + v22[20];
  *(_QWORD *)v25 = v14;
  *(_BYTE *)(v25 + 8) = v33 & 1;
  v26 = a3 + v22[24];
  *(_QWORD *)v26 = v16;
  *(_BYTE *)(v26 + 8) = v32 & 1;
  v27 = a3 + v22[28];
  *(_QWORD *)v27 = v18;
  *(_BYTE *)(v27 + 8) = v31 & 1;
  v28 = a3 + v22[32];
  *(_QWORD *)v28 = v20;
  *(_BYTE *)(v28 + 8) = a1 & 1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_240218D18((uint64_t)v10, &qword_256FDC908);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_240218D18((uint64_t)v37, &qword_256FDC908);
}

uint64_t sub_24021A978(uint64_t a1, char a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  char v25;
  __int128 v26;
  __int128 v27;
  char v28;

  v2 = a2 & 1;
  v3 = sub_2402268C4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC908);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_retain();
  v10 = sub_24021B0E0(v9, v2);
  swift_release();
  swift_getKeyPath();
  v22 = v10;
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  v11 = *(id *)(v10 + 88);
  swift_release();
  sub_2402268AC();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF3FD0], v3);
  v12 = sub_2402268F4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v13 = sub_2402267A4();
  v22 = v12;
  v23 = 0;
  v24 = 1;
  v25 = v13;
  v26 = 0u;
  v27 = 0u;
  v28 = 1;
  sub_2402266C0();
  if (qword_256FDC610 != -1)
    swift_once();
  v14 = (id)qword_256FDD028;
  v15 = sub_240226804();
  v17 = v16;
  v19 = v18 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC918);
  sub_24021B7C4(&qword_256FDC920, &qword_256FDC918, (uint64_t (*)(void))sub_24021B278);
  sub_24022687C();
  sub_24021A534(v15, v17, v19);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24022663C();
  return sub_240218D18((uint64_t)v8, &qword_256FDC908);
}

uint64_t sub_24021AC7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)v1;
  v7 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)v5 = sub_2402266E4();
  *((_QWORD *)v5 + 1) = 0x4028000000000000;
  v5[16] = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8F8);
  sub_24021A6E4(v6, v7, (uint64_t)&v5[*(int *)(v8 + 44)]);
  v9 = sub_24022678C();
  sub_24021B87C((uint64_t)v5, a1, &qword_256FDC8F0);
  v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256FDC900) + 36);
  *(_BYTE *)v10 = v9;
  *(_OWORD *)(v10 + 8) = 0u;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_BYTE *)(v10 + 40) = 1;
  return sub_240218D18((uint64_t)v5, &qword_256FDC8F0);
}

unint64_t sub_24021AD70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDC8A0;
  if (!qword_256FDC8A0)
  {
    v1 = type metadata accessor for LegalAndRegulatorySettingsListState();
    result = MEMORY[0x242680F28](&protocol conformance descriptor for LegalAndRegulatorySettingsListState, v1);
    atomic_store(result, (unint64_t *)&qword_256FDC8A0);
  }
  return result;
}

id sub_24021ADB8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  v4 = *(void **)(v3 + 88);
  *a2 = v4;
  return v4;
}

void sub_24021AE2C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_24021AD70();
  v2 = v1;
  sub_2402265AC();
  swift_release();

}

uint64_t sub_24021AEC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = sub_2402266A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24021B87C(v2, (uint64_t)v9, &qword_256FDC768);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_240226624();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    v12 = sub_240226A5C();
    v13 = sub_240226768();
    if (os_log_type_enabled(v13, v12))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v14 + 4) = sub_24021B2F4(0x414C52556E65704FLL, 0xED00006E6F697463, &v17);
      _os_log_impl(&dword_240215000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242680FB8](v15, -1, -1);
      MEMORY[0x242680FB8](v14, -1, -1);
    }

    sub_24022669C();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24021B0E0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_2402266A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_240226A5C();
    v9 = sub_240226768();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_24021B2F4(0xD000000000000023, 0x80000002402285C0, &v14);
      _os_log_impl(&dword_240215000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242680FB8](v11, -1, -1);
      MEMORY[0x242680FB8](v10, -1, -1);
    }

    sub_24022669C();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

unint64_t sub_24021B278()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDC928;
  if (!qword_256FDC928)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC930);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDC928);
  }
  return result;
}

void sub_24021B2DC()
{
  uint64_t v0;

  sub_24022316C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_24021B2F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24021B3C4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24021B4E0((uint64_t)v12, *a3);
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
      sub_24021B4E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_24021B3C4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_24021B51C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_240226AB0();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24021B4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24021B51C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24021B5B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24021B6AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24021B6AC((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24021B5B0(uint64_t a1, unint64_t a2)
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
      v3 = sub_24021B648(v2, 0);
      result = sub_240226AA4();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_240226A38();
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

_QWORD *sub_24021B648(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC938);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24021B6AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC938);
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

uint64_t sub_24021B798()
{
  return sub_24021B7C4(&qword_256FDC940, &qword_256FDC900, (uint64_t (*)(void))sub_24021B830);
}

uint64_t sub_24021B7C4(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24021B830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDC948;
  if (!qword_256FDC948)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC8F0);
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256FDC948);
  }
  return result;
}

uint64_t sub_24021B87C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t LegalAndRegulatorySettingsList.init(legalAndRegulatorySettingsListState:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v0 = sub_2402265A0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_240226534();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2402269E4();
  MEMORY[0x24BDAC7A8](v5);
  type metadata accessor for LegalAndRegulatorySettingsList();
  sub_2402269D8();
  if (qword_256FDC610 != -1)
    swift_once();
  v6 = objc_msgSend((id)qword_256FDD028, sel_bundleURL);
  sub_240226570();

  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD330], v1);
  sub_240226594();
  sub_24022654C();
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  return sub_240226978();
}

uint64_t type metadata accessor for LegalAndRegulatorySettingsList()
{
  uint64_t result;

  result = qword_256FDC9E8;
  if (!qword_256FDC9E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LegalAndRegulatorySettingsList.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t OpaqueTypeConformance2;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;

  v53 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC760);
  MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_240226588();
  v4 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v44 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_2402269A8();
  v6 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v8 = (uint64_t *)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC958);
  v39 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC960);
  v47 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v45 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC968);
  v51 = *(_QWORD *)(v16 - 8);
  v52 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v49 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC970);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v43 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24022696C();
  swift_getKeyPath();
  sub_240226984();
  swift_release();
  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v41 = v9;
  v20 = v9;
  v21 = v54;
  v19(v12, v20);
  v62 = v58;
  v63 = v59;
  v64 = v60;
  v57 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC978);
  sub_24021976C();
  sub_24021CFDC(&qword_256FDC980, &qword_256FDC978, MEMORY[0x24BDF5428]);
  v38 = v14;
  sub_2402267EC();
  *v8 = 0xD00000000000002BLL;
  v8[1] = 0x8000000240228630;
  v22 = *MEMORY[0x24BE85558];
  v42 = v6;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v6 + 104))(v8, v22, v56);
  sub_24021C610();
  v23 = v55;
  sub_24022657C();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v21, 1, v23);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for LegalAndRegulatorySettingsList();
    v25 = v44;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v44, v21, v23);
    v26 = sub_24021CFDC(&qword_256FDC988, &qword_256FDC958, MEMORY[0x24BDF1A30]);
    v27 = v45;
    v28 = v40;
    v29 = v38;
    sub_240226828();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v25, v23);
    (*(void (**)(_QWORD *, uint64_t))(v42 + 8))(v8, v56);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v28);
    sub_240226960();
    v30 = type metadata accessor for LegalAndRegulatorySettingsListState();
    v58 = v28;
    v59 = v26;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v32 = sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
    v34 = v49;
    v33 = v50;
    sub_24022684C();
    swift_release();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v33);
    v58 = v33;
    v59 = v30;
    v60 = OpaqueTypeConformance2;
    v61 = v32;
    swift_getOpaqueTypeConformance2();
    v35 = v43;
    v36 = v52;
    sub_24022681C();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v34, v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v46 + 32))(v53, v35, v48);
  }
  return result;
}

uint64_t sub_24021C07C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_24021C108()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_24021C1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  unsigned int v23;
  id v24;
  unsigned __int8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v44 = a1;
  v50 = a2;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
  MEMORY[0x24BDAC7A8](v47);
  v45 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA38);
  v4 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  v49 = v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v46 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v41 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA40);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v41 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA48);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v51 = (uint64_t)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - v19;
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_currentDevice);
  v23 = objc_msgSend(v22, sel_sf_isCarrierInstall);

  if (v23
    && (v24 = objc_msgSend(v21, sel_currentDevice),
        v25 = objc_msgSend(v24, sel_sf_isInternalInstall),
        v24,
        (v25 & 1) == 0))
  {
    sub_24021D1F4();
    sub_240226954();
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA50);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v20, 0, 1, v27);
  }
  else
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA50);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 1, 1, v26);
  }
  v43 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  sub_240226960();
  v28 = sub_240224924();
  swift_release();
  v52 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA58);
  sub_24021CFDC(&qword_256FDCA60, &qword_256FDCA58, MEMORY[0x24BEE12D8]);
  sub_24021D01C();
  sub_24021D060();
  v42 = v15;
  sub_24022693C();
  sub_24021C85C();
  sub_24021D0A4();
  sub_24021D128();
  sub_240226948();
  v29 = v51;
  sub_24021D16C((uint64_t)v20, v51);
  v30 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v30(v13, v15, v9);
  v47 = v10;
  v31 = v8;
  v32 = v48;
  v33 = v49;
  v34 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v35 = v46;
  v34(v46, v31, v48);
  v36 = v50;
  sub_24021D16C(v29, v50);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA88);
  v30((char *)(v36 + *(int *)(v37 + 48)), v13, v9);
  v34((char *)(v36 + *(int *)(v37 + 64)), v35, v32);
  v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v31, v32);
  v39 = *(void (**)(char *, uint64_t))(v47 + 8);
  v39(v42, v9);
  sub_24021D1B4((uint64_t)v43);
  v38(v35, v32);
  v39(v13, v9);
  return sub_24021D1B4(v51);
}

uint64_t sub_24021C5FC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *((_QWORD *)a1 + 1);
  *(_BYTE *)a2 = v2;
  *(_QWORD *)(a2 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24021C610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;

  v0 = sub_2402265A0();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_240226534();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2402269E4();
  MEMORY[0x24BDAC7A8](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA28);
  sub_240226540();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2402274C0;
  sub_2402269D8();
  if (qword_256FDC610 != -1)
    swift_once();
  v7 = objc_msgSend((id)qword_256FDD028, sel_bundleURL);
  sub_240226570();

  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD330], v1);
  sub_240226594();
  sub_24022654C();
  return v6;
}

uint64_t sub_24021C7FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  result = sub_2402265F4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24021C85C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v0 = sub_2402266D8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2402266C0();
  if (qword_256FDC610 != -1)
    swift_once();
  v4 = (id)qword_256FDD028;
  v10 = sub_240226804();
  v11 = v5;
  v12 = v6 & 1;
  v13 = v7;
  sub_2402266CC();
  sub_240226894();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_24021A534(v10, v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021C9D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24021C1B0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24021C9E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for LegalAndRegulatorySettingsList(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_240226540();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_240226540();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_240226540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_240226540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_240226540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_240226540();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegalAndRegulatorySettingsList()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24021CD08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_240226540();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for LegalAndRegulatorySettingsList()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24021CD8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_240226540();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_24021CE0C()
{
  unint64_t v0;
  unint64_t v1;

  sub_24021CE90();
  if (v0 <= 0x3F)
  {
    sub_240226540();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24021CE90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256FDC9F8[0])
  {
    type metadata accessor for LegalAndRegulatorySettingsListState();
    v0 = sub_240226990();
    if (!v1)
      atomic_store(v0, qword_256FDC9F8);
  }
}

uint64_t sub_24021CEE4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC968);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC960);
  type metadata accessor for LegalAndRegulatorySettingsListState();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDC958);
  sub_24021CFDC(&qword_256FDC988, &qword_256FDC958, MEMORY[0x24BDF1A30]);
  swift_getOpaqueTypeConformance2();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24021CFDC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x242680F28](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24021D01C()
{
  unint64_t result;

  result = qword_256FDCA68;
  if (!qword_256FDCA68)
  {
    result = MEMORY[0x242680F28](&unk_240227F78, &type metadata for LegalDocumentSection);
    atomic_store(result, (unint64_t *)&qword_256FDCA68);
  }
  return result;
}

unint64_t sub_24021D060()
{
  unint64_t result;

  result = qword_256FDCA70;
  if (!qword_256FDCA70)
  {
    result = MEMORY[0x242680F28](&unk_24022773C, &type metadata for LegalDocumentSectionModel);
    atomic_store(result, (unint64_t *)&qword_256FDCA70);
  }
  return result;
}

unint64_t sub_24021D0A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256FDCA78;
  if (!qword_256FDCA78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCA30);
    v2 = sub_24021A680((unint64_t *)&qword_256FDC8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256FDCA78);
  }
  return result;
}

unint64_t sub_24021D128()
{
  unint64_t result;

  result = qword_256FDCA80;
  if (!qword_256FDCA80)
  {
    result = MEMORY[0x242680F28](&unk_24022743C, &type metadata for RegulatoryAndDynamicLabel);
    atomic_store(result, (unint64_t *)&qword_256FDCA80);
  }
  return result;
}

uint64_t sub_24021D16C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24021D1B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24021D1F4()
{
  unint64_t result;

  result = qword_256FDCA90;
  if (!qword_256FDCA90)
  {
    result = MEMORY[0x242680F28](&unk_2402278A0, &type metadata for DeviceSerialNumberQRCodeImage);
    atomic_store(result, (unint64_t *)&qword_256FDCA90);
  }
  return result;
}

uint64_t sub_24021D238()
{
  uint64_t v0;

  return sub_240222F40(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

ValueMetadata *type metadata accessor for MonthAndYearOfManufactureDynamicLabel()
{
  return &type metadata for MonthAndYearOfManufactureDynamicLabel;
}

uint64_t sub_24021D264()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24021D274@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = a1 & 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_retain();
  v8 = sub_24021B0E0(v7, v3);
  swift_release();
  swift_getKeyPath();
  v35 = v8;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v9 = *(unsigned __int8 *)(v8 + 65);
  swift_release();
  if (v9 == 1)
  {
    v10 = swift_retain();
    v11 = sub_24021B0E0(v10, v3);
    swift_release();
    swift_getKeyPath();
    v35 = v11;
    sub_2402265B8();
    swift_release();
    v12 = *(_QWORD *)(v11 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    if (*(_QWORD *)(v12 + 16))
    {
      v13 = sub_2402240B4(0x68746E6F6DLL, 0xE500000000000000);
      if ((v14 & 1) != 0)
      {
        v15 = *(id *)(*(_QWORD *)(v12 + 56) + 8 * v13);
        swift_bridgeObjectRelease();
        v16 = swift_retain();
        v17 = sub_24021B0E0(v16, v3);
        swift_release();
        swift_getKeyPath();
        v35 = v17;
        sub_2402265B8();
        swift_release();
        v18 = *(_QWORD *)(v17 + 48);
        swift_bridgeObjectRetain();
        swift_release();
        if (*(_QWORD *)(v18 + 16))
        {
          v19 = sub_2402240B4(1918985593, 0xE400000000000000);
          if ((v20 & 1) != 0)
          {
            v21 = *(id *)(*(_QWORD *)(v18 + 56) + 8 * v19);
            swift_bridgeObjectRelease();
            v35 = 0;
            v36 = 0xE000000000000000;
            sub_240226A98();
            swift_bridgeObjectRelease();
            v35 = 0x85EBB0A1EC9CA0ECLL;
            v36 = 0xAE00203A949BEC84;
            v22 = objc_msgSend(v15, sel_description);
            sub_2402269FC();

            sub_240226A2C();
            swift_bridgeObjectRelease();
            sub_240226A2C();
            v23 = objc_msgSend(v21, sel_description);
            sub_2402269FC();

            sub_240226A2C();
            swift_bridgeObjectRelease();
            v24 = sub_2402267B0();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
            sub_2402267D4();
            sub_24021D960((uint64_t)v6);
            v25 = sub_2402267F8();
            v27 = v26;
            LOBYTE(v23) = v28;
            v30 = v29;
            swift_bridgeObjectRelease();
            swift_release();
            v35 = v25;
            v36 = v27;
            v37 = v23 & 1;
            v38 = v30;
            sub_2402268A0();

            sub_24021A534(v25, v27, v23 & 1);
            swift_bridgeObjectRelease();
            v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
            return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(a2, 0, 1, v31);
          }
        }

      }
    }
    swift_bridgeObjectRelease();
  }
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a2, 1, 1, v33);
}

uint64_t sub_24021D6C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24021D274(*(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_24021D6D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24021D764()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  swift_bridgeObjectRetain();
  sub_2402265AC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021D81C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 65);
  return result;
}

uint64_t sub_24021D8A8()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_24021D960(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24021D9A0()
{
  uint64_t v0;

  return sub_240222FFC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_24021D9B8()
{
  uint64_t v0;

  return sub_2402230B0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_24021D9D8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256FDCA98;
  if (!qword_256FDCA98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCAA0);
    v2 = sub_24021D0A4();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDCA98);
  }
  return result;
}

ValueMetadata *type metadata accessor for CountryOfOriginDynamicLabel()
{
  return &type metadata for CountryOfOriginDynamicLabel;
}

uint64_t sub_24021DA4C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24021DA5C@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
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
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;

  v3 = a1 & 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_retain();
  v8 = sub_24021B0E0(v7, v3);
  swift_release();
  swift_getKeyPath();
  v31 = v8;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v9 = *(unsigned __int8 *)(v8 + 67);
  swift_release();
  if (v9 == 1)
  {
    v10 = swift_retain();
    v11 = sub_24021B0E0(v10, v3);
    swift_release();
    swift_getKeyPath();
    v31 = v11;
    sub_2402265B8();
    swift_release();
    v13 = *(_QWORD *)(v11 + 72);
    v12 = *(_QWORD *)(v11 + 80);
    swift_bridgeObjectRetain();
    swift_release();
    v31 = v13;
    v32 = v12;
    sub_240218654();
    v14 = sub_240226810();
    v16 = v15;
    v18 = v17 & 1;
    v19 = sub_2402267B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 1, 1, v19);
    sub_2402267D4();
    sub_24021D960((uint64_t)v6);
    v20 = sub_2402267F8();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    swift_release();
    sub_24021A534(v14, v16, v18);
    swift_bridgeObjectRelease();
    v31 = v20;
    v32 = v22;
    v33 = v24 & 1;
    v34 = v26;
    sub_2402268A0();
    sub_24021A534(v20, v22, v24 & 1);
    swift_bridgeObjectRelease();
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a2, 0, 1, v27);
  }
  else
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(a2, 1, 1, v29);
  }
}

uint64_t sub_24021DD2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24021DA5C(*(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_24021DD38@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 67);
  return result;
}

uint64_t sub_24021DDC4()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_24021DE6C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v4 = *(_QWORD *)(v3 + 80);
  *a2 = *(_QWORD *)(v3 + 72);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24021DEFC()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  swift_bridgeObjectRetain();
  sub_2402265AC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24021DFC8()
{
  uint64_t *v0;

  return sub_240223134(v0[2], v0[3], v0[4]);
}

uint64_t sub_24021DFE4()
{
  uint64_t v0;

  return sub_24022312C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t initializeBufferWithCopyOfBuffer for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegalDocumentSectionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegalDocumentSectionModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegalDocumentSectionModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LegalDocumentSectionModel()
{
  return &type metadata for LegalDocumentSectionModel;
}

unint64_t sub_24021E158()
{
  unint64_t result;

  result = qword_256FDCAA8;
  if (!qword_256FDCAA8)
  {
    result = MEMORY[0x242680F28](&unk_2402280C0, &type metadata for LegalDocumentSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_256FDCAA8);
  }
  return result;
}

uint64_t sub_24021E19C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2)
    return sub_24021E1C0(*((_QWORD *)a1 + 1), *((_QWORD *)a2 + 1));
  else
    return 0;
}

uint64_t sub_24021E1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  unint64_t v21;
  uint64_t v22;
  char *v23;
  _QWORD v25[9];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v26 = sub_240226588();
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v25 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_256FDCAB0);
  MEMORY[0x24BDAC7A8](v13);
  v14 = type metadata accessor for LegalDocumentModel(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v20 = *(_QWORD *)(a1 + 16);
  if (v20 != *(_QWORD *)(a2 + 16))
    return 0;
  v25[6] = v12;
  v25[7] = v13;
  v25[8] = v10;
  if (v20)
  {
    if (a1 != a2)
    {
      v31 = v16;
      v25[5] = v4;
      v21 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      v27 = *(_QWORD *)(v17 + 72);
      v32 = &unk_240228110;
      v25[3] = "es";
      v25[4] = v6;
      v25[2] = "deviceRFExposure";
      v25[1] = "deviceROHSCompliance";
      v25[0] = "deviceBuiltInApps";
      v28 = a1;
      v29 = a2;
      v30 = v7;
      v22 = v19;
      v23 = (char *)v25 - v18;
      sub_2402192B0(a1 + v21, (uint64_t)v25 - v18, type metadata accessor for LegalDocumentModel);
      sub_2402192B0(a2 + v21, v22, type metadata accessor for LegalDocumentModel);
      __asm { BR              X10 }
    }
  }
  return 1;
}

uint64_t sub_24021E844(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_256FDCAB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_24021E888(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

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
    v5 = *((_BYTE *)a2 + 8);
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = v5;
    v6 = *(int *)(a3 + 20);
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    *(_BYTE *)(a1 + v6) = *((_BYTE *)a2 + v6);
    v9 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
    v10 = (_QWORD *)(v7 + v9);
    v11 = (_QWORD *)(v8 + v9);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = v11[1];
      *v10 = *v11;
      v10[1] = v12;
      swift_bridgeObjectRetain();
    }
    else
    {
      v14 = sub_240226588();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_24021E990(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = v4 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_bridgeObjectRelease();
  v7 = sub_240226588();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
}

uint64_t sub_24021EA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = *(int *)(a3 + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  *(_BYTE *)(a1 + v5) = *(_BYTE *)(a2 + v5);
  v8 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  v9 = (_QWORD *)(v6 + v8);
  v10 = (_QWORD *)(v7 + v8);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = sub_240226588();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24021EAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    v11 = *(int *)(v10 + 20);
    v12 = (_QWORD *)(v8 + v11);
    v13 = (_QWORD *)(v9 + v11);
    sub_240218D54((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v14 = sub_240226588();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24021EBE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(int *)(a3 + 20);
  v5 = a1 + v4;
  v6 = a2 + v4;
  *(_BYTE *)(a1 + v4) = *(_BYTE *)(a2 + v4);
  v7 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  v8 = (void *)(v5 + v7);
  v9 = (const void *)(v6 + v7);
  v10 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v11 = sub_240226588();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24021ECA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_release();
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    v11 = *(int *)(v10 + 20);
    v12 = (void *)(v8 + v11);
    v13 = (const void *)(v9 + v11);
    sub_240218D54((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    v14 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v15 = sub_240226588();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24021ED94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24021EDA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1)
      return (v4 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for LegalDocumentModel(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_24021EE14()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24021EE20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 8) = -(char)a2;
  }
  else
  {
    v7 = type metadata accessor for LegalDocumentModel(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LegalDocumentCell()
{
  uint64_t result;

  result = qword_256FDCB10;
  if (!qword_256FDCB10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24021EECC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LegalDocumentModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24021EF40()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_24021EF50(uint64_t a1@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(_QWORD, _QWORD);
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t KeyPath;
  uint64_t v52;
  id v53;
  unsigned int v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(_QWORD, _QWORD);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  void (*v121)(uint64_t@<X8>);
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char v127;

  v2 = v1;
  v118 = a1;
  v100 = sub_24022660C();
  v99 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v98 = (char *)v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = sub_2402266B4();
  v96 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v95 = (char *)v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LegalDocumentModel(0);
  MEMORY[0x24BDAC7A8](v5);
  v85 = (uint64_t)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for LegalDocumentWebView(0);
  MEMORY[0x24BDAC7A8](v84);
  v86 = (_QWORD *)((char *)v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB48);
  MEMORY[0x24BDAC7A8](v119);
  v87 = (uint64_t)v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB50);
  v91 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v120 = (char *)v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB58);
  v92 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v90 = (char *)v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB60);
  v108 = *(_QWORD *)(v109 - 8);
  v11 = MEMORY[0x24BDAC7A8](v109);
  v89 = (char *)v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v88 = (uint64_t)v81 - v13;
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB68);
  v14 = MEMORY[0x24BDAC7A8](v110);
  v105 = (uint64_t)v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v107 = (uint64_t)v81 - v16;
  v17 = type metadata accessor for LegalDocumentCell();
  v103 = *(_QWORD *)(v17 - 8);
  v18 = *(_QWORD *)(v103 + 64);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v102 = (uint64_t)v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v81 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB70);
  v115 = *(_QWORD *)(v22 - 8);
  v116 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v114 = (char *)v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB78);
  MEMORY[0x24BDAC7A8](v24);
  v113 = (char *)v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC950);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)v81 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)v81 - v31;
  v33 = *(_BYTE *)(v1 + 8);
  v34 = swift_retain();
  sub_24021B0E0(v34, v33);
  swift_release();
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_240226978();
  v111 = v32;
  sub_24022696C();
  swift_getKeyPath();
  sub_240226984();
  v35 = (uint64_t)v21;
  swift_release();
  v36 = *(void (**)(_QWORD, _QWORD))(v27 + 8);
  v112 = v26;
  v106 = v36;
  v36(v30, v26);
  v38 = v125;
  v37 = v126;
  v83 = v17;
  v104 = *(int *)(v17 + 20);
  LOBYTE(v27) = *(_BYTE *)(v1 + v104);
  v39 = v127;
  sub_2402192B0(v2, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for LegalDocumentCell);
  v117 = v2;
  v40 = v102;
  sub_2402192B0(v2, v102, (uint64_t (*)(_QWORD))type metadata accessor for LegalDocumentCell);
  v41 = (*(unsigned __int8 *)(v103 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
  v42 = swift_allocObject();
  sub_2402200A0(v40, v42 + v41, (uint64_t (*)(_QWORD))type metadata accessor for LegalDocumentCell);
  v43 = sub_24021FADC(v27, v38, v37, v39);
  v45 = v44;
  v101 = v46;
  v121 = sub_24021FD6C;
  v122 = v42;
  swift_retain();
  swift_retain();
  v103 = v37;
  v47 = sub_24021FBB4(v38, v37, v39);
  v102 = v45;
  if (v48)
  {
    v81[0] = v48;
    v81[1] = v47;
    v81[4] = v38;
    v49 = (char *)(v35 + *(int *)(v83 + 20));
    v50 = v85;
    sub_2402192B0((uint64_t)v49, v85, type metadata accessor for LegalDocumentModel);
    KeyPath = swift_getKeyPath();
    v52 = (uint64_t)v86;
    *v86 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC768);
    swift_storeEnumTagMultiPayload();
    sub_2402200A0(v50, v52 + *(int *)(v84 + 20), type metadata accessor for LegalDocumentModel);
    v53 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v54 = objc_msgSend(v53, sel_sf_isiPad);

    v82 = v35;
    v81[3] = v42;
    v81[2] = v43;
    if (v54)
      v55 = sub_240226774();
    else
      v55 = sub_240226798();
    v59 = v55;
    v60 = v87;
    sub_2402192B0(v52, v87, type metadata accessor for LegalDocumentWebView);
    v61 = v60 + *(int *)(v119 + 36);
    *(_BYTE *)v61 = v59;
    *(_OWORD *)(v61 + 8) = 0u;
    *(_OWORD *)(v61 + 24) = 0u;
    *(_BYTE *)(v61 + 40) = 1;
    sub_240218D54(v52, type metadata accessor for LegalDocumentWebView);
    sub_240219470(*v49);
    v63 = v62;
    v65 = v64;
    v67 = v66 & 1;
    v68 = v96;
    v69 = v95;
    v70 = v97;
    (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v95, *MEMORY[0x24BDEE5F0], v97);
    v71 = sub_24021FFAC();
    v72 = v119;
    sub_240226888();
    sub_24021A534(v63, v65, v67);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
    sub_2402200E4(v60);
    v73 = v98;
    sub_240226600();
    v123 = v72;
    v124 = v71;
    swift_getOpaqueTypeConformance2();
    v74 = v90;
    v75 = v93;
    v76 = v120;
    sub_240226858();
    (*(void (**)(char *, uint64_t))(v99 + 8))(v73, v100);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v76, v75);
    LOBYTE(v73) = sub_240226780();
    v77 = v92;
    v78 = (uint64_t)v89;
    v79 = v94;
    (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v89, v74, v94);
    v57 = v109;
    *(_BYTE *)(v78 + *(int *)(v109 + 36)) = (_BYTE)v73;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v74, v79);
    v80 = v88;
    sub_240220124(v78, v88, &qword_256FDCB60);
    v58 = v105;
    sub_240220124(v80, v105, &qword_256FDCB60);
    swift_release();
    swift_release();
    v56 = 0;
    v35 = v82;
  }
  else
  {
    v56 = 1;
    v57 = v109;
    v58 = v105;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v108 + 56))(v58, v56, 1, v57);
  sub_240220124(v58, v107, &qword_256FDCB68);
  sub_24021FE84();
  sub_240226630();
  swift_release();
  sub_240218D54(v35, (uint64_t (*)(_QWORD))type metadata accessor for LegalDocumentCell);
  swift_release();
  swift_release();
  __asm { BR              X10 }
}

uint64_t sub_24021F9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_240220030();
  v3 = *(_QWORD *)(v2 - 240);
  v4 = *(_QWORD *)(v2 - 216);
  sub_2402268A0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 224) + 8))(v0, v4);
  (*(void (**)(_QWORD, _QWORD))(v2 - 296))(*(_QWORD *)(v2 - 256), *(_QWORD *)(v2 - 248));
  return sub_240220124(v3, v1, &qword_256FDCB78);
}

uint64_t sub_24021FADC(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 32) = a2;
  *(_QWORD *)(v8 + 40) = a3;
  *(_BYTE *)(v8 + 48) = a4;
  *(_BYTE *)(v8 + 49) = a1;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_QWORD *)(v9 + 32) = a2;
  *(_QWORD *)(v9 + 40) = a3;
  *(_BYTE *)(v9 + 48) = a4;
  *(_BYTE *)(v9 + 49) = a1;
  swift_retain_n();
  swift_retain_n();
  sub_240226924();
  return v11;
}

uint64_t sub_24021FBB4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v12 = a1;
  v13 = a2;
  v14 = a3;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBA0);
  MEMORY[0x24268094C](&v11, v3);
  v4 = v11;
  if (v11 == 9)
  {
    swift_release();
    swift_release();
    return 0;
  }
  else
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = 0;
    *(_BYTE *)(v6 + 32) = v4;
    v7 = v12;
    v8 = v13;
    v9 = v14;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(v10 + 24) = 0;
    *(_QWORD *)(v10 + 32) = v7;
    *(_QWORD *)(v10 + 40) = v8;
    *(_BYTE *)(v10 + 48) = v9;
    sub_240226930();
    return v11;
  }
}

uint64_t sub_24021FCB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LegalDocumentCell();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  v3 = *(int *)(v1 + 20);
  v4 = v0 + ((v2 + 16) & ~v2) + v3 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_240226588();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return swift_deallocObject();
}

void sub_24021FD6C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v3 = type metadata accessor for LegalDocumentCell();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  sub_240219470(*(_BYTE *)(v1 + ((v4 + 16) & ~v4) + *(int *)(v3 + 20)));
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
}

uint64_t sub_24021FDC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_240226624();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_240226690();
}

double sub_24021FE3C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  double result;
  __int128 v6;
  char v7;
  uint64_t v8;

  (*(void (**)(__int128 *__return_ptr))(v1 + 16))(&v6);
  v3 = v7;
  v4 = v8;
  result = *(double *)&v6;
  *(_OWORD *)a1 = v6;
  *(_BYTE *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  return result;
}

unint64_t sub_24021FE84()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256FDCB80;
  if (!qword_256FDCB80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB68);
    v2 = sub_24021FEE8();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDCB80);
  }
  return result;
}

unint64_t sub_24021FEE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_256FDCB88;
  if (!qword_256FDCB88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB60);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB50);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB48);
    sub_24021FFAC();
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x24BDF0420];
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256FDCB88);
  }
  return result;
}

unint64_t sub_24021FFAC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCB90;
  if (!qword_256FDCB90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB48);
    v2[0] = sub_24021A680(&qword_256FDC810, type metadata accessor for LegalDocumentWebView, (uint64_t)&unk_2402271A0);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCB90);
  }
  return result;
}

unint64_t sub_240220030()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDCB98;
  if (!qword_256FDCB98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB70);
    result = MEMORY[0x242680F28](MEMORY[0x24BDEC8E0], v1);
    atomic_store(result, (unint64_t *)&qword_256FDCB98);
  }
  return result;
}

uint64_t sub_24022007C()
{
  return sub_240226684();
}

uint64_t sub_2402200A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2402200E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCB48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240220124(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_240220168()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_24022018C(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t sub_240220198()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBA0);
  return sub_240226918();
}

uint64_t sub_2402201EC()
{
  return objectdestroy_9Tm();
}

uint64_t sub_2402201F4()
{
  return sub_240220198();
}

void sub_240220200(uint64_t *a1@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v8 = *a1;
  v9 = v3;
  v10 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBA0);
  MEMORY[0x24268094C](&v7, v5);
  if (v7 == 9)
    v6 = 0;
  else
    sub_2402214AC(v7);
  *a2 = v6 & 1;
}

uint64_t sub_24022027C()
{
  return objectdestroy_9Tm();
}

void sub_240220284(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_240220200((uint64_t *)(v1 + 32), a1);
}

uint64_t sub_240220294()
{
  return objectdestroy_9Tm();
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2402202DC()
{
  return sub_2402202F0();
}

uint64_t sub_2402202F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBA0);
  sub_240226900();
  sub_240226918();
  swift_release();
  return swift_release();
}

unint64_t sub_24022038C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCBA8;
  if (!qword_256FDCBA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCB78);
    v2[0] = sub_240220030();
    v2[1] = sub_24021A680((unint64_t *)&qword_256FDC8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCBA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceSerialNumberQRCodeImage()
{
  return &type metadata for DeviceSerialNumberQRCodeImage;
}

uint64_t sub_240220420()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_240220430()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  _OWORD v15[13];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _OWORD v24[13];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBB0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2402266E4();
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_sf_serialNumberQRImage);

  v6 = sub_2402268AC();
  v7 = sub_2402267A4();
  v16 = v3;
  v17 = 0;
  v18 = 1;
  v19 = v6;
  v20 = v7;
  v21 = 0u;
  v22 = 0u;
  v23 = 1;
  sub_24022699C();
  sub_24022070C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v24, 0.0, 1, 0.0, 1);
  swift_release();
  v15[9] = v24[8];
  v15[10] = v24[9];
  v15[11] = v24[10];
  v15[12] = v24[11];
  v15[5] = v24[4];
  v15[6] = v24[5];
  v15[7] = v24[6];
  v15[8] = v24[7];
  v15[1] = v24[0];
  v15[2] = v24[1];
  v15[3] = v24[2];
  v15[4] = v24[3];
  sub_2402266C0();
  if (qword_256FDC610 != -1)
    swift_once();
  v8 = (id)qword_256FDD028;
  v9 = sub_240226804();
  v11 = v10;
  v13 = v12 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBB8);
  sub_2402208E0(&qword_256FDCBC0, &qword_256FDCBB8, sub_2402208BC, MEMORY[0x24BDEDBB8]);
  sub_240226864();
  sub_24021A534(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_240220994((uint64_t)v24);
  sub_24022663C();
  return sub_2402209BC((uint64_t)v2);
}

uint64_t sub_24022070C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_240226A5C();
    v23 = (void *)sub_240226768();
    sub_2402265DC();

  }
  sub_240226648();
  v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return sub_2402209FC((uint64_t)v13);
}

uint64_t sub_2402208BC()
{
  return sub_2402208E0(&qword_256FDCBC8, &qword_256FDCBD0, (uint64_t (*)(void))sub_240220948, MEMORY[0x24BDECC60]);
}

uint64_t sub_2402208E0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_240220948()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDCBD8;
  if (!qword_256FDCBD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCBE0);
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256FDCBD8);
  }
  return result;
}

uint64_t sub_240220994(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_2402209BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCBB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2402209FC(uint64_t a1)
{
  swift_retain();
  return a1;
}

unint64_t sub_240220A28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCBE8;
  if (!qword_256FDCBE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCBB0);
    v2[0] = sub_2402208E0(&qword_256FDCBC0, &qword_256FDCBB8, sub_2402208BC, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_240220AB4();
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCBE8);
  }
  return result;
}

unint64_t sub_240220AB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDC8E8;
  if (!qword_256FDC8E8)
  {
    v1 = sub_240226750();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_256FDC8E8);
  }
  return result;
}

uint64_t *sub_240220AFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (uint64_t *)((char *)a1 + v5);
    v7 = (uint64_t *)((char *)a2 + v5);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v8 = v7[1];
      *v6 = *v7;
      v6[1] = v8;
      swift_bridgeObjectRetain();
    }
    else
    {
      v10 = sub_240226588();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v6, v7, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t type metadata accessor for LegalDocumentModel.DocumentType(uint64_t a1)
{
  return sub_240219134(a1, qword_256FDCCF0);
}

uint64_t sub_240220BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = a1 + *(int *)(a2 + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_bridgeObjectRelease();
  v4 = sub_240226588();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2, v4);
}

_BYTE *sub_240220C48(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = v6[1];
    *v5 = *v6;
    v5[1] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    v8 = sub_240226588();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v5, v6, v8);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_BYTE *sub_240220CE8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;

  *a1 = *a2;
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 20);
    v5 = &a1[v4];
    v6 = &a2[v4];
    sub_240220DA0((uint64_t)&a1[v4]);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *v5 = *v6;
      v5[1] = v6[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v7 = sub_240226588();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_240220DA0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *sub_240220DDC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    v8 = sub_240226588();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_BYTE *sub_240220E7C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  if (a1 != a2)
  {
    v4 = *(int *)(a3 + 20);
    v5 = &a1[v4];
    v6 = &a2[v4];
    sub_240220DA0((uint64_t)&a1[v4]);
    v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      v8 = sub_240226588();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_240220F2C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240220F38(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 247)
  {
    v4 = *a1;
    if (v4 >= 9)
      return v4 - 8;
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_240220FAC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_240220FB8(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 247)
  {
    *result = a2 + 8;
  }
  else
  {
    v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LegalDocumentModel(uint64_t a1)
{
  return sub_240219134(a1, qword_256FDCC48);
}

uint64_t sub_24022103C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LegalDocumentModel.DocumentType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2402210B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      v8 = sub_240226588();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24022116C(uint64_t a1)
{
  uint64_t v3;

  if (swift_getEnumCaseMultiPayload() == 1)
    return swift_bridgeObjectRelease();
  v3 = sub_240226588();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *sub_2402211BC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = sub_240226588();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_24022124C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_240220DA0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v4 = sub_240226588();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_2402212F4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_240226588();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24022137C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_240220DA0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_240226588();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_240221414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_240221420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_240221430()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_240221440()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240226588();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void sub_2402214AC(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_2402214F8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2402215FC + 4 * byte_2402278F9[a2]))(0x694C656369766564);
}

uint64_t sub_2402215FC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x694C656369766564 && v1 == 0xED000065736E6563)
    v2 = 1;
  else
    v2 = sub_240226AEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_240221754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = sub_240226588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24022209C(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_2402218A4()
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
  uint64_t v10;

  v1 = v0;
  v2 = sub_240226588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240226AF8();
  sub_24022209C(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_240226B10();
}

uint64_t sub_240221A10()
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
  uint64_t v10;

  v1 = v0;
  v2 = sub_240226588();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240226AF8();
  sub_24022209C(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_240226B10();
}

uint64_t sub_240221B78(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = sub_240226588();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2402197FC(a1, *v1);
  v10 = type metadata accessor for LegalDocumentModel(0);
  sub_24022209C((uint64_t)&v1[*(int *)(v10 + 20)], (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_240221CE4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE v11[72];

  v1 = sub_240226588();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_240226AF8();
  sub_2402197FC((uint64_t)v11, *v0);
  v8 = type metadata accessor for LegalDocumentModel(0);
  sub_24022209C((uint64_t)&v0[*(int *)(v8 + 20)], (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return sub_240226B10();
}

uint64_t sub_240221E60()
{
  return sub_24021A680(&qword_256FDCD28, type metadata accessor for LegalDocumentModel.DocumentType, (uint64_t)&unk_240227968);
}

uint64_t sub_240221E94(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE v13[72];

  v4 = sub_240226588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_240226AF8();
  sub_2402197FC((uint64_t)v13, *v2);
  sub_24022209C((uint64_t)&v2[*(int *)(a2 + 20)], (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_240226B04();
    sub_240226A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_240226B04();
    sub_24021A680(&qword_256FDCD38, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    sub_2402269C0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return sub_240226B10();
}

uint64_t sub_240222014(char *a1, uint64_t a2, uint64_t a3)
{
  char v6;

  sub_2402214AC(*a1);
  if ((v6 & 1) != 0)
    return sub_2402220E0((uint64_t)&a1[*(int *)(a3 + 20)], a2 + *(int *)(a3 + 20));
  else
    return 0;
}

uint64_t sub_240222070()
{
  return sub_24021A680(&qword_256FDCD30, type metadata accessor for LegalDocumentModel, (uint64_t)&unk_2402279D0);
}

uint64_t sub_24022209C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2402220E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v4 = sub_240226588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_256FDCAB0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_24022209C(a1, (uint64_t)v17);
  sub_24022209C(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_24022209C((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      v23 = MEMORY[0x2426805A4](v13, v7);
      v24 = *(void (**)(char *, uint64_t))(v5 + 8);
      v24(v7, v4);
      v24(v13, v4);
      sub_240220DA0((uint64_t)v17);
      return v23 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    goto LABEL_12;
  }
  sub_24022209C((uint64_t)v17, (uint64_t)v11);
  v20 = *v11;
  v19 = v11[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_24021E844((uint64_t)v17);
    goto LABEL_13;
  }
  if (v20 == *(_QWORD *)v18 && v19 == *((_QWORD *)v18 + 1))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  v22 = sub_240226AEC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
  {
LABEL_16:
    sub_240220DA0((uint64_t)v17);
    v23 = 1;
    return v23 & 1;
  }
  sub_240220DA0((uint64_t)v17);
LABEL_13:
  v23 = 0;
  return v23 & 1;
}

uint64_t sub_24022233C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FindLegalAndRegulatorySettingsSupportClass()
{
  return objc_opt_self();
}

id sub_24022236C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for FindLegalAndRegulatorySettingsSupportClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256FDD028 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for EyesightWarningDynamicLabel()
{
  return &type metadata for EyesightWarningDynamicLabel;
}

uint64_t sub_2402223D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2402223E0@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v27 = a2;
  v2 = a1 & 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_retain();
  v7 = sub_24021B0E0(v6, v2);
  swift_release();
  swift_getKeyPath();
  v28 = v7;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v8 = *(unsigned __int8 *)(v7 + 64);
  swift_release();
  if (v8 == 1)
  {
    v25 = sub_2402266E4();
    sub_240222674((uint64_t)&v28);
    v10 = v28;
    v9 = v29;
    v24[0] = v28;
    v11 = v30;
    v12 = v31;
    v13 = v32;
    v14 = v33;
    v15 = v34;
    v16 = v35;
    v26 = v35;
    v17 = sub_2402267B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
    v18 = sub_2402267D4();
    v24[1] = v18;
    sub_24021D960((uint64_t)v5);
    KeyPath = swift_getKeyPath();
    v28 = v25;
    v29 = 0x3FF3333333333333;
    v30 = 0;
    v31 = v10;
    v32 = v9;
    LOBYTE(v33) = v11;
    v34 = v12;
    v35 = v13;
    v36 = v14;
    v37 = v15;
    v38 = v16;
    v39 = KeyPath;
    v40 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCDE0);
    v20 = v27;
    sub_240222894();
    sub_2402268A0();
    sub_24021A534(v24[0], v9, v11);
    swift_bridgeObjectRelease();
    sub_24021A534(v13, v14, v15);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCDD8);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 0, 1, v21);
  }
  else
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCDD8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v27, 1, 1, v23);
  }
}

uint64_t sub_240222674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = 0x100000000000003CLL;
  *(_QWORD *)(a1 + 8) = 0x8000000240228AE0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 32) = 0x1000000000000030;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 40) = 0x8000000240228B20;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = v1;
  sub_24021A54C(0x100000000000003CLL, 0x8000000240228AE0, 0);
  swift_bridgeObjectRetain();
  sub_24021A54C(0x1000000000000030, 0x8000000240228B20, 0);
  swift_bridgeObjectRetain();
  sub_24021A534(0x1000000000000030, 0x8000000240228B20, 0);
  swift_bridgeObjectRelease();
  sub_24021A534(0x100000000000003CLL, 0x8000000240228AE0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_240222744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2402223E0(*(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_240222750@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 64);
  return result;
}

uint64_t sub_2402227DC()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

unint64_t sub_240222894()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCDE8;
  if (!qword_256FDCDE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCDE0);
    v2[0] = sub_24021CFDC(&qword_256FDCDF0, &qword_256FDCDF8, MEMORY[0x24BDF4700]);
    v2[1] = sub_24021CFDC(&qword_256FDCE00, &qword_256FDCE08, MEMORY[0x24BDF1028]);
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCDE8);
  }
  return result;
}

uint64_t sub_240222930()
{
  uint64_t v0;

  return sub_2402230A8(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_240222950()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256FDCE10;
  if (!qword_256FDCE10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCE18);
    v2 = sub_2402229B4();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDCE10);
  }
  return result;
}

unint64_t sub_2402229B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCE20;
  if (!qword_256FDCE20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCDD8);
    v2[0] = sub_240222894();
    v2[1] = sub_24021A680((unint64_t *)&qword_256FDC8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCE20);
  }
  return result;
}

uint64_t sub_240222A38()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_240222AA4()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_240222B20()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(id *)(v0 + 88);
}

uint64_t sub_240222B8C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_240222BF8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t sub_240222C64()
{
  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_240222CD4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t sub_240222D40()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_240222DBC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF50);
  v2 = (_QWORD *)sub_240226AC8();
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
    result = sub_2402240B4(v5, v6);
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

uint64_t sub_240222ED4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t sub_240222F40(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t sub_240222F48(uint64_t result, char a2)
{
  *(_BYTE *)(result + 17) = a2;
  return result;
}

uint64_t sub_240222F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240222F88()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_240222FF4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

uint64_t sub_240222FFC(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 48) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240223034()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(_QWORD *)(v0 + 56);
}

uint64_t sub_2402230A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 56) = a2;
  return result;
}

uint64_t sub_2402230A8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 64) = a2;
  return result;
}

uint64_t sub_2402230B0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 65) = a2;
  return result;
}

uint64_t sub_2402230B8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_24021AD70();
  sub_2402265B8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t sub_240223124(uint64_t result, char a2)
{
  *(_BYTE *)(result + 66) = a2;
  return result;
}

uint64_t sub_24022312C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 67) = a2;
  return result;
}

uint64_t sub_240223134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 72) = a2;
  *(_QWORD *)(a1 + 80) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_24022316C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = a2;
  v3 = a2;

}

_QWORD *sub_24022319C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  size_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  size_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  size_t v24;
  uint64_t v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *result;
  uint64_t v33;
  void *v34;
  size_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  _BYTE v56[32];
  _QWORD v57[7];

  v0 = type metadata accessor for LegalDocumentModel(0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (id)SFAcknowledgementsDocumentFilePath();
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v6 = v4;
    sub_2402269FC();

    sub_240226558();
    swift_bridgeObjectRelease();
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_storeEnumTagMultiPayload();
    *v3 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF60);
    v7 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_2402274C0;
    sub_240224A34((uint64_t)v3, v8 + v7);
    v55 = v5;
    sub_240224448(v8);
    v5 = v55;
  }
  v9 = (id)SFLicenseFilePath();
  sub_2402269FC();

  sub_240226558();
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_storeEnumTagMultiPayload();
  *v3 = 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF60);
  v12 = *(_QWORD *)(v1 + 72);
  v13 = *(unsigned __int8 *)(v1 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = v13 | 7;
  v51 = v14 + v12;
  v16 = swift_allocObject();
  v54 = xmmword_2402274C0;
  *(_OWORD *)(v16 + 16) = xmmword_2402274C0;
  v49 = v16;
  sub_240224A34((uint64_t)v3, v16 + v14);
  v17 = (id)SFWarrantyFilePath();
  v50 = v5;
  v52 = v11;
  v53 = v10;
  if (!v17)
  {
    v19 = v15;
    v48 = MEMORY[0x24BEE4AF8];
    if (SFShouldShowRoHSCompliance())
      goto LABEL_5;
LABEL_8:
    v25 = MEMORY[0x24BEE4AF8];
    goto LABEL_9;
  }
  v18 = v17;
  sub_2402269FC();

  sub_240226558();
  swift_bridgeObjectRelease();
  swift_storeEnumTagMultiPayload();
  *v3 = 2;
  v19 = v15;
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v54;
  sub_240224A34((uint64_t)v3, v20 + v14);
  v55 = MEMORY[0x24BEE4AF8];
  sub_240224448(v20);
  v48 = v55;
  if (!SFShouldShowRoHSCompliance())
    goto LABEL_8;
LABEL_5:
  v21 = (id)SFRoHSComplianceDocumentFilePath();
  v22 = MEMORY[0x24BEE4AF8];
  if (!v21)
  {
    v47 = MEMORY[0x24BEE4AF8];
    goto LABEL_10;
  }
  v23 = v21;
  sub_2402269FC();

  sub_240226558();
  swift_bridgeObjectRelease();
  swift_storeEnumTagMultiPayload();
  *v3 = 4;
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = v54;
  sub_240224A34((uint64_t)v3, v24 + v14);
  v55 = v22;
  sub_240224448(v24);
  v25 = v55;
LABEL_9:
  v47 = v25;
LABEL_10:
  v26 = (uint64_t *)&v3[*(int *)(v0 + 20)];
  v27 = (id)SFRFExposureDocumentHTMLString();
  v28 = sub_2402269FC();
  v30 = v29;

  *v26 = v28;
  v26[1] = v30;
  swift_storeEnumTagMultiPayload();
  *v3 = 3;
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v54;
  sub_240224A34((uint64_t)v3, v31 + v14);
  result = (_QWORD *)SFShouldShowBuiltInApps();
  if ((_DWORD)result)
  {
    v46 = v19;
    result = (id)SFBuiltInAppsDocumentFilePath();
    v33 = MEMORY[0x24BEE4AF8];
    if (result)
    {
      v34 = result;
      sub_2402269FC();

      sub_240226558();
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
      *v3 = 5;
      v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = v54;
      sub_240224A34((uint64_t)v3, v35 + v14);
      v55 = v33;
      result = (_QWORD *)sub_240224448(v35);
      v33 = v55;
    }
  }
  else
  {
    v33 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)&v54 = v57;
  v57[0] = v50;
  v57[1] = v49;
  v57[2] = v48;
  v57[3] = v47;
  v57[4] = v31;
  v57[5] = v33;
  v36 = 32;
  v37 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v38 = *(_QWORD *)&v56[v36];
    v39 = *(_QWORD *)(v38 + 16);
    v40 = v37[2];
    v41 = v40 + v39;
    if (__OFADD__(v40, v39))
      break;
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v41 <= v37[3] >> 1)
    {
      if (*(_QWORD *)(v38 + 16))
        goto LABEL_26;
    }
    else
    {
      if (v40 <= v41)
        v42 = v40 + v39;
      else
        v42 = v40;
      result = (_QWORD *)sub_240224648((size_t)result, v42, 1, v37);
      v37 = result;
      if (*(_QWORD *)(v38 + 16))
      {
LABEL_26:
        if ((v37[3] >> 1) - v37[2] < v39)
          goto LABEL_34;
        result = (_QWORD *)swift_arrayInitWithCopy();
        if (v39)
        {
          v43 = v37[2];
          v44 = __OFADD__(v43, v39);
          v45 = v43 + v39;
          if (v44)
            goto LABEL_35;
          v37[2] = v45;
        }
        goto LABEL_16;
      }
    }
    if (v39)
      goto LABEL_33;
LABEL_16:
    result = (_QWORD *)swift_bridgeObjectRelease();
    v36 += 8;
    if (v36 == 80)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF68);
      swift_arrayDestroy();
      return v37;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

size_t sub_240223760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  size_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  size_t v18;
  int64_t v19;
  size_t result;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  _QWORD v41[2];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v0 = type metadata accessor for LegalDocumentModel(0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (id)SFAudioAccessoryAcknowledgementsDocumentFilePath();
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v6 = v4;
    sub_2402269FC();

    sub_240226558();
    swift_bridgeObjectRelease();
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_storeEnumTagMultiPayload();
    *v3 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF60);
    v7 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_2402274C0;
    sub_240224A34((uint64_t)v3, v8 + v7);
    v46 = v5;
    sub_240224448(v8);
    v5 = v46;
  }
  v9 = (id)SFAudioAccessoryLicenseFilePath();
  sub_2402269FC();
  v45 = v0;

  sub_240226558();
  swift_bridgeObjectRelease();
  v10 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_storeEnumTagMultiPayload();
  *v3 = 7;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF60);
  v12 = *(_QWORD *)(v1 + 72);
  v13 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v43 = v11;
  v44 = v12;
  v14 = swift_allocObject();
  v42 = xmmword_2402274C0;
  *(_OWORD *)(v14 + 16) = xmmword_2402274C0;
  sub_240224A34((uint64_t)v3, v14 + v13);
  v15 = (id)SFAudioAccessoryWarrantyFilePath();
  v16 = MEMORY[0x24BEE4AF8];
  if (v15)
  {
    v17 = v15;
    sub_2402269FC();
    v41[1] = v10;

    sub_240226558();
    swift_bridgeObjectRelease();
    swift_storeEnumTagMultiPayload();
    *v3 = 8;
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v42;
    sub_240224A34((uint64_t)v3, v18 + v13);
    v46 = v16;
    sub_240224448(v18);
    v16 = v46;
  }
  v47 = v5;
  v48 = v14;
  v49 = v16;
  v19 = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRetain();
  result = sub_240224648(0, v19, 1, MEMORY[0x24BEE4AF8]);
  v21 = (_QWORD *)result;
  if (*(_QWORD *)(v5 + 16))
  {
    if ((*(_QWORD *)(result + 24) >> 1) - *(_QWORD *)(result + 16) < v19)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    result = swift_arrayInitWithCopy();
    if (v19)
    {
      v22 = v21[2];
      v23 = __OFADD__(v22, v19);
      v24 = v22 + v19;
      if (v23)
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      v21[2] = v24;
    }
  }
  else if (v19)
  {
    __break(1u);
    goto LABEL_39;
  }
  swift_bridgeObjectRelease();
  v25 = v48;
  v26 = *(_QWORD *)(v48 + 16);
  v27 = v21[2];
  v28 = v27 + v26;
  if (__OFADD__(v27, v26))
  {
    __break(1u);
LABEL_19:
    if (v27 <= v28)
      v32 = v27 + v26;
    else
      v32 = v27;
    result = sub_240224648(1uLL, v32, 1, v21);
    v21 = (_QWORD *)result;
    v27 = *(_QWORD *)(result + 16);
    if (*(_QWORD *)(v25 + 16))
      goto LABEL_14;
    goto LABEL_23;
  }
  v29 = v21[3];
  result = swift_bridgeObjectRetain();
  if (v28 > (uint64_t)(v29 >> 1))
    goto LABEL_19;
  if (!v26)
  {
LABEL_23:
    if (!v26)
      goto LABEL_24;
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_14:
  if ((v21[3] >> 1) - v27 < v26)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  result = swift_arrayInitWithCopy();
  if (v26)
  {
    v30 = v21[2];
    v23 = __OFADD__(v30, v26);
    v31 = v30 + v26;
    if (v23)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    v21[2] = v31;
  }
LABEL_24:
  swift_bridgeObjectRelease();
  v33 = v49;
  v34 = *(_QWORD *)(v49 + 16);
  v35 = v21[2];
  v36 = v35 + v34;
  if (__OFADD__(v35, v34))
  {
    __break(1u);
  }
  else
  {
    v37 = v21[3];
    result = swift_bridgeObjectRetain();
    if (v36 <= (uint64_t)(v37 >> 1))
    {
      if (v34)
        goto LABEL_27;
      goto LABEL_36;
    }
  }
  if (v35 <= v36)
    v40 = v35 + v34;
  else
    v40 = v35;
  result = sub_240224648(1uLL, v40, 1, v21);
  v21 = (_QWORD *)result;
  v35 = *(_QWORD *)(result + 16);
  if (!*(_QWORD *)(v33 + 16))
  {
LABEL_36:
    if (!v34)
      goto LABEL_37;
    goto LABEL_40;
  }
LABEL_27:
  if ((v21[3] >> 1) - v35 < v34)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  result = swift_arrayInitWithCopy();
  if (!v34)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF68);
    swift_arrayDestroy();
    return (size_t)v21;
  }
  v38 = v21[2];
  v23 = __OFADD__(v38, v34);
  v39 = v38 + v34;
  if (!v23)
  {
    v21[2] = v39;
    goto LABEL_37;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t LegalAndRegulatorySettingsListState.__allocating_init()()
{
  id v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  char v10;
  char v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char v20;
  unint64_t v21;
  uint64_t v22;
  char v23;

  v23 = SFShouldShowIndiaBIS();
  v0 = (id)SFIndiaBISNumber();
  if (v0)
  {
    v1 = v0;
    v2 = sub_2402269FC();
    v21 = v3;
    v22 = v2;

  }
  else
  {
    v21 = 0xE000000000000000;
    v22 = 0;
  }
  v20 = SFShouldShowYearOfManufacture();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_sf_monthAndYearOfManufacture);

  if (v6)
  {
    sub_240223E28();
    v7 = sub_2402269B4();

  }
  else
  {
    v7 = sub_240222DBC(MEMORY[0x24BEE4AF8]);
  }
  v8 = objc_msgSend(v4, sel_currentDevice);
  v9 = objc_msgSend(v8, sel_sf_yearOfManufacture);

  v10 = SFShouldShowEyesightWarning();
  v11 = SFShouldShowMonthOfManufacture();
  v12 = SFShouldShowAlertMark();
  LOBYTE(v8) = SFShouldShowCountryOfOrigin();
  v13 = (id)SFCountryOfOrigin();
  v14 = sub_2402269FC();
  v16 = v15;

  v17 = (id)SFRegulatoryImage();
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = 9;
  sub_2402265C4();
  *(_BYTE *)(v18 + 17) = v23;
  *(_QWORD *)(v18 + 24) = v22;
  *(_QWORD *)(v18 + 32) = v21;
  *(_BYTE *)(v18 + 40) = v20;
  *(_QWORD *)(v18 + 48) = v7;
  *(_QWORD *)(v18 + 56) = v9;
  *(_BYTE *)(v18 + 64) = v10;
  *(_BYTE *)(v18 + 65) = v11;
  *(_BYTE *)(v18 + 66) = v12;
  *(_BYTE *)(v18 + 67) = (_BYTE)v8;
  *(_QWORD *)(v18 + 72) = v14;
  *(_QWORD *)(v18 + 80) = v16;
  *(_QWORD *)(v18 + 88) = v17;
  return v18;
}

unint64_t sub_240223E28()
{
  unint64_t result;

  result = qword_256FDCE28;
  if (!qword_256FDCE28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256FDCE28);
  }
  return result;
}

Swift::Void __swiftcall LegalAndRegulatorySettingsListState.handleURL(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  uint64_t KeyPath;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;

  v2 = v1;
  sub_240226A8C();
  if (*((_QWORD *)a1._rawValue + 2) && (v4 = sub_240224118((uint64_t)v7), (v5 & 1) != 0))
  {
    sub_24021B4E0(*((_QWORD *)a1._rawValue + 7) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  sub_240224148((uint64_t)v7);
  if (*((_QWORD *)&v9 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && sub_2402199D0() != 9)
    {
      KeyPath = swift_getKeyPath();
      MEMORY[0x24BDAC7A8](KeyPath);
      v7[0] = v2;
      sub_24021AD70();
      sub_2402265AC();
      swift_release();
    }
  }
  else
  {
    sub_24022417C((uint64_t)&v8);
  }
}

uint64_t LegalAndRegulatorySettingsListState.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1 = v0
     + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport35LegalAndRegulatorySettingsListState___observationRegistrar;
  v2 = sub_2402265D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LegalAndRegulatorySettingsListState.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1 = v0
     + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport35LegalAndRegulatorySettingsListState___observationRegistrar;
  v2 = sub_2402265D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

unint64_t sub_2402240B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_240226AF8();
  sub_240226A20();
  v4 = sub_240226B10();
  return sub_2402241BC(a1, a2, v4);
}

unint64_t sub_240224118(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240226A74();
  return sub_24022429C(a1, v2);
}

uint64_t sub_240224148(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_24022417C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCE30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2402241BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_240226AEC() & 1) == 0)
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
      while (!v14 && (sub_240226AEC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24022429C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2402248E8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242680AC0](v9, a1);
      sub_240224148((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_240224360(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_240224548((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

size_t sub_240224448(size_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_240224648(result, v11, 1, v3);
  v3 = (_QWORD *)result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = (v3[3] >> 1) - v3[2];
  result = type metadata accessor for LegalDocumentModel(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v8 = v3[2];
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_240224548(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF58);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_240224648(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF60);
  v10 = *(_QWORD *)(type metadata accessor for LegalDocumentModel(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for LegalDocumentModel(0) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void sub_2402247C4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

uint64_t type metadata accessor for LegalAndRegulatorySettingsListState()
{
  uint64_t result;

  result = qword_256FDCE68;
  if (!qword_256FDCE68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240224810()
{
  return type metadata accessor for LegalAndRegulatorySettingsListState();
}

uint64_t sub_240224818()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2402265D0();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for LegalAndRegulatorySettingsListState()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2402248E8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_240224924()
{
  _QWORD *v0;
  uint64_t inited;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_24022319C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2402274C0;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 40) = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_areAnySpeakersConfigured);
  v3 = MEMORY[0x24BEE4AF8];
  v4 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = sub_240223760();
    v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_2402274C0;
    *(_BYTE *)(v6 + 32) = 1;
    *(_QWORD *)(v6 + 40) = v5;
    sub_240224360(v6);
    v4 = v3;
  }
  v7 = swift_bridgeObjectRetain();
  sub_240224360(v7);
  sub_240224360(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v3;
}

uint64_t sub_240224A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LegalDocumentModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for IndonesiaAlertMarkDynamicLabel()
{
  return &type metadata for IndonesiaAlertMarkDynamicLabel;
}

uint64_t sub_240224AD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_240224AE8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 66);
  return result;
}

uint64_t sub_240224B74()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_240224C1C@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v3 = a1 & 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF78);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_retain();
  v12 = sub_24021B0E0(v11, v3);
  swift_release();
  swift_getKeyPath();
  v17[1] = v12;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v13 = *(unsigned __int8 *)(v12 + 66);
  swift_release();
  if (v13 == 1)
  {
    *(_QWORD *)v6 = sub_2402266E4();
    *((_QWORD *)v6 + 1) = 0x3FF3333333333333;
    v6[16] = 0;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF80);
    sub_240224E04((uint64_t)&v6[*(int *)(v14 + 44)]);
    sub_240225410();
    sub_2402268A0();
    sub_240218D18((uint64_t)v6, &qword_256FDCF70);
    sub_240220124((uint64_t)v10, a2, &qword_256FDCF78);
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v15, 1, v7);
}

uint64_t sub_240224E04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
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
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;

  v44 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF90);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_2402268E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF98);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCFA0);
  MEMORY[0x24BDAC7A8](v41);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCFA8);
  v15 = MEMORY[0x24BDAC7A8](v42);
  v45 = (uint64_t)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v46 = (uint64_t)&v39 - v17;
  v18 = sub_2402268B8();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF40A8], v6);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 28), v9, v6);
  *v5 = KeyPath;
  sub_24021B87C((uint64_t)v5, (uint64_t)v12 + *(int *)(v10 + 36), &qword_256FDCF90);
  *v12 = v18;
  swift_retain();
  sub_240218D18((uint64_t)v5, &qword_256FDCF90);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  v20 = sub_2402267B0();
  v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v21 = (uint64_t)v43;
  v40(v43, 1, 1, v20);
  sub_2402267D4();
  sub_240218D18(v21, &qword_256FDC8C0);
  sub_2402267C8();
  v22 = sub_2402267E0();
  swift_release();
  v23 = swift_getKeyPath();
  sub_24021B87C((uint64_t)v12, (uint64_t)v14, &qword_256FDCF98);
  v24 = (uint64_t *)&v14[*(int *)(v41 + 36)];
  *v24 = v23;
  v24[1] = v22;
  sub_240218D18((uint64_t)v12, &qword_256FDCF98);
  LOBYTE(v23) = sub_24022678C();
  v25 = v45;
  sub_24021B87C((uint64_t)v14, v45, &qword_256FDCFA0);
  v26 = v25 + *(int *)(v42 + 36);
  *(_BYTE *)v26 = v23;
  *(_OWORD *)(v26 + 8) = 0u;
  *(_OWORD *)(v26 + 24) = 0u;
  *(_BYTE *)(v26 + 40) = 1;
  sub_240218D18((uint64_t)v14, &qword_256FDCFA0);
  v27 = v46;
  sub_240220124(v25, v46, &qword_256FDCFA8);
  sub_24022532C((uint64_t)v47);
  v29 = v47[0];
  v28 = v47[1];
  LOBYTE(v9) = v48;
  v30 = v49;
  v39 = v51;
  LOBYTE(v5) = v52;
  v41 = v50;
  v42 = v53;
  sub_2402267BC();
  v40((char *)v21, 1, 1, v20);
  v31 = sub_2402267D4();
  sub_240218D18(v21, &qword_256FDC8C0);
  v32 = swift_getKeyPath();
  sub_24021B87C(v27, v25, &qword_256FDCFA8);
  v33 = v44;
  sub_24021B87C(v25, v44, &qword_256FDCFA8);
  v34 = v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256FDCFB0) + 48);
  *(_QWORD *)v34 = v29;
  *(_QWORD *)(v34 + 8) = v28;
  *(_BYTE *)(v34 + 16) = (_BYTE)v9;
  v36 = v41;
  v35 = v42;
  *(_QWORD *)(v34 + 24) = v30;
  *(_QWORD *)(v34 + 32) = v36;
  v37 = v39;
  *(_QWORD *)(v34 + 40) = v39;
  *(_BYTE *)(v34 + 48) = (_BYTE)v5;
  *(_QWORD *)(v34 + 56) = v35;
  *(_QWORD *)(v34 + 64) = v32;
  *(_QWORD *)(v34 + 72) = v31;
  sub_24021A54C(v29, v28, (char)v9);
  swift_bridgeObjectRetain();
  sub_24021A54C(v36, v37, (char)v5);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_240218D18(v46, &qword_256FDCFA8);
  sub_24021A534(v29, v28, (char)v9);
  swift_bridgeObjectRelease();
  sub_24021A534(v36, v37, (char)v5);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_240218D18(v45, &qword_256FDCFA8);
}

uint64_t sub_24022532C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = 0xD00000000000001CLL;
  *(_QWORD *)(a1 + 8) = 0x8000000240228D90;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a1 + 32) = 0xD000000000000015;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 40) = 0x8000000240228DB0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = v1;
  sub_24021A54C(0xD00000000000001CLL, 0x8000000240228D90, 0);
  swift_bridgeObjectRetain();
  sub_24021A54C(0xD000000000000015, 0x8000000240228DB0, 0);
  swift_bridgeObjectRetain();
  sub_24021A534(0xD000000000000015, 0x8000000240228DB0, 0);
  swift_bridgeObjectRelease();
  sub_24021A534(0xD00000000000001CLL, 0x8000000240228D90, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2402253FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_240224C1C(*(_BYTE *)(v1 + 8), a1);
}

unint64_t sub_240225410()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDCF88;
  if (!qword_256FDCF88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCF70);
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_256FDCF88);
  }
  return result;
}

uint64_t sub_24022545C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24022666C();
  *a1 = result;
  return result;
}

uint64_t sub_240225484()
{
  swift_retain();
  return sub_240226678();
}

uint64_t sub_2402254AC()
{
  return sub_240226654();
}

uint64_t sub_2402254CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2402268E8();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_240226660();
}

uint64_t sub_24022554C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24022666C();
  *a1 = result;
  return result;
}

uint64_t sub_240225574()
{
  swift_retain();
  return sub_240226678();
}

uint64_t sub_24022559C()
{
  uint64_t v0;

  return sub_240223124(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_2402255BC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256FDCFB8;
  if (!qword_256FDCFB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCFC0);
    v2 = sub_240225620();
    result = MEMORY[0x242680F28](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDCFB8);
  }
  return result;
}

unint64_t sub_240225620()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256FDCFC8;
  if (!qword_256FDCFC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCF78);
    v2[0] = sub_240225410();
    v2[1] = sub_24021A680((unint64_t *)&qword_256FDC8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x242680F28](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCFC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentSection()
{
  return &type metadata for LegalDocumentSection;
}

uint64_t sub_2402256B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2402256C4(char a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BYTE v18[24];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v3 = a1 & 1;
  v4 = sub_2402266D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v18[-v12];
  v18[16] = v3;
  v19 = a2;
  v20 = sub_240226364();
  v21 = v14;
  v22 = v15 & 1;
  v23 = v16;
  sub_2402266CC();
  sub_240226894();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  sub_24021A534(v20, v21, v22);
  swift_bridgeObjectRelease();
  sub_2402259C8((uint64_t)v11, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCFD0);
  sub_24021D0A4();
  sub_240225A10();
  return sub_240226948();
}

uint64_t sub_24022585C()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCF68);
  type metadata accessor for LegalDocumentCell();
  sub_240225A8C();
  sub_24021A680(&qword_256FDCFE0, (uint64_t (*)(uint64_t))type metadata accessor for LegalDocumentCell, (uint64_t)&unk_2402277D0);
  sub_24021A680(&qword_256FDCFF0, type metadata accessor for LegalDocumentModel, (uint64_t)&unk_240227A38);
  return sub_24022693C();
}

uint64_t sub_240225934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  char v6;

  v4 = type metadata accessor for LegalDocumentCell();
  sub_240225AD8(a1, a2 + *(int *)(v4 + 20));
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  result = sub_2402265F4();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v6 & 1;
  return result;
}

uint64_t sub_2402259B0()
{
  uint64_t v0;

  return sub_2402256C4(*(_BYTE *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t sub_2402259BC()
{
  return sub_24022585C();
}

uint64_t sub_2402259C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_240225A10()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256FDCFD8;
  if (!qword_256FDCFD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCFD0);
    v2 = sub_24021A680(&qword_256FDCFE0, (uint64_t (*)(uint64_t))type metadata accessor for LegalDocumentCell, (uint64_t)&unk_2402277D0);
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256FDCFD8);
  }
  return result;
}

unint64_t sub_240225A8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FDCFE8;
  if (!qword_256FDCFE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDCF68);
    result = MEMORY[0x242680F28](MEMORY[0x24BEE12D8], v1);
    atomic_store(result, (unint64_t *)&qword_256FDCFE8);
  }
  return result;
}

uint64_t sub_240225AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LegalDocumentModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_240225B20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_256FDCFF8;
  if (!qword_256FDCFF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256FDD000);
    v2[0] = sub_24021D0A4();
    v2[1] = sub_240225A10();
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x242680F28](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256FDCFF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for YearOfManufactureDynamicLabel()
{
  return &type metadata for YearOfManufactureDynamicLabel;
}

uint64_t sub_240225BA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_240225BB8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 40);
  return result;
}

uint64_t sub_240225C44()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_240225CEC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + 56);
  return result;
}

uint64_t sub_240225D78()
{
  swift_getKeyPath();
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265AC();
  return swift_release();
}

uint64_t sub_240225E1C@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a1 & 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDC8C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_retain();
  v8 = sub_24021B0E0(v7, v3);
  swift_release();
  swift_getKeyPath();
  v26 = v8;
  sub_24021A680((unint64_t *)&qword_256FDC8A0, (uint64_t (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState, (uint64_t)&protocol conformance descriptor for LegalAndRegulatorySettingsListState);
  sub_2402265B8();
  swift_release();
  v9 = *(unsigned __int8 *)(v8 + 40);
  swift_release();
  if (v9 != 1)
    goto LABEL_4;
  v10 = swift_retain();
  v11 = sub_24021B0E0(v10, v3);
  swift_release();
  swift_getKeyPath();
  v26 = v11;
  sub_2402265B8();
  swift_release();
  v12 = *(_QWORD *)(v11 + 56);
  swift_release();
  if (v12)
  {
    v26 = 0xB9E5A080E9BDA3E8;
    v27 = 0xAD000020BDBBE4B4;
    v13 = swift_retain();
    v14 = sub_24021B0E0(v13, v3);
    swift_release();
    swift_getKeyPath();
    v30 = v14;
    sub_2402265B8();
    swift_release();
    v15 = *(_QWORD *)(v14 + 56);
    swift_release();
    v30 = v15;
    sub_240226AE0();
    sub_240226A2C();
    swift_bridgeObjectRelease();
    v16 = sub_2402267B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
    sub_2402267D4();
    sub_24021D960((uint64_t)v6);
    v17 = sub_2402267F8();
    v19 = v18;
    LOBYTE(v15) = v20;
    v22 = v21;
    swift_bridgeObjectRelease();
    swift_release();
    v26 = v17;
    v27 = v19;
    v28 = v15 & 1;
    v29 = v22;
    sub_2402268A0();
    sub_24021A534(v17, v19, v15 & 1);
    swift_bridgeObjectRelease();
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(a2, 0, 1, v23);
  }
  else
  {
LABEL_4:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256FDCA30);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a2, 1, 1, v25);
  }
}

uint64_t sub_240226164@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_240225E1C(*(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_240226180()
{
  uint64_t v0;

  return sub_2402230A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_240226198()
{
  uint64_t v0;

  return sub_240222FF4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t getEnumTagSinglePayload for LegalDocumentSectionIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LegalDocumentSectionIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240226290 + 4 * byte_240228095[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2402262C4 + 4 * byte_240228090[v4]))();
}

uint64_t sub_2402262C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402262CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2402262D4);
  return result;
}

uint64_t sub_2402262E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2402262E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2402262EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2402262F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_240226300(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentSectionIdentifier()
{
  return &type metadata for LegalDocumentSectionIdentifier;
}

unint64_t sub_240226320()
{
  unint64_t result;

  result = qword_256FDD008;
  if (!qword_256FDD008)
  {
    result = MEMORY[0x242680F28](&unk_240228100, &type metadata for LegalDocumentSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_256FDD008);
  }
  return result;
}

uint64_t sub_240226364()
{
  id v0;

  sub_2402266C0();
  if (qword_256FDC610 != -1)
    swift_once();
  v0 = (id)qword_256FDD028;
  return sub_240226804();
}

BOOL sub_24022644C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_240226464()
{
  sub_240226AF8();
  sub_240226B04();
  return sub_240226B10();
}

uint64_t sub_2402264A8()
{
  return sub_240226B04();
}

uint64_t sub_2402264D0()
{
  sub_240226AF8();
  sub_240226B04();
  return sub_240226B10();
}

uint64_t sub_240226510()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_24022651C()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_240226528()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_240226534()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_240226540()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_24022654C()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_240226558()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_240226564()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_240226570()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24022657C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_240226588()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_240226594()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2402265A0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2402265AC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2402265B8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2402265C4()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2402265D0()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2402265DC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2402265E8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2402265F4()
{
  return MEMORY[0x24BDEB5B0]();
}

uint64_t sub_240226600()
{
  return MEMORY[0x24BDEB858]();
}

uint64_t sub_24022660C()
{
  return MEMORY[0x24BDEB868]();
}

uint64_t sub_240226618()
{
  return MEMORY[0x24BDEC298]();
}

uint64_t sub_240226624()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_240226630()
{
  return MEMORY[0x24BDEC898]();
}

uint64_t sub_24022663C()
{
  return MEMORY[0x24BDED250]();
}

uint64_t sub_240226648()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_240226654()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_240226660()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_24022666C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_240226678()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_240226684()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_240226690()
{
  return MEMORY[0x24BDEE410]();
}

uint64_t sub_24022669C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2402266A8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2402266B4()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_2402266C0()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2402266CC()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_2402266D8()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_2402266E4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2402266F0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2402266FC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_240226708()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_240226714()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_240226720()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_24022672C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_240226738()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_240226744()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_240226750()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_24022675C()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_240226768()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_240226774()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_240226780()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_24022678C()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_240226798()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2402267A4()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_2402267B0()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2402267BC()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_2402267C8()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_2402267D4()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_2402267E0()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_2402267EC()
{
  return MEMORY[0x24BDF19F0]();
}

uint64_t sub_2402267F8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_240226804()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_240226810()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24022681C()
{
  return MEMORY[0x24BE85518]();
}

uint64_t sub_240226828()
{
  return MEMORY[0x24BE85528]();
}

uint64_t sub_240226834()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_240226840()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24022684C()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_240226858()
{
  return MEMORY[0x24BDF2470]();
}

uint64_t sub_240226864()
{
  return MEMORY[0x24BDF25E8]();
}

uint64_t sub_240226870()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24022687C()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_240226888()
{
  return MEMORY[0x24BDF2C78]();
}

uint64_t sub_240226894()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_2402268A0()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_2402268AC()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2402268B8()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2402268C4()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2402268D0()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_2402268DC()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_2402268E8()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2402268F4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_240226900()
{
  return MEMORY[0x24BDF47A0]();
}

uint64_t sub_24022690C()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_240226918()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_240226924()
{
  return MEMORY[0x24BDF47E8]();
}

uint64_t sub_240226930()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_24022693C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_240226948()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_240226954()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_240226960()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_24022696C()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_240226978()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_240226984()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_240226990()
{
  return MEMORY[0x24BDF4C28]();
}

uint64_t sub_24022699C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2402269A8()
{
  return MEMORY[0x24BE85560]();
}

uint64_t sub_2402269B4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2402269C0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2402269CC()
{
  return MEMORY[0x24BDCF870]();
}

uint64_t sub_2402269D8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2402269E4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2402269F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2402269FC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_240226A08()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_240226A14()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_240226A20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_240226A2C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_240226A38()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_240226A44()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_240226A50()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_240226A5C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_240226A68()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_240226A74()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_240226A80()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_240226A8C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_240226A98()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_240226AA4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_240226AB0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_240226ABC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_240226AC8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_240226AD4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_240226AE0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_240226AEC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_240226AF8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_240226B04()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_240226B10()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t SFAcknowledgementsDocumentFilePath()
{
  return MEMORY[0x24BE85720]();
}

uint64_t SFAudioAccessoryAcknowledgementsDocumentFilePath()
{
  return MEMORY[0x24BE85730]();
}

uint64_t SFAudioAccessoryLicenseFilePath()
{
  return MEMORY[0x24BE85738]();
}

uint64_t SFAudioAccessoryWarrantyFilePath()
{
  return MEMORY[0x24BE85740]();
}

uint64_t SFBuiltInAppsDocumentFilePath()
{
  return MEMORY[0x24BE85748]();
}

uint64_t SFCountryOfOrigin()
{
  return MEMORY[0x24BE85750]();
}

uint64_t SFIndiaBISNumber()
{
  return MEMORY[0x24BE85758]();
}

uint64_t SFIndiaBISRegulatoryImage()
{
  return MEMORY[0x24BE85760]();
}

uint64_t SFLicenseFilePath()
{
  return MEMORY[0x24BE85768]();
}

uint64_t SFRFExposureDocumentHTMLString()
{
  return MEMORY[0x24BE85788]();
}

uint64_t SFRegulatoryImage()
{
  return MEMORY[0x24BE85790]();
}

uint64_t SFRoHSComplianceDocumentFilePath()
{
  return MEMORY[0x24BE85798]();
}

uint64_t SFShouldShowAlertMark()
{
  return MEMORY[0x24BE857A8]();
}

uint64_t SFShouldShowBuiltInApps()
{
  return MEMORY[0x24BE857B0]();
}

uint64_t SFShouldShowCountryOfOrigin()
{
  return MEMORY[0x24BE857B8]();
}

uint64_t SFShouldShowEyesightWarning()
{
  return MEMORY[0x24BE857C0]();
}

uint64_t SFShouldShowIndiaBIS()
{
  return MEMORY[0x24BE857C8]();
}

uint64_t SFShouldShowMonthOfManufacture()
{
  return MEMORY[0x24BE857D0]();
}

uint64_t SFShouldShowRoHSCompliance()
{
  return MEMORY[0x24BE857D8]();
}

uint64_t SFShouldShowYearOfManufacture()
{
  return MEMORY[0x24BE857E0]();
}

uint64_t SFWarrantyFilePath()
{
  return MEMORY[0x24BE857E8]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

