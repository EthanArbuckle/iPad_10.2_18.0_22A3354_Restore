void type metadata accessor for UIContentInsetsReference(uint64_t a1)
{
  sub_1DB1ED6E4(a1, &qword_1F02D1158);
}

void type metadata accessor for ScrollDirection(uint64_t a1)
{
  sub_1DB1ED6E4(a1, &qword_1F02D1160);
}

void type metadata accessor for CKTranscriptLayoutContext(uint64_t a1)
{
  sub_1DB1ED6E4(a1, &qword_1F02D1168);
}

void sub_1DB1ED6E4(uint64_t a1, unint64_t *a2)
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

uint64_t _sSo28CKInboxViewControllerFactoryC15MessagesSupportE05inboxbC05modelSo06UIViewC0CSo0A5ModelC_tFZ_0(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;

  type metadata accessor for InboxModel(0);
  sub_1DB1ED864();
  sub_1DB1F62EC();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  swift_beginAccess();
  v3 = a1;
  sub_1DB1F6268();
  swift_endAccess();
  objc_msgSend(v3, sel_setDelegate_, v2);
  sub_1DB1F6250();
  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02D11D8));
  return sub_1DB1F6340();
}

unint64_t sub_1DB1ED864()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02D11D0;
  if (!qword_1F02D11D0)
  {
    v1 = type metadata accessor for InboxModel(255);
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7470, v1);
    atomic_store(result, (unint64_t *)&qword_1F02D11D0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AA9E8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id static TranscriptLayoutUtilities.layoutSize(size:)(double a1, double a2)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_absoluteDimension_, a1);
  v6 = objc_msgSend(v4, sel_absoluteDimension_, a2);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v5, v6);

  return v7;
}

id static TranscriptLayoutUtilities.dynamicWidthLayoutSize(height:)(double a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_fractionalWidthDimension_, 1.0);
  v4 = objc_msgSend(v2, sel_absoluteDimension_, a1);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v3, v4);

  return v5;
}

id TranscriptLayoutUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TranscriptLayoutUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TranscriptLayoutUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v2 = objc_msgSend((id)objc_opt_self(), sel_fractionalWidthDimension_, 1.0);
  v3 = objc_msgSend(a1, sel_layoutSize);
  v4 = objc_msgSend(v3, sel_heightDimension);

  v5 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v2, v4);
  v6 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EDAF5638);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1DB1F7070;
  *(_QWORD *)(v7 + 32) = a1;
  sub_1DB1F64CC();
  sub_1DB1EDE34();
  v8 = a1;
  v9 = (void *)sub_1DB1F64B4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v6, sel_verticalGroupWithLayoutSize_subitems_, v5, v9);

  return v10;
}

uint64_t type metadata accessor for TranscriptLayoutUtilities()
{
  return objc_opt_self();
}

unint64_t sub_1DB1EDE34()
{
  unint64_t result;

  result = qword_1EDAF5610;
  if (!qword_1EDAF5610)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDAF5610);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for InboxView()
{
  return &type metadata for InboxView;
}

uint64_t sub_1DB1EDE98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB1EDEA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D11E0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D11E8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_1DB1F6334();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D11F0);
  sub_1DB1EE028(a1, a2, (uint64_t)&v8[*(int *)(v12 + 44)]);
  v13 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
  v14 = MEMORY[0x1DF0AA52C](v13);
  LOBYTE(a1) = sub_1DB1F6370();
  sub_1DB1EF548((uint64_t)v8, (uint64_t)v11, &qword_1F02D11E0);
  v15 = &v11[*(int *)(v9 + 36)];
  *(_QWORD *)v15 = v14;
  v15[8] = a1;
  sub_1DB1EF58C((uint64_t)v8, &qword_1F02D11E0);
  v16 = sub_1DB1F637C();
  sub_1DB1EF548((uint64_t)v11, a3, &qword_1F02D11E8);
  *(_BYTE *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F02D11F8) + 36)) = v16;
  return sub_1DB1EF58C((uint64_t)v11, &qword_1F02D11E8);
}

uint64_t sub_1DB1EE028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
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
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1200);
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1208);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1210);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1218);
  v14 = *(_QWORD *)(v55 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1220);
  v17 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  MEMORY[0x1E0C80A78](v17);
  v53 = (uint64_t)&v44 - v19;
  if (a1)
  {
    v49 = v7;
    v50 = v11;
    v51 = v6;
    v54 = v18;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1DB1F6298();
    swift_release();
    swift_release();
    swift_release();
    v20 = a2;
    if ((v59 & 1) != 0)
    {
      sub_1DB1EF3E0();
      sub_1DB1EF424();
      v56 = 0;
      v57 = 0;
      v58 = 0;
    }
    else
    {
      type metadata accessor for InboxModel(0);
      sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
      v56 = sub_1DB1F62EC();
      v57 = v21;
      v58 = 1;
      sub_1DB1EF3E0();
      sub_1DB1EF424();
    }
    sub_1DB1F634C();
    v22 = v60;
    v52 = v59;
    v23 = v61;
    v24 = objc_msgSend(*(id *)(a1 + 16), sel_footerAction);
    v25 = 1;
    if (v24)
    {
      _Block_release(v24);
      v26 = swift_allocObject();
      v45 = a3;
      v46 = v14;
      *(_QWORD *)(v26 + 16) = a1;
      *(_QWORD *)(v26 + 24) = v20;
      swift_retain();
      sub_1DB1F6460();
      KeyPath = swift_getKeyPath();
      v28 = v49;
      v29 = (uint64_t)v50;
      v30 = v51;
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v50, v9, v51);
      v31 = v29 + *(int *)(v47 + 36);
      *(_QWORD *)v31 = KeyPath;
      *(_BYTE *)(v31 + 8) = 1;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v30);
      v32 = sub_1DB1F63B8();
      v33 = swift_getKeyPath();
      sub_1DB1EF548(v29, (uint64_t)v13, &qword_1F02D1208);
      v34 = (uint64_t *)&v13[*(int *)(v48 + 36)];
      *v34 = v33;
      v34[1] = v32;
      a3 = v45;
      sub_1DB1EF58C(v29, &qword_1F02D1208);
      v35 = sub_1DB1F6370();
      sub_1DB1EF548((uint64_t)v13, (uint64_t)v16, &qword_1F02D1210);
      v36 = v55;
      v37 = &v16[*(int *)(v55 + 36)];
      *v37 = v35;
      *(_OWORD *)(v37 + 8) = 0u;
      *(_OWORD *)(v37 + 24) = 0u;
      v37[40] = 1;
      v14 = v46;
      sub_1DB1EF58C((uint64_t)v13, &qword_1F02D1210);
      v38 = (uint64_t)v16;
      v39 = v53;
      sub_1DB1EF960(v38, v53, &qword_1F02D1218);
      v25 = 0;
    }
    else
    {
      v36 = v55;
      v39 = v53;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v39, v25, 1, v36);
    v40 = v54;
    sub_1DB1EF548(v39, v54, &qword_1F02D1220);
    v41 = v52;
    *(_QWORD *)a3 = v52;
    *(_QWORD *)(a3 + 8) = v22;
    *(_BYTE *)(a3 + 16) = v23;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1238);
    sub_1DB1EF548(v40, a3 + *(int *)(v42 + 48), &qword_1F02D1220);
    sub_1DB1EF468(v41, v22, v23);
    sub_1DB1EF58C(v39, &qword_1F02D1220);
    sub_1DB1EF58C(v40, &qword_1F02D1220);
    return sub_1DB1EF474(v41, v22, v23);
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
    result = sub_1DB1F62E0();
    __break(1u);
  }
  return result;
}

void sub_1DB1EE530(uint64_t a1)
{
  id v1;
  const void *v2;

  if (a1)
  {
    v1 = objc_msgSend(*(id *)(a1 + 16), sel_footerAction);
    if (v1)
    {
      v2 = v1;
      (*((void (**)(void))v1 + 2))();
      _Block_release(v2);
    }
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
    sub_1DB1F62E0();
    __break(1u);
  }
}

void sub_1DB1EE5C4(uint64_t a1@<X8>)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  id v12;
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
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (qword_1F02D1150 != -1)
    swift_once();
  if (qword_1F02D1D10)
  {
    v1 = (id)qword_1F02D1D10;
    sub_1DB1F6220();

    sub_1DB1EF5C8();
    v2 = sub_1DB1F63F4();
    v4 = v3;
    v6 = v5 & 1;
    v7 = (void *)objc_opt_self();
    MEMORY[0x1DF0AA52C](objc_msgSend(v7, sel_secondaryLabelColor, 0xE000000000000000));
    v8 = sub_1DB1F63D0();
    v30 = v9;
    v31 = v8;
    v11 = v10;
    swift_release();
    sub_1DB1EF60C(v2, v4, v6);
    swift_bridgeObjectRelease();
    if (qword_1F02D1D10)
    {
      v12 = (id)qword_1F02D1D10;
      sub_1DB1F6220();

      v13 = sub_1DB1F63F4();
      v15 = v14;
      v17 = v16 & 1;
      MEMORY[0x1DF0AA52C](objc_msgSend(v7, sel_linkColor, 0xE000000000000000));
      v18 = sub_1DB1F63D0();
      v20 = v19;
      v22 = v21;
      swift_release();
      sub_1DB1EF60C(v13, v15, v17);
      swift_bridgeObjectRelease();
      v28 = sub_1DB1F63DC();
      v29 = v23;
      v25 = v24;
      v27 = v26;
      sub_1DB1EF60C(v18, v20, v22 & 1);
      swift_bridgeObjectRelease();
      sub_1DB1EF60C(v31, v30, v11 & 1);
      swift_bridgeObjectRelease();
      *(_QWORD *)a1 = v28;
      *(_QWORD *)(a1 + 8) = v25;
      *(_BYTE *)(a1 + 16) = v27 & 1;
      *(_QWORD *)(a1 + 24) = v29;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1DB1EE8BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DB1EDEA8(*v1, v1[1], a1);
}

uint64_t sub_1DB1EE8C4()
{
  return sub_1DB1F6418();
}

uint64_t sub_1DB1EE8DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = sub_1DB1F6364();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InboxModel(0);
  sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
  v6[0] = sub_1DB1F62EC();
  v6[1] = v4;
  sub_1DB1F6358();
  sub_1DB1EF914();
  sub_1DB1F6430();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_release();
}

