uint64_t sub_1000029A8()
{
  void *v1;

  v1 = &unk_10001AE78;
  return swift_initClassMetadata2();
}

void sub_1000029F4()
{
  sub_100002C68();
}

uint64_t sub_100002A2C(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = v1;
  return a1;
}

void sub_100002A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v5 = (uint64_t *)((swift_isaMask & *v4) + qword_100025188);
  v6 = *v5;
  v7 = v5[1];
  v8 = (objc_class *)type metadata accessor for HostingController(0, *v5, v7, a4);
  v12.receiver = v4;
  v12.super_class = v8;
  objc_msgSendSuper2(&v12, "viewDidLoad");
  UIHostingController.safeAreaRegions.setter(0);
  v9 = objc_msgSend(v4, "view");
  if (v9)
  {
    v10 = v9;
    v11 = type metadata accessor for _UIHostingView(0, v6, v7);
    if (swift_dynamicCastClass(v10, v11))
      dispatch thunk of _UIHostingView.safeAreaRegions.setter(0);

  }
}

void sub_100002B0C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = a1;
  sub_100002A44((uint64_t)v4, v1, v2, v3);

}

void sub_100002B40()
{
  _swift_stdlib_reportUnimplementedInitializer("AskToMessagesExtension.HostingController", 40, "init(rootView:)", 15, 0);
  __break(1u);
}

void sub_100002B6C()
{
  _swift_stdlib_reportUnimplementedInitializer("AskToMessagesExtension.HostingController", 40, "init(coder:rootView:)", 21, 0);
  __break(1u);
}

id sub_100002B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for HostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_100025188), *(_QWORD *)((swift_isaMask & *v4) + qword_100025188 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t type metadata accessor for HostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002CC0(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HostingController);
}

__n128 sub_100002BFC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002C0C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100002C2C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100002D00(a1, &qword_100024850, (uint64_t)&unk_100020FD0);
}

void sub_100002C68()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010001C080, "AskToMessagesExtension/HostingController.swift", 46, 2, 20, 0);
  __break(1u);
}

uint64_t sub_100002CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void type metadata accessor for Style(uint64_t a1)
{
  sub_100002D00(a1, &qword_100024858, (uint64_t)&unk_100020FF8);
}

void sub_100002D00(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for StatusView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for StatusView(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_release(a1[6]);
}

_QWORD *initializeWithCopy for StatusView(_QWORD *a1, _QWORD *a2)
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
  v6 = a2[6];
  a1[6] = v6;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  return a1;
}

_QWORD *assignWithCopy for StatusView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a1[6];
  v11 = a2[6];
  a1[6] = v11;
  swift_retain(v11);
  swift_release(v10);
  return a1;
}

__n128 initializeWithTake for StatusView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for StatusView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = a1[3];
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  a1[4] = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(a1[5]);
  v8 = a1[6];
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 40);
  swift_release(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusView()
{
  return &type metadata for StatusView;
}

uint64_t sub_100002FD8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001CBA4, 1);
}

uint64_t sub_100002FE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v53;
  uint64_t v54;
  char *v55;
  _BYTE v56[152];
  _BYTE v57[152];
  _OWORD v58[9];
  __int16 v59;
  _OWORD v60[10];

  v4 = sub_1000039D8(&qword_100024868);
  __chkstk_darwin(v4);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000039D8(&qword_100024870);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v53 - v12;
  *(_QWORD *)v6 = static VerticalAlignment.center.getter(v11);
  *((_QWORD *)v6 + 1) = 0x4010000000000000;
  v6[16] = 0;
  v14 = sub_1000039D8(&qword_100024878);
  v15 = sub_1000033E8(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  v16 = static Alignment.topLeading.getter(v15);
  sub_100004928(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v16, v17);
  sub_100003DB0((uint64_t)v6, &qword_100024868);
  sub_100003DEC((uint64_t)v10, (uint64_t)v13, &qword_100024870);
  v18 = a1[3];
  if (v18)
  {
    *(_QWORD *)&v60[0] = a1[2];
    *((_QWORD *)&v60[0] + 1) = v18;
    v19 = sub_100003B1C();
    swift_bridgeObjectRetain(v18);
    v20 = Text.init<A>(_:)(v60, &type metadata for String, v19);
    v22 = v21;
    v24 = v23;
    v26 = v25 & 1;
    v27 = static Font.caption2.getter(v20);
    v53 = v13;
    v28 = v27;
    v29 = Text.font(_:)(v27, v20, v22, v26, v24);
    v54 = a2;
    v55 = v10;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    swift_release(v28);
    v36 = v33 & 1;
    sub_100003B0C(v20, v22, v26);
    v37 = swift_bridgeObjectRelease(v24);
    v38 = static Color.secondary.getter(v37);
    v39 = Text.foregroundColor(_:)(v38, v29, v31, v36, v35);
    v41 = v40;
    LOBYTE(v26) = v42;
    v44 = v43;
    swift_release(v38);
    v45 = v31;
    v46 = v36;
    a2 = v54;
    v10 = v55;
    sub_100003B0C(v29, v45, v46);
    v47 = swift_bridgeObjectRelease(v35);
    v48 = static Alignment.topLeading.getter(v47);
    sub_100004AE4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v60, 0.0, 1, 0.0, 1, v48, v49, v39, v41, v26 & 1, v44);
    sub_100003B0C(v39, v41, v26 & 1);
    v50 = v44;
    v13 = v53;
    swift_bridgeObjectRelease(v50);
    v58[6] = v60[6];
    v58[7] = v60[7];
    v58[8] = v60[8];
    v58[2] = v60[2];
    v58[3] = v60[3];
    v58[4] = v60[4];
    v58[5] = v60[5];
    v58[0] = v60[0];
    v58[1] = v60[1];
    v59 = 256;
    nullsub_1(v58);
  }
  else
  {
    sub_100003A18((uint64_t)v58);
  }
  sub_100003DEC((uint64_t)v58, (uint64_t)v60, &qword_100024880);
  sub_100003D6C((uint64_t)v13, (uint64_t)v10, &qword_100024870);
  sub_100003DEC((uint64_t)v60, (uint64_t)v56, &qword_100024880);
  sub_100003D6C((uint64_t)v10, a2, &qword_100024870);
  v51 = a2 + *(int *)(sub_1000039D8(&qword_100024888) + 48);
  sub_100003DEC((uint64_t)v56, (uint64_t)v57, &qword_100024880);
  sub_100003DEC((uint64_t)v57, v51, &qword_100024880);
  sub_100003A78((uint64_t)v57, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_100003A38);
  sub_100003DB0((uint64_t)v13, &qword_100024870);
  sub_100003DEC((uint64_t)v56, (uint64_t)v58, &qword_100024880);
  sub_100003A78((uint64_t)v58, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_100003ADC);
  return sub_100003DB0((uint64_t)v10, &qword_100024870);
}

uint64_t sub_1000033E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t KeyPath;
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
  uint64_t *v45;
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
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v85[3];

  v68 = sub_1000039D8(&qword_100024898);
  __chkstk_darwin(v68);
  v5 = (uint64_t *)((char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for Image.Scale(0);
  v71 = *(_QWORD *)(v6 - 8);
  v72 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1000039D8(&qword_1000248A0);
  __chkstk_darwin(v67);
  v10 = (uint64_t *)((char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v69 = sub_1000039D8(&qword_1000248A8);
  __chkstk_darwin(v69);
  v70 = (uint64_t)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_1000039D8(&qword_1000248B0);
  v78 = *(_QWORD *)(v80 - 8);
  v12 = __chkstk_darwin(v80);
  v74 = (uint64_t)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v73 = (uint64_t)&v67 - v14;
  v15 = sub_1000039D8(&qword_1000248B8);
  v16 = __chkstk_darwin(v15);
  v81 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v76 = (uint64_t)&v67 - v18;
  v19 = a1[1];
  v85[0] = *a1;
  v85[1] = v19;
  v20 = sub_100003B1C();
  swift_bridgeObjectRetain(v19);
  v21 = Text.init<A>(_:)(v85, &type metadata for String, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  v28 = static Font.footnote.getter();
  v77 = Text.font(_:)(v28, v21, v23, v27, v25);
  v84 = v29;
  v75 = v30;
  v79 = v31;
  swift_release(v28);
  sub_100003B0C(v21, v23, v27);
  swift_bridgeObjectRelease(v25);
  KeyPath = swift_getKeyPath(&unk_10001AF68);
  v33 = static Color.primary.getter();
  v34 = swift_getKeyPath(&unk_10001AF98);
  v35 = a1[5];
  v82 = v34;
  v83 = v33;
  if (v35)
  {
    v36 = a1[4];
    swift_bridgeObjectRetain(v35);
    v37 = Image.init(systemName:)(v36, v35);
    v39 = v71;
    v38 = v72;
    (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v8, enum case for Image.Scale.small(_:), v72);
    v40 = swift_getKeyPath(&unk_10001AFC8);
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))((char *)v5 + *(int *)(v68 + 28), v8, v38);
    *v5 = v40;
    sub_100003D6C((uint64_t)v5, (uint64_t)v10 + *(int *)(v67 + 36), &qword_100024898);
    *v10 = v37;
    swift_retain(v37);
    sub_100003DB0((uint64_t)v5, &qword_100024898);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v38);
    v41 = swift_release(v37);
    v42 = static Font.caption2.getter(v41);
    v43 = swift_getKeyPath(&unk_10001AFF8);
    v44 = v70;
    sub_100003D6C((uint64_t)v10, v70, &qword_1000248A0);
    v45 = (uint64_t *)(v44 + *(int *)(v69 + 36));
    *v45 = v43;
    v45[1] = v42;
    v46 = sub_100003DB0((uint64_t)v10, &qword_1000248A0);
    v47 = a1[6];
    v48 = v47;
    if (!v47)
      v48 = static Color.gray.getter(v46);
    v49 = swift_getKeyPath(&unk_10001AF98);
    v50 = v74;
    sub_100003D6C(v44, v74, &qword_1000248A8);
    v51 = v80;
    v52 = (uint64_t *)(v50 + *(int *)(v80 + 36));
    *v52 = v49;
    v52[1] = v48;
    swift_retain(v47);
    sub_100003DB0(v44, &qword_1000248A8);
    v53 = v73;
    sub_100003DEC(v50, v73, &qword_1000248B0);
    v54 = v76;
    sub_100003DEC(v53, v76, &qword_1000248B0);
    v55 = 0;
    v56 = (uint64_t)v81;
    v57 = v78;
    v58 = v79;
    v59 = v77;
  }
  else
  {
    v55 = 1;
    v51 = v80;
    v56 = (uint64_t)v81;
    v57 = v78;
    v58 = v79;
    v54 = v76;
    v59 = v77;
  }
  v60 = v75;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v54, v55, 1, v51);
  v61 = v60 & 1;
  sub_100003D6C(v54, v56, &qword_1000248B8);
  v62 = v84;
  *(_QWORD *)a2 = v59;
  *(_QWORD *)(a2 + 8) = v62;
  *(_BYTE *)(a2 + 16) = v60 & 1;
  *(_QWORD *)(a2 + 24) = v58;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 1;
  *(_BYTE *)(a2 + 48) = 0;
  v64 = v82;
  v63 = v83;
  *(_QWORD *)(a2 + 56) = v82;
  *(_QWORD *)(a2 + 64) = v63;
  v65 = sub_1000039D8(&qword_1000248C0);
  sub_100003D6C(v56, a2 + *(int *)(v65 + 48), &qword_1000248B8);
  sub_100003A68(v59, v62, v61);
  swift_bridgeObjectRetain(v58);
  swift_retain(KeyPath);
  swift_retain(v64);
  swift_retain(v63);
  sub_100003DB0(v54, &qword_1000248B8);
  sub_100003DB0(v56, &qword_1000248B8);
  sub_100003B0C(v59, v62, v61);
  swift_release(v63);
  swift_release(v64);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v58);
}

uint64_t sub_10000395C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100003974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _OWORD v13[3];
  uint64_t v14;

  v10 = *(_OWORD *)(v8 + 16);
  v13[0] = *(_OWORD *)v8;
  v13[1] = v10;
  v13[2] = *(_OWORD *)(v8 + 32);
  v14 = *(_QWORD *)(v8 + 48);
  *(_QWORD *)a8 = static HorizontalAlignment.leading.getter(a1, a2, a3, a4, a5, a6, a7);
  *(_QWORD *)(a8 + 8) = 0;
  *(_BYTE *)(a8 + 16) = 0;
  v11 = sub_1000039D8(&qword_100024860);
  return sub_100002FE8(v13, a8 + *(int *)(v11 + 44));
}

uint64_t sub_1000039D8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

double sub_100003A18(uint64_t a1)
{
  double result;

  *(_WORD *)(a1 + 144) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_100003A38(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100003A68(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

uint64_t sub_100003A68(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100003A78(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))
{
  __int16 v4;

  v4 = *(_WORD *)(a1 + 144);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), v4);
  return a1;
}

uint64_t sub_100003ADC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100003B0C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_100003B0C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100003B1C()
{
  unint64_t result;

  result = qword_100024890;
  if (!qword_100024890)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100024890);
  }
  return result;
}

uint64_t sub_100003B6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100003B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100003BBC(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100003BE4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100003C0C()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100003C2C()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100003C4C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for Image.Scale(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.imageScale.setter(v3);
}

uint64_t sub_100003CCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100003CF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100003D1C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100003D44(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100003D6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000039D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100003DB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000039D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003DEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000039D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100003E34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000248C8;
  if (!qword_1000248C8)
  {
    v1 = sub_100003E80(&qword_1000248D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000248C8);
  }
  return result;
}

uint64_t sub_100003E80(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003EC4(unint64_t a1, uint64_t a2, int *a3)
{
  int v5;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v35 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v35 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_10000404C(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = *(void **)(a2 + 16);
    v10 = *(void **)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)(a1 + 24) = v10;
    v11 = a3[7];
    v12 = a1 + v11;
    v13 = a2 + v11;
    v14 = type metadata accessor for Icon(0);
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v9;
    v17 = v10;
    v15(v12, v13, v14);
    v18 = a3[9];
    *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
    v19 = a1 + v18;
    v20 = a2 + v18;
    v21 = *(void **)(a2 + v18);
    *(_QWORD *)(a1 + v18) = v21;
    v22 = type metadata accessor for MessagesContext(0);
    v23 = *(int *)(v22 + 20);
    v24 = (_QWORD *)(v19 + v23);
    v25 = v20 + v23;
    v26 = *(_QWORD *)(v20 + v23 + 8);
    *v24 = *(_QWORD *)(v20 + v23);
    v24[1] = v26;
    v27 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
    v37 = v25 + v27;
    v38 = (char *)v24 + v27;
    v28 = type metadata accessor for UUID(0);
    v29 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
    v30 = v21;
    swift_bridgeObjectRetain(v26);
    v29(v38, v37, v28);
    v31 = *(int *)(v22 + 24);
    *(_QWORD *)(swift_unknownObjectWeakCopyInit(v19 + v31, v20 + v31) + 8) = *(_QWORD *)(v20 + v31 + 8);
    v32 = a3[10];
    v33 = (_QWORD *)(a1 + v32);
    v34 = (_QWORD *)(a2 + v32);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
  }
  swift_retain(v35);
  return a1;
}

uint64_t sub_10000404C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_100004058(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  sub_100004138(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));

  v4 = a1 + a2[7];
  v5 = type metadata accessor for Icon(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (id *)(a1 + a2[9]);

  v7 = type metadata accessor for MessagesContext(0);
  v8 = (char *)v6 + *(int *)(v7 + 20);
  swift_bridgeObjectRelease(*((_QWORD *)v8 + 1));
  v9 = &v8[*(int *)(type metadata accessor for MessagesMetadata(0) + 20)];
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_unknownObjectWeakDestroy((char *)v6 + *(int *)(v7 + 24));
  return swift_release(*(_QWORD *)(a1 + a2[10] + 8));
}

uint64_t sub_100004138(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

uint64_t sub_100004144(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v37;
  int *v38;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000404C(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(void **)(a2 + 16);
  v9 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for Icon(0);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v8;
  v16 = v9;
  v14(v11, v12, v13);
  v38 = a3;
  v17 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = *(void **)(a2 + v17);
  *(_QWORD *)(a1 + v17) = v20;
  v21 = type metadata accessor for MessagesContext(0);
  v22 = *(int *)(v21 + 20);
  v23 = (_QWORD *)(v18 + v22);
  v24 = v19 + v22;
  v25 = *(_QWORD *)(v19 + v22 + 8);
  *v23 = *(_QWORD *)(v19 + v22);
  v23[1] = v25;
  v26 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v37 = (char *)v23 + v26;
  v27 = v24 + v26;
  v28 = type metadata accessor for UUID(0);
  v29 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
  v30 = v20;
  swift_bridgeObjectRetain(v25);
  v29(v37, v27, v28);
  v31 = *(int *)(v21 + 24);
  *(_QWORD *)(swift_unknownObjectWeakCopyInit(v18 + v31, v19 + v31) + 8) = *(_QWORD *)(v19 + v31 + 8);
  v32 = v38[10];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_retain(v35);
  return a1;
}

uint64_t sub_1000042B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_10000404C(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100004138(v8, v9);
  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for Icon(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v20 = a3[9];
  v21 = (void **)(a1 + v20);
  v22 = a2 + v20;
  v23 = *(void **)(a2 + v20);
  v24 = *v21;
  *v21 = v23;
  v25 = v23;

  v26 = type metadata accessor for MessagesContext(0);
  v27 = *(int *)(v26 + 20);
  v28 = (void **)((char *)v21 + v27);
  v29 = v22 + v27;
  *v28 = *(_QWORD *)(v22 + v27);
  v30 = *(_QWORD *)(v22 + v27 + 8);
  v31 = *(uint64_t *)((char *)v21 + v27 + 8);
  v28[1] = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  v32 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v33 = (char *)v28 + v32;
  v34 = v29 + v32;
  v35 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
  v36 = *(int *)(v26 + 24);
  *(_QWORD *)(swift_unknownObjectWeakCopyAssign((char *)v21 + v36, v22 + v36) + 8) = *(_QWORD *)(v22 + v36 + 8);
  v37 = a3[10];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (_QWORD *)(a2 + v37);
  *v38 = *v39;
  v40 = v39[1];
  v41 = v38[1];
  v38[1] = v40;
  swift_retain(v40);
  swift_release(v41);
  return a1;
}

uint64_t sub_100004454(uint64_t a1, uint64_t a2, int *a3)
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for Icon(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v13 = type metadata accessor for MessagesContext(0);
  v14 = *(int *)(v13 + 20);
  v15 = v11 + v14;
  v16 = v12 + v14;
  *(_OWORD *)(v11 + v14) = *(_OWORD *)(v12 + v14);
  v17 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v18 = v15 + v17;
  v19 = v16 + v17;
  v20 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = *(int *)(v13 + 24);
  *(_QWORD *)(swift_unknownObjectWeakTakeInit(v11 + v21, v12 + v21) + 8) = *(_QWORD *)(v12 + v21 + 8);
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_100004570(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_100004138(v8, v9);
  v10 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];

  v11 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = a2[3];

  v12 = a3[7];
  v13 = a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = type metadata accessor for Icon(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[9];
  *(_BYTE *)(a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t)a2 + v16;
  v19 = *(uint64_t *)((char *)a2 + v16);
  v20 = *(void **)(a1 + v16);
  *v17 = v19;

  v21 = type metadata accessor for MessagesContext(0);
  v22 = *(int *)(v21 + 20);
  v23 = (_QWORD *)((char *)v17 + v22);
  v24 = v18 + v22;
  v25 = *(_QWORD *)(v18 + v22 + 8);
  v26 = *(_QWORD *)((char *)v17 + v22 + 8);
  *v23 = *(_QWORD *)(v18 + v22);
  v23[1] = v25;
  swift_bridgeObjectRelease(v26);
  v27 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v28 = (char *)v23 + v27;
  v29 = v24 + v27;
  v30 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(v28, v29, v30);
  v31 = *(int *)(v21 + 24);
  *(_QWORD *)(swift_unknownObjectWeakTakeAssign((char *)v17 + v31, v18 + v31) + 8) = *(_QWORD *)(v18 + v31 + 8);
  v32 = a3[10];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  v37 = v33[1];
  *v33 = v36;
  v33[1] = v35;
  swift_release(v37);
  return a1;
}

uint64_t sub_1000046D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000046DC);
}

uint64_t sub_1000046DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for Icon(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 28);
    }
    else
    {
      v10 = type metadata accessor for MessagesContext(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 36);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_10000477C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004788);
}

uint64_t sub_100004788(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for Icon(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 28);
    }
    else
    {
      v10 = type metadata accessor for MessagesContext(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 36);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for BalloonView(uint64_t a1)
{
  uint64_t result;

  result = qword_100024930;
  if (!qword_100024930)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BalloonView);
  return result;
}

uint64_t sub_100004860(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[7];

  v5[0] = "\t";
  v5[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v5[2] = &unk_10001B090;
  result = type metadata accessor for Icon(319);
  if (v3 <= 0x3F)
  {
    v5[3] = *(_QWORD *)(result - 8) + 64;
    v5[4] = &unk_10001B0A8;
    result = type metadata accessor for MessagesContext(319);
    if (v4 <= 0x3F)
    {
      v5[5] = *(_QWORD *)(result - 8) + 64;
      v5[6] = &unk_10001B0C0;
      swift_initStructMetadata(a1, 256, 7, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100004918(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001CBF4, 1);
}

__n128 sub_100004928@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_100003D6C(v16, a9, &qword_100024868);
  v35 = a9 + *(int *)(sub_1000039D8(&qword_100024870) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_100004AE4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  double v34;
  double v36;
  double v37;
  double v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned int v46;
  unsigned int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _OWORD v52[7];

  v20 = a19;
  v21 = a18;
  v22 = a17;
  v24 = a14;
  v23 = a15;
  v25 = a12;
  v26 = a10;
  v27 = a2 & 1;
  v28 = a1;
  if ((_DWORD)v27)
    v28 = -INFINITY;
  v29 = a4 & 1;
  v30 = a3;
  if ((_DWORD)v29)
    v30 = v28;
  v31 = a6 & 1;
  v32 = a8 & 1;
  v33 = a13 & 1;
  v34 = a5;
  if ((a6 & 1) != 0)
    v34 = v30;
  if (v28 > v30 || v30 > v34)
    goto LABEL_22;
  v36 = a7;
  if ((a8 & 1) != 0)
    v36 = -INFINITY;
  v37 = a10;
  if ((a11 & 1) != 0)
    v37 = v36;
  v38 = a12;
  if ((a13 & 1) != 0)
    v38 = v37;
  if (v36 > v37 || v37 > v38)
  {
LABEL_22:
    v50 = a7;
    v51 = a5;
    v48 = a1;
    v49 = a3;
    v47 = v27;
    v46 = v29;
    v40 = static os_log_type_t.fault.getter();
    v41 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v33 = a13 & 1;
    v29 = v46;
    v24 = a14;
    v23 = a15;
    v27 = v47;
    v26 = a10;
    v25 = a12;
    a1 = v48;
    a3 = v49;
    a7 = v50;
    a5 = v51;
    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v52, *(_QWORD *)&a1, v27, *(_QWORD *)&a3, v29, *(_QWORD *)&a5, v31, *(_QWORD *)&a7, v32, *(_QWORD *)&v26, a11 & 1, *(_QWORD *)&v25, v33, v24, v23);
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  v42 = v52[5];
  *(_OWORD *)(a9 + 96) = v52[4];
  *(_OWORD *)(a9 + 112) = v42;
  *(_OWORD *)(a9 + 128) = v52[6];
  v43 = v52[1];
  *(_OWORD *)(a9 + 32) = v52[0];
  *(_OWORD *)(a9 + 48) = v43;
  v44 = v52[3];
  *(_OWORD *)(a9 + 64) = v52[2];
  *(_OWORD *)(a9 + 80) = v44;
  sub_100003A68(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain(v20);
}

_QWORD *sub_100004CC4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  __int128 *v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _OWORD v46[7];
  __int128 v47;
  char v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  _BYTE v52[32];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v44 = a5;
    v45 = a7;
    v43 = a3;
    v42 = a1;
    v41 = v20;
    v32 = static os_log_type_t.fault.getter();
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v41;
    v19 = a10;
    a1 = v42;
    a3 = v43;
    v18 = a12;
    a5 = v44;
    a7 = v45;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v46, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[1];
  v49 = *v15;
  v50 = v34;
  sub_100009870((uint64_t)&v49, (uint64_t)v52);
  v36 = v15[1];
  v47 = v15[2];
  v35 = v47;
  *(_OWORD *)a9 = *v15;
  *(_OWORD *)(a9 + 16) = v36;
  *(_OWORD *)(a9 + 32) = v35;
  *(_OWORD *)(a9 + 152) = v46[6];
  v37 = v46[4];
  *(_OWORD *)(a9 + 136) = v46[5];
  *(_OWORD *)(a9 + 120) = v37;
  v38 = v46[2];
  *(_OWORD *)(a9 + 104) = v46[3];
  v39 = v46[1];
  *(_OWORD *)(a9 + 56) = v46[0];
  v51 = *((_QWORD *)&v50 + 1);
  v48 = *((_BYTE *)v15 + 48);
  *(_BYTE *)(a9 + 48) = v48;
  *(_OWORD *)(a9 + 72) = v39;
  *(_OWORD *)(a9 + 88) = v38;
  sub_1000098AC((uint64_t)v52);
  sub_1000098DC(&v51);
  return sub_100009904(&v47);
}

__n128 sub_100004EA8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v30;
  double v31;
  double v32;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _OWORD v45[7];

  v18 = a17;
  v19 = a15;
  v20 = a12;
  v21 = a10;
  v22 = a2 & 1;
  v23 = a1;
  if ((_DWORD)v22)
    v23 = -INFINITY;
  v24 = a4 & 1;
  v25 = a3;
  if ((_DWORD)v24)
    v25 = v23;
  v26 = a6 & 1;
  v27 = a8 & 1;
  v28 = a5;
  if ((a6 & 1) != 0)
    v28 = v25;
  if (v23 > v25 || v25 > v28)
    goto LABEL_22;
  v30 = a7;
  if ((a8 & 1) != 0)
    v30 = -INFINITY;
  v31 = a10;
  if ((a11 & 1) != 0)
    v31 = v30;
  v32 = a12;
  if ((a13 & 1) != 0)
    v32 = v31;
  if (v30 > v31 || v31 > v32)
  {
LABEL_22:
    v43 = a5;
    v44 = a7;
    v41 = a1;
    v42 = a3;
    v39 = v24;
    v40 = v22;
    v34 = static os_log_type_t.fault.getter();
    v35 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v24 = v39;
    v22 = v40;
    v19 = a15;
    v21 = a10;
    v20 = a12;
    a1 = v41;
    a3 = v42;
    a5 = v43;
    v18 = a17;
    a7 = v44;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v45, *(_QWORD *)&a1, v22, *(_QWORD *)&a3, v24, *(_QWORD *)&a5, v26, *(_QWORD *)&a7, v27, *(_QWORD *)&v21, a11 & 1, *(_QWORD *)&v20, a13 & 1, a14, v19);
  *(_QWORD *)a9 = a16;
  *(_BYTE *)(a9 + 8) = v18 & 1;
  v36 = v45[5];
  *(_OWORD *)(a9 + 80) = v45[4];
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v45[6];
  v37 = v45[1];
  *(_OWORD *)(a9 + 16) = v45[0];
  *(_OWORD *)(a9 + 32) = v37;
  result = (__n128)v45[3];
  *(_OWORD *)(a9 + 48) = v45[2];
  *(__n128 *)(a9 + 64) = result;
  return result;
}

uint64_t sub_100005050()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;

  v1 = *(void **)(v0 + 24);
  v2 = (uint64_t)v1;
  if (!v1)
  {
    v5 = type metadata accessor for BalloonView(0);
    v6 = *(_QWORD *)(v0 + *(int *)(v5 + 40) + 8);
    KeyPath = swift_getKeyPath(&unk_10001B170);
    v8 = swift_getKeyPath(&unk_10001B198);
    static Published.subscript.getter(&v12, v6, KeyPath, v8);
    swift_release(KeyPath);
    swift_release(v8);
    if (v13 != 255)
    {
      v2 = (uint64_t)v12;
      if ((v13 & 1) == 0)
        goto LABEL_2;
      sub_1000095E0(v12, v13);
    }
    v9 = swift_getKeyPath(&unk_10001B170);
    v10 = swift_getKeyPath(&unk_10001B198);
    static Published.subscript.getter(&v12, v6, v9, v10);
    swift_release(v9);
    swift_release(v10);
    v11 = v13;
    if (v13 != 255 && (sub_1000095E0(v12, v13), (v11 & 1) != 0))
    {
      v2 = 3;
    }
    else if (sub_10000519C())
    {
      v2 = 2;
    }
    else
    {
      v2 = ~*(unsigned __int8 *)(v0 + *(int *)(v5 + 32)) & 1;
    }
  }
LABEL_2:
  v3 = v1;
  return v2;
}

BOOL sub_10000519C()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  uint64_t (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  double v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;

  v1 = v0;
  v2 = type metadata accessor for BalloonView(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000039D8(&qword_100024AC8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v33 - v9;
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v34 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v33 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v33 - v19;
  v21 = Date.init()(v18);
  ATQuestion.expirationDate.getter(v21);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v23 = v22(v10, 1, v11);
  sub_100003DB0((uint64_t)v10, &qword_100024AC8);
  sub_100008FAC(v1, (uint64_t)v4, type metadata accessor for BalloonView);
  v24 = *(uint64_t (**)(char *, char *, uint64_t))(v12 + 16);
  v25 = v24(v17, v20, v11);
  if (v23 == 1)
  {
    v26 = 0;
  }
  else
  {
    ATQuestion.expirationDate.getter(v25);
    if (v22(v8, 1, v11))
    {
      v27 = sub_100003DB0((uint64_t)v8, &qword_100024AC8);
      v28 = 0.0;
    }
    else
    {
      v29 = v34;
      v24(v34, v8, v11);
      v30 = sub_100003DB0((uint64_t)v8, &qword_100024AC8);
      v28 = Date.timeIntervalSinceReferenceDate.getter(v30);
      v27 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v29, v11);
    }
    v26 = v28 < Date.timeIntervalSinceReferenceDate.getter(v27);
  }
  v31 = *(void (**)(char *, uint64_t))(v12 + 8);
  v31(v17, v11);
  v31(v20, v11);
  sub_100009008((uint64_t)v4, type metadata accessor for BalloonView);
  return v26;
}

uint64_t sub_10000540C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, _QWORD, uint64_t);
  uint64_t v54;
  uint64_t result;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;

  v2 = v1;
  v79 = a1;
  v77 = sub_1000039D8(&qword_100024980);
  v3 = __chkstk_darwin(v77);
  v5 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v75 = (char *)&v72 - v6;
  v7 = type metadata accessor for DynamicTypeSize(0);
  v80 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v81 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v72 - v10;
  v78 = sub_1000039D8(&qword_100024988);
  v12 = __chkstk_darwin(v78);
  v74 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v76 = (uint64_t)&v72 - v14;
  v15 = sub_1000039D8(&qword_100024990);
  __chkstk_darwin(v15);
  v17 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1000039D8(&qword_100024998);
  __chkstk_darwin(v18);
  v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000039D8(&qword_1000249A0);
  v22 = __chkstk_darwin(v21);
  v24 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v17 = static HorizontalAlignment.leading.getter(v22, v25, v26, v27, v28, v29, v30);
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 0;
  v31 = sub_1000039D8(&qword_1000249A8);
  v32 = sub_1000058D0(v2, &v17[*(int *)(v31 + 44)]);
  LOBYTE(v2) = static Edge.Set.vertical.getter(v32);
  v33 = EdgeInsets.init(_all:)(16.0);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_100003D6C((uint64_t)v17, (uint64_t)v20, &qword_100024990);
  v40 = &v20[*(int *)(v18 + 36)];
  *v40 = v2;
  *((double *)v40 + 1) = v33;
  *((_QWORD *)v40 + 2) = v35;
  *((_QWORD *)v40 + 3) = v37;
  *((_QWORD *)v40 + 4) = v39;
  v40[40] = 0;
  v41 = sub_100003DB0((uint64_t)v17, &qword_100024990);
  LOBYTE(v17) = static Edge.Set.horizontal.getter(v41);
  v42 = EdgeInsets.init(_all:)(16.0);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  sub_100003D6C((uint64_t)v20, (uint64_t)v24, &qword_100024998);
  v73 = v21;
  v49 = *(int *)(v21 + 36);
  v50 = v81;
  v51 = &v24[v49];
  *v51 = (char)v17;
  *((double *)v51 + 1) = v42;
  *((_QWORD *)v51 + 2) = v44;
  *((_QWORD *)v51 + 3) = v46;
  *((_QWORD *)v51 + 4) = v48;
  v51[40] = 0;
  sub_100003DB0((uint64_t)v20, &qword_100024998);
  v52 = v80;
  v53 = *(void (**)(char *, _QWORD, uint64_t))(v80 + 104);
  v53(v11, enum case for DynamicTypeSize.small(_:), v7);
  v53(v50, enum case for DynamicTypeSize.accessibility3(_:), v7);
  v54 = sub_10000893C(&qword_1000249B0, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
  result = dispatch thunk of static Comparable.<= infix(_:_:)(v11, v50, v7, v54);
  if ((result & 1) != 0)
  {
    v56 = v77;
    v57 = v75;
    v58 = &v75[*(int *)(v77 + 48)];
    v72 = v24;
    v59 = v52;
    v60 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v60(v75, v11, v7);
    v60(v58, v50, v7);
    v61 = &v5[*(int *)(v56 + 48)];
    v62 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
    v62(v5, v57, v7);
    v62(v61, v58, v7);
    v63 = (uint64_t)v74;
    v60(v74, v5, v7);
    v64 = *(void (**)(char *, uint64_t))(v59 + 8);
    v64(v61, v7);
    v65 = &v5[*(int *)(v56 + 48)];
    v60(v5, v57, v7);
    v60(v65, v58, v7);
    v66 = v78;
    v60((char *)(v63 + *(int *)(v78 + 36)), v65, v7);
    v64(v5, v7);
    v67 = v76;
    sub_100003DEC(v63, v76, &qword_100024988);
    v68 = sub_1000087B0();
    v69 = sub_100008AB0(&qword_1000249D0, &qword_100024988, (uint64_t)&protocol conformance descriptor for ClosedRange<A>);
    v70 = v68;
    v71 = (uint64_t)v72;
    View.dynamicTypeSize<A>(_:)(v67, v73, v66, v70, v69);
    sub_100003DB0(v67, &qword_100024988);
    return sub_100003DB0(v71, &qword_1000249A0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000058D0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  char v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t ObjCClassFromMetadata;
  void *v77;
  id v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;
  id v82;
  Swift::String v83;
  Swift::String v84;
  Swift::String v85;
  uint64_t v86;
  Swift::String *v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  Swift::String *v96;
  unint64_t v97;
  uint64_t v98;
  void *object;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  void *v111;
  __int16 v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  void *v118;
  __int16 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  Swift::String *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _OWORD *v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  Swift::String *v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char v138;
  __int128 v139;
  _OWORD *v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  Swift::String *v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  Swift::String v151;
  Swift::String v152;
  Swift::String v153;
  id v154;
  Swift::String v155;
  Swift::String v156;
  Swift::String v157;
  uint64_t v158;
  uint64_t v159;
  Swift::String *v160;
  unint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  char v166;
  __int128 v167;
  _OWORD *v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  void *v172;
  uint64_t v173;
  Swift::String *v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char v181;
  _QWORD *v182;
  uint64_t v183;
  uint64_t v184;
  int *v185;
  char *v186;
  uint64_t v187;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  Swift::String *v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  _OWORD *v200;
  char *v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  int v210;
  uint64_t v211;
  int v212;
  uint64_t v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  Swift::String *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  char *v224;
  _OWORD v225[28];
  __int128 v226;
  _OWORD v227[27];
  uint64_t v228;
  unsigned __int8 v229;
  uint64_t v230;
  unsigned __int8 v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char v235;
  uint64_t v236;
  char v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unsigned __int8 v241;
  uint64_t v242;
  unsigned __int8 v243;
  char *v244;
  uint64_t v245;
  uint64_t v246[52];
  _BYTE v247[432];
  _BYTE v248[417];
  Swift::String v249;
  Swift::String v250;
  Swift::String v251;
  Swift::String v252;

  v193 = sub_1000039D8(&qword_1000249D8);
  __chkstk_darwin(v193);
  v190 = (uint64_t *)((char *)&v189 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v219 = sub_1000039D8(&qword_1000249E0);
  __chkstk_darwin(v219);
  v220 = (Swift::String *)((char *)&v189 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v198 = sub_1000039D8(&qword_1000249E8);
  __chkstk_darwin(v198);
  v200 = (_OWORD *)((char *)&v189 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v191 = sub_1000039D8(&qword_1000249F0);
  __chkstk_darwin(v191);
  v192 = (Swift::String *)((char *)&v189 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v199 = sub_1000039D8(&qword_1000249F8);
  __chkstk_darwin(v199);
  v194 = (char *)&v189 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v218 = sub_1000039D8(&qword_100024A00);
  __chkstk_darwin(v218);
  v201 = (char *)&v189 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000039D8(&qword_100024A08);
  v11 = __chkstk_darwin(v10);
  v217 = (uint64_t)&v189 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v189 - v13;
  v221 = sub_1000039D8(&qword_100024A10);
  v15 = __chkstk_darwin(v221);
  v17 = (char *)&v189 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v189 - v18;
  v207 = sub_1000039D8(&qword_100024A18);
  __chkstk_darwin(v207);
  v21 = (char *)&v189 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v204 = sub_1000039D8(&qword_100024A20);
  __chkstk_darwin(v204);
  v203 = (char *)&v189 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for Divider(0);
  v205 = *(_QWORD *)(v23 - 8);
  v206 = v23;
  v24 = __chkstk_darwin(v23);
  v26 = (char *)&v189 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v28 = (char *)&v189 - v27;
  v29 = sub_1000039D8(&qword_100024A28);
  v30 = __chkstk_darwin(v29);
  v216 = (uint64_t)&v189 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v223 = (uint64_t)&v189 - v33;
  v215 = static VerticalAlignment.top.getter(v32);
  sub_100006A80(a1, (uint64_t)v246);
  v247[424] = 1;
  memcpy(&v247[7], v246, 0x19AuLL);
  v214 = 1;
  v34 = memcpy(v248, v247, sizeof(v248));
  v35 = static Alignment.center.getter(v34);
  _FrameLayout.init(width:height:alignment:)(&v228, 0, 1, 0x4010000000000000, 0, v35, v36);
  v213 = v228;
  v212 = v229;
  v211 = v230;
  v210 = v231;
  v208 = v233;
  v209 = v232;
  v37 = (char *)sub_100005050();
  v222 = a2;
  v224 = v14;
  if ((unint64_t)(v37 - 2) < 2 || !v37)
    goto LABEL_6;
  if (v37 != (char *)1)
  {
    sub_100008E14(v37);
LABEL_6:
    v48 = Divider.init()();
    v49 = static Alignment.center.getter(v48);
    _FrameLayout.init(width:height:alignment:)(&v234, 0, 1, 0x4000000000000000, 0, v49, v50);
    v51 = v234;
    v52 = v235;
    v202 = a1;
    v53 = v236;
    v54 = v237;
    v195 = v239;
    v196 = v238;
    v55 = v28;
    v197 = v28;
    v56 = (uint64_t)v21;
    v57 = v205;
    v58 = v206;
    v59 = *(void (**)(char *, char *, uint64_t))(v205 + 16);
    v59(v26, v55, v206);
    LOBYTE(v226) = 1;
    LOBYTE(v225[0]) = v52;
    LOBYTE(v240) = v54;
    v60 = (uint64_t)v203;
    v59(v203, v26, v58);
    v61 = v60 + *(int *)(sub_1000039D8(&qword_100024A98) + 48);
    v62 = v226;
    v63 = v225[0];
    v64 = v240;
    *(_QWORD *)v61 = 0;
    *(_BYTE *)(v61 + 8) = v62;
    *(_QWORD *)(v61 + 16) = v51;
    *(_BYTE *)(v61 + 24) = v63;
    *(_QWORD *)(v61 + 32) = v53;
    *(_BYTE *)(v61 + 40) = v64;
    v65 = v195;
    *(_QWORD *)(v61 + 48) = v196;
    *(_QWORD *)(v61 + 56) = v65;
    v66 = *(void (**)(char *, uint64_t))(v57 + 8);
    v66(v26, v58);
    sub_100003D6C(v60, v56, &qword_100024A20);
    swift_storeEnumTagMultiPayload(v56, v207, 0);
    v67 = sub_100008AB0(&qword_100024A30, &qword_100024A20, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v68 = sub_1000088A0();
    v69 = v67;
    a1 = v202;
    _ConditionalContent<>.init(storage:)(v56, v204, v221, v69, v68);
    sub_100003DB0(v60, &qword_100024A20);
    v70 = v58;
    v40 = v222;
    v47 = ((uint64_t (*)(char *, uint64_t))v66)(v197, v70);
    goto LABEL_7;
  }
  Divider.init()();
  v38 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray5Color");
  v203 = (char *)Color.init(uiColor:)(v38);
  v39 = (uint64_t)v19;
  v40 = a2;
  v41 = static Edge.Set.all.getter();
  v43 = v205;
  v42 = v206;
  (*(void (**)(char *, char *, uint64_t))(v205 + 16))(v17, v28, v206);
  v44 = &v17[*(int *)(v221 + 36)];
  *(_QWORD *)v44 = v203;
  v44[8] = v41;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v42);
  sub_100003DEC((uint64_t)v17, v39, &qword_100024A10);
  sub_100003D6C(v39, (uint64_t)v21, &qword_100024A10);
  swift_storeEnumTagMultiPayload(v21, v207, 1);
  v45 = sub_100008AB0(&qword_100024A30, &qword_100024A20, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v46 = sub_1000088A0();
  _ConditionalContent<>.init(storage:)(v21, v204, v221, v45, v46);
  v47 = sub_100003DB0(v39, &qword_100024A10);
LABEL_7:
  v221 = (uint64_t)v40 + 448;
  v71 = static Alignment.center.getter(v47);
  _FrameLayout.init(width:height:alignment:)(&v240, 0, 1, 0x4010000000000000, 0, v71, v72);
  v207 = v240;
  LODWORD(v206) = v241;
  v205 = v242;
  LODWORD(v204) = v243;
  v202 = v245;
  v203 = v244;
  v73 = sub_100005050();
  v74 = (void *)v73;
  switch(v73)
  {
    case 0:
      v75 = type metadata accessor for MessageParser();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v75);
      v77 = (void *)objc_opt_self(NSBundle);
      v78 = objc_msgSend(v77, "bundleForClass:", ObjCClassFromMetadata);
      v79._countAndFlagsBits = 0xD000000000000010;
      v79._object = (void *)0x800000010001C150;
      v249._object = (void *)0x800000010001C150;
      v80._countAndFlagsBits = 0;
      v80._object = (void *)0xE000000000000000;
      v249._countAndFlagsBits = 0xD000000000000010;
      v81 = NSLocalizedString(_:tableName:bundle:value:comment:)(v79, (Swift::String_optional)0, (NSBundle)v78, v80, v249);

      v82 = objc_msgSend(v77, "bundleForClass:", ObjCClassFromMetadata);
      v83._countAndFlagsBits = 0xD000000000000013;
      v83._object = (void *)0x800000010001C170;
      v250._object = (void *)0x800000010001C170;
      v84._countAndFlagsBits = 0;
      v84._object = (void *)0xE000000000000000;
      v250._countAndFlagsBits = 0xD000000000000013;
      v85 = NSLocalizedString(_:tableName:bundle:value:comment:)(v83, (Swift::String_optional)0, (NSBundle)v82, v84, v250);

      v86 = v191;
      v87 = v192;
      *v192 = v81;
      v87[1] = v85;
      v87[2]._object = 0;
      v87[3]._countAndFlagsBits = 0;
      v87[2]._countAndFlagsBits = 0;
      swift_storeEnumTagMultiPayload(v87, v86, 0);
      v88 = sub_100008A6C();
      v89 = sub_100008AB0(&qword_100024A70, &qword_1000249D8, (uint64_t)&protocol conformance descriptor for HStack<A>);
      swift_bridgeObjectRetain(v81._object);
      swift_bridgeObjectRetain(v85._object);
      v90 = (uint64_t)v194;
      _ConditionalContent<>.init(storage:)(v87, &type metadata for StatusView, v193, v88, v89);
      v91 = v200;
      sub_100003D6C(v90, (uint64_t)v200, &qword_1000249F8);
      swift_storeEnumTagMultiPayload(v91, v198, 0);
      v92 = sub_1000039D8(&qword_100024A80);
      v93 = sub_1000089E8();
      v94 = sub_100008AF0();
      v95 = (uint64_t)v201;
      _ConditionalContent<>.init(storage:)(v91, v199, v92, v93, v94);
      sub_100003DB0(v90, &qword_1000249F8);
      v96 = v220;
      sub_100003D6C(v95, (uint64_t)v220, &qword_100024A00);
      swift_storeEnumTagMultiPayload(v96, v219, 0);
      v97 = sub_10000897C();
      v98 = (uint64_t)v224;
      _ConditionalContent<>.init(storage:)(v96, v218, &type metadata for StatusView, v97, v88);
      sub_100003DB0(v95, &qword_100024A00);
      swift_bridgeObjectRelease(0);
      swift_bridgeObjectRelease(v85._object);
      object = v81._object;
      goto LABEL_33;
    case 1:
      v122 = static VerticalAlignment.center.getter(v73);
      v123 = (uint64_t)v190;
      *v190 = v122;
      *(_QWORD *)(v123 + 8) = 0x4014000000000000;
      *(_BYTE *)(v123 + 16) = 0;
      v124 = sub_1000039D8(&qword_100024A90);
      sub_1000071C4(a1, v123 + *(int *)(v124 + 44));
      v125 = v192;
      sub_100003D6C(v123, (uint64_t)v192, &qword_1000249D8);
      swift_storeEnumTagMultiPayload(v125, v191, 1);
      v126 = sub_100008A6C();
      v127 = sub_100008AB0(&qword_100024A70, &qword_1000249D8, (uint64_t)&protocol conformance descriptor for HStack<A>);
      v128 = (uint64_t)v194;
      _ConditionalContent<>.init(storage:)(v125, &type metadata for StatusView, v193, v126, v127);
      v129 = v200;
      sub_100003D6C(v128, (uint64_t)v200, &qword_1000249F8);
      swift_storeEnumTagMultiPayload(v129, v198, 0);
      v130 = sub_1000039D8(&qword_100024A80);
      v131 = sub_1000089E8();
      v132 = sub_100008AF0();
      v133 = (uint64_t)v201;
      _ConditionalContent<>.init(storage:)(v129, v199, v130, v131, v132);
      sub_100003DB0(v128, &qword_1000249F8);
      v134 = v220;
      sub_100003D6C(v133, (uint64_t)v220, &qword_100024A00);
      swift_storeEnumTagMultiPayload(v134, v219, 0);
      v135 = sub_10000897C();
      v98 = (uint64_t)v224;
      _ConditionalContent<>.init(storage:)(v134, v218, &type metadata for StatusView, v135, v126);
      sub_100003DB0(v133, &qword_100024A00);
      sub_100003DB0(v123, &qword_1000249D8);
      goto LABEL_34;
    case 2:
      v225[0] = xmmword_10001B030;
      v225[1] = xmmword_10001B030;
      memset(&v225[2], 0, 24);
      BYTE8(v225[3]) = 1;
      v136 = sub_100008A6C();
      _ConditionalContent<>.init(storage:)(v225, &type metadata for StatusView, &type metadata for StatusView, v136, v136);
      v137 = *(_QWORD *)&v227[2];
      v138 = BYTE8(v227[2]);
      v139 = v227[0];
      v140 = v200;
      *v200 = v226;
      v140[1] = v139;
      v140[2] = v227[1];
      *((_QWORD *)v140 + 6) = v137;
      *((_BYTE *)v140 + 56) = v138;
      swift_storeEnumTagMultiPayload(v140, v198, 1);
      v141 = sub_1000039D8(&qword_100024A80);
      v142 = sub_1000089E8();
      v143 = sub_100008AF0();
      v144 = (uint64_t)v201;
      _ConditionalContent<>.init(storage:)(v140, v199, v141, v142, v143);
      v145 = v220;
      sub_100003D6C(v144, (uint64_t)v220, &qword_100024A00);
      swift_storeEnumTagMultiPayload(v145, v219, 0);
      v146 = sub_10000897C();
      v98 = (uint64_t)v224;
      _ConditionalContent<>.init(storage:)(v145, v218, &type metadata for StatusView, v146, v136);
      sub_100003DB0(v144, &qword_100024A00);
      goto LABEL_34;
    case 3:
      v147 = type metadata accessor for MessageParser();
      v148 = swift_getObjCClassFromMetadata(v147);
      v149 = (void *)objc_opt_self(NSBundle);
      v150 = objc_msgSend(v149, "bundleForClass:", v148);
      v151._countAndFlagsBits = 0xD000000000000018;
      v151._object = (void *)0x800000010001C0B0;
      v251._object = (void *)0x800000010001C0B0;
      v152._countAndFlagsBits = 0;
      v152._object = (void *)0xE000000000000000;
      v251._countAndFlagsBits = 0xD000000000000018;
      v153 = NSLocalizedString(_:tableName:bundle:value:comment:)(v151, (Swift::String_optional)0, (NSBundle)v150, v152, v251);

      v154 = objc_msgSend(v149, "bundleForClass:", v148);
      v155._object = (void *)0x800000010001C0D0;
      v252._object = (void *)0x800000010001C0D0;
      v155._countAndFlagsBits = 0xD00000000000001BLL;
      v156._countAndFlagsBits = 0;
      v156._object = (void *)0xE000000000000000;
      v252._countAndFlagsBits = 0xD00000000000001BLL;
      v157 = NSLocalizedString(_:tableName:bundle:value:comment:)(v155, (Swift::String_optional)0, (NSBundle)v154, v156, v252);

      v158 = static Color.red.getter();
      v159 = v219;
      v160 = v220;
      *v220 = v153;
      v160[1] = v157;
      v160[2]._countAndFlagsBits = 0xD00000000000001BLL;
      v160[2]._object = (void *)0x800000010001C0F0;
      v160[3]._countAndFlagsBits = v158;
      swift_storeEnumTagMultiPayload(v160, v159, 1);
      v161 = sub_10000897C();
      v162 = sub_100008A6C();
      v98 = (uint64_t)v224;
      _ConditionalContent<>.init(storage:)(v160, v218, &type metadata for StatusView, v161, v162);
      goto LABEL_34;
    default:
      v100 = type metadata accessor for BalloonView(0);
      v101 = *(_BYTE *)(a1 + *(int *)(v100 + 32)) == 0;
      if (*(_BYTE *)(a1 + *(int *)(v100 + 32)))
        v102 = 7696217;
      else
        v102 = 0;
      if (v101)
        v103 = 0;
      else
        v103 = 0xE300000000000000;
      v104 = sub_100019604(v102, v103);
      v106 = v105;
      v107 = sub_1000198E8(v102, v103);
      v109 = v108;
      v110 = swift_bridgeObjectRelease(v103);
      v111 = (void *)ATResponse.chosenAnswer.getter(v110);
      v112 = ATAnswerChoice.kind.getter();

      v114 = 0xD000000000000011;
      v115 = 0x800000010001C110;
      if (v112 != 2)
      {
        v114 = 0;
        v115 = 0;
      }
      if (v112 == 1)
        v116 = 0xD000000000000015;
      else
        v116 = v114;
      if (v112 == 1)
        v117 = 0x800000010001C130;
      else
        v117 = v115;
      v118 = (void *)ATResponse.chosenAnswer.getter(v113);
      v119 = ATAnswerChoice.kind.getter();

      switch(v119)
      {
        case 0:
          goto LABEL_30;
        case 2:
          v121 = static Color.red.getter();
          break;
        case 1:
          v121 = static Color.green.getter();
          break;
        default:
LABEL_30:
          v121 = static Color.gray.getter(v120);
          break;
      }
      v163 = v121;
      *(_QWORD *)&v225[0] = v104;
      *((_QWORD *)&v225[0] + 1) = v106;
      *(_QWORD *)&v225[1] = v107;
      *((_QWORD *)&v225[1] + 1) = v109;
      *(_QWORD *)&v225[2] = v116;
      *((_QWORD *)&v225[2] + 1) = v117;
      *(_QWORD *)&v225[3] = v121;
      BYTE8(v225[3]) = 0;
      v164 = sub_100008A6C();
      swift_bridgeObjectRetain(v106);
      swift_bridgeObjectRetain(v109);
      swift_bridgeObjectRetain(v117);
      swift_retain(v163);
      _ConditionalContent<>.init(storage:)(v225, &type metadata for StatusView, &type metadata for StatusView, v164, v164);
      v165 = *(_QWORD *)&v227[2];
      v166 = BYTE8(v227[2]);
      v167 = v227[0];
      v197 = v109;
      v168 = v200;
      *v200 = v226;
      v168[1] = v167;
      v168[2] = v227[1];
      *((_QWORD *)v168 + 6) = v165;
      *((_BYTE *)v168 + 56) = v166;
      swift_storeEnumTagMultiPayload(v168, v198, 1);
      v169 = sub_1000039D8(&qword_100024A80);
      v170 = sub_1000089E8();
      v171 = sub_100008AF0();
      v172 = v106;
      v173 = (uint64_t)v201;
      _ConditionalContent<>.init(storage:)(v168, v199, v169, v170, v171);
      v174 = v220;
      sub_100003D6C(v173, (uint64_t)v220, &qword_100024A00);
      swift_storeEnumTagMultiPayload(v174, v219, 0);
      v175 = sub_10000897C();
      v176 = v164;
      v98 = (uint64_t)v224;
      _ConditionalContent<>.init(storage:)(v174, v218, &type metadata for StatusView, v175, v176);
      sub_100008E14(v74);
      sub_100003DB0(v173, &qword_100024A00);
      swift_release(v163);
      swift_bridgeObjectRelease(v117);
      swift_bridgeObjectRelease(v197);
      object = v172;
LABEL_33:
      swift_bridgeObjectRelease(object);
LABEL_34:
      v177 = v223;
      v178 = v216;
      sub_100003D6C(v223, v216, &qword_100024A28);
      v179 = v217;
      sub_100003D6C(v98, v217, &qword_100024A08);
      v180 = v215;
      v225[0] = (unint64_t)v215;
      v181 = v214;
      LOBYTE(v225[1]) = v214;
      memcpy((char *)&v225[1] + 1, v248, 0x1A1uLL);
      v182 = v222;
      memcpy(v222, v225, 0x1B2uLL);
      v182[55] = 0;
      v183 = v221;
      *(_BYTE *)v221 = 1;
      v182[57] = v213;
      *(_BYTE *)(v183 + 16) = v212;
      v182[59] = v211;
      *(_BYTE *)(v183 + 32) = v210;
      v184 = v208;
      v182[61] = v209;
      v182[62] = v184;
      v185 = (int *)sub_1000039D8(&qword_100024A88);
      sub_100003D6C(v178, (uint64_t)v182 + v185[16], &qword_100024A28);
      v186 = (char *)v182 + v185[20];
      *(_QWORD *)v186 = 0;
      v186[8] = 1;
      *((_QWORD *)v186 + 2) = v207;
      v186[24] = v206;
      *((_QWORD *)v186 + 4) = v205;
      v186[40] = v204;
      v187 = v202;
      *((_QWORD *)v186 + 6) = v203;
      *((_QWORD *)v186 + 7) = v187;
      sub_100003D6C(v179, (uint64_t)v182 + v185[24], &qword_100024A08);
      sub_100008B54((uint64_t)v225);
      sub_100008C04((uint64_t)v246);
      sub_100003DB0((uint64_t)v224, &qword_100024A08);
      sub_100003DB0(v177, &qword_100024A28);
      sub_100008CB4(v246);
      sub_100003DB0(v179, &qword_100024A08);
      sub_100003DB0(v178, &qword_100024A28);
      v226 = (unint64_t)v180;
      LOBYTE(v227[0]) = v181;
      memcpy((char *)v227 + 1, v248, 0x1A1uLL);
      return sub_100008D64((uint64_t)&v226);
  }
}

uint64_t sub_100006A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  char v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[320];
  _BYTE v37[336];
  _QWORD v38[43];
  _BYTE v39[345];
  _BYTE v40[7];
  char v41;
  _BYTE v42[7];
  char v43;
  _QWORD v44[2];
  char v45;
  _BYTE v46[321];
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;

  v4 = type metadata accessor for Image.ResizingMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalloonView(0);
  if ((Icon.isComposite.getter() & 1) != 0)
    v8 = static IconProvider.Spec.effectiveSizeWithBadge.getter();
  else
    v9 = static IconProvider.Spec.effectiveSizeWithoutBadge.getter();
  v10 = v9;
  v11 = (void *)Icon.image.getter(v8);
  v12 = *(_QWORD *)a1;
  v13 = *(_BYTE *)(a1 + 8);
  sub_10000404C(*(_QWORD *)a1, v13);
  v14 = sub_100009044(v12, v13);
  sub_100004138(v12, v13);
  v15 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCGImage:scale:orientation:", v11, 0, v14);

  v16 = v15;
  v17 = Image.init(uiImage:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
  v18 = Image.resizable(capInsets:resizingMode:)(v7, v17, 0.0, 0.0, 0.0, 0.0);
  swift_release(v17);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v20 = static Alignment.center.getter(v19);
  v22 = _FrameLayout.init(width:height:alignment:)(&v47, *(_QWORD *)&v10, 0, *(_QWORD *)&v10, 0, v20, v21);
  v23 = v48;
  v34 = v49;
  v35 = v47;
  v24 = v50;
  v32 = v52;
  v33 = v51;
  v25 = static Color.clear.getter(v22);
  LOBYTE(v17) = static Edge.Set.all.getter();
  v26 = static HorizontalAlignment.center.getter();
  sub_100006D84(v36);
  v37[328] = 0;
  memcpy(&v37[7], v36, 0x13AuLL);
  v38[0] = v26;
  v38[1] = 0x4008000000000000;
  LOBYTE(v38[2]) = 0;
  memcpy((char *)&v38[2] + 1, v37, 0x141uLL);
  swift_retain(v18);
  swift_retain(v25);
  sub_100009604((uint64_t)v38);

  v43 = v23;
  v41 = v24;
  memcpy(&v39[7], v38, 0x152uLL);
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v42;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v42[3];
  v27 = v41;
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v40;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v40[3];
  v28 = v35;
  *(_QWORD *)a2 = v18;
  *(_QWORD *)(a2 + 8) = v28;
  *(_BYTE *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v34;
  *(_BYTE *)(a2 + 32) = v27;
  v29 = v32;
  *(_QWORD *)(a2 + 40) = v33;
  *(_QWORD *)(a2 + 48) = v29;
  *(_QWORD *)(a2 + 56) = v25;
  *(_BYTE *)(a2 + 64) = v17;
  memcpy((void *)(a2 + 65), v39, 0x159uLL);
  v44[0] = v26;
  v44[1] = 0x4008000000000000;
  v45 = 0;
  memcpy(v46, v37, sizeof(v46));
  sub_100009684((uint64_t)v44);
  swift_release(v25);
  return swift_release(v18);
}

uint64_t sub_100006D84@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
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
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t KeyPath;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  _OWORD v63[10];
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int16 v74;
  _OWORD __src[20];
  _OWORD v76[9];
  __int16 v77;
  _OWORD v78[10];
  uint64_t v79;

  *(_QWORD *)&__src[0] = ATQuestion.title.getter();
  *((_QWORD *)&__src[0] + 1) = v1;
  v2 = sub_100003B1C();
  v3 = Text.init<A>(_:)(__src, &type metadata for String, v2);
  v5 = v4;
  v7 = v6;
  v9 = v8 & 1;
  v10 = static Font.subheadline.getter();
  v11 = Font.bold()();
  swift_release(v10);
  v12 = Text.font(_:)(v11, v3, v5, v9, v7);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_release(v11);
  sub_100003B0C(v3, v5, v9);
  swift_bridgeObjectRelease(v7);
  KeyPath = swift_getKeyPath(&unk_10001B1B8);
  v19 = static Alignment.topLeading.getter(KeyPath);
  sub_100004CC4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v19, v20);
  sub_100003B0C(v12, v14, v16 & 1);
  swift_release(KeyPath);
  v21 = swift_bridgeObjectRelease(v18);
  v60 = __src[8];
  v61 = __src[9];
  v62 = *(_QWORD *)&__src[10];
  v56 = __src[4];
  v57 = __src[5];
  v58 = __src[6];
  v59 = __src[7];
  v52 = __src[0];
  v53 = __src[1];
  v54 = __src[2];
  v55 = __src[3];
  *(_QWORD *)&__src[0] = ATQuestion.summary.getter(v21);
  *((_QWORD *)&__src[0] + 1) = v22;
  v23 = Text.init<A>(_:)(__src, &type metadata for String, v2);
  v25 = v24;
  v27 = v26;
  v29 = v28 & 1;
  v30 = static Font.footnote.getter();
  v31 = Text.font(_:)(v30, v23, v25, v29, v27);
  v33 = v32;
  LOBYTE(v14) = v34;
  v36 = v35;
  swift_release(v30);
  sub_100003B0C(v23, v25, v29);
  v37 = swift_bridgeObjectRelease(v27);
  v38 = static Alignment.topLeading.getter(v37);
  sub_100004AE4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v38, v39, v31, v33, v14 & 1, v36);
  sub_100003B0C(v31, v33, v14 & 1);
  swift_bridgeObjectRelease(v36);
  v48 = __src[6];
  v49 = __src[7];
  v50 = __src[8];
  v44 = __src[2];
  v45 = __src[3];
  v46 = __src[4];
  v47 = __src[5];
  v42 = __src[0];
  v43 = __src[1];
  v63[8] = v60;
  v63[9] = v61;
  v63[4] = v56;
  v63[5] = v57;
  v63[6] = v58;
  v63[7] = v59;
  v63[0] = v52;
  v63[1] = v53;
  v63[2] = v54;
  v63[3] = v55;
  v71 = __src[6];
  v72 = __src[7];
  v73 = __src[8];
  v67 = __src[2];
  v68 = __src[3];
  v69 = __src[4];
  v70 = __src[5];
  v65 = __src[0];
  v66 = __src[1];
  __src[8] = v60;
  __src[9] = v61;
  __src[4] = v56;
  __src[5] = v57;
  __src[6] = v58;
  __src[7] = v59;
  __src[0] = v52;
  __src[1] = v53;
  __src[2] = v54;
  __src[3] = v55;
  *(_OWORD *)((char *)&__src[16] + 8) = v71;
  *(_OWORD *)((char *)&__src[17] + 8) = v72;
  *(_OWORD *)((char *)&__src[18] + 8) = v73;
  *(_OWORD *)((char *)&__src[12] + 8) = v67;
  *(_OWORD *)((char *)&__src[13] + 8) = v68;
  *(_OWORD *)((char *)&__src[14] + 8) = v69;
  *(_OWORD *)((char *)&__src[15] + 8) = v70;
  *(_OWORD *)((char *)&__src[10] + 8) = v65;
  v64 = v62;
  v74 = 256;
  *(_QWORD *)&__src[10] = v62;
  WORD4(__src[19]) = 256;
  *(_OWORD *)((char *)&__src[11] + 8) = v66;
  memcpy(a1, __src, 0x13AuLL);
  v76[6] = v48;
  v76[7] = v49;
  v76[8] = v50;
  v76[2] = v44;
  v76[3] = v45;
  v76[5] = v47;
  v76[4] = v46;
  v76[1] = v43;
  v76[0] = v42;
  v77 = 256;
  sub_100009760((uint64_t)v63);
  sub_1000097AC((uint64_t)&v65);
  sub_1000097E8((uint64_t)v76);
  v78[8] = v60;
  v78[9] = v61;
  v79 = v62;
  v78[4] = v56;
  v78[5] = v57;
  v78[7] = v59;
  v78[6] = v58;
  v78[0] = v52;
  v78[1] = v53;
  v78[3] = v55;
  v78[2] = v54;
  return sub_100009824((uint64_t)v78);
}

uint64_t sub_1000071C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t v15;
  char v16;
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
  uint64_t v29;
  uint64_t v30;

  v4 = sub_1000039D8(&qword_100024AA0);
  v5 = __chkstk_darwin(v4);
  v29 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v29 - v7;
  v9 = type metadata accessor for BalloonView(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = a1 + *(int *)(__chkstk_darwin(v9) + 40);
  v13 = *(_QWORD *)(v12 + 8);
  KeyPath = swift_getKeyPath(&unk_10001B128);
  v15 = swift_getKeyPath(&unk_10001B150);
  static Published.subscript.getter((uint64_t *)((char *)&v30 + 1), v13, KeyPath, v15);
  swift_release(KeyPath);
  swift_release(v15);
  v16 = BYTE1(v30);
  sub_100008FAC(a1, (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for BalloonView);
  v17 = *(unsigned __int8 *)(v10 + 80);
  v18 = (v17 + 16) & ~v17;
  v19 = swift_allocObject(&unk_100021120, v18 + v11, v17 | 7);
  sub_100008F1C((uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  v20 = *(_QWORD *)(v12 + 8);
  v21 = swift_getKeyPath(&unk_10001B128);
  v22 = swift_getKeyPath(&unk_10001B150);
  static Published.subscript.getter(&v30, v20, v21, v22);
  swift_release(v21);
  v23 = swift_release(v22);
  if (v30 == 1)
  {
    ProgressView<>.init<>()(v23);
    v24 = sub_1000039D8(&qword_100024AA8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v8, 0, 1, v24);
  }
  else
  {
    v25 = sub_1000039D8(&qword_100024AA8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v8, 1, 1, v25);
  }
  v26 = v29;
  sub_100003D6C((uint64_t)v8, v29, &qword_100024AA0);
  *(_BYTE *)a2 = v16 ^ 1;
  *(_BYTE *)(a2 + 1) = 1;
  *(_QWORD *)(a2 + 8) = sub_100008F60;
  *(_QWORD *)(a2 + 16) = v19;
  v27 = sub_1000039D8(&qword_100024AB0);
  sub_100003D6C(v26, a2 + *(int *)(v27 + 48), &qword_100024AA0);
  sub_100008F8C((uint64_t)sub_100008F60, v19);
  sub_100003DB0((uint64_t)v8, &qword_100024AA0);
  sub_100003DB0(v26, &qword_100024AA0);
  return sub_100008F9C((uint64_t)sub_100008F60, v19);
}

void sub_100007460(uint64_t a1)
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
  uint64_t v14;
  void *v15;
  int64_t *v16;
  void *Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = type metadata accessor for BalloonView(0);
  v33 = *(_QWORD *)(v2 - 8);
  v3 = *(_QWORD *)(v33 + 64);
  v4 = __chkstk_darwin(v2);
  v5 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v32 = (char *)&v32 - v6;
  v7 = type metadata accessor for MessagesContext(0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1 + *(int *)(v2 + 36);
  v12 = ATPayload.clientBundleIdentifier.getter(v8);
  v14 = v13;
  v15 = (void *)ATQuestion.topic.getter();
  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v12, v14, v15, 100);

  swift_bridgeObjectRelease(v14);
  v16 = (int64_t *)sub_1000077D4();
  sub_100008FAC(v11, (uint64_t)v10, type metadata accessor for MessagesContext);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v10[*(int *)(v7 + 24)]);
  sub_100009008((uint64_t)v10, type metadata accessor for MessagesContext);
  if (Strong)
  {
    sub_100008FAC(a1, (uint64_t)v5, type metadata accessor for BalloonView);
    v18 = *(unsigned __int8 *)(v33 + 80);
    v19 = (v18 + 16) & ~v18;
    v20 = swift_allocObject(&unk_100021148, v19 + v3, v18 | 7);
    sub_100008F1C((uint64_t)v5, v20 + v19);
    sub_1000103B4(v16, (uint64_t)sub_100009448, v20);
    swift_release(v20);

    swift_bridgeObjectRelease(v16);
  }
  else
  {
    v21 = v2;
    v22 = (uint64_t)v32;
    swift_bridgeObjectRelease(v16);
    if (qword_1000247C0 != -1)
      swift_once(&qword_1000247C0, sub_10000A754);
    v23 = type metadata accessor for Logger(0);
    sub_100008FF0(v23, (uint64_t)qword_1000251C8);
    v24 = sub_100008FAC(a1, v22, type metadata accessor for BalloonView);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v35 = v28;
      *(_DWORD *)v27 = 136315138;
      v29 = (uint64_t *)(v22 + *(int *)(v21 + 36) + (uint64_t)*(int *)(v7 + 20));
      v30 = *v29;
      v31 = v29[1];
      swift_bridgeObjectRetain(v31);
      v34 = sub_10001082C(v30, v31, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v31);
      sub_100009008(v22, type metadata accessor for BalloonView);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s: User tapped options dropdown, but menu presenter was nil", v27, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v27, -1, -1);
    }
    else
    {
      sub_100009008(v22, type metadata accessor for BalloonView);
    }

  }
}

uint64_t sub_1000077D4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  unint64_t v21;
  unint64_t v22;
  Swift::String *v23;
  unint64_t v24;
  Swift::String v25;

  result = ATQuestion.answerChoices.getter();
  v1 = result;
  if ((unint64_t)result >> 62)
  {
    if (result >= 0)
      result &= 0xFFFFFFFFFFFFFF8uLL;
    result = _CocoaArrayWrapper.endIndex.getter(result);
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_17:
    v4 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_18;
  }
  v2 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    goto LABEL_17;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v3 = 0;
  v24 = v1 & 0xC000000000000001;
  v4 = (char *)&_swiftEmptyArrayStorage;
  v5 = v1;
  do
  {
    if (v24)
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v1);
    else
      v6 = *(id *)(v1 + 8 * v3 + 32);
    v7 = v6;
    v8 = (unsigned __int16)ATAnswerChoice.kind.getter() == 2;
    v9 = ATAnswerChoice.title.getter();
    v11 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
      v4 = sub_100009204(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    v13 = *((_QWORD *)v4 + 2);
    v12 = *((_QWORD *)v4 + 3);
    if (v13 >= v12 >> 1)
      v4 = sub_100009204((char *)(v12 > 1), v13 + 1, 1, v4);
    ++v3;
    *((_QWORD *)v4 + 2) = v13 + 1;
    v14 = &v4[24 * v13];
    *((_QWORD *)v14 + 4) = v9;
    *((_QWORD *)v14 + 5) = v11;
    *((_QWORD *)v14 + 6) = 2 * v8;

    v1 = v5;
  }
  while (v2 != v3);
LABEL_18:
  swift_bridgeObjectRelease(v1);
  v15 = type metadata accessor for MessageParser();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v15);
  v17 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v25._object = (void *)0xE600000000000000;
  v18._countAndFlagsBits = 0x6C65636E6143;
  v18._object = (void *)0xE600000000000000;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = 0x6C65636E6143;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v25);

  if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
    v4 = sub_100009204(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
  v22 = *((_QWORD *)v4 + 2);
  v21 = *((_QWORD *)v4 + 3);
  if (v22 >= v21 >> 1)
    v4 = sub_100009204((char *)(v21 > 1), v22 + 1, 1, v4);
  *((_QWORD *)v4 + 2) = v22 + 1;
  v23 = (Swift::String *)&v4[24 * v22];
  v23[2] = v20;
  v23[3]._countAndFlagsBits = 1;
  return (uint64_t)v4;
}

void sub_100007A4C(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = type metadata accessor for BalloonView(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v42 - v9;
  v11 = *(void **)(a2 + 16);
  v12 = ATQuestion.answerChoices.getter(v8);
  v13 = v12;
  if ((unint64_t)v12 >> 62)
  {
    if (v12 >= 0)
      v12 &= 0xFFFFFFFFFFFFFF8uLL;
    v14 = _CocoaArrayWrapper.endIndex.getter(v12);
  }
  else
  {
    v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v15 = swift_bridgeObjectRelease(v13);
  if (v14 > a1)
  {
    v16 = ATQuestion.answerChoices.getter(v15);
    v17 = v16;
    if ((v16 & 0xC000000000000001) == 0)
    {
      if (a1 < 0)
      {
        __break(1u);
      }
      else if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10) > a1)
      {
        v18 = *(id *)(v16 + 8 * a1 + 32);
        goto LABEL_8;
      }
      __break(1u);
      goto LABEL_25;
    }
    v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v16);
LABEL_8:
    v11 = v18;
    swift_bridgeObjectRelease(v17);
    if (qword_1000247C0 == -1)
    {
LABEL_9:
      v19 = type metadata accessor for Logger(0);
      sub_100008FF0(v19, (uint64_t)qword_1000251C8);
      sub_100008FAC(a2, (uint64_t)v10, type metadata accessor for BalloonView);
      v20 = v11;
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = swift_slowAlloc(22, -1);
        v24 = (_QWORD *)swift_slowAlloc(8, -1);
        v43 = swift_slowAlloc(32, -1);
        v45 = v43;
        *(_DWORD *)v23 = 136315394;
        v25 = *(int *)(v4 + 36);
        v26 = (uint64_t *)&v10[v25 + *(int *)(type metadata accessor for MessagesContext(0) + 20)];
        v27 = *v26;
        v28 = v26[1];
        swift_bridgeObjectRetain(v28);
        v44 = sub_10001082C(v27, v28, &v45);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v23 + 4, v23 + 12);
        swift_bridgeObjectRelease(v28);
        sub_100009008((uint64_t)v10, type metadata accessor for BalloonView);
        *(_WORD *)(v23 + 12) = 2112;
        v44 = (uint64_t)v20;
        v29 = v20;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v23 + 14, v23 + 22);
        *v24 = v20;

        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s: User tapped answer: %@", (uint8_t *)v23, 0x16u);
        v30 = sub_1000039D8(&qword_100024AB8);
        swift_arrayDestroy(v24, 1, v30);
        swift_slowDealloc(v24, -1, -1);
        v31 = v43;
        swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1, -1);
        swift_slowDealloc(v23, -1, -1);

      }
      else
      {
        sub_100009008((uint64_t)v10, type metadata accessor for BalloonView);

      }
      sub_100007F84(v20);

      return;
    }
LABEL_25:
    swift_once(&qword_1000247C0, sub_10000A754);
    goto LABEL_9;
  }
  if (qword_1000247C0 != -1)
    swift_once(&qword_1000247C0, sub_10000A754);
  v32 = type metadata accessor for Logger(0);
  sub_100008FF0(v32, (uint64_t)qword_1000251C8);
  v33 = sub_100008FAC(a2, (uint64_t)v7, type metadata accessor for BalloonView);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc(28, -1);
    v37 = swift_slowAlloc(32, -1);
    v45 = v37;
    *(_DWORD *)v36 = 136315650;
    v38 = *(int *)(v4 + 36);
    v39 = (uint64_t *)&v7[v38 + *(int *)(type metadata accessor for MessagesContext(0) + 20)];
    v40 = *v39;
    v41 = v39[1];
    swift_bridgeObjectRetain(v41);
    v44 = sub_10001082C(v40, v41, &v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease(v41);
    sub_100009008((uint64_t)v7, type metadata accessor for BalloonView);
    *(_WORD *)(v36 + 12) = 1024;
    LODWORD(v44) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, (char *)&v44 + 4, v36 + 14, v36 + 18);
    *(_WORD *)(v36 + 18) = 2048;
    v44 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v36 + 20, v36 + 28);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s: Index (%d) was selected, but the index is >= number of answer choices (%ld).", (uint8_t *)v36, 0x1Cu);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }
  else
  {
    sub_100009008((uint64_t)v7, type metadata accessor for BalloonView);
  }

}