uint64_t sub_1DB1EE9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
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

  v38 = a3;
  v5 = sub_1DB1F62D4();
  v39 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1278);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1280);
  v33 = *(_QWORD *)(v12 - 8);
  v34 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1288);
  v36 = *(_QWORD *)(v15 - 8);
  v37 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1290);
  MEMORY[0x1E0C80A78](v35);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = a1;
  v41 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1298);
  sub_1DB1EFC84(&qword_1F02D12A0, &qword_1F02D1298, MEMORY[0x1E0CE0680]);
  sub_1DB1F63C4();
  sub_1DB1F62C8();
  v20 = sub_1DB1EFC84(&qword_1F02D12A8, &qword_1F02D1278, MEMORY[0x1E0CDD950]);
  sub_1DB1F6430();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v5);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (qword_1F02D1150 != -1)
    result = swift_once();
  if (qword_1F02D1D10)
  {
    v22 = (id)qword_1F02D1D10;
    v23 = sub_1DB1F6220();
    v25 = v24;

    v46 = v23;
    v47 = v25;
    v42 = v8;
    v43 = v5;
    v44 = v20;
    v45 = MEMORY[0x1E0CDA0D0];
    swift_getOpaqueTypeConformance2();
    sub_1DB1EF5C8();
    v26 = v34;
    sub_1DB1F6424();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v26);
    v27 = objc_msgSend((id)objc_opt_self(), sel_systemGroupedBackgroundColor);
    v28 = MEMORY[0x1DF0AA52C](v27);
    LOBYTE(v23) = sub_1DB1F6370();
    v30 = v36;
    v29 = v37;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v19, v17, v37);
    v31 = &v19[*(int *)(v35 + 36)];
    *(_QWORD *)v31 = v28;
    v31[8] = v23;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v29);
    return sub_1DB1EF960((uint64_t)v19, v38, &qword_1F02D1290);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1DB1EED84(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  unint64_t v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12B0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v22 - v9;
  if (!a1)
    goto LABEL_18;
  v11 = objc_msgSend(*(id *)(a1 + 16), sel_sections);
  sub_1DB1EF9A4();
  v12 = sub_1DB1F64C0();

  v23 = v12;
  v13 = v12 >> 62;
  if (!(v12 >> 62))
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v19 = sub_1DB1F6538();
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = sub_1DB1F6538();
    swift_bridgeObjectRelease();
    if (v20)
    {
LABEL_4:
      if ((v12 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
        v14 = *(id *)(v12 + 32);
        if (!v13)
          goto LABEL_7;
        goto LABEL_14;
      }
LABEL_13:
      v14 = (id)MEMORY[0x1DF0AA604](0, v12);
      if (!v13)
      {
LABEL_7:
        if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_8:
          sub_1DB1EF9E0(0, 1);
          v22[2] = v23;
          v22[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C0);
          sub_1DB1F6238();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C8);
          sub_1DB1EFC84(&qword_1F02D12D0, &qword_1F02D12C0, MEMORY[0x1E0DEAF48]);
          sub_1DB1EFCC4();
          sub_1DB1EFDD4(&qword_1F02D12F8, (uint64_t (*)(uint64_t))sub_1DB1EF9A4, (uint64_t)&protocol conformance descriptor for CKInboxSection);
          sub_1DB1F646C();
          v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v15(v8, v10, v4);
          *(_QWORD *)a2 = v14;
          v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1300);
          v15(&a2[*(int *)(v16 + 48)], v8, v4);
          v17 = *(void (**)(char *, uint64_t))(v5 + 8);
          v18 = v14;
          v17(v10, v4);
          v17(v8, v4);

          return;
        }
        goto LABEL_15;
      }
LABEL_14:
      swift_bridgeObjectRetain();
      v21 = sub_1DB1F6538();
      swift_bridgeObjectRelease();
      if (v21)
        goto LABEL_8;
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
LABEL_18:
  type metadata accessor for InboxModel(0);
  sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
  sub_1DB1F62E0();
  __break(1u);
}

uint64_t sub_1DB1EF0B0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  sub_1DB1EF238((uint64_t *)v25);
  v23 = v25[0];
  v24 = v25[1];
  v9 = objc_msgSend(v8, sel_footer);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1DB1F6490();
    v13 = v12;

    v19 = v11;
    v20 = v13;
    sub_1DB1EF5C8();
    v9 = (id)sub_1DB1F63F4();
    v17 = v16 & 1;
  }
  else
  {
    v14 = 0;
    v17 = 0;
    v15 = 0;
  }
  v19 = (uint64_t)v9;
  v20 = v14;
  v21 = v17;
  v22 = v15;
  MEMORY[0x1E0C80A78](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12E8);
  sub_1DB1EFD34();
  sub_1DB1EFD90();
  sub_1DB1F6478();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

id sub_1DB1EF238@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  result = objc_msgSend(v1, sel_header);
  if (result)
  {
    v4 = result;
    sub_1DB1F6490();

    sub_1DB1EF5C8();
    v5 = sub_1DB1F63F4();
    v7 = v6;
    v9 = v8 & 1;
    sub_1DB1F63A0();
    sub_1DB1F6394();
    sub_1DB1F63AC();
    swift_release();
    v10 = sub_1DB1F63E8();
    v12 = v11;
    v14 = v13;
    swift_release();
    v15 = v14 & 1;
    sub_1DB1EF60C(v5, v7, v9);
    swift_bridgeObjectRelease();
    v16 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    MEMORY[0x1DF0AA52C](v16);
    v17 = sub_1DB1F63D0();
    v19 = v18;
    v21 = v20;
    v23 = v22;
    swift_release();
    v24 = v21 & 1;
    sub_1DB1EF60C(v10, v12, v15);
    result = (id)swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
    v19 = 0;
    v24 = 0;
    v23 = 0;
  }
  *a1 = v17;
  a1[1] = v19;
  a1[2] = v24;
  a1[3] = v23;
  return result;
}

uint64_t sub_1DB1EF3D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DB1EE9CC(*v1, v1[1], a1);
}

unint64_t sub_1DB1EF3E0()
{
  unint64_t result;

  result = qword_1F02D1228;
  if (!qword_1F02D1228)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7264, &type metadata for InboxGroupedList);
    atomic_store(result, (unint64_t *)&qword_1F02D1228);
  }
  return result;
}

unint64_t sub_1DB1EF424()
{
  unint64_t result;

  result = qword_1F02D1230;
  if (!qword_1F02D1230)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7214, &type metadata for InboxSidebarList);
    atomic_store(result, (unint64_t *)&qword_1F02D1230);
  }
  return result;
}

uint64_t sub_1DB1EF468(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_retain();
  return result;
}

uint64_t sub_1DB1EF474(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_release();
  return result;
}

uint64_t sub_1DB1EF480()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DB1EF4A4()
{
  uint64_t v0;

  sub_1DB1EE530(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DB1EF4AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB1F62F8();
  *a1 = result;
  return result;
}

uint64_t sub_1DB1EF4D4()
{
  return sub_1DB1F6304();
}

uint64_t sub_1DB1EF4F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB1F6310();
  *a1 = result;
  return result;
}

uint64_t sub_1DB1EF520()
{
  swift_retain();
  return sub_1DB1F631C();
}

uint64_t sub_1DB1EF548(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DB1EF58C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1DB1EF5C8()
{
  unint64_t result;

  result = qword_1F02D1240;
  if (!qword_1F02D1240)
  {
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F02D1240);
  }
  return result;
}

uint64_t sub_1DB1EF60C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for InboxSidebarList(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for InboxSidebarList()
{
  return swift_release();
}

_QWORD *assignWithCopy for InboxContentView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for InboxSidebarList(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for InboxContentView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InboxContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for InboxSidebarList()
{
  return &type metadata for InboxSidebarList;
}

ValueMetadata *type metadata accessor for InboxGroupedList()
{
  return &type metadata for InboxGroupedList;
}

unint64_t sub_1DB1EF7A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F02D1248;
  if (!qword_1F02D1248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D11F8);
    v2[0] = sub_1DB1EF858();
    v2[1] = MEMORY[0x1E0CDC500];
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F02D1248);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AA9F4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DB1EF858()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F02D1250;
  if (!qword_1F02D1250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D11E8);
    v2[0] = sub_1DB1EFC84(&qword_1F02D1258, &qword_1F02D11E0, MEMORY[0x1E0CDFCC0]);
    v2[1] = sub_1DB1EFC84(&qword_1F02D1260, &qword_1F02D1268, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F02D1250);
  }
  return result;
}