void sub_100007F84(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  void *v34;
  id v35;
  os_log_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  void *Strong;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _BYTE v60[4];
  int v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;

  v2 = v1;
  v4 = type metadata accessor for MessagesContext(0);
  __chkstk_darwin(v4);
  v69 = &v60[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for BalloonView(0);
  v7 = __chkstk_darwin(v6);
  v9 = &v60[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = v1 + *(int *)(v7 + 36);
  v11 = ATPayload.clientBundleIdentifier.getter();
  v13 = v12;
  v14 = (void *)ATQuestion.topic.getter();
  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v11, v13, v14, 200);

  swift_bridgeObjectRelease(v13);
  v15 = *(int *)(v4 + 20);
  v68 = v10;
  v16 = (uint64_t *)(v10 + v15);
  v17 = *v16;
  v18 = v16[1];
  v19 = qword_1000247C0;
  swift_bridgeObjectRetain(v18);
  if (v19 != -1)
    swift_once(&qword_1000247C0, sub_10000A754);
  v20 = type metadata accessor for Logger(0);
  v21 = sub_100008FF0(v20, (uint64_t)qword_1000251C8);
  sub_100008FAC(v2, (uint64_t)v9, type metadata accessor for BalloonView);
  swift_bridgeObjectRetain_n(v18, 2);
  v22 = a1;
  v67 = v21;
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc(32, -1);
    v66 = v2;
    v27 = v26;
    v28 = swift_slowAlloc(16, -1);
    v64 = v4;
    v29 = (_QWORD *)v28;
    v63 = swift_slowAlloc(32, -1);
    v71 = v63;
    *(_DWORD *)v27 = 136315650;
    v65 = v6;
    swift_bridgeObjectRetain(v18);
    v70 = sub_10001082C(v17, v18, &v71);
    v62 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v27 + 4, v27 + 12);
    swift_bridgeObjectRelease_n(v18, 3);
    *(_WORD *)(v27 + 12) = 2112;
    v70 = (uint64_t)v22;
    v30 = v22;
    v61 = v25;
    v31 = v17;
    v32 = v18;
    v33 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v27 + 14, v27 + 22);
    *v29 = v22;

    v18 = v32;
    *(_WORD *)(v27 + 22) = 2112;
    v34 = (void *)*((_QWORD *)v9 + 2);
    v70 = (uint64_t)v34;
    v35 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v27 + 24, v27 + 32);
    v29[1] = v34;
    v17 = v31;
    sub_100009008((uint64_t)v9, type metadata accessor for BalloonView);
    v36 = v62;
    _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v61, "%s: User selected answer choice. answerChoice: %@, question: %@", (uint8_t *)v27, 0x20u);
    v37 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v29, 2, v37);
    v38 = v29;
    v4 = v64;
    swift_slowDealloc(v38, -1, -1);
    v39 = v63;
    swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v39, -1, -1);
    v40 = v27;
    v2 = v66;
    swift_slowDealloc(v40, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v18, 2);
    sub_100009008((uint64_t)v9, type metadata accessor for BalloonView);

  }
  v41 = v69;
  sub_100008FAC(v68, (uint64_t)v69, type metadata accessor for MessagesContext);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v41[*(int *)(v4 + 24)]);
  sub_100009008((uint64_t)v41, type metadata accessor for MessagesContext);
  if (Strong
    && (v43 = objc_msgSend(Strong, "activeConversation"), Strong, v43))
  {
    v44 = *(id *)(v2 + 16);
    v45 = objc_msgSend(v43, "senderAddress");
    v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v48 = v47;

    v49 = objc_allocWithZone((Class)type metadata accessor for ATResponse(0));
    v50 = (void *)ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)(v44, v46, v48, v22);
    sub_100011F50(v50, v43);
    swift_bridgeObjectRelease(v18);

  }
  else
  {
    v51 = v22;
    swift_bridgeObjectRetain(v18);
    v52 = v51;
    v53 = Logger.logObject.getter(v52);
    v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc(22, -1);
      v56 = (_QWORD *)swift_slowAlloc(8, -1);
      v57 = swift_slowAlloc(32, -1);
      v71 = v57;
      *(_DWORD *)v55 = 136315394;
      swift_bridgeObjectRetain(v18);
      v70 = sub_10001082C(v17, v18, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v55 + 4, v55 + 12);
      swift_bridgeObjectRelease_n(v18, 3);
      *(_WORD *)(v55 + 12) = 2112;
      v70 = (uint64_t)v52;
      v58 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v55 + 14, v55 + 22);
      *v56 = v52;

      _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s: Could not send response because activeConversation was nil. answerChoice: %@", (uint8_t *)v55, 0x16u);
      v59 = sub_1000039D8(&qword_100024AB8);
      swift_arrayDestroy(v56, 1, v59);
      swift_slowDealloc(v56, -1, -1);
      swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v57, -1, -1);
      swift_slowDealloc(v55, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v18, 2);
    }
  }
}

unint64_t sub_1000087B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000249B8;
  if (!qword_1000249B8)
  {
    v1 = sub_100003E80(&qword_1000249A0);
    sub_10000881C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000249B8);
  }
  return result;
}

unint64_t sub_10000881C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000249C0;
  if (!qword_1000249C0)
  {
    v1 = sub_100003E80(&qword_100024998);
    sub_100008AB0(&qword_1000249C8, &qword_100024990, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000249C0);
  }
  return result;
}

unint64_t sub_1000088A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A38;
  if (!qword_100024A38)
  {
    v1 = sub_100003E80(&qword_100024A10);
    sub_10000893C(&qword_100024A40, (uint64_t (*)(uint64_t))&type metadata accessor for Divider, (uint64_t)&protocol conformance descriptor for Divider);
    sub_100008AB0(&qword_100024A48, &qword_100024A50, (uint64_t)&protocol conformance descriptor for _OverlayStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A38);
  }
  return result;
}

uint64_t sub_10000893C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000897C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A58;
  if (!qword_100024A58)
  {
    v1 = sub_100003E80(&qword_100024A00);
    sub_1000089E8();
    sub_100008AF0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A58);
  }
  return result;
}

unint64_t sub_1000089E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A60;
  if (!qword_100024A60)
  {
    v1 = sub_100003E80(&qword_1000249F8);
    sub_100008A6C();
    sub_100008AB0(&qword_100024A70, &qword_1000249D8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A60);
  }
  return result;
}

unint64_t sub_100008A6C()
{
  unint64_t result;

  result = qword_100024A68;
  if (!qword_100024A68)
  {
    result = swift_getWitnessTable(&unk_10001AF14, &type metadata for StatusView);
    atomic_store(result, (unint64_t *)&qword_100024A68);
  }
  return result;
}

uint64_t sub_100008AB0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003E80(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008AF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100024A78;
  if (!qword_100024A78)
  {
    v1 = sub_100003E80(&qword_100024A80);
    sub_100008A6C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100024A78);
  }
  return result;
}

uint64_t sub_100008B54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 128);
  v5 = *(_BYTE *)(a1 + 136);
  v6 = *(_QWORD *)(a1 + 144);
  v7 = *(_QWORD *)(a1 + 152);
  v8 = *(_QWORD *)(a1 + 288);
  v9 = *(_QWORD *)(a1 + 296);
  v10 = *(_BYTE *)(a1 + 304);
  v12 = *(_QWORD *)(a1 + 312);
  swift_retain(*(_QWORD *)(a1 + 24));
  swift_retain(v2);
  sub_100003A68(v3, v4, v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  sub_100003A68(v8, v9, v10);
  swift_bridgeObjectRetain(v12);
  return a1;
}

uint64_t sub_100008C04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_BYTE *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 264);
  v9 = *(_QWORD *)(a1 + 272);
  v10 = *(_BYTE *)(a1 + 280);
  v12 = *(_QWORD *)(a1 + 288);
  swift_retain(*(_QWORD *)a1);
  swift_retain(v2);
  sub_100003A68(v3, v4, v5);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  sub_100003A68(v8, v9, v10);
  swift_bridgeObjectRetain(v12);
  return a1;
}

uint64_t *sub_100008CB4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  v2 = *a1;
  v3 = a1[12];
  v4 = a1[13];
  v5 = *((_BYTE *)a1 + 112);
  v6 = a1[15];
  v7 = a1[16];
  v8 = a1[33];
  v9 = a1[34];
  v10 = *((_BYTE *)a1 + 280);
  v12 = a1[36];
  swift_release(a1[7]);
  swift_release(v2);
  sub_100003B0C(v3, v4, v5);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
  sub_100003B0C(v8, v9, v10);
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t sub_100008D64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 128);
  v5 = *(_BYTE *)(a1 + 136);
  v6 = *(_QWORD *)(a1 + 144);
  v7 = *(_QWORD *)(a1 + 152);
  v8 = *(_QWORD *)(a1 + 288);
  v9 = *(_QWORD *)(a1 + 296);
  v10 = *(_BYTE *)(a1 + 304);
  v12 = *(_QWORD *)(a1 + 312);
  swift_release(*(_QWORD *)(a1 + 80));
  swift_release(v2);
  sub_100003B0C(v3, v4, v5);
  swift_release(v7);
  swift_bridgeObjectRelease(v6);
  sub_100003B0C(v8, v9, v10);
  swift_bridgeObjectRelease(v12);
  return a1;
}

void sub_100008E14(id a1)
{
  if ((unint64_t)a1 >= 4)

}

uint64_t sub_100008E24@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001B128);
  v5 = swift_getKeyPath(&unk_10001B150);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100008EA4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_10001B128);
  v5 = swift_getKeyPath(&unk_10001B150);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_100008F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BalloonView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100008F60()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BalloonView(0) - 8) + 80);
  sub_100007460(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_100008F8C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100008F9C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100008FAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008FF0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100009008(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_100009044(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  double v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = *(double *)&v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_10001082C(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(&v16, v7, a1);
  sub_100004138(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

char *sub_100009204(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000039D8(&qword_100024AC0);
      v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[24 * v8 + 32])
          memmove(v13, a4 + 32, 24 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1000094E0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000932C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v1 = (int *)type metadata accessor for BalloonView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;
  sub_100004138(*(_QWORD *)(v0 + v4), *(_BYTE *)(v0 + v4 + 8));

  v8 = v7 + v1[7];
  v9 = type metadata accessor for Icon(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (id *)(v7 + v1[9]);

  v11 = type metadata accessor for MessagesContext(0);
  v12 = (char *)v10 + *(int *)(v11 + 20);
  swift_bridgeObjectRelease(*((_QWORD *)v12 + 1));
  v13 = &v12[*(int *)(type metadata accessor for MessagesMetadata(0) + 20)];
  v14 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  swift_unknownObjectWeakDestroy((char *)v10 + *(int *)(v11 + 24));
  swift_release(*(_QWORD *)(v7 + v1[10] + 8));
  return swift_deallocObject(v0, v5, v6);
}

void sub_100009448(int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BalloonView(0) - 8) + 80);
  sub_100007A4C(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_100009484@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1000094B4(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_1000094E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 24 * a1 + 32;
  v6 = a3 + 24 * v4;
  if (v5 >= v6 || v5 + 24 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1000095E0(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_1000095F8(a1, a2 & 1);
}

void sub_1000095F8(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease();
  else

}

uint64_t sub_100009604(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 192);
  v5 = *(_QWORD *)(a1 + 200);
  v6 = *(_BYTE *)(a1 + 208);
  v7 = *(_QWORD *)(a1 + 216);
  sub_100003A68(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  sub_100003A68(v4, v5, v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t sub_100009684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 192);
  v5 = *(_QWORD *)(a1 + 200);
  v6 = *(_BYTE *)(a1 + 208);
  v7 = *(_QWORD *)(a1 + 216);
  sub_100003B0C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  sub_100003B0C(v4, v5, v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t sub_100009704@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100009734(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100009760(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  sub_100003A68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t sub_1000097AC(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100003A68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  return a1;
}

uint64_t sub_1000097E8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  sub_100003B0C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100009824(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  sub_100003B0C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t sub_100009870(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for Text.Storage - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_1000098AC(uint64_t a1)
{
  sub_100003A68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

_QWORD *sub_1000098DC(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_100009904(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_10000992C()
{
  _QWORD v1[4];

  v1[0] = sub_100003E80(&qword_1000249A0);
  v1[1] = sub_100003E80(&qword_100024988);
  v1[2] = sub_1000087B0();
  v1[3] = sub_100008AB0(&qword_1000249D0, &qword_100024988, (uint64_t)&protocol conformance descriptor for ClosedRange<A>);
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
}

ValueMetadata *type metadata accessor for AskToBalloonContentFactory()
{
  return &type metadata for AskToBalloonContentFactory;
}

uint64_t sub_1000099C4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  void *v26;
  void *v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t countAndFlagsBits;
  void *v37;
  void *object;
  id v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  _QWORD v45[3];
  _BYTE v46[8];
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;

  v6 = type metadata accessor for MessageParser();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v6);
  v8 = (void *)objc_opt_self(NSBundle);
  v9 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
  v10._countAndFlagsBits = 0xD00000000000001DLL;
  v10._object = (void *)0x800000010001C290;
  v48._object = (void *)0x800000010001C290;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v48._countAndFlagsBits = 0xD00000000000001DLL;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v48);

  v47 = v12;
  if (!a3)
  {
    v29 = sub_1000039D8(&qword_100024B90);
    v30 = swift_allocObject(v29, 72, 7);
    *(_OWORD *)(v30 + 16) = xmmword_10001B220;
    *(_QWORD *)(v30 + 56) = &type metadata for String;
    *(_QWORD *)(v30 + 64) = sub_10000A0B4();
    *(_QWORD *)(v30 + 32) = a1;
    *(_QWORD *)(v30 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    v31 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
    v32 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
    v33._object = (void *)0x800000010001C2E0;
    v50._object = (void *)0x800000010001C2E0;
    v33._countAndFlagsBits = 0xD000000000000019;
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    v50._countAndFlagsBits = 0xD000000000000019;
    v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, (NSBundle)v32, v34, v50);

    countAndFlagsBits = static String.localizedStringWithFormat(_:_:)(v35._countAndFlagsBits, v35._object, v30);
    object = v37;
    swift_bridgeObjectRelease(v30);

    swift_bridgeObjectRelease(v35._object);
LABEL_6:
    v43._countAndFlagsBits = countAndFlagsBits;
    v43._object = object;
    String.append(_:)(v43);
    swift_bridgeObjectRelease(object);
    return v47._countAndFlagsBits;
  }
  if (a3 != 1)
  {
    v39 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
    v40._countAndFlagsBits = 0xD00000000000001CLL;
    v40._object = (void *)0x800000010001C300;
    v51._object = (void *)0x800000010001C300;
    v41._countAndFlagsBits = 0;
    v41._object = (void *)0xE000000000000000;
    v51._countAndFlagsBits = 0xD00000000000001CLL;
    v42 = NSLocalizedString(_:tableName:bundle:value:comment:)(v40, (Swift::String_optional)0, (NSBundle)v39, v41, v51);
    countAndFlagsBits = v42._countAndFlagsBits;
    object = v42._object;

    goto LABEL_6;
  }
  v13 = sub_1000039D8(&qword_100024B90);
  v14 = swift_allocObject(v13, 72, 7);
  *(_OWORD *)(v14 + 16) = xmmword_10001B220;
  swift_getErrorValue(a1, v46, v45);
  v15 = v45[1];
  v16 = v45[2];
  swift_errorRetain(a1);
  v17 = Error.localizedDescription.getter(v15, v16);
  v19 = v18;
  *(_QWORD *)(v14 + 56) = &type metadata for String;
  *(_QWORD *)(v14 + 64) = sub_10000A0B4();
  *(_QWORD *)(v14 + 32) = v17;
  *(_QWORD *)(v14 + 40) = v19;
  v20 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
  v21 = objc_msgSend(v8, "bundleForClass:", ObjCClassFromMetadata);
  v22._countAndFlagsBits = 0xD000000000000022;
  v22._object = (void *)0x800000010001C2B0;
  v49._object = (void *)0x800000010001C2B0;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v49._countAndFlagsBits = 0xD000000000000022;
  v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v49);

  v25 = static String.localizedStringWithFormat(_:_:)(v24._countAndFlagsBits, v24._object, v14);
  v27 = v26;
  swift_bridgeObjectRelease(v14);

  swift_bridgeObjectRelease(v24._object);
  v28._countAndFlagsBits = v25;
  v28._object = v27;
  String.append(_:)(v28);
  swift_bridgeObjectRelease(v27);
  sub_100009E8C(a1, a2, 1);
  return v47._countAndFlagsBits;
}

uint64_t sub_100009D58()
{
  uint64_t v0;

  return sub_1000099C4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_100009D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = sub_100009E0C();
  v1 = swift_allocObject(v0, ((*(unsigned int *)(v0 + 48) + 7) & 0x1FFFFFFF8) + 8, *(unsigned __int16 *)(v0 + 52) | 7);
  *(_OWORD *)(v1 + 16) = xmmword_10001B220;
  result = type metadata accessor for ATPayload(0);
  *(_QWORD *)(v1 + 32) = result;
  off_100024AD0 = (_UNKNOWN *)v1;
  return result;
}

uint64_t sub_100009DDC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MessageParser()
{
  return objc_opt_self(_TtC22AskToMessagesExtension13MessageParser);
}

uint64_t sub_100009E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = sub_1000039D8(&qword_100024B70);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = &qword_100024B80;
  else
    v2 = (uint64_t *)&unk_100024B78;
  return sub_1000039D8(v2);
}

uint64_t sub_100009E5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_errorRetain();
  if (!a3)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for MessageParser.Error(uint64_t a1)
{
  return sub_100009E8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100009E8C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_errorRelease();
  if (!a3)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s22AskToMessagesExtension13MessageParserC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100009E5C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MessageParser.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100009E5C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100009E8C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for MessageParser.Error(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MessageParser.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100009E8C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageParser.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageParser.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10000A02C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_10000A044(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageParser.Error()
{
  return &type metadata for MessageParser.Error;
}

unint64_t sub_10000A070()
{
  unint64_t result;

  result = qword_100024B88;
  if (!qword_100024B88)
  {
    result = swift_getWitnessTable(&unk_10001B294, &type metadata for MessageParser.Error);
    atomic_store(result, (unint64_t *)&qword_100024B88);
  }
  return result;
}

unint64_t sub_10000A0B4()
{
  unint64_t result;

  result = qword_100024B98;
  if (!qword_100024B98)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100024B98);
  }
  return result;
}

uint64_t destroy for MenuOption(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *_s22AskToMessagesExtension10MenuOptionVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain(v3);
  return a1;
}

_QWORD *assignWithCopy for MenuOption(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for MenuOption(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for MenuOption(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuOption(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MenuOption(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MenuOption()
{
  return &type metadata for MenuOption;
}

uint64_t *sub_10000A274(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v11);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for UUID(0);
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10000A310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10000A358(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for UUID(0);
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_10000A3C8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

_OWORD *sub_10000A444(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_10000A4A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10000A50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A518);
}

uint64_t sub_10000A518(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_10000A594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A5A0);
}

uint64_t sub_10000A5A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for MessagesMetadata(uint64_t a1)
{
  uint64_t result;

  result = qword_100024BF8;
  if (!qword_100024BF8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MessagesMetadata);
  return result;
}

uint64_t sub_10000A650(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_10001B318;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000A6C4(uint64_t a1)
{
  return sub_10000A7A8(a1, qword_100025198, 0xD000000000000016, 0x800000010001C320);
}

uint64_t *sub_10000A6E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10000A728(uint64_t a1)
{
  return sub_10000A7A8(a1, qword_1000251B0, 0x506567617373654DLL, 0xEE00676E69737261);
}

uint64_t sub_10000A754(uint64_t a1)
{
  return sub_10000A7A8(a1, qword_1000251C8, 0x566E6F6F6C6C6142, 0xEB00000000776569);
}

uint64_t sub_10000A77C(uint64_t a1)
{
  return sub_10000A7A8(a1, qword_1000251E0, 0x65736E6F70736552, 0xEE007265646E6553);
}

uint64_t sub_10000A7A8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_10000A6E8(v7, a2);
  sub_100008FF0(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0x6C7070612E6D6F63, 0xEF6F546B73412E65, a3, a4);
}

uint64_t sub_10000A824()
{
  uint64_t v0;

  sub_10000A878((_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for BalloonContentContainer()
{
  return objc_opt_self(_TtC22AskToMessagesExtension23BalloonContentContainer);
}

uint64_t sub_10000A878(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

double sub_10000A898(CGFloat a1, CGFloat a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double *v17;
  double v18;
  double v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v74;
  char *v75;
  CGFloat v76;
  uint64_t v77;
  CGSize v78;

  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v5 = 0x3E656E6F6E3CLL;
  v6 = type metadata accessor for Logger(0);
  sub_100008FF0(v6, (uint64_t)qword_100025198);
  v7 = v2;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  v75 = v7;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v11 = swift_slowAlloc(64, -1);
    v77 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = *(void **)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v12)
    {
      v13 = v12;
      v14 = ATPayload.messageGUID.getter();
      v16 = v15;

    }
    else
    {
      v16 = 0xE600000000000000;
      v14 = 0x3E656E6F6E3CLL;
    }
    v76 = COERCE_DOUBLE(sub_10001082C(v14, v16, &v77));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v10 + 4, v10 + 12);
    v7 = v75;

    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v10 + 12) = 2080;
    v76 = COERCE_DOUBLE(sub_10001082C(0xD000000000000017, 0x800000010001C7C0, &v77));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v10 + 14, v10 + 22);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: %s called", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v11, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {

  }
  if (a1 > 300.0)
    a1 = 300.0;
  v17 = (double *)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  if ((v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo + 32] & 1) == 0)
  {
    v19 = v17[2];
    v18 = v17[3];
    v78.width = a1;
    v78.height = a2;
    if (CGSizeEqualToSize(v78, *(CGSize *)v17))
    {
      v20 = v7;
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = swift_slowAlloc(52, -1);
        v24 = swift_slowAlloc(32, -1);
        v77 = v24;
        *(_DWORD *)v23 = 136316162;
        v25 = *(void **)&v20[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
        if (v25)
        {
          v26 = v25;
          v27 = ATPayload.messageGUID.getter();
          v29 = v28;

        }
        else
        {
          v29 = 0xE600000000000000;
          v27 = 0x3E656E6F6E3CLL;
        }
        v76 = COERCE_DOUBLE(sub_10001082C(v27, v29, &v77));
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v23 + 4, v23 + 12);

        swift_bridgeObjectRelease(v29);
        *(_WORD *)(v23 + 12) = 2048;
        v76 = v19;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v23 + 14, v23 + 22);
        *(_WORD *)(v23 + 22) = 2048;
        v76 = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v23 + 24, v23 + 32);
        *(_WORD *)(v23 + 32) = 2048;
        v76 = a1;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v23 + 34, v23 + 42);
        *(_WORD *)(v23 + 42) = 2048;
        v76 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v23 + 44, v23 + 52);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s: contentSizeThatFits using cached size %f x %f in fitting size %f x %f", (uint8_t *)v23, 0x34u);
        swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);

        v5 = 0x3E656E6F6E3CLL;
      }
      else
      {

      }
LABEL_43:
      v7 = v75;
      goto LABEL_44;
    }
  }
  v30 = v7;
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc(32, -1);
    v34 = swift_slowAlloc(32, -1);
    v77 = v34;
    *(_DWORD *)v33 = 136315650;
    v35 = *(void **)&v30[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v35)
    {
      v36 = v35;
      v37 = ATPayload.messageGUID.getter();
      v39 = v38;

    }
    else
    {
      v39 = 0xE600000000000000;
      v37 = 0x3E656E6F6E3CLL;
    }
    v76 = COERCE_DOUBLE(sub_10001082C(v37, v39, &v77));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v33 + 4, v33 + 12);

    swift_bridgeObjectRelease(v39);
    *(_WORD *)(v33 + 12) = 2048;
    v76 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v33 + 14, v33 + 22);
    *(_WORD *)(v33 + 22) = 2048;
    v76 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v33 + 24, v33 + 32);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s: contentSizeThatFits cache miss for fitting size %f x %f", (uint8_t *)v33, 0x20u);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);

    v5 = 0x3E656E6F6E3CLL;
    v7 = v75;
  }
  else
  {

  }
  v40 = *(void **)(*(_QWORD *)&v30[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer]
                 + 24);
  if (!v40 || (v41 = objc_msgSend(v40, "view")) == 0)
  {
    if (a2 <= 150.0)
      v18 = a2;
    else
      v18 = 150.0;
    v54 = v30;
    v55 = Logger.logObject.getter(v54);
    v56 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = swift_slowAlloc(52, -1);
      v58 = swift_slowAlloc(32, -1);
      v77 = v58;
      *(_DWORD *)v57 = 136316162;
      v59 = *(void **)&v54[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
      if (v59)
      {
        v60 = v59;
        v61 = ATPayload.messageGUID.getter();
        v63 = v62;

      }
      else
      {
        v63 = 0xE600000000000000;
        v61 = 0x3E656E6F6E3CLL;
      }
      v76 = COERCE_DOUBLE(sub_10001082C(v61, v63, &v77));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v57 + 4, v57 + 12);

      swift_bridgeObjectRelease(v63);
      *(_WORD *)(v57 + 12) = 2048;
      v76 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v57 + 14, v57 + 22);
      *(_WORD *)(v57 + 22) = 2048;
      v76 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v57 + 24, v57 + 32);
      *(_WORD *)(v57 + 32) = 2048;
      v76 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v57 + 34, v57 + 42);
      *(_WORD *)(v57 + 42) = 2048;
      v76 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v57 + 44, v57 + 52);
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s: contentSizeThatFits using constant size %f x %f in fitting size %f x %f", (uint8_t *)v57, 0x34u);
      swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v58, -1, -1);
      swift_slowDealloc(v57, -1, -1);

      v19 = a1;
    }
    else
    {

      v19 = a1;
    }
    goto LABEL_43;
  }
  v42 = v41;
  objc_msgSend(v41, "sizeThatFits:", a1, a2);
  v19 = floor(v43);
  v18 = floor(v44);
  v45 = v30;
  v46 = Logger.logObject.getter(v45);
  v47 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc(52, -1);
    v74 = swift_slowAlloc(32, -1);
    v77 = v74;
    *(_DWORD *)v48 = 136316162;
    v49 = *(void **)&v45[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v49)
    {
      v50 = v49;
      v51 = ATPayload.messageGUID.getter();
      v53 = v52;

    }
    else
    {
      v53 = 0xE600000000000000;
      v51 = 0x3E656E6F6E3CLL;
    }
    v76 = COERCE_DOUBLE(sub_10001082C(v51, v53, &v77));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v48 + 4, v48 + 12);

    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v48 + 12) = 2048;
    v76 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v48 + 14, v48 + 22);
    *(_WORD *)(v48 + 22) = 2048;
    v76 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v48 + 24, v48 + 32);
    *(_WORD *)(v48 + 32) = 2048;
    v76 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v48 + 34, v48 + 42);
    *(_WORD *)(v48 + 42) = 2048;
    v76 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v48 + 44, v48 + 52);
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "%s: contentSizeThatFits calculated size %f x %f in fitting size %f x %f", (uint8_t *)v48, 0x34u);
    swift_arrayDestroy(v74, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1, -1);
    swift_slowDealloc(v48, -1, -1);

    v7 = v75;
  }
  else
  {

  }
  *v17 = a1;
  v17[1] = a2;
  v17[2] = v19;
  v17[3] = v18;
  *((_BYTE *)v17 + 32) = 0;
  v5 = 0x3E656E6F6E3CLL;
LABEL_44:
  v64 = v7;
  v65 = Logger.logObject.getter(v64);
  v66 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = swift_slowAlloc(52, -1);
    v68 = swift_slowAlloc(32, -1);
    v77 = v68;
    *(_DWORD *)v67 = 136316162;
    v69 = *(void **)&v64[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v69)
    {
      v70 = v69;
      v5 = ATPayload.messageGUID.getter();
      v72 = v71;

    }
    else
    {
      v72 = 0xE600000000000000;
    }
    v76 = COERCE_DOUBLE(sub_10001082C(v5, v72, &v77));
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v67 + 4, v67 + 12);

    swift_bridgeObjectRelease(v72);
    *(_WORD *)(v67 + 12) = 2048;
    v76 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v67 + 14, v67 + 22);
    *(_WORD *)(v67 + 22) = 2048;
    v76 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v67 + 24, v67 + 32);
    *(_WORD *)(v67 + 32) = 2048;
    v76 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v67 + 34, v67 + 42);
    *(_WORD *)(v67 + 42) = 2048;
    v76 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v76, &v77, v67 + 44, v67 + 52);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "%s: contentSizeThatFits returning %f x %f in fitting size %f x %f", (uint8_t *)v67, 0x34u);
    swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v68, -1, -1);
    swift_slowDealloc(v67, -1, -1);

  }
  else
  {

  }
  return v19;
}

void sub_10000B4D4(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  if (a1)
  {
    v6 = a1;
    v7 = sub_10000E9D4(v6);
    v14 = *(void **)(v2 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload) = v7;

  }
  else
  {
    if (qword_1000247B0 != -1)
      swift_once(&qword_1000247B0, sub_10000A6C4);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100008FF0(v8, (uint64_t)qword_100025198);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "MSMessage updated to nil!", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = *(void **)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload) = 0;

  }
  v15 = objc_msgSend(a2, "recipientAddresses", v18);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses) = v16;
  swift_bridgeObjectRelease(v17);
  sub_10000BD70(a1, a2);
}

uint64_t sub_10000B880(double a1, double a2)
{
  void *v2;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t result;
  _QWORD v14[5];
  uint64_t v15;

  v5 = objc_msgSend(v2, "view");
  v6 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", a1, a2);
  v7 = swift_allocObject(&unk_100021398, 40, 7);
  *(double *)(v7 + 16) = a1;
  *(double *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = v5;
  v8 = swift_allocObject(&unk_1000213C0, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100011520;
  *(_QWORD *)(v8 + 24) = v7;
  v14[4] = sub_100011558;
  v15 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10000BA1C;
  v14[3] = &unk_1000213D8;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = v5;
  swift_retain(v8);
  swift_release(v10);
  v12 = objc_msgSend(v6, "imageWithActions:", v9);

  _Block_release(v9);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation(v8, "", 95, 115, 31, 1);
  swift_release(v7);
  result = swift_release(v8);
  if ((v6 & 1) == 0)
    return (uint64_t)v12;
  __break(1u);
  return result;
}

void sub_10000BA1C(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

void sub_10000BA50(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v3 = type metadata accessor for Logger(0);
  sub_100008FF0(v3, (uint64_t)qword_100025198);
  v4 = v1;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v16 = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = *(void **)&v4[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v9)
    {
      v10 = v9;
      v11 = ATPayload.messageGUID.getter();
      v13 = v12;

    }
    else
    {
      v13 = 0xE600000000000000;
      v11 = 0x3E656E6F6E3CLL;
    }
    v15 = sub_10001082C(v11, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v13);
    *(_WORD *)(v7 + 12) = 2080;
    v15 = sub_10001082C(0xD000000000000017, 0x800000010001C7A0, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v7 + 14, v7 + 22);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: %s called", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v4, "setProvidesExplicitSizeSnapshot");
  objc_msgSend(v4, "setNeedsSizeMatchBeforeSnapshotSwap");
  v14 = objc_msgSend(a1, "selectedMessage");
  sub_10000B4D4(v14, a1);

}

void sub_10000BD70(void *a1, _QWORD *a2)
{
  void *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  char *v75;
  NSObject *v76;
  int v77;
  _BOOL4 v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  id v88;
  id v89;
  _QWORD *v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  int v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  void (*v103)(char *, id);
  os_log_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  id v109;
  uint64_t v110;
  int v111;
  void *v112;
  NSObject *v113;
  os_log_type_t v114;
  _BOOL4 v115;
  uint64_t v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  id v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  id v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  int *v149;
  void *v150;
  int v151;
  char *v152;
  char *v153;
  char *v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  id v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  uint64_t *v165;
  _QWORD *v166;
  char *v167;
  uint64_t v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t);
  char *v175;
  uint64_t v176;
  uint64_t KeyPath;
  uint64_t v178;
  int *v179;
  uint64_t v180;
  uint64_t v181;
  id v182;
  id v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void (*v191)(char *, uint64_t);
  _BYTE *v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD *v195;
  void *v196;
  _QWORD *v197;
  void *v198;
  id v199;
  id v200;
  os_log_t v201;
  int v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  id v207;
  char *v208;
  uint64_t *v209;
  _QWORD *v210;
  char *v211;
  int *v212;
  _QWORD *v213;
  char *v214;
  uint64_t v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t *v220;
  uint64_t v221;
  uint64_t v222;
  char *v223;
  uint64_t v224;
  id v225;
  char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231[2];

  v213 = a2;
  v219 = type metadata accessor for BalloonView(0);
  v4 = __chkstk_darwin(v219);
  v221 = (uint64_t)&v201 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v220 = (uint64_t *)((char *)&v201 - v6);
  v212 = (int *)type metadata accessor for MessagesContext(0);
  v7 = __chkstk_darwin(v212);
  v217 = (uint64_t)&v201 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v218 = (uint64_t)&v201 - v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v201 - v11;
  v215 = type metadata accessor for MessagesMetadata(0);
  __chkstk_darwin(v215);
  v14 = (char *)&v201 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Icon(0);
  v227 = *(_QWORD *)(v15 - 8);
  v228 = v15;
  v16 = __chkstk_darwin(v15);
  v216 = (char *)&v201 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v226 = (char *)&v201 - v18;
  v19 = (_QWORD *)type metadata accessor for URL(0);
  v224 = *(v19 - 1);
  v225 = v19;
  __chkstk_darwin(v19);
  v211 = (char *)&v201 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000039D8(&qword_100024D40);
  v22 = __chkstk_darwin(v21);
  v214 = (char *)&v201 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v201 - v25;
  __chkstk_darwin(v24);
  v28 = (char *)&v201 - v27;
  v29 = sub_1000039D8(&qword_100024D80);
  v30 = __chkstk_darwin(v29);
  v32 = (char *)&v201 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v34 = (char *)&v201 - v33;
  v35 = type metadata accessor for UUID(0);
  v229 = *(_QWORD *)(v35 - 8);
  v36 = __chkstk_darwin(v35);
  v37 = __chkstk_darwin(v36);
  __chkstk_darwin(v37);
  if (a1)
  {
    v205 = v40;
    v206 = v39;
    v209 = (uint64_t *)v14;
    v210 = v12;
    v223 = (char *)&v201 - v38;
    v41 = a1;
    v42 = objc_msgSend(v41, "session");
    if (!v42)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v229 + 56))(v34, 1, 1, v35);
LABEL_14:
      sub_100003DB0((uint64_t)v34, &qword_100024D80);
      if (qword_1000247B0 != -1)
        swift_once(&qword_1000247B0, sub_10000A6C4);
      v59 = type metadata accessor for Logger(0);
      sub_100008FF0(v59, (uint64_t)qword_100025198);
      v60 = v2;
      v61 = Logger.logObject.getter(v60);
      v62 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = swift_slowAlloc(22, -1);
        v64 = swift_slowAlloc(64, -1);
        v231[0] = v64;
        *(_DWORD *)v63 = 136315394;
        v65 = *(void **)&v60[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
        if (v65)
        {
          v66 = v65;
          v67 = ATPayload.messageGUID.getter();
          v69 = v68;

        }
        else
        {
          v67 = 0x3E656E6F6E3CLL;
          v69 = 0xE600000000000000;
        }
        v230 = sub_10001082C(v67, v69, v231);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v63 + 4, v63 + 12);

        swift_bridgeObjectRelease(v69);
        *(_WORD *)(v63 + 12) = 2080;
        v230 = sub_10001082C(0xD000000000000016, 0x800000010001C730, v231);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v63 + 14, v63 + 22);
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: %s called with message.session nil", (uint8_t *)v63, 0x16u);
        swift_arrayDestroy(v64, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v64, -1, -1);
        swift_slowDealloc(v63, -1, -1);

      }
      else
      {

      }
      sub_10000FD88(0);

      return;
    }
    v43 = v42;
    v222 = v35;
    v44 = objc_msgSend(v42, "identifier");

    if (v44)
    {
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v44);

      v45 = 0;
    }
    else
    {
      v45 = 1;
    }
    v57 = v229;
    v58 = v222;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v229 + 56))(v32, v45, 1, v222);
    sub_100003DEC((uint64_t)v32, (uint64_t)v34, &qword_100024D80);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v34, 1, v58) == 1)
      goto LABEL_14;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v223, v34, v58);
    if (qword_1000247B0 != -1)
      swift_once(&qword_1000247B0, sub_10000A6C4);
    v70 = type metadata accessor for Logger(0);
    v71 = sub_100008FF0(v70, (uint64_t)qword_100025198);
    v72 = v41;
    v73 = v2;
    v74 = v72;
    v75 = (char *)v73;
    v76 = Logger.logObject.getter(v75);
    v77 = static os_log_type_t.default.getter();
    v78 = os_log_type_enabled(v76, (os_log_type_t)v77);
    v207 = v74;
    v208 = v75;
    if (v78)
    {
      v202 = v77;
      v79 = swift_slowAlloc(42, -1);
      v80 = (_QWORD *)swift_slowAlloc(8, -1);
      v81 = swift_slowAlloc(96, -1);
      v231[0] = v81;
      *(_DWORD *)v79 = 136315906;
      v82 = *(void **)&v75[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
      v203 = v71;
      v204 = v81;
      v201 = v76;
      if (v82)
      {
        v83 = v82;
        v84 = ATPayload.messageGUID.getter();
        v86 = v85;

      }
      else
      {
        v86 = 0xE600000000000000;
        v84 = 0x3E656E6F6E3CLL;
      }
      v230 = sub_10001082C(v84, v86, v231);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v79 + 4, v79 + 12);
      v88 = v208;

      swift_bridgeObjectRelease(v86);
      *(_WORD *)(v79 + 12) = 2080;
      v230 = sub_10001082C(0xD000000000000016, 0x800000010001C730, v231);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v79 + 14, v79 + 22);
      *(_WORD *)(v79 + 22) = 2112;
      v230 = (uint64_t)v207;
      v89 = v207;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v79 + 24, v79 + 32);
      *v80 = a1;
      v90 = v80;

      *(_WORD *)(v79 + 32) = 2080;
      v91 = objc_msgSend(v89, "URL");
      if (v91)
      {
        v92 = v91;
        static URL._unconditionallyBridgeFromObjectiveC(_:)();

        v93 = 0;
      }
      else
      {
        v93 = 1;
      }
      v94 = v224;
      v95 = v225;
      (*(void (**)(char *, uint64_t, uint64_t, id))(v224 + 56))(v26, v93, 1, v225);
      sub_100003DEC((uint64_t)v26, (uint64_t)v28, &qword_100024D40);
      v96 = (*(uint64_t (**)(char *, uint64_t, id))(v94 + 48))(v28, 1, v95);
      v74 = v207;
      if (v96)
      {
        sub_100003DB0((uint64_t)v28, &qword_100024D40);
        v97 = 0xE300000000000000;
        v98 = 7104878;
      }
      else
      {
        v99 = v211;
        (*(void (**)(char *, char *, id))(v94 + 16))(v211, v28, v95);
        v100 = sub_100003DB0((uint64_t)v28, &qword_100024D40);
        v101 = v94;
        v98 = URL.absoluteString.getter(v100);
        v97 = v102;
        v103 = *(void (**)(char *, id))(v101 + 8);
        v90 = v80;
        v103(v99, v95);
      }
      v230 = sub_10001082C(v98, v97, v231);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v79 + 34, v79 + 42);

      swift_bridgeObjectRelease(v97);
      v104 = v201;
      _os_log_impl((void *)&_mh_execute_header, v201, (os_log_type_t)v202, "%s: %s called with message %@, url: %s", (uint8_t *)v79, 0x2Au);
      v105 = sub_1000039D8(&qword_100024AB8);
      swift_arrayDestroy(v90, 1, v105);
      swift_slowDealloc(v90, -1, -1);
      v106 = v204;
      swift_arrayDestroy(v204, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v106, -1, -1);
      swift_slowDealloc(v79, -1, -1);

      v75 = v208;
    }
    else
    {

    }
    v107 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload;
    v108 = *(void **)&v75[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v108)
    {
      v109 = v108;
      v110 = (uint64_t)objc_msgSend(v74, "isFromMe");
      v204 = (uint64_t)v108;
      if ((v110 & 1) != 0)
      {
        v111 = 1;
        v112 = v213;
LABEL_57:
        v138 = ATPayload.response.getter(v110);
        if (v138)
        {
          v139 = (void *)v138;
          v140 = objc_msgSend(v112, "senderAddress");
          v141 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v143 = v142;

          v145 = ATResponse.responderHandle.getter();
          v146 = v144;
          if (v141 == v145 && v143 == v144)
          {
            v147 = 1;
            v146 = v143;
          }
          else
          {
            v147 = _stringCompareWithSmolCheck(_:_:expecting:)(v141, v143, v145, v144, 0);
          }
          v148 = (uint64_t)v226;
          v149 = v212;
          swift_bridgeObjectRelease(v143);
          swift_bridgeObjectRelease(v146);

          v74 = v207;
        }
        else
        {
          v147 = 0;
          v148 = (uint64_t)v226;
          v149 = v212;
        }
        v150 = (void *)ATPayload.response.getter(v138);

        if (v150)
          v151 = v147;
        else
          v151 = v111;
        LODWORD(v206) = v151;
        v152 = v208;
        v213 = *(_QWORD **)&v208[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer];
        v153 = (char *)v213[3];
        v154 = v153;
        v155 = objc_msgSend(v74, "URL");
        if (v155)
        {
          v156 = v155;
          v157 = (uint64_t)v214;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          v158 = 0;
        }
        else
        {
          v158 = 1;
          v157 = (uint64_t)v214;
        }
        v159 = v215;
        (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v224 + 56))(v157, v158, 1, v225);
        sub_10000D14C(v157, (uint64_t)v109, v148);
        sub_100003DB0(v157, &qword_100024D40);
        v160 = *(void **)&v152[v107];
        v211 = v153;
        v212 = (int *)v154;
        if (v160)
        {
          v161 = v160;
          v162 = ATPayload.messageGUID.getter();
          v164 = v163;

          v165 = v209;
        }
        else
        {
          v164 = 0xE600000000000000;
          v165 = v209;
          v162 = 0x3E656E6F6E3CLL;
        }
        (*(void (**)(char *, char *, uint64_t))(v229 + 16))((char *)v165 + *(int *)(v159 + 20), v223, v222);
        *v165 = v162;
        v165[1] = v164;
        v166 = v210;
        sub_100008FAC((uint64_t)v165, (uint64_t)v210 + v149[5], type metadata accessor for MessagesMetadata);
        *v166 = v109;
        v167 = (char *)v166 + v149[6];
        v168 = (uint64_t)v166;
        *((_QWORD *)v167 + 1) = &off_100021368;
        swift_unknownObjectWeakInit();
        v169 = (void *)v213[2];
        v213[2] = v204;
        v170 = v109;

        v225 = v170;
        v171 = (void *)ATPayload.question.getter(v225);
        v172 = (void *)ATPayload.response.getter(v171);
        v173 = v228;
        v174 = *(void (**)(char *, uint64_t, uint64_t))(v227 + 16);
        v175 = v216;
        v174(v216, v148, v228);
        v176 = v218;
        sub_100008FAC(v168, v218, type metadata accessor for MessagesContext);
        KeyPath = swift_getKeyPath(&unk_10001B3F8);
        v179 = (int *)v219;
        v178 = (uint64_t)v220;
        *v220 = KeyPath;
        *(_BYTE *)(v178 + 8) = 0;
        *(_QWORD *)(v178 + 16) = v171;
        *(_QWORD *)(v178 + 24) = v172;
        v174((char *)(v178 + v179[7]), (uint64_t)v175, v173);
        *(_BYTE *)(v178 + v179[8]) = v206 & 1;
        sub_100008FAC(v176, v178 + v179[9], type metadata accessor for MessagesContext);
        v180 = v217;
        sub_100008FAC(v176, v217, type metadata accessor for MessagesContext);
        v181 = type metadata accessor for ResponseSender(0);
        swift_allocObject(v181, *(unsigned int *)(v181 + 48), *(unsigned __int16 *)(v181 + 52));
        v182 = v172;
        v183 = v171;
        v184 = sub_100012318(v180);
        v185 = (uint64_t *)(v178 + v179[10]);
        v186 = sub_10000893C(&qword_100024D88, type metadata accessor for ResponseSender, (uint64_t)&unk_10001B4C0);
        v187 = ObservedObject.init(wrappedValue:)(v184, v181, v186);
        v189 = v188;

        sub_100009008(v176, type metadata accessor for MessagesContext);
        v190 = v228;
        v191 = *(void (**)(char *, uint64_t))(v227 + 8);
        v191(v175, v228);
        *v185 = v187;
        v185[1] = v189;
        v192 = objc_allocWithZone((Class)sub_1000039D8(&qword_100024D90));
        v192[*(_QWORD *)(qword_100025188 + (swift_isaMask & *(_QWORD *)v192) + 16)] = 0;
        v193 = v221;
        sub_100008FAC(v178, v221, type metadata accessor for BalloonView);
        v194 = UIHostingController.init(rootView:)(v193);
        sub_100009008(v178, type metadata accessor for BalloonView);
        v195 = v213;
        v196 = (void *)v213[3];
        v213[3] = v194;
        v197 = v195;

        v198 = (void *)v197[3];
        v199 = v198;
        v200 = v208;
        sub_10000F17C(v211, v198);

        objc_msgSend(v200, "requestResize");
        sub_100009008((uint64_t)v210, type metadata accessor for MessagesContext);
        sub_100009008((uint64_t)v209, type metadata accessor for MessagesMetadata);
        v191(v226, v190);
        (*(void (**)(char *, uint64_t))(v229 + 8))(v223, v222);
        return;
      }
      v121 = objc_msgSend(v74, "senderAddress");
      v112 = v213;
      if (v121)
      {
        v122 = v121;
        v123 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v125 = v124;

      }
      else
      {
        v123 = 0;
        v125 = 0;
      }
      v126 = objc_msgSend(v112, "senderAddress", v201);
      v127 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v129 = v128;

      if (v125)
      {
        if (v123 == v127 && v125 == v129)
        {
          swift_bridgeObjectRelease(v125);
          v110 = swift_bridgeObjectRelease(v129);
LABEL_55:
          v111 = 1;
          v74 = v207;
          goto LABEL_57;
        }
        v130 = _stringCompareWithSmolCheck(_:_:expecting:)(v123, v125, v127, v129, 0);
        swift_bridgeObjectRelease(v125);
        v110 = swift_bridgeObjectRelease(v129);
        if ((v130 & 1) != 0)
          goto LABEL_55;
      }
      else
      {
        swift_bridgeObjectRelease(v129);
      }
      v74 = v207;
      v131 = objc_msgSend(v207, "senderParticipantIdentifier");
      v132 = v205;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v131);

      v133 = objc_msgSend(v112, "localParticipantIdentifier");
      v134 = v206;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v133);

      v111 = static UUID.== infix(_:_:)(v132, v134);
      v135 = *(void (**)(uint64_t, uint64_t))(v229 + 8);
      v136 = v134;
      v137 = v222;
      v135(v136, v222);
      v110 = ((uint64_t (*)(uint64_t, uint64_t))v135)(v132, v137);
      goto LABEL_57;
    }
    v113 = Logger.logObject.getter(v87);
    v114 = static os_log_type_t.error.getter();
    v115 = os_log_type_enabled(v113, v114);
    v116 = v222;
    if (v115)
    {
      v117 = (uint8_t *)swift_slowAlloc(12, -1);
      v118 = swift_slowAlloc(32, -1);
      v231[0] = v118;
      *(_DWORD *)v117 = 136315138;
      v230 = sub_10001082C(0xD000000000000016, 0x800000010001C730, v231);
      v74 = v207;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v117 + 4, v117 + 12);
      _os_log_impl((void *)&_mh_execute_header, v113, v114, "%s no payload. Bailing.", v117, 0xCu);
      swift_arrayDestroy(v118, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v118, -1, -1);
      swift_slowDealloc(v117, -1, -1);
    }

    v119 = v229;
    v120 = v223;
    sub_10000FD88(1);

    (*(void (**)(char *, uint64_t))(v119 + 8))(v120, v116);
  }
  else
  {
    if (qword_1000247B0 != -1)
      swift_once(&qword_1000247B0, sub_10000A6C4);
    v46 = type metadata accessor for Logger(0);
    sub_100008FF0(v46, (uint64_t)qword_100025198);
    v47 = v2;
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc(22, -1);
      v51 = swift_slowAlloc(64, -1);
      v231[0] = v51;
      *(_DWORD *)v50 = 136315394;
      v52 = *(void **)&v47[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
      if (v52)
      {
        v53 = v52;
        v54 = ATPayload.messageGUID.getter();
        v56 = v55;

      }
      else
      {
        v54 = 0x3E656E6F6E3CLL;
        v56 = 0xE600000000000000;
      }
      v230 = sub_10001082C(v54, v56, v231);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v50 + 4, v50 + 12);

      swift_bridgeObjectRelease(v56);
      *(_WORD *)(v50 + 12) = 2080;
      v230 = sub_10001082C(0xD000000000000016, 0x800000010001C730, v231);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v230, v231, v50 + 14, v50 + 22);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "%s: %s called with message nil", (uint8_t *)v50, 0x16u);
      swift_arrayDestroy(v51, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v50, -1, -1);

    }
    else
    {

    }
    sub_10000FD88(0);
  }
}

uint64_t sub_10000D14C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
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
  char v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  char *v54;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;

  v67 = a2;
  v68 = a3;
  v61 = a1;
  v3 = type metadata accessor for UUID(0);
  v59 = *(_QWORD *)(v3 - 8);
  v60 = v3;
  __chkstk_darwin(v3);
  v58 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PayloadImage(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v62 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000039D8(&qword_100024D70);
  v9 = __chkstk_darwin(v8);
  v63 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v57 = (char *)&v56 - v12;
  __chkstk_darwin(v11);
  v65 = (char *)&v56 - v13;
  v66 = type metadata accessor for IconProvider(0);
  v64 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v69 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000039D8(&qword_100024D40);
  __chkstk_darwin(v15);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for URL(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1000039D8(&qword_100024D78);
  v23 = __chkstk_darwin(v22);
  v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v23);
  v28 = (char *)&v56 - v27;
  __chkstk_darwin(v26);
  v30 = (char *)&v56 - v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))((char *)&v56 - v29, 1, 1, v5);
  sub_100003D6C(v61, (uint64_t)v17, &qword_100024D40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    v31 = sub_100003DB0((uint64_t)v17, &qword_100024D40);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    sub_10000D764((uint64_t)v21, (uint64_t)v28);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    sub_100003DB0((uint64_t)v30, &qword_100024D78);
    v31 = sub_100003DEC((uint64_t)v28, (uint64_t)v30, &qword_100024D78);
  }
  IconProvider.init()(v31);
  v32 = type metadata accessor for Icon(0);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = (uint64_t)v65;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v65, 1, 1, v32);
  sub_100003D6C((uint64_t)v30, (uint64_t)v25, &qword_100024D78);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v25, 1, v5) == 1)
  {
    sub_100003DB0((uint64_t)v25, &qword_100024D78);
    v35 = v67;
  }
  else
  {
    v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v62, v25, v5);
    v37 = v67;
    v38 = ATPayload.clientBundleIdentifier.getter(v36);
    v56 = v6;
    if (v39)
    {
      v40 = v39;
      if (v38 == 0xD000000000000019 && v39 == 0x800000010001C710)
        v41 = 1;
      else
        v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v39, 0xD000000000000019, 0x800000010001C710, 0);
      v42 = v5;
      v38 = swift_bridgeObjectRelease(v40);
    }
    else
    {
      v42 = v5;
      v41 = 0;
    }
    v43 = (void *)ATPayload.question.getter(v38);
    v44 = v58;
    ATQuestion.systemId.getter();

    v45 = v41 & 1;
    v35 = v37;
    v46 = (uint64_t)v57;
    v47 = v62;
    IconProvider.icon(from:questionIdentifier:isScreenTimeRequest:)(v62, v44, v45);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v44, v60);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v47, v42);
    sub_100003DB0(v34, &qword_100024D70);
    sub_100003DEC(v46, v34, &qword_100024D70);
  }
  v48 = v63;
  sub_100003D6C(v34, v63, &qword_100024D70);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v48, 1, v32) == 1)
  {
    sub_100003DB0(v48, &qword_100024D70);
    if (qword_1000247B0 != -1)
      swift_once(&qword_1000247B0, sub_10000A6C4);
    v49 = type metadata accessor for Logger(0);
    v50 = sub_100008FF0(v49, (uint64_t)qword_100025198);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "iconFromData was nil. Trying to use icon for the ATPayload instead as a last resort. This means that a blank icon might end up being shown to the user.", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    v54 = v69;
    IconProvider.compositeIcon(for:)(v35);
    sub_100003DB0(v34, &qword_100024D70);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v54, v66);
    return sub_100003DB0((uint64_t)v30, &qword_100024D78);
  }
  else
  {
    sub_100003DB0(v34, &qword_100024D70);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v69, v66);
    sub_100003DB0((uint64_t)v30, &qword_100024D78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v68, v48, v32);
  }
}

uint64_t sub_10000D764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, unint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  Class isa;
  id v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(char *, unint64_t, uint64_t);
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(char *, unint64_t, uint64_t);
  unint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  Class v135;
  id v136;
  id v137;
  unint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  void (*v144)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  void (*v150)(char *, uint64_t);
  uint64_t (*v151)(uint64_t, uint64_t, uint64_t);
  char *v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  id v161;

  v160 = type metadata accessor for URLQueryItem(0);
  v4 = *(_QWORD *)(v160 - 8);
  v5 = __chkstk_darwin(v160);
  v7 = (char *)&v141 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v157 = (char *)&v141 - v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v141 - v10;
  v12 = sub_1000039D8(&qword_100024D60);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v141 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v155 = (char *)&v141 - v17;
  v18 = __chkstk_darwin(v16);
  v156 = (char *)&v141 - v19;
  __chkstk_darwin(v18);
  v158 = (char *)&v141 - v20;
  v21 = sub_1000039D8(&qword_100024D68);
  v22 = __chkstk_darwin(v21);
  v154 = (uint64_t)&v141 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v153 = (unint64_t)&v141 - v25;
  v26 = __chkstk_darwin(v24);
  v28 = (char *)&v141 - v27;
  __chkstk_darwin(v26);
  v30 = (char *)&v141 - v29;
  URLComponents.init(url:resolvingAgainstBaseURL:)(a1, 0);
  sub_100003D6C((uint64_t)v30, (uint64_t)v28, &qword_100024D68);
  v31 = type metadata accessor for URLComponents(0);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  if (v33(v28, 1, v31) == 1)
  {
    v34 = &qword_100024D68;
    v35 = (uint64_t)v28;
LABEL_17:
    sub_100003DB0(v35, v34);
    goto LABEL_18;
  }
  v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v33;
  v152 = v7;
  v159 = v4;
  v36 = ((uint64_t (*)(void))URLComponents.queryItems.getter)();
  v150 = *(void (**)(char *, uint64_t))(v32 + 8);
  v150(v28, v31);
  if (v36)
  {
    v149 = v31;
    v37 = *(_QWORD *)(v36 + 16);
    v38 = v160;
    if (v37)
    {
      v147 = a2;
      v148 = v15;
      v146 = v30;
      v39 = 0xED0000617461446CLL;
      v40 = v36 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
      v41 = *(_QWORD *)(v159 + 72);
      v42 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v159 + 16);
      swift_bridgeObjectRetain(v36);
      while (1)
      {
        v43 = v42(v11, v40, v38);
        v44 = URLQueryItem.name.getter(v43);
        v46 = v45;
        if (v44 == 0x69616E626D756874 && v45 == 0xED0000617461446CLL)
        {
          swift_bridgeObjectRelease(v36);
          goto LABEL_14;
        }
        v47 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
        swift_bridgeObjectRelease(v46);
        if ((v47 & 1) != 0)
          break;
        v38 = v160;
        (*(void (**)(char *, uint64_t))(v159 + 8))(v11, v160);
        v40 += v41;
        if (!--v37)
        {
          swift_bridgeObjectRelease(v36);
          v30 = v146;
          a2 = v147;
          v15 = v148;
          goto LABEL_11;
        }
      }
      v39 = v36;
LABEL_14:
      v38 = v160;
      swift_bridgeObjectRelease(v39);
      v49 = v158;
      v48 = v159;
      (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v158, v11, v38);
      v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56);
      v50(v49, 0, 1, v38);
      v30 = v146;
      a2 = v147;
      v15 = v148;
    }
    else
    {
LABEL_11:
      v49 = v158;
      v48 = v159;
      v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v159 + 56);
      v50(v158, 1, 1, v38);
    }
    swift_bridgeObjectRelease(v36);
    v51 = v48;
    v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48);
    if (v52(v49, 1, v38) == 1)
    {
      v34 = &qword_100024D60;
      v35 = (uint64_t)v49;
      goto LABEL_17;
    }
    v55 = v49;
    v56 = v38;
    v57 = URLQueryItem.value.getter();
    v59 = v58;
    v158 = *(char **)(v51 + 8);
    ((void (*)(char *, uint64_t))v158)(v55, v56);
    v60 = v149;
    if (!v59)
      goto LABEL_18;
    v61 = Data.init(base64Encoded:options:)(v57, v59, 0);
    v63 = v62;
    swift_bridgeObjectRelease(v59);
    if (v63 >> 60 == 15)
      goto LABEL_18;
    isa = Data._bridgeToObjectiveC()().super.isa;
    v161 = 0;
    v65 = -[objc_class decompressedDataUsingAlgorithm:error:](isa, "decompressedDataUsingAlgorithm:error:", 3, &v161);

    v66 = v161;
    if (!v65)
    {
      v76 = v66;
      v77 = _convertNSErrorToError(_:)();

      swift_willThrow();
      sub_100011414(v61, v63);
      swift_errorRelease(v77);
      goto LABEL_18;
    }
    v144 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v50;
    v145 = v61;
    v67 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v65);
    v69 = v68;

    v70 = v153;
    sub_100003D6C((uint64_t)v30, v153, &qword_100024D68);
    v71 = v151(v70, 1, v60);
    v143 = v67;
    v142 = v69;
    v72 = sub_10001146C(v67, v69);
    if (v71 == 1)
    {
      sub_100003DB0(v70, &qword_100024D68);
      v73 = v160;
      v74 = (uint64_t)v155;
      v75 = (uint64_t)v156;
    }
    else
    {
      v78 = URLComponents.queryItems.getter(v72);
      v150((char *)v70, v60);
      v73 = v160;
      v74 = (uint64_t)v155;
      v75 = (uint64_t)v156;
      if (v78)
      {
        v148 = v15;
        v79 = *(_QWORD *)(v78 + 16);
        if (v79)
        {
          v153 = v63;
          v146 = v30;
          v147 = a2;
          v80 = v78 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
          v81 = *(_QWORD *)(v159 + 72);
          v82 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v159 + 16);
          v83 = v78;
          swift_bridgeObjectRetain(v78);
          v84 = v157;
          while (1)
          {
            v85 = v82(v84, v80, v73);
            v86 = URLQueryItem.name.getter(v85);
            v88 = v87;
            if (v86 == 0xD000000000000023 && v87 == 0x800000010001C6E0)
            {
              v118 = v83;
              swift_bridgeObjectRelease(v83);
              v119 = 0x800000010001C6E0;
              goto LABEL_59;
            }
            v89 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
            swift_bridgeObjectRelease(v88);
            if ((v89 & 1) != 0)
              break;
            v84 = v157;
            v73 = v160;
            ((void (*)(char *, uint64_t))v158)(v157, v160);
            v80 += v81;
            if (!--v79)
            {
              v78 = v83;
              swift_bridgeObjectRelease(v83);
              v30 = v146;
              a2 = v147;
              v74 = (uint64_t)v155;
              v75 = (uint64_t)v156;
              v63 = v153;
              goto LABEL_34;
            }
          }
          v118 = v83;
          v119 = v83;
LABEL_59:
          swift_bridgeObjectRelease(v119);
          v73 = v160;
          v75 = (uint64_t)v156;
          (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v156, v157, v160);
          v144(v75, 0, 1, v73);
          swift_bridgeObjectRelease(v118);
          v30 = v146;
          a2 = v147;
          v15 = v148;
          v74 = (uint64_t)v155;
          v63 = v153;
        }
        else
        {
LABEL_34:
          v144(v75, 1, 1, v73);
          swift_bridgeObjectRelease(v78);
          v15 = v148;
        }
LABEL_36:
        v90 = v145;
        sub_100003D6C(v75, v74, &qword_100024D60);
        v91 = v74;
        if (v52((char *)v74, 1, v73) == 1)
        {
          sub_100011414(v90, v63);
          v92 = v143;
          v93 = v142;
          sub_100011428(v143, v142);
          sub_100003DB0(v74, &qword_100024D60);
          LODWORD(v157) = 0;
        }
        else
        {
          v94 = v73;
          v95 = v63;
          v96 = URLQueryItem.value.getter();
          v98 = v97;
          ((void (*)(uint64_t, uint64_t))v158)(v91, v94);
          if (v98)
          {
            if (v96 == 1702195828 && v98 == 0xE400000000000000)
            {
              swift_bridgeObjectRelease(0xE400000000000000);
              sub_100011414(v145, v95);
              v92 = v143;
              v93 = v142;
              sub_100011428(v143, v142);
              LODWORD(v157) = 1;
            }
            else
            {
              LODWORD(v157) = _stringCompareWithSmolCheck(_:_:expecting:)(v96, v98, 1702195828, 0xE400000000000000, 0);
              swift_bridgeObjectRelease(v98);
              sub_100011414(v145, v95);
              v92 = v143;
              v93 = v142;
              sub_100011428(v143, v142);
            }
          }
          else
          {
            sub_100011414(v145, v95);
            v92 = v143;
            v93 = v142;
            sub_100011428(v143, v142);
            LODWORD(v157) = 0;
          }
          v75 = (uint64_t)v156;
        }
        sub_100003DB0(v75, &qword_100024D60);
        v99 = v154;
        sub_100003D6C((uint64_t)v30, v154, &qword_100024D68);
        v100 = v149;
        v101 = v151(v99, 1, v149);
        v102 = sub_10001146C(v92, v93);
        if (v101 == 1)
        {
          sub_100003DB0(v99, &qword_100024D68);
        }
        else
        {
          v103 = URLComponents.queryItems.getter(v102);
          v150((char *)v99, v100);
          if (v103)
          {
            v104 = *(_QWORD *)(v103 + 16);
            if (v104)
            {
              v147 = a2;
              v148 = v15;
              v146 = v30;
              v105 = 0xEE00617461446E6FLL;
              v106 = v103
                   + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
              v107 = *(_QWORD *)(v159 + 72);
              v108 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v159 + 16);
              v109 = v103;
              swift_bridgeObjectRetain(v103);
              v110 = v160;
              v111 = v152;
              while (1)
              {
                v112 = v108(v111, v106, v110);
                v113 = URLQueryItem.name.getter(v112);
                v115 = v114;
                if (v113 == 0x6349746E65696C63 && v114 == 0xEE00617461446E6FLL)
                {
                  swift_bridgeObjectRelease(v109);
                  goto LABEL_61;
                }
                v116 = _stringCompareWithSmolCheck(_:_:expecting:)(v113, v114, 0x6349746E65696C63, 0xEE00617461446E6FLL, 0);
                swift_bridgeObjectRelease(v115);
                if ((v116 & 1) != 0)
                  break;
                v111 = v152;
                v110 = v160;
                ((void (*)(char *, uint64_t))v158)(v152, v160);
                v106 += v107;
                if (!--v104)
                {
                  swift_bridgeObjectRelease(v109);
                  v117 = 1;
                  v30 = v146;
                  a2 = v147;
                  v15 = v148;
                  goto LABEL_62;
                }
              }
              v105 = v109;
LABEL_61:
              v110 = v160;
              swift_bridgeObjectRelease(v105);
              v15 = v148;
              (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v148, v152, v110);
              v117 = 0;
              v30 = v146;
              a2 = v147;
LABEL_62:
              v92 = v143;
              v93 = v142;
            }
            else
            {
              v109 = v103;
              v117 = 1;
              v110 = v160;
            }
            v144((uint64_t)v15, v117, 1, v110);
            swift_bridgeObjectRelease(v109);
            if (v52(v15, 1, v110) == 1)
            {
              sub_100003DB0((uint64_t)v15, &qword_100024D60);
            }
            else
            {
              v120 = v110;
              v121 = URLQueryItem.value.getter();
              v122 = v15;
              v124 = v123;
              ((void (*)(char *, uint64_t))v158)(v122, v120);
              if (v124)
              {
                v125 = v93;
                v126 = v30;
                v127 = a2;
                v128 = Data.init(base64Encoded:options:)(v121, v124, 0);
                v130 = v129;
                swift_bridgeObjectRelease(v124);
                if (v130 >> 60 == 15)
                {
                  v131 = 0;
                  v132 = 0xF000000000000000;
                  v30 = v126;
                }
                else
                {
                  v134 = v92;
                  v135 = Data._bridgeToObjectiveC()().super.isa;
                  v161 = 0;
                  v136 = -[objc_class decompressedDataUsingAlgorithm:error:](v135, "decompressedDataUsingAlgorithm:error:", 3, &v161);

                  v137 = v161;
                  if (v136)
                  {
                    v131 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v136);
                    v132 = v138;
                    sub_100011414(v128, v130);

                  }
                  else
                  {
                    v139 = v137;
                    v140 = _convertNSErrorToError(_:)();

                    swift_willThrow();
                    sub_100011414(v128, v130);
                    swift_errorRelease(v140);
                    v131 = 0;
                    v132 = 0xF000000000000000;
                  }
                  a2 = v127;
                  v30 = v126;
                  v92 = v134;
                }
                v93 = v125;
                goto LABEL_69;
              }
            }
          }
        }
        v131 = 0;
        v132 = 0xF000000000000000;