uint64_t sub_1DB1EF8F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB1EF904()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB1EF914()
{
  unint64_t result;

  result = qword_1F02D1270;
  if (!qword_1F02D1270)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7574, &type metadata for InboxContentView);
    atomic_store(result, (unint64_t *)&qword_1F02D1270);
  }
  return result;
}

void sub_1DB1EF958(char *a1@<X8>)
{
  uint64_t v1;

  sub_1DB1EED84(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1DB1EF960(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DB1EF9A4()
{
  unint64_t result;

  result = qword_1F02D12B8;
  if (!qword_1F02D12B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02D12B8);
  }
  return result;
}

uint64_t sub_1DB1EF9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_1DB1F6538();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_30;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    v7 = sub_1DB1F6538();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v12 = sub_1DB1F6538();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_33;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_35;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_36;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x1DF0AA610](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1DB1EF9A4();
  result = swift_arrayDestroy();
  if (!v5)
    return sub_1DB1F64CC();
  if (*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_1DB1F6538();
    result = swift_bridgeObjectRelease();
    v17 = v22 - v2;
    if (!__OFSUB__(v22, v2))
      goto LABEL_21;
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v16 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v17 = v16 - v2;
  if (__OFSUB__(v16, v2))
    goto LABEL_39;
LABEL_21:
  v18 = (char *)(v13 + 8 * v2);
  if (v4 != v2 || v14 >= &v18[8 * v17])
    result = (uint64_t)memmove(v14, v18, 8 * v17);
  if (*v3 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    v23 = sub_1DB1F6538();
    result = swift_bridgeObjectRelease();
    v20 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_26;
    goto LABEL_42;
  }
  v19 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v20 = v19 + v5;
  if (!__OFADD__(v19, v5))
  {
LABEL_26:
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v20;
    return sub_1DB1F64CC();
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1DB1EFC84(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0AAA00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DB1EFCC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_1F02D12D8;
  if (!qword_1F02D12D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D12C8);
    v2[0] = sub_1DB1EFD34();
    v2[1] = sub_1DB1EFD90();
    v2[2] = v2[0];
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CDFF98], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F02D12D8);
  }
  return result;
}

unint64_t sub_1DB1EFD34()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F02D12E0;
  if (!qword_1F02D12E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D12E8);
    v2 = MEMORY[0x1E0CDDD58];
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CE0798], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F02D12E0);
  }
  return result;
}

unint64_t sub_1DB1EFD90()
{
  unint64_t result;

  result = qword_1F02D12F0;
  if (!qword_1F02D12F0)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7524, &type metadata for InboxSectionViews);
    atomic_store(result, (unint64_t *)&qword_1F02D12F0);
  }
  return result;
}

uint64_t sub_1DB1EFDD4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0AAA00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_1DB1EFE14@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_1DB1EFE20()
{
  sub_1DB1F6364();
  sub_1DB1EF914();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB1EFE80()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  unint64_t v4;
  _QWORD v5[6];

  result = qword_1F02D1308;
  if (!qword_1F02D1308)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D1290);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D1280);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D1278);
    sub_1DB1F62D4();
    sub_1DB1EFC84(&qword_1F02D12A8, &qword_1F02D1278, MEMORY[0x1E0CDD950]);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v4 = sub_1DB1EF5C8();
    v5[2] = v2;
    v5[3] = MEMORY[0x1E0DEA968];
    v5[4] = OpaqueTypeConformance2;
    v5[5] = v4;
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_1DB1EFC84(&qword_1F02D1260, &qword_1F02D1268, MEMORY[0x1E0CDC6D0]);
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CD9C20], v1, v5);
    atomic_store(result, (unint64_t *)&qword_1F02D1308);
  }
  return result;
}

uint64_t sub_1DB1EFFB8()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB1F6298();
  swift_release();
  swift_release();
  return v1;
}

void _sSo14CKInboxSectionC15MessagesSupportE2id10Foundation4UUIDVvg_0()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_identifier);
  sub_1DB1F622C();

}

void sub_1DB1F0080()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_identifier);
  sub_1DB1F622C();

}

uint64_t sub_1DB1F00CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB1F6298();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1DB1F0148()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1DB1F62A4();
}

uint64_t sub_1DB1F01B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15MessagesSupport10InboxModel__isCollapsed;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D13C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1DB1F0214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB1F625C();
  *a1 = result;
  return result;
}

uint64_t InboxItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___CKInboxItemSwift_identifier;
  v4 = sub_1DB1F6238();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t InboxItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CKInboxItemSwift_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CKInboxItemSwift_subtitle);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.systemImage.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CKInboxItemSwift_systemImage);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InboxItem.accessoryText.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB1F6298();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DB1F0408@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB1F6298();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_1DB1F0488(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_1DB1F62A4();
}

uint64_t InboxItem.accessoryText.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1DB1F62A4();
}

void (*InboxItem.accessoryText.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DB1F628C();
  return sub_1DB1F05F4;
}

void sub_1DB1F05F4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t InboxItem.$accessoryText.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  sub_1DB1F6274();
  return swift_endAccess();
}

uint64_t sub_1DB1F06A0()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  sub_1DB1F6274();
  return swift_endAccess();
}

uint64_t sub_1DB1F0704(uint64_t a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1320);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  sub_1DB1F6280();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t InboxItem.$accessoryText.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1320);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  sub_1DB1F6280();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*InboxItem.$accessoryText.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1320);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___CKInboxItemSwift__accessoryText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  sub_1DB1F6274();
  swift_endAccess();
  return sub_1DB1F09B0;
}

void sub_1DB1F09B0(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1DB1F6280();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1DB1F6280();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id InboxItem.__allocating_init(identifier:title:subtitle:systemImage:accessoryText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  objc_class *v9;
  id v18;

  v18 = objc_allocWithZone(v9);
  return InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

id InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  char *v9;
  char *v10;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  objc_class *ObjectType;
  objc_super v31;
  uint64_t v32;
  unint64_t v33;

  v10 = v9;
  v16 = a9;
  ObjectType = (objc_class *)swift_getObjectType();
  v17 = &v9[OBJC_IVAR___CKInboxItemSwift_identifier];
  v18 = sub_1DB1F6238();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a1, v18);
  v20 = &v10[OBJC_IVAR___CKInboxItemSwift_title];
  *(_QWORD *)v20 = a2;
  *((_QWORD *)v20 + 1) = a3;
  v21 = &v10[OBJC_IVAR___CKInboxItemSwift_subtitle];
  *(_QWORD *)v21 = a4;
  *((_QWORD *)v21 + 1) = a5;
  v22 = &v10[OBJC_IVAR___CKInboxItemSwift_systemImage];
  *(_QWORD *)v22 = a6;
  *((_QWORD *)v22 + 1) = a7;
  if (a9)
    v23 = a8;
  else
    v23 = 0;
  if (!a9)
    v16 = 0xE000000000000000;
  swift_beginAccess();
  v32 = v23;
  v33 = v16;
  v24 = v10;
  sub_1DB1F6268();
  swift_endAccess();

  v31.receiver = v24;
  v31.super_class = ObjectType;
  v25 = objc_msgSendSuper2(&v31, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a1, v18);
  return v25;
}

Swift::Void __swiftcall InboxItem.update(accessoryText:)(Swift::String accessoryText)
{
  void *v1;
  id v2;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v2 = v1;
  sub_1DB1F62A4();
}

uint64_t InboxItem.description.getter()
{
  _QWORD v1[2];

  sub_1DB1F6508();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "<InboxItem t:");
  swift_bridgeObjectRetain();
  sub_1DB1F649C();
  swift_bridgeObjectRelease();
  sub_1DB1F649C();
  swift_bridgeObjectRetain();
  sub_1DB1F649C();
  swift_bridgeObjectRelease();
  sub_1DB1F649C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB1F6298();
  swift_release();
  swift_release();
  sub_1DB1F649C();
  swift_bridgeObjectRelease();
  sub_1DB1F649C();
  return v1[0];
}

id InboxItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void InboxItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id InboxItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DB1F1144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02D1328;
  if (!qword_1F02D1328)
  {
    v1 = sub_1DB1F6238();
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CB09C8], v1);
    atomic_store(result, (unint64_t *)&qword_1F02D1328);
  }
  return result;
}

uint64_t sub_1DB1F118C()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1DB1F1240@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_1DB1F625C();
  *a1 = result;
  return result;
}

uint64_t sub_1DB1F127C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR___CKInboxItemSwift_identifier;
  v4 = sub_1DB1F6238();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1DB1F12CC()
{
  return type metadata accessor for InboxModel(0);
}

uint64_t type metadata accessor for InboxModel(uint64_t a1)
{
  return sub_1DB1F1390(a1, (uint64_t *)&unk_1F02D1338);
}