LABEL_69:
        PayloadImage.init(clientIconImageData:associatedContentIconImageData:cornerRadiusIncluded:)(v131, v132, v92, v93, v157 & 1);
        sub_100011428(v92, v93);
        sub_100003DB0((uint64_t)v30, &qword_100024D68);
        v133 = type metadata accessor for PayloadImage(0);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v133 - 8) + 56))(a2, 0, 1, v133);
      }
    }
    v144(v75, 1, 1, v73);
    goto LABEL_36;
  }
LABEL_18:
  sub_100003DB0((uint64_t)v30, &qword_100024D68);
  v53 = type metadata accessor for PayloadImage(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(a2, 1, 1, v53);
}

uint64_t sub_10000E40C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  unint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, unint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  unsigned __int8 *v51;
  int v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  char *v59;
  _QWORD v60[3];
  char v61;
  double v62;

  v4 = sub_1000039D8(&qword_100024AC8);
  __chkstk_darwin(v4);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URLQueryItem(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000039D8(&qword_100024D60);
  __chkstk_darwin(v11);
  v59 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000039D8(&qword_100024D68);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v53 - v17;
  v19 = type metadata accessor for Date(0);
  v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v58 = v19;
  v57(a2, 1, 1);
  URLComponents.init(url:resolvingAgainstBaseURL:)(a1, 0);
  sub_100003D6C((uint64_t)v18, (uint64_t)v16, &qword_100024D68);
  v20 = type metadata accessor for URLComponents(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v16, 1, v20);
  if ((_DWORD)v22 == 1)
  {
    sub_100003DB0((uint64_t)v16, &qword_100024D68);
  }
  else
  {
    v55 = v6;
    v56 = a2;
    v23 = URLComponents.queryItems.getter(v22);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v20);
    if (v23)
    {
      v24 = *(_QWORD *)(v23 + 16);
      if (v24)
      {
        v54 = v18;
        v25 = v23 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
        v26 = *(_QWORD *)(v8 + 72);
        v27 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v8 + 16);
        swift_bridgeObjectRetain(v23);
        while (1)
        {
          v28 = v27(v10, v25, v7);
          v29 = URLQueryItem.name.getter(v28);
          v31 = v30;
          if (v29 == 0x73657269707865 && v30 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease(v23);
            v35 = 0xE700000000000000;
            goto LABEL_15;
          }
          v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v30, 0x73657269707865, 0xE700000000000000, 0);
          swift_bridgeObjectRelease(v31);
          if ((v32 & 1) != 0)
            break;
          (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
          v25 += v26;
          if (!--v24)
          {
            swift_bridgeObjectRelease(v23);
            v33 = 1;
            v18 = v54;
            goto LABEL_12;
          }
        }
        v35 = v23;
LABEL_15:
        swift_bridgeObjectRelease(v35);
        v34 = (uint64_t)v59;
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v59, v10, v7);
        v33 = 0;
        v18 = v54;
      }
      else
      {
        v33 = 1;
LABEL_12:
        v34 = (uint64_t)v59;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v34, v33, 1, v7);
      swift_bridgeObjectRelease(v23);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v34, 1, v7) == 1)
      {
        sub_100003DB0(v34, &qword_100024D60);
      }
      else
      {
        v36 = URLQueryItem.value.getter();
        v38 = v37;
        v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v34, v7);
        if (v38)
        {
          v62 = 0.0;
          __chkstk_darwin(v39);
          *(&v53 - 2) = (uint64_t)&v62;
          if ((v38 & 0x1000000000000000) != 0 || !(v38 & 0x2000000000000000 | v36 & 0x1000000000000000))
          {
            _StringGuts._slowWithCString<A>(_:)(&v61, sub_1000113A8, &v53 - 4, v36, v38, &type metadata for Bool);
            v44 = swift_bridgeObjectRelease(v38);
            v42 = (uint64_t)v55;
            v41 = v56;
            if ((v61 & 1) == 0)
              goto LABEL_29;
          }
          else if ((v38 & 0x2000000000000000) != 0)
          {
            v60[0] = v36;
            v60[1] = v38 & 0xFFFFFFFFFFFFFFLL;
            if (v36 <= 0x20u && ((1 << v36) & 0x100003E01) != 0
              || (v51 = (unsigned __int8 *)_swift_stdlib_strtod_clocale(v60, &v62)) == 0)
            {
              swift_bridgeObjectRelease(v38);
              goto LABEL_29;
            }
            v52 = *v51;
            v44 = swift_bridgeObjectRelease(v38);
            v42 = (uint64_t)v55;
            v41 = v56;
            if (v52)
              goto LABEL_29;
          }
          else
          {
            if ((v36 & 0x1000000000000000) != 0)
              v40 = (_BYTE *)((v38 & 0xFFFFFFFFFFFFFFFLL) + 32);
            else
              v40 = (_BYTE *)_StringObject.sharedUTF8.getter(v36, v38);
            v42 = (uint64_t)v55;
            v41 = v56;
            sub_1000113A8(v40, (BOOL *)v60);
            v43 = v60[0];
            v44 = swift_bridgeObjectRelease(v38);
            if ((v43 & 1) == 0)
              goto LABEL_29;
          }
          Date.init(timeIntervalSinceReferenceDate:)(v44, v62);
          sub_100003DB0((uint64_t)v18, &qword_100024D68);
          sub_100003DB0(v41, &qword_100024AC8);
          ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v57)(v42, 0, 1, v58);
          return sub_100003DEC(v42, v41, &qword_100024AC8);
        }
      }
    }
  }
LABEL_29:
  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v46 = type metadata accessor for Logger(0);
  v47 = sub_100008FF0(v46, (uint64_t)qword_100025198);
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Failed to get expiration date from URL", v50, 2u);
    swift_slowDealloc(v50, -1, -1);
  }

  return sub_100003DB0((uint64_t)v18, &qword_100024D68);
}

id sub_10000E9D4(NSObject *a1)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  char *v24;
  id v25;
  id result;
  void *v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t (*)(_QWORD, _QWORD, _QWORD), uint64_t, uint64_t);
  uint64_t (*v36)(_QWORD, _QWORD, _QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void (*v71)(char *, uint64_t);
  NSObject *v72;
  uint64_t v73;
  uint8_t *v74;
  uint64_t v75;
  void *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint8_t *v80;
  char *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t (*v84)(_QWORD, _QWORD, _QWORD);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v2 = type metadata accessor for Date(0);
  v90 = *(_QWORD *)(v2 - 8);
  v91 = v2;
  v3 = __chkstk_darwin(v2);
  v88 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v89 = (char *)&v78 - v5;
  v6 = sub_1000039D8(&qword_100024D40);
  __chkstk_darwin(v6);
  v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v78 - v14;
  v16 = sub_1000039D8(&qword_100024AC8);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (uint8_t *)&v78 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v78 - v23;
  v25 = v92;
  result = (id)sub_10001102C(a1);
  if (v25)
    return result;
  v82 = (uint64_t)v13;
  v83 = a1;
  v79 = v19;
  v80 = v22;
  v84 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v8;
  v85 = v9;
  v81 = v15;
  v86 = v10;
  v87 = 0;
  v92 = result;
  v27 = (void *)ATPayload.question.getter(result);
  ATQuestion.expirationDate.getter(v27);

  v28 = v90;
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v90 + 48);
  LODWORD(v27) = v29(v24, 1, v91);
  sub_100003DB0((uint64_t)v24, &qword_100024AC8);
  if ((_DWORD)v27 == 1)
  {
    v30 = -[NSObject URL](v83, "URL");
    if (v30)
    {
      v31 = v30;
      v32 = v82;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v34 = v85;
      v33 = v86;
      v35 = *(void (**)(uint64_t (*)(_QWORD, _QWORD, _QWORD), uint64_t, uint64_t))(v86 + 32);
      v36 = v84;
      v35(v84, v32, v85);
      (*(void (**)(uint64_t (*)(_QWORD, _QWORD, _QWORD), _QWORD, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v34);
      if ((*(unsigned int (**)(_QWORD, uint64_t, uint64_t))(v33 + 48))(v36, 1, v34) != 1)
      {
        v37 = (uint64_t)v81;
        v35((uint64_t (*)(_QWORD, _QWORD, _QWORD))v81, (uint64_t)v36, v34);
        v38 = (uint64_t)v80;
        sub_10000E40C(v37, (uint64_t)v80);
        v39 = v91;
        if (v29((char *)v38, 1, v91) != 1)
        {
          v59 = v89;
          (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v89, v38, v39);
          v60 = v39;
          if (qword_1000247B8 != -1)
            swift_once(&qword_1000247B8, sub_10000A728);
          v61 = type metadata accessor for Logger(0);
          sub_100008FF0(v61, (uint64_t)qword_1000251B0);
          v62 = v88;
          v84 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v28 + 16);
          v63 = v84(v88, v59, v60);
          v64 = Logger.logObject.getter(v63);
          v65 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v64, v65))
          {
            v83 = v64;
            v66 = (uint8_t *)swift_slowAlloc(12, -1);
            v82 = swift_slowAlloc(32, -1);
            v95 = v82;
            *(_DWORD *)v66 = 136315138;
            v80 = v66 + 4;
            v67 = sub_10000893C(&qword_100024D48, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
            v68 = dispatch thunk of CustomStringConvertible.description.getter(v60, v67);
            v70 = v69;
            v93 = sub_10001082C(v68, v69, &v95);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v80, v66 + 12);
            swift_bridgeObjectRelease(v70);
            v71 = *(void (**)(char *, uint64_t))(v28 + 8);
            v71(v62, v60);
            v72 = v83;
            _os_log_impl((void *)&_mh_execute_header, v83, v65, "Using legacy payload expiration date: %s", v66, 0xCu);
            v73 = v82;
            swift_arrayDestroy(v82, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v73, -1, -1);
            v74 = v66;
            v59 = v89;
            swift_slowDealloc(v74, -1, -1);

          }
          else
          {
            v71 = *(void (**)(char *, uint64_t))(v28 + 8);
            v71(v62, v60);

          }
          v76 = (void *)ATPayload.question.getter(v75);
          v77 = v79;
          v84(v79, v59, v60);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v77, 0, 1, v60);
          ATQuestion.expirationDate.setter(v77);

          v71(v59, v60);
          (*(void (**)(char *, uint64_t))(v86 + 8))(v81, v34);
          goto LABEL_10;
        }
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v37, v34);
        v40 = &qword_100024AC8;
        v41 = v38;
        goto LABEL_9;
      }
    }
    else
    {
      v36 = v84;
      (*(void (**)(uint64_t (*)(_QWORD, _QWORD, _QWORD), uint64_t, uint64_t, uint64_t))(v86 + 56))(v84, 1, 1, v85);
    }
    v40 = &qword_100024D40;
    v41 = (uint64_t)v36;
LABEL_9:
    sub_100003DB0(v41, v40);
  }
LABEL_10:
  if (qword_1000247B8 != -1)
    swift_once(&qword_1000247B8, sub_10000A728);
  v42 = type metadata accessor for Logger(0);
  sub_100008FF0(v42, (uint64_t)qword_1000251B0);
  v43 = v92;
  v44 = Logger.logObject.getter(v43);
  v45 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = swift_slowAlloc(32, -1);
    v47 = (uint64_t *)swift_slowAlloc(8, -1);
    v48 = swift_slowAlloc(64, -1);
    v95 = v48;
    *(_DWORD *)v46 = 136315650;
    v49 = ATPayload.messageGUID.getter();
    v51 = v50;
    v93 = sub_10001082C(v49, v50, &v95);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v46 + 4, v46 + 12);

    v52 = swift_bridgeObjectRelease(v51);
    *(_WORD *)(v46 + 12) = 2080;
    v53 = ATPayload.clientBundleIdentifier.getter(v52);
    if (v54)
    {
      v55 = v54;
    }
    else
    {
      v53 = 7104878;
      v55 = 0xE300000000000000;
    }
    v93 = sub_10001082C(v53, v55, &v95);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v46 + 14, v46 + 22);

    v56 = swift_bridgeObjectRelease(v55);
    *(_WORD *)(v46 + 22) = 2112;
    v57 = ATPayload.question.getter(v56);
    v93 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94, v46 + 24, v46 + 32);
    *v47 = v57;

    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Parsed AskTo payload from MSMessage. Messages GUID: %s, clientBundleIdentifier: %s question: %@", (uint8_t *)v46, 0x20u);
    v58 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v47, 1, v58);
    swift_slowDealloc(v47, -1, -1);
    swift_arrayDestroy(v48, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v46, -1, -1);

  }
  else
  {

  }
  return v92;
}

void sub_10000F17C(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  SEL *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  void *v67;
  char *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  Class isa;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;

  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100008FF0(v5, (uint64_t)qword_100025198);
  v7 = v2;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v97 = a2;
    v10 = swift_slowAlloc(22, -1);
    v11 = swift_slowAlloc(64, -1);
    v101 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = *(void **)&v7[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v12)
    {
      v13 = v12;
      v14 = ATPayload.messageGUID.getter();
      v16 = v15;

    }
    else
    {
      v16 = 0xE600000000000000;
      v14 = 0x3E656E6F6E3CLL;
    }
    v100 = sub_10001082C(v14, v16, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v16);
    *(_WORD *)(v10 + 12) = 2080;
    v100 = sub_10001082C(0xD000000000000023, 0x800000010001C4D0, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v10 + 14, v10 + 22);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: %s called", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v11, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    a2 = v97;
    v17 = (SEL *)&unk_100024000;
    if (a1)
      goto LABEL_15;
  }
  else
  {

    v17 = (SEL *)&unk_100024000;
    if (a1)
    {
LABEL_15:
      v45 = v7;
      v46 = a1;
      v47 = Logger.logObject.getter(v46);
      v48 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v47, v48))
      {
        v95 = v6;
        v99 = a2;
        v49 = (uint8_t *)swift_slowAlloc(12, -1);
        v50 = swift_slowAlloc(32, -1);
        v101 = v50;
        *(_DWORD *)v49 = 136315138;
        v51 = *(void **)&v45[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
        if (v51)
        {
          v52 = v51;
          v53 = ATPayload.messageGUID.getter();
          v55 = v54;

        }
        else
        {
          v55 = 0xE600000000000000;
          v53 = 0x3E656E6F6E3CLL;
        }
        v100 = sub_10001082C(v53, v55, &v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v49 + 4, v49 + 12);

        swift_bridgeObjectRelease(v55);
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "%s: Removing existing child view controller", v49, 0xCu);
        swift_arrayDestroy(v50, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1, -1);
        swift_slowDealloc(v49, -1, -1);

        a2 = v99;
      }
      else
      {

      }
      objc_msgSend(v46, "willMoveToParentViewController:", 0, v95);
      v17 = (SEL *)&unk_100024000;
      v66 = objc_msgSend(v46, "view");
      if (!v66)
      {
        __break(1u);
        return;
      }
      v67 = v66;
      objc_msgSend(v66, "removeFromSuperview");

      objc_msgSend(v46, "removeFromParentViewController");
      if (!a2)
        goto LABEL_29;
      goto LABEL_8;
    }
  }
  if (!a2)
  {
LABEL_29:
    v68 = v7;
    v69 = Logger.logObject.getter(v68);
    v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(12, -1);
      v72 = swift_slowAlloc(32, -1);
      v101 = v72;
      *(_DWORD *)v71 = 136315138;
      v73 = *(void **)&v68[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
      if (v73)
      {
        v74 = v73;
        v75 = ATPayload.messageGUID.getter();
        v77 = v76;

      }
      else
      {
        v77 = 0xE600000000000000;
        v75 = 0x3E656E6F6E3CLL;
      }
      v100 = sub_10001082C(v75, v77, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v71 + 4, v71 + 12);

      swift_bridgeObjectRelease(v77);
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "%s: Received request to replace child view controller with nil.", v71, 0xCu);
      swift_arrayDestroy(v72, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v72, -1, -1);
      swift_slowDealloc(v71, -1, -1);

    }
    else
    {

    }
    return;
  }
LABEL_8:
  v18 = a2;
  v19 = objc_msgSend(v7, v17[130]);
  if (!v19)
    goto LABEL_20;
  v20 = v19;
  v21 = objc_msgSend(v18, v17[130]);
  if (!v21)
  {

LABEL_20:
    v56 = v7;
    v57 = Logger.logObject.getter(v56);
    v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc(12, -1);
      v60 = swift_slowAlloc(32, -1);
      v101 = v60;
      *(_DWORD *)v59 = 136315138;
      v61 = *(void **)&v56[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
      if (v61)
      {
        v62 = v61;
        v63 = ATPayload.messageGUID.getter();
        v65 = v64;

      }
      else
      {
        v65 = 0xE600000000000000;
        v63 = 0x3E656E6F6E3CLL;
      }
      v100 = sub_10001082C(v63, v65, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v59 + 4, v59 + 12);

      swift_bridgeObjectRelease(v65);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "%s: Missing views. Not adding new child view controller to view hierarchy.", v59, 0xCu);
      swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v60, -1, -1);
      swift_slowDealloc(v59, -1, -1);

    }
    else
    {

    }
    return;
  }
  v22 = v21;
  v98 = v18;
  objc_msgSend(v7, "addChildViewController:", v18);
  v23 = (void *)objc_opt_self(UIColor);
  v24 = objc_msgSend(v23, "systemGray5Color");
  objc_msgSend(v20, "setBackgroundColor:", v24);

  v25 = objc_msgSend(v23, "clearColor");
  objc_msgSend(v22, "setBackgroundColor:", v25);

  objc_msgSend(v22, "setMinimumContentSizeCategory:", UIContentSizeCategorySmall);
  objc_msgSend(v22, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraLarge);
  objc_msgSend(v20, "addSubview:", v22);
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "_balloonMaskEdgeInsets");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = v7;
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc(52, -1);
    v38 = swift_slowAlloc(32, -1);
    v101 = v38;
    *(_DWORD *)v37 = 136316162;
    v39 = v34;
    v40 = *(void **)&v34[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    v96 = v38;
    if (v40)
    {
      v41 = v40;
      v42 = ATPayload.messageGUID.getter();
      v44 = v43;

    }
    else
    {
      v44 = 0xE600000000000000;
      v42 = 0x3E656E6F6E3CLL;
    }
    v100 = sub_10001082C(v42, v44, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v37 + 4, v37 + 12);
    v34 = v39;

    swift_bridgeObjectRelease(v44);
    *(_WORD *)(v37 + 12) = 2048;
    v100 = *(_QWORD *)&v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v37 + 14, v37 + 22);
    *(_WORD *)(v37 + 22) = 2048;
    v100 = *(_QWORD *)&v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v37 + 24, v37 + 32);
    *(_WORD *)(v37 + 32) = 2048;
    v100 = *(_QWORD *)&v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v37 + 34, v37 + 42);
    *(_WORD *)(v37 + 42) = 2048;
    v100 = *(_QWORD *)&v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v37 + 44, v37 + 52);
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s: Adding insets to child view: {%f, %f, %f, %f}", (uint8_t *)v37, 0x34u);
    swift_arrayDestroy(v96, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v96, -1, -1);
    swift_slowDealloc(v37, -1, -1);

  }
  else
  {

  }
  v78 = (void *)objc_opt_self(NSLayoutConstraint);
  v79 = sub_1000039D8(&qword_100024B80);
  v80 = swift_allocObject(v79, 64, 7);
  *(_OWORD *)(v80 + 16) = xmmword_10001B3B0;
  v81 = objc_msgSend(v22, "leadingAnchor");
  v82 = objc_msgSend(v20, "leadingAnchor");
  v83 = objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, v29);

  *(_QWORD *)(v80 + 32) = v83;
  v84 = objc_msgSend(v20, "trailingAnchor");
  v85 = objc_msgSend(v22, "trailingAnchor");
  v86 = objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, v33);

  *(_QWORD *)(v80 + 40) = v86;
  v87 = objc_msgSend(v22, "topAnchor");
  v88 = objc_msgSend(v20, "topAnchor");
  v89 = objc_msgSend(v87, "constraintEqualToAnchor:constant:", v88, v27);

  *(_QWORD *)(v80 + 48) = v89;
  v90 = objc_msgSend(v20, "bottomAnchor");
  v91 = objc_msgSend(v22, "bottomAnchor");
  v92 = objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, v31);

  *(_QWORD *)(v80 + 56) = v92;
  v101 = v80;
  specialized Array._endMutation()();
  v93 = v101;
  sub_100011800(0, &qword_100024D30, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v93);
  objc_msgSend(v78, "activateConstraints:", isa);

  objc_msgSend(v98, "didMoveToParentViewController:", v34);
}

void sub_10000FD88(char a1)
{
  char *v1;
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  char v13;

  v2 = v1;
  v3 = a1 & 1;
  v4 = *(_QWORD *)&v1[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer];
  v5 = *(void **)(v4 + 16);
  v6 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 16) = 0;
  v7 = v6;

  v8 = objc_allocWithZone((Class)sub_1000039D8(&qword_100024D28));
  v8[*(_QWORD *)(qword_100025188 + (swift_isaMask & *(_QWORD *)v8) + 16)] = 0;
  v13 = v3;
  v9 = UIHostingController.init(rootView:)(&v13);
  v10 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v9;

  v11 = *(void **)(v4 + 24);
  v12 = v11;
  sub_10000F17C(v6, v11);

  objc_msgSend(v2, "requestResize");
}

id sub_10000FEC4(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  NSString v13;
  objc_class *v14;
  id v15;
  objc_super v17;
  _QWORD v18[5];

  v6 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  v18[3] = &type metadata for AskToBalloonContentFactory;
  v18[4] = &off_1000211D0;
  v7 = type metadata accessor for BalloonContentContainer();
  v8 = (_QWORD *)swift_allocObject(v7, 72, 7);
  v9 = sub_100011590((uint64_t)v18, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v9);
  (*(void (**)(void))(v10 + 16))();
  v8[7] = &type metadata for AskToBalloonContentFactory;
  v8[8] = &off_1000211D0;
  v8[2] = 0;
  v8[3] = 0;
  v11 = v3;
  sub_10000A878(v18);
  *(_QWORD *)&v3[v6] = v8;
  v12 = &v11[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[32] = 1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload] = 0;

  if (a2)
  {
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v13 = 0;
  }
  v14 = (objc_class *)type metadata accessor for MessagesViewController();
  v17.receiver = v11;
  v17.super_class = v14;
  v15 = objc_msgSendSuper2(&v17, "initWithNibName:bundle:", v13, a3);

  return v15;
}

id sub_100010088(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  objc_class *v10;
  id v11;
  objc_super v13;
  _QWORD v14[5];

  v3 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  v14[3] = &type metadata for AskToBalloonContentFactory;
  v14[4] = &off_1000211D0;
  v4 = type metadata accessor for BalloonContentContainer();
  v5 = (_QWORD *)swift_allocObject(v4, 72, 7);
  v6 = sub_100011590((uint64_t)v14, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v6);
  (*(void (**)(void))(v7 + 16))();
  v5[7] = &type metadata for AskToBalloonContentFactory;
  v5[8] = &off_1000211D0;
  v5[2] = 0;
  v5[3] = 0;
  v8 = v1;
  sub_10000A878(v14);
  *(_QWORD *)&v1[v3] = v5;
  v9 = &v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload] = 0;

  v10 = (objc_class *)type metadata accessor for MessagesViewController();
  v13.receiver = v8;
  v13.super_class = v10;
  v11 = objc_msgSendSuper2(&v13, "initWithCoder:", a1);

  return v11;
}

id sub_1000101D8(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  objc_class *v10;
  objc_super v12;
  _QWORD v13[5];

  v3 = OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_balloonContentContainer;
  v13[3] = &type metadata for AskToBalloonContentFactory;
  v13[4] = &off_1000211D0;
  v4 = type metadata accessor for BalloonContentContainer();
  v5 = (_QWORD *)swift_allocObject(v4, 72, 7);
  v6 = sub_100011590((uint64_t)v13, (uint64_t)&type metadata for AskToBalloonContentFactory);
  __chkstk_darwin(v6);
  (*(void (**)(void))(v7 + 16))();
  v5[7] = &type metadata for AskToBalloonContentFactory;
  v5[8] = &off_1000211D0;
  v5[2] = 0;
  v5[3] = 0;
  v8 = v1;
  sub_10000A878(v13);
  *(_QWORD *)&v1[v3] = v5;
  v9 = &v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_cachedSizeInfo];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  v9[32] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_recipientAddresses] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload] = 0;

  v10 = (objc_class *)type metadata accessor for MessagesViewController();
  v12.receiver = v8;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, "initWithShouldBeSheetPresentationControllerDelegate:", a1 & 1);
}

id sub_10001031C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessagesViewController()
{
  return objc_opt_self(_TtC22AskToMessagesExtension22MessagesViewController);
}

void sub_1000103B4(int64_t *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  int64_t *v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  NSArray v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  Class isa;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t *v41;
  id v42;
  uint64_t v43;
  uint64_t aBlock[5];
  uint64_t v45;

  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v7 = type metadata accessor for Logger(0);
  sub_100008FF0(v7, (uint64_t)qword_100025198);
  v8 = v3;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v41 = a1;
    v11 = swift_slowAlloc(22, -1);
    v12 = swift_slowAlloc(64, -1);
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136315394;
    v13 = *(void **)&v8[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v13)
    {
      v14 = v13;
      v15 = ATPayload.messageGUID.getter();
      v17 = v16;

    }
    else
    {
      v17 = 0xE600000000000000;
      v15 = 0x3E656E6F6E3CLL;
    }
    v43 = sub_10001082C(v15, v17, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, aBlock, v11 + 4, v11 + 12);

    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v11 + 12) = 2080;
    v43 = sub_10001082C(0xD00000000000001BLL, 0x800000010001C7F0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, aBlock, v11 + 14, v11 + 22);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s: %s called", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    a1 = v41;
  }
  else
  {

  }
  v42 = v8;
  v18 = a1[2];
  v19 = &_swiftEmptyArrayStorage;
  if (v18)
  {
    v39 = a3;
    v40 = a2;
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_100010EA8(0, v18, 0);
    v19 = (_QWORD *)aBlock[0];
    v20 = a1;
    v21 = a1 + 5;
    v22 = v18;
    do
    {
      v24 = *(v21 - 1);
      v23 = *v21;
      aBlock[0] = (uint64_t)v19;
      v25 = v19[2];
      v26 = v19[3];
      swift_bridgeObjectRetain(v23);
      if (v25 >= v26 >> 1)
      {
        sub_100010EA8(v26 > 1, v25 + 1, 1);
        v19 = (_QWORD *)aBlock[0];
      }
      v21 += 3;
      v19[2] = v25 + 1;
      v27 = (char *)&v19[2 * v25];
      *((_QWORD *)v27 + 4) = v24;
      *((_QWORD *)v27 + 5) = v23;
      --v22;
    }
    while (v22);
    a3 = v39;
    a1 = v20;
    a2 = v40;
  }
  v28.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  v29 = &_swiftEmptyArrayStorage;
  if (v18)
  {
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v18);
    v30 = a1 + 6;
    do
    {
      v31 = *v30;
      v30 += 3;
      v32 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v31);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v33 = *(_QWORD *)(aBlock[0] + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v33);
      v34 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v32);
      specialized ContiguousArray._endMutation()(v34);
      --v18;
    }
    while (v18);
    v29 = (void *)aBlock[0];
  }
  sub_100011800(0, &qword_100024D98, NSNumber_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v29);
  v36 = swift_allocObject(&unk_100021410, 32, 7);
  *(_QWORD *)(v36 + 16) = a2;
  *(_QWORD *)(v36 + 24) = a3;
  aBlock[4] = (uint64_t)sub_100011558;
  v45 = v36;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000107F0;
  aBlock[3] = (uint64_t)&unk_100021428;
  v37 = _Block_copy(aBlock);
  v38 = v45;
  swift_retain(a3);
  swift_release(v38);
  objc_msgSend(v42, "_presentAlertSheetWith:styles:completion:", v28.super.isa, isa, v37);
  _Block_release(v37);

}

uint64_t sub_1000107F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10001082C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000108FC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100010E6C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100010E6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A878(v12);
  return v7;
}