void sub_1DB1F12E8()
{
  unint64_t v0;

  sub_1DB1F148C(319, &qword_1F02D1348);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1DB1F1374()
{
  return type metadata accessor for InboxItem(0);
}

uint64_t type metadata accessor for InboxItem(uint64_t a1)
{
  return sub_1DB1F1390(a1, (uint64_t *)&unk_1F02D13B0);
}

uint64_t sub_1DB1F1390(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DB1F13C4()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DB1F6238();
  if (v0 <= 0x3F)
  {
    sub_1DB1F148C(319, &qword_1F02D13C0);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for InboxItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InboxItem.__allocating_init(identifier:title:subtitle:systemImage:accessoryText:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void sub_1DB1F148C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1DB1F62B0();
    if (!v4)
      atomic_store(v3, a2);
  }
}

ValueMetadata *type metadata accessor for InboxContentView()
{
  return &type metadata for InboxContentView;
}

ValueMetadata *type metadata accessor for InboxSectionViews()
{
  return &type metadata for InboxSectionViews;
}

uint64_t sub_1DB1F14F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB1F1508@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t result;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D13D0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D13D8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = a1;
  v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12B0);
  sub_1DB1F1D18();
  result = sub_1DB1F63C4();
  if (qword_1F02D1150 != -1)
    result = swift_once();
  if (qword_1F02D1D10)
  {
    v15 = (id)qword_1F02D1D10;
    v16 = sub_1DB1F6220();
    v18 = v17;

    v22 = v16;
    v23 = v18;
    sub_1DB1EFC84(&qword_1F02D13E8, &qword_1F02D13D0, MEMORY[0x1E0CDD950]);
    sub_1DB1EF5C8();
    sub_1DB1F6424();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(a3, v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB1F1704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[2];

  v10[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v7 = objc_msgSend(*(id *)(a1 + 16), sel_sections);
    sub_1DB1F1DBC(0, (unint64_t *)&qword_1F02D12B8);
    v8 = sub_1DB1F64C0();

    v10[1] = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C0);
    sub_1DB1F6238();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C8);
    sub_1DB1EFC84(&qword_1F02D12D0, &qword_1F02D12C0, MEMORY[0x1E0DEAF48]);
    sub_1DB1EFCC4();
    sub_1DB1F1D7C(&qword_1F02D12F8, (unint64_t *)&qword_1F02D12B8, (uint64_t)off_1EA267F60, (uint64_t)&protocol conformance descriptor for CKInboxSection);
    sub_1DB1F646C();
    return (*(uint64_t (**)(_QWORD, char *, uint64_t))(v4 + 32))(v10[0], v6, v3);
  }
  else
  {
    type metadata accessor for InboxModel(0);
    sub_1DB1EFDD4((unint64_t *)&qword_1F02D11D0, type metadata accessor for InboxModel, (uint64_t)&unk_1DB1F7470);
    result = sub_1DB1F62E0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB1F18DC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  sub_1DB1EF238((uint64_t *)v25);
  v23 = v25[0];
  v24 = v25[1];
  v9 = objc_msgSend(v8, sel_footer);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1DB1F6490();
    v13 = v12;

    v19 = v11;
    v20 = v13;
    sub_1DB1EF5C8();
    v9 = (id)sub_1DB1F63F4();
    v17 = v16 & 1;
  }
  else
  {
    v14 = 0;
    v17 = 0;
    v15 = 0;
  }
  v19 = (uint64_t)v9;
  v20 = v14;
  v21 = v17;
  v22 = v15;
  MEMORY[0x1E0C80A78](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D12E8);
  sub_1DB1EFD34();
  sub_1DB1EFD90();
  sub_1DB1F6478();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_1DB1F1A64@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DB1F1508(*v1, v1[1], a1);
}

uint64_t sub_1DB1F1A6C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  sub_1DB1F1E28();
  v2 = v1;
  return sub_1DB1F6460();
}

void sub_1DB1F1AF4(void *a1)
{
  id v1;
  const void *v2;

  v1 = objc_msgSend(a1, sel_action);
  if (v1)
  {
    v2 = v1;
    (*((void (**)(void))v1 + 2))();
    _Block_release(v2);
  }
}

uint64_t sub_1DB1F1B40@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t result;
  uint64_t v5;

  v3 = objc_msgSend(a1, sel_inboxItemSwift);
  type metadata accessor for InboxItem(0);
  sub_1DB1EFDD4(&qword_1F02D1428, type metadata accessor for InboxItem, (uint64_t)&protocol conformance descriptor for InboxItem);
  result = sub_1DB1F62BC();
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1DB1F1BB8()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_items);
  sub_1DB1F1DBC(0, &qword_1F02D13F0);
  sub_1DB1F64C0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D13F8);
  sub_1DB1F6238();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1400);
  sub_1DB1EFC84(&qword_1F02D1408, &qword_1F02D13F8, MEMORY[0x1E0DEAF48]);
  sub_1DB1EFC84(&qword_1F02D1410, &qword_1F02D1400, MEMORY[0x1E0CDFA58]);
  sub_1DB1F1D7C(&qword_1F02D1418, &qword_1F02D13F0, (uint64_t)off_1EA267F58, (uint64_t)&protocol conformance descriptor for CKInboxItem);
  return sub_1DB1F646C();
}

uint64_t sub_1DB1F1D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB1F1D10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DB1F1704(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1DB1F1D18()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F02D13E0;
  if (!qword_1F02D13E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D12B0);
    v2 = sub_1DB1EFCC4();
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CDFEE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F02D13E0);
  }
  return result;
}

uint64_t sub_1DB1F1D7C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1DB1F1DBC(255, a2);
    result = MEMORY[0x1DF0AAA00](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB1F1DBC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DB1F1DF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DB1F1E18()
{
  uint64_t v0;

  sub_1DB1F1AF4(*(void **)(v0 + 16));
}

uint64_t sub_1DB1F1E20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1DB1F1B40(*(void **)(v1 + 16), a1);
}

unint64_t sub_1DB1F1E28()
{
  unint64_t result;

  result = qword_1F02D1420;
  if (!qword_1F02D1420)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7700, &type metadata for InboxItemView);
    atomic_store(result, (unint64_t *)&qword_1F02D1420);
  }
  return result;
}

uint64_t sub_1DB1F1E6C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D13D0);
  sub_1DB1EFC84(&qword_1F02D13E8, &qword_1F02D13D0, MEMORY[0x1E0CDD950]);
  sub_1DB1EF5C8();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DB1F1EE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1F02D1430;
  if (!qword_1F02D1430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02D1438);
    v2 = sub_1DB1EFC84(&qword_1F02D1410, &qword_1F02D1400, MEMORY[0x1E0CDFA58]);
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CDFEE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F02D1430);
  }
  return result;
}

void *TranscriptCompositor.collectionView.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void TranscriptCompositor.collectionView.setter(void *a1)
{
  sub_1DB1F4128(a1);

}

void (*TranscriptCompositor.collectionView.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_collectionView;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1DB1F2080;
}

void sub_1DB1F2080(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id *v8;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      v5 = objc_msgSend(v4, sel_collectionViewLayout);
      objc_opt_self();
      v6 = swift_dynamicCastObjCClass();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = (id *)(v3[3] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
        swift_beginAccess();
        v5 = *v8;
        *v8 = v7;
      }

    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  return MEMORY[0x1DF0AAA84](v1);
}

uint64_t TranscriptCompositor.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*TranscriptCompositor.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1DF0AAA84](v5);
  return sub_1DB1F22D4;
}

void sub_1DB1F22D4(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t TranscriptCompositor.layoutContext.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t TranscriptCompositor.datasource.getter()
{
  return sub_1DB1F2F90(&OBJC_IVAR___CKTranscriptCompositorSwift_datasource, (uint64_t (*)(_QWORD))MEMORY[0x1E0DEEED0]);
}

id sub_1DB1F24DC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *TranscriptCompositor.collectionViewLayout.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

uint64_t TranscriptCompositor.scrollDirection.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void TranscriptCompositor.scrollDirection.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  double *v9;
  void *v10;
  _QWORD *v11;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
  swift_beginAccess();
  *v3 = a1;
  v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
    v7 = v5;
    v8 = objc_msgSend(v6, sel_init);
    objc_msgSend(v8, sel_setScrollDirection_, *v3);
    v9 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v9);
    swift_beginAccess();
    sub_1DB1F1DBC(0, &qword_1F02D1480);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1DB1F64B4();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v10);

    v11 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v11);
    objc_msgSend(v7, sel_setConfiguration_, v8);

  }
}

void (*TranscriptCompositor.scrollDirection.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1DB1F289C;
}

void sub_1DB1F289C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  double *v11;
  void *v12;
  _QWORD *v13;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    v5 = *v4;
    if (v5)
    {
      v7 = v3[12];
      v6 = v3[13];
      v8 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
      v9 = v5;
      v10 = objc_msgSend(v8, sel_init);
      objc_msgSend(v10, sel_setScrollDirection_, *(_QWORD *)(v7 + v6));
      v11 = (double *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v10, sel_setInterSectionSpacing_, *v11);
      swift_beginAccess();
      sub_1DB1F1DBC(0, &qword_1F02D1480);
      swift_bridgeObjectRetain();
      v12 = (void *)sub_1DB1F64B4();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v12);

      v13 = (_QWORD *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v10, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v9, sel_setConfiguration_, v10);

    }
  }
  free(v3);
}

double TranscriptCompositor.interSectionSpacing.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing;
  swift_beginAccess();
  return *(double *)v1;
}

void TranscriptCompositor.interSectionSpacing.setter(double a1)
{
  uint64_t v1;
  double *v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;

  v3 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  *v3 = a1;
  v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
    v7 = v5;
    v8 = objc_msgSend(v6, sel_init);
    v9 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v3);
    swift_beginAccess();
    sub_1DB1F1DBC(0, &qword_1F02D1480);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1DB1F64B4();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v10);

    v11 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v11);
    objc_msgSend(v7, sel_setConfiguration_, v8);

  }
}

void (*TranscriptCompositor.interSectionSpacing.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1DB1F2D38;
}

void sub_1DB1F2D38(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    v5 = *v4;
    if (v5)
    {
      v6 = v3[12];
      v7 = v3[13];
      v8 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
      v9 = v5;
      v10 = objc_msgSend(v8, sel_init);
      v11 = (_QWORD *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v10, sel_setScrollDirection_, *v11);
      objc_msgSend(v10, sel_setInterSectionSpacing_, *(double *)(v6 + v7));
      swift_beginAccess();
      sub_1DB1F1DBC(0, &qword_1F02D1480);
      swift_bridgeObjectRetain();
      v12 = (void *)sub_1DB1F64B4();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v12);

      v13 = (_QWORD *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v10, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v9, sel_setConfiguration_, v10);

    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.boundarySupplementaryItems.getter()
{
  return sub_1DB1F2F90(&OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems, (uint64_t (*)(_QWORD))MEMORY[0x1E0DEEB18]);
}

uint64_t sub_1DB1F2F90(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  return a2(*v4);
}

void TranscriptCompositor.boundarySupplementaryItems.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  double *v10;
  void *v11;
  _QWORD *v12;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
    v7 = v5;
    v8 = objc_msgSend(v6, sel_init);
    v9 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    v10 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v10);
    sub_1DB1F1DBC(0, &qword_1F02D1480);
    swift_bridgeObjectRetain();
    v11 = (void *)sub_1DB1F64B4();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v11);

    v12 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
    swift_beginAccess();
    objc_msgSend(v8, sel_setContentInsetsReference_, *v12);
    objc_msgSend(v7, sel_setConfiguration_, v8);

  }
}

void (*TranscriptCompositor.boundarySupplementaryItems.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1DB1F325C;
}

void sub_1DB1F325C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  double *v11;
  void *v12;
  _QWORD *v13;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    v5 = *v4;
    if (v5)
    {
      v6 = v3[12];
      v7 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
      v8 = v5;
      v9 = objc_msgSend(v7, sel_init);
      v10 = (_QWORD *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v9, sel_setScrollDirection_, *v10);
      v11 = (double *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v9, sel_setInterSectionSpacing_, *v11);
      sub_1DB1F1DBC(0, &qword_1F02D1480);
      swift_bridgeObjectRetain();
      v12 = (void *)sub_1DB1F64B4();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_setBoundarySupplementaryItems_, v12);

      v13 = (_QWORD *)(v6 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
      swift_beginAccess();
      objc_msgSend(v9, sel_setContentInsetsReference_, *v13);
      objc_msgSend(v8, sel_setConfiguration_, v9);

    }
  }
  free(v3);
}

uint64_t TranscriptCompositor.contentsInsetReference.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void TranscriptCompositor.contentsInsetReference.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  double *v10;
  void *v11;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference);
  swift_beginAccess();
  *v3 = a1;
  v4 = (void **)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
  swift_beginAccess();
  v5 = *v4;
  if (*v4)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
    v7 = v5;
    v8 = objc_msgSend(v6, sel_init);
    v9 = (_QWORD *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
    swift_beginAccess();
    objc_msgSend(v8, sel_setScrollDirection_, *v9);
    v10 = (double *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
    swift_beginAccess();
    objc_msgSend(v8, sel_setInterSectionSpacing_, *v10);
    swift_beginAccess();
    sub_1DB1F1DBC(0, &qword_1F02D1480);
    swift_bridgeObjectRetain();
    v11 = (void *)sub_1DB1F64B4();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setBoundarySupplementaryItems_, v11);

    objc_msgSend(v8, sel_setContentInsetsReference_, *v3);
    objc_msgSend(v7, sel_setConfiguration_, v8);

  }
}

void (*TranscriptCompositor.contentsInsetReference.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x70uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference;
  v3[12] = v1;
  v3[13] = v4;
  swift_beginAccess();
  return sub_1DB1F36F8;
}

void sub_1DB1F36F8(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  double *v12;
  void *v13;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (void **)(v3[12] + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
    swift_beginAccess();
    v5 = *v4;
    if (v5)
    {
      v7 = v3[12];
      v6 = v3[13];
      v8 = objc_allocWithZone(MEMORY[0x1E0CEA430]);
      v9 = v5;
      v10 = objc_msgSend(v8, sel_init);
      v11 = (_QWORD *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection);
      swift_beginAccess();
      objc_msgSend(v10, sel_setScrollDirection_, *v11);
      v12 = (double *)(v7 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
      swift_beginAccess();
      objc_msgSend(v10, sel_setInterSectionSpacing_, *v12);
      swift_beginAccess();
      sub_1DB1F1DBC(0, &qword_1F02D1480);
      swift_bridgeObjectRetain();
      v13 = (void *)sub_1DB1F64B4();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_setBoundarySupplementaryItems_, v13);

      objc_msgSend(v10, sel_setContentInsetsReference_, *(_QWORD *)(v7 + v6));
      objc_msgSend(v9, sel_setConfiguration_, v10);

    }
  }
  free(v3);
}

id TranscriptCompositor.__allocating_init(layoutContext:datasource:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return TranscriptCompositor.init(layoutContext:datasource:)(a1, a2);
}

id TranscriptCompositor.init(layoutContext:datasource:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference] = 1;
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_datasource] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id TranscriptCompositor.layoutSection(forSection:layoutEnvironment:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  void **v5;
  void *v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char *v21;
  void *v22;
  unint64_t v23;
  char v24;
  void *v25;
  char **v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  _BYTE v40[16];
  unint64_t v41;
  double v42;
  char v43;
  unint64_t v44;

  v5 = (void **)&v2[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView];
  swift_beginAccess();
  v6 = *v5;
  if (!v6)
  {
    sub_1DB1F1DBC(0, &qword_1EDAF5630);
    v9 = (id)sub_1DB1F64FC();
    sub_1DB1F64F0();
    sub_1DB1F6244();
LABEL_9:

    return 0;
  }
  v7 = &v2[OBJC_IVAR___CKTranscriptCompositorSwift_delegate];
  swift_beginAccess();
  v8 = (void *)MEMORY[0x1DF0AAA84](v7);
  v9 = v6;
  if (!v8)
    goto LABEL_22;
  v10 = objc_msgSend(v8, sel_compositorDatasourceItemsForSection_, a1);
  swift_unknownObjectRelease();
  if (!v10)
    goto LABEL_22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF5620);
  v11 = sub_1DB1F64C0();

  if (!(v11 >> 62))
  {
    if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  v36 = sub_1DB1F6538();
  swift_bridgeObjectRelease();
  if (!v36)
  {
LABEL_21:
    swift_bridgeObjectRelease();
LABEL_22:
    sub_1DB1F1DBC(0, &qword_1EDAF5630);
    v22 = (void *)sub_1DB1F64FC();
    sub_1DB1F64F0();
    goto LABEL_23;
  }
LABEL_6:
  v12 = (void *)MEMORY[0x1DF0AAA84](v7);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    sub_1DB1F1DBC(0, &qword_1EDAF5630);
    v22 = (void *)sub_1DB1F64FC();
    sub_1DB1F64F0();
LABEL_23:
    sub_1DB1F6244();

    return 0;
  }
  objc_msgSend(v12, sel_compositorMarginInsets);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  swift_unknownObjectRelease();
  v21 = v2;
  swift_unknownObjectRetain();
  sub_1DB1F5534(v21, a1, a2, v11, (uint64_t)v40, v14, v16, v18, v20);
  v23 = v41;
  v44 = v41;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    v38 = sub_1DB1F6538();
    sub_1DB1F4254((uint64_t)&v44);
    if (v38)
      goto LABEL_13;
    goto LABEL_27;
  }
  if (!*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_27:
    sub_1DB1F1DBC(0, &qword_1EDAF5630);
    v39 = (void *)sub_1DB1F64FC();
    sub_1DB1F64F0();
    sub_1DB1F6244();

    sub_1DB1F41F0((uint64_t)v40);
    goto LABEL_9;
  }