uint64_t sub_1000108FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100010AB4(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100010AB4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100010B48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100010D20(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100010D20(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100010B48(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100010CBC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100010CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000039D8(&qword_100024D38);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100010D20(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000039D8(&qword_100024D38);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100010E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010EA8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100010EC4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100010EC4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_1000039D8(&qword_100024DA0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001102C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = type metadata accessor for ATURL.Parser(0);
  v35 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000039D8(&qword_100024D40);
  __chkstk_darwin(v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v35 - v14;
  v16 = type metadata accessor for ATPayload(0);
  if (qword_1000247A8 != -1)
    goto LABEL_19;
  while (1)
  {
    v17 = *((_QWORD *)off_100024AD0 + 2);
    if (!v17)
    {
LABEL_9:
      v37 = v16;
      v20 = sub_1000039D8(&qword_100024B70);
      v21 = String.init<A>(describing:)(&v37, v20);
      v23 = v22;
      v24 = sub_10000A070();
      swift_allocError(&type metadata for MessageParser.Error, v24, 0, 0);
      *(_QWORD *)v25 = v21;
      *(_QWORD *)(v25 + 8) = v23;
      *(_BYTE *)(v25 + 16) = 0;
      return swift_willThrow();
    }
    if (*((_QWORD *)off_100024AD0 + 4) == v16)
      break;
    if (v17 == 1)
      goto LABEL_9;
    v18 = 5;
    while (1)
    {
      v19 = v18 - 3;
      if (__OFADD__(v18 - 4, 1))
        break;
      if (*((_QWORD *)off_100024AD0 + v18) == v16)
        goto LABEL_10;
      ++v18;
      if (v19 == v17)
        goto LABEL_9;
    }
    __break(1u);
LABEL_19:
    swift_once(&qword_1000247A8, sub_100009D80);
  }
LABEL_10:
  v26 = objc_msgSend(a1, "URL", v35, v36);
  if (!v26)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_15;
  }
  v27 = v26;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v28 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v28(v8, v13, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_15:
    sub_100003DB0((uint64_t)v8, &qword_100024D40);
    v33 = sub_10000A070();
    swift_allocError(&type metadata for MessageParser.Error, v33, 0, 0);
    *(_QWORD *)v34 = 0;
    *(_QWORD *)(v34 + 8) = 0;
    *(_BYTE *)(v34 + 16) = 2;
    return swift_willThrow();
  }
  v29 = ((uint64_t (*)(char *, char *, uint64_t))v28)(v15, v8, v9);
  ATURL.Parser.init()(v29);
  v30 = sub_10000893C(&qword_100024D50, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v31 = sub_10000893C(&qword_100024D58, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  ATURL.Parser.parse<A>(_:from:)(&v37, v16, v15, v16, v30, v31);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v36);
  if (v1)
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  return v37;
}

_BYTE *sub_1000113A8@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
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

uint64_t sub_100011414(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100011428(result, a2);
  return result;
}

uint64_t sub_100011428(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001146C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_1000114B0(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000114D8(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_1000114FC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_100011520()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 32);
  if (result)
    return objc_msgSend(result, "drawViewHierarchyInRect:afterScreenUpdates:", 1, 0.0, 0.0, *(double *)(v0 + 16), *(double *)(v0 + 24));
  return result;
}

uint64_t sub_100011548()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011558()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100011578(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011588(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011590(uint64_t a1, uint64_t a2)
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

void sub_1000115B8(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_1000247B0 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v3 = type metadata accessor for Logger(0);
  sub_100008FF0(v3, (uint64_t)qword_100025198);
  v4 = v1;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v16 = v8;
    *(_DWORD *)v7 = 136315394;
    v9 = *(void **)&v4[OBJC_IVAR____TtC22AskToMessagesExtension22MessagesViewController_payload];
    if (v9)
    {
      v10 = v9;
      v11 = ATPayload.messageGUID.getter();
      v13 = v12;

    }
    else
    {
      v13 = 0xE600000000000000;
      v11 = 0x3E656E6F6E3CLL;
    }
    v15 = sub_10001082C(v11, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v13);
    *(_WORD *)(v7 + 12) = 2080;
    v15 = sub_10001082C(0xD00000000000001BLL, 0x800000010001C780, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v7 + 14, v7 + 22);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: %s called", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  v14 = objc_msgSend(a1, "selectedMessage");
  sub_10000B4D4(v14, a1);

}

uint64_t sub_100011800(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100011838()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void **sub_100011864(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  uint64_t v18;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain(v4);
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (void **)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *v9 = *(void **)((char *)a2 + v8);
    v9[1] = v11;
    v12 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
    v13 = (char *)v9 + v12;
    v14 = &v10[v12];
    v15 = type metadata accessor for UUID(0);
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    v17 = v4;
    swift_bridgeObjectRetain(v11);
    v16(v13, v14, v15);
    v18 = *(int *)(a3 + 24);
    *(_QWORD *)(swift_unknownObjectWeakCopyInit((char *)v7 + v18, (char *)a2 + v18) + 8) = *(void **)((char *)a2 + v18 + 8);
  }
  return v7;
}

uint64_t sub_100011950(id *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease(*((_QWORD *)v4 + 1));
  v5 = &v4[*(int *)(type metadata accessor for MessagesMetadata(0) + 20)];
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_unknownObjectWeakDestroy((char *)a1 + *(int *)(a2 + 24));
}

void **sub_1000119C4(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;
  uint64_t v17;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (void **)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  *v8 = *(void **)((char *)a2 + v7);
  v8[1] = v10;
  v11 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v12 = (char *)v8 + v11;
  v13 = &v9[v11];
  v14 = type metadata accessor for UUID(0);
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v16 = v6;
  swift_bridgeObjectRetain(v10);
  v15(v12, v13, v14);
  v17 = *(int *)(a3 + 24);
  *(_QWORD *)(swift_unknownObjectWeakCopyInit((char *)a1 + v17, (char *)a2 + v17) + 8) = *(void **)((char *)a2 + v17 + 8);
  return a1;
}

void **sub_100011A88(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (void **)((char *)a1 + v9);
  v11 = (char *)a2 + v9;
  *v10 = *(void **)((char *)a2 + v9);
  v12 = *(uint64_t *)((char *)a2 + v9 + 8);
  v13 = *(uint64_t *)((char *)a1 + v9 + 8);
  v10[1] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  v14 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v15 = (char *)v10 + v14;
  v16 = &v11[v14];
  v17 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = *(int *)(a3 + 24);
  *(_QWORD *)(swift_unknownObjectWeakCopyAssign((char *)a1 + v18, (char *)a2 + v18) + 8) = *(void **)((char *)a2 + v18 + 8);
  return a1;
}

_QWORD *sub_100011B50(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_OWORD *)((char *)a1 + v6) = *(_OWORD *)((char *)a2 + v6);
  v9 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v10 = &v7[v9];
  v11 = &v8[v9];
  v12 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  *(_QWORD *)(swift_unknownObjectWeakTakeInit((char *)a1 + v13, (char *)a2 + v13) + 8) = *(_QWORD *)((char *)a2 + v13 + 8);
  return a1;
}

void **sub_100011BF4(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (void **)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7 + 8);
  v11 = *(uint64_t *)((char *)a1 + v7 + 8);
  *v8 = *(void **)((char *)a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(int *)(type metadata accessor for MessagesMetadata(0) + 20);
  v13 = (char *)v8 + v12;
  v14 = &v9[v12];
  v15 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = *(int *)(a3 + 24);
  *(_QWORD *)(swift_unknownObjectWeakTakeAssign((char *)a1 + v16, (char *)a2 + v16) + 8) = *(void **)((char *)a2 + v16 + 8);
  return a1;
}

uint64_t sub_100011CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011CB4);
}

uint64_t sub_100011CB4(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for MessagesMetadata(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_100011D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011D3C);
}

char *sub_100011D3C(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for MessagesMetadata(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for MessagesContext(uint64_t a1)
{
  uint64_t result;

  result = qword_100024E00;
  if (!qword_100024E00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MessagesContext);
  return result;
}

uint64_t sub_100011DEC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for MessagesMetadata(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_10001B448;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100011E6C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10001B540);
  v2 = swift_getKeyPath(&unk_10001B568);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_100011EE0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_10001B4F8);
  v2 = swift_getKeyPath(&unk_10001B520);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

void sub_100011F50(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = sub_1000039D8(&qword_100024F40);
  __chkstk_darwin(v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_10001B4F8);
  v9 = swift_getKeyPath(&unk_10001B520);
  static Published.subscript.getter(&v21, v2, KeyPath, v9);
  swift_release(KeyPath);
  swift_release(v9);
  if ((v21 & 1) != 0)
  {
    if (qword_1000247C8 != -1)
      swift_once(&qword_1000247C8, sub_10000A77C);
    v10 = type metadata accessor for Logger(0);
    sub_100008FF0(v10, (uint64_t)qword_1000251E0);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Not sending response because one is already in-flight.", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

  }
  else
  {
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
    v15 = (_QWORD *)swift_allocObject(&unk_100021478, 56, 7);
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v2;
    v15[5] = a1;
    v15[6] = a2;
    swift_retain(v2);
    v16 = a1;
    v17 = a2;
    v18 = sub_100013E64((uint64_t)v7, (uint64_t)&unk_100024F50, (uint64_t)v15);
    v19 = *(_QWORD *)(v2 + 16);
    *(_QWORD *)(v2 + 16) = v18;
    swift_release(v19);
  }
}

uint64_t sub_100012144()
{
  return 1;
}

Swift::Int sub_10001214C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10001218C()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_1000121B0(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

unint64_t sub_1000121EC()
{
  return 0xD00000000000003FLL;
}

uint64_t sub_100012208@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  char v9;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10001B540);
  v5 = swift_getKeyPath(&unk_10001B568);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v9;
  *(_QWORD *)a2 = v8;
  *(_BYTE *)(a2 + 8) = v7;
  return result;
}

uint64_t sub_10001228C(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t KeyPath;
  uint64_t v6;
  void *v8;
  unsigned __int8 v9;

  v2 = *(void **)a1;
  v3 = *a2;
  v4 = *(_BYTE *)(a1 + 8);
  KeyPath = swift_getKeyPath(&unk_10001B540);
  v6 = swift_getKeyPath(&unk_10001B568);
  v8 = v2;
  v9 = v4;
  sub_100015774(v2, v4);
  swift_retain(v3);
  return static Published.subscript.setter(&v8, v3, KeyPath, v6);
}

uint64_t sub_100012318(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v15;
  char v16;
  char v17;

  v3 = sub_1000039D8(&qword_100024F38);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000039D8(&qword_100024F30);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = 0;
  v11 = v1 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__isWaitingForSendResult;
  v17 = 0;
  Published.init(initialValue:)(&v17, &type metadata for Bool);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  v12 = v1 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__sendResult;
  v15 = 0;
  v16 = -1;
  v13 = sub_1000039D8((uint64_t *)&unk_100024E98);
  Published.init(initialValue:)(&v15, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v12, v6, v3);
  sub_100015634(a1, v1 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext);
  return v1;
}

uint64_t sub_100012470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  return swift_task_switch(sub_10001248C, 0, 0);
}

uint64_t sub_10001248C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 56);
  KeyPath = swift_getKeyPath(&unk_10001B4F8);
  v3 = swift_getKeyPath(&unk_10001B520);
  *(_BYTE *)(v0 + 25) = 1;
  swift_retain(v1);
  static Published.subscript.setter(v0 + 25, v1, KeyPath, v3);
  v4 = (_QWORD *)swift_task_alloc(dword_100024F5C);
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_100012530;
  return sub_1000128C0(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_100012530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100012668;
  else
    v3 = sub_100012594;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100012594()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t KeyPath;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v0 + 64);
  KeyPath = swift_getKeyPath(&unk_10001B540);
  v4 = swift_getKeyPath(&unk_10001B568);
  *(_QWORD *)(v0 + 32) = v2;
  *(_BYTE *)(v0 + 40) = 0;
  swift_retain(v1);
  v5 = v2;
  static Published.subscript.setter(v0 + 32, v1, KeyPath, v4);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = swift_getKeyPath(&unk_10001B4F8);
  v8 = swift_getKeyPath(&unk_10001B520);
  *(_BYTE *)(v0 + 26) = 0;
  swift_retain(v6);
  static Published.subscript.setter(v0 + 26, v6, v7, v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_1000247C8 != -1)
    swift_once(&qword_1000247C8, sub_10000A77C);
  v1 = *(_QWORD *)(v0 + 88);
  v2 = type metadata accessor for Logger(0);
  sub_100008FF0(v2, (uint64_t)qword_1000251E0);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 88);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    swift_errorRetain(v7);
    v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(_QWORD *)(v0 + 48) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v8 + 4, v8 + 12);
    *v9 = v10;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error sending response: %@", v8, 0xCu);
    v11 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 88));
    swift_errorRelease(v7);
  }
  v12 = *(_QWORD *)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 56);

  KeyPath = swift_getKeyPath(&unk_10001B540);
  v15 = swift_getKeyPath(&unk_10001B568);
  *(_QWORD *)(v0 + 16) = v12;
  *(_BYTE *)(v0 + 24) = 1;
  swift_retain(v13);
  static Published.subscript.setter(v0 + 16, v13, KeyPath, v15);
  v16 = *(_QWORD *)(v0 + 56);
  v17 = swift_getKeyPath(&unk_10001B4F8);
  v18 = swift_getKeyPath(&unk_10001B520);
  *(_BYTE *)(v0 + 26) = 0;
  swift_retain(v16);
  static Published.subscript.setter(v0 + 26, v16, v17, v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000128C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  v4 = type metadata accessor for UUID(0);
  v3[16] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[17] = v5;
  v3[18] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (*(_QWORD *)(*(_QWORD *)(sub_1000039D8(&qword_100024D40) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[19] = swift_task_alloc(v6);
  v3[20] = swift_task_alloc(v6);
  v7 = sub_1000039D8(&qword_100024D80);
  v3[21] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001297C, 0, 0);
}

uint64_t sub_10001297C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43[2];

  v1 = *(void **)(v0 + 104);
  v2 = *(void **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  type metadata accessor for ATPayload(0);
  v4 = OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext;
  *(_QWORD *)(v0 + 176) = OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext;
  v5 = (void **)(v3 + v4);
  v6 = *v5;
  *(_QWORD *)(v0 + 184) = *v5;
  v7 = (void *)ATPayload.__allocating_init(originalPayload:newResponse:)(v6, v1);
  *(_QWORD *)(v0 + 192) = v7;
  v8 = *(int *)(type metadata accessor for MessagesContext(0) + 20);
  *(_DWORD *)(v0 + 264) = v8;
  v9 = (uint64_t *)((char *)v5 + v8);
  v10 = *v9;
  *(_QWORD *)(v0 + 200) = *v9;
  v11 = v9[1];
  *(_QWORD *)(v0 + 208) = v11;
  swift_bridgeObjectRetain(v11);
  v12 = objc_msgSend(v2, "recipientAddresses");
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  *(_QWORD *)(v0 + 216) = v13;

  if (qword_1000247C8 != -1)
    swift_once(&qword_1000247C8, sub_10000A77C);
  v14 = type metadata accessor for Logger(0);
  *(_QWORD *)(v0 + 224) = sub_100008FF0(v14, (uint64_t)qword_1000251E0);
  swift_bridgeObjectRetain_n(v11, 2);
  swift_bridgeObjectRetain_n(v13, 2);
  v15 = v7;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(32, -1);
    v41 = (_QWORD *)swift_slowAlloc(8, -1);
    v42 = swift_slowAlloc(64, -1);
    v43[0] = v42;
    *(_DWORD *)v18 = 136315650;
    swift_bridgeObjectRetain(v11);
    *(_QWORD *)(v0 + 80) = sub_10001082C(v10, v11, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease_n(v11, 3);
    *(_WORD *)(v18 + 12) = 2080;
    v19 = swift_bridgeObjectRetain(v13);
    v20 = Array.description.getter(v19, &type metadata for String);
    v22 = v21;
    swift_bridgeObjectRelease(v13);
    *(_QWORD *)(v0 + 88) = sub_10001082C(v20, v22, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease_n(v13, 2);
    *(_WORD *)(v18 + 22) = 2112;
    *(_QWORD *)(v0 + 96) = v15;
    v23 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v18 + 24, v18 + 32);
    *v41 = v15;

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s: Calling into daemon to send response payload. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v18, 0x20u);
    v24 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v41, 1, v24);
    swift_slowDealloc(v41, -1, -1);
    swift_arrayDestroy(v42, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v11, 2);
    swift_bridgeObjectRelease_n(v13, 2);

  }
  v26 = ATPayload.response.getter(v25);
  *(_QWORD *)(v0 + 232) = v26;
  if (v26)
  {
    v27 = ATPayload.clientBundleIdentifier.getter(v26);
    v29 = v28;
    v30 = (void *)ATPayload.question.getter(v27);
    v31 = (void *)ATQuestion.topic.getter();

    static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v27, v29, v31, 300);
    swift_bridgeObjectRelease(v29);
    v32 = type metadata accessor for ATDaemonConnectionManager(0);
    swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
    *(_QWORD *)(v0 + 240) = ATDaemonConnectionManager.init()();
    v33 = (_QWORD *)swift_task_alloc(async function pointer to ATDaemonConnectionManager.sendResponse(_:to:)[1]);
    *(_QWORD *)(v0 + 248) = v33;
    *v33 = v0;
    v33[1] = sub_100012E38;
    return ATDaemonConnectionManager.sendResponse(_:to:)(v15, v13);
  }
  else
  {
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v13);
    v35 = sub_100015798();
    v36 = swift_allocError(&type metadata for ResponseSender.Error, v35, 0, 0);
    swift_willThrow(v36);
    v38 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 168);
    v40 = *(_QWORD *)(v0 + 144);
    v39 = *(_QWORD *)(v0 + 152);

    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100012E38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 248);
  *(_QWORD *)(*v1 + 256) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 216));
    v4 = sub_100013B08;
  }
  else
  {
    v4 = sub_100012EA4;
  }
  return swift_task_switch(v4, 0, 0);
}

void sub_100012EA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  Class isa;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSString v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  NSString v72;
  id v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  NSData v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  os_log_type_t v91;
  _BOOL4 v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _BOOL8 v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  _QWORD *v140;
  uint64_t v141;
  os_log_t log;
  _QWORD *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150[2];

  v2 = *(_QWORD *)(v1 + 216);
  v3 = *(_QWORD *)(v1 + 208);
  v4 = *(void **)(v1 + 192);
  v5 = ATPayload.clientBundleIdentifier.getter(a1);
  v7 = v6;
  v8 = (void *)ATPayload.question.getter(v5);
  v9 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v5, v7, v9, 1000);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRetain_n(v3, 2);
  swift_bridgeObjectRetain_n(v2, 2);
  v10 = Logger.logObject.getter(v4);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v13 = *(_QWORD *)(v1 + 208);
    v12 = *(_QWORD *)(v1 + 216);
    v14 = *(_QWORD *)(v1 + 200);
    v145 = *(void **)(v1 + 192);
    v15 = swift_slowAlloc(32, -1);
    v143 = (_QWORD *)swift_slowAlloc(8, -1);
    v148 = swift_slowAlloc(64, -1);
    v150[0] = v148;
    *(_DWORD *)v15 = 136315650;
    swift_bridgeObjectRetain(v13);
    *(_QWORD *)(v1 + 56) = sub_10001082C(v14, v13, v150);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 56, v1 + 64, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease_n(v13, 3);
    *(_WORD *)(v15 + 12) = 2080;
    v16 = swift_bridgeObjectRetain(v12);
    v17 = Array.description.getter(v16, &type metadata for String);
    v19 = v18;
    swift_bridgeObjectRelease(v12);
    *(_QWORD *)(v1 + 64) = sub_10001082C(v17, v19, v150);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease_n(v12, 2);
    *(_WORD *)(v15 + 22) = 2112;
    *(_QWORD *)(v1 + 72) = v145;
    v20 = v145;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v15 + 24, v15 + 32);
    *v143 = v145;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s: Daemon successfully sent response payload over IDS. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v15, 0x20u);
    v21 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v143, 1, v21);
    swift_slowDealloc(v143, -1, -1);
    swift_arrayDestroy(v148, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v148, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    v22 = *(_QWORD *)(v1 + 216);
    v23 = *(void **)(v1 + 192);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 208), 2);
    swift_bridgeObjectRelease_n(v22, 2);

  }
  v24 = *(_QWORD *)(v1 + 168);
  v25 = *(_QWORD *)(v1 + 128);
  v26 = *(_QWORD *)(v1 + 136);
  v27 = *(_QWORD *)(v1 + 120) + *(_QWORD *)(v1 + 176) + *(int *)(v1 + 264);
  v28 = type metadata accessor for MessagesMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v27 + *(int *)(v28 + 20), v25);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25);
  isa = 0;
  if (v29 != 1)
  {
    v31 = *(_QWORD *)(v1 + 168);
    v32 = *(_QWORD *)(v1 + 128);
    v33 = *(_QWORD *)(v1 + 136);
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
  }
  v34 = objc_msgSend(objc_allocWithZone((Class)MSSession), "initWithIdentifier:", isa);

  if (v34)
  {
    v35 = objc_msgSend(*(id *)(v1 + 112), "selectedMessage");
    if (v35)
    {
      v36 = v35;
      v37 = objc_msgSend(v35, "URL");

      v38 = *(_QWORD *)(v1 + 152);
      if (v37)
      {
        static URL._unconditionallyBridgeFromObjectiveC(_:)(v37);

        v39 = type metadata accessor for URL(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 0, 1, v39);
      }
      else
      {
        v42 = type metadata accessor for URL(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v38, 1, 1, v42);
      }
      sub_1000157DC(*(_QWORD *)(v1 + 152), *(_QWORD *)(v1 + 160));
    }
    else
    {
      v40 = *(_QWORD *)(v1 + 160);
      v41 = type metadata accessor for URL(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 1, 1, v41);
    }
    v43 = *(void **)(v1 + 256);
    v44 = sub_100013F98(*(void **)(v1 + 192), v34, *(_QWORD *)(v1 + 160));
    v45 = v43;
    v46 = *(_QWORD *)(v1 + 160);
    if (v43)
    {
      v47 = *(_QWORD *)(v1 + 216);
      sub_100003DB0(v46, &qword_100024D40);

      swift_bridgeObjectRelease(v47);
      v48 = *(_QWORD *)(v1 + 240);
      v49 = *(_QWORD *)(v1 + 208);
      ATDaemonConnectionManager.disconnectIfNecessary()();
      swift_release(v48);
      swift_errorRetain(v45);
      swift_bridgeObjectRetain(v49);
      v50 = swift_errorRetain(v45);
      v51 = Logger.logObject.getter(v50);
      v52 = static os_log_type_t.error.getter();
      v53 = os_log_type_enabled(v51, v52);
      v54 = *(_QWORD *)(v1 + 208);
      if (v53)
      {
        v146 = v45;
        v55 = *(_QWORD *)(v1 + 200);
        v56 = swift_slowAlloc(22, -1);
        v57 = (uint64_t *)swift_slowAlloc(8, -1);
        v58 = swift_slowAlloc(32, -1);
        v150[0] = v58;
        *(_DWORD *)v56 = 136315394;
        swift_bridgeObjectRetain(v54);
        v59 = v55;
        v45 = v146;
        *(_QWORD *)(v1 + 16) = sub_10001082C(v59, v54, v150);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v56 + 4, v56 + 12);
        swift_bridgeObjectRelease_n(v54, 3);
        *(_WORD *)(v56 + 12) = 2112;
        swift_errorRetain(v146);
        v60 = _swift_stdlib_bridgeErrorToNSError(v146);
        *(_QWORD *)(v1 + 24) = v60;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v56 + 14, v56 + 22);
        *v57 = v60;
        swift_errorRelease(v146);
        swift_errorRelease(v146);
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s: Received error from daemon while sending response over IDS: %@", (uint8_t *)v56, 0x16u);
        v61 = sub_1000039D8(&qword_100024AB8);
        swift_arrayDestroy(v57, 1, v61);
        swift_slowDealloc(v57, -1, -1);
        swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v58, -1, -1);
        swift_slowDealloc(v56, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 208), 2);
        swift_errorRelease(v45);
        swift_errorRelease(v45);
      }

      v149 = v45;
    }
    else
    {
      sub_100003DB0(v46, &qword_100024D40);

      v63 = ATPayload.clientBundleIdentifier.getter(v62);
      v65 = v64;
      v66 = (void *)ATPayload.question.getter(v63);
      v67 = (void *)ATQuestion.topic.getter();

      static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v63, v65, v67, 1100);
      swift_bridgeObjectRelease(v65);
      v68 = String._bridgeToObjectiveC()();
      v144 = v44;
      v69 = objc_msgSend(v44, "_pluginPayloadWithAppIconData:appName:allowDataPayloads:", 0, v68, 0);

      ATPayload.messageGUID.getter();
      v71 = v70;
      v72 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v71);
      log = v69;
      v73 = -[NSObject data](v69, "data");
      if (v73)
      {
        v74 = v73;
        v75 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v73);
        v77 = v76;

        v78.super.isa = Data._bridgeToObjectiveC()().super.isa;
        sub_100011428(v75, v77);
      }
      else
      {
        v78.super.isa = 0;
      }
      v80 = *(_QWORD *)(v1 + 216);
      v81 = *(_QWORD *)(v1 + 208);
      v82 = *(void **)(v1 + 192);
      IMSPIUpdatePluginMessageWithGUID(v72, v78.super.isa);

      v84 = ATPayload.clientBundleIdentifier.getter(v83);
      v86 = v85;
      v87 = (void *)ATPayload.question.getter(v84);
      v88 = (void *)ATQuestion.topic.getter();

      static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v84, v86, v88, 1200);
      swift_bridgeObjectRelease(v86);
      v89 = v82;
      swift_bridgeObjectRetain(v81);
      swift_bridgeObjectRetain(v80);
      v90 = Logger.logObject.getter(v89);
      v91 = static os_log_type_t.default.getter();
      v92 = os_log_type_enabled(v90, v91);
      v94 = *(_QWORD *)(v1 + 208);
      v93 = *(_QWORD *)(v1 + 216);
      if (v92)
      {
        v95 = *(void **)(v1 + 192);
        v96 = *(_QWORD *)(v1 + 200);
        v97 = swift_slowAlloc(32, -1);
        v140 = (_QWORD *)swift_slowAlloc(8, -1);
        v141 = swift_slowAlloc(64, -1);
        v150[0] = v141;
        *(_DWORD *)v97 = 136315650;
        swift_bridgeObjectRetain(v94);
        *(_QWORD *)(v1 + 32) = sub_10001082C(v96, v94, v150);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v97 + 4, v97 + 12);
        swift_bridgeObjectRelease_n(v94, 3);
        *(_WORD *)(v97 + 12) = 2080;
        v98 = swift_bridgeObjectRetain(v93);
        v99 = Array.description.getter(v98, &type metadata for String);
        v101 = v100;
        swift_bridgeObjectRelease(v93);
        *(_QWORD *)(v1 + 40) = sub_10001082C(v99, v101, v150);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v1 + 48, v97 + 14, v97 + 22);
        v102 = v101;
        v45 = 0;
        swift_bridgeObjectRelease(v102);
        swift_bridgeObjectRelease_n(v93, 2);
        *(_WORD *)(v97 + 22) = 2112;
        *(_QWORD *)(v1 + 48) = v95;
        v103 = v95;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 48, v1 + 56, v97 + 24, v97 + 32);
        *v140 = v95;

        _os_log_impl((void *)&_mh_execute_header, v90, v91, "%s: Updated Messages DB with response. recipientAddresses: %s, responsePayload: %@", (uint8_t *)v97, 0x20u);
        v104 = sub_1000039D8(&qword_100024AB8);
        swift_arrayDestroy(v140, 1, v104);
        swift_slowDealloc(v140, -1, -1);
        swift_arrayDestroy(v141, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v141, -1, -1);
        swift_slowDealloc(v97, -1, -1);
      }
      else
      {
        v105 = *(void **)(v1 + 192);
        swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 208), 2);
        swift_bridgeObjectRelease_n(v93, 2);

      }
      v106 = *(_QWORD *)(v1 + 240);
      v107 = *(id *)(v1 + 232);
      ATDaemonConnectionManager.disconnectIfNecessary()();
      v79 = swift_release(v106);
      v149 = *(void **)(v1 + 232);
    }
    v108 = (void *)ATPayload.question.getter(v79);
    ATQuestion.systemId.getter();

    v110 = ATPayload.clientBundleIdentifier.getter(v109);
    if (v111)
      v112 = v110;
    else
      v112 = 0x6E776F6E6B6E55;
    if (v111)
      v113 = v111;
    else
      v113 = 0xE700000000000000;
    v114 = ATPayload.rawRecipientGroup.getter(v110);
    v115 = (void *)ATResponse.chosenAnswer.getter(v114);
    v116 = ATAnswerChoice.kind.getter();

    v117 = ATPayload.allResponses.getter();
    if (v117)
    {
      v118 = v117;
      if ((unint64_t)v117 >> 62)
      {
        if (v117 >= 0)
          v117 &= 0xFFFFFFFFFFFFFF8uLL;
        v119 = _CocoaArrayWrapper.endIndex.getter(v117);
      }
      else
      {
        v119 = *(_QWORD *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v118);
    }
    else
    {
      v119 = 0;
    }
    v120 = v45 == 0;
    v121 = *(_QWORD *)(v1 + 136);
    v122 = *(_QWORD *)(v1 + 144);
    v123 = v45;
    v124 = *(_QWORD *)(v1 + 128);
    static Metrics.ResponseSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:rawOriginalRecipientGroup:answerKind:responseCount:)(v122, v112, v113, v120, v114, v116, v119);
    swift_bridgeObjectRelease(v113);
    v125 = (*(uint64_t (**)(uint64_t, uint64_t))(v121 + 8))(v122, v124);
    v126 = *(void **)(v1 + 232);
    if (v123)
    {
      swift_willThrow(v125);

      v128 = *(_QWORD *)(v1 + 160);
      v127 = *(_QWORD *)(v1 + 168);
      v130 = *(_QWORD *)(v1 + 144);
      v129 = *(_QWORD *)(v1 + 152);

      swift_task_dealloc(v127);
      swift_task_dealloc(v128);
      swift_task_dealloc(v129);
      swift_task_dealloc(v130);
    }
    else
    {
      v131 = *(void **)(v1 + 192);
      v133 = *(_QWORD *)(v1 + 160);
      v132 = *(_QWORD *)(v1 + 168);
      v134 = *(_QWORD *)(v1 + 144);
      v147 = *(_QWORD *)(v1 + 152);
      v135 = ATPayload.clientBundleIdentifier.getter(v125);
      v137 = v136;
      v138 = (void *)ATPayload.question.getter(v135);
      v139 = (void *)ATQuestion.topic.getter();

      static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v135, v137, v139, 1300);
      sub_1000095F8(v149, 0);

      swift_bridgeObjectRelease(v137);
      swift_task_dealloc(v132);
      swift_task_dealloc(v133);
      swift_task_dealloc(v147);
      swift_task_dealloc(v134);
    }
    (*(void (**)(void))(v1 + 8))();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100013B08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 208);
  ATDaemonConnectionManager.disconnectIfNecessary()();
  swift_release(v2);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v3);
  v4 = swift_errorRetain(v1);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v8 = *(_QWORD *)(v0 + 200);
    v7 = *(_QWORD *)(v0 + 208);
    v9 = swift_slowAlloc(22, -1);
    v10 = (uint64_t *)swift_slowAlloc(8, -1);
    v36 = swift_slowAlloc(32, -1);
    v37 = v36;
    *(_DWORD *)v9 = 136315394;
    swift_bridgeObjectRetain(v7);
    *(_QWORD *)(v0 + 16) = sub_10001082C(v8, v7, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(v7, 3);
    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain(v1);
    v11 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 24) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v9 + 14, v9 + 22);
    *v10 = v11;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Received error from daemon while sending response over IDS: %@", (uint8_t *)v9, 0x16u);
    v12 = sub_1000039D8(&qword_100024AB8);
    swift_arrayDestroy(v10, 1, v12);
    swift_slowDealloc(v10, -1, -1);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 208), 2);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  v14 = (void *)ATPayload.question.getter(v13);
  ATQuestion.systemId.getter();

  v16 = ATPayload.clientBundleIdentifier.getter(v15);
  v18 = v17;
  v19 = ATPayload.rawRecipientGroup.getter(v16);
  v20 = (void *)ATResponse.chosenAnswer.getter(v19);
  v21 = ATAnswerChoice.kind.getter();

  v22 = ATPayload.allResponses.getter();
  if (v22)
  {
    v23 = v22;
    if ((unint64_t)v22 >> 62)
    {
      if (v22 >= 0)
        v22 &= 0xFFFFFFFFFFFFFF8uLL;
      v24 = _CocoaArrayWrapper.endIndex.getter(v22);
    }
    else
    {
      v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v23);
  }
  else
  {
    v24 = 0;
  }
  if (v18)
  {
    v25 = v16;
  }
  else
  {
    v18 = 0xE700000000000000;
    v25 = 0x6E776F6E6B6E55;
  }
  v27 = *(_QWORD *)(v0 + 136);
  v26 = *(_QWORD *)(v0 + 144);
  v28 = *(_QWORD *)(v0 + 128);
  static Metrics.ResponseSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:rawOriginalRecipientGroup:answerKind:responseCount:)(v26, v25, v18, 0, v19, v21, v24);
  swift_bridgeObjectRelease(v18);
  v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  v30 = *(void **)(v0 + 232);
  swift_willThrow(v29);

  v32 = *(_QWORD *)(v0 + 160);
  v31 = *(_QWORD *)(v0 + 168);
  v34 = *(_QWORD *)(v0 + 144);
  v33 = *(_QWORD *)(v0 + 152);

  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned __int8 v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100003DB0(a1, &qword_100024F40);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v16 = 0;
      return swift_task_create(v8, v16, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v17 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9, v12);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v15 = v14;
  swift_unknownObjectRelease(v9);
  if (!(v15 | v13))
    goto LABEL_6;
  v19[0] = 0;
  v19[1] = 0;
  v16 = v19;
  v19[2] = v13;
  v19[3] = v15;
  return swift_task_create(v8, v16, (char *)&type metadata for () + 8, a2, a3);
}