LABEL_13:
  v24 = v43;
  v25 = (void *)objc_opt_self();
  if ((v24 & 1) != 0)
  {
    objc_msgSend(v9, sel_bounds);
    v27 = v28;
    v26 = &selRef_estimatedDimension_;
  }
  else
  {
    v26 = &selRef_absoluteDimension_;
    v27 = v42;
  }
  v29 = objc_msgSend(v25, *v26, v27);
  v30 = objc_msgSend((id)objc_opt_self(), sel_fractionalWidthDimension_, 1.0);
  v31 = objc_msgSend((id)objc_opt_self(), sel_sizeWithWidthDimension_heightDimension_, v30, v29);
  if (v23 >> 62)
  {
    sub_1DB1F1DBC(0, (unint64_t *)&qword_1EDAF5610);
    swift_bridgeObjectRetain();
    sub_1DB1F652C();
    sub_1DB1F4254((uint64_t)&v44);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1DB1F655C();
    sub_1DB1F1DBC(0, (unint64_t *)&qword_1EDAF5610);
  }
  v32 = (void *)objc_opt_self();
  sub_1DB1F1DBC(0, (unint64_t *)&qword_1EDAF5610);
  v33 = (void *)sub_1DB1F64B4();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_verticalGroupWithLayoutSize_subitems_, v31, v33);

  v35 = objc_msgSend((id)objc_opt_self(), sel_sectionWithGroup_, v34);
  sub_1DB1F41F0((uint64_t)v40);
  return v35;
}

id TranscriptCompositor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TranscriptCompositor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TranscriptCompositor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DB1F4128(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id *v9;

  v3 = (id *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (*v3)
  {
    v6 = objc_msgSend(*v3, sel_collectionViewLayout);
    objc_opt_self();
    v7 = swift_dynamicCastObjCClass();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (id *)(v1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionViewLayout);
      swift_beginAccess();
      v6 = *v9;
      *v9 = v8;
    }

  }
}

uint64_t sub_1DB1F41F0(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DB1F4254(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

id sub_1DB1F427C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_collectionView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_1DB1F42CC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1DB1F4128(v1);

}

uint64_t sub_1DB1F4308@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  result = MEMORY[0x1DF0AAA84](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1DB1F435C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1DB1F43B0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___CKTranscriptCompositorSwift_scrollDirection, a2);
}

void sub_1DB1F43BC(uint64_t *a1)
{
  TranscriptCompositor.scrollDirection.setter(*a1);
}

double sub_1DB1F43E0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_interSectionSpacing);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

void sub_1DB1F4430(double *a1)
{
  TranscriptCompositor.interSectionSpacing.setter(*a1);
}

uint64_t sub_1DB1F4454@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___CKTranscriptCompositorSwift_boundarySupplementaryItems);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

void sub_1DB1F44A8()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  TranscriptCompositor.boundarySupplementaryItems.setter(v0);
}

uint64_t sub_1DB1F44D0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___CKTranscriptCompositorSwift_contentsInsetReference, a2);
}

uint64_t keypath_get_3Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

void sub_1DB1F4528(uint64_t *a1)
{
  TranscriptCompositor.contentsInsetReference.setter(*a1);
}

uint64_t type metadata accessor for TranscriptCompositor()
{
  return objc_opt_self();
}