id sub_100013F98(void *a1, void *a2, uint64_t a3)
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
  char *v27;
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
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  uint8_t *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSString v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSString v67;
  id v68;
  Class isa;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  NSString v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int (*v101)(uint64_t, uint64_t, uint64_t);
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t, uint64_t);
  uint64_t *v109;
  id result;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int (*v116)(char *, uint64_t, uint64_t);
  void (*v117)(char *, uint64_t);
  void (*v118)(char *, char *, uint64_t);
  char *v119;
  uint64_t v120;
  void (*v121)(char *, uint64_t);
  _QWORD *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  unint64_t v130;
  char *v131;
  void (*v132)(char *, char *, uint64_t);
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  unint64_t v139;
  uint64_t v140;
  _BOOL8 v141;
  uint64_t v142;
  char v143;
  unint64_t v144;
  char v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t *v148;
  unint64_t v149;
  uint64_t v150;
  BOOL v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, char *, uint64_t);
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  void (*v161)(char *, uint64_t);
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v168;
  unint64_t v169;
  uint64_t v170;
  _BOOL8 v171;
  uint64_t v172;
  char v173;
  unint64_t v174;
  char v175;
  char *v176;
  _QWORD *clients;
  uint64_t *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void (*v188)(char *, uint64_t);
  void (*v189)(char *, uint64_t);
  uint64_t v190;
  char *v191;
  NSURL *v192;
  void *v193;
  void *v194;
  void (*v195)(char *, uint64_t);
  void (*v196)(char *, uint64_t);
  id v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  char *v211;
  void (*v212)(char *, uint64_t, uint64_t);
  uint64_t v213;
  char *v214;
  char *v215;
  char *v216;
  uint64_t v217;
  void (*v218)(char *, char *, uint64_t);
  uint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  uint64_t v223;
  id v224;
  id v225;
  uint64_t v226;
  uint64_t (*v227)(uint64_t, uint64_t, uint64_t);
  uint64_t v228;
  NSURL v229;

  v207 = a3;
  v224 = a2;
  v225 = a1;
  v223 = type metadata accessor for URLQueryItem(0);
  v4 = *(_QWORD *)(v223 - 8);
  v5 = __chkstk_darwin(v223);
  v220 = (char *)&v197 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v214 = (char *)&v197 - v8;
  v9 = __chkstk_darwin(v7);
  v221 = (char *)&v197 - v10;
  __chkstk_darwin(v9);
  v215 = (char *)&v197 - v11;
  v12 = sub_1000039D8(&qword_100024D68);
  v13 = __chkstk_darwin(v12);
  v201 = (char *)&v197 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v203 = (char *)&v197 - v15;
  v16 = type metadata accessor for URLComponents(0);
  v217 = *(_QWORD *)(v16 - 8);
  v17 = __chkstk_darwin(v16);
  v222 = (char *)&v197 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v17);
  v202 = (char *)&v197 - v20;
  __chkstk_darwin(v19);
  v216 = (char *)&v197 - v21;
  v22 = type metadata accessor for URL(0);
  v219 = *(_QWORD *)(v22 - 8);
  v23 = __chkstk_darwin(v22);
  v199 = (char *)&v197 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v27 = (char *)&v197 - v26;
  __chkstk_darwin(v25);
  v208 = (char *)&v197 - v28;
  v29 = sub_1000039D8(&qword_100024D40);
  v30 = __chkstk_darwin(v29);
  v200 = (char *)&v197 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v212 = (void (*)(char *, uint64_t, uint64_t))((char *)&v197 - v33);
  v34 = __chkstk_darwin(v32);
  v211 = (char *)&v197 - v35;
  v36 = __chkstk_darwin(v34);
  v206 = (uint64_t)&v197 - v37;
  v38 = __chkstk_darwin(v36);
  v227 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v197 - v39);
  v40 = __chkstk_darwin(v38);
  v210 = (uint64_t)&v197 - v41;
  __chkstk_darwin(v40);
  v43 = (char *)&v197 - v42;
  v44 = v3 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext;
  v45 = v44 + *(int *)(type metadata accessor for MessagesContext(0) + 20);
  v46 = *(_QWORD *)(v45 + 8);
  v218 = *(void (**)(char *, char *, uint64_t))v45;
  v47 = qword_1000247B0;
  swift_bridgeObjectRetain(v46);
  if (v47 != -1)
    swift_once(&qword_1000247B0, sub_10000A6C4);
  v48 = type metadata accessor for Logger(0);
  v49 = sub_100008FF0(v48, (uint64_t)qword_100025198);
  v50 = swift_bridgeObjectRetain_n(v46, 2);
  v51 = Logger.logObject.getter(v50);
  v52 = static os_log_type_t.default.getter();
  v53 = os_log_type_enabled(v51, v52);
  v204 = v16;
  v228 = v4;
  v213 = v22;
  v205 = v27;
  v209 = v49;
  if (v53)
  {
    v54 = (uint8_t *)swift_slowAlloc(12, -1);
    v55 = (void *)swift_slowAlloc(32, -1);
    v229._clients = v55;
    *(_DWORD *)v54 = 136315138;
    swift_bridgeObjectRetain(v46);
    v229.super.isa = (Class)sub_10001082C((uint64_t)v218, v46, (uint64_t *)&v229._clients);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, &v229._urlString, v54 + 4, v54 + 12);
    swift_bridgeObjectRelease_n(v46, 3);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "%s: Creating Messages payload", v54, 0xCu);
    swift_arrayDestroy(v55, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v55, -1, -1);
    swift_slowDealloc(v54, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v46, 2);
  }
  v57 = v224;
  v56 = v225;
  v58 = objc_msgSend(objc_allocWithZone((Class)MSMessageTemplateLayout), "init");
  v59 = (void *)ATPayload.question.getter(v58);
  ATQuestion.title.getter();
  v61 = v60;

  v62 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v61);
  objc_msgSend(v58, "setCaption:", v62);

  v64 = (void *)ATPayload.question.getter(v63);
  ATQuestion.summary.getter(v64);
  v66 = v65;

  v67 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v66);
  objc_msgSend(v58, "setSubcaption:", v67);

  v68 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v58);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v68, "setRequiredCapabilities:", isa);

  v70 = objc_msgSend(objc_allocWithZone((Class)MSMessage), "initWithSession:", v57);
  v225 = v68;
  v71 = (void *)ATPayload.question.getter(objc_msgSend(v70, "setLayout:", v68));
  ATQuestion.notificationText.getter();
  v73 = v72;

  if (!v73)
  {
    v75 = (void *)ATPayload.question.getter(v74);
    ATQuestion.summary.getter(v75);
    v73 = v76;

  }
  v77 = (uint64_t)v227;
  v78 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v73);
  objc_msgSend(v70, "setSummaryText:", v78);

  v79 = v226;
  static ATURL.create(using:)(v56);
  v80 = v79;
  if (v79)
  {
    swift_bridgeObjectRelease(v46);

    return v70;
  }
  v81 = v210;
  sub_100003D6C((uint64_t)v43, v210, &qword_100024D40);
  v82 = v219;
  v83 = v213;
  v227 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v219 + 48);
  v84 = v227(v81, 1, v213);
  v197 = v58;
  if (v84 == 1)
  {
    v85 = 0;
  }
  else
  {
    v86 = v81;
    URL._bridgeToObjectiveC()(&v229);
    v85 = v87;
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v86, v83);
  }
  v224 = v70;
  objc_msgSend(v70, "setURL:", v85, v197);

  sub_100003D6C((uint64_t)v43, v77, &qword_100024D40);
  v88 = swift_bridgeObjectRetain(v46);
  v89 = Logger.logObject.getter(v88);
  v90 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v89, v90))
  {
    v210 = 0;
    v198 = v43;
    v91 = swift_slowAlloc(22, -1);
    v92 = (void *)swift_slowAlloc(64, -1);
    v229._clients = v92;
    *(_DWORD *)v91 = 136315394;
    swift_bridgeObjectRetain(v46);
    v229.super.isa = (Class)sub_10001082C((uint64_t)v218, v46, (uint64_t *)&v229._clients);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, &v229._urlString, v91 + 4, v91 + 12);
    swift_bridgeObjectRelease_n(v46, 3);
    *(_WORD *)(v91 + 12) = 2080;
    v93 = v206;
    sub_100003D6C(v77, v206, &qword_100024D40);
    v94 = v227(v93, 1, v83);
    if ((_DWORD)v94 == 1)
    {
      sub_100003DB0(v93, &qword_100024D40);
      v95 = 0xE300000000000000;
      v96 = 7104878;
    }
    else
    {
      v96 = URL.absoluteString.getter(v94);
      v95 = v97;
      (*(void (**)(uint64_t, uint64_t))(v219 + 8))(v93, v83);
    }
    v229.super.isa = (Class)sub_10001082C(v96, v95, (uint64_t *)&v229._clients);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, &v229._urlString, v91 + 14, v91 + 22);
    swift_bridgeObjectRelease(v95);
    sub_100003DB0(v77, &qword_100024D40);
    _os_log_impl((void *)&_mh_execute_header, v89, v90, "%s: Generated AskTo URL: %s", (uint8_t *)v91, 0x16u);
    swift_arrayDestroy(v92, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v92, -1, -1);
    swift_slowDealloc(v91, -1, -1);

    v43 = v198;
    v82 = v219;
    v80 = v210;
  }
  else
  {
    swift_bridgeObjectRelease_n(v46, 2);
    sub_100003DB0(v77, &qword_100024D40);

  }
  v98 = (uint64_t)v211;
  sub_100003D6C((uint64_t)v43, (uint64_t)v211, &qword_100024D40);
  v99 = v83;
  v100 = v83;
  v101 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v227;
  v102 = v227(v98, 1, v99);
  v103 = v228;
  v104 = (uint64_t)v212;
  if (v102 == 1)
  {
    sub_100003DB0((uint64_t)v43, &qword_100024D40);

    v105 = v98;
LABEL_23:
    v109 = &qword_100024D40;
LABEL_24:
    sub_100003DB0(v105, v109);
    return v224;
  }
  v106 = v208;
  v107 = v98;
  v108 = *(void (**)(char *, uint64_t, uint64_t))(v82 + 32);
  v108(v208, v107, v100);
  sub_100003D6C(v207, v104, &qword_100024D40);
  if (v101(v104, 1, v100) == 1)
  {

    (*(void (**)(char *, uint64_t))(v82 + 8))(v106, v100);
    sub_100003DB0((uint64_t)v43, &qword_100024D40);
    v105 = v104;
    goto LABEL_23;
  }
  v111 = v104;
  v112 = v205;
  v212 = v108;
  v108(v205, v111, v100);
  v113 = v203;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v112, 1);
  v114 = v217;
  v115 = v204;
  v116 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v217 + 48);
  if (v116(v113, 1, v204) == 1)
  {

    v117 = *(void (**)(char *, uint64_t))(v219 + 8);
    v117(v112, v100);
    v117(v208, v100);
    sub_100003DB0((uint64_t)v43, &qword_100024D40);
    v109 = &qword_100024D68;
    v105 = (uint64_t)v113;
    goto LABEL_24;
  }
  v210 = v80;
  v118 = *(void (**)(char *, char *, uint64_t))(v114 + 32);
  v119 = v216;
  v118(v216, v113, v115);
  v120 = (uint64_t)v201;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v208, 1);
  if (v116((char *)v120, 1, v115) == 1)
  {

    (*(void (**)(char *, uint64_t))(v217 + 8))(v119, v115);
    v121 = *(void (**)(char *, uint64_t))(v219 + 8);
    v121(v205, v100);
    v121(v208, v100);
    sub_100003DB0((uint64_t)v43, &qword_100024D40);
    sub_100003DB0(v120, &qword_100024D68);
    return v224;
  }
  v118(v202, (char *)v120, v115);
  v122 = (_QWORD *)sub_1000151EC((uint64_t)&_swiftEmptyArrayStorage);
  v123 = (char *)URLComponents.queryItems.getter(v122);
  if (!v123)
    v123 = (char *)&_swiftEmptyArrayStorage;
  v124 = *((_QWORD *)v123 + 2);
  v198 = v43;
  if (!v124)
  {
    v153 = swift_bridgeObjectRelease(v123);
    v146 = v217;
    v131 = v222;
    v128 = v223;
LABEL_47:
    v154 = (void (*)(char *, char *, uint64_t))URLComponents.queryItems.getter(v153);
    if (!v154)
      v154 = (void (*)(char *, char *, uint64_t))&_swiftEmptyArrayStorage;
    v155 = *((_QWORD *)v154 + 2);
    if (!v155)
    {
      swift_bridgeObjectRelease(v154);
      v176 = v216;
LABEL_65:
      (*(void (**)(char *, char *, uint64_t))(v146 + 16))(v131, v176, v115);
      v181 = swift_bridgeObjectRetain(v122);
      v182 = v146;
      v183 = v176;
      v184 = sub_100015F2C(v181);
      swift_bridgeObjectRelease(v122);
      v185 = URLComponents.queryItems.setter(v184);
      v186 = (uint64_t)v200;
      URLComponents.url.getter(v185);
      v187 = v213;
      if (v227(v186, 1, v213) != 1)
      {
        v190 = v186;
        v191 = v199;
        v212(v199, v190, v187);
        URL._bridgeToObjectiveC()(v192);
        v194 = v193;
        v70 = v224;
        objc_msgSend(v224, "setURL:", v193);

        v195 = *(void (**)(char *, uint64_t))(v219 + 8);
        v195(v191, v187);
        v196 = *(void (**)(char *, uint64_t))(v182 + 8);
        v196(v131, v115);
        v196(v202, v115);
        v196(v216, v115);
        v195(v205, v187);
        v195(v208, v187);
        sub_100003DB0((uint64_t)v43, &qword_100024D40);
        swift_bridgeObjectRelease(v122);
        return v70;
      }

      v188 = *(void (**)(char *, uint64_t))(v182 + 8);
      v188(v131, v115);
      v188(v202, v115);
      v188(v183, v115);
      v189 = *(void (**)(char *, uint64_t))(v219 + 8);
      v189(v205, v187);
      v189(v208, v187);
      sub_100003DB0((uint64_t)v43, &qword_100024D40);
      sub_100003DB0(v186, &qword_100024D40);
      swift_bridgeObjectRelease(v122);
      return v224;
    }
    v156 = *(unsigned __int8 *)(v103 + 80);
    v218 = v154;
    v157 = (char *)v154 + ((v156 + 32) & ~v156);
    v158 = *(_QWORD *)(v103 + 72);
    v221 = *(char **)(v103 + 16);
    v159 = v214;
    while (1)
    {
      v226 = v155;
      v162 = v221;
      v163 = ((uint64_t (*)(char *, char *, uint64_t))v221)(v159, v157, v128);
      v164 = URLQueryItem.name.getter(v163);
      v166 = v165;
      ((void (*)(char *, char *, uint64_t))v162)(v220, v159, v128);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v122);
      v229._clients = v122;
      v169 = sub_100015824(v164, v166);
      v170 = v122[2];
      v171 = (v168 & 1) == 0;
      v172 = v170 + v171;
      if (__OFADD__(v170, v171))
        goto LABEL_70;
      v173 = v168;
      if (v122[3] >= v172)
      {
        v176 = v216;
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          goto LABEL_59;
        sub_100015CD0();
      }
      else
      {
        sub_100015888(v172, isUniquelyReferenced_nonNull_native);
        v174 = sub_100015824(v164, v166);
        if ((v173 & 1) != (v175 & 1))
          goto LABEL_73;
        v169 = v174;
      }
      v176 = v216;
LABEL_59:
      v128 = v223;
      clients = v229._clients;
      if ((v173 & 1) != 0)
      {
        v160 = v228;
        (*(void (**)(unint64_t, char *, uint64_t))(v228 + 40))(*((_QWORD *)v229._clients + 7) + v169 * v158, v220, v223);
      }
      else
      {
        *((_QWORD *)v229._clients + (v169 >> 6) + 8) |= 1 << v169;
        v178 = (uint64_t *)(clients[6] + 16 * v169);
        *v178 = v164;
        v178[1] = v166;
        v160 = v228;
        (*(void (**)(unint64_t, char *, uint64_t))(v228 + 32))(clients[7] + v169 * v158, v220, v128);
        v179 = clients[2];
        v151 = __OFADD__(v179, 1);
        v180 = v179 + 1;
        if (v151)
          goto LABEL_72;
        clients[2] = v180;
        swift_bridgeObjectRetain(v166);
      }
      v43 = v198;
      v131 = v222;
      v122 = v229._clients;
      swift_bridgeObjectRelease(v166);
      swift_bridgeObjectRelease(0x8000000000000000);
      v161 = *(void (**)(char *, uint64_t))(v160 + 8);
      v159 = v214;
      v161(v214, v128);
      v157 += v158;
      v155 = v226 - 1;
      if (v226 == 1)
      {
        swift_bridgeObjectRelease(v218);
        v115 = v204;
        v146 = v217;
        goto LABEL_65;
      }
    }
  }
  v125 = *(unsigned __int8 *)(v103 + 80);
  v211 = v123;
  v126 = &v123[(v125 + 32) & ~v125];
  v127 = *(_QWORD *)(v103 + 72);
  v218 = *(void (**)(char *, char *, uint64_t))(v103 + 16);
  v128 = v223;
  v129 = v215;
  while (1)
  {
    v226 = v124;
    v132 = v218;
    v133 = ((uint64_t (*)(char *, char *, uint64_t))v218)(v129, v126, v128);
    v134 = URLQueryItem.name.getter(v133);
    v136 = v135;
    v132(v221, v129, v128);
    v137 = swift_isUniquelyReferenced_nonNull_native(v122);
    v229._clients = v122;
    v139 = sub_100015824(v134, v136);
    v140 = v122[2];
    v141 = (v138 & 1) == 0;
    v142 = v140 + v141;
    if (__OFADD__(v140, v141))
      break;
    v143 = v138;
    if (v122[3] >= v142)
    {
      if ((v137 & 1) == 0)
        sub_100015CD0();
    }
    else
    {
      sub_100015888(v142, v137);
      v144 = sub_100015824(v134, v136);
      if ((v143 & 1) != (v145 & 1))
        goto LABEL_73;
      v139 = v144;
    }
    v146 = v217;
    v147 = v229._clients;
    if ((v143 & 1) != 0)
    {
      v130 = *((_QWORD *)v229._clients + 7) + v139 * v127;
      v103 = v228;
      v128 = v223;
      (*(void (**)(unint64_t, char *, uint64_t))(v228 + 40))(v130, v221, v223);
    }
    else
    {
      *((_QWORD *)v229._clients + (v139 >> 6) + 8) |= 1 << v139;
      v148 = (uint64_t *)(v147[6] + 16 * v139);
      *v148 = v134;
      v148[1] = v136;
      v149 = v147[7] + v139 * v127;
      v103 = v228;
      v128 = v223;
      (*(void (**)(unint64_t, char *, uint64_t))(v228 + 32))(v149, v221, v223);
      v150 = v147[2];
      v151 = __OFADD__(v150, 1);
      v152 = v150 + 1;
      if (v151)
        goto LABEL_71;
      v147[2] = v152;
      swift_bridgeObjectRetain(v136);
    }
    v131 = v222;
    v122 = v229._clients;
    swift_bridgeObjectRelease(v136);
    swift_bridgeObjectRelease(0x8000000000000000);
    v129 = v215;
    (*(void (**)(char *, uint64_t))(v103 + 8))(v215, v128);
    v126 += v127;
    v124 = v226 - 1;
    if (v226 == 1)
    {
      v153 = swift_bridgeObjectRelease(v211);
      v115 = v204;
      v43 = v198;
      goto LABEL_47;
    }
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

unint64_t sub_1000151EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_1000039D8(&qword_100024F78);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }
  sub_1000039D8(&qword_100024F68);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = (char *)v5 + *(int *)(v2 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v28 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100003D6C(v13, (uint64_t)v5, &qword_100024F78);
    v15 = *v5;
    v16 = v5[1];
    result = sub_100015824(*v5, v16);
    if ((v18 & 1) != 0)
      break;
    v19 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    *v20 = v15;
    v20[1] = v16;
    v21 = v8[7];
    v22 = type metadata accessor for URLQueryItem(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v19, v10, v22);
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_12;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v26 = v28;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10001538C()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  swift_release(v0[2]);
  v1 = (char *)v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__isWaitingForSendResult;
  v2 = sub_1000039D8(&qword_100024F30);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = (char *)v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender__sendResult;
  v4 = sub_1000039D8(&qword_100024F38);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000155F8((uint64_t)v0 + OBJC_IVAR____TtC22AskToMessagesExtension14ResponseSender_messagesContext);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_100015424()
{
  return type metadata accessor for ResponseSender(0);
}

uint64_t type metadata accessor for ResponseSender(uint64_t a1)
{
  uint64_t result;

  result = qword_100024E78;
  if (!qword_100024E78)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ResponseSender);
  return result;
}

void sub_100015468(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[4];

  v8[0] = "\b";
  sub_100015518();
  if (v3 <= 0x3F)
  {
    v8[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10001556C(319);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      v6 = type metadata accessor for MessagesContext(319);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        swift_updateClassMetadata2(a1, 256, 4, v8, a1 + 80);
      }
    }
  }
}

void sub_100015518()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100024E88)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100024E88);
  }
}

void sub_10001556C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100024E90)
  {
    v2 = sub_100003E80((uint64_t *)&unk_100024E98);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100024E90);
  }
}

void *sub_1000155C4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000155D0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1000155F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessagesContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessagesContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015680()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000156BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc(dword_100024F4C);
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_100015724;
  *(_QWORD *)(v3 + 72) = v2;
  *(_OWORD *)(v3 + 56) = v4;
  return swift_task_switch(sub_10001248C, 0, 0);
}

uint64_t sub_100015724()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_100015774(id result, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_10001578C(result, a2 & 1);
  return result;
}

id sub_10001578C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain();
  else
    return a1;
}

unint64_t sub_100015798()
{
  unint64_t result;

  result = qword_100024F60;
  if (!qword_100024F60)
  {
    result = swift_getWitnessTable(&unk_10001B640, &type metadata for ResponseSender.Error);
    atomic_store(result, (unint64_t *)&qword_100024F60);
  }
  return result;
}

uint64_t sub_1000157DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000039D8(&qword_100024D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100015824(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100015BF0(a1, a2, v5);
}

Swift::Int sub_100015888(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::Int result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  int v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[9];

  v3 = v2;
  v46 = type metadata accessor for URLQueryItem(0);
  v6 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_1000039D8(&qword_100024F68);
  v44 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v41 = v3;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v42 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      goto LABEL_36;
    v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_36;
      v23 = v43[v17];
      if (!v23)
        break;
    }
LABEL_23:
    v14 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v8;
    v27 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v6 + 72);
    v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }
    Hasher.init(_seed:)(v47, *(_QWORD *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    result = Hasher._finalize()();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
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
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v29;
    v19[1] = v28;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v10 + 56) + v30 * v18, v45, v46);
    ++*(_QWORD *)(v10 + 16);
    v8 = v26;
  }
  v24 = v22 + 2;
  if (v24 < v42)
  {
    v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        v17 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v17 >= v42)
          goto LABEL_36;
        v23 = v43[v17];
        ++v24;
        if (v23)
          goto LABEL_23;
      }
    }
    v17 = v24;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v8);
  v3 = v41;
  if ((v44 & 1) != 0)
  {
    v39 = 1 << *(_BYTE *)(v8 + 32);
    if (v39 >= 64)
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v43 = -1 << v39;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v8);
  *v3 = v10;
  return result;
}

unint64_t sub_100015BF0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100015CD0()
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

  v34 = type metadata accessor for URLQueryItem(0);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000039D8(&qword_100024F68);
  v31 = v0;
  v4 = *v0;
  v5 = static _DictionaryStorage.copy(original:)(*v0);
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release(v4);
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
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v4);
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

char *sub_100015F2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)&_swiftEmptyArrayStorage;
  v3 = sub_1000039D8(&qword_100024F70);
  v4 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = (_QWORD *)swift_allocObject(v3, v7 + v5 * v1, v6 | 7);
  result = (char *)j__malloc_size(v8);
  if (v5)
  {
    if (&result[-v7] != (char *)0x8000000000000000 || v5 != -1)
    {
      v8[2] = v1;
      v8[3] = 2 * ((uint64_t)&result[-v7] / v5);
      v11 = sub_100016044(&v13, (uint64_t)v8 + v7, v1, a1);
      v12 = v13;
      swift_bridgeObjectRetain(a1);
      sub_10001630C(v12);
      if (v11 == v1)
        return (char *)v8;
      __break(1u);
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100016044(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = type metadata accessor for URLQueryItem(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 32);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 56) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10001630C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t getEnumTagSinglePayload for ResponseSender.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ResponseSender.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000163A8 + 4 * byte_10001B460[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000163C8 + 4 * byte_10001B465[v4]))();
}

_BYTE *sub_1000163A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000163C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000163D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000163D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000163E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000163E8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1000163F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for ResponseSender.Error()
{
  return &type metadata for ResponseSender.Error;
}

unint64_t sub_100016414()
{
  unint64_t result;

  result = qword_100024F80[0];
  if (!qword_100024F80[0])
  {
    result = swift_getWitnessTable(&unk_10001B618, &type metadata for ResponseSender.Error);
    atomic_store(result, qword_100024F80);
  }
  return result;
}

uint64_t sub_100016458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_100016460(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_10001B6B8;
  result = type metadata accessor for Optional(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_10001B6D0;
    swift_initStructMetadata(a1, 0, 3, v4, a1 + 32);
    return 0;
  }
  return result;
}

uint64_t *sub_1000164E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  int v10;
  uint64_t v13;
  void *v14;
  const void *v15;
  unint64_t v16;
  unint64_t v17;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  if (*(_DWORD *)(v5 + 84))
    v8 = *(_QWORD *)(v5 + 64);
  else
    v8 = *(_QWORD *)(v5 + 64) + 1;
  v9 = v8 + 7;
  v10 = v6 & 0x100000;
  if (v7 > 7 || v10 != 0 || ((v8 + 7 + ((v7 + 1) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v14 = (void *)(((unint64_t)a1 + v7 + 1) & ~v7);
    v15 = (const void *)(((unint64_t)a2 + v7 + 1) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4))
    {
      memcpy(v14, v15, v8);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v14, v15, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    }
    v16 = ((unint64_t)v14 + v9) & 0xFFFFFFFFFFFFFFF8;
    v17 = ((unint64_t)v15 + v9) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v17 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
      return v3;
    }
    v13 = *(_QWORD *)(v17 + 8);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *(_QWORD *)(v16 + 8) = v13;
  }
  swift_retain(v13);
  return v3;
}

uint64_t sub_100016634(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2);
  if (!(_DWORD)result)
    result = (*(uint64_t (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  v6 = v4 + *(_QWORD *)(v3 + 64);
  if (!*(_DWORD *)(v3 + 84))
    ++v6;
  v7 = (_QWORD *)((v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (*v7 >= 0xFFFFFFFFuLL)
    return swift_release(v7[1]);
  return result;
}

_BYTE *sub_1000166D4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  v13 = ((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = ((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v14 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v15 = *(_QWORD *)(v14 + 8);
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *(_QWORD *)(v13 + 8) = v15;
    swift_retain(v15);
  }
  return a1;
}

_BYTE *sub_1000167E0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  v14 = (_QWORD *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = (unint64_t *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v16 = *v15;
  if (*v14 < 0xFFFFFFFFuLL)
  {
    if (v16 >= 0xFFFFFFFF)
    {
      v19 = v15[1];
      *v14 = v16;
      v14[1] = v19;
      swift_retain(v19);
      return a1;
    }
LABEL_19:
    *(_OWORD *)v14 = *(_OWORD *)v15;
    return a1;
  }
  if (v16 < 0xFFFFFFFF)
  {
    swift_release(v14[1]);
    goto LABEL_19;
  }
  v17 = v15[1];
  v18 = v14[1];
  *v14 = v16;
  v14[1] = v17;
  swift_retain(v17);
  swift_release(v18);
  return a1;
}

_BYTE *sub_100016978(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  v13 = ((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = (uint64_t *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = *v14;
  if ((unint64_t)*v14 < 0xFFFFFFFF)
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  else
  {
    v16 = v14[1];
    *(_QWORD *)v13 = v15;
    *(_QWORD *)(v13 + 8) = v16;
  }
  return a1;
}

_BYTE *sub_100016A80(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  v14 = (_QWORD *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = (unint64_t *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  v16 = *v15;
  if (*v14 < 0xFFFFFFFFuLL)
  {
    if (v16 >= 0xFFFFFFFF)
    {
      v19 = v15[1];
      *v14 = v16;
      v14[1] = v19;
      return a1;
    }
LABEL_19:
    *(_OWORD *)v14 = *(_OWORD *)v15;
    return a1;
  }
  if (v16 < 0xFFFFFFFF)
  {
    swift_release(v14[1]);
    goto LABEL_19;
  }
  v17 = v15[1];
  v18 = v14[1];
  *v14 = v16;
  v14[1] = v17;
  swift_release(v18);
  return a1;
}

uint64_t sub_100016C0C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v8 + 7;
  if (v7 < a2)
  {
    if (((((v10 + ((v9 + 1) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v7 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X17 }
  }
  v15 = (a1 + v9 + 1) & ~v9;
  if (v6 < 0x7FFFFFFE)
  {
    v17 = *(_QWORD *)((v10 + v15) & 0xFFFFFFFFFFFFF8);
    if (v17 >= 0xFFFFFFFF)
      LODWORD(v17) = -1;
    if ((v17 + 1) >= 2)
      return v17;
    else
      return 0;
  }
  else
  {
    v16 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v15);
    if (v16 >= 2)
      return v16 - 1;
    else
      return 0;
  }
}

void sub_100016D68(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_100016E74@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  _QWORD *v19;
  uint64_t result;

  *(_BYTE *)(v15 + v16) = 0;
  if (a1)
  {
    v17 = (void *)((v15 + v14 + 1) & v10);
    if (v11 < 0x7FFFFFFE)
    {
      v19 = (_QWORD *)(((unint64_t)v17 + v13) & 0xFFFFFFFFFFFFFFF8);
      if (a1 > 0x7FFFFFFE)
      {
        *v19 = 0;
        v19[1] = 0;
        *(_DWORD *)v19 = a1 - 0x7FFFFFFF;
      }
      else
      {
        *v19 = a1;
      }
    }
    else if (v11 >= a1)
    {
      return (*(uint64_t (**)(void *, _QWORD))(v12 + 56))(v17, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v18 = a2;
      else
        v18 = 4;
      bzero(v17, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_100016F84()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_100016F94()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_100016F9C()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata accessor for OptionsDropdown(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100002CC0(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptionsDropdown);
}

uint64_t sub_100016FB4(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_10001CEF8, 1);
}

uint64_t sub_100016FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v14 - v11, a1, a2);
  swift_storeEnumTagMultiPayload(v12, v10, 0);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_1000170AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v14 - v11, a1, a3);
  swift_storeEnumTagMultiPayload(v12, v10, 1);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_100017170@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t WitnessTable;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, char *, uint64_t);
  char *v79;
  void (*v80)(char *, uint64_t);
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  uint64_t v116;
  char *v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _QWORD v144[4];

  v124 = a2;
  v3 = sub_1000039D8(&qword_100025008);
  __chkstk_darwin(v3);
  v101 = (uint64_t)&v99 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_1000039D8(&qword_100025010);
  v104 = *(_QWORD *)(v105 - 8);
  __chkstk_darwin(v105);
  v103 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000039D8(&qword_100025018);
  v7 = __chkstk_darwin(v6);
  v102 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v106 = (uint64_t)&v99 - v9;
  v114 = a1;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = sub_1000183AC();
  v12 = *(_QWORD *)(a1 + 24);
  v144[0] = v3;
  v144[1] = v10;
  v118 = v11;
  v144[2] = v11;
  v144[3] = v12;
  v116 = v12;
  v13 = type metadata accessor for Menu(255, v144);
  v14 = sub_100003E80(&qword_1000250A0);
  v15 = type metadata accessor for ModifiedContent(255, v13, v14);
  v113 = v6;
  v16 = type metadata accessor for _ConditionalContent(0, v15, v6);
  v112 = *(_QWORD *)(v16 - 8);
  v17 = __chkstk_darwin(v16);
  v111 = (char *)&v99 - v18;
  v122 = v13;
  v108 = *(_QWORD *)(v13 - 8);
  v19 = __chkstk_darwin(v17);
  v107 = (char *)&v99 - v20;
  v109 = *(_QWORD *)(v15 - 8);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v99 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v110 = (char *)&v99 - v24;
  v25 = type metadata accessor for Optional(0, v10);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = __chkstk_darwin(v25);
  v29 = (char *)&v99 - v28;
  v30 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v27);
  v117 = (char *)&v99 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = v16;
  v125 = v3;
  v32 = v3;
  v33 = v114;
  v34 = v115;
  v121 = type metadata accessor for _ConditionalContent(0, v16, v32);
  v120 = *(_QWORD *)(v121 - 8);
  __chkstk_darwin(v121);
  v119 = (char *)&v99 - v35;
  (*(void (**)(char *, _BYTE *, uint64_t))(v26 + 16))(v29, &v34[*(int *)(v33 + 36)], v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v29, 1, v10) == 1)
  {
    v36 = v116;
    v117 = (char *)v15;
    v37 = v125;
    v38 = v118;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
    v39 = (uint64_t *)&v34[*(int *)(v33 + 40)];
    v40 = *v39;
    if (*v39)
    {
      v41 = v39[1];
      v42 = swift_allocObject(&unk_100021638, 32, 7);
      *(_QWORD *)(v42 + 16) = v40;
      *(_QWORD *)(v42 + 24) = v41;
      v114 = v41;
      v43 = __chkstk_darwin(v41);
      *(&v99 - 4) = v10;
      *(&v99 - 3) = v36;
      *(&v99 - 2) = (uint64_t)v34;
      swift_retain_n(v43, 2);
      v44 = v103;
      v45 = v38;
      Button.init(action:label:)(sub_100011558, v42, sub_1000186E8, &v99 - 6, v37, v38);
      LOBYTE(v41) = *v34;
      KeyPath = swift_getKeyPath(&unk_10001B748);
      v47 = swift_allocObject(&unk_100021660, 17, 7);
      *(_BYTE *)(v47 + 16) = (v41 & 1) == 0;
      v48 = v104;
      v49 = (uint64_t)v102;
      v50 = v105;
      (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v102, v44, v105);
      v51 = v113;
      v52 = (uint64_t *)(v49 + *(int *)(v113 + 36));
      *v52 = KeyPath;
      v52[1] = (uint64_t)sub_10001874C;
      v52[2] = v47;
      (*(void (**)(char *, uint64_t))(v48 + 8))(v44, v50);
      v53 = v106;
      sub_100018764(v49, v106);
      v54 = v122;
      WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Menu<A, B>, v122);
      v56 = sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
      v132 = WitnessTable;
      v133 = v56;
      v57 = (uint64_t)v117;
      v58 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v117);
      v59 = sub_100018628();
      v60 = (uint64_t)v111;
      sub_1000170AC(v53, v57, v51, v58, v59);
      v130 = v58;
      v131 = v59;
      v61 = v123;
      v62 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v123);
      v63 = v119;
      sub_100016FE8(v60, v61, v37, v62, v45);
      sub_100008F9C(v40, v114);
      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v60, v61);
      v64 = &qword_100025018;
      v65 = v53;
    }
    else
    {
      v86 = v101;
      sub_100017C18(v101);
      v54 = v122;
      v87 = swift_getWitnessTable(&protocol conformance descriptor for Menu<A, B>, v122);
      v88 = sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
      v142 = v87;
      v143 = v88;
      v57 = (uint64_t)v117;
      v89 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v117);
      v90 = sub_100018628();
      v140 = v89;
      v141 = v90;
      v61 = v123;
      v91 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v123);
      v63 = v119;
      v45 = v38;
      sub_1000170AC(v86, v61, v37, v91, v38);
      v64 = &qword_100025008;
      v65 = v86;
    }
    sub_100003DB0(v65, v64);
  }
  else
  {
    v100 = v30;
    v66 = v117;
    v67 = (*(uint64_t (**)(void))(v30 + 32))();
    v68 = __chkstk_darwin(v67);
    v69 = v116;
    *(&v99 - 4) = v10;
    *(&v99 - 3) = v69;
    *(&v99 - 2) = (uint64_t)v66;
    __chkstk_darwin(v68);
    *(&v99 - 4) = v10;
    *(&v99 - 3) = v70;
    *(&v99 - 2) = (uint64_t)v34;
    v71 = v107;
    v45 = v118;
    Menu.init(content:label:)(sub_1000187AC);
    v72 = *v34;
    v73 = v122;
    v74 = swift_getWitnessTable(&protocol conformance descriptor for Menu<A, B>, v122);
    View.disabled(_:)((v72 & 1) == 0, v73, v74);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v71, v73);
    v75 = sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    v128 = v74;
    v129 = v75;
    v76 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v15);
    v77 = v109;
    v78 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
    v79 = v110;
    v78(v110, v23, v15);
    v80 = *(void (**)(char *, uint64_t))(v77 + 8);
    v80(v23, v15);
    v78(v23, v79, v15);
    v81 = sub_100018628();
    v82 = (uint64_t)v111;
    sub_100016FE8((uint64_t)v23, v15, v113, v76, v81);
    v80(v23, v15);
    v126 = v76;
    v127 = v81;
    v83 = v123;
    v84 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v123);
    v85 = v119;
    sub_100016FE8(v82, v83, v125, v84, v45);
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v82, v83);
    v80(v79, v15);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v117, v10);
    v61 = v83;
    v57 = v15;
    v54 = v73;
    v63 = v85;
  }
  v92 = swift_getWitnessTable(&protocol conformance descriptor for Menu<A, B>, v54);
  v93 = sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
  v138 = v92;
  v139 = v93;
  v94 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v57);
  v95 = sub_100018628();
  v136 = v94;
  v137 = v95;
  v134 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v61);
  v135 = v45;
  v96 = v121;
  swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v121);
  v97 = v120;
  (*(void (**)(uint64_t, char *, uint64_t))(v120 + 16))(v124, v63, v96);
  return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v63, v96);
}