uint64_t method lookup function for TranscriptCompositor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranscriptCompositor.__allocating_init(layoutContext:datasource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1DB1F4580(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void sub_1DB1F45A4()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1DB1F6484();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  qword_1F02D1D10 = (uint64_t)v1;
}

BOOL sub_1DB1F4610(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1DB1F4628()
{
  sub_1DB1F6598();
  sub_1DB1F65A4();
  return sub_1DB1F65B0();
}

uint64_t sub_1DB1F466C()
{
  return sub_1DB1F65A4();
}

uint64_t sub_1DB1F4694()
{
  sub_1DB1F6598();
  sub_1DB1F65A4();
  return sub_1DB1F65B0();
}

uint64_t sub_1DB1F46E4(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v4 = v3;
  v5 = a2;
  v28 = a1;
  if (a2 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    v6 = sub_1DB1F6538();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v29 = v4;
      v30 = v5 & 0xC000000000000001;
      v31 = v5;
      v7 = 4;
      do
      {
        v12 = v7 - 4;
        if (v30)
        {
          v13 = (void *)MEMORY[0x1DF0AA604](v7 - 4, v5);
          v14 = v7 - 3;
          if (__OFADD__(v12, 1))
            goto LABEL_21;
        }
        else
        {
          v13 = *(void **)(v5 + 8 * v7);
          swift_unknownObjectRetain();
          v14 = v7 - 3;
          if (__OFADD__(v12, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        v15 = v2[1];
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF5620);
        v16 = (void *)sub_1DB1F64B4();
        v17 = objc_msgSend(v13, sel_layoutItemWithEnvironment_datasourceItemIndex_allDatasourceItems_, v15, v7 - 4, v16);

        if (v17)
        {
          v18 = *v2 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
          swift_beginAccess();
          v19 = (void *)MEMORY[0x1DF0AAA84](v18);
          if (v19)
          {
            v20 = objc_msgSend(v19, sel_compositorSupportsCustomLayoutGroupsForSection_, v28);
            swift_unknownObjectRelease();
          }
          else
          {
            v20 = 0;
          }
          v21 = (void *)MEMORY[0x1DF0AAA84](v18);
          if (v21
            && (v22 = objc_msgSend(v21, sel_compositorSupportsCustomLayoutGroupsForLayoutProvider_, v13),
                swift_unknownObjectRelease(),
                (v20 & v22) == 1))
          {
            sub_1DB1F49AC(v13, v7 - 4, v31, v17);
            if (v29)
            {

              swift_bridgeObjectRelease();
              v23 = objc_msgSend(v13, sel_layoutGroupIdentifier);
              v24 = sub_1DB1F6490();
              v26 = v25;

              swift_unknownObjectRelease();
              result = swift_bridgeObjectRelease();
              v2[5] = v24;
              v2[6] = v26;
              return result;
            }
          }
          else
          {
            sub_1DB1F5100(v13, v7 - 4, 0.0, 0.0, v31, v17);
          }

        }
        v8 = objc_msgSend(v13, sel_layoutGroupIdentifier, v28);
        v9 = sub_1DB1F6490();
        v11 = v10;

        v4 = v2[6];
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        v2[5] = v9;
        v2[6] = v11;
        ++v7;
        v5 = v31;
      }
      while (v14 != v6);
    }
  }
  return swift_bridgeObjectRelease();
}

void sub_1DB1F49AC(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;

  v9 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
  }
  else
  {
    v5 = v4;
    v8 = a4;
    v4 = a3;
    v7 = a2;
    v6 = a1;
    if (!(a3 >> 62))
    {
      v10 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v10 = sub_1DB1F6538();
  swift_bridgeObjectRelease();
LABEL_4:
  v58 = v7;
  if (v9 >= v10)
  {
    v20 = *(_QWORD *)(v5 + 48);
    if (!v20)
      goto LABEL_43;
    v59 = v8;
    v21 = 0;
    goto LABEL_16;
  }
  v59 = v8;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v11 = (void *)MEMORY[0x1DF0AA604](v9, v4);
    goto LABEL_9;
  }
  if (v9 < 0)
  {
    __break(1u);
    goto LABEL_51;
  }
  if ((unint64_t)v9 >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v11 = *(void **)(v4 + 8 * v9 + 32);
  swift_unknownObjectRetain();
LABEL_9:
  v12 = objc_msgSend(v11, sel_layoutGroupIdentifier, v7);
  swift_unknownObjectRelease();
  v13 = sub_1DB1F6490();
  v15 = v14;

  v16 = objc_msgSend(v6, sel_layoutGroupIdentifier);
  v17 = sub_1DB1F6490();
  v19 = v18;

  if (v13 == v17 && v15 == v19)
  {
    swift_bridgeObjectRelease_n();
    v20 = *(_QWORD *)(v5 + 48);
    v8 = v59;
    if (!v20)
      goto LABEL_42;
    v21 = 1;
  }
  else
  {
    v21 = sub_1DB1F6550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = *(_QWORD *)(v5 + 48);
    if (!v20)
    {
      v8 = v59;
      if ((v21 & 1) != 0)
        goto LABEL_42;
      goto LABEL_43;
    }
  }
LABEL_16:
  v22 = *(_QWORD *)(v5 + 40);
  swift_bridgeObjectRetain();
  v23 = objc_msgSend(v6, sel_layoutGroupIdentifier);
  v24 = sub_1DB1F6490();
  v26 = v25;

  if (v22 != v24 || v20 != v26)
  {
    v27 = sub_1DB1F6550();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
    {
      v8 = v59;
      if ((v27 & 1) != 0)
        goto LABEL_22;
LABEL_42:
      __swift_instantiateConcreteTypeFromMangledName(qword_1EDAF5638);
      v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = xmmword_1DB1F7070;
      *(_QWORD *)(v53 + 32) = v6;
      v60 = v53;
      sub_1DB1F64CC();
      *(_QWORD *)(v5 + 56) = v60;
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_1DB1F7070;
      *(_QWORD *)(v54 + 32) = v8;
      v61 = v54;
      sub_1DB1F64CC();
      *(_QWORD *)(v5 + 64) = v61;
      v55 = v8;
      swift_bridgeObjectRelease();
      return;
    }
    v8 = v59;
    if ((v27 & 1) != 0)
      goto LABEL_27;
LABEL_43:
    v56 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 64) = v56;
    swift_bridgeObjectRelease();
    sub_1DB1F5100(v6, v58, 0.0, 0.0, v4, v8);
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v59;
  if ((v21 & 1) == 0)
  {
LABEL_27:
    v30 = swift_unknownObjectRetain();
    MEMORY[0x1DF0AA598](v30);
    if (*(_QWORD *)((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1DB1F64D8();
    sub_1DB1F64E4();
    sub_1DB1F64CC();
    v31 = v8;
    MEMORY[0x1DF0AA598]();
    if (*(_QWORD *)((*(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1DB1F64D8();
    sub_1DB1F64E4();
    sub_1DB1F64CC();
    v32 = *(_QWORD *)v5 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
    swift_beginAccess();
    v33 = MEMORY[0x1DF0AAA84](v32);
    if (!v33)
      goto LABEL_40;
    v34 = (void *)v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF5620);
    v35 = (void *)sub_1DB1F64B4();
    v36 = *(_QWORD *)(v5 + 8);
    sub_1DB1F1DBC(0, (unint64_t *)&qword_1EDAF5610);
    v37 = (void *)sub_1DB1F64B4();
    v38 = objc_msgSend(v34, sel_layoutGroupForDatasourceItems_environment_layoutItems_, v35, v36, v37);
    swift_unknownObjectRelease();

    if (!v38)
    {
LABEL_40:
      sub_1DB1F1DBC(0, &qword_1EDAF5630);
      v51 = (void *)sub_1DB1F64FC();
      sub_1DB1F64F0();
      sub_1DB1F6244();

      sub_1DB1F58B8();
      swift_allocError();
      *v52 = 0;
      swift_willThrow();
      return;
    }
    v39 = v38;
    MEMORY[0x1DF0AA598]();
    if (*(_QWORD *)((*(_QWORD *)(v5 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1DB1F64D8();
    sub_1DB1F64E4();
    sub_1DB1F64CC();
    sub_1DB1F544C(v39);
    v40 = objc_msgSend(v39, sel_edgeSpacing);
    if (v40)
    {
      v41 = v40;
      v42 = objc_msgSend(v40, sel_top);
      if (v42)
      {
        v43 = v42;
        objc_msgSend(v42, sel_spacing);
        v45 = v44;

        *(double *)(v5 + 24) = v45 + *(double *)(v5 + 24);
      }
      v46 = objc_msgSend(v41, sel_bottom, v58);
      if (v46)
      {
        v47 = v46;
        objc_msgSend(v46, sel_spacing);
        v49 = v48;

        *(double *)(v5 + 24) = v49 + *(double *)(v5 + 24);
        v50 = MEMORY[0x1E0DEE9D8];
        *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEE9D8];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v5 + 64) = v50;
LABEL_46:

        swift_bridgeObjectRelease();
        return;
      }

    }
    v57 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + 64) = v57;
    goto LABEL_46;
  }
LABEL_22:
  v28 = swift_unknownObjectRetain();
  MEMORY[0x1DF0AA598](v28);
  if (*(_QWORD *)((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 56) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
LABEL_52:
    sub_1DB1F64D8();
  sub_1DB1F64E4();
  sub_1DB1F64CC();
  v29 = v8;
  MEMORY[0x1DF0AA598]();
  if (*(_QWORD *)((*(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1DB1F64D8();
  sub_1DB1F64E4();
  sub_1DB1F64CC();
}

void sub_1DB1F5100(void *a1, uint64_t a2, double a3, double a4, uint64_t a5, void *a6)
{
  double *v6;
  double *v7;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  __int128 v36;
  uint64_t v37;

  v7 = v6;
  sub_1DB1F544C(a6);
  v13 = *(_QWORD *)v6 + OBJC_IVAR___CKTranscriptCompositorSwift_delegate;
  swift_beginAccess();
  v14 = MEMORY[0x1DF0AAA84](v13);
  if (!v14)
    goto LABEL_3;
  v15 = (void *)v14;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EDAF5638);
  v16 = swift_allocObject();
  v36 = xmmword_1DB1F7070;
  *(_OWORD *)(v16 + 16) = xmmword_1DB1F7070;
  *(_QWORD *)(v16 + 32) = a1;
  sub_1DB1F64CC();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF5620);
  v17 = (void *)sub_1DB1F64B4();
  swift_bridgeObjectRelease();
  v37 = *((_QWORD *)v7 + 1);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1DB1F7070;
  *(_QWORD *)(v18 + 32) = a6;
  sub_1DB1F64CC();
  sub_1DB1F1DBC(0, (unint64_t *)&qword_1EDAF5610);
  v19 = a6;
  v20 = a2;
  v21 = (void *)sub_1DB1F64B4();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v15, sel_layoutGroupForDatasourceItems_environment_layoutItems_, v17, v37, v21);
  swift_unknownObjectRelease();

  a2 = v20;
  if (!v22)
LABEL_3:
    v22 = _s15MessagesSupport25TranscriptLayoutUtilitiesC012dynamicWidthD5Group10layoutItemSo012NSCollectiondH0CSo0kdJ0C_tFZ_0(a6);
  v23 = *((_QWORD *)v7 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF5620);
  v24 = (void *)sub_1DB1F64B4();
  sub_1DB1F1DBC(0, &qword_1EDAF5628);
  v25 = (void *)sub_1DB1F64B4();
  v26 = objc_msgSend(a1, sel_layoutItemSpacingWithEnvironment_datasourceItemIndex_allDatasourceItems_supplementryItems_sizeOverride_, v23, a2, v24, v25, a3, a4);

  if (v26)
  {
    objc_msgSend(v22, sel_setEdgeSpacing_, v26);
    v27 = objc_msgSend(v26, sel_top);
    if (v27)
    {
      v28 = v27;
      objc_msgSend(v27, sel_spacing);
      v30 = v29;

      v7[3] = v30 + v7[3];
    }
    v31 = objc_msgSend(v26, sel_bottom, v36);
    if (v31)
    {
      v32 = v31;
      objc_msgSend(v31, sel_spacing);
      v34 = v33;

      v7[3] = v34 + v7[3];
    }
    else
    {

    }
  }
  v35 = v22;
  MEMORY[0x1DF0AA598]();
  if (*(_QWORD *)(((_QWORD)v7[2] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((_QWORD)v7[2] & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_1DB1F64D8();
  sub_1DB1F64E4();
  sub_1DB1F64CC();

}

void sub_1DB1F544C(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  char v5;
  id v6;
  id v7;
  double v8;
  double v9;

  v3 = objc_msgSend(a1, sel_layoutSize);
  v4 = objc_msgSend(v3, sel_heightDimension);

  LOBYTE(v3) = objc_msgSend(v4, sel_isEstimated);
  if ((v3 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(a1, sel_layoutSize);
    v7 = objc_msgSend(v6, sel_heightDimension);

    objc_msgSend(v7, sel_dimension);
    v9 = v8;

    v5 = 0;
    *(double *)(v1 + 24) = v9 + *(double *)(v1 + 24);
  }
  *(_BYTE *)(v1 + 32) = v5;
}

uint64_t sub_1DB1F5534@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>)
{
  uint64_t v9;
  void **v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  char *v24;
  id v25;
  void *v26;
  _BYTE *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t result;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;

  *((_QWORD *)&v46 + 1) = MEMORY[0x1E0DEE9D8];
  v47 = 0;
  v48 = 0;
  v49 = 0uLL;
  *(_QWORD *)&v50 = MEMORY[0x1E0DEE9D8];
  *((_QWORD *)&v50 + 1) = MEMORY[0x1E0DEE9D8];
  v19 = (void **)&a1[OBJC_IVAR___CKTranscriptCompositorSwift_collectionView];
  swift_beginAccess();
  v20 = *v19;
  if (!*v19)
  {
    swift_bridgeObjectRelease();
    sub_1DB1F1DBC(0, &qword_1EDAF5630);
    v26 = (void *)sub_1DB1F64FC();
    sub_1DB1F64F0();
    sub_1DB1F6244();

    sub_1DB1F58B8();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();

    swift_unknownObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v43 = a2;
  v45 = a1;
  v21 = &a1[OBJC_IVAR___CKTranscriptCompositorSwift_delegate];
  swift_beginAccess();
  v22 = (void *)MEMORY[0x1DF0AAA84](v21);
  v23 = v20;
  v24 = a1;
  v42 = a5;
  v51 = a4;
  if (v22)
  {
    v25 = objc_msgSend(v22, sel_compositorMessageEditingContext);
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0;
  }
  v28 = &v24[OBJC_IVAR___CKTranscriptCompositorSwift_datasource];
  swift_beginAccess();
  v29 = *(_QWORD *)v28;
  v44[3] = swift_getObjectType();
  v44[0] = v29;
  v30 = &v24[OBJC_IVAR___CKTranscriptCompositorSwift_layoutContext];
  swift_beginAccess();
  v31 = *(_QWORD *)v30;
  v32 = objc_allocWithZone((Class)CKTranscriptLayoutEnvironment);
  v33 = v23;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v34 = v25;
  v35 = objc_msgSend(v32, sel_initWithDatasource_collectionLayoutEnvironment_collectionView_marginInsets_layoutContext_messageEditingContext_, sub_1DB1F6544(), a3, v33, v31, v34, a6, a7, a8, a9);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  *(_QWORD *)&v46 = v35;
  sub_1DB1F46E4(v43, v51);

  swift_bridgeObjectRelease();
  result = swift_unknownObjectRelease();
  if (v9)
  {

    goto LABEL_8;
  }
  v37 = v47;
  v38 = v48;
  v39 = v49;
  v40 = v46;
  v41 = v50;
  *(_QWORD *)v42 = v45;
  *(_OWORD *)(v42 + 8) = v40;
  *(_QWORD *)(v42 + 24) = v37;
  *(_BYTE *)(v42 + 32) = v38;
  *(_OWORD *)(v42 + 40) = v39;
  *(_OWORD *)(v42 + 56) = v41;
  return result;
}

unint64_t sub_1DB1F58B8()
{
  unint64_t result;

  result = qword_1F02D14F8;
  if (!qword_1F02D14F8)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F76AC, &type metadata for TranscriptCompositorLayoutPassError);
    atomic_store(result, (unint64_t *)&qword_1F02D14F8);
  }
  return result;
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TranscriptCompositorLayoutPassError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TranscriptCompositorLayoutPassError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DB1F5A08 + 4 * byte_1DB1F7615[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DB1F5A3C + 4 * byte_1DB1F7610[v4]))();
}

uint64_t sub_1DB1F5A3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB1F5A44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB1F5A4CLL);
  return result;
}

uint64_t sub_1DB1F5A58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB1F5A60);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DB1F5A64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB1F5A6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB1F5A78(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DB1F5A84(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TranscriptCompositorLayoutPassError()
{
  return &type metadata for TranscriptCompositorLayoutPassError;
}

unint64_t sub_1DB1F5AA4()
{
  unint64_t result;

  result = qword_1F02D1560;
  if (!qword_1F02D1560)
  {
    result = MEMORY[0x1DF0AAA00](&unk_1DB1F7684, &type metadata for TranscriptCompositorLayoutPassError);
    atomic_store(result, (unint64_t *)&qword_1F02D1560);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for InboxItemView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for InboxItemView(uint64_t a1)
{

}

_QWORD *assignWithCopy for InboxItemView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

_QWORD *assignWithTake for InboxItemView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for InboxItemView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InboxItemView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InboxItemView()
{
  return &type metadata for InboxItemView;
}

uint64_t sub_1DB1F5C1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DB1F5C2C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;

  v47 = a3;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1578);
  v5 = *(_QWORD *)(v46 - 8);
  v6 = MEMORY[0x1E0C80A78](v46);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v50 = a1;
  v51 = a2;
  v48 = a1;
  v49 = a2;
  v45 = (char *)&v42 - v9;
  sub_1DB1F6454();
  swift_getKeyPath();
  swift_getKeyPath();
  v10 = a2;
  sub_1DB1F6298();

  swift_release();
  swift_release();
  v11 = HIBYTE(v53) & 0xF;
  if ((v53 & 0x2000000000000000) == 0)
    v11 = v52 & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    sub_1DB1EF5C8();
    v12 = sub_1DB1F63F4();
    v14 = v13;
    v16 = v15 & 1;
    sub_1DB1F6388();
    v17 = sub_1DB1F63E8();
    v19 = v18;
    v42 = v5;
    v43 = v8;
    v21 = v20;
    swift_release();
    sub_1DB1EF60C(v12, v14, v16);
    swift_bridgeObjectRelease();
    v22 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
    MEMORY[0x1DF0AA52C](v22);
    v23 = sub_1DB1F63D0();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v8 = v43;
    swift_release();
    v30 = v27 & 1;
    sub_1DB1EF60C(v17, v19, v21 & 1);
    v5 = v42;
    swift_bridgeObjectRelease();
    sub_1DB1F6144(v23, v25, v30);
    swift_bridgeObjectRetain();
    v44 = v23;
    sub_1DB1EF60C(v23, v25, v30);
    swift_bridgeObjectRelease();
    v31 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    v31 = 0;
    v44 = 0;
    v25 = 0;
    v30 = 0;
    v29 = 0;
  }
  v32 = v5;
  v33 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v34 = v8;
  v36 = v45;
  v35 = v46;
  v33(v8, v45, v46);
  v37 = v47;
  v33(v47, v34, v35);
  v38 = &v37[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1580) + 48)];
  *(_QWORD *)v38 = 0;
  *((_QWORD *)v38 + 1) = v31;
  v39 = v44;
  *((_QWORD *)v38 + 2) = v44;
  *((_QWORD *)v38 + 3) = v25;
  *((_QWORD *)v38 + 4) = v30;
  *((_QWORD *)v38 + 5) = v29;
  sub_1DB1F6154(0, v31, v39, v25, v30, v29);
  v40 = *(void (**)(char *, uint64_t))(v32 + 8);
  v40(v36, v35);
  sub_1DB1F6190(0, v31, v39, v25, v30, v29);
  return ((uint64_t (*)(char *, uint64_t))v40)(v34, v35);
}

uint64_t sub_1DB1F5F7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  sub_1DB1EF5C8();
  swift_bridgeObjectRetain();
  v2 = sub_1DB1F63F4();
  v4 = v3;
  v6 = v5 & 1;
  v7 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  MEMORY[0x1DF0AA52C](v7);
  v8 = sub_1DB1F63D0();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_1DB1EF60C(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v10;
  *(_BYTE *)(a1 + 16) = v12 & 1;
  *(_QWORD *)(a1 + 24) = v14;
  return result;
}

uint64_t sub_1DB1F6088@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  v3 = (void *)v1[1];
  *(_QWORD *)a1 = sub_1DB1F6328();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1570);
  return sub_1DB1F5C2C(v4, v3, (char *)(a1 + *(int *)(v5 + 44)));
}

uint64_t sub_1DB1F60E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB1F5F7C(a1);
}

uint64_t sub_1DB1F60E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = sub_1DB1F6448();
  *a1 = result;
  return result;
}

uint64_t sub_1DB1F6144(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1DB1F6154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    sub_1DB1F6144(a3, a4, a5 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1DB1F6190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t result;

  if (a6)
  {
    sub_1DB1EF60C(a3, a4, a5 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1DB1F61D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02D1588;
  if (!qword_1F02D1588)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1F02D1590);
    result = MEMORY[0x1DF0AAA00](MEMORY[0x1E0CDFB10], v1);
    atomic_store(result, (unint64_t *)&qword_1F02D1588);
  }
  return result;
}

uint64_t sub_1DB1F6220()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1DB1F622C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1DB1F6238()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DB1F6244()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1DB1F6250()
{
  return MEMORY[0x1E0CD8238]();
}

uint64_t sub_1DB1F625C()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DB1F6268()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DB1F6274()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1DB1F6280()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1DB1F628C()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1DB1F6298()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DB1F62A4()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DB1F62B0()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1DB1F62BC()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1DB1F62C8()
{
  return MEMORY[0x1E0CDA0D8]();
}

uint64_t sub_1DB1F62D4()
{
  return MEMORY[0x1E0CDA0E0]();
}

uint64_t sub_1DB1F62E0()
{
  return MEMORY[0x1E0CDA458]();
}

uint64_t sub_1DB1F62EC()
{
  return MEMORY[0x1E0CDA478]();
}

uint64_t sub_1DB1F62F8()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1DB1F6304()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1DB1F6310()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1DB1F631C()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1DB1F6328()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1DB1F6334()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1DB1F6340()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1DB1F634C()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1DB1F6358()
{
  return MEMORY[0x1E0CDBD58]();
}

uint64_t sub_1DB1F6364()
{
  return MEMORY[0x1E0CDBD70]();
}

uint64_t sub_1DB1F6370()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1DB1F637C()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1DB1F6388()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1DB1F6394()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1DB1F63A0()
{
  return MEMORY[0x1E0CDD678]();
}

uint64_t sub_1DB1F63AC()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_1DB1F63B8()
{
  return MEMORY[0x1E0CDD728]();
}

uint64_t sub_1DB1F63C4()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1DB1F63D0()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1DB1F63DC()
{
  return MEMORY[0x1E0CDDBE0]();
}

uint64_t sub_1DB1F63E8()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1DB1F63F4()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1DB1F6400()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1DB1F640C()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1DB1F6418()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1DB1F6424()
{
  return MEMORY[0x1E0CDE590]();
}

uint64_t sub_1DB1F6430()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_1DB1F643C()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1DB1F6448()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_1DB1F6454()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1DB1F6460()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1DB1F646C()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_1DB1F6478()
{
  return MEMORY[0x1E0CDFF58]();
}

uint64_t sub_1DB1F6484()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DB1F6490()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DB1F649C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DB1F64A8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DB1F64B4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DB1F64C0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DB1F64CC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DB1F64D8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DB1F64E4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DB1F64F0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DB1F64FC()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1DB1F6508()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DB1F6514()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DB1F6520()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1DB1F652C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1DB1F6538()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DB1F6544()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DB1F6550()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DB1F655C()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1DB1F6568()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DB1F6574()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DB1F6580()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DB1F658C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DB1F6598()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DB1F65A4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DB1F65B0()
{
  return MEMORY[0x1E0DEDF40]();
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