uint64_t sub_100017B84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *);
  uint64_t v10;

  v5 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(a1);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_100017C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
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
  char v24;
  id v25;
  uint64_t v26;
  char v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[424];
  _BYTE v64[440];
  char v65;
  char v66;
  char v67;
  _QWORD v68[71];

  v56 = a1;
  v1 = type metadata accessor for Image.Scale(0);
  v54 = *(_QWORD *)(v1 - 8);
  v55 = v1;
  __chkstk_darwin(v1);
  v53 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1000039D8(&qword_100025090);
  __chkstk_darwin(v52);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v49);
  v6 = (_OWORD *)((char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51 = sub_1000039D8(&qword_100025030);
  v7 = __chkstk_darwin(v51);
  v50 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = static VerticalAlignment.center.getter(v7);
  sub_100017FF0(v48, (uint64_t)v63);
  v64[432] = 1;
  v9 = memcpy(&v64[7], v63, 0x1A8uLL);
  v46 = 1;
  v47 = static Edge.Set.vertical.getter(v9);
  v10 = EdgeInsets.init(_all:)(6.5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v65 = 0;
  v18 = static Alignment.center.getter(v17);
  _FrameLayout.init(width:height:alignment:)(&v57, 0, 1, 0, 1, v18, v19);
  v20 = v57;
  v21 = v59;
  v23 = v61;
  v22 = v62;
  v24 = v65;
  v67 = v58;
  v66 = v60;
  v25 = objc_msgSend((id)objc_opt_self(UIColor), "tertiarySystemFillColor");
  v26 = Color.init(uiColor:)(v25);
  v27 = static Edge.Set.all.getter();
  v68[0] = v48;
  v68[1] = 0;
  LOBYTE(v68[2]) = v46;
  memcpy((char *)&v68[2] + 1, v64, 0x1AFuLL);
  LOBYTE(v68[56]) = v47;
  *(double *)&v68[57] = v10;
  v68[58] = v12;
  v68[59] = v14;
  v68[60] = v16;
  LOBYTE(v68[61]) = v24;
  v68[62] = v20;
  LOBYTE(v68[63]) = v67;
  v68[64] = v21;
  LOBYTE(v68[65]) = v66;
  v68[66] = v23;
  v68[67] = v22;
  v68[68] = v26;
  LOBYTE(v68[69]) = v27;
  v28 = (char *)v6 + *(int *)(v49 + 20);
  v29 = enum case for RoundedCornerStyle.continuous(_:);
  v30 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v28, v29, v30);
  __asm { FMOV            V0.2D, #10.0 }
  *v6 = _Q0;
  sub_1000187EC((uint64_t)v6, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v52 + 36)] = 256;
  v36 = v50;
  sub_100003D6C((uint64_t)v4, (uint64_t)&v50[*(int *)(v51 + 36)], &qword_100025090);
  memcpy(v36, v68, 0x229uLL);
  sub_100018830((uint64_t)v68);
  sub_100003DB0((uint64_t)v4, &qword_100025090);
  sub_100018918((uint64_t)v6);
  sub_100018954((uint64_t)v68);
  v38 = v53;
  v37 = v54;
  v39 = v55;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v53, enum case for Image.Scale.small(_:), v55);
  KeyPath = swift_getKeyPath(&unk_10001B778);
  v41 = sub_1000039D8(&qword_100025008);
  v42 = v56;
  v43 = (uint64_t *)(v56 + *(int *)(v41 + 36));
  v44 = sub_1000039D8(&qword_100024898);
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))((char *)v43 + *(int *)(v44 + 28), v38, v39);
  *v43 = KeyPath;
  sub_100003D6C((uint64_t)v36, v42, &qword_100025030);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
  return sub_100003DB0((uint64_t)v36, &qword_100025030);
}

uint64_t sub_100017FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  uint64_t v41;
  _OWORD v42[8];
  _OWORD v43[8];
  Swift::String v44;

  v3 = static Alignment.center.getter(a1);
  sub_100004EA8(0.0, 1, 0.0, 1, 12.0, 0, 0.0, 1, (uint64_t)v43, 0.0, 1, 0.0, 1, v3, v4, 0, 1);
  v5 = type metadata accessor for MessageParser();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v5);
  v7 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v44._object = (void *)0xE700000000000000;
  v8._countAndFlagsBits = 0x736E6F6974704FLL;
  v8._object = (void *)0xE700000000000000;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v44._countAndFlagsBits = 0x736E6F6974704FLL;
  v10 = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v44);

  v42[0] = v10;
  v11 = sub_100003B1C();
  v12 = Text.init<A>(_:)(v42, &type metadata for String, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17 & 1;
  KeyPath = swift_getKeyPath(&unk_10001B7A8);
  v41 = static Font.subheadline.getter();
  v19 = swift_getKeyPath(&unk_10001B7D8);
  v39 = static Color.primary.getter();
  v20 = swift_getKeyPath(&unk_10001B808);
  v38 = Image.init(systemName:)(0x2E6E6F7276656863, 0xEC0000006E776F64);
  v37 = swift_getKeyPath(&unk_10001B7A8);
  v36 = static Font.subheadline.getter();
  v35 = swift_getKeyPath(&unk_10001B7D8);
  v21 = objc_msgSend((id)objc_opt_self(UIColor), "tertiaryLabelColor");
  v34 = Color.init(uiColor:)(v21);
  v22 = swift_getKeyPath(&unk_10001B808);
  v23 = static Alignment.center.getter(v22);
  sub_100004EA8(0.0, 1, 0.0, 1, 12.0, 0, 0.0, 1, (uint64_t)v42, 0.0, 1, 0.0, 1, v23, v24, 0, 1);
  v25 = v43[5];
  *(_OWORD *)(a2 + 64) = v43[4];
  *(_OWORD *)(a2 + 80) = v25;
  v26 = v43[7];
  *(_OWORD *)(a2 + 96) = v43[6];
  *(_OWORD *)(a2 + 112) = v26;
  v27 = v43[1];
  *(_OWORD *)a2 = v43[0];
  *(_OWORD *)(a2 + 16) = v27;
  v28 = v43[3];
  *(_OWORD *)(a2 + 32) = v43[2];
  *(_OWORD *)(a2 + 48) = v28;
  *(_QWORD *)(a2 + 128) = v12;
  *(_QWORD *)(a2 + 136) = v14;
  *(_BYTE *)(a2 + 144) = v18;
  *(_QWORD *)(a2 + 152) = v16;
  *(_QWORD *)(a2 + 160) = KeyPath;
  *(_QWORD *)(a2 + 168) = 1;
  *(_BYTE *)(a2 + 176) = 0;
  *(_QWORD *)(a2 + 184) = v19;
  *(_QWORD *)(a2 + 192) = v41;
  *(_QWORD *)(a2 + 200) = v20;
  *(_QWORD *)(a2 + 208) = v39;
  *(_QWORD *)(a2 + 216) = 0;
  *(_BYTE *)(a2 + 224) = 1;
  *(_QWORD *)(a2 + 232) = v38;
  *(_QWORD *)(a2 + 240) = v37;
  *(_QWORD *)(a2 + 248) = 1;
  *(_BYTE *)(a2 + 256) = 0;
  *(_QWORD *)(a2 + 264) = v35;
  *(_QWORD *)(a2 + 272) = v36;
  *(_QWORD *)(a2 + 280) = v22;
  *(_QWORD *)(a2 + 288) = v34;
  v29 = v42[5];
  *(_OWORD *)(a2 + 360) = v42[4];
  *(_OWORD *)(a2 + 376) = v29;
  v30 = v42[7];
  *(_OWORD *)(a2 + 392) = v42[6];
  *(_OWORD *)(a2 + 408) = v30;
  v31 = v42[1];
  *(_OWORD *)(a2 + 296) = v42[0];
  *(_OWORD *)(a2 + 312) = v31;
  v32 = v42[3];
  *(_OWORD *)(a2 + 328) = v42[2];
  *(_OWORD *)(a2 + 344) = v32;
  sub_100003A68(v12, v14, v18);
  swift_bridgeObjectRetain(v16);
  swift_retain(KeyPath);
  swift_retain(v19);
  swift_retain(v41);
  swift_retain(v20);
  swift_retain(v39);
  sub_100003B0C(v12, v14, v18);
  swift_release(v39);
  swift_release(v20);
  swift_release(v41);
  swift_release(v19);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v16);
}

unint64_t sub_1000183AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025020;
  if (!qword_100025020)
  {
    v1 = sub_100003E80(&qword_100025008);
    sub_100018430();
    sub_100008AB0(&qword_100025098, &qword_100024898, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025020);
  }
  return result;
}

unint64_t sub_100018430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025028;
  if (!qword_100025028)
  {
    v1 = sub_100003E80(&qword_100025030);
    sub_1000184B4();
    sub_100008AB0(&qword_100025088, &qword_100025090, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025028);
  }
  return result;
}

unint64_t sub_1000184B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025038;
  if (!qword_100025038)
  {
    v1 = sub_100003E80(&qword_100025040);
    sub_100018538();
    sub_100008AB0(&qword_100025078, &qword_100025080, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025038);
  }
  return result;
}

unint64_t sub_100018538()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025048;
  if (!qword_100025048)
  {
    v1 = sub_100003E80(&qword_100025050);
    sub_1000185A4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025048);
  }
  return result;
}

unint64_t sub_1000185A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025058;
  if (!qword_100025058)
  {
    v1 = sub_100003E80(&qword_100025060);
    sub_100008AB0(&qword_100025068, &qword_100025070, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100025058);
  }
  return result;
}

unint64_t sub_100018628()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000250B0;
  if (!qword_1000250B0)
  {
    v1 = sub_100003E80(&qword_100025018);
    sub_100008AB0(&qword_1000250B8, &qword_100025010, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000250B0);
  }
  return result;
}

uint64_t sub_1000186C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000186EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100018718(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_10001873C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_10001874C(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100018764(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000039D8(&qword_100025018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000187AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100017B84(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1000187B8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  type metadata accessor for OptionsDropdown(0, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1);
  return sub_100017C18(a2);
}

uint64_t sub_1000187EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018830(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 176);
  v3 = *(_QWORD *)(a1 + 184);
  v4 = *(_QWORD *)(a1 + 208);
  v5 = *(_QWORD *)(a1 + 216);
  v6 = *(_QWORD *)(a1 + 224);
  v7 = *(_QWORD *)(a1 + 232);
  v8 = *(_QWORD *)(a1 + 256);
  v12 = *(_QWORD *)(a1 + 264);
  v13 = *(_QWORD *)(a1 + 288);
  v9 = *(_QWORD *)(a1 + 312);
  v14 = *(_QWORD *)(a1 + 296);
  v15 = *(_QWORD *)(a1 + 304);
  v10 = *(_QWORD *)(a1 + 544);
  sub_100003A68(*(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_BYTE *)(a1 + 168));
  swift_retain(v9);
  swift_retain(v10);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v12);
  swift_retain(v13);
  swift_retain(v14);
  swift_retain(v15);
  return a1;
}

uint64_t sub_100018918(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018954(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 176);
  v3 = *(_QWORD *)(a1 + 184);
  v4 = *(_QWORD *)(a1 + 208);
  v5 = *(_QWORD *)(a1 + 224);
  v6 = *(_QWORD *)(a1 + 256);
  v7 = *(_QWORD *)(a1 + 264);
  v8 = *(_QWORD *)(a1 + 288);
  v12 = *(_QWORD *)(a1 + 216);
  v13 = *(_QWORD *)(a1 + 296);
  v9 = *(_QWORD *)(a1 + 304);
  v14 = *(_QWORD *)(a1 + 232);
  v15 = *(_QWORD *)(a1 + 312);
  v10 = *(_QWORD *)(a1 + 544);
  sub_100003B0C(*(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160), *(_BYTE *)(a1 + 168));
  swift_release(v10);
  swift_release(v9);
  swift_release(v8);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v12);
  swift_release(v14);
  swift_release(v13);
  swift_release(v15);
  return a1;
}

uint64_t sub_100018A58(uint64_t *a1)
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
  _QWORD v11[4];

  v1 = *a1;
  v2 = a1[1];
  v3 = sub_100003E80(&qword_100025008);
  v11[0] = v3;
  v11[1] = v1;
  v11[2] = sub_1000183AC();
  v11[3] = v2;
  v4 = type metadata accessor for Menu(255, v11);
  v5 = sub_100003E80(&qword_1000250A0);
  v6 = type metadata accessor for ModifiedContent(255, v4, v5);
  v7 = sub_100003E80(&qword_100025018);
  v8 = type metadata accessor for _ConditionalContent(255, v6, v7);
  v9 = type metadata accessor for _ConditionalContent(255, v8, v3);
  swift_getWitnessTable(&protocol conformance descriptor for Menu<A, B>, v4);
  sub_100008AB0(&qword_1000250A8, &qword_1000250A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
  sub_100018628();
  swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
  return swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v9);
}

_BYTE *initializeBufferWithCopyOfBuffer for RenderingError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RenderingError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ErrorView(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100018C78 + 4 * byte_10001B845[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100018CAC + 4 * byte_10001B840[v4]))();
}

uint64_t sub_100018CAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018CB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100018CBCLL);
  return result;
}

uint64_t sub_100018CC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100018CD0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100018CD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100018CDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ErrorView()
{
  return &type metadata for ErrorView;
}

uint64_t sub_100018CF8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001CF48, 1);
}

uint64_t sub_100018D08@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
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
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v94;
  uint64_t v95;
  char v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t KeyPath;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  char v118;
  Swift::String v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  char v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unsigned __int8 v136;
  uint64_t v137;
  unsigned __int8 v138;
  __int128 v139;
  Swift::String v140;
  Swift::String v141;
  Swift::String v142;

  v3 = type metadata accessor for MessageParser();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v3);
  v5 = (void *)objc_opt_self(NSBundle);
  v6 = objc_msgSend(v5, "bundleForClass:", ObjCClassFromMetadata);
  v140._object = (void *)0xEA0000000000726FLL;
  v7._countAndFlagsBits = 0x7272456F546B7341;
  v7._object = (void *)0xEA0000000000726FLL;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v140._countAndFlagsBits = 0x7272456F546B7341;
  v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v140);

  v119 = v9;
  v10 = sub_100003B1C();
  v11 = Text.init<A>(_:)(&v119, &type metadata for String, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  v18 = static Font.subheadline.getter();
  v19 = Font.bold()();
  swift_release(v18);
  v20 = Text.font(_:)(v19, v11, v13, v17, v15);
  v105 = v21;
  v106 = v20;
  v104 = v22;
  v107 = v23;
  swift_release(v19);
  sub_100003B0C(v11, v13, v17);
  swift_bridgeObjectRelease(v15);
  KeyPath = swift_getKeyPath(&unk_10001B8B8);
  v24 = static Alignment.topLeading.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v129, 0, 1, 0, 1, v24, v25);
  v103 = v129;
  v102 = v130;
  v101 = v131;
  v100 = v132;
  v98 = v134;
  v99 = v133;
  if (os_variant_has_internal_ui("com.apple.AskTo"))
  {
    v26 = sub_1000039D8(&qword_100024B90);
    v27 = swift_allocObject(v26, 72, 7);
    *(_OWORD *)(v27 + 16) = xmmword_10001B220;
    LOBYTE(v119._countAndFlagsBits) = a1 & 1;
    v28 = sub_100019570();
    v29 = Error.localizedDescription.getter(&type metadata for RenderingError, v28);
    v31 = v30;
    *(_QWORD *)(v27 + 56) = &type metadata for String;
    *(_QWORD *)(v27 + 64) = sub_10000A0B4();
    *(_QWORD *)(v27 + 32) = v29;
    *(_QWORD *)(v27 + 40) = v31;
    v32 = objc_msgSend(v5, "bundleForClass:", ObjCClassFromMetadata);
    v33 = objc_msgSend(v5, "bundleForClass:", ObjCClassFromMetadata);
    v34._object = (void *)0x800000010001C900;
    v141._object = (void *)0x800000010001C900;
    v34._countAndFlagsBits = 0xD000000000000014;
    v35._countAndFlagsBits = 0;
    v35._object = (void *)0xE000000000000000;
    v141._countAndFlagsBits = 0xD000000000000014;
    v36 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v141);

    v37 = static String.localizedStringWithFormat(_:_:)(v36._countAndFlagsBits, v36._object, v27);
    v39 = v38;
    swift_bridgeObjectRelease(v27);

    swift_bridgeObjectRelease(v36._object);
    v119._countAndFlagsBits = v37;
    v119._object = v39;
    v40 = Text.init<A>(_:)(&v119, &type metadata for String, v10);
    v42 = v41;
    v44 = v43;
    v46 = v45 & 1;
    v47 = static Font.footnote.getter();
    v48 = Text.font(_:)(v47, v40, v42, v46, v44);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    swift_release(v47);
    sub_100003B0C(v40, v42, v46);
    v55 = swift_bridgeObjectRelease(v44);
    v56 = static Alignment.topLeading.getter(v55);
    _FrameLayout.init(width:height:alignment:)(&v135, 0, 1, 0, 1, v56, v57);
    v109 = v48;
    v110 = v50;
    v111 = v52 & 1;
    v112 = v54;
    v113 = v135;
    v114 = v136;
    v115 = v137;
    v116 = v138;
    v117 = v139;
    v118 = 0;
  }
  else
  {
    v58 = objc_msgSend(v5, "bundleForClass:", ObjCClassFromMetadata);
    v59._object = (void *)0x800000010001C8E0;
    v142._object = (void *)0x800000010001C8E0;
    v59._countAndFlagsBits = 0xD000000000000014;
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    v142._countAndFlagsBits = 0xD000000000000014;
    v61 = NSLocalizedString(_:tableName:bundle:value:comment:)(v59, (Swift::String_optional)0, (NSBundle)v58, v60, v142);

    v119 = v61;
    v62 = Text.init<A>(_:)(&v119, &type metadata for String, v10);
    v64 = v63;
    v66 = v65;
    v68 = v67 & 1;
    v69 = static Font.footnote.getter();
    v70 = Text.font(_:)(v69, v62, v64, v68, v66);
    v72 = v71;
    v74 = v73;
    v76 = v75;
    swift_release(v69);
    sub_100003B0C(v62, v64, v68);
    v77 = swift_bridgeObjectRelease(v66);
    v78 = static Alignment.topLeading.getter(v77);
    _FrameLayout.init(width:height:alignment:)(&v135, 0, 1, 0, 1, v78, v79);
    v109 = v70;
    v110 = v72;
    v111 = v74 & 1;
    v112 = v76;
    v113 = v135;
    v114 = v136;
    v115 = v137;
    v116 = v138;
    v117 = v139;
    v118 = 1;
  }
  v80 = sub_1000039D8(&qword_1000250C0);
  v81 = sub_1000194BC();
  _ConditionalContent<>.init(storage:)(&v109, v80, v80, v81, v81);
  countAndFlagsBits = v119._countAndFlagsBits;
  object = v119._object;
  v84 = v120;
  v85 = v121;
  v87 = v122;
  v86 = v123;
  v89 = v124;
  v88 = v125;
  v91 = v126;
  v90 = v127;
  LOBYTE(v80) = v128;
  v95 = v121;
  v97 = v120;
  LOBYTE(v119._countAndFlagsBits) = v104 & 1;
  LOBYTE(v109) = 0;
  *(_QWORD *)a2 = v106;
  *(_QWORD *)(a2 + 8) = v105;
  *(_BYTE *)(a2 + 16) = v104 & 1;
  *(_QWORD *)(a2 + 24) = v107;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 1;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = v103;
  *(_BYTE *)(a2 + 64) = v102;
  *(_QWORD *)(a2 + 72) = v101;
  *(_BYTE *)(a2 + 80) = v100;
  *(_QWORD *)(a2 + 88) = v99;
  *(_QWORD *)(a2 + 96) = v98;
  *(_QWORD *)(a2 + 104) = countAndFlagsBits;
  *(_QWORD *)(a2 + 112) = object;
  *(_QWORD *)(a2 + 120) = v84;
  *(_QWORD *)(a2 + 128) = v85;
  *(_QWORD *)(a2 + 136) = v87;
  *(_QWORD *)(a2 + 144) = v86;
  *(_QWORD *)(a2 + 152) = v89;
  *(_QWORD *)(a2 + 160) = v88;
  *(_QWORD *)(a2 + 168) = v91;
  *(_QWORD *)(a2 + 176) = v90;
  *(_BYTE *)(a2 + 184) = v80;
  v92 = countAndFlagsBits;
  v94 = countAndFlagsBits;
  sub_100003A68(v106, v105, v104 & 1);
  swift_bridgeObjectRetain(v107);
  swift_retain(KeyPath);
  sub_100019520(v92, (uint64_t)object, v97, v95);
  sub_100019548(v94, (uint64_t)object, v97, v95);
  sub_100003B0C(v106, v105, v104 & 1);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v107);
}

double sub_10001936C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char *v8;
  char v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  __int128 v18;
  _OWORD v19[10];
  _OWORD v20[2];
  _BYTE v21[192];

  v10 = *v8;
  v11 = static HorizontalAlignment.leading.getter(a1, a2, a3, a4, a5, a6, a7);
  sub_100018D08(v10, (uint64_t)v19);
  *(_OWORD *)&v21[135] = v19[8];
  *(_OWORD *)&v21[151] = v19[9];
  *(_OWORD *)&v21[167] = v20[0];
  *(_OWORD *)&v21[176] = *(_OWORD *)((char *)v20 + 9);
  *(_OWORD *)&v21[71] = v19[4];
  *(_OWORD *)&v21[87] = v19[5];
  *(_OWORD *)&v21[103] = v19[6];
  *(_OWORD *)&v21[119] = v19[7];
  *(_OWORD *)&v21[7] = v19[0];
  *(_OWORD *)&v21[23] = v19[1];
  *(_OWORD *)&v21[39] = v19[2];
  *(_OWORD *)&v21[55] = v19[3];
  v12 = *(_OWORD *)&v21[144];
  *(_OWORD *)(a8 + 145) = *(_OWORD *)&v21[128];
  *(_OWORD *)(a8 + 161) = v12;
  v13 = *(_OWORD *)&v21[176];
  *(_OWORD *)(a8 + 177) = *(_OWORD *)&v21[160];
  *(_OWORD *)(a8 + 193) = v13;
  v14 = *(_OWORD *)&v21[80];
  *(_OWORD *)(a8 + 81) = *(_OWORD *)&v21[64];
  *(_OWORD *)(a8 + 97) = v14;
  v15 = *(_OWORD *)&v21[112];
  *(_OWORD *)(a8 + 113) = *(_OWORD *)&v21[96];
  *(_OWORD *)(a8 + 129) = v15;
  v16 = *(_OWORD *)&v21[16];
  *(_OWORD *)(a8 + 17) = *(_OWORD *)v21;
  *(_OWORD *)(a8 + 33) = v16;
  result = *(double *)&v21[32];
  v18 = *(_OWORD *)&v21[48];
  *(_OWORD *)(a8 + 49) = *(_OWORD *)&v21[32];
  *(_QWORD *)a8 = v11;
  *(_QWORD *)(a8 + 8) = 0x4020000000000000;
  *(_BYTE *)(a8 + 16) = 0;
  *(_OWORD *)(a8 + 65) = v18;
  return result;
}

unint64_t sub_1000194BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000250C8;
  if (!qword_1000250C8)
  {
    v1 = sub_100003E80(&qword_1000250C0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000250C8);
  }
  return result;
}

uint64_t sub_100019520(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_100003A68(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain(a4);
}

uint64_t sub_100019548(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_100003B0C(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease(a4);
}

unint64_t sub_100019570()
{
  unint64_t result;

  result = qword_1000250D0;
  if (!qword_1000250D0)
  {
    result = swift_getWitnessTable(&unk_10001B9D8, &type metadata for RenderingError);
    atomic_store(result, (unint64_t *)&qword_1000250D0);
  }
  return result;
}

unint64_t sub_1000195B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000250D8;
  if (!qword_1000250D8)
  {
    v1 = sub_100003E80(&qword_1000250E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000250D8);
  }
  return result;
}

uint64_t sub_100019604(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t ObjCClassFromMetadata;
  void *v27;
  id v28;
  id v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v34;

  v4 = (void *)ATResponse.chosenAnswer.getter();
  v5 = ATAnswerChoice.kind.getter();

  if (v5 - 1 >= 2)
  {
    if (v5)
    {
      v19 = sub_1000039D8(&qword_100024B90);
      v12 = swift_allocObject(v19, 112, 7);
      *(_OWORD *)(v12 + 16) = xmmword_10001B8F0;
      v20 = (void *)ATResponse.chosenAnswer.getter();
      v21 = ATAnswerChoice.title.getter();
      v23 = v22;

      *(_QWORD *)(v12 + 56) = &type metadata for String;
      v24 = sub_10000A0B4();
      *(_QWORD *)(v12 + 64) = v24;
      *(_QWORD *)(v12 + 32) = v21;
      *(_QWORD *)(v12 + 40) = v23;
      *(_QWORD *)(v12 + 96) = &type metadata for String;
      *(_QWORD *)(v12 + 104) = v24;
      if (a2)
      {
        v18 = a2;
        goto LABEL_10;
      }
    }
    else
    {
      v11 = sub_1000039D8(&qword_100024B90);
      v12 = swift_allocObject(v11, 112, 7);
      *(_OWORD *)(v12 + 16) = xmmword_10001B8F0;
      v13 = (void *)ATResponse.chosenAnswer.getter();
      v14 = ATAnswerChoice.title.getter();
      v16 = v15;

      *(_QWORD *)(v12 + 56) = &type metadata for String;
      v17 = sub_10000A0B4();
      *(_QWORD *)(v12 + 64) = v17;
      *(_QWORD *)(v12 + 32) = v14;
      *(_QWORD *)(v12 + 40) = v16;
      *(_QWORD *)(v12 + 96) = &type metadata for String;
      *(_QWORD *)(v12 + 104) = v17;
      if (a2)
      {
        v18 = a2;
LABEL_10:
        *(_QWORD *)(v12 + 72) = a1;
        *(_QWORD *)(v12 + 80) = v18;
        v25 = type metadata accessor for MessageParser();
        ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v25);
        v27 = (void *)objc_opt_self(NSBundle);
        swift_bridgeObjectRetain(a2);
        v28 = objc_msgSend(v27, "bundleForClass:", ObjCClassFromMetadata);
        v29 = objc_msgSend(v27, "bundleForClass:", ObjCClassFromMetadata);
        v30._object = (void *)0x800000010001C980;
        v34._object = (void *)0x800000010001C980;
        v30._countAndFlagsBits = 0xD00000000000001ELL;
        v31._countAndFlagsBits = 0;
        v31._object = (void *)0xE000000000000000;
        v34._countAndFlagsBits = 0xD00000000000001ELL;
        v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v30, (Swift::String_optional)0, (NSBundle)v29, v31, v34);

        v7 = static String.localizedStringWithFormat(_:_:)(v32._countAndFlagsBits, v32._object, v12);
        swift_bridgeObjectRelease(v12);

        swift_bridgeObjectRelease(v32._object);
        return v7;
      }
    }
    a1 = ATResponse.responderDisplayName.getter();
    goto LABEL_10;
  }
  v6 = (void *)ATResponse.chosenAnswer.getter();
  v7 = ATAnswerChoice.completedRequestTitle.getter();
  v9 = v8;

  if (!v9)
  {
    v10 = (void *)ATResponse.chosenAnswer.getter();
    v7 = ATAnswerChoice.title.getter();

  }
  return v7;
}

uint64_t sub_1000198E8(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_class *v16;
  unint64_t v17;
  unint64_t v18;
  NSBundle v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t ObjCClassFromMetadata;
  void *v25;
  Swift::String v26;
  unint64_t v28;

  v4 = (void *)ATResponse.chosenAnswer.getter();
  v5 = ATAnswerChoice.kind.getter();

  if (v5 == 2)
  {
    v9 = sub_1000039D8(&qword_100024B90);
    v7 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v7 + 16) = xmmword_10001B220;
    *(_QWORD *)(v7 + 56) = &type metadata for String;
    *(_QWORD *)(v7 + 64) = sub_10000A0B4();
    if (a2)
      v10 = a2;
    else
      a1 = ATResponse.responderDisplayName.getter();
    *(_QWORD *)(v7 + 32) = a1;
    *(_QWORD *)(v7 + 40) = v10;
    v23 = type metadata accessor for MessageParser();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v23);
    v25 = (void *)objc_opt_self(NSBundle);
    swift_bridgeObjectRetain(a2);
    v15 = objc_msgSend(v25, "bundleForClass:", ObjCClassFromMetadata);
    v16 = (objc_class *)objc_msgSend(v25, "bundleForClass:", ObjCClassFromMetadata);
    v18 = 0x800000010001C920;
    v28 = 0x800000010001C920;
    v17 = 0xD000000000000020;
    v19.super.isa = v16;
    v20 = 0;
    v21 = 0xE000000000000000;
    v22 = 0xD000000000000020;
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    v6 = sub_1000039D8(&qword_100024B90);
    v7 = swift_allocObject(v6, 72, 7);
    *(_OWORD *)(v7 + 16) = xmmword_10001B220;
    *(_QWORD *)(v7 + 56) = &type metadata for String;
    *(_QWORD *)(v7 + 64) = sub_10000A0B4();
    if (a2)
      v8 = a2;
    else
      a1 = ATResponse.responderDisplayName.getter();
    *(_QWORD *)(v7 + 32) = a1;
    *(_QWORD *)(v7 + 40) = v8;
    v12 = type metadata accessor for MessageParser();
    v13 = swift_getObjCClassFromMetadata(v12);
    v14 = (void *)objc_opt_self(NSBundle);
    swift_bridgeObjectRetain(a2);
    v15 = objc_msgSend(v14, "bundleForClass:", v13);
    v16 = (objc_class *)objc_msgSend(v14, "bundleForClass:", v13);
    v17 = 0xD000000000000022;
    v18 = 0x800000010001C950;
    v28 = 0x800000010001C950;
    v19.super.isa = v16;
    v20 = 0;
    v21 = 0xE000000000000000;
    v22 = 0xD000000000000022;
LABEL_12:
    v26 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v17, (Swift::String_optional)0, v19, *(Swift::String *)&v20, *(Swift::String *)&v22);

    v11 = static String.localizedStringWithFormat(_:_:)(v26._countAndFlagsBits, v26._object, v7);
    swift_bridgeObjectRelease(v7);

    swift_bridgeObjectRelease(v26._object);
    return v11;
  }
  return 0;
}

uint64_t storeEnumTagSinglePayload for RenderingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100019BD4 + 4 * byte_10001B905[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100019C08 + 4 * byte_10001B900[v4]))();
}

uint64_t sub_100019C08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019C10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100019C18);
  return result;
}

uint64_t sub_100019C24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100019C2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100019C30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019C38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019C44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100019C4C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RenderingError()
{
  return &type metadata for RenderingError;
}

uint64_t sub_100019C6C(char a1)
{
  uint64_t v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  uint64_t countAndFlagsBits;
  objc_class *v9;
  unint64_t v10;
  unint64_t v11;
  NSBundle v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  unint64_t v18;
  Swift::String v19;

  v2 = type metadata accessor for MessageParser();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v2);
  v4 = (void *)objc_opt_self(NSBundle);
  v5 = objc_msgSend(v4, "bundleForClass:", ObjCClassFromMetadata);
  v6._countAndFlagsBits = 0xD000000000000019;
  v6._object = (void *)0x800000010001C9A0;
  v19._object = (void *)0x800000010001C9A0;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v19._countAndFlagsBits = 0xD000000000000019;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v19)._countAndFlagsBits;

  v9 = (objc_class *)objc_msgSend(v4, "bundleForClass:", ObjCClassFromMetadata);
  if ((a1 & 1) != 0)
  {
    v11 = 0xD00000000000001CLL;
    v10 = 0x800000010001C9C0;
    v18 = 0x800000010001C9C0;
    v12.super.isa = v9;
    v13 = 0;
    v14 = 0xE000000000000000;
    v15 = 0xD00000000000001CLL;
  }
  else
  {
    v10 = 0x800000010001C9E0;
    v18 = 0x800000010001C9E0;
    v11 = 0xD000000000000018;
    v12.super.isa = v9;
    v13 = 0;
    v14 = 0xE000000000000000;
    v15 = 0xD000000000000018;
  }
  v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v11, (Swift::String_optional)0, v12, *(Swift::String *)&v13, *(Swift::String *)&v15);

  String.append(_:)(v16);
  swift_bridgeObjectRelease(v16._object);
  return countAndFlagsBits;
}

BOOL sub_100019DE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100019E00()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100019E44()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100019E6C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100019EAC()
{
  char *v0;

  return sub_100019C6C(*v0);
}

unint64_t sub_100019EB8()
{
  unint64_t result;

  result = qword_1000250E8;
  if (!qword_1000250E8)
  {
    result = swift_getWitnessTable(&unk_10001B9B0, &type metadata for RenderingError);
    atomic_store(result, (unint64_t *)&qword_1000250E8);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC22AskToMessagesExtensionP33_2A20391BC7554628DD8617A11178E51519ResourceBundleClass);
}
