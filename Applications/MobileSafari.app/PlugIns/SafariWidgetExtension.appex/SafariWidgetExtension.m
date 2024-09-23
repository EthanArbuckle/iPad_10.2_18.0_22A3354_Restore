uint64_t sub_1000057C4()
{
  uint64_t result;

  result = Color.init(_:bundle:)(0xD000000000000010, 0x800000010003F0D0, 0);
  qword_10005E540 = result;
  return result;
}

uint64_t sub_1000057FC()
{
  uint64_t result;

  result = Color.init(_:bundle:)(0xD000000000000011, 0x800000010003F0B0, 0);
  qword_10005E548 = result;
  return result;
}

uint64_t sub_100005834()
{
  uint64_t result;

  result = static Font.caption.getter();
  qword_10005E550 = result;
  return result;
}

uint64_t sub_100005850()
{
  uint64_t result;

  result = static Font.footnote.getter();
  qword_10005E558 = result;
  return result;
}

uint64_t sub_10000586C()
{
  uint64_t result;

  result = static Font.subheadline.getter();
  qword_10005E560 = result;
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetHeader()
{
  return &type metadata for ReadingListWidgetHeader;
}

uint64_t sub_100005898(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048AF4, 1);
}

uint64_t sub_1000058A8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t KeyPath;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;

  v0 = sub_100006014(&qword_10005C3D8);
  __chkstk_darwin(v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C3E0);
  __chkstk_darwin(v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005C3E8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v2 = static VerticalAlignment.firstTextBaseline.getter(v7);
  *((_QWORD *)v2 + 1) = 0x4008000000000000;
  v2[16] = 0;
  v10 = sub_100006014(&qword_10005C3F0);
  sub_100005AC4((uint64_t)&v2[*(int *)(v10 + 44)]);
  if (qword_10005C1D8 != -1)
    swift_once(&qword_10005C1D8, sub_100005850);
  v11 = qword_10005E558;
  static Font.Weight.semibold.getter();
  v12 = Font.weight(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100041E88);
  sub_100006314((uint64_t)v2, (uint64_t)v5, &qword_10005C3D8);
  v14 = (uint64_t *)&v5[*(int *)(v3 + 36)];
  *v14 = KeyPath;
  v14[1] = v12;
  v15 = sub_100006368((uint64_t)v2, &qword_10005C3D8);
  v16 = static Alignment.leading.getter(v15);
  sub_100005E34(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, 0.0, 1, v16, v17);
  sub_100006368((uint64_t)v5, &qword_10005C3E0);
  v18 = sub_10000605C();
  View.unredacted()(v6, v18);
  return sub_100006368((uint64_t)v9, &qword_10005C3E8);
}

uint64_t sub_100005AC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v43 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v41 = *(_QWORD *)(v1 - 8);
  v42 = v1;
  v2 = __chkstk_darwin(v1);
  v40 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v38 - v4;
  v6 = sub_100006014(&qword_10005C420);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for Image.Scale(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C428);
  v14 = __chkstk_darwin(v13);
  v16 = (uint64_t *)((char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v14);
  v39 = (uint64_t)&v38 - v17;
  v18 = Image.init(systemName:)(0x697261666173, 0xE600000000000000);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Image.Scale.large(_:), v9);
  KeyPath = swift_getKeyPath(&unk_100041EB8);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v8 + *(int *)(v6 + 28), v12, v9);
  *v8 = KeyPath;
  sub_100006314((uint64_t)v8, (uint64_t)v16 + *(int *)(v13 + 36), &qword_10005C420);
  *v16 = v18;
  swift_retain(v18);
  sub_100006368((uint64_t)v8, &qword_10005C420);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release(v18);
  v20 = v39;
  sub_100006288((uint64_t)v16, v39);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0x20676E6964616552, 0xEC0000007473694CLL);
  v21 = v40;
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010003F120);
  v22 = WBSLookUpLocalizedString(_:key:dsohandle:)(v5, v21, &_mh_execute_header);
  v24 = v23;
  v25 = *(void (**)(char *, uint64_t))(v41 + 8);
  v26 = v21;
  v27 = v42;
  v25(v26, v42);
  v25(v5, v27);
  v44[0] = v22;
  v44[1] = v24;
  v28 = sub_1000062D0();
  v29 = Text.init<A>(_:)(v44, &type metadata for String, v28);
  v31 = v30;
  v33 = v32;
  LOBYTE(v27) = v34 & 1;
  sub_100006314(v20, (uint64_t)v16, &qword_10005C428);
  v35 = v43;
  sub_100006314((uint64_t)v16, v43, &qword_10005C428);
  v36 = v35 + *(int *)(sub_100006014(&qword_10005C438) + 48);
  *(_QWORD *)v36 = v29;
  *(_QWORD *)(v36 + 8) = v31;
  *(_BYTE *)(v36 + 16) = v27;
  *(_QWORD *)(v36 + 24) = v33;
  sub_100006358(v29, v31, v27);
  swift_bridgeObjectRetain(v33);
  sub_100006368(v20, &qword_10005C428);
  sub_1000063A4(v29, v31, v27);
  swift_bridgeObjectRelease(v33);
  return sub_100006368((uint64_t)v16, &qword_10005C428);
}

__n128 sub_100005E34@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
  sub_100006314(v16, a9, &qword_10005C3E0);
  v35 = a9 + *(int *)(sub_100006014(&qword_10005C3E8) + 36);
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

uint64_t sub_100005FF8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006014(uint64_t *a1)
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

unint64_t sub_10000605C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C3F8;
  if (!qword_10005C3F8)
  {
    v1 = sub_1000060C8(&qword_10005C3E8);
    sub_10000610C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C3F8);
  }
  return result;
}

uint64_t sub_1000060C8(uint64_t *a1)
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

unint64_t sub_10000610C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C400;
  if (!qword_10005C400)
  {
    v1 = sub_1000060C8(&qword_10005C3E0);
    sub_1000061A8(&qword_10005C408, &qword_10005C3D8, (uint64_t)&protocol conformance descriptor for HStack<A>);
    sub_1000061A8(&qword_10005C410, &qword_10005C418, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C400);
  }
  return result;
}

uint64_t sub_1000061A8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000060C8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000061E8()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_100006208(uint64_t a1)
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

uint64_t sub_100006288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006014(&qword_10005C428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000062D0()
{
  unint64_t result;

  result = qword_10005C430;
  if (!qword_10005C430)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10005C430);
  }
  return result;
}

uint64_t sub_100006314(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006014(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006358(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100006368(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006014(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000063A4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000063B4()
{
  _QWORD v1[2];

  v1[0] = sub_1000060C8(&qword_10005C3E8);
  v1[1] = sub_10000605C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.unredacted()>>, 1);
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsControlToggle()
{
  return &type metadata for SearchEngineSuggestionsControlToggle;
}

uint64_t sub_100006410(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048B38, 1);
}

uint64_t sub_100006420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100041F58);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_1000069FC();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD000000000000044, 0x800000010003F140, KeyPath, sub_100006824, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000024, 0x8000000100041ED0);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000031, 0x800000010003F190);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_100006824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000019, 0x800000010003F1D0);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

uint64_t sub_100006908@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD v18[2];

  v4 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v8 = 28239;
    v9 = 0xE200000000000000;
  }
  else
  {
    v8 = 6710863;
    v9 = 0xE300000000000000;
  }
  WBSLocalizedStringLiteral.init(stringLiteral:)(v8, v9);
  v10 = WBSLookUpLocalizedString(_:dsohandle:)(v7, &_mh_execute_header);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18[0] = v10;
  v18[1] = v12;
  v13 = sub_1000062D0();
  result = Text.init<A>(_:)(v18, &type metadata for String, v13);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = v16 & 1;
  *(_QWORD *)(a2 + 24) = v17;
  return result;
}

unint64_t sub_1000069FC()
{
  unint64_t result;

  result = qword_10005C468;
  if (!qword_10005C468)
  {
    result = swift_getWitnessTable(&unk_100045478, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C468);
  }
  return result;
}

uint64_t sub_100006A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v0 = sub_1000060C8(&qword_10005C458);
  v1 = sub_1000060C8(&qword_10005C450);
  v2 = sub_1000060C8(&qword_10005C448);
  v8 = sub_1000060C8(&qword_10005C440);
  v9 = (void *)sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v4 = sub_1000062D0();
  v8 = v2;
  v9 = &type metadata for String;
  v10 = OpaqueTypeConformance2;
  v11 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v8 = v1;
  v9 = (void *)v5;
  v6 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v8 = v0;
  v9 = (void *)v6;
  return swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

ValueMetadata *type metadata accessor for TabBarLayoutControlPicker()
{
  return &type metadata for TabBarLayoutControlPicker;
}

uint64_t sub_100006B50(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048B7C, 1);
}

uint64_t sub_100006B60@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;

  KeyPath = swift_getKeyPath(&unk_100041FE0);
  sub_100022B14(KeyPath, a1);
  return swift_release(KeyPath);
}

uint64_t sub_100006B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  v0 = sub_1000060C8(&qword_10005C480);
  v1 = sub_1000060C8(&qword_10005C488);
  v5 = sub_1000060C8(&qword_10005C490);
  v6 = &type metadata for String;
  v7 = sub_100006C54();
  v8 = sub_1000062D0();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, 1);
  v5 = v1;
  v6 = (void *)OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = (void *)v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

unint64_t sub_100006C54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C498;
  if (!qword_10005C498)
  {
    v1 = sub_1000060C8(&qword_10005C490);
    result = swift_getWitnessTable(&protocol conformance descriptor for ControlPicker<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C498);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariSuggestionsControlToggle()
{
  return &type metadata for SafariSuggestionsControlToggle;
}

uint64_t sub_100006CB0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048BC0, 1);
}

uint64_t sub_100006CC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100042070);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_1000071B0();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD000000000000044, 0x800000010003F140, KeyPath, sub_1000070C4, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100041FF0);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000002ALL, 0x800000010003F1F0);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_1000070C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000012, 0x800000010003F220);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

unint64_t sub_1000071B0()
{
  unint64_t result;

  result = qword_10005C4A0;
  if (!qword_10005C4A0)
  {
    result = swift_getWitnessTable(&unk_100045A58, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C4A0);
  }
  return result;
}

unint64_t sub_1000071F8()
{
  unint64_t result;

  result = qword_10005C4C8;
  if (!qword_10005C4C8)
  {
    result = swift_getWitnessTable(&unk_100042150, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C4C8);
  }
  return result;
}

uint64_t sub_10000723C()
{
  return sub_1000061A8(&qword_10005C4D0, &qword_10005C4D8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100007268(uint64_t a1)
{
  return sub_1000088A0(a1, qword_10005E568, 0x800000010003F490, (uint64_t)"AutoFill Use Credit Cards");
}

uint64_t sub_100007284(uint64_t a1)
{
  return sub_100008B08(a1, qword_10005E580, 0xD000000000000031, 0x800000010003F520);
}

uint64_t sub_1000072A8(uint64_t a1)
{
  return sub_100008B88(a1, qword_10005E598, 0xD00000000000003ALL, 0x800000010003F4E0);
}

uint64_t sub_1000072CC()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100042C08);
  qword_10005E5B0 = result;
  return result;
}

uint64_t sub_1000072F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100007300()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100007330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005C7C0);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C7C8);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_10000743C, 0, 0);
}

uint64_t sub_10000743C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)
                                  + 1));
  v0[19] = v1;
  v2 = sub_1000080C0();
  *v1 = v0;
  v1[1] = sub_1000074BC;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_1000078D8, 0, &type metadata for AutoFillCreditCardEntity, v2);
}

uint64_t sub_1000074BC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100007510, 0, 0);
}

uint64_t sub_100007510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C200 != -1)
    swift_once(&qword_10005C200, sub_1000072CC);
  v2 = qword_10005E5B0;
  *(_QWORD *)(v0 + 168) = qword_10005E5B0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005C7A8, &qword_10005C7B0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10000760C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_10000760C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_10000768C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000768C()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000071F8();
  v11 = sub_100008278();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_1000078D8, 0, v7, v6, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, &type metadata for AutoFillCreditCardEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for AutoFillCreditCardEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000784C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(v2, *(_QWORD *)(v0 + 120));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000078DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005C7D0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C200 != -1)
    swift_once(&qword_10005C200, sub_1000072CC);
  v4 = qword_10005E5B0;
  v5 = swift_retain(qword_10005E5B0);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100008278();
  v7 = sub_1000061A8(&qword_10005C7D8, &qword_10005C7D0, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for AutoFillCreditCardEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

_QWORD *sub_1000079E4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t (*sub_100007A20(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100007A68;
}

_QWORD *sub_100007A6C@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t (*sub_100007AA8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100007A68;
}

uint64_t sub_100007AF0(uint64_t a1, uint64_t a2)
{
  return sub_10000931C(a1, a2, &qword_10005C200, &qword_10005E5B0, (uint64_t)sub_1000072CC);
}

unint64_t sub_100007B10()
{
  return 0xD000000000000015;
}

unint64_t sub_100007B34()
{
  unint64_t result;

  result = qword_10005C4E0;
  if (!qword_10005C4E0)
  {
    result = swift_getWitnessTable(&unk_1000421E0, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C4E0);
  }
  return result;
}

unint64_t sub_100007B7C()
{
  unint64_t result;

  result = qword_10005C4E8;
  if (!qword_10005C4E8)
  {
    result = swift_getWitnessTable(&unk_100042208, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C4E8);
  }
  return result;
}

uint64_t sub_100007BC0(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100048CD4, 1) + 8);
}

uint64_t sub_100007BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100009418(a1, a2, a3, (uint64_t (*)(void))sub_1000071F8);
}

uint64_t sub_100007BF0@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C1F0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E580, (uint64_t)sub_100007284, a1);
}

uint64_t sub_100007C24@<X0>(uint64_t a1@<X8>)
{
  return sub_100009498(&qword_10005C1F8, (uint64_t)qword_10005E598, (uint64_t)sub_1000072A8, a1);
}

uint64_t sub_100007C40(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005C7BC);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100007330(a1, v5, v4);
}

uint64_t sub_100007CA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000A27C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100007CC8()
{
  return 0xD000000000000029;
}

unint64_t sub_100007CE8()
{
  unint64_t result;

  result = qword_10005C4F8;
  if (!qword_10005C4F8)
  {
    result = swift_getWitnessTable(&unk_100042264, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C4F8);
  }
  return result;
}

unint64_t sub_100007D30()
{
  unint64_t result;

  result = qword_10005C500;
  if (!qword_10005C500)
  {
    result = swift_getWitnessTable(&unk_100042398, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C500);
  }
  return result;
}

uint64_t sub_100007D74(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100007D8C, 0, 0);
}

uint64_t sub_100007D8C()
{
  uint64_t v0;
  unsigned __int8 *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = objc_msgSend(objc_allocWithZone((Class)WBUFormDataController), "init");
  v3 = objc_msgSend(v2, "shouldAutoFillFromCreditCardData");

  *v1 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007DF8(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100007E14, 0, 0);
}

uint64_t sub_100007E14()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = objc_msgSend(objc_allocWithZone((Class)WBUFormDataController), "init");
  objc_msgSend(v2, "setShouldAutoFillFromCreditCardData:", v1);
  v3 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", WBSAutoFillUseCreditCardsChangedNotification, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007EC0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005C790 + dword_10005C790);
  v2 = (_QWORD *)swift_task_alloc(unk_10005C794);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_100007F20()
{
  unint64_t result;

  result = qword_10005C510;
  if (!qword_10005C510)
  {
    result = swift_getWitnessTable(&unk_10004229C, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C510);
  }
  return result;
}

uint64_t sub_100007F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100008414();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100007FCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_100008030()
{
  unint64_t result;

  result = qword_10005C520;
  if (!qword_10005C520)
  {
    result = swift_getWitnessTable(&unk_1000422F4, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C520);
  }
  return result;
}

unint64_t sub_100008078()
{
  unint64_t result;

  result = qword_10005C528;
  if (!qword_10005C528)
  {
    result = swift_getWitnessTable(&unk_100042354, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C528);
  }
  return result;
}

unint64_t sub_1000080C0()
{
  unint64_t result;

  result = qword_10005C530[0];
  if (!qword_10005C530[0])
  {
    result = swift_getWitnessTable(&unk_1000423F8, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, qword_10005C530);
  }
  return result;
}

uint64_t sub_100008104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100008414();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100008170(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_1000081C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100008414();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100008230()
{
  unint64_t result;

  result = qword_10005C548;
  if (!qword_10005C548)
  {
    result = swift_getWitnessTable(&unk_10004237C, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C548);
  }
  return result;
}

unint64_t sub_100008278()
{
  unint64_t result;

  result = qword_10005C550;
  if (!qword_10005C550)
  {
    result = swift_getWitnessTable(&unk_100042540, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C550);
  }
  return result;
}

uint64_t sub_1000082BC()
{
  return sub_100009AE0(&qword_10005C558, qword_10005C560, (void (*)(void))sub_100008278);
}

uint64_t sub_1000082E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100007F20();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100008354()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000839C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100008354;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100008414()
{
  unint64_t result;

  result = qword_10005C578;
  if (!qword_10005C578)
  {
    result = swift_getWitnessTable(&unk_100042224, &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C578);
  }
  return result;
}

uint64_t sub_100008458()
{
  uint64_t v0;

  v0 = qword_10005C4A8;
  swift_bridgeObjectRetain(off_10005C4B0);
  return v0;
}

unint64_t sub_100008490()
{
  unint64_t result;

  result = qword_10005C580;
  if (!qword_10005C580)
  {
    result = swift_getWitnessTable(&unk_100042450, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C580);
  }
  return result;
}

unint64_t sub_1000084D8()
{
  unint64_t result;

  result = qword_10005C588;
  if (!qword_10005C588)
  {
    result = swift_getWitnessTable(&unk_100042488, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C588);
  }
  return result;
}

unint64_t sub_100008520()
{
  unint64_t result;

  result = qword_10005C590;
  if (!qword_10005C590)
  {
    result = swift_getWitnessTable(&unk_1000424B8, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C590);
  }
  return result;
}

void *sub_100008564()
{
  return &protocol witness table for String;
}

unint64_t sub_100008574()
{
  unint64_t result;

  result = qword_10005C598;
  if (!qword_10005C598)
  {
    result = swift_getWitnessTable(&unk_1000424F0, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C598);
  }
  return result;
}

unint64_t sub_1000085BC()
{
  unint64_t result;

  result = qword_10005C5A0;
  if (!qword_10005C5A0)
  {
    result = swift_getWitnessTable(&unk_100042518, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C5A0);
  }
  return result;
}

unint64_t sub_100008604()
{
  unint64_t result;

  result = qword_10005C5A8;
  if (!qword_10005C5A8)
  {
    result = swift_getWitnessTable(&unk_100042598, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C5A8);
  }
  return result;
}

void *sub_100008648()
{
  return &protocol witness table for String;
}

uint64_t sub_100008654@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100009E58(a1, (uint64_t (*)(void))sub_100007D30, a2);
}

uint64_t sub_100008660@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C1E8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E568, (uint64_t)sub_100007268, a1);
}

uint64_t sub_100008684@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_10000AAD4(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_1000086F4()
{
  return sub_1000061A8(&qword_10005C5B0, &qword_10005C5B8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100008720(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000080C0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000875C()
{
  unint64_t result;

  result = qword_10005C5C0;
  if (!qword_10005C5C0)
  {
    result = swift_getWitnessTable(&unk_1000425C8, &type metadata for AutoFillCreditCardEntity);
    atomic_store(result, (unint64_t *)&qword_10005C5C0);
  }
  return result;
}

uint64_t sub_1000087A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007D30();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000087D8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008604();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100008814()
{
  unint64_t result;

  result = qword_10005C5C8;
  if (!qword_10005C5C8)
  {
    result = swift_getWitnessTable(&unk_1000426A0, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C5C8);
  }
  return result;
}

uint64_t sub_100008858()
{
  return sub_1000061A8(&qword_10005C5D0, &qword_10005C5D8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100008884(uint64_t a1)
{
  return sub_1000088A0(a1, qword_10005E5B8, 0x800000010003F340, (uint64_t)"AutoFill Use Contact Info");
}

uint64_t sub_1000088A0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  __int16 v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v29 = a4;
  v27 = a3;
  v5 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v5);
  v28 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v21, a2);
  sub_10000AAD4(v21, (uint64_t)a2);
  v22 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, v27);
  static Locale.current.getter(v22);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v26 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)(v29, 25, 2, v16, 0xD000000000000018, 0x800000010003F360, v13, v10, "App Entity title for 'AutoFill' section in Safari Settings", 58, v26);
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v24 = v28;
  v23(v28, 1, 1, v17);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v20, v24);
}

uint64_t sub_100008AE4(uint64_t a1)
{
  return sub_100008B08(a1, qword_10005E5D0, 0xD000000000000035, 0x800000010003F450);
}

uint64_t sub_100008B08(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v7, a2);
  sub_10000AAD4(v7, (uint64_t)a2);
  return LocalizedStringResource.init(stringLiteral:)(a3, a4);
}

uint64_t sub_100008B64(uint64_t a1)
{
  return sub_100008B88(a1, qword_10005E5E8, 0xD00000000000003ELL, 0x800000010003F410);
}

uint64_t sub_100008B88(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v7, a2);
  v8 = sub_10000AAD4(v7, (uint64_t)a2);
  IntentDescription.init(stringLiteral:)(a3, a4);
  v9 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
}

uint64_t sub_100008C0C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100042BE0);
  qword_10005E600 = result;
  return result;
}

uint64_t sub_100008C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005C768);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C770);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100008D3C, 0, 0);
}

uint64_t sub_100008D3C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10000990C();
  *v1 = v0;
  v1[1] = sub_100008DBC;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10000914C, 0, &type metadata for AutoFillContactInfoEntity, v2);
}

uint64_t sub_100008DBC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100008E10, 0, 0);
}

uint64_t sub_100008E10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C220 != -1)
    swift_once(&qword_10005C220, sub_100008C0C);
  v2 = qword_10005E600;
  *(_QWORD *)(v0 + 168) = qword_10005E600;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005C740, &qword_10005C748, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008F0C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_100008F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000ADB4;
  else
    v5 = sub_100008F8C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100008F8C()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100008814();
  v11 = sub_100009A70();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10000914C, 0, v7, v6, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, &type metadata for AutoFillContactInfoEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for AutoFillContactInfoEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005C778);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C220 != -1)
    swift_once(&qword_10005C220, sub_100008C0C);
  v4 = qword_10005E600;
  v5 = swift_retain(qword_10005E600);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100009A70();
  v7 = sub_1000061A8(&qword_10005C780, &qword_10005C778, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for AutoFillContactInfoEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100009258(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *a1;
  v3 = v1;
  swift_retain(v1);
  IntentParameter.wrappedValue.setter(&v3);
  return swift_release(v1);
}

uint64_t sub_10000929C(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void sub_1000092D0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_100009300(uint64_t a1, uint64_t a2)
{
  return sub_10000931C(a1, a2, &qword_10005C220, &qword_10005E600, (uint64_t)sub_100008C0C);
}

uint64_t sub_10000931C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  if (*a3 != -1)
    swift_once(a3, a5);
  return swift_retain(*a4);
}

unint64_t sub_10000935C()
{
  unint64_t result;

  result = qword_10005C5E0;
  if (!qword_10005C5E0)
  {
    result = swift_getWitnessTable(&unk_100042730, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C5E0);
  }
  return result;
}

unint64_t sub_1000093A4()
{
  unint64_t result;

  result = qword_10005C5E8;
  if (!qword_10005C5E8)
  {
    result = swift_getWitnessTable(&unk_100042758, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005C5E8);
  }
  return result;
}

uint64_t sub_1000093E8(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100048C90, 1) + 8);
}

uint64_t sub_10000940C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100009418(a1, a2, a3, (uint64_t (*)(void))sub_100008814);
}

uint64_t sub_100009418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a4();
  return swift_getOpaqueTypeConformance2(v5, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100009458@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C210, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E5D0, (uint64_t)sub_100008AE4, a1);
}

uint64_t sub_10000947C@<X0>(uint64_t a1@<X8>)
{
  return sub_100009498(&qword_10005C218, (uint64_t)qword_10005E5E8, (uint64_t)sub_100008B64, a1);
}

uint64_t sub_100009498@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = sub_100006014(&qword_10005C788);
  v7 = sub_10000AAD4(v6, a2);
  return sub_10000AD4C(v7, a4);
}

uint64_t sub_1000094EC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005C754);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100008C30(a1, v5, v4);
}

uint64_t sub_100009550@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000A7AC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100009574()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_100009594()
{
  unint64_t result;

  result = qword_10005C5F8;
  if (!qword_10005C5F8)
  {
    result = swift_getWitnessTable(&unk_1000427B4, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C5F8);
  }
  return result;
}

unint64_t sub_1000095DC()
{
  unint64_t result;

  result = qword_10005C600;
  if (!qword_10005C600)
  {
    result = swift_getWitnessTable(&unk_1000428E8, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C600);
  }
  return result;
}

uint64_t sub_100009620(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100009638, 0, 0);
}

uint64_t sub_100009638()
{
  uint64_t v0;
  unsigned __int8 *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = objc_msgSend(objc_allocWithZone((Class)WBUFormDataController), "init");
  v3 = objc_msgSend(v2, "shouldAutoFillFromAddressBook");

  *v1 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000096A4(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_1000096C0, 0, 0);
}

uint64_t sub_1000096C0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = objc_msgSend(objc_allocWithZone((Class)WBUFormDataController), "init");
  objc_msgSend(v2, "setShouldAutoFillFromAddressBook:", v1);
  v3 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", WBSAutoFillUseContactInfoChangedNotification, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000976C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005C728 + dword_10005C728);
  v2 = (_QWORD *)swift_task_alloc(unk_10005C72C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_1000097CC()
{
  unint64_t result;

  result = qword_10005C610;
  if (!qword_10005C610)
  {
    result = swift_getWitnessTable(&unk_1000427EC, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C610);
  }
  return result;
}

uint64_t sub_100009810(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100009C20();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000987C()
{
  unint64_t result;

  result = qword_10005C620;
  if (!qword_10005C620)
  {
    result = swift_getWitnessTable(&unk_100042844, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C620);
  }
  return result;
}

unint64_t sub_1000098C4()
{
  unint64_t result;

  result = qword_10005C628;
  if (!qword_10005C628)
  {
    result = swift_getWitnessTable(&unk_1000428A4, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C628);
  }
  return result;
}

unint64_t sub_10000990C()
{
  unint64_t result;

  result = qword_10005C630[0];
  if (!qword_10005C630[0])
  {
    result = swift_getWitnessTable(&unk_100042948, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, qword_10005C630);
  }
  return result;
}

uint64_t sub_100009950(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100009C20();
  *v5 = v2;
  v5[1] = sub_10000ADA8;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000099BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100009C20();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100009A28()
{
  unint64_t result;

  result = qword_10005C648;
  if (!qword_10005C648)
  {
    result = swift_getWitnessTable(&unk_1000428CC, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C648);
  }
  return result;
}

unint64_t sub_100009A70()
{
  unint64_t result;

  result = qword_10005C650;
  if (!qword_10005C650)
  {
    result = swift_getWitnessTable(&unk_100042A90, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C650);
  }
  return result;
}

uint64_t sub_100009AB4()
{
  return sub_100009AE0(&qword_10005C658, qword_10005C660, (void (*)(void))sub_100009A70);
}

uint64_t sub_100009AE0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000060C8(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009B44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000097CC();
  *v5 = v2;
  v5[1] = sub_10000AD94;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100009BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000AD94;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100009C20()
{
  unint64_t result;

  result = qword_10005C678;
  if (!qword_10005C678)
  {
    result = swift_getWitnessTable(&unk_100042774, &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C678);
  }
  return result;
}

uint64_t sub_100009C64()
{
  uint64_t v0;

  v0 = qword_10005C4B8;
  swift_bridgeObjectRetain(off_10005C4C0);
  return v0;
}

unint64_t sub_100009C9C()
{
  unint64_t result;

  result = qword_10005C680;
  if (!qword_10005C680)
  {
    result = swift_getWitnessTable(&unk_1000429A0, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C680);
  }
  return result;
}

unint64_t sub_100009CE4()
{
  unint64_t result;

  result = qword_10005C688;
  if (!qword_10005C688)
  {
    result = swift_getWitnessTable(&unk_1000429D8, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C688);
  }
  return result;
}

unint64_t sub_100009D2C()
{
  unint64_t result;

  result = qword_10005C690;
  if (!qword_10005C690)
  {
    result = swift_getWitnessTable(&unk_100042A08, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C690);
  }
  return result;
}

unint64_t sub_100009D74()
{
  unint64_t result;

  result = qword_10005C698;
  if (!qword_10005C698)
  {
    result = swift_getWitnessTable(&unk_100042A40, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C698);
  }
  return result;
}

unint64_t sub_100009DBC()
{
  unint64_t result;

  result = qword_10005C6A0;
  if (!qword_10005C6A0)
  {
    result = swift_getWitnessTable(&unk_100042A68, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C6A0);
  }
  return result;
}

unint64_t sub_100009E08()
{
  unint64_t result;

  result = qword_10005C6A8;
  if (!qword_10005C6A8)
  {
    result = swift_getWitnessTable(&unk_100042AE8, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C6A8);
  }
  return result;
}

uint64_t sub_100009E4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100009E58(a1, (uint64_t (*)(void))sub_1000095DC, a2);
}

uint64_t sub_100009E58@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v5 = a2();
  result = _UniqueEntity.id.getter(a1, v5);
  *a3 = result;
  a3[1] = v7;
  return result;
}

uint64_t sub_100009E94@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C208, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E5B8, (uint64_t)sub_100008884, a1);
}

uint64_t sub_100009EB8()
{
  return sub_1000061A8(&qword_10005C6B0, &qword_10005C6B8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100009EE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000990C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009F20()
{
  unint64_t result;

  result = qword_10005C6C0;
  if (!qword_10005C6C0)
  {
    result = swift_getWitnessTable(&unk_100042B18, &type metadata for AutoFillContactInfoEntity);
    atomic_store(result, (unint64_t *)&qword_10005C6C0);
  }
  return result;
}

uint64_t sub_100009F64(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000095DC();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100009F9C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009E08();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery()
{
  return &type metadata for AutoFillContactInfoEntity.AutoFillContactInfoEntityQuery;
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity()
{
  return &type metadata for AutoFillContactInfoEntity;
}

__n128 initializeWithTake for AutoFillContactInfoEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AutoFillContactInfoEntity.UpdateIntent_value()
{
  return &type metadata for AutoFillContactInfoEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery()
{
  return &type metadata for AutoFillCreditCardEntity.AutoFillCreditCardEntityQuery;
}

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity()
{
  return &type metadata for AutoFillCreditCardEntity;
}

uint64_t destroy for AutoFillCreditCardEntity.UpdateIntent_value(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s21SafariWidgetExtension25AutoFillContactInfoEntityV18UpdateIntent_valueVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for BlockPopUpsEntity.UpdateIntent_value(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

_QWORD *assignWithTake for BlockPopUpsEntity.UpdateIntent_value(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlockPopUpsEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BlockPopUpsEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AutoFillCreditCardEntity.UpdateIntent_value()
{
  return &type metadata for AutoFillCreditCardEntity.UpdateIntent_value;
}

uint64_t sub_10000A1CC()
{
  return sub_1000061A8(&qword_10005C6C8, &qword_10005C6D0, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000A1F8()
{
  return sub_1000061A8(&qword_10005C6D8, &qword_10005C6D0, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000A224()
{
  return sub_1000061A8(&qword_10005C6E0, &qword_10005C6E8, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000A250()
{
  return sub_1000061A8(&qword_10005C6F0, &qword_10005C6E8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000A27C()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005C720);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000023, 0x800000010003F2D0);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_1000080C0();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000033, 0x800000010003F300);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_10000A5A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A65C, 0, 0);
}

uint64_t sub_10000A65C()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005C4D8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0x4320746964657243, 0xEC00000073647261);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005C7A8, &qword_10005C7B0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005C798, 0, &unk_10005C7A0, 0, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_10000A7AC()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005C710);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000023, 0x800000010003F260);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_10000990C();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000037, 0x800000010003F290);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_10000AAD4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10000AAEC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000AB2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000ABE8, 0, 0);
}

uint64_t sub_10000ABE8()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005C5D8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x800000010003F3C0);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005C740, &qword_10005C748, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005C730, 0, &unk_10005C738, 0, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_10000AD40@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_10000AD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006014(&qword_10005C788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000ADC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char v20;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[1];
    v4[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)v4 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain(v7);
    v11 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v15 = *v10;
      *v9 = *v10;
      swift_retain(v15);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
    v16 = *(int *)(a3 + 24);
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    v19 = *(_QWORD *)v18;
    v20 = v18[8];
    sub_10000AED4(*(_QWORD *)v18, v20);
    *(_QWORD *)v17 = v19;
    v17[8] = v20;
  }
  return v4;
}

uint64_t sub_10000AED4(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_10000AEE0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v5 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  return sub_10000AF70(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t sub_10000AF70(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

uint64_t sub_10000AF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  swift_bridgeObjectRetain(v6);
  v10 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
    v12 = 1;
  }
  else
  {
    v13 = *v9;
    *v8 = *v9;
    swift_retain(v13);
    v12 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v10, v12);
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = *(_QWORD *)v16;
  v18 = *(_BYTE *)(v16 + 8);
  sub_10000AED4(*(_QWORD *)v16, v18);
  *(_QWORD *)v15 = v17;
  *(_BYTE *)(v15 + 8) = v18;
  return a1;
}

uint64_t sub_10000B064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)(a2 + v8);
    sub_10000B174(a1 + v8);
    v11 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  v15 = *(int *)(a3 + 24);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  sub_10000AED4(*(_QWORD *)v17, v19);
  v20 = *(_QWORD *)v16;
  v21 = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v19;
  sub_10000AF70(v20, v21);
  return a1;
}

uint64_t sub_10000B174(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006014(&qword_10005C7E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_10000B1B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  return a1;
}

uint64_t sub_10000B288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_10000B174(a1 + v7);
    v10 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  LOBYTE(v14) = *((_BYTE *)v14 + 8);
  v16 = *(_QWORD *)v13;
  v17 = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = (_BYTE)v14;
  sub_10000AF70(v16, v17);
  return a1;
}

uint64_t sub_10000B388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B394);
}

uint64_t sub_10000B394(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100006014(&qword_10005C7E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_10000B414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B420);
}

uint64_t sub_10000B420(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100006014(&qword_10005C7E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SmallReadingListWidgetBackgroundView(uint64_t a1)
{
  uint64_t result;

  result = qword_10005C848;
  if (!qword_10005C848)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SmallReadingListWidgetBackgroundView);
  return result;
}

void sub_10000B4D4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100042CD8;
  sub_10000B550(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_100042CF0;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10000B550(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10005C858)
  {
    v2 = type metadata accessor for RedactionReasons(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10005C858);
  }
}

uint64_t sub_10000B5A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048D40, 1);
}

double sub_10000B5B4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _QWORD v15[9];
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;

  if ((sub_10000B6F4() & 1) != 0)
  {
    v3 = static Alignment.center.getter();
    v5 = v4;
    sub_10000B920(v1, (uint64_t)&v18);
    v6 = 256;
    if (!BYTE1(v21))
      v6 = 0;
    v15[0] = v3;
    v15[1] = v5;
    *(_OWORD *)&v15[2] = v18;
    *(_OWORD *)&v15[4] = v19;
    *(_OWORD *)&v15[6] = v20;
    v15[8] = v6 | v21;
    v16 = *((_QWORD *)&v21 + 1);
    v17 = 0;
  }
  else
  {
    if (qword_10005C1C8 != -1)
      swift_once(&qword_10005C1C8, sub_1000057FC);
    v15[0] = qword_10005E548;
    memset(&v15[1], 0, 64);
    v16 = 0;
    v17 = 1;
    swift_retain(qword_10005E548);
  }
  v7 = sub_100006014(&qword_10005C890);
  v8 = sub_10000BE68();
  _ConditionalContent<>.init(storage:)(&v18, v15, v7, &type metadata for Color, v8, &protocol witness table for Color);
  result = *(double *)&v18;
  v10 = v19;
  v11 = v20;
  v12 = v21;
  v13 = v22;
  v14 = v23;
  *(_OWORD *)a1 = v18;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)(a1 + 48) = v12;
  *(_OWORD *)(a1 + 64) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return result;
}

uint64_t sub_10000B6F4()
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
  uint64_t v19;
  char v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v27;

  v1 = v0;
  v2 = type metadata accessor for RedactionReasons(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v27 - v7;
  v9 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v27 - v13;
  v15 = *(_QWORD *)(v0 + 8);
  if (!*(_QWORD *)(v15 + 16)
    || (v16 = type metadata accessor for BookmarkItem(0),
        v17 = *(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80),
        !*(_QWORD *)(v15 + ((v17 + 32) & ~v17) + *(int *)(v16 + 28))))
  {
    sub_10000BEB4(v1, (uint64_t)v14);
    sub_10000BEF8((uint64_t)v14);
    sub_10000BEB4(v1, (uint64_t)v12);
    goto LABEL_6;
  }
  sub_10000BEB4(v1, (uint64_t)v14);
  sub_1000131F8((uint64_t)v8);
  v18 = sub_10000BF34(&qword_10005C8A8, (uint64_t)&protocol conformance descriptor for RedactionReasons);
  dispatch thunk of SetAlgebra.init()(v2, v18);
  v19 = sub_10000BF34(&qword_10005C8B0, (uint64_t)&protocol conformance descriptor for RedactionReasons);
  v20 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v6, v2, v19);
  v21 = *(void (**)(char *, uint64_t))(v3 + 8);
  v21(v6, v2);
  v21(v8, v2);
  sub_10000BEF8((uint64_t)v14);
  sub_10000BEB4(v1, (uint64_t)v12);
  if ((v20 & 1) == 0)
  {
LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  v22 = &v12[*(int *)(v9 + 24)];
  v23 = *(_QWORD *)v22;
  v24 = v22[8];
  sub_10000AED4(*(_QWORD *)v22, v24);
  v25 = sub_100013224(v23, v24);
  sub_10000AF70(v23, v24);
LABEL_7:
  sub_10000BEF8((uint64_t)v12);
  return v25 & 1;
}

double sub_10000B920@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  double result;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v4 = type metadata accessor for Image.ResizingMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v8 + 16)
    && (v9 = type metadata accessor for BookmarkItem(0),
        v10 = *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80),
        (v11 = *(_QWORD *)(v8 + ((v10 + 32) & ~v10) + *(int *)(v9 + 28))) != 0))
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    swift_retain(v11);
    v12 = Image.resizable(capInsets:resizingMode:)(v7, v11, 0.0, 0.0, 0.0, 0.0);
    swift_release(v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v12 = 0;
  }
  sub_10000BA5C((uint64_t)&v17);
  v13 = v17;
  *(_QWORD *)a2 = v12;
  *(_QWORD *)(a2 + 8) = v13;
  result = *(double *)&v18;
  v15 = v19;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v15;
  *(_WORD *)(a2 + 48) = 256;
  *(_QWORD *)(a2 + 56) = 0x3FE3333333333333;
  return result;
}

double sub_10000BA5C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double result;
  __int128 v44;
  uint64_t v45;
  _OWORD v46[2];
  uint64_t v47;

  v2 = type metadata accessor for Color.RGBColorSpace(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005C8A0);
  v7 = swift_allocObject(v6, 272, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100042C30;
  v8 = enum case for Color.RGBColorSpace.sRGB(_:);
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v9(v5, enum case for Color.RGBColorSpace.sRGB(_:), v2);
  v10 = Color.init(_:white:opacity:)(v5, 0.0, 1.0);
  *(_QWORD *)(v7 + 32) = Gradient.Stop.init(color:location:)(v10, 0.0);
  *(_QWORD *)(v7 + 40) = v11;
  v9(v5, v8, v2);
  v12 = Color.init(_:white:opacity:)(v5, 0.0, 0.994603225);
  *(_QWORD *)(v7 + 48) = Gradient.Stop.init(color:location:)(v12, 0.03125);
  *(_QWORD *)(v7 + 56) = v13;
  v9(v5, v8, v2);
  v14 = Color.init(_:white:opacity:)(v5, 0.0, 0.978587023);
  *(_QWORD *)(v7 + 64) = Gradient.Stop.init(color:location:)(v14, 0.0625);
  *(_QWORD *)(v7 + 72) = v15;
  v9(v5, v8, v2);
  v16 = Color.init(_:white:opacity:)(v5, 0.0, 0.952464435);
  *(_QWORD *)(v7 + 80) = Gradient.Stop.init(color:location:)(v16, 0.09375);
  *(_QWORD *)(v7 + 88) = v17;
  v9(v5, v8, v2);
  v18 = Color.init(_:white:opacity:)(v5, 0.0, 0.917060124);
  *(_QWORD *)(v7 + 96) = Gradient.Stop.init(color:location:)(v18, 0.125);
  *(_QWORD *)(v7 + 104) = v19;
  v9(v5, v8, v2);
  v20 = Color.init(_:white:opacity:)(v5, 0.0, 0.822990973);
  *(_QWORD *)(v7 + 112) = Gradient.Stop.init(color:location:)(v20, 0.1875);
  *(_QWORD *)(v7 + 120) = v21;
  v9(v5, v8, v2);
  v22 = Color.init(_:white:opacity:)(v5, 0.0, 0.707279774);
  *(_QWORD *)(v7 + 128) = Gradient.Stop.init(color:location:)(v22, 0.25);
  *(_QWORD *)(v7 + 136) = v23;
  v9(v5, v8, v2);
  v24 = Color.init(_:white:opacity:)(v5, 0.0, 0.458754447);
  *(_QWORD *)(v7 + 144) = Gradient.Stop.init(color:location:)(v24, 0.375);
  *(_QWORD *)(v7 + 152) = v25;
  v9(v5, v8, v2);
  v26 = Color.init(_:white:opacity:)(v5, 0.0, 0.346236755);
  *(_QWORD *)(v7 + 160) = Gradient.Stop.init(color:location:)(v26, 0.4375);
  *(_QWORD *)(v7 + 168) = v27;
  v9(v5, v8, v2);
  v28 = Color.init(_:white:opacity:)(v5, 0.0, 0.250244738);
  *(_QWORD *)(v7 + 176) = Gradient.Stop.init(color:location:)(v28, 0.5);
  *(_QWORD *)(v7 + 184) = v29;
  v9(v5, v8, v2);
  v30 = Color.init(_:white:opacity:)(v5, 0.0, 0.173203094);
  *(_QWORD *)(v7 + 192) = Gradient.Stop.init(color:location:)(v30, 0.5625);
  *(_QWORD *)(v7 + 200) = v31;
  v9(v5, v8, v2);
  v32 = Color.init(_:white:opacity:)(v5, 0.0, 0.114800887);
  *(_QWORD *)(v7 + 208) = Gradient.Stop.init(color:location:)(v32, 0.625);
  *(_QWORD *)(v7 + 216) = v33;
  v9(v5, v8, v2);
  v34 = Color.init(_:white:opacity:)(v5, 0.0, 0.0728674787);
  *(_QWORD *)(v7 + 224) = Gradient.Stop.init(color:location:)(v34, 0.6875);
  *(_QWORD *)(v7 + 232) = v35;
  v9(v5, v8, v2);
  v36 = Color.init(_:white:opacity:)(v5, 0.0, 0.0442915775);
  *(_QWORD *)(v7 + 240) = Gradient.Stop.init(color:location:)(v36, 0.75);
  *(_QWORD *)(v7 + 248) = v37;
  v9(v5, v8, v2);
  v38 = Color.init(_:white:opacity:)(v5, 0.0, 0.0143711881);
  *(_QWORD *)(v7 + 256) = Gradient.Stop.init(color:location:)(v38, 0.875);
  *(_QWORD *)(v7 + 264) = v39;
  v40 = static UnitPoint.top.getter();
  v42 = v41;
  Gradient.init(stops:)(v7);
  LinearGradient.init(gradient:startPoint:endPoint:)(v46, 0.5, 0.6, v40, v42);
  result = *(double *)v46;
  v44 = v46[1];
  *(_OWORD *)a1 = v46[0];
  *(_OWORD *)(a1 + 16) = v44;
  *(_QWORD *)(a1 + 32) = v47;
  return result;
}

unint64_t sub_10000BE68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C898;
  if (!qword_10005C898)
  {
    v1 = sub_1000060C8(&qword_10005C890);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C898);
  }
  return result;
}

uint64_t sub_10000BEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BEF8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000BF34(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for RedactionReasons(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000BF78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C8B8;
  if (!qword_10005C8B8)
  {
    v1 = sub_1000060C8(&qword_10005C8C0);
    sub_10000BE68();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C8B8);
  }
  return result;
}

uint64_t destroy for ReadingListWidget(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 16));
}

_QWORD *_s21SafariWidgetExtension17ReadingListWidgetVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for ReadingListWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for ReadingListWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for ReadingListWidget(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(a1[1]);
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingListWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingListWidget()
{
  return &type metadata for ReadingListWidget;
}

uint64_t sub_10000C1A0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048D84, 1);
}

uint64_t sub_10000C1B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  void (*v29)(uint64_t, _QWORD, uint64_t);
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __n128 v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t OpaqueTypeConformance2;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  _UNKNOWN **v97;

  v78 = a2;
  v79 = a1;
  v93 = a4;
  v5 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v80 = *(_QWORD *)(v5 - 8);
  v81 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006014(&qword_10005C8C8);
  v9 = *(_QWORD *)(v8 - 8);
  v82 = v8;
  v83 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006014(&qword_10005C8D0);
  v13 = *(_QWORD *)(v12 - 8);
  v86 = v12;
  v87 = v13;
  __chkstk_darwin(v12);
  v77 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006014(&qword_10005C8D8);
  v16 = *(_QWORD *)(v15 - 8);
  v89 = v15;
  v90 = v16;
  __chkstk_darwin(v15);
  v84 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100006014(&qword_10005C8E0);
  v19 = *(_QWORD *)(v18 - 8);
  v91 = v18;
  v92 = v19;
  __chkstk_darwin(v18);
  v88 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100006014(&qword_10005C8E8);
  v22 = type metadata accessor for WidgetFamily(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(_QWORD *)(v23 + 72);
  v25 = *(unsigned __int8 *)(v23 + 80);
  v26 = (v25 + 32) & ~v25;
  v27 = swift_allocObject(v21, v26 + 3 * v24, v25 | 7);
  v85 = v27;
  *(_OWORD *)(v27 + 16) = xmmword_100042D60;
  v28 = v27 + v26;
  v29 = *(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104);
  v29(v27 + v26, enum case for WidgetFamily.systemSmall(_:), v22);
  v29(v28 + v24, enum case for WidgetFamily.systemMedium(_:), v22);
  v29(v28 + 2 * v24, enum case for WidgetFamily.systemLarge(_:), v22);
  v96 = type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  v97 = &off_100056060;
  v94 = a3;
  v30 = type metadata accessor for ReadingListWidgetView(0);
  v31 = sub_10000C854();
  v32 = sub_10000C89C();
  v33 = v78;
  swift_bridgeObjectRetain(v78);
  v34 = swift_retain(a3);
  StaticConfiguration.init<A>(kind:provider:content:)(v79, v33, &v94, sub_10000C740, 0, v30, &type metadata for ReadingListWidgetTimelineProvider, v31, v34, v32);
  v35 = v7;
  WBSLocalizedStringLiteral.init(stringLiteral:)(0x20676E6964616552, 0xEC0000007473694CLL);
  v36 = WBSLookUpLocalizedString(_:dsohandle:)(v7, &_mh_execute_header);
  v38 = v37;
  v80 = *(_QWORD *)(v80 + 8);
  v39 = v7;
  v40 = v81;
  ((void (*)(char *, uint64_t))v80)(v39, v81);
  v94 = v36;
  v95 = v38;
  v41 = sub_1000062D0();
  v42 = Text.init<A>(_:)(&v94, &type metadata for String, v41);
  v44 = v43;
  v46 = v45;
  v48 = v47 & 1;
  v49 = sub_10000C8E0();
  v50 = v82;
  WidgetConfiguration.configurationDisplayName(_:)(v42, v44, v48, v46, v82, v49);
  sub_1000063A4(v42, v44, v48);
  swift_bridgeObjectRelease(v46);
  v51 = v50;
  (*(void (**)(char *, uint64_t))(v83 + 8))(v11, v50);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000024, 0x800000010003F560);
  v52 = WBSLookUpLocalizedString(_:dsohandle:)(v35, &_mh_execute_header);
  v54 = v53;
  ((void (*)(char *, uint64_t))v80)(v35, v40);
  v94 = v52;
  v95 = v54;
  v55 = Text.init<A>(_:)(&v94, &type metadata for String, v41);
  v57 = v56;
  v59 = v58;
  v61 = v60 & 1;
  v94 = v51;
  v95 = v49;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v94, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v63 = v84;
  v64 = v86;
  v65 = v77;
  WidgetConfiguration.description(_:)(v55, v57, v61, v59, v86, OpaqueTypeConformance2);
  sub_1000063A4(v55, v57, v61);
  swift_bridgeObjectRelease(v59);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v65, v64);
  v66 = sub_100006014(&qword_10005C908);
  v67 = type metadata accessor for WidgetLocation(0);
  v68 = swift_allocObject(v66, ((*(unsigned __int8 *)(*(_QWORD *)(v67 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v67 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v67 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v67 - 8) + 80) | 7);
  *(_OWORD *)(v68 + 16) = xmmword_100042D70;
  static WidgetLocation.continuityMac.getter();
  v94 = v64;
  v95 = OpaqueTypeConformance2;
  v69 = swift_getOpaqueTypeConformance2(&v94, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v71 = v88;
  v70 = v89;
  v72 = v85;
  WidgetConfiguration.disfavoredLocations(_:for:)(v68, v85, v89, v69);
  swift_bridgeObjectRelease(v68);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v63, v70);
  v94 = v70;
  v95 = v69;
  v73 = swift_getOpaqueTypeConformance2(&v94, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disfavoredLocations(_:for:)>>, 1);
  v74 = v91;
  WidgetConfiguration.supportedFamilies(_:)(v72, v91, v73);
  swift_bridgeObjectRelease(v72);
  return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v71, v74);
}

uint64_t sub_10000C740@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for ReadingListWidgetView(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = *(_BYTE *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *v7 = v6;
  *((_QWORD *)v7 + 1) = v8;
  v9 = &v7[*(int *)(v5 + 20)];
  *(_QWORD *)v9 = swift_getKeyPath(&unk_100042DD8);
  v10 = sub_100006014(&qword_10005C910);
  swift_storeEnumTagMultiPayload(v9, v10, 0);
  sub_10000C96C((uint64_t)v7, a2);
  return swift_bridgeObjectRetain(v8);
}

uint64_t sub_10000C7F8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  result = swift_initStaticObject(v2, &unk_10005C3C8);
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000100042D60;
  a1[2] = result;
  return result;
}

uint64_t sub_10000C848@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_10000C1B0(*v1, v1[1], v1[2], a1);
}

unint64_t sub_10000C854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C8F0;
  if (!qword_10005C8F0)
  {
    v1 = type metadata accessor for ReadingListWidgetView(255);
    result = swift_getWitnessTable(&unk_1000431C0, v1);
    atomic_store(result, (unint64_t *)&qword_10005C8F0);
  }
  return result;
}

unint64_t sub_10000C89C()
{
  unint64_t result;

  result = qword_10005C8F8;
  if (!qword_10005C8F8)
  {
    result = swift_getWitnessTable(&unk_100042F04, &type metadata for ReadingListWidgetTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_10005C8F8);
  }
  return result;
}

unint64_t sub_10000C8E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C900;
  if (!qword_10005C900)
  {
    v1 = sub_1000060C8(&qword_10005C8C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for StaticConfiguration<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005C900);
  }
  return result;
}

uint64_t sub_10000C92C()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10000C94C()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10000C96C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReadingListWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C9B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_1000060C8(&qword_10005C8E0);
  v1 = sub_1000060C8(&qword_10005C8D8);
  v2 = sub_1000060C8(&qword_10005C8D0);
  v7 = sub_1000060C8(&qword_10005C8C8);
  v8 = sub_10000C8E0();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disfavoredLocations(_:for:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

ValueMetadata *type metadata accessor for LandscapeTabBarControlToggle()
{
  return &type metadata for LandscapeTabBarControlToggle;
}

uint64_t sub_10000CA8C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048DC8, 1);
}

uint64_t sub_10000CA9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100042E70);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_10000CF8C();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD00000000000003CLL, 0x800000010003F590, KeyPath, sub_10000CEA0, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100042DF0);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000029, 0x800000010003F5D0);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_10000CEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000011, 0x800000010003F600);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

unint64_t sub_10000CF8C()
{
  unint64_t result;

  result = qword_10005C918;
  if (!qword_10005C918)
  {
    result = swift_getWitnessTable(&unk_100047A28, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005C918);
  }
  return result;
}

id sub_10000CFD0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSString v23;
  id v24;
  uint64_t v26;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v26 - v7;
  v9 = objc_msgSend(a1, "readingListIconUUID");
  if (!v9)
    return 0;
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = objc_msgSend((id)objc_opt_self(WebBookmarkCollection), "bookmarkImagesDirectoryPath");
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;

  URL.init(fileURLWithPath:)(v15, v17);
  swift_bridgeObjectRelease(v17);
  URL.appendingPathComponent(_:isDirectory:)(v11, v13, 0);
  swift_bridgeObjectRelease(v13);
  v18 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v19 = v18(v6, v2);
  URL.path.getter(v19);
  v21 = v20;
  v22 = objc_allocWithZone((Class)UIImage);
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  v24 = objc_msgSend(v22, "initWithContentsOfFile:", v23);

  if (v24)
    v24 = (id)Image.init(uiImage:)(v24);
  v18(v8, v2);
  return v24;
}

uint64_t sub_10000D188()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ReadingListWidgetWebBookmarksDataSource()
{
  return objc_opt_self(_TtC21SafariWidgetExtension39ReadingListWidgetWebBookmarksDataSource);
}

size_t sub_10000D1B8(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;

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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100006014(qword_10005C9E0);
  v11 = *(_QWORD *)(type metadata accessor for BookmarkItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_29;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = type metadata accessor for BookmarkItem(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((v5 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v20, v21, v8, v17);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v15;
}

uint64_t sub_10000D32C(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  Swift::Int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  if (v2 < 0)
    v15 = v2;
  else
    v15 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v5 = _CocoaArrayWrapper.endIndex.getter(v15);
  result = swift_bridgeObjectRelease(v2);
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    if (v2 < 0)
      v9 = v2;
    else
      v9 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v10 = _CocoaArrayWrapper.endIndex.getter(v9);
    result = swift_bridgeObjectRelease(v2);
    if (v10 < 0)
      goto LABEL_37;
    swift_bridgeObjectRetain(v2);
    v8 = _CocoaArrayWrapper.endIndex.getter(v9);
    result = swift_bridgeObjectRelease(v2);
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    return result;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_10000E54C();
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v11);
      v11 = v12;
    }
    while (v7 != v12);
  }
  if (v4)
  {
    if (v2 < 0)
      v14 = v2;
    else
      v14 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v13 = _CocoaArrayWrapper.subscript.getter(0, v7, v14);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v13 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
  }
  return v13;
}

id sub_10000D4C4(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id result;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  __n128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  BOOL v43;
  unint64_t v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  id v48;
  NSString v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  NSString v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  BOOL v77;
  uint64_t v78;
  _QWORD *v79;
  __n128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  void (*v86)(uint64_t);
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t);
  char *v98;
  uint64_t v99;
  _QWORD *v100;

  v6 = sub_100006014(&qword_10005C9B8);
  __chkstk_darwin(v6);
  v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v94 - 8);
  __chkstk_darwin(v94);
  v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for BookmarkItem(0);
  v91 = *(_QWORD *)(v12 - 8);
  v92 = v12;
  v13 = __chkstk_darwin(v12);
  v96 = (uint64_t)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v90 = (uint64_t *)((char *)&v82 - v16);
  __chkstk_darwin(v15);
  v89 = (uint64_t)&v82 - v17;
  v18 = type metadata accessor for ReadingListWidgetEntry(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void *)objc_opt_self(WBCollectionConfiguration);
  swift_retain_n(a3, 2);
  v22 = objc_msgSend(v21, "readonlySafariBookmarkCollectionConfiguration");
  v23 = objc_msgSend(objc_allocWithZone((Class)WebBookmarkCollection), "initWithConfiguration:", v22);

  if (!v23)
  {
    v34 = swift_retain(a3);
    static Date.now.getter(v34);
    *v20 = 1;
    *((_QWORD *)v20 + 1) = &_swiftEmptyArrayStorage;
    a2(v20);
    sub_10000E510((uint64_t)v20);
    return (id)swift_release_n(a3, 3);
  }
  v84 = v18;
  v99 = v9;
  v93 = v8;
  v88 = v23;
  v24 = objc_msgSend(v23, "readingListWithUnreadOnly:", 0);
  v25 = objc_msgSend(v24, "bookmarkArrayRequestingCount:", 1);

  v26 = sub_10000E54C();
  v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, v26);

  if ((unint64_t)v27 >> 62)
  {
    if (v27 < 0)
      v81 = v27;
    else
      v81 = v27 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v27);
    v28 = _CocoaArrayWrapper.endIndex.getter(v81);
    swift_bridgeObjectRelease(v27);
  }
  else
  {
    v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v27);
  v98 = v11;
  v86 = (void (*)(uint64_t))a2;
  v87 = a3;
  v85 = v20;
  v83 = v28;
  if (!v28)
  {
    v33 = &_swiftEmptyArrayStorage;
    v30 = (uint64_t)v93;
    goto LABEL_10;
  }
  result = objc_msgSend(v88, "readingListWithUnreadOnly:", 1);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  v30 = (uint64_t)v93;
  if (HIDWORD(a1))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v31 = result;
  v32 = objc_msgSend(result, "bookmarkArrayRequestingCount:", a1);

  v33 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v32, v26);
LABEL_10:
  v35 = sub_10000D32C(a1, (unint64_t)v33);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  result = (id)swift_bridgeObjectRelease(v33);
  v44 = (v41 >> 1) - v39;
  v42 = v41 >> 1 == v39;
  v43 = (uint64_t)(v41 >> 1) <= v39;
  v45 = v94;
  if (v42)
  {
    swift_unknownObjectRelease(v35);
    v100 = &_swiftEmptyArrayStorage;
LABEL_28:
    v77 = v83 == 0;
    v78 = (uint64_t)v85;
    a3 = v87;
    swift_retain(v87);
    v79 = v100;
    swift_bridgeObjectRetain(v100);
    static Date.now.getter(v80);
    *(_BYTE *)v78 = v77;
    *(_QWORD *)(v78 + 8) = v79;
    v86(v78);
    sub_10000E510(v78);

    swift_bridgeObjectRelease(v79);
    return (id)swift_release_n(a3, 3);
  }
  if (!v43)
  {
    v82 = v35;
    v100 = &_swiftEmptyArrayStorage;
    v46 = (id *)(v37 + 8 * v39);
    do
    {
      v47 = v45;
      v48 = *v46;
      v49 = objc_msgSend(*v46, "address", v82);
      if (!v49)
      {
        ((void (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
        v51 = v50;
        v49 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v51);
      }
      v52 = objc_msgSend(v48, "UUID");
      v53 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
      v55 = v54;

      UUID.init(uuidString:)(v53, v55);
      v56 = v99;
      v45 = v47;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v99 + 48))(v30, 1, v47) == 1)
      {
        swift_bridgeObjectRelease(v55);

        sub_10000E588(v30);
      }
      else
      {
        v97 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 32);
        v97(v98, v30, v47);
        v57 = objc_msgSend(v49, "safari_userVisibleURL");

        if (v57)
        {
          v58 = objc_msgSend(v57, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

          v95 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
          v59 = v47;
          v61 = v60;

          v62 = sub_10000CFD0(v48);
          v63 = (void *)objc_opt_self(NSURL);
          v64 = String._bridgeToObjectiveC()();
          v65 = objc_msgSend(v63, "safari_URLForReadingListItemWithUUIDString:", v64);

          v66 = v92;
          v67 = v90;
          static URL._unconditionallyBridgeFromObjectiveC(_:)(v65);
          swift_bridgeObjectRelease(v55);

          v68 = objc_msgSend(v48, "title");
          v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
          v71 = v70;

          v97((char *)v67 + *(int *)(v66 + 32), (uint64_t)v98, v59);
          *v67 = v69;
          v67[1] = v71;
          v67[2] = v95;
          v67[3] = v61;
          *(uint64_t *)((char *)v67 + *(int *)(v66 + 28)) = (uint64_t)v62;
          v72 = (uint64_t)v67;
          v73 = v89;
          sub_10000E5C8(v72, v89);
          sub_10000E5C8(v73, v96);
          if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0)
            v100 = (_QWORD *)sub_10000D1B8(0, v100[2] + 1, 1, v100);
          v75 = v100[2];
          v74 = v100[3];
          v30 = (uint64_t)v93;
          v45 = v94;
          if (v75 >= v74 >> 1)
            v100 = (_QWORD *)sub_10000D1B8(v74 > 1, v75 + 1, 1, v100);
          v76 = v100;
          v100[2] = v75 + 1;
          sub_10000E5C8(v96, (uint64_t)v76+ ((*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80))+ *(_QWORD *)(v91 + 72) * v75);
        }
        else
        {
          swift_bridgeObjectRelease(v55);
          (*(void (**)(char *, uint64_t))(v56 + 8))(v98, v47);
          v45 = v47;
        }
      }
      ++v46;
      --v44;
    }
    while (v44);
    swift_unknownObjectRelease(v82);
    goto LABEL_28;
  }
LABEL_36:
  __break(1u);
  return result;
}

id sub_10000DBD8(_QWORD *a1, void (*a2)(char *), uint64_t a3)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  id result;
  void *v36;
  id v37;
  void *v38;
  __n128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  BOOL v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  id *v59;
  id v60;
  NSString v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  NSString v78;
  id v79;
  uint64_t v80;
  uint64_t *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  BOOL v92;
  uint64_t v93;
  __n128 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  void (*v109)(char *);
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t);
  char *v119;
  _QWORD *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;

  v109 = a2;
  v120 = a1;
  v4 = sub_100006014(&qword_10005C9B8);
  __chkstk_darwin(v4);
  v126 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UUID(0);
  v124 = *(_QWORD *)(v6 - 8);
  v125 = v6;
  __chkstk_darwin(v6);
  v119 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BookmarkItem(0);
  v112 = *(_QWORD *)(v8 - 8);
  v113 = v8;
  v9 = __chkstk_darwin(v8);
  v117 = (uint64_t)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v111 = (uint64_t *)((char *)&v102 - v12);
  __chkstk_darwin(v11);
  v110 = (uint64_t)&v102 - v13;
  v14 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100006014(&qword_10005C9C0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v102 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for ReadingListWidgetEntry(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v102 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = (void *)objc_opt_self(WBCollectionConfiguration);
  swift_retain_n(a3, 2);
  v26 = objc_msgSend(v25, "readonlySafariBookmarkCollectionConfiguration");
  v27 = objc_msgSend(objc_allocWithZone((Class)WebBookmarkCollection), "initWithConfiguration:", v26);

  if (!v27)
  {
    v39 = swift_retain(a3);
    static Date.now.getter(v39);
    *v24 = 1;
    *((_QWORD *)v24 + 1) = &_swiftEmptyArrayStorage;
    v40 = sub_100006014(&qword_10005C9C8);
    v41 = *(_QWORD *)(v22 + 72);
    v42 = *(unsigned __int8 *)(v22 + 80);
    v43 = (uint64_t)v24;
    v44 = (v42 + 32) & ~v42;
    v45 = swift_allocObject(v40, v44 + v41, v42 | 7);
    *(_OWORD *)(v45 + 16) = xmmword_100042D70;
    v46 = sub_10000E484(v43, v45 + v44);
    static TimelineReloadPolicy.never.getter(v46);
    v47 = sub_10000E4C8();
    Timeline.init(entries:policy:)(v45, v16, v21, v47);
    v109(v20);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_10000E510(v43);
    return (id)swift_release_n(a3, 3);
  }
  v105 = v18;
  v106 = v21;
  v104 = v24;
  v107 = a3;
  v108 = v27;
  v28 = objc_msgSend(v27, "readingListWithUnreadOnly:", 0);
  v29 = objc_msgSend(v28, "bookmarkArrayRequestingCount:", 1);

  v30 = sub_10000E54C();
  v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, v30);

  if ((unint64_t)v31 >> 62)
  {
    if (v31 < 0)
      v101 = v31;
    else
      v101 = v31 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v31);
    v32 = _CocoaArrayWrapper.endIndex.getter(v101);
    swift_bridgeObjectRelease(v31);
  }
  else
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v33 = v17;
  v34 = (unint64_t)v120;
  swift_bridgeObjectRelease(v31);
  v103 = v32;
  if (v32)
  {
    result = objc_msgSend(v108, "readingListWithUnreadOnly:", 1);
    if ((v34 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(v34))
    {
      v36 = result;
      v37 = objc_msgSend(result, "bookmarkArrayRequestingCount:", v34);

      v38 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v37, v30);
      goto LABEL_10;
    }
    __break(1u);
LABEL_37:
    __break(1u);
    return result;
  }
  v38 = &_swiftEmptyArrayStorage;
LABEL_10:
  v48 = sub_10000D32C(v34, (unint64_t)v38);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  result = (id)swift_bridgeObjectRelease(v38);
  v55 = __OFSUB__(v54 >> 1, v52);
  v56 = (v54 >> 1) - v52;
  a3 = v107;
  if (!v56)
  {
    swift_unknownObjectRelease(v48);
    v57 = &_swiftEmptyArrayStorage;
    v58 = v106;
    goto LABEL_29;
  }
  if ((v56 < 0) ^ v55 | (v56 == 0))
    goto LABEL_37;
  v102 = v48;
  v120 = &_swiftEmptyArrayStorage;
  v121 = v22;
  v59 = (id *)(v50 + 8 * v52);
  v122 = v16;
  v123 = v33;
  v114 = v20;
  do
  {
    v60 = *v59;
    v61 = objc_msgSend(*v59, "address", v102);
    if (!v61)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v63 = v62;
      v61 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v63);
    }
    v64 = objc_msgSend(v60, "UUID");
    v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
    v67 = v66;

    v68 = (uint64_t)v126;
    UUID.init(uuidString:)(v65, v67);
    v70 = v124;
    v69 = v125;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v124 + 48))(v68, 1, v125) == 1)
    {
      swift_bridgeObjectRelease(v67);

      sub_10000E588(v68);
LABEL_15:
      v22 = v121;
      v16 = v122;
      v33 = v123;
      goto LABEL_16;
    }
    v71 = v119;
    v118 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 32);
    v118(v119, v68, v69);
    v72 = objc_msgSend(v61, "safari_userVisibleURL");

    if (!v72)
    {
      swift_bridgeObjectRelease(v67);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v69);
      v20 = v114;
      goto LABEL_15;
    }
    v73 = objc_msgSend(v72, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

    v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
    v115 = v75;
    v116 = v74;

    v76 = sub_10000CFD0(v60);
    v77 = (void *)objc_opt_self(NSURL);
    v78 = String._bridgeToObjectiveC()();
    v79 = objc_msgSend(v77, "safari_URLForReadingListItemWithUUIDString:", v78);

    v80 = v113;
    v81 = v111;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v79);
    swift_bridgeObjectRelease(v67);

    v82 = objc_msgSend(v60, "title");
    v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
    v85 = v84;

    v118((char *)v81 + *(int *)(v80 + 32), (uint64_t)v119, v69);
    *v81 = v83;
    v81[1] = v85;
    v86 = v115;
    v81[2] = v116;
    v81[3] = v86;
    *(uint64_t *)((char *)v81 + *(int *)(v80 + 28)) = (uint64_t)v76;
    v87 = v110;
    sub_10000E5C8((uint64_t)v81, v110);
    sub_10000E5C8(v87, v117);
    if ((swift_isUniquelyReferenced_nonNull_native(v120) & 1) != 0)
    {
      v88 = v120;
      v22 = v121;
    }
    else
    {
      v88 = (_QWORD *)sub_10000D1B8(0, v120[2] + 1, 1, v120);
      v22 = v121;
    }
    v90 = v88[2];
    v89 = v88[3];
    v16 = v122;
    v33 = v123;
    v20 = v114;
    if (v90 >= v89 >> 1)
      v88 = (_QWORD *)sub_10000D1B8(v89 > 1, v90 + 1, 1, v88);
    v88[2] = v90 + 1;
    v91 = (*(unsigned __int8 *)(v112 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80);
    v120 = v88;
    sub_10000E5C8(v117, (uint64_t)v88 + v91 + *(_QWORD *)(v112 + 72) * v90);
LABEL_16:
    ++v59;
    --v56;
  }
  while (v56);
  swift_unknownObjectRelease(v102);
  v58 = v106;
  a3 = v107;
  v57 = v120;
LABEL_29:
  v92 = v103 == 0;
  v93 = (uint64_t)v104;
  swift_retain(a3);
  swift_bridgeObjectRetain(v57);
  static Date.now.getter(v94);
  *(_BYTE *)v93 = v92;
  *(_QWORD *)(v93 + 8) = v57;
  v95 = sub_100006014(&qword_10005C9C8);
  v96 = *(unsigned __int8 *)(v22 + 80);
  v97 = (v96 + 32) & ~v96;
  v98 = swift_allocObject(v95, v97 + *(_QWORD *)(v22 + 72), v96 | 7);
  *(_OWORD *)(v98 + 16) = xmmword_100042D70;
  v99 = sub_10000E484(v93, v98 + v97);
  static TimelineReloadPolicy.never.getter(v99);
  v100 = sub_10000E4C8();
  Timeline.init(entries:policy:)(v98, v16, v58, v100);
  v109(v20);
  (*(void (**)(char *, uint64_t))(v105 + 8))(v20, v33);
  sub_10000E510(v93);

  swift_bridgeObjectRelease(v57);
  return (id)swift_release_n(a3, 3);
}

uint64_t sub_10000E484(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReadingListWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000E4C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C9D0;
  if (!qword_10005C9D0)
  {
    v1 = type metadata accessor for ReadingListWidgetEntry(255);
    result = swift_getWitnessTable(&unk_100042F5C, v1);
    atomic_store(result, (unint64_t *)&qword_10005C9D0);
  }
  return result;
}

uint64_t sub_10000E510(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ReadingListWidgetEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E54C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C9D8;
  if (!qword_10005C9D8)
  {
    v1 = objc_opt_self(WebBookmark);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005C9D8);
  }
  return result;
}

uint64_t sub_10000E588(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006014(&qword_10005C9B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BookmarkItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingListWidgetTimelineProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t sub_10000E644(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t initializeWithCopy for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

_QWORD *assignWithCopy for ReadingListWidgetTimelineProvider(_QWORD *a1, _QWORD *a2)
{
  sub_10000E6C0(a1, a2);
  return a1;
}

_QWORD *sub_10000E6C0(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

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
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
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
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ReadingListWidgetTimelineProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  sub_10000E644((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetTimelineProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReadingListWidgetTimelineProvider(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetTimelineProvider()
{
  return &type metadata for ReadingListWidgetTimelineProvider;
}

uint64_t type metadata accessor for ReadingListWidgetEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_10005CA50;
  if (!qword_10005CA50)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ReadingListWidgetEntry);
  return result;
}

uint64_t sub_10000E954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_10000E998@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  int64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v2 = type metadata accessor for WidgetFamily(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v16 - v8;
  TimelineProviderContext.family.getter(v7);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v9, v2);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v10 == enum case for WidgetFamily.systemSmall(_:))
    goto LABEL_7;
  if (v10 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v10 == enum case for WidgetFamily.systemLarge(_:))
    {
      v11 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  v11 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  v12 = sub_10003790C(v11);
  v14 = v13;
  type metadata accessor for ReadingListWidgetEntry(0);
  result = static Date.now.getter();
  *(_BYTE *)a1 = v12 & 1;
  *(_QWORD *)(a1 + 8) = v14;
  return result;
}

uint64_t sub_10000EAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000EB04(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_10000D4C4);
}

uint64_t sub_10000EAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10000EB04(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_10000DBD8);
}

uint64_t sub_10000EB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v20;

  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v20 - v14;
  v16 = swift_retain_n(a3, 2);
  TimelineProviderContext.family.getter(v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v13, v9);
  if (v17 == enum case for WidgetFamily.systemSmall(_:))
    goto LABEL_7;
  if (v17 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v17 == enum case for WidgetFamily.systemLarge(_:))
    {
      v18 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
LABEL_7:
    v18 = 1;
    goto LABEL_8;
  }
  v18 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  swift_retain(a3);
  a6(v18, a2, a3);
  return swift_release_n(a3, 3);
}

uint64_t sub_10000EC68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100008354;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_10000ECD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000AD94;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t *sub_10000ED40(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[1];
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for Date(0);
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10000EDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_10000EE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(int *)(a3 + 20);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for Date(0);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  v9(v6, v7, v8);
  return a1;
}

uint64_t sub_10000EEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

_OWORD *sub_10000EF20(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10000EF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_10000EFF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000EFFC);
}

uint64_t sub_10000EFFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_10000F078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F084);
}

uint64_t sub_10000F084(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_10000F0F8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_100042FA8;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *sub_10000F16C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[1];
    v4[1] = v7;
    v8 = a3[5];
    v9 = (uint64_t *)((char *)v4 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain(v7);
    v11 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v15 = *v10;
      *v9 = *v10;
      swift_retain(v15);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
    v16 = a3[6];
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = 1;
    }
    else
    {
      v22 = *v18;
      *v17 = *v18;
      swift_retain(v22);
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v19, v21);
    v23 = a3[7];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    v26 = *(_QWORD *)v25;
    v27 = v25[8];
    sub_10000AED4(*(_QWORD *)v25, v27);
    *(_QWORD *)v24 = v26;
    v24[8] = v27;
    v28 = a3[8];
    v29 = (uint64_t *)((char *)v4 + v28);
    v30 = (uint64_t *)((char *)a2 + v28);
    v31 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v30, v31) == 1)
    {
      v32 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v30, v32);
      v33 = v29;
      v34 = v31;
      v35 = 1;
    }
    else
    {
      v36 = *v30;
      *v29 = *v30;
      swift_retain(v36);
      v33 = v29;
      v34 = v31;
      v35 = 0;
    }
    swift_storeEnumTagMultiPayload(v33, v34, v35);
  }
  return v4;
}

uint64_t sub_10000F370(uint64_t a1, int *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = (_QWORD *)(a1 + a2[5]);
  v5 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  v7 = (_QWORD *)(a1 + a2[6]);
  v8 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
  }
  else
  {
    swift_release(*v7);
  }
  sub_10000AF70(*(_QWORD *)(a1 + a2[7]), *(_BYTE *)(a1 + a2[7] + 8));
  v10 = (_QWORD *)(a1 + a2[8]);
  v11 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v10, v11) != 1)
    return swift_release(*v10);
  v12 = type metadata accessor for WidgetRenderingMode(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v10, v12);
}

uint64_t sub_10000F4A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  swift_bridgeObjectRetain(v6);
  v10 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
    v12 = 1;
  }
  else
  {
    v13 = *v9;
    *v8 = *v9;
    swift_retain(v13);
    v12 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v10, v12);
  v14 = a3[6];
  v15 = (uint64_t *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
  {
    v18 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
    v19 = 1;
  }
  else
  {
    v20 = *v16;
    *v15 = *v16;
    swift_retain(v20);
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v15, v17, v19);
  v21 = a3[7];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = *(_BYTE *)(v23 + 8);
  sub_10000AED4(*(_QWORD *)v23, v25);
  *(_QWORD *)v22 = v24;
  *(_BYTE *)(v22 + 8) = v25;
  v26 = a3[8];
  v27 = (uint64_t *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v29 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v28, v29) == 1)
  {
    v30 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v27, v28, v30);
    v31 = 1;
  }
  else
  {
    v32 = *v28;
    *v27 = *v28;
    swift_retain(v32);
    v31 = 0;
  }
  swift_storeEnumTagMultiPayload(v27, v29, v31);
  return a1;
}

uint64_t sub_10000F678(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
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
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  if (a1 != a2)
  {
    v8 = a3[5];
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)(a2 + v8);
    sub_100006368(a1 + v8, &qword_10005CA88);
    v11 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
    v15 = a3[6];
    v16 = (uint64_t *)(a1 + v15);
    v17 = (uint64_t *)(a2 + v15);
    sub_100006368(a1 + v15, &qword_10005C7E0);
    v18 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v17, v18) == 1)
    {
      v19 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v16, v17, v19);
      v20 = 1;
    }
    else
    {
      v21 = *v17;
      *v16 = *v17;
      swift_retain(v21);
      v20 = 0;
    }
    swift_storeEnumTagMultiPayload(v16, v18, v20);
  }
  v22 = a3[7];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = *(_QWORD *)v24;
  v26 = *(_BYTE *)(v24 + 8);
  sub_10000AED4(*(_QWORD *)v24, v26);
  v27 = *(_QWORD *)v23;
  v28 = *(_BYTE *)(v23 + 8);
  *(_QWORD *)v23 = v25;
  *(_BYTE *)(v23 + 8) = v26;
  sub_10000AF70(v27, v28);
  if (a1 != a2)
  {
    v29 = a3[8];
    v30 = (uint64_t *)(a1 + v29);
    v31 = (uint64_t *)(a2 + v29);
    sub_100006368(a1 + v29, &qword_10005CA90);
    v32 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v31, v32) == 1)
    {
      v33 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v30, v31, v33);
      v34 = 1;
    }
    else
    {
      v35 = *v31;
      *v30 = *v31;
      swift_retain(v35);
      v34 = 0;
    }
    swift_storeEnumTagMultiPayload(v30, v32, v34);
  }
  return a1;
}

_OWORD *sub_10000F8A0(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_100006014(&qword_10005C7E0);
  if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
  {
    v15 = type metadata accessor for RedactionReasons(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload(v12, v14, 1);
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v16 = a3[7];
  v17 = a3[8];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  v22 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v21, v22) == 1)
  {
    v23 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload(v20, v22, 1);
  }
  else
  {
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10000FA60(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_100006368(a1 + v7, &qword_10005CA88);
    v10 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for ColorScheme(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    v12 = a3[6];
    v13 = (void *)(a1 + v12);
    v14 = (const void *)(a2 + v12);
    sub_100006368(a1 + v12, &qword_10005C7E0);
    v15 = sub_100006014(&qword_10005C7E0);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for RedactionReasons(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload(v13, v15, 1);
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  LOBYTE(v19) = *((_BYTE *)v19 + 8);
  v21 = *(_QWORD *)v18;
  v22 = *(_BYTE *)(v18 + 8);
  *(_QWORD *)v18 = v20;
  *(_BYTE *)(v18 + 8) = (_BYTE)v19;
  sub_10000AF70(v21, v22);
  if (a1 != a2)
  {
    v23 = a3[8];
    v24 = (void *)(a1 + v23);
    v25 = (const void *)(a2 + v23);
    sub_100006368(a1 + v23, &qword_10005CA90);
    v26 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      v27 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v24, v25, v27);
      swift_storeEnumTagMultiPayload(v24, v26, 1);
    }
    else
    {
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000FC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000FC8C);
}

uint64_t sub_10000FC8C(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100006014(&qword_10005CA98);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = sub_100006014(&qword_10005C7E8);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[6];
      }
      else
      {
        v10 = sub_100006014(&qword_10005CAA0);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[8];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_10000FD5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000FD68);
}

uint64_t sub_10000FD68(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_100006014(&qword_10005CA98);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = sub_100006014(&qword_10005C7E8);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[6];
      }
      else
      {
        v10 = sub_100006014(&qword_10005CAA0);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[8];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SmallReadingListWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_10005CB00;
  if (!qword_10005CB00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SmallReadingListWidgetView);
  return result;
}

void sub_10000FE70(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[5];

  v8[0] = &unk_100043020;
  sub_10000FF54(319, (unint64_t *)&qword_10005CB10, (uint64_t (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v3 <= 0x3F)
  {
    v8[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000FF54(319, (unint64_t *)&qword_10005C858, (uint64_t (*)(uint64_t))&type metadata accessor for RedactionReasons);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      v8[3] = &unk_100043038;
      sub_10000FF54(319, (unint64_t *)&unk_10005CB18, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
      if (v7 <= 0x3F)
      {
        v8[4] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 5, v8, a1 + 16);
      }
    }
  }
}

void sub_10000FF54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000FFA0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048E98, 1);
}

uint64_t sub_10000FFB0@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t OpaqueTypeConformance2;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[2];

  v2 = v1;
  v54 = a1;
  v3 = type metadata accessor for ContainerBackgroundPlacement(0);
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005CB58);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v45 - v10;
  v12 = sub_100006014(&qword_10005CB60);
  __chkstk_darwin(v12);
  v14 = (uint64_t *)((char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_100006014(&qword_10005CB68);
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100006014(&qword_10005CB70);
  v47 = *(_QWORD *)(v18 - 8);
  v48 = v18;
  v19 = __chkstk_darwin(v18);
  v46 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v14 = static Alignment.center.getter(v19);
  v14[1] = v21;
  v22 = sub_100006014(&qword_10005CB78);
  sub_1000103E0((unsigned __int8 *)v2, (uint64_t)v14 + *(int *)(v22 + 44));
  v51 = v2;
  v23 = *(_QWORD *)(v2 + 8);
  if (!*(_QWORD *)(v23 + 16))
  {
    v29 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v9, 1, 1, v29);
    goto LABEL_5;
  }
  v24 = type metadata accessor for BookmarkItem(0);
  v25 = *(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80);
  v26 = v23 + *(int *)(v24 + 24) + ((v25 + 32) & ~v25);
  v27 = type metadata accessor for URL(0);
  v28 = *(_QWORD *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v9, v26, v27);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v9, 0, 1, v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v9, 1, v27) == 1)
  {
LABEL_5:
    v30 = objc_msgSend((id)objc_opt_self(NSURL), "safari_readingListURL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v30);

    sub_100006368((uint64_t)v9, &qword_10005CB58);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v11, v9, v27);
LABEL_6:
  v31 = type metadata accessor for URL(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v11, 0, 1, v31);
  v32 = sub_1000061A8(&qword_10005CB80, &qword_10005CB60, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.widgetURL(_:)(v11, v12, v32);
  sub_100006368((uint64_t)v11, &qword_10005CB58);
  v33 = sub_100006368((uint64_t)v14, &qword_10005CB60);
  v34 = static ContainerBackgroundPlacement.widget.getter(v33);
  v35 = __chkstk_darwin(v34);
  v36 = static Alignment.center.getter(v35);
  v38 = v37;
  v39 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  v55[0] = v12;
  v55[1] = v32;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
  v41 = sub_100011CE4(&qword_10005CB88, type metadata accessor for SmallReadingListWidgetBackgroundView, (uint64_t)&unk_100042D08);
  v42 = v46;
  v43 = v50;
  View.containerBackground<A>(for:alignment:content:)(v5, v36, v38, sub_100011C08, &v45 - 4, v50, v39, OpaqueTypeConformance2, v41);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v5, v53);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v43);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v54, v42, v48);
}

uint64_t sub_1000103E0@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t KeyPath;
  char v24;
  uint64_t *v25;
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
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v53 = a2;
  v3 = type metadata accessor for SmallReadingListWidgetView(0);
  __chkstk_darwin(v3);
  v51 = (uint64_t)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005CB90);
  __chkstk_darwin(v5);
  v50 = (uint64_t)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ColorScheme(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006014(&qword_10005CB98);
  __chkstk_darwin(v11);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100006014(&qword_10005CBA0);
  v15 = __chkstk_darwin(v14);
  v52 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v49 - v18;
  v20 = __chkstk_darwin(v17);
  v54 = (uint64_t)&v49 - v21;
  *(_QWORD *)v13 = static HorizontalAlignment.center.getter(v20);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 1;
  v22 = sub_100006014(&qword_10005CBA8);
  sub_10001085C(a1, (uint64_t)&v13[*(int *)(v22 + 44)]);
  KeyPath = swift_getKeyPath(&unk_1000430F8);
  v24 = sub_100011540();
  v49 = v3;
  if ((v24 & 1) != 0)
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for ColorScheme.dark(_:), v7);
  else
    sub_1000135E4((uint64_t)v10);
  v25 = (uint64_t *)&v19[*(int *)(v14 + 36)];
  v26 = sub_100006014(&qword_10005CBB0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v25 + *(int *)(v26 + 28), v10, v7);
  *v25 = KeyPath;
  sub_100006314((uint64_t)v13, (uint64_t)v19, &qword_10005CB98);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_100006368((uint64_t)v13, &qword_10005CB98);
  v27 = (uint64_t)v19;
  v28 = v54;
  sub_1000123B0(v27, v54, &qword_10005CBA0);
  v29 = *((_QWORD *)a1 + 1);
  v30 = *(_QWORD *)(v29 + 16);
  v31 = type metadata accessor for BookmarkItem(0);
  v32 = *(_QWORD *)(v31 - 8);
  if (v30)
  {
    v33 = v50;
    sub_100011C68(v29 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)), v50, type metadata accessor for BookmarkItem);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(v33, 0, 1, v31);
    sub_100006368(v33, &qword_10005CB90);
    v34 = v51;
    sub_100011C68((uint64_t)a1, v51, type metadata accessor for SmallReadingListWidgetView);
    sub_100011EAC(v34, type metadata accessor for SmallReadingListWidgetView);
    v35 = 0;
    v36 = 255;
    v38 = (uint64_t)v52;
    v37 = v53;
  }
  else
  {
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
    v40 = v50;
    v39(v50, 1, 1, v31);
    sub_100006368(v40, &qword_10005CB90);
    v41 = v51;
    sub_100011C68((uint64_t)a1, v51, type metadata accessor for SmallReadingListWidgetView);
    v42 = v41 + *(int *)(v49 + 28);
    v43 = *(_QWORD *)v42;
    v44 = *(_BYTE *)(v42 + 8);
    sub_10000AED4(*(_QWORD *)v42, v44);
    v45 = sub_100013224(v43, v44);
    sub_10000AF70(v43, v44);
    sub_100011EAC(v41, type metadata accessor for SmallReadingListWidgetView);
    v38 = (uint64_t)v52;
    v37 = v53;
    if ((v45 & 1) != 0)
    {
      v46 = *a1;
      v35 = swift_getKeyPath(&unk_1000430D0);
      if (v46)
        v36 = 0;
      else
        v36 = 256;
    }
    else
    {
      v35 = 0;
      v36 = 255;
    }
  }
  sub_100006314(v28, v38, &qword_10005CBA0);
  sub_100006314(v38, v37, &qword_10005CBA0);
  v47 = v37 + *(int *)(sub_100006014(&qword_10005CBB8) + 48);
  *(_QWORD *)v47 = v35;
  *(_WORD *)(v47 + 8) = v36;
  sub_100011CAC(v35, v36);
  sub_100006368(v28, &qword_10005CBA0);
  sub_100011CC8(v35, v36);
  return sub_100006368(v38, &qword_10005CBA0);
}

uint64_t sub_10001085C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned __int8 *v22;
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
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  int v42;
  uint64_t KeyPath;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  char *v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[2];
  _BYTE v76[183];
  _OWORD v77[9];
  int v78;
  _OWORD v79[10];
  char v80;
  __int128 v81;
  _OWORD v82[10];
  char v83;
  _QWORD v84[2];
  char v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[27];
  char v95;
  _QWORD v96[2];
  char v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[23];
  uint64_t v109;
  char v110;
  _BYTE v111[232];

  v4 = type metadata accessor for SmallReadingListWidgetView(0);
  __chkstk_darwin(v4);
  v61 = (uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005CB90);
  __chkstk_darwin(v6);
  v58 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = type metadata accessor for BookmarkItem(0);
  v8 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v10 = (uint64_t *)((char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_100006014(&qword_10005CBC0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v56 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v56 - v19;
  *(_QWORD *)v17 = static HorizontalAlignment.leading.getter(v18);
  *((_QWORD *)v17 + 1) = 0x4000000000000000;
  v17[16] = 0;
  v21 = sub_100006014(&qword_10005CBC8);
  sub_100010F90((uint64_t)a1, (uint64_t)&v17[*(int *)(v21 + 44)]);
  sub_1000123B0((uint64_t)v17, (uint64_t)v20, &qword_10005CBC0);
  v57 = v4;
  v22 = &a1[*(int *)(v4 + 28)];
  v23 = *(_QWORD *)v22;
  LOBYTE(v17) = v22[8];
  sub_10000AED4(*(_QWORD *)v22, (char)v17);
  LODWORD(v4) = sub_100013224(v23, (char)v17);
  sub_10000AF70(v23, (char)v17);
  v24 = *((_QWORD *)a1 + 1);
  v25 = *(_QWORD *)(v24 + 16);
  v64 = v14;
  v65 = a2;
  v63 = v20;
  v62 = v4;
  v59 = v8;
  if (v25)
  {
    v26 = sub_100011C68(v24 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), (uint64_t)v10, type metadata accessor for BookmarkItem);
    v56 = static VerticalAlignment.center.getter(v26);
    v27 = static HorizontalAlignment.leading.getter(v56);
    sub_100011880(v10, (uint64_t)v77);
    v80 = 0;
    *(_OWORD *)((char *)&v79[3] + 7) = v77[3];
    *(_OWORD *)((char *)&v79[2] + 7) = v77[2];
    *(_OWORD *)((char *)&v79[7] + 7) = v77[7];
    *(_OWORD *)((char *)&v79[6] + 7) = v77[6];
    *(_OWORD *)((char *)&v79[8] + 7) = v77[8];
    *(_DWORD *)((char *)&v79[9] + 7) = v78;
    *(_OWORD *)((char *)&v79[4] + 7) = v77[4];
    *(_OWORD *)((char *)&v79[5] + 7) = v77[5];
    *(_OWORD *)((char *)v79 + 7) = v77[0];
    *(_OWORD *)((char *)&v79[1] + 7) = v77[1];
    *(_QWORD *)&v81 = v27;
    *((_QWORD *)&v81 + 1) = 0x4000000000000000;
    LOBYTE(v82[0]) = 0;
    *(_OWORD *)((char *)&v82[7] + 1) = v79[7];
    *(_OWORD *)((char *)&v82[6] + 1) = v79[6];
    *(_OWORD *)((char *)&v82[8] + 1) = v79[8];
    *(_OWORD *)((char *)&v82[8] + 12) = *(_OWORD *)((char *)&v79[8] + 11);
    *(_OWORD *)((char *)&v82[2] + 1) = v79[2];
    *(_OWORD *)((char *)&v82[3] + 1) = v79[3];
    *(_OWORD *)((char *)&v82[4] + 1) = v79[4];
    *(_OWORD *)((char *)&v82[5] + 1) = v79[5];
    *(_OWORD *)((char *)v82 + 1) = v79[0];
    *(_OWORD *)((char *)&v82[1] + 1) = v79[1];
    v74 = v82[7];
    v75[0] = v82[8];
    *(_OWORD *)((char *)v75 + 12) = *(_OWORD *)((char *)&v79[8] + 11);
    v70 = v82[3];
    v71 = v82[4];
    v72 = v82[5];
    v73 = v82[6];
    v66 = v81;
    v67 = v82[0];
    v68 = v82[1];
    v69 = v82[2];
    v92 = v79[6];
    v93 = v79[7];
    *(_OWORD *)v94 = v79[8];
    *(_OWORD *)&v94[11] = *(_OWORD *)((char *)&v79[8] + 11);
    v88 = v79[2];
    v89 = v79[3];
    v90 = v79[4];
    v91 = v79[5];
    v86 = v79[0];
    v83 = 0;
    v84[0] = v27;
    v84[1] = 0x4000000000000000;
    v85 = 0;
    v87 = v79[1];
    sub_100011D24((uint64_t)&v81);
    sub_100011DE8((uint64_t)v84);
    *(_OWORD *)&v76[119] = v73;
    *(_OWORD *)&v76[135] = v74;
    *(_OWORD *)&v76[151] = v75[0];
    *(_OWORD *)&v76[167] = v75[1];
    *(_OWORD *)&v76[55] = v69;
    *(_OWORD *)&v76[71] = v70;
    *(_OWORD *)&v76[87] = v71;
    *(_OWORD *)&v76[103] = v72;
    *(_OWORD *)&v76[7] = v66;
    *(_OWORD *)&v76[23] = v67;
    *(_OWORD *)&v76[39] = v68;
    v106 = *(_OWORD *)&v76[128];
    v107 = *(_OWORD *)&v76[144];
    *(_OWORD *)v108 = *(_OWORD *)&v76[160];
    v102 = *(_OWORD *)&v76[64];
    v103 = *(_OWORD *)&v76[80];
    v104 = *(_OWORD *)&v76[96];
    v105 = *(_OWORD *)&v76[112];
    v98 = *(_OWORD *)v76;
    v99 = *(_OWORD *)&v76[16];
    v100 = *(_OWORD *)&v76[32];
    v95 = 1;
    v101 = *(_OWORD *)&v76[48];
    v96[0] = v56;
    v96[1] = 0;
    v97 = 1;
    *(_QWORD *)&v108[15] = *((_QWORD *)&v75[1] + 1);
    v109 = 0;
    v110 = 0;
    nullsub_1(v96);
    sub_100011EAC((uint64_t)v10, type metadata accessor for BookmarkItem);
  }
  else
  {
    sub_100012168((uint64_t)v96);
  }
  sub_1000123B0((uint64_t)v96, (uint64_t)v111, &qword_10005CBD0);
  v28 = *((_QWORD *)a1 + 1);
  if (*(_QWORD *)(v28 + 16))
  {
    v30 = v58;
    v29 = v59;
    sub_100011C68(v28 + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80)), v58, type metadata accessor for BookmarkItem);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v30, 0, 1, v60);
    sub_100006368(v30, &qword_10005CB90);
    v31 = v61;
    sub_100011C68((uint64_t)a1, v61, type metadata accessor for SmallReadingListWidgetView);
    sub_100011EAC(v31, type metadata accessor for SmallReadingListWidgetView);
LABEL_7:
    v60 = 0;
    v61 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 255;
    goto LABEL_12;
  }
  v32 = v58;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56))(v58, 1, 1, v60);
  sub_100006368(v32, &qword_10005CB90);
  v33 = v61;
  sub_100011C68((uint64_t)a1, v61, type metadata accessor for SmallReadingListWidgetView);
  v34 = v33 + *(int *)(v57 + 28);
  v35 = *(_QWORD *)v34;
  v36 = *(_BYTE *)(v34 + 8);
  sub_10000AED4(*(_QWORD *)v34, v36);
  v37 = sub_100013224(v35, v36);
  sub_10000AF70(v35, v36);
  v38 = sub_100011EAC(v33, type metadata accessor for SmallReadingListWidgetView);
  if ((v37 & 1) != 0)
    goto LABEL_7;
  v61 = static VerticalAlignment.center.getter(v38);
  v42 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000430D0);
  sub_10000AED4(KeyPath, 0);
  v60 = KeyPath;
  sub_10000AF70(KeyPath, 0);
  if (v42)
    v41 = 0;
  else
    v41 = 256;
  v39 = 1;
  v40 = 1;
LABEL_12:
  v44 = v62;
  v45 = v62 & 1;
  v47 = (uint64_t)v63;
  v46 = (uint64_t)v64;
  sub_100006314((uint64_t)v63, (uint64_t)v64, &qword_10005CBC0);
  sub_1000123B0((uint64_t)v111, (uint64_t)&v66, &qword_10005CBD0);
  v48 = v65;
  sub_100006314(v46, v65, &qword_10005CBC0);
  v49 = (int *)sub_100006014(&qword_10005CBD8);
  v50 = v48 + v49[12];
  *(_QWORD *)v50 = 0;
  *(_BYTE *)(v50 + 8) = v45;
  *(_BYTE *)(v50 + 9) = (v44 & 1) == 0;
  v51 = v48 + v49[16];
  sub_1000123B0((uint64_t)&v66, (uint64_t)v76, &qword_10005CBD0);
  sub_1000123B0((uint64_t)v76, v51, &qword_10005CBD0);
  v52 = v48 + v49[20];
  v54 = v60;
  v53 = v61;
  *(_QWORD *)v52 = v61;
  *(_QWORD *)(v52 + 8) = 0;
  *(_QWORD *)(v52 + 16) = v39;
  *(_QWORD *)(v52 + 24) = v54;
  *(_QWORD *)(v52 + 32) = v41;
  *(_QWORD *)(v52 + 40) = 0;
  *(_BYTE *)(v52 + 48) = v40;
  sub_100012008((uint64_t)v76, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_100011EE8);
  sub_100011FD0(v53, 0, v39, v54, v41);
  sub_100006368(v47, &qword_10005CBC0);
  sub_100011FEC(v53, 0, v39, v54, v41);
  sub_1000123B0((uint64_t)&v66, (uint64_t)v96, &qword_10005CBD0);
  sub_100012008((uint64_t)v96, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10001207C);
  return sub_100006368(v46, &qword_10005CBC0);
}

uint64_t sub_100010F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  __n128 v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;

  v52 = a2;
  v48 = type metadata accessor for Color.RGBColorSpace(0);
  v3 = *(_QWORD *)(v48 - 8);
  __chkstk_darwin(v48);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_100006014(&qword_10005CBE0);
  v6 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_100006014(&qword_10005CBE8);
  __chkstk_darwin(v47);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_100006014(&qword_10005CBF0);
  __chkstk_darwin(v49);
  v45 = (uint64_t)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_100006014(&qword_10005CBF8);
  __chkstk_darwin(v51);
  v50 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100011334();
  v13 = sub_100006014(&qword_10005CC00);
  v14 = sub_1000122E8();
  View.widgetAccentable(_:)(1, v13, v14);
  if ((sub_100011540() & 1) != 0)
    v15 = 1.0;
  else
    v15 = 0.0;
  v16 = enum case for Color.RGBColorSpace.sRGB(_:);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v18 = v48;
  v17(v5, enum case for Color.RGBColorSpace.sRGB(_:), v48);
  v19 = Color.init(_:white:opacity:)(v5, 0.0, v15);
  v20 = v46;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v46);
  v21 = &v10[*(int *)(v47 + 36)];
  *(_QWORD *)v21 = v19;
  *(_OWORD *)(v21 + 8) = xmmword_100042FD0;
  *((_QWORD *)v21 + 3) = 0x4000000000000000;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v20);
  if ((sub_100011540() & 1) != 0)
    v22 = 0.1;
  else
    v22 = 0.0;
  v17(v5, v16, v18);
  v23 = Color.init(_:white:opacity:)(v5, 0.0, v22);
  v24 = v45;
  sub_100006314((uint64_t)v10, v45, &qword_10005CBE8);
  v25 = v24 + *(int *)(v49 + 36);
  *(_QWORD *)v25 = v23;
  *(_OWORD *)(v25 + 8) = xmmword_100042FE0;
  *(_QWORD *)(v25 + 24) = 0x3FF0000000000000;
  v26 = sub_100006368((uint64_t)v10, &qword_10005CBE8);
  v27 = static Edge.Set.bottom.getter(v26);
  v28 = a1 + *(int *)(type metadata accessor for SmallReadingListWidgetView(0) + 28);
  v29 = *(_QWORD *)v28;
  v30 = *(_BYTE *)(v28 + 8);
  sub_10000AED4(*(_QWORD *)v28, v30);
  v31 = sub_100013224(v29, v30);
  v32 = sub_10000AF70(v29, v30);
  v33.n128_u64[0] = 4.0;
  if ((v31 & 1) != 0)
    v33.n128_f64[0] = 0.0;
  v34 = EdgeInsets.init(_all:)(v32, v33);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = v50;
  sub_100006314(v24, v50, &qword_10005CBF0);
  v42 = v41 + *(int *)(v51 + 36);
  *(_BYTE *)v42 = v27;
  *(double *)(v42 + 8) = v34;
  *(_QWORD *)(v42 + 16) = v36;
  *(_QWORD *)(v42 + 24) = v38;
  *(_QWORD *)(v42 + 32) = v40;
  *(_BYTE *)(v42 + 40) = 0;
  sub_100006368(v24, &qword_10005CBF0);
  return sub_1000123B0(v41, v52, &qword_10005CBF8);
}

uint64_t sub_100011334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  char v20;
  char *v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for SmallReadingListWidgetView(0);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v26 - v6;
  v8 = type metadata accessor for WidgetRenderingMode(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v26 - v13;
  v15 = sub_1000133B0((uint64_t)&v26 - v13);
  static WidgetRenderingMode.accented.getter(v15);
  v16 = static WidgetRenderingMode.== infix(_:_:)(v14, v12);
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v17(v14, v8);
  sub_100011C68(v1, (uint64_t)v7, type metadata accessor for SmallReadingListWidgetView);
  if ((v16 & 1) != 0)
  {
    v18 = sub_100011EAC((uint64_t)v7, type metadata accessor for SmallReadingListWidgetView);
    return static HierarchicalShapeStyle.primary.getter(v18);
  }
  v20 = sub_100011540();
  sub_100011C68((uint64_t)v7, (uint64_t)v5, type metadata accessor for SmallReadingListWidgetView);
  if ((v20 & 1) != 0)
  {
    v21 = &v5[*(int *)(v2 + 28)];
    v22 = *(_QWORD *)v21;
    v23 = v21[8];
    sub_10000AED4(*(_QWORD *)v21, v23);
    v24 = sub_100013224(v22, v23);
    sub_10000AF70(v22, v23);
    sub_100011EAC((uint64_t)v5, type metadata accessor for SmallReadingListWidgetView);
    v25 = sub_100011EAC((uint64_t)v7, type metadata accessor for SmallReadingListWidgetView);
    if ((v24 & 1) != 0)
      return static HierarchicalShapeStyle.primary.getter(v25);
  }
  else
  {
    sub_100011EAC((uint64_t)v5, type metadata accessor for SmallReadingListWidgetView);
    v25 = sub_100011EAC((uint64_t)v7, type metadata accessor for SmallReadingListWidgetView);
  }
  return static HierarchicalShapeStyle.secondary.getter(v25);
}

uint64_t sub_100011540()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  void (*v21)(char *, uint64_t);
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;

  v1 = v0;
  v44 = type metadata accessor for RedactionReasons(0);
  v42 = *(_QWORD *)(v44 - 8);
  v2 = __chkstk_darwin(v44);
  v43 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v41 - v4;
  v6 = type metadata accessor for SmallReadingListWidgetView(0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v41 - v10;
  v12 = type metadata accessor for WidgetRenderingMode(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v41 - v17;
  v19 = sub_1000133B0((uint64_t)&v41 - v17);
  static WidgetRenderingMode.accented.getter(v19);
  v20 = static WidgetRenderingMode.== infix(_:_:)(v18, v16);
  v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v16, v12);
  v21(v18, v12);
  if ((v20 & 1) == 0)
  {
    v23 = (uint64_t)v5;
    v25 = v43;
    v24 = v44;
    v26 = (uint64_t)v9;
    v27 = *(_QWORD *)(v1 + 8);
    v28 = v1;
    if (*(_QWORD *)(v27 + 16)
      && (v29 = type metadata accessor for BookmarkItem(0),
          v30 = *(unsigned __int8 *)(*(_QWORD *)(v29 - 8) + 80),
          *(_QWORD *)(v27 + ((v30 + 32) & ~v30) + *(int *)(v29 + 28))))
    {
      sub_100011C68(v1, (uint64_t)v11, type metadata accessor for SmallReadingListWidgetView);
      sub_1000131F8(v23);
      v31 = sub_100011CE4(&qword_10005C8A8, (uint64_t (*)(uint64_t))&type metadata accessor for RedactionReasons, (uint64_t)&protocol conformance descriptor for RedactionReasons);
      dispatch thunk of SetAlgebra.init()(v24, v31);
      v32 = sub_100011CE4(&qword_10005C8B0, (uint64_t (*)(uint64_t))&type metadata accessor for RedactionReasons, (uint64_t)&protocol conformance descriptor for RedactionReasons);
      v33 = dispatch thunk of static Equatable.== infix(_:_:)(v23, v25, v24, v32);
      v34 = *(void (**)(char *, uint64_t))(v42 + 8);
      v34(v25, v24);
      v34((char *)v23, v24);
      sub_100011EAC((uint64_t)v11, type metadata accessor for SmallReadingListWidgetView);
      v35 = v26;
      sub_100011C68(v28, v26, type metadata accessor for SmallReadingListWidgetView);
      if ((v33 & 1) != 0)
      {
        v36 = v26 + *(int *)(v6 + 28);
        v37 = *(_QWORD *)v36;
        v38 = *(_BYTE *)(v36 + 8);
        sub_10000AED4(*(_QWORD *)v36, v38);
        v22 = sub_100013224(v37, v38);
        sub_10000AF70(v37, v38);
LABEL_9:
        sub_100011EAC(v35, type metadata accessor for SmallReadingListWidgetView);
        return v22 & 1;
      }
    }
    else
    {
      sub_100011C68(v1, (uint64_t)v11, type metadata accessor for SmallReadingListWidgetView);
      sub_100011EAC((uint64_t)v11, type metadata accessor for SmallReadingListWidgetView);
      v39 = v1;
      v35 = v26;
      sub_100011C68(v39, v26, type metadata accessor for SmallReadingListWidgetView);
    }
    v22 = 0;
    goto LABEL_9;
  }
  v22 = 0;
  return v22 & 1;
}

uint64_t sub_100011880@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
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
  int v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;

  v4 = a1[1];
  v34 = *a1;
  v35 = v4;
  v5 = sub_1000062D0();
  swift_bridgeObjectRetain(v4);
  v6 = Text.init<A>(_:)(&v34, &type metadata for String, v5);
  v8 = v7;
  v10 = v9;
  v33 = v11;
  KeyPath = swift_getKeyPath(&unk_100043128);
  if (qword_10005C1E0 != -1)
    swift_once(&qword_10005C1E0, sub_10000586C);
  v12 = qword_10005E560;
  static Font.Weight.semibold.getter();
  v31 = Font.weight(_:)(v12);
  v13 = swift_getKeyPath(&unk_100043158);
  v14 = a1[3];
  v34 = a1[2];
  v35 = v14;
  swift_bridgeObjectRetain(v14);
  v15 = Text.init<A>(_:)(&v34, &type metadata for String, v5);
  v29 = v16;
  v30 = v15;
  v18 = v17;
  v20 = v19;
  v21 = swift_getKeyPath(&unk_100043128);
  if (qword_10005C1D8 != -1)
    swift_once(&qword_10005C1D8, sub_100005850);
  v22 = v18 & 1;
  v23 = v10 & 1;
  v24 = qword_10005E558;
  v25 = swift_getKeyPath(&unk_100043158);
  swift_retain(v24);
  v27 = static HierarchicalShapeStyle.secondary.getter(v26);
  LOBYTE(v34) = v23;
  v38 = 0;
  v37 = v22;
  v36 = 0;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v33;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 4;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = v13;
  *(_QWORD *)(a2 + 64) = v31;
  *(_QWORD *)(a2 + 72) = v30;
  *(_QWORD *)(a2 + 80) = v29;
  *(_BYTE *)(a2 + 88) = v22;
  *(_QWORD *)(a2 + 96) = v20;
  *(_QWORD *)(a2 + 104) = v21;
  *(_QWORD *)(a2 + 112) = 1;
  *(_BYTE *)(a2 + 120) = 0;
  *(_QWORD *)(a2 + 128) = v25;
  *(_QWORD *)(a2 + 136) = v24;
  *(_DWORD *)(a2 + 144) = v27;
  sub_100006358(v6, v8, v23);
  swift_bridgeObjectRetain(v33);
  swift_retain(KeyPath);
  swift_retain(v13);
  swift_retain(v31);
  sub_100006358(v30, v29, v22);
  swift_bridgeObjectRetain(v20);
  swift_retain(v21);
  swift_retain(v25);
  swift_retain(v24);
  sub_1000063A4(v30, v29, v22);
  swift_release(v24);
  swift_release(v25);
  swift_release(v21);
  swift_bridgeObjectRelease(v20);
  sub_1000063A4(v6, v8, v23);
  swift_release(v31);
  swift_release(v13);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v33);
}

uint64_t sub_100011B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = *(_BYTE *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *v7 = v6;
  *((_QWORD *)v7 + 1) = v8;
  v9 = &v7[*(int *)(v5 + 20)];
  *(_QWORD *)v9 = swift_getKeyPath(&unk_1000430A0);
  v10 = sub_100006014(&qword_10005C7E0);
  swift_storeEnumTagMultiPayload(v9, v10, 0);
  v11 = &v7[*(int *)(v4 + 24)];
  *(_QWORD *)v11 = swift_getKeyPath(&unk_1000430D0);
  v11[8] = 0;
  sub_100011C1C((uint64_t)v7, a2);
  return swift_bridgeObjectRetain(v8);
}

uint64_t sub_100011C08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100011B24(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100011C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SmallReadingListWidgetBackgroundView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011C68(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011CAC(uint64_t result, char a2)
{
  if (a2 != -1)
    return sub_10000AED4(result, a2 & 1);
  return result;
}

uint64_t sub_100011CC8(uint64_t result, char a2)
{
  if (a2 != -1)
    return sub_10000AF70(result, a2 & 1);
  return result;
}

uint64_t sub_100011CE4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100011D24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_BYTE *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 160);
  v12 = *(_QWORD *)(a1 + 128);
  v13 = *(_QWORD *)(a1 + 152);
  sub_100006358(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_retain(v5);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  swift_retain(v4);
  sub_100006358(v6, v7, v8);
  swift_retain(v10);
  swift_bridgeObjectRetain(v9);
  swift_retain(v12);
  swift_retain(v13);
  return a1;
}

uint64_t sub_100011DE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 104);
  v8 = *(_BYTE *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 128);
  v10 = *(_QWORD *)(a1 + 152);
  v12 = *(_QWORD *)(a1 + 120);
  v13 = *(_QWORD *)(a1 + 160);
  sub_1000063A4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  swift_release(v5);
  sub_1000063A4(v6, v7, v8);
  swift_release(v10);
  swift_release(v9);
  swift_bridgeObjectRelease(v12);
  swift_release(v13);
  return a1;
}

uint64_t sub_100011EAC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_100011EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  double result;

  if (a10)
  {
    sub_100006358(a7, a8, a9 & 1);
    swift_retain(a15);
    swift_bridgeObjectRetain(a10);
    swift_retain(a11);
    swift_retain(a14);
    sub_100006358(a16, a17, a18 & 1);
    swift_retain(a24);
    swift_bridgeObjectRetain(a19);
    swift_retain(a20);
    *(_QWORD *)&result = swift_retain(a23).n128_u64[0];
  }
  return result;
}

uint64_t sub_100011FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if (a5 != -1)
    return sub_10000AED4(a4, a5 & 1);
  return result;
}

uint64_t sub_100011FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if (a5 != -1)
    return sub_10000AF70(a4, a5 & 1);
  return result;
}

uint64_t sub_100012008(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 208);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    v4);
  return a1;
}

uint64_t sub_10001207C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t result;

  if (a10)
  {
    sub_1000063A4(a7, a8, a9 & 1);
    swift_release(a14);
    swift_release(a11);
    swift_bridgeObjectRelease(a10);
    swift_release(a15);
    sub_1000063A4(a16, a17, a18 & 1);
    swift_release(a23);
    swift_release(a20);
    swift_bridgeObjectRelease(a19);
    return swift_release(a24);
  }
  return result;
}

double sub_100012168(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 208) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
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

uint64_t sub_100012190@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000121B8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_1000121E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012210@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100012240(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10001226C(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100012298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000122C0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_1000122E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CC08;
  if (!qword_10005CC08)
  {
    v1 = sub_1000060C8(&qword_10005CC00);
    sub_10001236C();
    sub_1000061A8(&qword_10005CC18, &qword_10005CC20, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005CC08);
  }
  return result;
}

unint64_t sub_10001236C()
{
  unint64_t result;

  result = qword_10005CC10;
  if (!qword_10005CC10)
  {
    result = swift_getWitnessTable(&unk_100041E38, &type metadata for ReadingListWidgetHeader);
    atomic_store(result, (unint64_t *)&qword_10005CC10);
  }
  return result;
}

uint64_t sub_1000123B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006014(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000123F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_1000060C8(&qword_10005CB68);
  v1 = type metadata accessor for SmallReadingListWidgetBackgroundView(255);
  v5 = sub_1000060C8(&qword_10005CB60);
  v6 = sub_1000061A8(&qword_10005CB80, &qword_10005CB60, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
  v3 = sub_100011CE4(&qword_10005CB88, type metadata accessor for SmallReadingListWidgetBackgroundView, (uint64_t)&unk_100042D08);
  v5 = v0;
  v6 = v1;
  v7 = OpaqueTypeConformance2;
  v8 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
}

uint64_t *sub_1000124C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v14);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[1];
    v3[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)v3 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_bridgeObjectRetain(v5);
    v9 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
    {
      v10 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = v7;
      v12 = v9;
      v13 = 1;
    }
    else
    {
      v15 = *v8;
      *v7 = *v8;
      swift_retain(v15);
      v11 = v7;
      v12 = v9;
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  return v3;
}

uint64_t sub_1000125A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v5 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t sub_100012620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (uint64_t *)(a1 + v5);
  v7 = (uint64_t *)(a2 + v5);
  swift_bridgeObjectRetain(v4);
  v8 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v6, v7, v9);
    v10 = 1;
  }
  else
  {
    v11 = *v7;
    *v6 = *v7;
    swift_retain(v11);
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v8, v10);
  return a1;
}

uint64_t sub_1000126D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)(a2 + v8);
    sub_100006368(a1 + v8, &qword_10005C910);
    v11 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  return a1;
}

_OWORD *sub_1000127AC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100012854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_100006368(a1 + v7, &qword_10005C910);
    v10 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10001292C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100012938);
}

uint64_t sub_100012938(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100006014(&qword_10005CC28);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1000129B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000129C4);
}

uint64_t sub_1000129C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100006014(&qword_10005CC28);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ReadingListWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_10005CC88;
  if (!qword_10005CC88)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ReadingListWidgetView);
  return result;
}

void sub_100012A78(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_1000431A8;
  sub_100012AEC(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

void sub_100012AEC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10005CC98)
  {
    v2 = type metadata accessor for WidgetFamily(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10005CC98);
  }
}

uint64_t sub_100012B40(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048EE8, 1);
}

uint64_t sub_100012B50()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100012B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100013900(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100012B84@<X0>(_QWORD *a1@<X8>)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t OpaqueTypeConformance2;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v2 = v1;
  v71 = a1;
  v3 = sub_100006014(&qword_10005CB58);
  __chkstk_darwin(v3);
  v63 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for LargeReadingListWidgetView(0);
  __chkstk_darwin(v69);
  v62 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_100006014(&qword_10005CCC8);
  v65 = *(_QWORD *)(v70 - 8);
  v6 = __chkstk_darwin(v70);
  v61 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v64 = (char *)&v59 - v8;
  v66 = sub_100006014(&qword_10005CCD0);
  __chkstk_darwin(v66);
  v68 = (uint64_t)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006014(&qword_10005CAA0);
  __chkstk_darwin(v10);
  v12 = (uint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v67 = type metadata accessor for SmallReadingListWidgetView(0);
  v13 = __chkstk_darwin(v67);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v60 = (uint64_t)&v59 - v16;
  v17 = type metadata accessor for WidgetFamily(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v59 - v22;
  type metadata accessor for ReadingListWidgetView(0);
  sub_1000133DC(&qword_10005C910, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, (uint64_t)v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v21, enum case for WidgetFamily.systemSmall(_:), v17);
  v24 = sub_100011CE4(&qword_10005CCD8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v72, v17, v24);
  dispatch thunk of RawRepresentable.rawValue.getter(&v74, v17, v24);
  v25 = v72;
  v26 = v74;
  v27 = *(void (**)(char *, uint64_t))(v18 + 8);
  v27(v21, v17);
  v27(v23, v17);
  v28 = *v2;
  v29 = *((_QWORD *)v2 + 1);
  *v12 = swift_getKeyPath(&unk_100043210);
  v30 = sub_100006014(&qword_10005CA90);
  swift_storeEnumTagMultiPayload(v12, v30, 0);
  if (v25 == v26)
  {
    *v15 = v28;
    *((_QWORD *)v15 + 1) = v29;
    v31 = (int *)v67;
    v32 = &v15[*(int *)(v67 + 20)];
    *(_QWORD *)v32 = swift_getKeyPath(&unk_100043270);
    v33 = sub_100006014(&qword_10005CA88);
    swift_storeEnumTagMultiPayload(v32, v33, 0);
    v34 = &v15[v31[6]];
    *(_QWORD *)v34 = swift_getKeyPath(&unk_1000432A0);
    v35 = sub_100006014(&qword_10005C7E0);
    swift_storeEnumTagMultiPayload(v34, v35, 0);
    v36 = &v15[v31[7]];
    *(_QWORD *)v36 = swift_getKeyPath(&unk_1000432D0);
    v36[8] = 0;
    sub_1000139A4((uint64_t)v12, (uint64_t)&v15[v31[8]]);
    v37 = v60;
    sub_100013A78((uint64_t)v15, v60);
    v38 = v68;
    sub_100013ABC(v37, v68);
    swift_storeEnumTagMultiPayload(v38, v66, 0);
    v39 = sub_100011CE4(&qword_10005CCE8, type metadata accessor for SmallReadingListWidgetView, (uint64_t)&unk_100043050);
    v40 = sub_100011CE4(&qword_10005CCE0, type metadata accessor for LargeReadingListWidgetView, (uint64_t)&unk_1000489D8);
    swift_bridgeObjectRetain(v29);
    v72 = v69;
    v73 = v40;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v72, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v71, v38, v31, v70, v39, OpaqueTypeConformance2);
    return sub_100011EAC(v37, type metadata accessor for SmallReadingListWidgetView);
  }
  else
  {
    v43 = (uint64_t)v62;
    *v62 = v28;
    *(_QWORD *)(v43 + 8) = v29;
    v44 = v69;
    v45 = (_QWORD *)(v43 + *(int *)(v69 + 20));
    *v45 = swift_getKeyPath(&unk_100043240);
    v46 = sub_100006014(&qword_10005C910);
    swift_storeEnumTagMultiPayload(v45, v46, 0);
    sub_1000139A4((uint64_t)v12, v43 + *(int *)(v44 + 24));
    v47 = (void *)objc_opt_self(NSURL);
    swift_bridgeObjectRetain(v29);
    v48 = objc_msgSend(v47, "safari_readingListURL");
    v49 = (uint64_t)v63;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v48);

    v50 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
    v51 = sub_100011CE4(&qword_10005CCE0, type metadata accessor for LargeReadingListWidgetView, (uint64_t)&unk_1000489D8);
    v52 = v61;
    View.widgetURL(_:)(v49, v44, v51);
    sub_100006368(v49, &qword_10005CB58);
    sub_100011EAC(v43, type metadata accessor for LargeReadingListWidgetView);
    v54 = v64;
    v53 = v65;
    v55 = v70;
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v64, v52, v70);
    v56 = v68;
    (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v68, v54, v55);
    swift_storeEnumTagMultiPayload(v56, v66, 1);
    v57 = sub_100011CE4(&qword_10005CCE8, type metadata accessor for SmallReadingListWidgetView, (uint64_t)&unk_100043050);
    v72 = v44;
    v73 = v51;
    v58 = swift_getOpaqueTypeConformance2(&v72, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    _ConditionalContent<>.init(storage:)(v71, v56, v67, v55, v57, v58);
    return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v54, v55);
  }
}

uint64_t sub_1000131F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000133DC(&qword_10005C7E0, (uint64_t (*)(_QWORD))&type metadata accessor for RedactionReasons, (char *)0xD000000000000010, (char *)0x800000010003F690, a1);
}

uint64_t sub_100013224(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unsigned __int8 v15;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v10, v9))
  {
    v11 = swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v14 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = sub_100013B00((char *)0x6C6F6F42, (char *)0xE400000000000000, &v14);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_10000AF70(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_1000133B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000133DC(&qword_10005CA90, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (char *)0xD000000000000013, (char *)0x800000010003F670, a1);
}

uint64_t sub_1000133DC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v25 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100006014(a1);
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100006314(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v23 = swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v26 = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)(v23 + 4) = sub_100013B00(a3, v25, &v26);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000135E4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000133DC(&qword_10005CA88, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, (char *)0x686353726F6C6F43, (char *)0xEB00000000656D65, a1);
}

uint64_t sub_100013614@<X0>(uint64_t a1@<X8>)
{
  return sub_1000133DC(&qword_10005C910, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, a1);
}

double sub_100013644(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  double v15;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v10, v9))
  {
    v11 = swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v15 = *(double *)&v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = sub_100013B00((char *)0x74616F6C464743, (char *)0xE700000000000000, (uint64_t *)&v15);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_10000AF70(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_1000137D8()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_1000137F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100013900(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

uint64_t sub_10001380C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v1 = sub_100011CE4(&qword_10005CCF0, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  EnvironmentValues.subscript.getter(&v3, v0, v0, v1);
  return v3;
}

_QWORD *sub_10001386C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  v2 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v3 = sub_100011CE4(&qword_10005CCF0, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  result = EnvironmentValues.subscript.getter(&v5, v2, v2, v3);
  *a1 = v5;
  return result;
}

uint64_t sub_1000138E0()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100013900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v8 = a5(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_10001397C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100013900(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_1000139A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006014(&qword_10005CAA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000139EC()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100013A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100013900(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100013A30()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t sub_100013A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100013900(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for RedactionReasons, (uint64_t (*)(char *))&EnvironmentValues.redactionReasons.setter);
}

uint64_t sub_100013A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SmallReadingListWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SmallReadingListWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100013B00(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_100013BD0(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100013CCC((uint64_t)v12, *a3);
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
      sub_100013CCC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000E644(v12);
  return v7;
}

char *sub_100013BD0(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  char *result;
  uint64_t v10;
  char *v11;
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
          *a1 = (char *)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100013D08(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
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
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100013CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100013D08(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_100013D9C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100013E98(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_100013E98((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_100013D9C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  char v7;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100013E34(v4, 0);
      result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0)
        break;
      if (result == (_QWORD *)v4)
        return v5;
      __break(1u);
LABEL_9:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100013E34(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006014(&qword_10005CCF8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100013E98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100006014(&qword_10005CCF8);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

unint64_t sub_100013F84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10005CD00;
  if (!qword_10005CD00)
  {
    v1 = sub_1000060C8(&qword_10005CD08);
    sub_100011CE4(&qword_10005CCE8, type metadata accessor for SmallReadingListWidgetView, (uint64_t)&unk_100043050);
    v2[0] = type metadata accessor for LargeReadingListWidgetView(255);
    v2[1] = sub_100011CE4(&qword_10005CCE0, type metadata accessor for LargeReadingListWidgetView, (uint64_t)&unk_1000489D8);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005CD00);
  }
  return result;
}

ValueMetadata *type metadata accessor for TabLayoutControlPicker()
{
  return &type metadata for TabLayoutControlPicker;
}

uint64_t sub_10001405C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100048F2C, 1);
}

uint64_t sub_10001406C@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;

  KeyPath = swift_getKeyPath(&unk_100043358);
  sub_10002301C(KeyPath, a1);
  return swift_release(KeyPath);
}

unint64_t sub_1000140AC()
{
  unint64_t result;

  result = qword_10005CD20;
  if (!qword_10005CD20)
  {
    result = swift_getWitnessTable(&unk_100043430, &type metadata for BlockPopUpsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CD20);
  }
  return result;
}

uint64_t sub_1000140F0()
{
  return sub_1000061A8(&qword_10005CD28, &qword_10005CD30, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10001411C()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E608);
  sub_10000AAD4(v16, (uint64_t)qword_10005E608);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x6F50206B636F6C42, 0xED00007370552D70);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, 0, 0, 256);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_10001434C()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E620);
  sub_10000AAD4(v0, (uint64_t)qword_10005E620);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x800000010003F760);
}

uint64_t sub_1000143AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E638);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E638);
  IntentDescription.init(stringLiteral:)(0xD00000000000002FLL, 0x800000010003F730);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100014434()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100043928);
  qword_10005E650 = result;
  return result;
}

uint64_t sub_100014458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005CE78);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005CE80);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100014564, 0, 0);
}

uint64_t sub_100014564()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_100015008();
  *v1 = v0;
  v1[1] = sub_1000145E4;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_100014974, 0, &type metadata for BlockPopUpsEntity, v2);
}

uint64_t sub_1000145E4()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100014638, 0, 0);
}

uint64_t sub_100014638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C240 != -1)
    swift_once(&qword_10005C240, sub_100014434);
  v2 = qword_10005E650;
  *(_QWORD *)(v0 + 168) = qword_10005E650;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005CE58, &qword_10005CE60, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100014734;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_100014734()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_1000147B4;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000147B4()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000140AC();
  v11 = sub_10001516C();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100014974, 0, v7, v6, &type metadata for BlockPopUpsEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for BlockPopUpsEntity.UpdateIntent_value, &type metadata for BlockPopUpsEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for BlockPopUpsEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100014978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005CE88);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C240 != -1)
    swift_once(&qword_10005C240, sub_100014434);
  v4 = qword_10005E650;
  swift_retain(qword_10005E650);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10001516C();
  v7 = sub_1000061A8(&qword_10005CE90, &qword_10005CE88, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for BlockPopUpsEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_100014A80()
{
  double result;

  if (qword_10005C240 != -1)
    swift_once(&qword_10005C240, sub_100014434);
  *(_QWORD *)&result = swift_retain(qword_10005E650).n128_u64[0];
  return result;
}

unint64_t sub_100014AC4()
{
  unint64_t result;

  result = qword_10005CD38;
  if (!qword_10005CD38)
  {
    result = swift_getWitnessTable(&unk_1000434C0, &type metadata for BlockPopUpsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CD38);
  }
  return result;
}

unint64_t sub_100014B0C()
{
  unint64_t result;

  result = qword_10005CD40;
  if (!qword_10005CD40)
  {
    result = swift_getWitnessTable(&unk_1000434E8, &type metadata for BlockPopUpsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CD40);
  }
  return result;
}

uint64_t sub_100014B50(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100048FA8, 1) + 8);
}

uint64_t sub_100014B74(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000140AC();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100014BB4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C230, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E620, (uint64_t)sub_10001434C, a1);
}

uint64_t sub_100014BD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C238 != -1)
    swift_once(&qword_10005C238, sub_1000143AC);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E638);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_100014C38(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005CE74);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100014458(a1, v5, v4);
}

uint64_t sub_100014C9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1000156B4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100014CC0()
{
  return 0xD000000000000022;
}

unint64_t sub_100014CE0()
{
  unint64_t result;

  result = qword_10005CD50;
  if (!qword_10005CD50)
  {
    result = swift_getWitnessTable(&unk_100043544, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD50);
  }
  return result;
}

unint64_t sub_100014D28()
{
  unint64_t result;

  result = qword_10005CD58;
  if (!qword_10005CD58)
  {
    result = swift_getWitnessTable(&unk_100043678, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CD58);
  }
  return result;
}

uint64_t sub_100014D6C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100014D84, 0, 0);
}

uint64_t sub_100014D84()
{
  uint64_t v0;
  _BYTE *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(_BYTE **)(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
  v3 = objc_msgSend(v2, "BOOLForKey:", _SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey);

  *v1 = v3 ^ 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100014E08(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005CE6C);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 16) = v3;
  return swift_task_switch(sub_1000159F0, 0, 0);
}

uint64_t sub_100014E68(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005CE40 + dword_10005CE40);
  v2 = (_QWORD *)swift_task_alloc(unk_10005CE44);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_100014EC8()
{
  unint64_t result;

  result = qword_10005CD68;
  if (!qword_10005CD68)
  {
    result = swift_getWitnessTable(&unk_10004357C, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD68);
  }
  return result;
}

uint64_t sub_100014F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100015288();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100014F78()
{
  unint64_t result;

  result = qword_10005CD78;
  if (!qword_10005CD78)
  {
    result = swift_getWitnessTable(&unk_1000435D4, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD78);
  }
  return result;
}

unint64_t sub_100014FC0()
{
  unint64_t result;

  result = qword_10005CD80;
  if (!qword_10005CD80)
  {
    result = swift_getWitnessTable(&unk_100043634, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD80);
  }
  return result;
}

unint64_t sub_100015008()
{
  unint64_t result;

  result = qword_10005CD88[0];
  if (!qword_10005CD88[0])
  {
    result = swift_getWitnessTable(&unk_1000436D8, &type metadata for BlockPopUpsEntity);
    atomic_store(result, qword_10005CD88);
  }
  return result;
}

uint64_t sub_10001504C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100015288();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000150B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100015288();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100015124()
{
  unint64_t result;

  result = qword_10005CDA0;
  if (!qword_10005CDA0)
  {
    result = swift_getWitnessTable(&unk_10004365C, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CDA0);
  }
  return result;
}

unint64_t sub_10001516C()
{
  unint64_t result;

  result = qword_10005CDA8;
  if (!qword_10005CDA8)
  {
    result = swift_getWitnessTable(&unk_100043820, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDA8);
  }
  return result;
}

unint64_t sub_1000151B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CDB0;
  if (!qword_10005CDB0)
  {
    v1 = sub_1000060C8(qword_10005CDB8);
    sub_10001516C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005CDB0);
  }
  return result;
}

uint64_t sub_100015218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100014EC8();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100015288()
{
  unint64_t result;

  result = qword_10005CDD0;
  if (!qword_10005CDD0)
  {
    result = swift_getWitnessTable(&unk_100043504, &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CDD0);
  }
  return result;
}

uint64_t sub_1000152CC()
{
  uint64_t v0;

  v0 = qword_10005CD10;
  swift_bridgeObjectRetain(off_10005CD18);
  return v0;
}

unint64_t sub_100015304()
{
  unint64_t result;

  result = qword_10005CDD8;
  if (!qword_10005CDD8)
  {
    result = swift_getWitnessTable(&unk_100043730, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDD8);
  }
  return result;
}

unint64_t sub_10001534C()
{
  unint64_t result;

  result = qword_10005CDE0;
  if (!qword_10005CDE0)
  {
    result = swift_getWitnessTable(&unk_100043768, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDE0);
  }
  return result;
}

unint64_t sub_100015394()
{
  unint64_t result;

  result = qword_10005CDE8;
  if (!qword_10005CDE8)
  {
    result = swift_getWitnessTable(&unk_100043798, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDE8);
  }
  return result;
}

unint64_t sub_1000153DC()
{
  unint64_t result;

  result = qword_10005CDF0;
  if (!qword_10005CDF0)
  {
    result = swift_getWitnessTable(&unk_1000437D0, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDF0);
  }
  return result;
}

unint64_t sub_100015424()
{
  unint64_t result;

  result = qword_10005CDF8;
  if (!qword_10005CDF8)
  {
    result = swift_getWitnessTable(&unk_1000437F8, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CDF8);
  }
  return result;
}

unint64_t sub_10001546C()
{
  unint64_t result;

  result = qword_10005CE00;
  if (!qword_10005CE00)
  {
    result = swift_getWitnessTable(&unk_100043878, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE00);
  }
  return result;
}

uint64_t sub_1000154B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100014D28();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1000154EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C228, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E608, (uint64_t)sub_10001411C, a1);
}

uint64_t sub_100015510()
{
  return sub_1000061A8(&qword_10005CE08, &qword_10005CE10, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10001553C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015008();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015578()
{
  unint64_t result;

  result = qword_10005CE18;
  if (!qword_10005CE18)
  {
    result = swift_getWitnessTable(&unk_1000438A8, &type metadata for BlockPopUpsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE18);
  }
  return result;
}

uint64_t sub_1000155BC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014D28();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000155F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001546C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity.BlockPopUpsEntityQuery()
{
  return &type metadata for BlockPopUpsEntity.BlockPopUpsEntityQuery;
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity()
{
  return &type metadata for BlockPopUpsEntity;
}

ValueMetadata *type metadata accessor for BlockPopUpsEntity.UpdateIntent_value()
{
  return &type metadata for BlockPopUpsEntity.UpdateIntent_value;
}

uint64_t sub_10001565C()
{
  return sub_1000061A8(&qword_10005CE20, &qword_10005CE28, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100015688()
{
  return sub_1000061A8(&qword_10005CE30, &qword_10005CE28, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_1000156B4()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005CE38);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000017, 0x800000010003F6B0);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100015008();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000028, 0x800000010003F6D0);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_1000159D8(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000159F0, 0, 0);
}

uint64_t sub_1000159F0()
{
  uint64_t v0;
  char v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(_BYTE *)(v0 + 16);
  v2 = (void *)objc_opt_self(NSUserDefaults);
  v3 = objc_msgSend(v2, "safari_browserDefaults");
  v4 = _SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey;
  objc_msgSend(v3, "setBool:forKey:", (v1 & 1) == 0, _SFJavaScriptCanOpenWindowsAutomaticallyDefaultsKey);

  v5 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v6 = objc_msgSend(v2, "safari_notificationNameForUserDefaultsKey:", v4);
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", v6, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100015AE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100015BA0, 0, 0);
}

uint64_t sub_100015BA0()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005CD30);
  v7 = String.LocalizationValue.init(stringLiteral:)(0x6F50206B636F6C42, 0xED00007370552D70);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005CE58, &qword_10005CE60, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005CE48, 0, &unk_10005CE50, 0, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_100015CF4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

unint64_t sub_100015D04()
{
  unint64_t result;

  result = qword_10005CEB8;
  if (!qword_10005CEB8)
  {
    result = swift_getWitnessTable(&unk_100043A0C, &type metadata for SearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CEB8);
  }
  return result;
}

uint64_t sub_100015D48()
{
  return sub_1000061A8(&qword_10005CEC0, &qword_10005CEC8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100015D74()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E658);
  sub_10000AAD4(v16, (uint64_t)qword_10005E658);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x4520686372616553, 0xED0000656E69676ELL);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Search Engine (App Entity)", 26, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Search Engine' suggestion", 47, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_100015FC8(uint64_t a1)
{
  return sub_100008B08(a1, qword_10005E670, 0xD000000000000021, 0x800000010003FB70);
}

uint64_t sub_100015FEC(uint64_t a1)
{
  return sub_100008B88(a1, qword_10005E688, 0xD000000000000049, 0x800000010003FB20);
}

uint64_t sub_100016010()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000447E0);
  qword_10005E6A0 = result;
  return result;
}

uint64_t sub_100016034()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100016064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D260);
  v3[13] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[15] = v8;
  v3[16] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005D268);
  v3[17] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[18] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[19] = swift_task_alloc(v11);
  v3[20] = swift_task_alloc(v11);
  return swift_task_switch(sub_100016170, 0, 0);
}

uint64_t sub_100016170()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[21] = v1;
  v2 = sub_100016E48();
  *v1 = v0;
  v1[1] = sub_1000161F0;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[20], v0 + 2, sub_100016618, 0, &type metadata for SearchEngineEntity, v2);
}

uint64_t sub_1000161F0()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 168));
  return swift_task_switch(sub_100016244, 0, 0);
}

uint64_t sub_100016244()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  IntentParameter.wrappedValue.getter(v0 + 3);
  v1 = v0[3];
  v0[4] = v1;
  v0[22] = v1;
  IntentParameter.wrappedValue.getter(v0 + 5);
  v2 = v0[5];
  v0[6] = v2;
  v0[23] = v2;
  if (qword_10005C260 != -1)
    swift_once(&qword_10005C260, sub_100016010);
  v3 = qword_10005E6A0;
  v0[24] = qword_10005E6A0;
  v4 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v3);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[25] = v5;
  v6 = sub_1000061A8(&qword_10005D248, &qword_10005D250, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v5 = v0;
  v5[1] = sub_100016344;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 6, v3, &type metadata for SearchEngineOption, v6);
}

uint64_t sub_100016344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc(v2);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v6 = sub_10001658C;
  else
    v6 = sub_1000163CC;
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000163CC()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 120);
  v15 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 56));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100015D04();
  v11 = sub_100016FAC();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100016618, 0, v7, v6, &type metadata for SearchEngineEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for SearchEngineEntity.UpdateIntent_value, &type metadata for SearchEngineEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 56, v4, &type metadata for SearchEngineEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001658C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(v2, *(_QWORD *)(v0 + 136));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001661C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005D270);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C260 != -1)
    swift_once(&qword_10005C260, sub_100016010);
  v4 = qword_10005E6A0;
  swift_retain(qword_10005E6A0);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100016FAC();
  v7 = sub_1000061A8(&qword_10005D278, &qword_10005D270, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for SearchEngineEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

_QWORD *sub_100016724@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100016760(uint64_t a1, uint64_t a2)
{
  return sub_10000931C(a1, a2, &qword_10005C260, &qword_10005E6A0, (uint64_t)sub_100016010);
}

unint64_t sub_100016780()
{
  unint64_t result;

  result = qword_10005CED0;
  if (!qword_10005CED0)
  {
    result = swift_getWitnessTable(&unk_100043A9C, &type metadata for SearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CED0);
  }
  return result;
}

unint64_t sub_1000167C8()
{
  unint64_t result;

  result = qword_10005CED8;
  if (!qword_10005CED8)
  {
    result = swift_getWitnessTable(&unk_100043AC4, &type metadata for SearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CED8);
  }
  return result;
}

uint64_t sub_10001680C(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100049110, 1) + 8);
}

uint64_t sub_100016830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100009418(a1, a2, a3, (uint64_t (*)(void))sub_100015D04);
}

uint64_t sub_10001683C@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C250, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E670, (uint64_t)sub_100015FC8, a1);
}

uint64_t sub_100016860@<X0>(uint64_t a1@<X8>)
{
  return sub_100017EC4(&qword_10005C258, (uint64_t)qword_10005E688, (uint64_t)sub_100015FEC, a1);
}

uint64_t sub_10001687C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D25C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100016064(a1, v5, v4);
}

uint64_t sub_1000168E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10001A3B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100016904()
{
  return 0xD000000000000023;
}

unint64_t sub_100016924()
{
  unint64_t result;

  result = qword_10005CEE8;
  if (!qword_10005CEE8)
  {
    result = swift_getWitnessTable(&unk_100043B20, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CEE8);
  }
  return result;
}

unint64_t sub_10001696C()
{
  unint64_t result;

  result = qword_10005CEF0;
  if (!qword_10005CEF0)
  {
    result = swift_getWitnessTable(&unk_100043C54, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CEF0);
  }
  return result;
}

uint64_t sub_1000169B0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000169C8, 0, 0);
}

uint64_t sub_1000169C8()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");
  v2 = objc_msgSend(v1, "defaultSearchEngineName");
  if (v2)
  {
    v3 = v2;
    v4 = *(uint64_t **)(v0 + 16);
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v7 = v6;

    v8 = sub_10001A69C(v5, v7);
    *v4 = v8;
  }
  else
  {
    v9 = type metadata accessor for _PrebuiltAppIntentError(0);
    v10 = sub_10001B360();
    swift_allocError(v9, v10, 0, 0);
    v11 = static _UnrecoverableError.entityNotFound.getter();
    swift_willThrow(v11);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100016AAC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = *a2;
  return swift_task_switch(sub_100016AC8, 0, 0);
}

id sub_100016AC8()
{
  _QWORD *v0;
  id v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  NSString v16;
  id v17;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");
  result = objc_msgSend(v1, "currentSearchEngineNames");
  if (result)
  {
    v3 = result;
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

    v5 = *(_QWORD *)(v4 + 16);
    if (v5)
    {
      v17 = v1;
      swift_bridgeObjectRetain(v4);
      v6 = (uint64_t *)(v4 + 40);
      while (1)
      {
        v7 = *v6;
        v0[2] = *(v6 - 1);
        v0[3] = v7;
        swift_bridgeObjectRetain(v7);
        EntityProperty.wrappedValue.getter(v0 + 4);
        v8 = v0[5];
        v9 = sub_1000062D0();
        v10 = StringProtocol.caseInsensitiveCompare<A>(_:)(v0 + 4, &type metadata for String, &type metadata for String, v9, v9);
        swift_bridgeObjectRelease(v8);
        swift_bridgeObjectRelease(v7);
        if (!v10)
          break;
        v6 += 2;
        if (!--v5)
        {
          swift_bridgeObjectRelease(v4);
          v1 = v17;
          goto LABEL_7;
        }
      }
      swift_bridgeObjectRelease_n(v4, 2);
      EntityProperty.wrappedValue.getter(v0 + 2);
      v15 = v0[3];
      v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v15);
      objc_msgSend(v17, "setDefaultSearchEngine:forPrivateBrowsing:", v16, 0);

      v14 = (uint64_t (*)(void))v0[1];
    }
    else
    {
LABEL_7:
      swift_bridgeObjectRelease(v4);

      v11 = type metadata accessor for _PrebuiltAppIntentError(0);
      v12 = sub_10001B360();
      swift_allocError(v11, v12, 0, 0);
      v13 = static _UnrecoverableError.entityNotFound.getter();
      swift_willThrow(v13);

      v14 = (uint64_t (*)(void))v0[1];
    }
    return (id)v14();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100016CA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D230 + dword_10005D230);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D234);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_100016D08()
{
  unint64_t result;

  result = qword_10005CF00;
  if (!qword_10005CF00)
  {
    result = swift_getWitnessTable(&unk_100043B58, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF00);
  }
  return result;
}

uint64_t sub_100016D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001708C();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100016DB8()
{
  unint64_t result;

  result = qword_10005CF10;
  if (!qword_10005CF10)
  {
    result = swift_getWitnessTable(&unk_100043BB0, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF10);
  }
  return result;
}

unint64_t sub_100016E00()
{
  unint64_t result;

  result = qword_10005CF18;
  if (!qword_10005CF18)
  {
    result = swift_getWitnessTable(&unk_100043C10, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF18);
  }
  return result;
}

unint64_t sub_100016E48()
{
  unint64_t result;

  result = qword_10005CF20[0];
  if (!qword_10005CF20[0])
  {
    result = swift_getWitnessTable(&unk_100043CB4, &type metadata for SearchEngineEntity);
    atomic_store(result, qword_10005CF20);
  }
  return result;
}

uint64_t sub_100016E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001708C();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100016EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001708C();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100016F64()
{
  unint64_t result;

  result = qword_10005CF38;
  if (!qword_10005CF38)
  {
    result = swift_getWitnessTable(&unk_100043C38, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF38);
  }
  return result;
}

unint64_t sub_100016FAC()
{
  unint64_t result;

  result = qword_10005CF40;
  if (!qword_10005CF40)
  {
    result = swift_getWitnessTable(&unk_100043DFC, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF40);
  }
  return result;
}

uint64_t sub_100016FF0()
{
  return sub_100009AE0(&qword_10005CF48, qword_10005CF50, (void (*)(void))sub_100016FAC);
}

uint64_t sub_10001701C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100016D08();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001708C()
{
  unint64_t result;

  result = qword_10005CF68;
  if (!qword_10005CF68)
  {
    result = swift_getWitnessTable(&unk_100043AE0, &type metadata for SearchEngineEntity.SearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF68);
  }
  return result;
}

uint64_t sub_1000170D0()
{
  uint64_t v0;

  v0 = qword_10005CE98;
  swift_bridgeObjectRetain(off_10005CEA0);
  return v0;
}

unint64_t sub_100017108()
{
  unint64_t result;

  result = qword_10005CF70;
  if (!qword_10005CF70)
  {
    result = swift_getWitnessTable(&unk_100043D0C, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF70);
  }
  return result;
}

unint64_t sub_100017150()
{
  unint64_t result;

  result = qword_10005CF78;
  if (!qword_10005CF78)
  {
    result = swift_getWitnessTable(&unk_100043D44, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF78);
  }
  return result;
}

unint64_t sub_100017198()
{
  unint64_t result;

  result = qword_10005CF80;
  if (!qword_10005CF80)
  {
    result = swift_getWitnessTable(&unk_100043D74, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF80);
  }
  return result;
}

unint64_t sub_1000171E0()
{
  unint64_t result;

  result = qword_10005CF88;
  if (!qword_10005CF88)
  {
    result = swift_getWitnessTable(&unk_100043DAC, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF88);
  }
  return result;
}

unint64_t sub_100017228()
{
  unint64_t result;

  result = qword_10005CF90;
  if (!qword_10005CF90)
  {
    result = swift_getWitnessTable(&unk_100043DD4, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF90);
  }
  return result;
}

unint64_t sub_100017270()
{
  unint64_t result;

  result = qword_10005CF98;
  if (!qword_10005CF98)
  {
    result = swift_getWitnessTable(&unk_100043E54, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CF98);
  }
  return result;
}

uint64_t sub_1000172B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100009E58(a1, (uint64_t (*)(void))sub_10001696C, a2);
}

uint64_t sub_1000172C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C248, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E658, (uint64_t)sub_100015D74, a1);
}

uint64_t sub_1000172E4()
{
  return sub_1000061A8(&qword_10005CFA0, &qword_10005CFA8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100017310(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016E48();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001734C()
{
  unint64_t result;

  result = qword_10005CFB0;
  if (!qword_10005CFB0)
  {
    result = swift_getWitnessTable(&unk_100043E84, &type metadata for SearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CFB0);
  }
  return result;
}

uint64_t sub_100017390(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001696C();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000173C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100017270();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100017404()
{
  unint64_t result;

  result = qword_10005CFB8;
  if (!qword_10005CFB8)
  {
    result = swift_getWitnessTable(&unk_100043F5C, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CFB8);
  }
  return result;
}

uint64_t sub_100017448()
{
  return sub_1000061A8(&qword_10005CFC0, &qword_10005CFC8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100017474()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E6A8);
  sub_10000AAD4(v16, (uint64_t)qword_10005E6A8);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x800000010003F940);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Private Search Engine (App Entity)", 34, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Private Search Engine' suggestion", 55, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_1000176C4(uint64_t a1)
{
  return sub_100008B08(a1, qword_10005E6C0, 0xD000000000000029, 0x800000010003FA70);
}

uint64_t sub_1000176E8(uint64_t a1)
{
  return sub_100008B88(a1, qword_10005E6D8, 0xD000000000000059, 0x800000010003FA10);
}

uint64_t sub_10001770C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000447B8);
  qword_10005E6F0 = result;
  return result;
}

uint64_t sub_100017730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D210);
  v3[13] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[15] = v8;
  v3[16] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005D218);
  v3[17] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[18] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[19] = swift_task_alloc(v11);
  v3[20] = swift_task_alloc(v11);
  return swift_task_switch(sub_10001783C, 0, 0);
}

uint64_t sub_10001783C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[21] = v1;
  v2 = sub_100018B8C();
  *v1 = v0;
  v1[1] = sub_1000178BC;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[20], v0 + 2, sub_100017C58, 0, &type metadata for PrivateSearchEngineEntity, v2);
}

uint64_t sub_1000178BC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 168));
  return swift_task_switch(sub_100017910, 0, 0);
}

uint64_t sub_100017910()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  IntentParameter.wrappedValue.getter(v0 + 3);
  v1 = v0[3];
  v0[4] = v1;
  v0[22] = v1;
  IntentParameter.wrappedValue.getter(v0 + 5);
  v2 = v0[5];
  v0[6] = v2;
  v0[23] = v2;
  if (qword_10005C280 != -1)
    swift_once(&qword_10005C280, sub_10001770C);
  v3 = qword_10005E6F0;
  v0[24] = qword_10005E6F0;
  v4 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v3);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[25] = v5;
  v6 = sub_1000061A8(&qword_10005D1E8, &qword_10005D1F0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v5 = v0;
  v5[1] = sub_100017A10;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 6, v3, &type metadata for SearchEngineOption, v6);
}

uint64_t sub_100017A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc(v2);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v6 = sub_10001B6F4;
  else
    v6 = sub_100017A98;
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100017A98()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 120);
  v15 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 56));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100017404();
  v11 = sub_100018CF0();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100017C58, 0, v7, v6, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, &type metadata for PrivateSearchEngineEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 56, v4, &type metadata for PrivateSearchEngineEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100017C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005D220);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C280 != -1)
    swift_once(&qword_10005C280, sub_10001770C);
  v4 = qword_10005E6F0;
  swift_retain(qword_10005E6F0);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100018CF0();
  v7 = sub_1000061A8(&qword_10005D228, &qword_10005D220, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for PrivateSearchEngineEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100017D64(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *a1;
  v3 = v1;
  swift_retain(v1);
  IntentParameter.wrappedValue.setter(&v3);
  return swift_release(v1);
}

uint64_t sub_100017DA8(uint64_t a1, uint64_t a2)
{
  return sub_10000931C(a1, a2, &qword_10005C280, &qword_10005E6F0, (uint64_t)sub_10001770C);
}

unint64_t sub_100017DC8()
{
  unint64_t result;

  result = qword_10005CFD0;
  if (!qword_10005CFD0)
  {
    result = swift_getWitnessTable(&unk_100043FEC, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CFD0);
  }
  return result;
}

unint64_t sub_100017E10()
{
  unint64_t result;

  result = qword_10005CFD8;
  if (!qword_10005CFD8)
  {
    result = swift_getWitnessTable(&unk_100044014, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005CFD8);
  }
  return result;
}

uint64_t sub_100017E54(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000490CC, 1) + 8);
}

uint64_t sub_100017E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100009418(a1, a2, a3, (uint64_t (*)(void))sub_100017404);
}

uint64_t sub_100017E84@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C270, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E6C0, (uint64_t)sub_1000176C4, a1);
}

uint64_t sub_100017EA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100017EC4(&qword_10005C278, (uint64_t)qword_10005E6D8, (uint64_t)sub_1000176E8, a1);
}

uint64_t sub_100017EC4@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = sub_100006014(&qword_10005C788);
  v7 = sub_10000AAD4(v6, a2);
  return sub_100006314(v7, a4, &qword_10005C788);
}

uint64_t sub_100017F2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D20C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100017730(a1, v5, v4);
}

uint64_t sub_100017F90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10001AAB0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100017FB4()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_100017FD4()
{
  unint64_t result;

  result = qword_10005CFE8;
  if (!qword_10005CFE8)
  {
    result = swift_getWitnessTable(&unk_100044070, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CFE8);
  }
  return result;
}

unint64_t sub_10001801C()
{
  unint64_t result;

  result = qword_10005CFF0;
  if (!qword_10005CFF0)
  {
    result = swift_getWitnessTable(&unk_1000441A4, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005CFF0);
  }
  return result;
}

uint64_t sub_100018060(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100018078, 0, 0);
}

uint64_t sub_100018078()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");
  v2 = objc_msgSend(v1, "privateSearchEngineName");
  if (v2)
  {
    v3 = v2;
    v4 = *(uint64_t **)(v0 + 16);
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v7 = v6;

    v8 = sub_10001A69C(v5, v7);
    *v4 = v8;
  }
  else
  {
    v9 = type metadata accessor for _PrebuiltAppIntentError(0);
    v10 = sub_10001B360();
    swift_allocError(v9, v10, 0, 0);
    v11 = static _UnrecoverableError.entityNotFound.getter();
    swift_willThrow(v11);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001815C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = *a2;
  return swift_task_switch(sub_100018178, 0, 0);
}

id sub_100018178()
{
  _QWORD *v0;
  id v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  void *v15;
  id v16;
  NSString v17;
  unsigned int v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  NSString v27;
  unint64_t v28;
  Class isa;
  uint64_t v30;
  NSString v31;
  void *v32;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");

  result = objc_msgSend(v1, "currentSearchEngineNames");
  if (result)
  {
    v3 = result;
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for String);

    v5 = *(_QWORD *)(v4 + 16);
    if (!v5)
    {
LABEL_7:
      swift_bridgeObjectRelease(v4);

      v11 = type metadata accessor for _PrebuiltAppIntentError(0);
      v12 = sub_10001B360();
      swift_allocError(v11, v12, 0, 0);
      v13 = static _UnrecoverableError.entityNotFound.getter();
      swift_willThrow(v13);

      v14 = (uint64_t (*)(void))v0[1];
      return (id)v14();
    }
    v32 = v1;
    swift_bridgeObjectRetain(v4);
    v6 = (uint64_t *)(v4 + 40);
    while (1)
    {
      v7 = *v6;
      v0[2] = *(v6 - 1);
      v0[3] = v7;
      swift_bridgeObjectRetain(v7);
      EntityProperty.wrappedValue.getter(v0 + 4);
      v8 = v0[5];
      v9 = sub_1000062D0();
      v10 = StringProtocol.caseInsensitiveCompare<A>(_:)(v0 + 4, &type metadata for String, &type metadata for String, v9, v9);
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRelease(v7);
      if (!v10)
        break;
      v6 += 2;
      if (!--v5)
      {
        swift_bridgeObjectRelease(v4);
        v1 = v32;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease_n(v4, 2);
    v15 = (void *)objc_opt_self(NSUserDefaults);
    v16 = objc_msgSend(v15, "sf_safariSharedDefaults");
    v17 = String._bridgeToObjectiveC()();
    v18 = objc_msgSend(v16, "BOOLForKey:", v17);

    v19 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");
    v20 = objc_msgSend(v19, "defaultSearchEngineName");

    if (v20)
    {
      v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v23 = v22;

    }
    else
    {
      v21 = 0;
      v23 = 0;
    }
    EntityProperty.wrappedValue.getter(v0 + 2);
    v24 = v0[3];
    if (v23)
    {
      if (v21 == v0[2] && v23 == v24)
      {
        swift_bridgeObjectRelease(v0[3]);
        swift_bridgeObjectRelease(v23);
LABEL_20:
        EntityProperty.wrappedValue.getter(v0 + 2);
        v30 = v0[3];
        v31 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v30);
        objc_msgSend(v32, "setDefaultSearchEngine:forPrivateBrowsing:", v31, 1);

        v14 = (uint64_t (*)(void))v0[1];
        return (id)v14();
      }
      v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23);
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v23);
      if ((v25 & 1) != 0 || ((v18 ^ 1) & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      swift_bridgeObjectRelease(v0[3]);
      if (!v18)
        goto LABEL_20;
    }
    v26 = objc_msgSend(v15, "sf_safariSharedDefaults");
    v27 = String._bridgeToObjectiveC()();
    v28 = sub_100018544((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v28);
    objc_msgSend(v26, "safari_setBool:forKey:andNotifyWithUserInfo:", 0, v27, isa);

    goto LABEL_20;
  }
  __break(1u);
  return result;
}

unint64_t sub_100018544(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006014(&qword_10005D1F8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100006314(v7, (uint64_t)v16, &qword_10005D200);
    result = sub_100019DA8((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10001B660(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100018684(uint64_t a1)
{
  return sub_100018854(a1, &qword_10005D2A0, &qword_10005D2A8, (uint64_t (*)(_QWORD))sub_100019C74);
}

void sub_1000186A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100006014(&qword_10005D290);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6
    && (sub_100006014(&qword_10005D298),
        v7 = static _DictionaryStorage.allocate(capacity:)(v6),
        v8 = (_QWORD *)v7,
        (v9 = *(_QWORD *)(a1 + 16)) != 0))
  {
    v10 = &v5[*(int *)(v2 + 48)];
    v11 = v7 + 64;
    v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v26 = a1;
    v13 = a1 + v12;
    v14 = *(_QWORD *)(v3 + 72);
    swift_retain(v7);
    while (1)
    {
      sub_100006314(v13, (uint64_t)v5, &qword_10005D290);
      v15 = *v5;
      sub_100019DD8(*v5);
      if ((v17 & 1) != 0)
        break;
      v18 = v16;
      *(_QWORD *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(v8[6] + v16) = v15;
      v19 = v8[7];
      v20 = type metadata accessor for DisplayRepresentation(0);
      (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
      v21 = v8[2];
      v22 = __OFADD__(v21, 1);
      v23 = v21 + 1;
      if (v22)
        goto LABEL_11;
      v8[2] = v23;
      v13 += v14;
      if (!--v9)
      {
        swift_release(v8);
        v24 = v26;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
  }
  else
  {
    v24 = a1;
LABEL_9:
    swift_bridgeObjectRelease(v24);
  }
}

unint64_t sub_100018838(uint64_t a1)
{
  return sub_100018854(a1, &qword_10005D280, &qword_10005D288, (uint64_t (*)(_QWORD))sub_100019CFC);
}

unint64_t sub_100018854(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD);

  v31 = a4;
  v7 = sub_100006014(a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  if (!v11)
  {
    v13 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v29 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v29);
    return (unint64_t)v13;
  }
  sub_100006014(a3);
  v12 = static _DictionaryStorage.allocate(capacity:)(v11);
  v13 = (_QWORD *)v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    goto LABEL_9;
  v15 = &v10[*(int *)(v7 + 48)];
  v16 = v12 + 64;
  v17 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v30 = a1;
  v18 = a1 + v17;
  v19 = *(_QWORD *)(v8 + 72);
  swift_retain(v12);
  while (1)
  {
    sub_100006314(v18, (uint64_t)v10, a2);
    v20 = *v10;
    result = v31(*v10);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v16 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v13[6] + result) = v20;
    v24 = v13[7];
    v25 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v23, v15, v25);
    v26 = v13[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_12;
    v13[2] = v28;
    v18 += v19;
    if (!--v14)
    {
      swift_release(v13);
      v29 = v30;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1000189EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D1D0 + dword_10005D1D0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D1D4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_100018A4C()
{
  unint64_t result;

  result = qword_10005D000;
  if (!qword_10005D000)
  {
    result = swift_getWitnessTable(&unk_1000440A8, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D000);
  }
  return result;
}

uint64_t sub_100018A90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100018DD0();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100018AFC()
{
  unint64_t result;

  result = qword_10005D010;
  if (!qword_10005D010)
  {
    result = swift_getWitnessTable(&unk_100044100, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D010);
  }
  return result;
}

unint64_t sub_100018B44()
{
  unint64_t result;

  result = qword_10005D018;
  if (!qword_10005D018)
  {
    result = swift_getWitnessTable(&unk_100044160, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D018);
  }
  return result;
}

unint64_t sub_100018B8C()
{
  unint64_t result;

  result = qword_10005D020[0];
  if (!qword_10005D020[0])
  {
    result = swift_getWitnessTable(&unk_100044204, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, qword_10005D020);
  }
  return result;
}

uint64_t sub_100018BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100018DD0();
  *v5 = v2;
  v5[1] = sub_10000ADA8;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100018C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100018DD0();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100018CA8()
{
  unint64_t result;

  result = qword_10005D038;
  if (!qword_10005D038)
  {
    result = swift_getWitnessTable(&unk_100044188, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D038);
  }
  return result;
}

unint64_t sub_100018CF0()
{
  unint64_t result;

  result = qword_10005D040;
  if (!qword_10005D040)
  {
    result = swift_getWitnessTable(&unk_10004434C, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D040);
  }
  return result;
}

uint64_t sub_100018D34()
{
  return sub_100009AE0(&qword_10005D048, qword_10005D050, (void (*)(void))sub_100018CF0);
}

uint64_t sub_100018D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100018A4C();
  *v5 = v2;
  v5[1] = sub_10000AD94;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100018DD0()
{
  unint64_t result;

  result = qword_10005D068;
  if (!qword_10005D068)
  {
    result = swift_getWitnessTable(&unk_100044030, &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D068);
  }
  return result;
}

uint64_t sub_100018E14()
{
  uint64_t v0;

  v0 = qword_10005CEA8;
  swift_bridgeObjectRetain(off_10005CEB0);
  return v0;
}

unint64_t sub_100018E4C()
{
  unint64_t result;

  result = qword_10005D070;
  if (!qword_10005D070)
  {
    result = swift_getWitnessTable(&unk_10004425C, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D070);
  }
  return result;
}

unint64_t sub_100018E94()
{
  unint64_t result;

  result = qword_10005D078;
  if (!qword_10005D078)
  {
    result = swift_getWitnessTable(&unk_100044294, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D078);
  }
  return result;
}

unint64_t sub_100018EDC()
{
  unint64_t result;

  result = qword_10005D080;
  if (!qword_10005D080)
  {
    result = swift_getWitnessTable(&unk_1000442C4, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D080);
  }
  return result;
}

unint64_t sub_100018F24()
{
  unint64_t result;

  result = qword_10005D088;
  if (!qword_10005D088)
  {
    result = swift_getWitnessTable(&unk_1000442FC, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D088);
  }
  return result;
}

unint64_t sub_100018F6C()
{
  unint64_t result;

  result = qword_10005D090;
  if (!qword_10005D090)
  {
    result = swift_getWitnessTable(&unk_100044324, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D090);
  }
  return result;
}

unint64_t sub_100018FB4()
{
  unint64_t result;

  result = qword_10005D098;
  if (!qword_10005D098)
  {
    result = swift_getWitnessTable(&unk_1000443A4, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D098);
  }
  return result;
}

uint64_t sub_100018FF8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100009E58(a1, (uint64_t (*)(void))sub_10001801C, a2);
}

uint64_t sub_100019004@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C268, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E6A8, (uint64_t)sub_100017474, a1);
}

uint64_t sub_100019028()
{
  return sub_1000061A8(&qword_10005D0A0, &qword_10005D0A8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100019054(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018B8C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019090()
{
  unint64_t result;

  result = qword_10005D0B0;
  if (!qword_10005D0B0)
  {
    result = swift_getWitnessTable(&unk_1000443D4, &type metadata for PrivateSearchEngineEntity);
    atomic_store(result, (unint64_t *)&qword_10005D0B0);
  }
  return result;
}

uint64_t sub_1000190D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001801C();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10001910C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100018FB4();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100019148()
{
  unint64_t result;

  result = qword_10005D0B8;
  if (!qword_10005D0B8)
  {
    result = swift_getWitnessTable(&unk_100044454, &type metadata for SearchEngineOption.Query);
    atomic_store(result, (unint64_t *)&qword_10005D0B8);
  }
  return result;
}

unint64_t sub_100019190()
{
  unint64_t result;

  result = qword_10005D0C0;
  if (!qword_10005D0C0)
  {
    result = swift_getWitnessTable(&unk_1000444B4, &type metadata for SearchEngineOption.Query);
    atomic_store(result, (unint64_t *)&qword_10005D0C0);
  }
  return result;
}

unint64_t sub_1000191D8()
{
  unint64_t result;

  result = qword_10005D0C8[0];
  if (!qword_10005D0C8[0])
  {
    result = swift_getWitnessTable(&unk_1000444F8, &type metadata for SearchEngineOption);
    atomic_store(result, qword_10005D0C8);
  }
  return result;
}

uint64_t sub_10001921C()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E6F8);
  sub_10000AAD4(v16, (uint64_t)qword_10005E6F8);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003F890);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity name", 15, 2);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_10001944C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  Swift::String v13;
  void *object;
  Swift::String v15;
  uint64_t v16;
  Swift::String v18;

  v0 = sub_100006014(&qword_10005D1A8);
  __chkstk_darwin(v0);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v13);
  EntityProperty.wrappedValue.getter(&v18);
  object = v18._object;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v18);
  swift_bridgeObjectRelease(object);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v15);
  LocalizedStringResource.init(stringInterpolation:)(v12);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 1, 1, v16);
  return DisplayRepresentation.init(title:subtitle:image:)(v9, v5, v2);
}

uint64_t sub_10001961C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10005D1C8 + dword_10005D1C8);
  v3 = (_QWORD *)swift_task_alloc(unk_10005D1CC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000ADA8;
  return v5(a1);
}

uint64_t sub_10001967C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D1B0 + dword_10005D1B0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D1B4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_1000196DC()
{
  unint64_t result;

  result = qword_10005D0E0;
  if (!qword_10005D0E0)
  {
    result = swift_getWitnessTable(&unk_1000444DC, &type metadata for SearchEngineOption.Query);
    atomic_store(result, (unint64_t *)&qword_10005D0E0);
  }
  return result;
}

unint64_t sub_100019724()
{
  unint64_t result;

  result = qword_10005D0E8;
  if (!qword_10005D0E8)
  {
    result = swift_getWitnessTable(&unk_100044640, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D0E8);
  }
  return result;
}

uint64_t sub_100019768()
{
  return sub_100009AE0(&qword_10005D0F0, qword_10005D0F8, (void (*)(void))sub_100019724);
}

uint64_t sub_100019794(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000198DC();
  *v5 = v2;
  v5[1] = sub_10000AD94;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100019804()
{
  unint64_t result;

  result = qword_10005D110;
  if (!qword_10005D110)
  {
    result = swift_getWitnessTable(&unk_100044550, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D110);
  }
  return result;
}

unint64_t sub_10001984C()
{
  unint64_t result;

  result = qword_10005D118;
  if (!qword_10005D118)
  {
    result = swift_getWitnessTable(&unk_100044588, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D118);
  }
  return result;
}

unint64_t sub_100019894()
{
  unint64_t result;

  result = qword_10005D120;
  if (!qword_10005D120)
  {
    result = swift_getWitnessTable(&unk_1000445B8, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D120);
  }
  return result;
}

unint64_t sub_1000198DC()
{
  unint64_t result;

  result = qword_10005D128;
  if (!qword_10005D128)
  {
    result = swift_getWitnessTable(&unk_1000443FC, &type metadata for SearchEngineOption.Query);
    atomic_store(result, (unint64_t *)&qword_10005D128);
  }
  return result;
}

unint64_t sub_100019924()
{
  unint64_t result;

  result = qword_10005D130;
  if (!qword_10005D130)
  {
    result = swift_getWitnessTable(&unk_1000445F0, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D130);
  }
  return result;
}

unint64_t sub_10001996C()
{
  unint64_t result;

  result = qword_10005D138;
  if (!qword_10005D138)
  {
    result = swift_getWitnessTable(&unk_100044618, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D138);
  }
  return result;
}

unint64_t sub_1000199B8()
{
  unint64_t result;

  result = qword_10005D140;
  if (!qword_10005D140)
  {
    result = swift_getWitnessTable(&unk_100044698, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D140);
  }
  return result;
}

_QWORD *sub_1000199FC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[2];

  result = EntityProperty.wrappedValue.getter(v4);
  v3 = v4[1];
  *a1 = v4[0];
  a1[1] = v3;
  return result;
}

uint64_t sub_100019A34@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C288, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E6F8, (uint64_t)sub_10001921C, a1);
}

uint64_t sub_100019A58()
{
  return sub_1000061A8(&qword_10005D148, &qword_10005D150, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100019A84(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000191D8();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019AC0()
{
  unint64_t result;

  result = qword_10005D158;
  if (!qword_10005D158)
  {
    result = swift_getWitnessTable(&unk_1000446C8, &type metadata for SearchEngineOption);
    atomic_store(result, (unint64_t *)&qword_10005D158);
  }
  return result;
}

uint64_t sub_100019B04()
{
  return sub_10001944C();
}

uint64_t sub_100019B0C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000199B8();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SearchEngineOption.Query()
{
  return &type metadata for SearchEngineOption.Query;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery()
{
  return &type metadata for PrivateSearchEngineEntity.PrivateSearchEngineEntityQuery;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity()
{
  return &type metadata for PrivateSearchEngineEntity;
}

ValueMetadata *type metadata accessor for PrivateSearchEngineEntity.UpdateIntent_value()
{
  return &type metadata for PrivateSearchEngineEntity.UpdateIntent_value;
}

ValueMetadata *type metadata accessor for SearchEngineEntity.SearchEngineEntityQuery()
{
  return &type metadata for SearchEngineEntity.SearchEngineEntityQuery;
}

ValueMetadata *type metadata accessor for SearchEngineOption()
{
  return &type metadata for SearchEngineOption;
}

ValueMetadata *type metadata accessor for SearchEngineEntity()
{
  return &type metadata for SearchEngineEntity;
}

ValueMetadata *type metadata accessor for SearchEngineEntity.UpdateIntent_value()
{
  return &type metadata for SearchEngineEntity.UpdateIntent_value;
}

uint64_t sub_100019BC4()
{
  return sub_1000061A8(&qword_10005D160, &qword_10005D168, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100019BF0()
{
  return sub_1000061A8(&qword_10005D170, &qword_10005D168, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100019C1C()
{
  return sub_1000061A8(&qword_10005D178, &qword_10005D180, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100019C48()
{
  return sub_1000061A8(&qword_10005D188, &qword_10005D180, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

unint64_t sub_100019C74(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;
  unint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v2 = v1;
  Hasher.init(_seed:)(v9, *(_QWORD *)(v2 + 40));
  v4 = a1 & 1;
  if ((a1 & 1) != 0)
    v5 = 0x6D6F74746F62;
  else
    v5 = 7368564;
  if ((a1 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE300000000000000;
  String.hash(into:)(v9, v5, v6);
  swift_bridgeObjectRelease(v6);
  v7 = Hasher._finalize()();
  return sub_100019EA4(v4, v7);
}

unint64_t sub_100019CFC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;
  unint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v2 = v1;
  Hasher.init(_seed:)(v9, *(_QWORD *)(v2 + 40));
  v4 = a1 & 1;
  if ((a1 & 1) != 0)
    v5 = 0x54746361706D6F63;
  else
    v5 = 0x6574617261706573;
  if ((a1 & 1) != 0)
    v6 = 0xED00007261426261;
  else
    v6 = 0xEE00726142626154;
  String.hash(into:)(v9, v5, v6);
  swift_bridgeObjectRelease(v6);
  v7 = Hasher._finalize()();
  return sub_100019FD0(v4, v7);
}

unint64_t sub_100019DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10001A12C(a1, v4);
}

void sub_100019DD8(char a1)
{
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v1 + 40));
  __asm { BR              X10 }
}

uint64_t sub_100019E30()
{
  uint64_t v0;
  Swift::Int v1;
  uint64_t v3;

  String.hash(into:)(&v3, 0x796144656E6FLL, 0xE600000000000000);
  swift_bridgeObjectRelease(0xE600000000000000);
  v1 = Hasher._finalize()();
  return sub_10001A1F0(v0, v1);
}

unint64_t sub_100019EA4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x6D6F74746F62;
    else
      v6 = 7368564;
    if ((a1 & 1) != 0)
      v7 = 0xE600000000000000;
    else
      v7 = 0xE300000000000000;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x6D6F74746F62 : 7368564;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xE600000000000000 : 0xE300000000000000;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v7);
      if ((v11 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n(v7, 2);
  }
  return v4;
}

unint64_t sub_100019FD0(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x54746361706D6F63;
    else
      v6 = 0x6574617261706573;
    if ((a1 & 1) != 0)
      v7 = 0xED00007261426261;
    else
      v7 = 0xEE00726142626154;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x54746361706D6F63 : 0x6574617261706573;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xED00007261426261 : 0xEE00726142626154;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v7);
      if ((v11 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n(v7, 2);
  }
  return v4;
}

unint64_t sub_10001A12C(uint64_t a1, uint64_t a2)
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
      sub_10001B670(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10001B6AC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001A1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_10001A3B8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v30 = *(_QWORD *)(v0 - 8);
  v31 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C700);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v25 - v7;
  v9 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100006014(&qword_10005D1A0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000024, 0x800000010003F810);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v28(v11, 1, 1, v12);
  v32 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v31;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 104);
  v26(v2, enum case for InputConnectionBehavior.default(_:), v31);
  v22 = sub_100016E48();
  v30 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v32, v18, v19, v2, v22);
  sub_100006014(&qword_10005D198);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000042, 0x800000010003F840);
  v28(v11, 1, 1, v29);
  v32 = 0;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  v26(v2, v20, v21);
  v23 = sub_1000191D8();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v32, v18, v19, v2, v23);
  return v30;
}

uint64_t sub_10001A69C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  __int16 v21;
  _QWORD v23[3];

  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v23[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v23[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v23[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v23[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006014(&qword_10005D1C0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003F8D0);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Search Engine Option Item (App Entity)", 38, 2, v13, 0xD000000000000018, 0x800000010003F360, v10, v7, "'Search Engine Option' title", 28, v21);
  v18 = EntityProperty<>.init(title:)(v16);
  v23[0] = a1;
  v23[1] = a2;
  v19 = swift_retain(v18);
  EntityProperty.wrappedValue.setter(v23, v19);
  swift_release(v18);
  return v18;
}

uint64_t sub_10001A898()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001A954, 0, 0);
}

uint64_t sub_10001A954()
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
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005CEC8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ALL, 0x800000010003FAA0);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D248, &qword_10005D250, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_1000191D8();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D238, 0, &unk_10005D240, 0, &type metadata for SearchEngineEntity.UpdateIntent_value, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_10001AAB0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v30 = *(_QWORD *)(v0 - 8);
  v31 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C700);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v25 - v7;
  v9 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100006014(&qword_10005D190);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000002CLL, 0x800000010003F780);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v28(v11, 1, 1, v12);
  v32 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v31;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 104);
  v26(v2, enum case for InputConnectionBehavior.default(_:), v31);
  v22 = sub_100018B8C();
  v30 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v32, v18, v19, v2, v22);
  sub_100006014(&qword_10005D198);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000052, 0x800000010003F7B0);
  v28(v11, 1, 1, v29);
  v32 = 0;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  v26(v2, v20, v21);
  v23 = sub_1000191D8();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v32, v18, v19, v2, v23);
  return v30;
}

uint64_t sub_10001AD94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001AE50, 0, 0);
}

uint64_t sub_10001AE50()
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
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005CFC8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x800000010003F910);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D1E8, &qword_10005D1F0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_1000191D8();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D1D8, 0, &unk_10005D1E0, 0, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_10001AFAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[4] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[5] = v2;
  v0[6] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001B068, 0, 0);
}

uint64_t sub_10001B068()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;

  v1 = objc_msgSend(objc_allocWithZone((Class)SFSearchEngineControllerWrapper), "init");
  v2 = objc_msgSend(v1, "currentSearchEngineNames");
  if (v2)
  {
    v3 = v2;
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String);

    v5 = *(_QWORD *)(v4 + 16);
    if (v5)
    {
      v33 = v1;
      v35 = *(_QWORD *)(v0 + 40);
      specialized ContiguousArray.reserveCapacity(_:)(v5);
      sub_100006014(&qword_10005D1C0);
      v34 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v32 = v4;
      v6 = (_QWORD *)(v4 + 40);
      do
      {
        v7 = *(_QWORD *)(v0 + 64);
        v8 = *(_QWORD *)(v0 + 72);
        v10 = *(_QWORD *)(v0 + 48);
        v9 = *(_QWORD *)(v0 + 56);
        v11 = *(_QWORD *)(v0 + 32);
        v13 = *(v6 - 1);
        v12 = *v6;
        swift_bridgeObjectRetain(*v6);
        v14 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003F8D0);
        static Locale.current.getter(v14);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v10, v34, v11);
        LOWORD(v31) = 2;
        LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Search Engine Option Item (App Entity)", 38, 2, v7, 0xD000000000000018, 0x800000010003F360, v9, v10, "'Search Engine Option' title", 28, v31);
        v15 = EntityProperty<>.init(title:)(v8);
        *(_QWORD *)(v0 + 16) = v13;
        *(_QWORD *)(v0 + 24) = v12;
        v16 = swift_retain(v15);
        EntityProperty.wrappedValue.setter(v0 + 16, v16);
        v17 = swift_release(v15);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v17);
        v18 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
        v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v15);
        specialized ContiguousArray._endMutation()(v19);
        v6 += 2;
        --v5;
      }
      while (v5);

      swift_bridgeObjectRelease(v32);
    }
    else
    {

      swift_bridgeObjectRelease(v4);
    }
    v28 = *(_QWORD *)(v0 + 64);
    v30 = *(_QWORD *)(v0 + 48);
    v29 = *(_QWORD *)(v0 + 56);
    swift_task_dealloc(*(_QWORD *)(v0 + 72));
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 72);
    v23 = *(_QWORD *)(v0 + 48);
    v22 = *(_QWORD *)(v0 + 56);
    v24 = type metadata accessor for _PrebuiltAppIntentError(0);
    v25 = sub_10001B360();
    swift_allocError(v24, v25, 0, 0);
    v26 = static _UnrecoverableError.unknownError.getter();
    swift_willThrow(v26);

    swift_task_dealloc(v21);
    swift_task_dealloc(v20);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

unint64_t sub_10001B360()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D1B8;
  if (!qword_10005D1B8)
  {
    v1 = type metadata accessor for _PrebuiltAppIntentError(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for _PrebuiltAppIntentError, v1);
    atomic_store(result, (unint64_t *)&qword_10005D1B8);
  }
  return result;
}

uint64_t sub_10001B3A8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[4] = a1;
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Locale(0);
  v1[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  v1[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v1[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001B468, 0, 0);
}

uint64_t sub_10001B468()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v21;
  unsigned int v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v23 = *(_QWORD *)(v0 + 48);
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    sub_100006014(&qword_10005D1C0);
    v22 = enum case for LocalizedStringResource.BundleDescription.main(_:);
    v3 = (_QWORD *)(v1 + 40);
    do
    {
      v5 = *(_QWORD *)(v0 + 72);
      v4 = *(_QWORD *)(v0 + 80);
      v6 = *(_QWORD *)(v0 + 56);
      v7 = *(_QWORD *)(v0 + 64);
      v8 = *(_QWORD *)(v0 + 40);
      v10 = *(v3 - 1);
      v9 = *v3;
      swift_bridgeObjectRetain(*v3);
      v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003F8D0);
      static Locale.current.getter(v11);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v6, v22, v8);
      LOWORD(v21) = 2;
      LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Search Engine Option Item (App Entity)", 38, 2, v5, 0xD000000000000018, 0x800000010003F360, v7, v6, "'Search Engine Option' title", 28, v21);
      v12 = EntityProperty<>.init(title:)(v4);
      *(_QWORD *)(v0 + 16) = v10;
      *(_QWORD *)(v0 + 24) = v9;
      v13 = swift_retain(v12);
      EntityProperty.wrappedValue.setter(v0 + 16, v13);
      v14 = swift_release(v12);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      v15 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v12);
      specialized ContiguousArray._endMutation()(v16);
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  v17 = *(_QWORD *)(v0 + 72);
  v19 = *(_QWORD *)(v0 + 56);
  v18 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

_OWORD *sub_10001B660(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001B670(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10001B6AC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10001B6E0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_10001B6FC()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E710);
  sub_10000AAD4(v16, (uint64_t)qword_10005E710);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x800000010003FC00);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Tab Bar Configuration", 21, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Tab Bar' configuration setting", 52, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_10001B948()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E728);
  sub_10000AAD4(v0, (uint64_t)qword_10005E728);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003FCD0);
}

uint64_t sub_10001B9A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E740);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E740);
  IntentDescription.init(stringLiteral:)(0xD00000000000003FLL, 0x800000010003FC90);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_10001BA30()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000450C8);
  qword_10005E758 = result;
  return result;
}

uint64_t sub_10001BA54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D490);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005D498);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_10001BB60, 0, 0);
}

uint64_t sub_10001BB60()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10001D4DC();
  *v1 = v0;
  v1[1] = sub_10001BBE0;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10001BF70, 0, &type metadata for TabBarLayoutEntity, v2);
}

uint64_t sub_10001BBE0()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_10001BC34, 0, 0);
}

uint64_t sub_10001BC34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C2A8 != -1)
    swift_once(&qword_10005C2A8, sub_10001BA30);
  v2 = qword_10005E758;
  *(_QWORD *)(v0 + 168) = qword_10005E758;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005D470, &qword_10005D478, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10001BD30;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for CapsuleLayoutStyle, v5);
}

uint64_t sub_10001BD30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_10001BDB0;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001BDB0()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_10001D238();
  v11 = sub_10001D56C();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10001BF70, 0, v7, v6, &type metadata for TabBarLayoutEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for TabBarLayoutEntity.UpdateIntent_value, &type metadata for TabBarLayoutEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for TabBarLayoutEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001BF74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005D4A0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C2A8 != -1)
    swift_once(&qword_10005C2A8, sub_10001BA30);
  v4 = qword_10005E758;
  swift_retain(qword_10005E758);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10001D56C();
  v7 = sub_1000061A8(&qword_10005D4A8, &qword_10005D4A0, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for TabBarLayoutEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_10001C07C()
{
  double result;

  if (qword_10005C2A8 != -1)
    swift_once(&qword_10005C2A8, sub_10001BA30);
  *(_QWORD *)&result = swift_retain(qword_10005E758).n128_u64[0];
  return result;
}

uint64_t sub_10001C0BC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C298, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E728, (uint64_t)sub_10001B948, a1);
}

uint64_t sub_10001C0E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C2A0 != -1)
    swift_once(&qword_10005C2A0, sub_10001B9A8);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E740);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_10001C140(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D48C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_10001BA54(a1, v5, v4);
}

uint64_t sub_10001C1A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10001E0C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001C1C8()
{
  return 0xD000000000000023;
}

uint64_t sub_10001C1E4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10001C1FC, 0, 0);
}

uint64_t sub_10001C1FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[3] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[4] = v1;
  v0[5] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C278, v2, v3);
}

uint64_t sub_10001C278()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[3];
  swift_release(v0[5]);
  v0[6] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_10001C2D4, 0, 0);
}

uint64_t sub_10001C2D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 56) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C334, v2, v3);
}

uint64_t sub_10001C334()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[6];
  swift_release(v0[7]);
  v0[8] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_10001C388, 0, 0);
}

uint64_t sub_10001C388()
{
  uint64_t v0;
  id v1;
  id v2;
  char v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(v0 + 64) != 1)
  {
    v1 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
    v2 = objc_msgSend(v1, "integerForKey:", SFPreferredCapsuleLayoutStyleKey);

    if (v2 == (id)1)
    {
      v3 = 1;
      goto LABEL_6;
    }
    if (v2 != (id)2)
    {
      v6 = type metadata accessor for _PrebuiltAppIntentError(0);
      v7 = sub_10001B360();
      swift_allocError(v6, v7, 0, 0);
      v8 = static _UnrecoverableError.entityNotFound.getter();
      swift_willThrow(v8);
      v4 = *(uint64_t (**)(void))(v0 + 8);
      return v4();
    }
  }
  v3 = 0;
LABEL_6:
  **(_BYTE **)(v0 + 16) = v3;
  v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001C470(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005D484);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 64) = v3;
  return swift_task_switch(sub_10001E3CC, 0, 0);
}

uint64_t sub_10001C4D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D458 + dword_10005D458);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D45C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

uint64_t sub_10001C52C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001D61C();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10001C594(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001D61C();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001C600(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001D61C();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_10001C668(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001D404();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10001C6D4()
{
  uint64_t v0;

  v0 = qword_10005D2B0;
  swift_bridgeObjectRetain(off_10005D2B8);
  return v0;
}

uint64_t sub_10001C708@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10001D3BC();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10001C744@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C290, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E710, (uint64_t)sub_10001B6FC, a1);
}

uint64_t sub_10001C768(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001D4DC();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10001C7A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001D3BC();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10001C7D8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001D7CC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t CapsuleLayoutStyle.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6D6F74746F62;
  else
    return 7368564;
}

uint64_t sub_10001C83C()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, static CapsuleLayoutStyle.typeDisplayRepresentation);
  sub_10000AAD4(v16, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ALL, 0x800000010003FD30);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "Label for the type of focus filter, Profile or Tab Group", 56, 2);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t CapsuleLayoutStyle.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10005C2B0 != -1)
    swift_once(&qword_10005C2B0, sub_10001C83C);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000AAD4(v0, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
}

uint64_t static CapsuleLayoutStyle.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10005C2B0 != -1)
    swift_once(&qword_10005C2B0, sub_10001C83C);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CapsuleLayoutStyle.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10005C2B0 != -1)
    swift_once(&qword_10005C2B0, sub_10001C83C);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CapsuleLayoutStyle.typeDisplayRepresentation.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C2B0 != -1)
    swift_once(&qword_10005C2B0, sub_10001C83C);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

unint64_t sub_10001CC78()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  unint64_t result;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  void (*v38)(char *);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;

  v0 = sub_100006014(&qword_10005D1A8);
  __chkstk_darwin(v0);
  v46 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v2);
  v44 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = type metadata accessor for LocalizedStringResource(0);
  v41 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100006014(&qword_10005D4B0);
  v17 = sub_100006014(&qword_10005D2A0);
  v18 = *(_QWORD *)(v17 - 8);
  v40 = v17;
  v42 = *(_QWORD *)(v18 + 72);
  v19 = *(unsigned __int8 *)(v18 + 80);
  v20 = (v19 + 32) & ~v19;
  v21 = swift_allocObject(v16, v20 + 2 * v42, v19 | 7);
  v45 = v21;
  *(_OWORD *)(v21 + 16) = xmmword_100044810;
  v22 = v21 + v20;
  v36 = v21 + v20 + *(int *)(v17 + 48);
  *(_BYTE *)(v21 + v20) = 0;
  v23 = String.LocalizationValue.init(stringLiteral:)(0x5420656C676E6953, 0xEA00000000006261);
  static Locale.current.getter(v23);
  v37 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v38 = *(void (**)(char *))(v5 + 104);
  v38(v7);
  v35 = 0x800000010003F360;
  v24 = v10;
  v25 = v10;
  v26 = v7;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000018, 0x800000010003F360, v24, v7, "The position of Safari search bar in Safari Settings", 52, 2);
  v41 = *(_QWORD *)(v41 + 56);
  v27 = v43;
  v28 = v44;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v41)(v44, 1, 1, v43);
  v29 = type metadata accessor for DisplayRepresentation.Image(0);
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v31 = v46;
  v30(v46, 1, 1, v29);
  DisplayRepresentation.init(title:subtitle:image:)(v15, v28, v31);
  *(_BYTE *)(v22 + v42) = 1;
  v32 = String.LocalizationValue.init(stringLiteral:)(0x72614220626154, 0xE700000000000000);
  static Locale.current.getter(v32);
  ((void (*)(char *, _QWORD, uint64_t))v38)(v26, v37, v39);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000018, v35, v25, v26, "The position of Safari search bar in Safari Settings", 52, 2);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v41)(v28, 1, 1, v27);
  v30(v31, 1, 1, v29);
  DisplayRepresentation.init(title:subtitle:image:)(v15, v28, v31);
  result = sub_100018684(v45);
  static CapsuleLayoutStyle.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CapsuleLayoutStyle.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10005C2B8 != -1)
    swift_once(&qword_10005C2B8, sub_10001CC78);
  return &static CapsuleLayoutStyle.caseDisplayRepresentations;
}

uint64_t static CapsuleLayoutStyle.caseDisplayRepresentations.getter()
{
  _BYTE v1[24];

  if (qword_10005C2B8 != -1)
    swift_once(&qword_10005C2B8, sub_10001CC78);
  swift_beginAccess(&static CapsuleLayoutStyle.caseDisplayRepresentations, v1, 0, 0);
  return swift_bridgeObjectRetain(static CapsuleLayoutStyle.caseDisplayRepresentations);
}

uint64_t static CapsuleLayoutStyle.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10005C2B8 != -1)
    swift_once(&qword_10005C2B8, sub_10001CC78);
  swift_beginAccess(&static CapsuleLayoutStyle.caseDisplayRepresentations, v4, 1, 0);
  v2 = static CapsuleLayoutStyle.caseDisplayRepresentations;
  static CapsuleLayoutStyle.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*static CapsuleLayoutStyle.caseDisplayRepresentations.modify(uint64_t a1))(_QWORD)
{
  if (qword_10005C2B8 != -1)
    swift_once(&qword_10005C2B8, sub_10001CC78);
  swift_beginAccess(&static CapsuleLayoutStyle.caseDisplayRepresentations, a1, 33, 0);
  return j_j__swift_endAccess;
}

SafariWidgetExtension::CapsuleLayoutStyle_optional __swiftcall CapsuleLayoutStyle.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  SafariWidgetExtension::CapsuleLayoutStyle_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000553B8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1)
    v4.value = SafariWidgetExtension_CapsuleLayoutStyle_bottom;
  else
    v4.value = SafariWidgetExtension_CapsuleLayoutStyle_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

_UNKNOWN **static CapsuleLayoutStyle.allCases.getter()
{
  return &off_100055408;
}

unint64_t sub_10001D238()
{
  unint64_t result;

  result = qword_10005D2C0;
  if (!qword_10005D2C0)
  {
    result = swift_getWitnessTable(&unk_1000448DC, &type metadata for TabBarLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D2C0);
  }
  return result;
}

uint64_t sub_10001D27C()
{
  return sub_1000061A8(&qword_10005D2C8, &qword_10005D2D0, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

unint64_t sub_10001D2AC()
{
  unint64_t result;

  result = qword_10005D2D8;
  if (!qword_10005D2D8)
  {
    result = swift_getWitnessTable(&unk_10004496C, &type metadata for TabBarLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D2D8);
  }
  return result;
}

unint64_t sub_10001D2F4()
{
  unint64_t result;

  result = qword_10005D2E0;
  if (!qword_10005D2E0)
  {
    result = swift_getWitnessTable(&unk_100044994, &type metadata for TabBarLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D2E0);
  }
  return result;
}

uint64_t sub_10001D338(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000491C4, 1) + 8);
}

uint64_t sub_10001D35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_10001D238, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_10001D374()
{
  unint64_t result;

  result = qword_10005D2F0;
  if (!qword_10005D2F0)
  {
    result = swift_getWitnessTable(&unk_1000449F0, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D2F0);
  }
  return result;
}

unint64_t sub_10001D3BC()
{
  unint64_t result;

  result = qword_10005D2F8;
  if (!qword_10005D2F8)
  {
    result = swift_getWitnessTable(&unk_100044B24, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D2F8);
  }
  return result;
}

unint64_t sub_10001D404()
{
  unint64_t result;

  result = qword_10005D308;
  if (!qword_10005D308)
  {
    result = swift_getWitnessTable(&unk_100044A28, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D308);
  }
  return result;
}

unint64_t sub_10001D44C()
{
  unint64_t result;

  result = qword_10005D318;
  if (!qword_10005D318)
  {
    result = swift_getWitnessTable(&unk_100044A80, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D318);
  }
  return result;
}

unint64_t sub_10001D494()
{
  unint64_t result;

  result = qword_10005D320;
  if (!qword_10005D320)
  {
    result = swift_getWitnessTable(&unk_100044AE0, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D320);
  }
  return result;
}

unint64_t sub_10001D4DC()
{
  unint64_t result;

  result = qword_10005D328[0];
  if (!qword_10005D328[0])
  {
    result = swift_getWitnessTable(&unk_100044B84, &type metadata for TabBarLayoutEntity);
    atomic_store(result, qword_10005D328);
  }
  return result;
}

unint64_t sub_10001D524()
{
  unint64_t result;

  result = qword_10005D340;
  if (!qword_10005D340)
  {
    result = swift_getWitnessTable(&unk_100044B08, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D340);
  }
  return result;
}

unint64_t sub_10001D56C()
{
  unint64_t result;

  result = qword_10005D348;
  if (!qword_10005D348)
  {
    result = swift_getWitnessTable(&unk_100044CCC, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D348);
  }
  return result;
}

unint64_t sub_10001D5B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D350;
  if (!qword_10005D350)
  {
    v1 = sub_1000060C8(qword_10005D358);
    sub_10001D56C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D350);
  }
  return result;
}

unint64_t sub_10001D61C()
{
  unint64_t result;

  result = qword_10005D370;
  if (!qword_10005D370)
  {
    result = swift_getWitnessTable(&unk_1000449B0, &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D370);
  }
  return result;
}

unint64_t sub_10001D664()
{
  unint64_t result;

  result = qword_10005D378;
  if (!qword_10005D378)
  {
    result = swift_getWitnessTable(&unk_100044BDC, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D378);
  }
  return result;
}

unint64_t sub_10001D6AC()
{
  unint64_t result;

  result = qword_10005D380;
  if (!qword_10005D380)
  {
    result = swift_getWitnessTable(&unk_100044C14, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D380);
  }
  return result;
}

unint64_t sub_10001D6F4()
{
  unint64_t result;

  result = qword_10005D388;
  if (!qword_10005D388)
  {
    result = swift_getWitnessTable(&unk_100044C44, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D388);
  }
  return result;
}

unint64_t sub_10001D73C()
{
  unint64_t result;

  result = qword_10005D390;
  if (!qword_10005D390)
  {
    result = swift_getWitnessTable(&unk_100044C7C, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D390);
  }
  return result;
}

unint64_t sub_10001D784()
{
  unint64_t result;

  result = qword_10005D398;
  if (!qword_10005D398)
  {
    result = swift_getWitnessTable(&unk_100044CA4, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D398);
  }
  return result;
}

unint64_t sub_10001D7CC()
{
  unint64_t result;

  result = qword_10005D3A0;
  if (!qword_10005D3A0)
  {
    result = swift_getWitnessTable(&unk_100044D24, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D3A0);
  }
  return result;
}

uint64_t sub_10001D810()
{
  return sub_1000061A8(&qword_10005D3A8, &qword_10005D3B0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

unint64_t sub_10001D840()
{
  unint64_t result;

  result = qword_10005D3B8;
  if (!qword_10005D3B8)
  {
    result = swift_getWitnessTable(&unk_100044D54, &type metadata for TabBarLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D3B8);
  }
  return result;
}

uint64_t sub_10001D884(char *a1, char *a2)
{
  return sub_100038BF4(*a1, *a2);
}

unint64_t sub_10001D894()
{
  unint64_t result;

  result = qword_10005D3C0;
  if (!qword_10005D3C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3C0);
  }
  return result;
}

Swift::Int sub_10001D8D8()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 0x6D6F74746F62;
  else
    v2 = 7368564;
  if (v1)
    v3 = 0xE600000000000000;
  else
    v3 = 0xE300000000000000;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10001D94C(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0x6D6F74746F62;
  else
    v2 = 7368564;
  if (*v1)
    v3 = 0xE600000000000000;
  else
    v3 = 0xE300000000000000;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10001D99C(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 0x6D6F74746F62;
  else
    v3 = 7368564;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xE300000000000000;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10001DA0C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000553B8, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_10001DA68(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7368564;
  if (*v1)
    v2 = 0x6D6F74746F62;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE600000000000000;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_10001DAA0()
{
  unint64_t result;

  result = qword_10005D3C8;
  if (!qword_10005D3C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3C8);
  }
  return result;
}

unint64_t sub_10001DAE8()
{
  unint64_t result;

  result = qword_10005D3D0;
  if (!qword_10005D3D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3D0);
  }
  return result;
}

unint64_t sub_10001DB30()
{
  unint64_t result;

  result = qword_10005D3D8;
  if (!qword_10005D3D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3D8);
  }
  return result;
}

void *sub_10001DB74()
{
  return &protocol witness table for String;
}

unint64_t sub_10001DB84()
{
  unint64_t result;

  result = qword_10005D3E0;
  if (!qword_10005D3E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3E0);
  }
  return result;
}

unint64_t sub_10001DBCC()
{
  unint64_t result;

  result = qword_10005D3E8;
  if (!qword_10005D3E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3E8);
  }
  return result;
}

unint64_t sub_10001DC14()
{
  unint64_t result;

  result = qword_10005D3F0;
  if (!qword_10005D3F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3F0);
  }
  return result;
}

unint64_t sub_10001DC5C()
{
  unint64_t result;

  result = qword_10005D3F8;
  if (!qword_10005D3F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D3F8);
  }
  return result;
}

uint64_t sub_10001DCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_10001DCF4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_10001DCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

unint64_t sub_10001DCF4()
{
  unint64_t result;

  result = qword_10005D400;
  if (!qword_10005D400)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D400);
  }
  return result;
}

uint64_t sub_10001DD38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001DCF4();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001DD74()
{
  unint64_t result;

  result = qword_10005D408;
  if (!qword_10005D408)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D408);
  }
  return result;
}

unint64_t sub_10001DDBC()
{
  unint64_t result;

  result = qword_10005D410;
  if (!qword_10005D410)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D410);
  }
  return result;
}

unint64_t sub_10001DE04()
{
  unint64_t result;

  result = qword_10005D418;
  if (!qword_10005D418)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D418);
  }
  return result;
}

uint64_t sub_10001DE48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001DC5C();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10001DE80()
{
  return sub_1000061A8(&qword_10005D420, &qword_10005D428, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10001DEAC(_QWORD *a1@<X8>)
{
  *a1 = &off_100055430;
}

_BYTE *initializeBufferWithCopyOfBuffer for CapsuleLayoutStyle(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CapsuleLayoutStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CapsuleLayoutStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001DFA8 + 4 * byte_100044825[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001DFDC + 4 * byte_100044820[v4]))();
}

uint64_t sub_10001DFDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001DFE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001DFECLL);
  return result;
}

uint64_t sub_10001DFF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001E000);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001E004(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001E00C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001E018(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001E020(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CapsuleLayoutStyle()
{
  return &type metadata for CapsuleLayoutStyle;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity.TabBarLayoutEntityQuery()
{
  return &type metadata for TabBarLayoutEntity.TabBarLayoutEntityQuery;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity()
{
  return &type metadata for TabBarLayoutEntity;
}

ValueMetadata *type metadata accessor for TabBarLayoutEntity.UpdateIntent_value()
{
  return &type metadata for TabBarLayoutEntity.UpdateIntent_value;
}

uint64_t sub_10001E06C()
{
  return sub_1000061A8(&qword_10005D430, &qword_10005D438, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10001E098()
{
  return sub_1000061A8(&qword_10005D440, &qword_10005D438, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10001E0C4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C700);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100006014(&qword_10005D448);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001FLL, 0x800000010003FBA0);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v31 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v29;
  v25[0] = *(_QWORD *)(v28 + 104);
  ((void (*)(char *, _QWORD, uint64_t))v25[0])(v2, enum case for InputConnectionBehavior.default(_:), v29);
  v22 = sub_10001D4DC();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100006014(&qword_10005D450);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000038, 0x800000010003FBC0);
  v26(v11, 1, 1, v27);
  v30 = 2;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_10001DCF4();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_100055390, v23);
  return v28;
}

uint64_t sub_10001E3B4(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = a1;
  return swift_task_switch(sub_10001E3CC, 0, 0);
}

uint64_t sub_10001E3CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[2] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[3] = v1;
  v0[4] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001E448, v2, v3);
}

uint64_t sub_10001E448()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[2];
  swift_release(v0[4]);
  v0[5] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_10001E4A4, 0, 0);
}

uint64_t sub_10001E4A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001E504, v2, v3);
}

uint64_t sub_10001E504()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[5];
  swift_release(v0[6]);
  v0[7] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_10001E558, 0, 0);
}

uint64_t sub_10001E558()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  if (*(_QWORD *)(v0 + 56) == 1)
  {
    v1 = type metadata accessor for _PrebuiltAppIntentError(0);
    v2 = sub_10001B360();
    swift_allocError(v1, v2, 0, 0);
    v3 = static _UnrecoverableError.unsupportedOnDevice.getter();
    swift_willThrow(v3);
    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v5 = *(_BYTE *)(v0 + 64);
    v6 = (void *)objc_opt_self(NSUserDefaults);
    v7 = objc_msgSend(v6, "safari_browserDefaults");
    if ((v5 & 1) != 0)
      v8 = 1;
    else
      v8 = 2;
    v9 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v8);
    v10 = SFPreferredCapsuleLayoutStyleKey;
    objc_msgSend(v7, "setObject:forKey:", v9, SFPreferredCapsuleLayoutStyleKey);

    v11 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
    v12 = objc_msgSend(v6, "safari_notificationNameForUserDefaultsKey:", v10);
    objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", v12, 0, 0, 1);

    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_10001E6D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001E78C, 0, 0);
}

uint64_t sub_10001E78C()
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
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005D2D0);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x800000010003FC00);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D470, &qword_10005D478, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_10001DCF4();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D460, 0, &unk_10005D468, 0, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_10001E8F0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for BlockPopUpsControlToggle()
{
  return &type metadata for BlockPopUpsControlToggle;
}

uint64_t sub_10001E910(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049224, 1);
}

uint64_t sub_10001E920@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100045150);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_100014D28();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD000000000000038, 0x800000010003FD90, KeyPath, sub_10001ED24, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000018, 0x80000001000450D0);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000002FLL, 0x800000010003FDD0);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_10001ED24()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0x6F50206B636F6C42, 0xED00007370552D70);
  return Label<>.init(_:systemImage:)(v0);
}

unint64_t sub_10001ED88()
{
  unint64_t result;

  result = qword_10005D4C8;
  if (!qword_10005D4C8)
  {
    result = swift_getWitnessTable(&unk_100045230, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D4C8);
  }
  return result;
}

uint64_t sub_10001EDCC()
{
  return sub_1000061A8(&qword_10005D4D0, &qword_10005D4D8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10001EDF8()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E780);
  sub_10000AAD4(v16, (uint64_t)qword_10005E780);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003F1D0);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Search Engine Suggestions (App Entity)", 38, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Search Engine Suggestions' toggle", 55, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_10001F048()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E798);
  sub_10000AAD4(v0, (uint64_t)qword_10005E798);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000002DLL, 0x800000010003FFB0);
}

uint64_t sub_10001F0A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E7B0);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E7B0);
  IntentDescription.init(stringLiteral:)(0xD000000000000061, 0x800000010003FF40);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_10001F130()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100045738);
  qword_10005E7C8 = result;
  return result;
}

uint64_t sub_10001F154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D618);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005D620);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_10001F260, 0, 0);
}

uint64_t sub_10001F260()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10001FCC0();
  *v1 = v0;
  v1[1] = sub_10001F2E0;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10001F670, 0, &type metadata for SearchEngineSuggestionsEntity, v2);
}

uint64_t sub_10001F2E0()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_10001F334, 0, 0);
}

uint64_t sub_10001F334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C2D8 != -1)
    swift_once(&qword_10005C2D8, sub_10001F130);
  v2 = qword_10005E7C8;
  *(_QWORD *)(v0 + 168) = qword_10005E7C8;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005D5F8, &qword_10005D600, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10001F430;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_10001F430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_10001F4B0;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001F4B0()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_10001ED88();
  v11 = sub_10001FE24();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10001F670, 0, v7, v6, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, &type metadata for SearchEngineSuggestionsEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for SearchEngineSuggestionsEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001F674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005D628);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C2D8 != -1)
    swift_once(&qword_10005C2D8, sub_10001F130);
  v4 = qword_10005E7C8;
  swift_retain(qword_10005E7C8);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10001FE24();
  v7 = sub_1000061A8(&qword_10005D630, &qword_10005D628, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for SearchEngineSuggestionsEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_10001F77C()
{
  double result;

  if (qword_10005C2D8 != -1)
    swift_once(&qword_10005C2D8, sub_10001F130);
  *(_QWORD *)&result = swift_retain(qword_10005E7C8).n128_u64[0];
  return result;
}

unint64_t sub_10001F7C0()
{
  unint64_t result;

  result = qword_10005D4E0;
  if (!qword_10005D4E0)
  {
    result = swift_getWitnessTable(&unk_1000452C0, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D4E0);
  }
  return result;
}

unint64_t sub_10001F808()
{
  unint64_t result;

  result = qword_10005D4E8;
  if (!qword_10005D4E8)
  {
    result = swift_getWitnessTable(&unk_1000452E8, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D4E8);
  }
  return result;
}

uint64_t sub_10001F84C(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000492A0, 1) + 8);
}

uint64_t sub_10001F870(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10001ED88();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10001F8B0@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C2C8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E798, (uint64_t)sub_10001F048, a1);
}

uint64_t sub_10001F8D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C2D0 != -1)
    swift_once(&qword_10005C2D0, sub_10001F0A8);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E7B0);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_10001F934(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D614);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_10001F154(a1, v5, v4);
}

uint64_t sub_10001F998@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10002036C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001F9BC()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_10001F9DC()
{
  unint64_t result;

  result = qword_10005D4F8;
  if (!qword_10005D4F8)
  {
    result = swift_getWitnessTable(&unk_100045344, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D4F8);
  }
  return result;
}

uint64_t sub_10001FA24(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10001FA3C, 0, 0);
}

uint64_t sub_10001FA3C()
{
  uint64_t v0;
  _BYTE *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(_BYTE **)(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
  v3 = objc_msgSend(v2, "BOOLForKey:", SuppressSearchSuggestionsDefaultsKey);

  *v1 = v3 ^ 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001FAC0(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005D60C);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 16) = v3;
  return swift_task_switch(sub_1000206A8, 0, 0);
}

uint64_t sub_10001FB20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D5E0 + dword_10005D5E0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D5E4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_10001FB80()
{
  unint64_t result;

  result = qword_10005D508;
  if (!qword_10005D508)
  {
    result = swift_getWitnessTable(&unk_10004537C, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D508);
  }
  return result;
}

uint64_t sub_10001FBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001FF40();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001FC30()
{
  unint64_t result;

  result = qword_10005D518;
  if (!qword_10005D518)
  {
    result = swift_getWitnessTable(&unk_1000453D4, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D518);
  }
  return result;
}

unint64_t sub_10001FC78()
{
  unint64_t result;

  result = qword_10005D520;
  if (!qword_10005D520)
  {
    result = swift_getWitnessTable(&unk_100045434, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D520);
  }
  return result;
}

unint64_t sub_10001FCC0()
{
  unint64_t result;

  result = qword_10005D528[0];
  if (!qword_10005D528[0])
  {
    result = swift_getWitnessTable(&unk_1000454D8, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, qword_10005D528);
  }
  return result;
}

uint64_t sub_10001FD04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001FF40();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001FD70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001FF40();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001FDDC()
{
  unint64_t result;

  result = qword_10005D540;
  if (!qword_10005D540)
  {
    result = swift_getWitnessTable(&unk_10004545C, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D540);
  }
  return result;
}

unint64_t sub_10001FE24()
{
  unint64_t result;

  result = qword_10005D548;
  if (!qword_10005D548)
  {
    result = swift_getWitnessTable(&unk_100045620, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D548);
  }
  return result;
}

unint64_t sub_10001FE6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D550;
  if (!qword_10005D550)
  {
    v1 = sub_1000060C8(qword_10005D558);
    sub_10001FE24();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D550);
  }
  return result;
}

uint64_t sub_10001FED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001FB80();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10001FF40()
{
  unint64_t result;

  result = qword_10005D570;
  if (!qword_10005D570)
  {
    result = swift_getWitnessTable(&unk_100045304, &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D570);
  }
  return result;
}

uint64_t sub_10001FF84()
{
  uint64_t v0;

  v0 = qword_10005D4B8;
  swift_bridgeObjectRetain(off_10005D4C0);
  return v0;
}

unint64_t sub_10001FFBC()
{
  unint64_t result;

  result = qword_10005D578;
  if (!qword_10005D578)
  {
    result = swift_getWitnessTable(&unk_100045530, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D578);
  }
  return result;
}

unint64_t sub_100020004()
{
  unint64_t result;

  result = qword_10005D580;
  if (!qword_10005D580)
  {
    result = swift_getWitnessTable(&unk_100045568, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D580);
  }
  return result;
}

unint64_t sub_10002004C()
{
  unint64_t result;

  result = qword_10005D588;
  if (!qword_10005D588)
  {
    result = swift_getWitnessTable(&unk_100045598, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D588);
  }
  return result;
}

unint64_t sub_100020094()
{
  unint64_t result;

  result = qword_10005D590;
  if (!qword_10005D590)
  {
    result = swift_getWitnessTable(&unk_1000455D0, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D590);
  }
  return result;
}

unint64_t sub_1000200DC()
{
  unint64_t result;

  result = qword_10005D598;
  if (!qword_10005D598)
  {
    result = swift_getWitnessTable(&unk_1000455F8, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D598);
  }
  return result;
}

unint64_t sub_100020124()
{
  unint64_t result;

  result = qword_10005D5A0;
  if (!qword_10005D5A0)
  {
    result = swift_getWitnessTable(&unk_100045678, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D5A0);
  }
  return result;
}

uint64_t sub_100020168@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_1000069FC();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1000201A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C2C0, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E780, (uint64_t)sub_10001EDF8, a1);
}

uint64_t sub_1000201C8()
{
  return sub_1000061A8(&qword_10005D5A8, &qword_10005D5B0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_1000201F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001FCC0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100020230()
{
  unint64_t result;

  result = qword_10005D5B8;
  if (!qword_10005D5B8)
  {
    result = swift_getWitnessTable(&unk_1000456A8, &type metadata for SearchEngineSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D5B8);
  }
  return result;
}

uint64_t sub_100020274(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000069FC();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_1000202AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100020124();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery()
{
  return &type metadata for SearchEngineSuggestionsEntity.SearchEngineSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity()
{
  return &type metadata for SearchEngineSuggestionsEntity;
}

ValueMetadata *type metadata accessor for SearchEngineSuggestionsEntity.UpdateIntent_value()
{
  return &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value;
}

uint64_t sub_100020314()
{
  return sub_1000061A8(&qword_10005D5C0, &qword_10005D5C8, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100020340()
{
  return sub_1000061A8(&qword_10005D5D0, &qword_10005D5C8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10002036C()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005D5D8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000030, 0x800000010003FE00);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_10001FCC0();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000005ALL, 0x800000010003FE40);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_100020690(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000206A8, 0, 0);
}

uint64_t sub_1000206A8()
{
  uint64_t v0;
  char v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(_BYTE *)(v0 + 16);
  v2 = (void *)objc_opt_self(NSUserDefaults);
  v3 = objc_msgSend(v2, "safari_browserDefaults");
  v4 = SuppressSearchSuggestionsDefaultsKey;
  objc_msgSend(v3, "setBool:forKey:", (v1 & 1) == 0, SuppressSearchSuggestionsDefaultsKey);

  v5 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v6 = objc_msgSend(v2, "safari_notificationNameForUserDefaultsKey:", v4);
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", v6, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002079C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100020858, 0, 0);
}

uint64_t sub_100020858()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005D4D8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003FEA0);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D5F8, &qword_10005D600, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D5E8, 0, &unk_10005D5F0, 0, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_1000209A8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

unint64_t sub_1000209B8()
{
  unint64_t result;

  result = qword_10005D648;
  if (!qword_10005D648)
  {
    result = swift_getWitnessTable(&unk_100045810, &type metadata for SafariSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D648);
  }
  return result;
}

uint64_t sub_1000209FC()
{
  return sub_1000061A8(&qword_10005D650, &qword_10005D658, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100020A28()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E7D0);
  sub_10000AAD4(v16, (uint64_t)qword_10005E7D0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003F220);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Safari Suggestions", 18, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Safari Suggestions' toggle", 48, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_100020C74()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E7E8);
  sub_10000AAD4(v0, (uint64_t)qword_10005E7E8);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000019, 0x80000001000400F0);
}

uint64_t sub_100020CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E800);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E800);
  IntentDescription.init(stringLiteral:)(0xD000000000000039, 0x80000001000400B0);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100020D5C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100045D08);
  qword_10005E818 = result;
  return result;
}

uint64_t sub_100020D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D798);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005D7A0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100020E8C, 0, 0);
}

uint64_t sub_100020E8C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_1000218E8();
  *v1 = v0;
  v1[1] = sub_100020F0C;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10002129C, 0, &type metadata for SafariSuggestionsEntity, v2);
}

uint64_t sub_100020F0C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100020F60, 0, 0);
}

uint64_t sub_100020F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C2F8 != -1)
    swift_once(&qword_10005C2F8, sub_100020D5C);
  v2 = qword_10005E818;
  *(_QWORD *)(v0 + 168) = qword_10005E818;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005D778, &qword_10005D780, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10002105C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_10002105C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_1000210DC;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000210DC()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000209B8();
  v11 = sub_100021A4C();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10002129C, 0, v7, v6, &type metadata for SafariSuggestionsEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, &type metadata for SafariSuggestionsEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for SafariSuggestionsEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000212A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005D7A8);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C2F8 != -1)
    swift_once(&qword_10005C2F8, sub_100020D5C);
  v4 = qword_10005E818;
  swift_retain(qword_10005E818);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100021A4C();
  v7 = sub_1000061A8(&qword_10005D7B0, &qword_10005D7A8, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for SafariSuggestionsEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1000213A8()
{
  double result;

  if (qword_10005C2F8 != -1)
    swift_once(&qword_10005C2F8, sub_100020D5C);
  *(_QWORD *)&result = swift_retain(qword_10005E818).n128_u64[0];
  return result;
}

unint64_t sub_1000213EC()
{
  unint64_t result;

  result = qword_10005D660;
  if (!qword_10005D660)
  {
    result = swift_getWitnessTable(&unk_1000458A0, &type metadata for SafariSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D660);
  }
  return result;
}

unint64_t sub_100021434()
{
  unint64_t result;

  result = qword_10005D668;
  if (!qword_10005D668)
  {
    result = swift_getWitnessTable(&unk_1000458C8, &type metadata for SafariSuggestionsEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D668);
  }
  return result;
}

uint64_t sub_100021478(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100049338, 1) + 8);
}

uint64_t sub_10002149C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000209B8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_1000214DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C2E8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E7E8, (uint64_t)sub_100020C74, a1);
}

uint64_t sub_100021500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C2F0 != -1)
    swift_once(&qword_10005C2F0, sub_100020CD4);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E800);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_100021560(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D794);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100020D80(a1, v5, v4);
}

uint64_t sub_1000215C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100021F94();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000215E8()
{
  return 0xD000000000000028;
}

unint64_t sub_100021608()
{
  unint64_t result;

  result = qword_10005D678;
  if (!qword_10005D678)
  {
    result = swift_getWitnessTable(&unk_100045924, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D678);
  }
  return result;
}

uint64_t sub_100021650(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100021668, 0, 0);
}

uint64_t sub_100021668()
{
  uint64_t v0;
  unsigned __int8 *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
  v3 = objc_msgSend(v2, "BOOLForKey:", WBSUniversalSearchEnabledPreferenceKey);

  *v1 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000216E8(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005D78C);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 16) = v3;
  return swift_task_switch(sub_1000222D0, 0, 0);
}

uint64_t sub_100021748(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D760 + dword_10005D760);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D764);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_1000217A8()
{
  unint64_t result;

  result = qword_10005D688;
  if (!qword_10005D688)
  {
    result = swift_getWitnessTable(&unk_10004595C, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D688);
  }
  return result;
}

uint64_t sub_1000217EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100021B68();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100021858()
{
  unint64_t result;

  result = qword_10005D698;
  if (!qword_10005D698)
  {
    result = swift_getWitnessTable(&unk_1000459B4, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D698);
  }
  return result;
}

unint64_t sub_1000218A0()
{
  unint64_t result;

  result = qword_10005D6A0;
  if (!qword_10005D6A0)
  {
    result = swift_getWitnessTable(&unk_100045A14, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D6A0);
  }
  return result;
}

unint64_t sub_1000218E8()
{
  unint64_t result;

  result = qword_10005D6A8[0];
  if (!qword_10005D6A8[0])
  {
    result = swift_getWitnessTable(&unk_100045AB8, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, qword_10005D6A8);
  }
  return result;
}

uint64_t sub_10002192C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100021B68();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100021998(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100021B68();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100021A04()
{
  unint64_t result;

  result = qword_10005D6C0;
  if (!qword_10005D6C0)
  {
    result = swift_getWitnessTable(&unk_100045A3C, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D6C0);
  }
  return result;
}

unint64_t sub_100021A4C()
{
  unint64_t result;

  result = qword_10005D6C8;
  if (!qword_10005D6C8)
  {
    result = swift_getWitnessTable(&unk_100045C00, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D6C8);
  }
  return result;
}

unint64_t sub_100021A94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D6D0;
  if (!qword_10005D6D0)
  {
    v1 = sub_1000060C8(qword_10005D6D8);
    sub_100021A4C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D6D0);
  }
  return result;
}

uint64_t sub_100021AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000217A8();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_100021B68()
{
  unint64_t result;

  result = qword_10005D6F0;
  if (!qword_10005D6F0)
  {
    result = swift_getWitnessTable(&unk_1000458E4, &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D6F0);
  }
  return result;
}

uint64_t sub_100021BAC()
{
  uint64_t v0;

  v0 = qword_10005D638;
  swift_bridgeObjectRetain(off_10005D640);
  return v0;
}

unint64_t sub_100021BE4()
{
  unint64_t result;

  result = qword_10005D6F8;
  if (!qword_10005D6F8)
  {
    result = swift_getWitnessTable(&unk_100045B10, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D6F8);
  }
  return result;
}

unint64_t sub_100021C2C()
{
  unint64_t result;

  result = qword_10005D700;
  if (!qword_10005D700)
  {
    result = swift_getWitnessTable(&unk_100045B48, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D700);
  }
  return result;
}

unint64_t sub_100021C74()
{
  unint64_t result;

  result = qword_10005D708;
  if (!qword_10005D708)
  {
    result = swift_getWitnessTable(&unk_100045B78, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D708);
  }
  return result;
}

unint64_t sub_100021CBC()
{
  unint64_t result;

  result = qword_10005D710;
  if (!qword_10005D710)
  {
    result = swift_getWitnessTable(&unk_100045BB0, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D710);
  }
  return result;
}

unint64_t sub_100021D04()
{
  unint64_t result;

  result = qword_10005D718;
  if (!qword_10005D718)
  {
    result = swift_getWitnessTable(&unk_100045BD8, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D718);
  }
  return result;
}

unint64_t sub_100021D4C()
{
  unint64_t result;

  result = qword_10005D720;
  if (!qword_10005D720)
  {
    result = swift_getWitnessTable(&unk_100045C58, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D720);
  }
  return result;
}

uint64_t sub_100021D90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_1000071B0();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100021DCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C2E0, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E7D0, (uint64_t)sub_100020A28, a1);
}

uint64_t sub_100021DF0()
{
  return sub_1000061A8(&qword_10005D728, &qword_10005D730, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100021E1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000218E8();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100021E58()
{
  unint64_t result;

  result = qword_10005D738;
  if (!qword_10005D738)
  {
    result = swift_getWitnessTable(&unk_100045C88, &type metadata for SafariSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005D738);
  }
  return result;
}

uint64_t sub_100021E9C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000071B0();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100021ED4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100021D4C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity.SafariSuggestionsEntityQuery()
{
  return &type metadata for SafariSuggestionsEntity.SafariSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity()
{
  return &type metadata for SafariSuggestionsEntity;
}

ValueMetadata *type metadata accessor for SafariSuggestionsEntity.UpdateIntent_value()
{
  return &type metadata for SafariSuggestionsEntity.UpdateIntent_value;
}

uint64_t sub_100021F3C()
{
  return sub_1000061A8(&qword_10005D740, &qword_10005D748, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100021F68()
{
  return sub_1000061A8(&qword_10005D750, &qword_10005D748, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100021F94()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005D758);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003FFE0);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_1000218E8();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000032, 0x8000000100040000);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_1000222B8(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000222D0, 0, 0);
}

uint64_t sub_1000222D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)objc_opt_self(NSUserDefaults);
  v3 = objc_msgSend(v2, "safari_browserDefaults");
  v4 = WBSUniversalSearchEnabledPreferenceKey;
  objc_msgSend(v3, "setBool:forKey:", v1, WBSUniversalSearchEnabledPreferenceKey);

  v5 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v6 = objc_msgSend(v2, "safari_notificationNameForUserDefaultsKey:", v4);
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", v6, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000223C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002247C, 0, 0);
}

uint64_t sub_10002247C()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005D658);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003F220);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D778, &qword_10005D780, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D768, 0, &unk_10005D770, 0, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_1000225D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for AutoFillContactInfoControlToggle()
{
  return &type metadata for AutoFillContactInfoControlToggle;
}

uint64_t sub_1000225F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049398, 1);
}

uint64_t sub_100022600@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100045D98);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_1000095DC();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD000000000000040, 0x8000000100040110, KeyPath, sub_100022A08, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000020, 0x8000000100045D10);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000003BLL, 0x8000000100040160);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_100022A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000401A0);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

ValueMetadata *type metadata accessor for CloseTabsControlPicker()
{
  return &type metadata for CloseTabsControlPicker;
}

uint64_t sub_100022B04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000493DC, 1);
}

uint64_t sub_100022B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  Swift::String v28;
  Swift::String v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  ValueMetadata *v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  ValueMetadata *v49;
  uint64_t OpaqueTypeConformance2;
  char *v51;
  ValueMetadata *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  unint64_t v57;
  ValueMetadata *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  ValueMetadata *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  char v78[32];

  v62 = a1;
  v73 = a2;
  v2 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v2);
  v63 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_100006014(&qword_10005C490);
  v65 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v64 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_100006014(&qword_10005C488);
  v68 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v66 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100006014(&qword_10005C480);
  v70 = *(_QWORD *)(v72 - 8);
  __chkstk_darwin(v72);
  v67 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LocalizedStringResource(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v58 - v16;
  if (qword_10005C2B0 != -1)
    swift_once(&qword_10005C2B0, sub_10001C83C);
  v18 = sub_10000AAD4(v7, (uint64_t)static CapsuleLayoutStyle.typeDisplayRepresentation);
  swift_beginAccess(v18, v78, 0, 0);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  TypeDisplayRepresentation.name.getter(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v15, v17, v11);
  v60 = String.init(localized:)(v15);
  v22 = v21;
  v74 = &type metadata for TabBarLayoutControlPicker;
  v23 = sub_100006014(&qword_10005D820);
  v24 = String.init<A>(describing:)(&v74, v23);
  v26 = v25;
  sub_10001D73C();
  v74 = (ValueMetadata *)dispatch thunk of static PersistentlyIdentifiable.persistentIdentifier.getter();
  v75 = v27;
  v28._countAndFlagsBits = 46;
  v28._object = (void *)0xE100000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = v24;
  v29._object = v26;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v26);
  v30 = v75;
  v58 = v74;
  v61 = v11;
  v20(v15, v17, v11);
  v31 = *(unsigned __int8 *)(v12 + 80);
  v32 = (v31 + 16) & ~v31;
  v33 = swift_allocObject(&unk_1000579C8, v32 + v13, v31 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v33 + v32, v15, v11);
  swift_bridgeObjectRetain(v22);
  v34 = v62;
  v35 = swift_retain(v62);
  v36 = v63;
  static ControlSize._1x1.getter(v35);
  v37 = sub_100006014(&qword_10005D7C8);
  v38 = sub_10001DCF4();
  v39 = sub_100024258();
  v59 = v12;
  v40 = v34;
  v41 = v39;
  v42 = sub_10001D3BC();
  v43 = sub_100023FF8();
  v57 = v41;
  v56 = v37;
  v44 = v64;
  v45 = (ValueMetadata *)v60;
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(v58, v30, v60, v22, v36, v40, sub_100023A30, v33, sub_100023E8C, 0, 0, 0, &type metadata for Text, v56, v38, v57, v42, &protocol witness table for Text, v43);
  v74 = v45;
  v75 = v22;
  v46 = sub_100006C54();
  v47 = sub_1000062D0();
  v48 = v66;
  v49 = (ValueMetadata *)v69;
  WidgetConfiguration.configurationDisplayName<A>(_:)(&v74, v69, &type metadata for String, v46, v47);
  (*(void (**)(char *, ValueMetadata *))(v65 + 8))(v44, v49);
  swift_bridgeObjectRelease(v22);
  v74 = v49;
  v75 = &type metadata for String;
  v76 = v46;
  v77 = v47;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v74, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, 1);
  v51 = v67;
  v52 = (ValueMetadata *)v71;
  WidgetConfiguration.disablesControlStateCaching()(v71, OpaqueTypeConformance2);
  (*(void (**)(char *, ValueMetadata *))(v68 + 8))(v48, v52);
  v74 = v52;
  v75 = (void *)OpaqueTypeConformance2;
  v53 = swift_getOpaqueTypeConformance2(&v74, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v54 = v72;
  WidgetConfiguration.hiddenControl()(v72, v53);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v51, v54);
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v17, v61);
}

uint64_t sub_10002301C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  ValueMetadata *v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  ValueMetadata *v43;
  uint64_t OpaqueTypeConformance2;
  char *v45;
  ValueMetadata *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  ValueMetadata *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  ValueMetadata *v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;

  v57 = a1;
  v68 = a2;
  v2 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v2);
  v58 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_100006014(&qword_10005C490);
  v60 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v59 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_100006014(&qword_10005C488);
  v63 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v61 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_100006014(&qword_10005C480);
  v65 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v62 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v52 - v12;
  if (qword_10005C3B0 != -1)
    swift_once(&qword_10005C3B0, sub_10003A2A8);
  v14 = type metadata accessor for TypeDisplayRepresentation(0);
  v15 = sub_10000AAD4(v14, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  TypeDisplayRepresentation.name.getter(v15);
  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v16(v11, v13, v7);
  v54 = String.init(localized:)(v11);
  v18 = v17;
  v69 = &type metadata for TabLayoutControlPicker;
  v19 = sub_100006014(&qword_10005D7F8);
  v20 = String.init<A>(describing:)(&v69, v19);
  v56 = v8;
  v21 = v20;
  v23 = v22;
  sub_100024094();
  v69 = (ValueMetadata *)dispatch thunk of static PersistentlyIdentifiable.persistentIdentifier.getter();
  v70 = v24;
  v25._countAndFlagsBits = 46;
  v25._object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  v26._countAndFlagsBits = v21;
  v26._object = v23;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(v23);
  v52 = v70;
  v53 = v69;
  v55 = v7;
  v16(v11, v13, v7);
  v27 = *(unsigned __int8 *)(v8 + 80);
  v28 = (v27 + 16) & ~v27;
  v29 = swift_allocObject(&unk_1000579A0, v28 + v9, v27 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v29 + v28, v11, v7);
  swift_bridgeObjectRetain(v18);
  v30 = v57;
  swift_retain(v57);
  v31 = v58;
  static ControlSize._1x1.getter(v32);
  v33 = sub_100006014(&qword_10005D7C8);
  v34 = sub_1000240DC();
  v35 = sub_100024120();
  v36 = sub_100024164();
  v37 = sub_100023FF8();
  v51 = v35;
  v50 = v33;
  v38 = v59;
  v39 = (ValueMetadata *)v54;
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(v53, v52, v54, v18, v31, v30, sub_100023A30, v29, sub_100023EB0, 0, 0, 0, &type metadata for Text, v50, v34, v51, v36, &protocol witness table for Text, v37);
  v69 = v39;
  v70 = v18;
  v40 = sub_100006C54();
  v41 = sub_1000062D0();
  v42 = v61;
  v43 = (ValueMetadata *)v64;
  WidgetConfiguration.configurationDisplayName<A>(_:)(&v69, v64, &type metadata for String, v40, v41);
  (*(void (**)(char *, ValueMetadata *))(v60 + 8))(v38, v43);
  swift_bridgeObjectRelease(v18);
  v69 = v43;
  v70 = &type metadata for String;
  v71 = v40;
  v72 = v41;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v69, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, 1);
  v45 = v62;
  v46 = (ValueMetadata *)v66;
  WidgetConfiguration.disablesControlStateCaching()(v66, OpaqueTypeConformance2);
  (*(void (**)(char *, ValueMetadata *))(v63 + 8))(v42, v46);
  v69 = v46;
  v70 = (void *)OpaqueTypeConformance2;
  v47 = swift_getOpaqueTypeConformance2(&v69, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v48 = v67;
  WidgetConfiguration.hiddenControl()(v67, v47);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v45, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v13, v55);
}

uint64_t sub_1000234A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  Swift::String v28;
  Swift::String v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  ValueMetadata *v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  ValueMetadata *v49;
  uint64_t OpaqueTypeConformance2;
  char *v51;
  ValueMetadata *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  unint64_t v57;
  ValueMetadata *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  ValueMetadata *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  char v78[32];

  v62 = a1;
  v73 = a2;
  v2 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v2);
  v63 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_100006014(&qword_10005C490);
  v65 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v64 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_100006014(&qword_10005C488);
  v68 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v66 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_100006014(&qword_10005C480);
  v70 = *(_QWORD *)(v72 - 8);
  __chkstk_darwin(v72);
  v67 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LocalizedStringResource(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v58 - v16;
  if (qword_10005C320 != -1)
    swift_once(&qword_10005C320, sub_100025370);
  v18 = sub_10000AAD4(v7, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess(v18, v78, 0, 0);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  TypeDisplayRepresentation.name.getter(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v15, v17, v11);
  v60 = String.init(localized:)(v15);
  v22 = v21;
  v74 = &type metadata for CloseTabsControlPicker;
  v23 = sub_100006014(&qword_10005D7B8);
  v24 = String.init<A>(describing:)(&v74, v23);
  v26 = v25;
  sub_1000239E8();
  v74 = (ValueMetadata *)dispatch thunk of static PersistentlyIdentifiable.persistentIdentifier.getter();
  v75 = v27;
  v28._countAndFlagsBits = 46;
  v28._object = (void *)0xE100000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = v24;
  v29._object = v26;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v26);
  v30 = v75;
  v58 = v74;
  v61 = v11;
  v20(v15, v17, v11);
  v31 = *(unsigned __int8 *)(v12 + 80);
  v32 = (v31 + 16) & ~v31;
  v33 = swift_allocObject(&unk_100057978, v32 + v13, v31 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v33 + v32, v15, v11);
  swift_bridgeObjectRetain(v22);
  v34 = v62;
  swift_retain(v62);
  v35 = v63;
  static ControlSize._1x1.getter(v36);
  v37 = sub_100006014(&qword_10005D7C8);
  v38 = sub_100023F2C();
  v39 = sub_100023F70();
  v59 = v12;
  v40 = v34;
  v41 = v39;
  v42 = sub_100023FB4();
  v43 = sub_100023FF8();
  v57 = v41;
  v56 = v37;
  v44 = v64;
  v45 = (ValueMetadata *)v60;
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(v58, v30, v60, v22, v35, v40, sub_100023A30, v33, sub_100023F00, 0, 0, 0, &type metadata for Text, v56, v38, v57, v42, &protocol witness table for Text, v43);
  v74 = v45;
  v75 = v22;
  v46 = sub_100006C54();
  v47 = sub_1000062D0();
  v48 = v66;
  v49 = (ValueMetadata *)v69;
  WidgetConfiguration.configurationDisplayName<A>(_:)(&v74, v69, &type metadata for String, v46, v47);
  (*(void (**)(char *, ValueMetadata *))(v65 + 8))(v44, v49);
  swift_bridgeObjectRelease(v22);
  v74 = v49;
  v75 = &type metadata for String;
  v76 = v46;
  v77 = v47;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v74, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, 1);
  v51 = v67;
  v52 = (ValueMetadata *)v71;
  WidgetConfiguration.disablesControlStateCaching()(v71, OpaqueTypeConformance2);
  (*(void (**)(char *, ValueMetadata *))(v68 + 8))(v48, v52);
  v74 = v52;
  v75 = (void *)OpaqueTypeConformance2;
  v53 = swift_getOpaqueTypeConformance2(&v74, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v54 = v72;
  WidgetConfiguration.hiddenControl()(v72, v53);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v51, v54);
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v17, v61);
}

uint64_t sub_1000239AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;

  KeyPath = swift_getKeyPath(&unk_100045E18);
  sub_1000234A4(KeyPath, a1);
  return swift_release(KeyPath);
}

unint64_t sub_1000239E8()
{
  unint64_t result;

  result = qword_10005D7C0;
  if (!qword_10005D7C0)
  {
    result = swift_getWitnessTable(&unk_1000462B8, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D7C0);
  }
  return result;
}

uint64_t sub_100023A34(char a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t (*a5)(_QWORD), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v29[24];

  v11 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v11);
  v13 = &v29[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v14 = sub_100006014(&qword_10005D7F0);
  __chkstk_darwin(v14);
  v16 = &v29[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (*a3 != -1)
    swift_once(a3, a6);
  swift_beginAccess(a4, v29, 0, 0);
  v17 = *a4;
  if (*(_QWORD *)(v17 + 16))
  {
    swift_bridgeObjectRetain(v17);
    v18 = a5(a1 & 1);
    if ((v19 & 1) != 0)
    {
      v20 = v18;
      v21 = *(_QWORD *)(v17 + 56);
      v22 = type metadata accessor for DisplayRepresentation(0);
      v23 = *(_QWORD *)(v22 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v16, v21 + *(_QWORD *)(v23 + 72) * v20, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v16, 0, 1, v22);
    }
    else
    {
      v22 = type metadata accessor for DisplayRepresentation(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v16, 1, 1, v22);
    }
    swift_bridgeObjectRelease(v17);
    type metadata accessor for DisplayRepresentation(0);
    v25 = *(_QWORD *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v16, 1, v22) != 1)
    {
      DisplayRepresentation.title.getter();
      v26 = Text.init(_:)(v13);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v22);
      return v26;
    }
  }
  else
  {
    v24 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v16, 1, 1, v24);
  }
  sub_100024054((uint64_t)v16);
  return 0;
}

uint64_t sub_100023C60(char a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = sub_100006014(&qword_10005D7F0);
  __chkstk_darwin(v5);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C328 != -1)
    swift_once(&qword_10005C328, sub_1000257A4);
  swift_beginAccess(&static CloseTabsIntervalType.caseDisplayRepresentations, v20, 0, 0);
  v8 = static CloseTabsIntervalType.caseDisplayRepresentations;
  if (*(_QWORD *)(static CloseTabsIntervalType.caseDisplayRepresentations + 16))
  {
    swift_bridgeObjectRetain(static CloseTabsIntervalType.caseDisplayRepresentations);
    sub_100019DD8(a1);
    if ((v10 & 1) != 0)
    {
      v11 = v9;
      v12 = *(_QWORD *)(v8 + 56);
      v13 = type metadata accessor for DisplayRepresentation(0);
      v14 = *(_QWORD *)(v13 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v7, v12 + *(_QWORD *)(v14 + 72) * v11, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v7, 0, 1, v13);
    }
    else
    {
      v13 = type metadata accessor for DisplayRepresentation(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
    }
    swift_bridgeObjectRelease(v8);
    type metadata accessor for DisplayRepresentation(0);
    v16 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v13) != 1)
    {
      DisplayRepresentation.title.getter();
      v17 = Text.init(_:)(v4);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v13);
      return v17;
    }
  }
  else
  {
    v15 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
  }
  sub_100024054((uint64_t)v7);
  return 0;
}

uint64_t sub_100023E8C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100023ED4(a1, a2, &qword_10005C2B8, &static CapsuleLayoutStyle.caseDisplayRepresentations, (uint64_t (*)(_QWORD))sub_100019C74, (uint64_t)sub_10001CC78, a3);
}

uint64_t sub_100023EB0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_100023ED4(a1, a2, &qword_10005C3B8, &static TabLayoutConfigurationType.caseDisplayRepresentations, (uint64_t (*)(_QWORD))sub_100019CFC, (uint64_t)sub_10003A5C4, a3);
}

uint64_t sub_100023ED4@<X0>(char *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(_QWORD)@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_100023A34(*a1, a2, a3, a4, a5, a6);
  *a7 = result;
  a7[1] = v9;
  a7[2] = v10;
  a7[3] = v11;
  return result;
}

uint64_t sub_100023F00@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_100023C60(*a1);
  *a2 = result;
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  return result;
}

unint64_t sub_100023F2C()
{
  unint64_t result;

  result = qword_10005D7D0;
  if (!qword_10005D7D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D7D0);
  }
  return result;
}

unint64_t sub_100023F70()
{
  unint64_t result;

  result = qword_10005D7D8;
  if (!qword_10005D7D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D7D8);
  }
  return result;
}

unint64_t sub_100023FB4()
{
  unint64_t result;

  result = qword_10005D7E0;
  if (!qword_10005D7E0)
  {
    result = swift_getWitnessTable(&unk_100046160, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D7E0);
  }
  return result;
}

unint64_t sub_100023FF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D7E8;
  if (!qword_10005D7E8)
  {
    v1 = sub_1000060C8(&qword_10005D7C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10005D7E8);
  }
  return result;
}

uint64_t sub_100024054(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006014(&qword_10005D7F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100024094()
{
  unint64_t result;

  result = qword_10005D800;
  if (!qword_10005D800)
  {
    result = swift_getWitnessTable(&unk_100048544, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D800);
  }
  return result;
}

unint64_t sub_1000240DC()
{
  unint64_t result;

  result = qword_10005D808;
  if (!qword_10005D808)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005D808);
  }
  return result;
}

unint64_t sub_100024120()
{
  unint64_t result;

  result = qword_10005D810;
  if (!qword_10005D810)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005D810);
  }
  return result;
}

unint64_t sub_100024164()
{
  unint64_t result;

  result = qword_10005D818;
  if (!qword_10005D818)
  {
    result = swift_getWitnessTable(&unk_1000483EC, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005D818);
  }
  return result;
}

uint64_t sub_1000241AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for LocalizedStringResource(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002420C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for LocalizedStringResource(0) - 8) + 80);
  return sub_100033418(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t sub_100024258()
{
  unint64_t result;

  result = qword_10005D828;
  if (!qword_10005D828)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CapsuleLayoutStyle, &type metadata for CapsuleLayoutStyle);
    atomic_store(result, (unint64_t *)&qword_10005D828);
  }
  return result;
}

uint64_t sub_10002429C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  v0 = sub_1000060C8(&qword_10005C480);
  v1 = sub_1000060C8(&qword_10005C488);
  v5 = sub_1000060C8(&qword_10005C490);
  v6 = &type metadata for String;
  v7 = sub_100006C54();
  v8 = sub_1000062D0();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName<A>(_:)>>, 1);
  v5 = v1;
  v6 = (void *)OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = (void *)v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

uint64_t sub_100024354()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int16 v21;
  _QWORD v22[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v22[0] = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E820);
  sub_10000AAD4(v16, (uint64_t)qword_10005E820);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x61542065736F6C43, 0xEA00000000007362);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v21 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Close Tabs", 10, 2, v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Close Tabs' setting", 41, v21);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v22[0];
  v18(v22[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_1000245A0()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E838);
  sub_10000AAD4(v0, (uint64_t)qword_10005E838);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x80000001000402A0);
}

uint64_t sub_100024600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E850);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E850);
  IntentDescription.init(stringLiteral:)(0xD000000000000029, 0x8000000100040270);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100024688()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100046708);
  qword_10005E868 = result;
  return result;
}

uint64_t sub_1000246AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005D9F8);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005DA00);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_1000247B8, 0, 0);
}

uint64_t sub_1000247B8()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_100026B2C();
  *v1 = v0;
  v1[1] = sub_100024838;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_100024BC0, 0, &type metadata for CloseTabsModeEntity, v2);
}

uint64_t sub_100024838()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_10002488C, 0, 0);
}

uint64_t sub_10002488C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 3);
  v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  IntentParameter.wrappedValue.getter(v0 + 24);
  if (qword_10005C318 != -1)
    swift_once(&qword_10005C318, sub_100024688);
  v2 = qword_10005E868;
  v0[21] = qword_10005E868;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[22] = v4;
  v5 = sub_1000061A8(&qword_10005D9D8, &qword_10005D9E0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100024980;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for CloseTabsIntervalType, v5);
}

uint64_t sub_100024980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_100024A00;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100024A00()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000268CC();
  v11 = sub_100026BBC();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100024BC0, 0, v7, v6, &type metadata for CloseTabsModeEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for CloseTabsModeEntity.UpdateIntent_value, &type metadata for CloseTabsModeEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for CloseTabsModeEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100024BC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005DA08);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C318 != -1)
    swift_once(&qword_10005C318, sub_100024688);
  v4 = qword_10005E868;
  swift_retain(qword_10005E868);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100026BBC();
  v7 = sub_1000061A8(&qword_10005DA10, &qword_10005DA08, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for CloseTabsModeEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_100024CCC()
{
  double result;

  if (qword_10005C318 != -1)
    swift_once(&qword_10005C318, sub_100024688);
  *(_QWORD *)&result = swift_retain(qword_10005E868).n128_u64[0];
  return result;
}

uint64_t sub_100024D0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C308, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E838, (uint64_t)sub_1000245A0, a1);
}

uint64_t sub_100024D30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C310 != -1)
    swift_once(&qword_10005C310, sub_100024600);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E850);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_100024D90(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D9F4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_1000246AC(a1, v5, v4);
}

uint64_t sub_100024DF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10002629C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100024E18()
{
  return 0xD000000000000024;
}

uint64_t sub_100024E34(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100024E4C, 0, 0);
}

uint64_t sub_100024E4C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend((id)objc_opt_self(WBSAutomaticTabClosingUtilities), "automaticTabClosingInterval");
  if ((unint64_t)v1 >= 4)
  {
    v2 = type metadata accessor for _PrebuiltAppIntentError(0);
    v3 = sub_10001B360();
    swift_allocError(v2, v3, 0, 0);
    v4 = static _UnrecoverableError.entityNotFound.getter();
    swift_willThrow(v4);
  }
  else
  {
    **(_BYTE **)(v0 + 16) = (_BYTE)v1;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100024EE8(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005D9EC);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 16) = v3;
  return swift_task_switch(sub_1000265A4, 0, 0);
}

uint64_t sub_100024F48(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D9C0 + dword_10005D9C0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D9C4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

uint64_t sub_100024FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100026C6C();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10002500C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100026C6C();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100025078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100026C6C();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_1000250E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100026A54();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10002514C()
{
  uint64_t v0;

  v0 = qword_10005D830;
  swift_bridgeObjectRetain(off_10005D838);
  return v0;
}

uint64_t sub_100025180@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100023FB4();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1000251BC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C300, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E820, (uint64_t)sub_100024354, a1);
}

uint64_t sub_1000251E0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100026B2C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100025218(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100023FB4();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100025250(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100026DDC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t CloseTabsIntervalType.id.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000252BC + 4 * byte_100045E40[a1]))(0x796C6C61756E616DLL, 0xE800000000000000);
}

uint64_t sub_1000252BC()
{
  return 0x796144656E6FLL;
}

uint64_t sub_1000252D0()
{
  return 0x6B656557656E6FLL;
}

uint64_t sub_1000252E8()
{
  return 0x68746E6F4D656E6FLL;
}

uint64_t CloseTabsIntervalType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100025330 + 4 * byte_100045E44[a1]))(0x796C6C61756E616DLL, 0xE800000000000000);
}

uint64_t sub_100025330()
{
  return 0x796144656E6FLL;
}

uint64_t sub_100025344()
{
  return 0x6B656557656E6FLL;
}

uint64_t sub_10002535C()
{
  return 0x68746E6F4D656E6FLL;
}

uint64_t sub_100025370()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, static CloseTabsIntervalType.typeDisplayRepresentation);
  sub_10000AAD4(v16, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000018, 0x8000000100040370);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "Label for the type of focus filter, Profile or Tab Group", 56, 2);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t CloseTabsIntervalType.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10005C320 != -1)
    swift_once(&qword_10005C320, sub_100025370);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000AAD4(v0, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
}

uint64_t static CloseTabsIntervalType.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10005C320 != -1)
    swift_once(&qword_10005C320, sub_100025370);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static CloseTabsIntervalType.typeDisplayRepresentation.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10005C320 != -1)
    swift_once(&qword_10005C320, sub_100025370);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static CloseTabsIntervalType.typeDisplayRepresentation.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C320 != -1)
    swift_once(&qword_10005C320, sub_100025370);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static CloseTabsIntervalType.typeDisplayRepresentation);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

void sub_1000257A4()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  unint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  _BYTE *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  void (*v60)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE *v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unsigned int v65;
  void (*v66)(char *);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;

  v0 = sub_100006014(&qword_10005D1A8);
  __chkstk_darwin(v0);
  v74 = (char *)&v56 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v2);
  v73 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v75 - 8);
  __chkstk_darwin(v75);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100006014(&qword_10005DA18);
  v18 = sub_100006014(&qword_10005D290);
  v19 = *(_QWORD *)(v18 - 8);
  v72 = v18;
  v69 = *(_QWORD *)(v19 + 72);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v20 + 32) & ~v20;
  v22 = swift_allocObject(v17, v21 + 4 * v69, v20 | 7);
  v63 = v22;
  *(_OWORD *)(v22 + 16) = xmmword_100046730;
  v68 = v22 + v21;
  v61 = (_BYTE *)(v22 + v21 + *(int *)(v18 + 48));
  *(_BYTE *)(v22 + v21) = 0;
  v62 = 0xD000000000000015;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x80000001000402C0);
  static Locale.current.getter(v23);
  v65 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v66 = *(void (**)(char *))(v5 + 104);
  v67 = v4;
  v66(v7);
  v64 = 0x800000010003F360;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000018, 0x800000010003F360, v10, v7, "Close Tabs Interval Type App Entity name", 40, 2);
  v60 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v24 = v73;
  v25 = v75;
  v60(v73, 1, 1, v75);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v71 = v26;
  v27 = v74;
  v70(v74, 1, 1, v26);
  v28 = v16;
  DisplayRepresentation.init(title:subtitle:image:)(v16, v24, v27);
  v30 = v68;
  v29 = v69;
  v61 = (_BYTE *)(v68 + v69 + *(int *)(v72 + 48));
  *(_BYTE *)(v68 + v69) = 1;
  v31 = v13;
  v57 = v13;
  v32 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x8000000100040310);
  v58 = v10;
  static Locale.current.getter(v32);
  v33 = v7;
  v59 = v7;
  v34 = v7;
  v35 = v65;
  v36 = (void (*)(char *, uint64_t, uint64_t))v66;
  v37 = v67;
  ((void (*)(char *, _QWORD, uint64_t))v66)(v34, v65, v67);
  v56 = v28;
  v38 = v31;
  v39 = v64;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v38, 0xD000000000000018, v64, v10, v33, "Close Tabs Interval Type App Entity name", 40, 2);
  v40 = v73;
  v41 = v60;
  v60(v73, 1, 1, v25);
  v42 = v74;
  v70(v74, 1, 1, v71);
  DisplayRepresentation.init(title:subtitle:image:)(v28, v40, v42);
  v43 = 2 * v29;
  v44 = (_BYTE *)(v30 + 2 * v29);
  v61 = &v44[*(int *)(v72 + 48)];
  *v44 = 2;
  v45 = v57;
  v46 = String.LocalizationValue.init(stringLiteral:)(v62, 0x8000000100040330);
  v47 = v58;
  static Locale.current.getter(v46);
  v48 = v59;
  v36(v59, v35, v37);
  v49 = v56;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v45, 0xD000000000000018, v39, v47, v48, "Close Tabs Interval Type App Entity name", 40, 2);
  v50 = v73;
  v41(v73, 1, 1, v75);
  v51 = v74;
  v53 = v70;
  v52 = v71;
  v70(v74, 1, 1, v71);
  DisplayRepresentation.init(title:subtitle:image:)(v49, v50, v51);
  *(_BYTE *)(v68 + v43 + v69) = 3;
  v54 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x8000000100040350);
  static Locale.current.getter(v54);
  ((void (*)(char *, _QWORD, uint64_t))v66)(v48, v65, v67);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v45, 0xD000000000000018, v64, v47, v48, "Close Tabs Interval Type App Entity name", 40, 2);
  v41(v50, 1, 1, v75);
  v53(v51, 1, 1, v52);
  DisplayRepresentation.init(title:subtitle:image:)(v49, v50, v51);
  sub_1000186A0(v63);
  static CloseTabsIntervalType.caseDisplayRepresentations = v55;
}

uint64_t *CloseTabsIntervalType.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10005C328 != -1)
    swift_once(&qword_10005C328, sub_1000257A4);
  return &static CloseTabsIntervalType.caseDisplayRepresentations;
}

uint64_t static CloseTabsIntervalType.caseDisplayRepresentations.getter()
{
  _BYTE v1[24];

  if (qword_10005C328 != -1)
    swift_once(&qword_10005C328, sub_1000257A4);
  swift_beginAccess(&static CloseTabsIntervalType.caseDisplayRepresentations, v1, 0, 0);
  return swift_bridgeObjectRetain(static CloseTabsIntervalType.caseDisplayRepresentations);
}

uint64_t static CloseTabsIntervalType.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10005C328 != -1)
    swift_once(&qword_10005C328, sub_1000257A4);
  swift_beginAccess(&static CloseTabsIntervalType.caseDisplayRepresentations, v4, 1, 0);
  v2 = static CloseTabsIntervalType.caseDisplayRepresentations;
  static CloseTabsIntervalType.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*static CloseTabsIntervalType.caseDisplayRepresentations.modify(uint64_t a1))(_QWORD)
{
  if (qword_10005C328 != -1)
    swift_once(&qword_10005C328, sub_1000257A4);
  swift_beginAccess(&static CloseTabsIntervalType.caseDisplayRepresentations, a1, 33, 0);
  return j_j__swift_endAccess;
}

_UNKNOWN **static CloseTabsIntervalType.allCases.getter()
{
  return &off_100055500;
}

void sub_100025EF8(char *a1)
{
  sub_100038D48(*a1);
}

void sub_100025F04()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v2[9];

  v1 = *v0;
  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X9 }
}

Swift::Int sub_100025F50()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x796144656E6FLL, 0xE600000000000000);
  swift_bridgeObjectRelease(0xE600000000000000);
  return Hasher._finalize()();
}

void sub_100025FB8()
{
  __asm { BR              X10 }
}

uint64_t sub_100025FF4(uint64_t a1)
{
  String.hash(into:)(a1, 0x796144656E6FLL, 0xE600000000000000);
  return swift_bridgeObjectRelease(0xE600000000000000);
}

void sub_100026048(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X9 }
}

Swift::Int sub_100026090()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x796144656E6FLL, 0xE600000000000000);
  swift_bridgeObjectRelease(0xE600000000000000);
  return Hasher._finalize()();
}

unint64_t sub_1000260F8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s21SafariWidgetExtension21CloseTabsIntervalTypeO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100026124()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_100026154 + 4 * byte_100045E54[*v0]))();
}

void sub_100026154(_QWORD *a1@<X8>)
{
  *a1 = 0x796144656E6FLL;
  a1[1] = 0xE600000000000000;
}

void sub_10002616C(_QWORD *a1@<X8>)
{
  *a1 = 0x6B656557656E6FLL;
  a1[1] = 0xE700000000000000;
}

void sub_100026188(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x68746E6F4D656E6FLL;
  a1[1] = v1;
}

uint64_t sub_1000261A0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1000261D0 + 4 * byte_100045E58[*v0]))();
}

void sub_1000261D0(_QWORD *a1@<X8>)
{
  *a1 = 0x796144656E6FLL;
  a1[1] = 0xE600000000000000;
}

void sub_1000261E8(_QWORD *a1@<X8>)
{
  *a1 = 0x6B656557656E6FLL;
  a1[1] = 0xE700000000000000;
}

void sub_100026204(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x68746E6F4D656E6FLL;
  a1[1] = v1;
}

uint64_t sub_10002621C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100023F2C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100026254(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100027090();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_10002628C(_QWORD *a1@<X8>)
{
  *a1 = &off_100055528;
}

uint64_t sub_10002629C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C700);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100006014(&qword_10005D9B0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x80000001000401C0);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v31 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v29;
  v25[0] = *(_QWORD *)(v28 + 104);
  ((void (*)(char *, _QWORD, uint64_t))v25[0])(v2, enum case for InputConnectionBehavior.default(_:), v29);
  v22 = sub_100026B2C();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100006014(&qword_10005D9B8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000022, 0x80000001000401E0);
  v26(v11, 1, 1, v27);
  v30 = 4;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_100023F2C();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_100055458, v23);
  return v28;
}

uint64_t sub_10002658C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000265A4, 0, 0);
}

uint64_t sub_1000265A4()
{
  uint64_t v0;
  id v1;
  id v2;

  objc_msgSend((id)objc_opt_self(WBSAutomaticTabClosingUtilities), "setAutomaticTabClosingInterval:", *(unsigned __int8 *)(v0 + 16));
  v1 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_notificationNameForUserDefaultsKey:", WBSCloseTabsAutomaticallyDefaultsKey);
  objc_msgSend(v1, "postNotificationName:object:userInfo:deliverImmediately:", v2, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002666C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100026728, 0, 0);
}

uint64_t sub_100026728()
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
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005D850);
  v7 = String.LocalizationValue.init(stringLiteral:)(0x61542065736F6C43, 0xEA00000000007362);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005D9D8, &qword_10005D9E0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_100023F2C();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D9C8, 0, &unk_10005D9D0, 0, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

unint64_t _s21SafariWidgetExtension21CloseTabsIntervalTypeO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100055480, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t sub_1000268CC()
{
  unint64_t result;

  result = qword_10005D840;
  if (!qword_10005D840)
  {
    result = swift_getWitnessTable(&unk_100045F18, &type metadata for CloseTabsModeEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D840);
  }
  return result;
}

uint64_t sub_100026910()
{
  return sub_1000061A8(&qword_10005D848, &qword_10005D850, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

unint64_t sub_100026940()
{
  unint64_t result;

  result = qword_10005D858;
  if (!qword_10005D858)
  {
    result = swift_getWitnessTable(&unk_100045FA8, &type metadata for CloseTabsModeEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D858);
  }
  return result;
}

unint64_t sub_100026988()
{
  unint64_t result;

  result = qword_10005D860;
  if (!qword_10005D860)
  {
    result = swift_getWitnessTable(&unk_100045FD0, &type metadata for CloseTabsModeEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005D860);
  }
  return result;
}

uint64_t sub_1000269CC(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100049474, 1) + 8);
}

uint64_t sub_1000269F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_1000268CC, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_100026A08()
{
  unint64_t result;

  result = qword_10005D870;
  if (!qword_10005D870)
  {
    result = swift_getWitnessTable(&unk_10004602C, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D870);
  }
  return result;
}

unint64_t sub_100026A54()
{
  unint64_t result;

  result = qword_10005D880;
  if (!qword_10005D880)
  {
    result = swift_getWitnessTable(&unk_100046064, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D880);
  }
  return result;
}

unint64_t sub_100026A9C()
{
  unint64_t result;

  result = qword_10005D890;
  if (!qword_10005D890)
  {
    result = swift_getWitnessTable(&unk_1000460BC, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D890);
  }
  return result;
}

unint64_t sub_100026AE4()
{
  unint64_t result;

  result = qword_10005D898;
  if (!qword_10005D898)
  {
    result = swift_getWitnessTable(&unk_10004611C, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D898);
  }
  return result;
}

unint64_t sub_100026B2C()
{
  unint64_t result;

  result = qword_10005D8A0[0];
  if (!qword_10005D8A0[0])
  {
    result = swift_getWitnessTable(&unk_1000461C0, &type metadata for CloseTabsModeEntity);
    atomic_store(result, qword_10005D8A0);
  }
  return result;
}

unint64_t sub_100026B74()
{
  unint64_t result;

  result = qword_10005D8B8;
  if (!qword_10005D8B8)
  {
    result = swift_getWitnessTable(&unk_100046144, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D8B8);
  }
  return result;
}

unint64_t sub_100026BBC()
{
  unint64_t result;

  result = qword_10005D8C0;
  if (!qword_10005D8C0)
  {
    result = swift_getWitnessTable(&unk_100046308, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D8C0);
  }
  return result;
}

unint64_t sub_100026C04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D8C8;
  if (!qword_10005D8C8)
  {
    v1 = sub_1000060C8(qword_10005D8D0);
    sub_100026BBC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D8C8);
  }
  return result;
}

unint64_t sub_100026C6C()
{
  unint64_t result;

  result = qword_10005D8E8;
  if (!qword_10005D8E8)
  {
    result = swift_getWitnessTable(&unk_100045FEC, &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D8E8);
  }
  return result;
}

unint64_t sub_100026CB4()
{
  unint64_t result;

  result = qword_10005D8F0;
  if (!qword_10005D8F0)
  {
    result = swift_getWitnessTable(&unk_100046218, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D8F0);
  }
  return result;
}

unint64_t sub_100026CFC()
{
  unint64_t result;

  result = qword_10005D8F8;
  if (!qword_10005D8F8)
  {
    result = swift_getWitnessTable(&unk_100046250, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D8F8);
  }
  return result;
}

unint64_t sub_100026D44()
{
  unint64_t result;

  result = qword_10005D900;
  if (!qword_10005D900)
  {
    result = swift_getWitnessTable(&unk_100046280, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D900);
  }
  return result;
}

unint64_t sub_100026D94()
{
  unint64_t result;

  result = qword_10005D908;
  if (!qword_10005D908)
  {
    result = swift_getWitnessTable(&unk_1000462E0, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D908);
  }
  return result;
}

unint64_t sub_100026DDC()
{
  unint64_t result;

  result = qword_10005D910;
  if (!qword_10005D910)
  {
    result = swift_getWitnessTable(&unk_100046360, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D910);
  }
  return result;
}

uint64_t sub_100026E20()
{
  return sub_1000061A8(&qword_10005D918, &qword_10005D920, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

unint64_t sub_100026E50()
{
  unint64_t result;

  result = qword_10005D928;
  if (!qword_10005D928)
  {
    result = swift_getWitnessTable(&unk_100046390, &type metadata for CloseTabsModeEntity);
    atomic_store(result, (unint64_t *)&qword_10005D928);
  }
  return result;
}

unint64_t sub_100026E98()
{
  unint64_t result;

  result = qword_10005D930;
  if (!qword_10005D930)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D930);
  }
  return result;
}

unint64_t sub_100026EE0()
{
  unint64_t result;

  result = qword_10005D938;
  if (!qword_10005D938)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D938);
  }
  return result;
}

unint64_t sub_100026F28()
{
  unint64_t result;

  result = qword_10005D940;
  if (!qword_10005D940)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D940);
  }
  return result;
}

unint64_t sub_100026F70()
{
  unint64_t result;

  result = qword_10005D948;
  if (!qword_10005D948)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D948);
  }
  return result;
}

unint64_t sub_100026FB8()
{
  unint64_t result;

  result = qword_10005D950;
  if (!qword_10005D950)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D950);
  }
  return result;
}

unint64_t sub_100027000()
{
  unint64_t result;

  result = qword_10005D958;
  if (!qword_10005D958)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D958);
  }
  return result;
}

unint64_t sub_100027048()
{
  unint64_t result;

  result = qword_10005D960;
  if (!qword_10005D960)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D960);
  }
  return result;
}

unint64_t sub_100027090()
{
  unint64_t result;

  result = qword_10005D968;
  if (!qword_10005D968)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D968);
  }
  return result;
}

uint64_t sub_1000270D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_100023F2C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_1000270EC()
{
  unint64_t result;

  result = qword_10005D970;
  if (!qword_10005D970)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D970);
  }
  return result;
}

unint64_t sub_100027134()
{
  unint64_t result;

  result = qword_10005D978;
  if (!qword_10005D978)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D978);
  }
  return result;
}

unint64_t sub_10002717C()
{
  unint64_t result;

  result = qword_10005D980;
  if (!qword_10005D980)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CloseTabsIntervalType, &type metadata for CloseTabsIntervalType);
    atomic_store(result, (unint64_t *)&qword_10005D980);
  }
  return result;
}

uint64_t sub_1000271C0()
{
  return sub_1000061A8(&qword_10005D988, &qword_10005D990, (uint64_t)&protocol conformance descriptor for [A]);
}

uint64_t getEnumTagSinglePayload for CloseTabsIntervalType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CloseTabsIntervalType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000272C8 + 4 * byte_100045E61[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000272FC + 4 * byte_100045E5C[v4]))();
}

uint64_t sub_1000272FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100027304(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002730CLL);
  return result;
}

uint64_t sub_100027318(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100027320);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100027324(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002732C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100027338(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CloseTabsIntervalType()
{
  return &type metadata for CloseTabsIntervalType;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity.CloseTabsModeEntityQuery()
{
  return &type metadata for CloseTabsModeEntity.CloseTabsModeEntityQuery;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity()
{
  return &type metadata for CloseTabsModeEntity;
}

ValueMetadata *type metadata accessor for CloseTabsModeEntity.UpdateIntent_value()
{
  return &type metadata for CloseTabsModeEntity.UpdateIntent_value;
}

uint64_t sub_100027380()
{
  return sub_1000061A8(&qword_10005D998, &qword_10005D9A0, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_1000273AC()
{
  return sub_1000061A8(&qword_10005D9A8, &qword_10005D9A0, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_1000273D8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

unint64_t sub_1000273E8()
{
  unint64_t result;

  result = qword_10005DA30;
  if (!qword_10005DA30)
  {
    result = swift_getWitnessTable(&unk_1000467F0, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DA30);
  }
  return result;
}

uint64_t sub_10002742C()
{
  return sub_1000061A8(&qword_10005DA38, &qword_10005DA40, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100027458()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E890);
  sub_10000AAD4(v16, (uint64_t)qword_10005E890);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x8000000100040400);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

uint64_t sub_10002767C()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E8A8);
  sub_10000AAD4(v0, (uint64_t)qword_10005E8A8);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x80000001000404A0);
}

uint64_t sub_1000276DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E8C0);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E8C0);
  IntentDescription.init(stringLiteral:)(0xD000000000000043, 0x8000000100040450);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100027764()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100046B58);
  qword_10005E8D8 = result;
  return result;
}

uint64_t sub_100027788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005DB30);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005DB38);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100027894, 0, 0);
}

uint64_t sub_100027894()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_100028010();
  *v1 = v0;
  v1[1] = sub_100027914;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_100027CA4, 0, &type metadata for OpenLinksInBackgroundEntity, v2);
}

uint64_t sub_100027914()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100027968, 0, 0);
}

uint64_t sub_100027968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C348 != -1)
    swift_once(&qword_10005C348, sub_100027764);
  v2 = qword_10005E8D8;
  *(_QWORD *)(v0 + 168) = qword_10005E8D8;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005DB10, &qword_10005DB18, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100027A64;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_100027A64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_100027AE4;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100027AE4()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000273E8();
  v11 = sub_10002863C();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100027CA4, 0, v7, v6, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, &type metadata for OpenLinksInBackgroundEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for OpenLinksInBackgroundEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005DB40);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C348 != -1)
    swift_once(&qword_10005C348, sub_100027764);
  v4 = qword_10005E8D8;
  swift_retain(qword_10005E8D8);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10002863C();
  v7 = sub_1000061A8(&qword_10005DB48, &qword_10005DB40, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for OpenLinksInBackgroundEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_100027DB0()
{
  double result;

  if (qword_10005C348 != -1)
    swift_once(&qword_10005C348, sub_100027764);
  *(_QWORD *)&result = swift_retain(qword_10005E8D8).n128_u64[0];
  return result;
}

unint64_t sub_100027DF4()
{
  unint64_t result;

  result = qword_10005DA48;
  if (!qword_10005DA48)
  {
    result = swift_getWitnessTable(&unk_100046880, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DA48);
  }
  return result;
}

unint64_t sub_100027E3C()
{
  unint64_t result;

  result = qword_10005DA50;
  if (!qword_10005DA50)
  {
    result = swift_getWitnessTable(&unk_1000468A8, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DA50);
  }
  return result;
}

uint64_t sub_100027E80(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000494F0, 1) + 8);
}

uint64_t sub_100027EA4(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000273E8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100027EE4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C338, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E8A8, (uint64_t)sub_10002767C, a1);
}

uint64_t sub_100027F08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C340 != -1)
    swift_once(&qword_10005C340, sub_1000276DC);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E8C0);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_100027F68(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005DB2C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100008354;
  return sub_100027788(a1, v5, v4);
}

uint64_t sub_100027FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1000288BC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100027FF0()
{
  return 0xD00000000000002CLL;
}

unint64_t sub_100028010()
{
  unint64_t result;

  result = qword_10005DA60;
  if (!qword_10005DA60)
  {
    result = swift_getWitnessTable(&unk_100046924, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DA60);
  }
  return result;
}

uint64_t sub_100028054()
{
  return sub_1000061A8(&qword_10005DA68, &qword_10005DA70, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100028080(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100028098, 0, 0);
}

uint64_t sub_100028098()
{
  uint64_t v0;
  unsigned __int8 *v1;
  id v2;
  unsigned __int8 v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
  v3 = objc_msgSend(v2, "BOOLForKey:", _SFOpenLinksInBackgroundDefaultsKey);

  *v1 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100028118(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005DB24);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 16) = v3;
  return swift_task_switch(sub_100028C3C, 0, 0);
}

uint64_t sub_100028178()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100006014(&qword_10005DA70);
  sub_10000AAEC(v0, qword_10005E8E0);
  sub_10000AAD4(v0, (uint64_t)qword_10005E8E0);
  v1 = sub_100028BE0();
  return _UniqueEntityProvider.init(_:)(&unk_10005DAF8, 0, &type metadata for OpenLinksInBackgroundEntity, v1);
}

uint64_t sub_1000281E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Locale(0);
  v1[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  v1[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v1[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000282A4, 0, 0);
}

uint64_t sub_1000282A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD **)(v0 + 16);
  sub_100006014(&qword_10005DA40);
  v8 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x8000000100040400);
  static Locale.current.getter(v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v9 = sub_1000061A8(&qword_10005DB10, &qword_10005DB18, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v7 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005DB00, 0, &unk_10005DB08, 0, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000283FC()
{
  uint64_t v0;

  v0 = qword_10005DA20;
  swift_bridgeObjectRetain(off_10005DA28);
  return v0;
}

unint64_t sub_100028434()
{
  unint64_t result;

  result = qword_10005DA78;
  if (!qword_10005DA78)
  {
    result = swift_getWitnessTable(&unk_10004697C, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DA78);
  }
  return result;
}

unint64_t sub_10002847C()
{
  unint64_t result;

  result = qword_10005DA80;
  if (!qword_10005DA80)
  {
    result = swift_getWitnessTable(&unk_1000469B4, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DA80);
  }
  return result;
}

unint64_t sub_1000284C4()
{
  unint64_t result;

  result = qword_10005DA88;
  if (!qword_10005DA88)
  {
    result = swift_getWitnessTable(&unk_1000469E4, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DA88);
  }
  return result;
}

uint64_t sub_100028508()
{
  return sub_1000061A8(&qword_10005DA90, &qword_10005DA70, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100028534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C350 != -1)
    swift_once(&qword_10005C350, sub_100028178);
  v2 = sub_100006014(&qword_10005DA70);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E8E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1000285AC()
{
  unint64_t result;

  result = qword_10005DA98;
  if (!qword_10005DA98)
  {
    result = swift_getWitnessTable(&unk_100046A1C, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DA98);
  }
  return result;
}

unint64_t sub_1000285F4()
{
  unint64_t result;

  result = qword_10005DAA0;
  if (!qword_10005DAA0)
  {
    result = swift_getWitnessTable(&unk_100046A44, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAA0);
  }
  return result;
}

unint64_t sub_10002863C()
{
  unint64_t result;

  result = qword_10005DAA8;
  if (!qword_10005DAA8)
  {
    result = swift_getWitnessTable(&unk_100046A6C, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAA8);
  }
  return result;
}

unint64_t sub_100028684()
{
  unint64_t result;

  result = qword_10005DAB0;
  if (!qword_10005DAB0)
  {
    result = swift_getWitnessTable(&unk_100046AC4, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAB0);
  }
  return result;
}

uint64_t sub_1000286C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100028BE0();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100028704@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C330, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E890, (uint64_t)sub_100027458, a1);
}

uint64_t sub_100028728()
{
  return sub_1000061A8(&qword_10005DAB8, &qword_10005DAC0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100028754(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100028010();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100028790()
{
  unint64_t result;

  result = qword_10005DAC8;
  if (!qword_10005DAC8)
  {
    result = swift_getWitnessTable(&unk_100046AF4, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAC8);
  }
  return result;
}

uint64_t sub_1000287D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100028BE0();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10002880C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100028684();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundEntity()
{
  return &type metadata for OpenLinksInBackgroundEntity;
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundEntity.UpdateIntent_value()
{
  return &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value;
}

uint64_t sub_100028864()
{
  return sub_1000061A8(&qword_10005DAD0, &qword_10005DAD8, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100028890()
{
  return sub_1000061A8(&qword_10005DAE0, &qword_10005DAD8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_1000288BC()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005DAE8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000021, 0x8000000100040390);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100028010();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000003CLL, 0x80000001000403C0);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

unint64_t sub_100028BE0()
{
  unint64_t result;

  result = qword_10005DAF0;
  if (!qword_10005DAF0)
  {
    result = swift_getWitnessTable(&unk_1000468C4, &type metadata for OpenLinksInBackgroundEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAF0);
  }
  return result;
}

uint64_t sub_100028C24(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return swift_task_switch(sub_100028C3C, 0, 0);
}

uint64_t sub_100028C3C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)objc_opt_self(NSUserDefaults);
  v3 = objc_msgSend(v2, "safari_browserDefaults");
  v4 = _SFOpenLinksInBackgroundDefaultsKey;
  objc_msgSend(v3, "setBool:forKey:", v1, _SFOpenLinksInBackgroundDefaultsKey);

  v5 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
  v6 = objc_msgSend(v2, "safari_notificationNameForUserDefaultsKey:", v4);
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", v6, 0, 0, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100028D2C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SearchEngineControlPicker()
{
  return &type metadata for SearchEngineControlPicker;
}

uint64_t sub_100028D48(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049550, 1);
}

uint64_t sub_100028D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t OpaqueTypeConformance2;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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

  v43 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006014(&qword_10005C490);
  v39 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_100006014(&qword_10005DB50);
  v40 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005DB58);
  v14 = *(_QWORD *)(v13 - 8);
  v41 = v13;
  v42 = v14;
  __chkstk_darwin(v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0x4520686372616553, 0xED0000656E69676ELL);
  v17 = WBSLookUpLocalizedString(_:dsohandle:)(v7, &_mh_execute_header);
  v36 = v18;
  v37 = v17;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  KeyPath = swift_getKeyPath(&unk_100046BE0);
  static ControlSize._1x1.getter(KeyPath);
  v20 = sub_100006014(&qword_10005C460);
  v21 = sub_1000191D8();
  v22 = sub_10001696C();
  v23 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD000000000000039, 0x80000001000404C0, v37, v36, v3, KeyPath, sub_1000290F0, 0, sub_1000291DC, 0, 0, 0, v20, &type metadata for Text, v21, v22, v23, &protocol witness table for Text);
  v24 = LocalizedStringKey.init(stringLiteral:)(0x6E45686372616553, 0xEC000000656E6967);
  v26 = v25;
  LOBYTE(v21) = v27;
  v29 = v28;
  v30 = sub_1000061A8((unint64_t *)&qword_10005C498, &qword_10005C490, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v24, v26, v21 & 1, v29, v8, v30);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
  v44 = v8;
  v45 = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v32 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v32);
  v44 = v32;
  v45 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v34 = v41;
  WidgetConfiguration.hiddenControl()(v41, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v16, v34);
}

uint64_t sub_1000290F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0x4520686372616553, 0xED0000656E69676ELL);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

uint64_t sub_1000291DC@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  EntityProperty.wrappedValue.getter(&v7);
  v2 = sub_1000062D0();
  result = Text.init<A>(_:)(&v7, &type metadata for String, v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_100029244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000060C8(&qword_10005DB58);
  v1 = sub_1000060C8(&qword_10005DB50);
  v5 = sub_1000060C8(&qword_10005C490);
  v6 = sub_1000061A8((unint64_t *)&qword_10005C498, &qword_10005C490, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

ValueMetadata *type metadata accessor for PrivateSearchEngineControlPicker()
{
  return &type metadata for PrivateSearchEngineControlPicker;
}

uint64_t sub_100029310(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049594, 1);
}

uint64_t sub_100029320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t OpaqueTypeConformance2;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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

  v43 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006014(&qword_10005C490);
  v39 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_100006014(&qword_10005DB50);
  v40 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005DB58);
  v14 = *(_QWORD *)(v13 - 8);
  v41 = v13;
  v42 = v14;
  __chkstk_darwin(v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000015, 0x800000010003F940);
  v17 = WBSLookUpLocalizedString(_:dsohandle:)(v7, &_mh_execute_header);
  v36 = v18;
  v37 = v17;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  KeyPath = swift_getKeyPath(&unk_100046C78);
  static ControlSize._1x1.getter(KeyPath);
  v20 = sub_100006014(&qword_10005C460);
  v21 = sub_1000191D8();
  v22 = sub_10001801C();
  v23 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD000000000000040, 0x8000000100040500, v37, v36, v3, KeyPath, sub_1000296B8, 0, sub_1000291DC, 0, 0, 0, v20, &type metadata for Text, v21, v22, v23, &protocol witness table for Text);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000013, 0x8000000100040550);
  v26 = v25;
  LOBYTE(v21) = v27;
  v29 = v28;
  v30 = sub_1000061A8((unint64_t *)&qword_10005C498, &qword_10005C490, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v24, v26, v21 & 1, v29, v8, v30);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v8);
  v44 = v8;
  v45 = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v32 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v32);
  v44 = v32;
  v45 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2(&v44, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v34 = v41;
  WidgetConfiguration.hiddenControl()(v41, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v16, v34);
}

uint64_t sub_1000296B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000015, 0x800000010003F940);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

unint64_t sub_1000297A8()
{
  unint64_t result;

  result = qword_10005DB80;
  if (!qword_10005DB80)
  {
    result = swift_getWitnessTable(&unk_100046D7C, &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_10005DB80);
  }
  return result;
}

unint64_t sub_1000297F0()
{
  unint64_t result;

  result = qword_10005DB88;
  if (!qword_10005DB88)
  {
    result = swift_getWitnessTable(&unk_100046DDC, &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_10005DB88);
  }
  return result;
}

unint64_t sub_100029838()
{
  unint64_t result;

  result = qword_10005DB90[0];
  if (!qword_10005DB90[0])
  {
    result = swift_getWitnessTable(&unk_100046E88, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, qword_10005DB90);
  }
  return result;
}

void sub_10002987C(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;

  v19 = a2;
  v3 = sub_100006014(&qword_10005D1A8);
  __chkstk_darwin(v3);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v6);
  v20 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v8);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v11 = __chkstk_darwin(v16);
  v18 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)sub_100029A34 + 4 * word_100046CA0[a1];
  v17 = (char *)v15 - v14;
  v15[4] = v5;
  __asm { BR              X10 }
}

uint64_t sub_100029A34()
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
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v8 = String.LocalizationValue.init(stringLiteral:)(0x6E694C206E65704FLL, 0xEA0000000000736BLL);
  static Locale.current.getter(v8);
  v9 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 104);
  v10(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  *(_QWORD *)(v7 - 216) = v10;
  v11 = v0;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Title for the 'Open Links' setting representation", 49, 2);
  v12 = String.LocalizationValue.init(stringLiteral:)(0x9286E22073707041, 0xAF69726166615320);
  static Locale.current.getter(v12);
  v10(v3, v9, v6);
  v13 = *(_QWORD *)(v7 - 168);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Subtitle for the 'Open Links' setting representation", 52, 2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v2 + 56))(v13, 0, 1, *(_QWORD *)(v7 - 200));
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000016, 0x8000000100040640);
  v14 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 0, 1, v14);
  v15 = sub_100006014(&qword_10005DCB8);
  v16 = swift_allocObject(v15, ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72), *(unsigned __int8 *)(v2 + 80) | 7);
  *(_OWORD *)(v16 + 16) = xmmword_100042D70;
  v17 = String.LocalizationValue.init(stringLiteral:)(0x626154206E65704FLL, 0xE900000000000073);
  static Locale.current.getter(v17);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 - 216);
  v18(v3, v9, v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v19 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000009BLL, 0x80000001000412E0);
  static Locale.current.getter(v19);
  v18(v3, v9, v6);
  v20 = *(_QWORD *)(v7 - 184);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:))(*(_QWORD *)(v7 - 192), *(_QWORD *)(v7 - 168), *(_QWORD *)(v7 - 208), v16, v20);
}

void sub_10002B910()
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
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = String.LocalizationValue.init(stringLiteral:)(0x4320746964657243, 0xEC00000073647261);
  static Locale.current.getter(v8);
  v9 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 104);
  v11 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  *(_DWORD *)(v7 - 216) = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v10(v3, v11, v6);
  *(_QWORD *)(v7 - 224) = v10;
  *(_QWORD *)(v7 - 240) = 0x800000010003F360;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Setting pane name", 17, 2);
  v12 = String.LocalizationValue.init(stringLiteral:)(0x100000000000001CLL, 0x8000000100040600);
  static Locale.current.getter(v12);
  v10(v3, v9, v6);
  v13 = *(_QWORD *)(v7 - 168);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Setting pane subtitle", 21, 2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v2 + 56))(v13, 0, 1, *(_QWORD *)(v7 - 200));
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000016, 0x8000000100040640);
  v14 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v0, 0, 1, v14);
  v15 = sub_100006014(&qword_10005DCB8);
  *(_OWORD *)(swift_allocObject(v15, ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ 2 * *(_QWORD *)(v2 + 72), *(unsigned __int8 *)(v2 + 80) | 7)+ 16) = xmmword_100044810;
  v16 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100040730);
  static Locale.current.getter(v16);
  v17 = *(unsigned int *)(v7 - 216);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 - 224);
  v18(v3, v17, v6);
  v19 = *(_QWORD *)(v7 - 240);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, v19, v4, v3, 0, 0, 256);
  v20 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100040750);
  static Locale.current.getter(v20);
  v18(v3, v17, v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, v19, v4, v3, 0, 0, 256);
  v21 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000009DLL, 0x8000000100040770);
  static Locale.current.getter(v21);
  v18(v3, v17, v6);
  JUMPOUT(0x10002B8C0);
}

void sub_10002BBE4()
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
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v8 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x800000010003F3C0);
  static Locale.current.getter(v8);
  v9 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 104);
  v11 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  *(_QWORD *)(v7 - 232) = v6;
  v10(v3, v11, v6);
  *(_QWORD *)(v7 - 216) = v10;
  *(_QWORD *)(v7 - 224) = 0x800000010003F360;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Setting pane name", 17, 2);
  v12 = String.LocalizationValue.init(stringLiteral:)(0x100000000000001CLL, 0x8000000100040600);
  static Locale.current.getter(v12);
  v10(v3, v9, v6);
  v13 = *(_QWORD *)(v7 - 168);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, 0x800000010003F360, v4, v3, "Setting pane subtitle", 21, 2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v2 + 56))(v13, 0, 1, *(_QWORD *)(v7 - 200));
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000016, 0x8000000100040640);
  v14 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v0, 0, 1, v14);
  v15 = sub_100006014(&qword_10005DCB8);
  *(_OWORD *)(swift_allocObject(v15, ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ 2 * *(_QWORD *)(v2 + 72), *(unsigned __int8 *)(v2 + 80) | 7)+ 16) = xmmword_100044810;
  v16 = String.LocalizationValue.init(stringLiteral:)(0x20746361746E6F43, 0xEF736C6961746544);
  static Locale.current.getter(v16);
  v17 = v9;
  v18 = v9;
  v19 = *(_QWORD *)(v7 - 232);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 - 216);
  v20(v3, v18, v19);
  v21 = *(_QWORD *)(v7 - 224);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, v21, v4, v3, 0, 0, 256);
  v22 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100040660);
  static Locale.current.getter(v22);
  v20(v3, v17, v19);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v5, 0xD000000000000018, v21, v4, v3, 0, 0, 256);
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD0000000000000AALL, 0x8000000100040680);
  static Locale.current.getter(v23);
  v20(v3, v17, v19);
  JUMPOUT(0x10002B8C0);
}

uint64_t sub_10002BEC4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LocalizedStringResource(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v7, qword_10005E8F8);
  sub_10000AAD4(v7, (uint64_t)qword_10005E8F8);
  LocalizedStringResource.init(stringLiteral:)(0x5320697261666153, 0xEF73676E69747465);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v6, v2);
}

uint64_t sub_10002BFDC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10005DCF0 + dword_10005DCF0);
  v3 = (_QWORD *)swift_task_alloc(unk_10005DCF4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100008170;
  return v5(a1);
}

uint64_t sub_10002C03C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005DCE0 + dword_10005DCE0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005DCE4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_10002C09C()
{
  unint64_t result;

  result = qword_10005DBA8;
  if (!qword_10005DBA8)
  {
    result = swift_getWitnessTable(&unk_100046CEC, &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_10005DBA8);
  }
  return result;
}

uint64_t sub_10002C0E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005DCD0 + dword_10005DCD0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005DCD4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100007FCC;
  return v4();
}

unint64_t sub_10002C140()
{
  unint64_t result;

  result = qword_10005DBB8;
  if (!qword_10005DBB8)
  {
    result = swift_getWitnessTable(&unk_100046E04, &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_10005DBB8);
  }
  return result;
}

unint64_t sub_10002C188()
{
  unint64_t result;

  result = qword_10005DBC0;
  if (!qword_10005DBC0)
  {
    result = swift_getWitnessTable(&unk_100046FF8, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DBC0);
  }
  return result;
}

unint64_t sub_10002C1D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005DBC8;
  if (!qword_10005DBC8)
  {
    v1 = sub_1000060C8(qword_10005DBD0);
    sub_10002C188();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005DBC8);
  }
  return result;
}

uint64_t sub_10002C234(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002C09C();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10002C2A4()
{
  unint64_t result;

  result = qword_10005DBE8;
  if (!qword_10005DBE8)
  {
    result = swift_getWitnessTable(&unk_100046EE0, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DBE8);
  }
  return result;
}

uint64_t sub_10002C2E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v13;

  v2 = sub_100006014(&qword_10005DCC0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005DCC8);
  __chkstk_darwin(v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100029838();
  _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)(69, 1, a1, v9);
  v10._object = (void *)0x8000000100041380;
  v10._countAndFlagsBits = 0xD000000000000045;
  _EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v2);
  _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)(v5, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  _EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v11);
  return _EntityURLRepresentation.init(stringInterpolation:)(v8, a1, v9);
}

uint64_t sub_10002C438()
{
  uint64_t v0;

  v0 = qword_10005DB60;
  swift_bridgeObjectRetain(off_10005DB68);
  return v0;
}

unint64_t sub_10002C470()
{
  unint64_t result;

  result = qword_10005DBF0;
  if (!qword_10005DBF0)
  {
    result = swift_getWitnessTable(&unk_100046F08, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DBF0);
  }
  return result;
}

unint64_t sub_10002C4B8()
{
  unint64_t result;

  result = qword_10005DBF8;
  if (!qword_10005DBF8)
  {
    result = swift_getWitnessTable(&unk_100046F40, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DBF8);
  }
  return result;
}

unint64_t sub_10002C500()
{
  unint64_t result;

  result = qword_10005DC00;
  if (!qword_10005DC00)
  {
    result = swift_getWitnessTable(&unk_100046F70, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC00);
  }
  return result;
}

unint64_t sub_10002C548()
{
  unint64_t result;

  result = qword_10005DC08;
  if (!qword_10005DC08)
  {
    result = swift_getWitnessTable(&unk_100047180, &type metadata for SafariSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_10005DC08);
  }
  return result;
}

uint64_t sub_10002C58C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10002E28C();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_10002E2D0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_10002C5D8()
{
  unint64_t result;

  result = qword_10005DC18;
  if (!qword_10005DC18)
  {
    result = swift_getWitnessTable(&unk_100046FA8, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC18);
  }
  return result;
}

unint64_t sub_10002C620()
{
  unint64_t result;

  result = qword_10005DC20;
  if (!qword_10005DC20)
  {
    result = swift_getWitnessTable(&unk_100046FD0, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC20);
  }
  return result;
}

unint64_t sub_10002C668()
{
  unint64_t result;

  result = qword_10005DC28;
  if (!qword_10005DC28)
  {
    result = swift_getWitnessTable(&unk_100047050, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC28);
  }
  return result;
}

unint64_t sub_10002C6B0()
{
  unint64_t result;

  result = qword_10005DC30;
  if (!qword_10005DC30)
  {
    result = swift_getWitnessTable(&unk_1000470D0, &type metadata for SafariSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_10005DC30);
  }
  return result;
}

void sub_10002C6F4(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_10002C700@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C358, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E8F8, (uint64_t)sub_10002BEC4, a1);
}

uint64_t sub_10002C724()
{
  return sub_1000061A8(&qword_10005DC38, &qword_10005DC40, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10002C750(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100029838();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002C78C()
{
  unint64_t result;

  result = qword_10005DC48;
  if (!qword_10005DC48)
  {
    result = swift_getWitnessTable(&unk_100047080, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC48);
  }
  return result;
}

void sub_10002C7D0(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  sub_10002987C(*v1, a1);
}

uint64_t sub_10002C7D8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002C668();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002C810(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10002C84C + 4 * byte_100046CC0[a1]))(0xD00000000000001FLL, 0x800000010003EEE0);
}

uint64_t sub_10002C84C()
{
  uint64_t v0;

  return v0 + 17;
}

uint64_t sub_10002C9AC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10002C9E8 + 4 * byte_100046CD0[a1]))(0xD00000000000001FLL, 0x800000010003EEE0);
}

uint64_t sub_10002C9E8()
{
  uint64_t v0;

  return v0 + 17;
}

uint64_t sub_10002CB48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;

  v2 = *a2;
  v3 = sub_10002C9AC(*a1);
  v5 = v4;
  if (v3 == sub_10002C9AC(v2) && v5 == v6)
  {
    v9 = 1;
    v8 = v5;
  }
  else
  {
    v8 = v6;
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v8);
  return v9 & 1;
}

unint64_t sub_10002CBD4()
{
  unint64_t result;

  result = qword_10005DC50;
  if (!qword_10005DC50)
  {
    result = swift_getWitnessTable(&unk_1000470A8, &type metadata for SafariSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_10005DC50);
  }
  return result;
}

Swift::Int sub_10002CC18()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_10002C9AC(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10002CC78(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10002C9AC(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10002CCB8(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_10002C9AC(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_10002CD14@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10002DE98(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10002CD40@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10002C9AC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10002CD68()
{
  return sub_1000061A8(&qword_10005DC58, &qword_10005DC60, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10002CD94(_QWORD *a1@<X8>)
{
  *a1 = &off_100055550;
}

uint64_t sub_10002CDA4()
{
  unsigned __int8 *v0;

  return sub_10002C810(*v0);
}

unint64_t sub_10002CDAC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _BYTE *a3@<X8>)
{
  unint64_t result;
  Swift::String v7;

  swift_bridgeObjectRetain(a2);
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  result = sub_10002DE98(v7);
  *a3 = result;
  return result;
}

unint64_t sub_10002CDF4()
{
  unint64_t result;

  result = qword_10005DC68;
  if (!qword_10005DC68)
  {
    result = swift_getWitnessTable(&unk_100047280, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC68);
  }
  return result;
}

uint64_t sub_10002CE38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v10, qword_10005E910);
  sub_10000AAD4(v10, (uint64_t)qword_10005E910);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x80000001000405A0);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0xD000000000000018, 0x800000010003F360, v6, v3, "Title for the app intent", 24, 2);
}

uint64_t sub_10002CFC0()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

_QWORD *sub_10002CFF0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_10002D028(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_10002D05C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_1000092D0;
}

unint64_t sub_10002D0A8()
{
  unint64_t result;

  result = qword_10005DC70;
  if (!qword_10005DC70)
  {
    result = swift_getWitnessTable(&unk_1000472A8, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC70);
  }
  return result;
}

unint64_t sub_10002D0F0()
{
  unint64_t result;

  result = qword_10005DC78;
  if (!qword_10005DC78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10005DC78);
  }
  return result;
}

uint64_t sub_10002D134(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_10002E204();
  v5 = sub_10002E28C();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_10002D188()
{
  uint64_t v0;

  v0 = qword_10005DB70;
  swift_bridgeObjectRetain(off_10005DB78);
  return v0;
}

unint64_t sub_10002D1C0()
{
  unint64_t result;

  result = qword_10005DC80;
  if (!qword_10005DC80)
  {
    result = swift_getWitnessTable(&unk_100047338, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC80);
  }
  return result;
}

unint64_t sub_10002D208()
{
  unint64_t result;

  result = qword_10005DC88;
  if (!qword_10005DC88)
  {
    result = swift_getWitnessTable(&unk_100047360, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DC88);
  }
  return result;
}

uint64_t sub_10002D24C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10002D0A8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10002D28C@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C360, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E910, (uint64_t)sub_10002CE38, a1);
}

uint64_t sub_10002D2B0()
{
  return 0;
}

uint64_t sub_10002D2B8()
{
  return 1;
}

uint64_t sub_10002D2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002E204();
  v7 = sub_10002E248();
  v8 = sub_10002E28C();
  *v5 = v2;
  v5[1] = sub_10002D350;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10002D350()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(*v1 + 16);
  v3 = *v1;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_10002D3AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10002DEE0();
  *a1 = result;
  return result;
}

uint64_t sub_10002D3D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002D0A8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSafariSettingDeepLinks()
{
  return &type metadata for OpenSafariSettingDeepLinks;
}

ValueMetadata *type metadata accessor for SafariSettingsDestination()
{
  return &type metadata for SafariSettingsDestination;
}

uint64_t _s21SafariWidgetExtension25SafariSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s21SafariWidgetExtension25SafariSettingsDestinationOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_10002D4FC + 4 * byte_100046CE5[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_10002D530 + 4 * byte_100046CE0[v4]))();
}

uint64_t sub_10002D530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002D538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002D540);
  return result;
}

uint64_t sub_10002D54C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002D554);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_10002D558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002D560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SafariSettingsDeepLinks()
{
  return &type metadata for SafariSettingsDeepLinks;
}

ValueMetadata *type metadata accessor for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery()
{
  return &type metadata for SafariSettingsDeepLinks.AvailableSafariSettingsDestinationQuery;
}

size_t sub_10002D58C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_10002D5E0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_10002D5A8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10002D754(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10002D5C4(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10002D83C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_10002D5E0(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;

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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100006014(qword_10005C9E0);
  v11 = *(_QWORD *)(type metadata accessor for BookmarkItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_29;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = type metadata accessor for BookmarkItem(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((v5 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v20, v21, v8, v17);
  }
  swift_release(a4);
  return (size_t)v15;
}

char *sub_10002D754(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100006014(&qword_10005DCD8);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_release(a4);
  return v11;
}

char *sub_10002D83C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100006014(&qword_10005DCE8);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_10002D924()
{
  return swift_task_switch(sub_10002D938, 0, 0);
}

uint64_t sub_10002D938()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  char *v4;
  char v5;
  char v6;
  unint64_t v7;
  _QWORD *v9;

  v1 = 16;
  sub_10002D5A8(0, 16, 0);
  v2 = _swiftEmptyArrayStorage;
  v3 = _swiftEmptyArrayStorage[2];
  v4 = &byte_100055570;
  do
  {
    v6 = *v4++;
    v5 = v6;
    v9 = v2;
    v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_10002D5A8((char *)(v7 > 1), v3 + 1, 1);
      v2 = v9;
    }
    v2[2] = v3 + 1;
    *((_BYTE *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002DA0C()
{
  return swift_task_switch(sub_10002DA20, 0, 0);
}

uint64_t sub_10002DA20()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;

  v1 = sub_10002DB30((uint64_t)&off_100055550);
  v2 = v1;
  v3 = v1[2];
  if (v3)
  {
    sub_10002D5A8(0, v3, 0);
    v4 = 0;
    v5 = _swiftEmptyArrayStorage[2];
    do
    {
      v6 = *((_BYTE *)v2 + v4 + 32);
      v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1)
        sub_10002D5A8((char *)(v7 > 1), v5 + v4 + 1, 1);
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    swift_bridgeObjectRelease(v1);
  }
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

_QWORD *sub_10002DB30(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    __asm { BR              X8 }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10002DD64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10002DD7C, 0, 0);
}

uint64_t sub_10002DD7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_bridgeObjectRetain(v1);
  v3 = sub_10002DB30(v2);
  swift_bridgeObjectRelease(v1);
  v4 = v3[2];
  if (v4)
  {
    sub_10002D5A8(0, v4, 0);
    v5 = 0;
    v6 = _swiftEmptyArrayStorage[2];
    do
    {
      v7 = *((_BYTE *)v3 + v5 + 32);
      v8 = _swiftEmptyArrayStorage[3];
      if (v6 + v5 >= v8 >> 1)
        sub_10002D5A8((char *)(v8 > 1), v6 + v5 + 1, 1);
      _swiftEmptyArrayStorage[2] = v6 + v5 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage[4] + v6 + v5++) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

unint64_t sub_10002DE98(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100055580, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0x10)
    return 16;
  else
    return v3;
}

uint64_t sub_10002DEE0()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v34 = *(_QWORD *)(v0 - 8);
  v35 = v0;
  __chkstk_darwin(v0);
  v33 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006014(&qword_10005C700);
  v3 = __chkstk_darwin(v2);
  v32 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v31 - v5;
  v7 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Locale(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v17);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for LocalizedStringResource(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_100006014(&qword_10005DC98);
  v24 = String.LocalizationValue.init(stringLiteral:)(0x5320697261666153, 0xEF73676E69747465);
  static Locale.current.getter(v24);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v19, 0xD000000000000018, 0x800000010003F360, v16, v13, "Title for the app parameter for the app intent", 46, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v9, 1, 1, v20);
  v36[0] = 16;
  v25 = type metadata accessor for IntentDialog(0);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v26(v6, 1, 1, v25);
  v27 = v32;
  v26(v32, 1, 1, v25);
  v28 = v33;
  (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v33, enum case for InputConnectionBehavior.default(_:), v35);
  v29 = sub_100029838();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v23, v9, v36, v6, v27, v28, v29);
}

unint64_t sub_10002E204()
{
  unint64_t result;

  result = qword_10005DCA0;
  if (!qword_10005DCA0)
  {
    result = swift_getWitnessTable(&unk_1000471B0, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DCA0);
  }
  return result;
}

unint64_t sub_10002E248()
{
  unint64_t result;

  result = qword_10005DCA8;
  if (!qword_10005DCA8)
  {
    result = swift_getWitnessTable(&unk_100047200, &type metadata for OpenSafariSettingDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DCA8);
  }
  return result;
}

unint64_t sub_10002E28C()
{
  unint64_t result;

  result = qword_10005DCB0;
  if (!qword_10005DCB0)
  {
    result = swift_getWitnessTable(&unk_100046E20, &type metadata for SafariSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005DCB0);
  }
  return result;
}

uint64_t sub_10002E2D0(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10002E2E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  unint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);

  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v36 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v38 = (char *)&v33 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100006014(&qword_10005DE50);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005DE58);
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000268CC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(23, 1, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v8._countAndFlagsBits = 0xD000000000000017;
  v8._object = (void *)0x8000000100041890;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_100047670);
  v10 = sub_100027048();
  v33 = v10;
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v10);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v4);
  swift_release(v11);
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v40 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13 = v34;
  v40(v3, v34);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(29, 1, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v14._countAndFlagsBits = 0xD00000000000001DLL;
  v14._object = (void *)0x80000001000418B0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_100047670);
  v16 = _AssistantIntent.IntentProjection.subscript.getter(v15, v10);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v4);
  swift_release(v16);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v18 = v13;
  v40(v3, v13);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(35, 2, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v19._countAndFlagsBits = 0x61542065736F6C43;
  v19._object = (void *)0xEE00206E69207362;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v36;
  v22 = v38;
  v21 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v38, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v39);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v21);
  v23._object = (void *)0x80000001000418D0;
  v23._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_100047670);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v33);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v4);
  swift_release(v25);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v27 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v7);
  v40(v3, v18);
  v28 = sub_100006014(&qword_10005DE60);
  v29 = swift_allocObject(v28, 56, 7);
  *(_OWORD *)(v29 + 16) = xmmword_100042D60;
  v30 = v35;
  *(_QWORD *)(v29 + 32) = v37;
  *(_QWORD *)(v29 + 40) = v30;
  *(_QWORD *)(v29 + 48) = v27;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v29);
  return v31;
}

uint64_t sub_10002E728(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047670, (uint64_t (*)(void))sub_100027048, (uint64_t (*)(uint64_t))sub_1000268CC, (uint64_t)sub_10002E74C);
}

uint64_t sub_10002E74C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x796C6C61756E614DLL, 0xE800000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x79614420656E4FLL, 0xE700000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65655720656E4FLL, 0xE800000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x746E6F4D20656E4FLL, 0xE900000000000068);
  v4 = sub_100006014(&qword_10005DD18);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100046730;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10002E82C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t KeyPath;
  unint64_t v12;
  uint64_t v13;
  Swift::String v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v43 = a1;
  v1 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v48 = *(_QWORD *)(v1 - 8);
  v49 = v1;
  __chkstk_darwin(v1);
  v47 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_100006014(&qword_10005DE38);
  v3 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005DE40);
  __chkstk_darwin(v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10001ED88();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v10._countAndFlagsBits = 0x206E727554;
  v10._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v10);
  KeyPath = swift_getKeyPath(&unk_100047648);
  v12 = sub_100032DB8();
  v42 = v12;
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v12);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v6);
  swift_release(v13);
  v14._object = (void *)0x80000001000417F0;
  v14._countAndFlagsBits = 0xD00000000000001BLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v46 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16 = v50;
  v15(v5, v50);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 1, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v17._countAndFlagsBits = 0xD000000000000021;
  v17._object = (void *)0x8000000100041810;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100047648);
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v18, v12);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v6);
  swift_release(v19);
  v20._countAndFlagsBits = 46;
  v20._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v45 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v15(v5, v16);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(37, 1, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v21._countAndFlagsBits = 0xD000000000000024;
  v21._object = (void *)0x8000000100041840;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100047648);
  v23 = v42;
  v24 = _AssistantIntent.IntentProjection.subscript.getter(v22, v42);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v24, v6);
  swift_release(v24);
  v25._countAndFlagsBits = 46;
  v25._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v44 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v26 = v50;
  v15(v5, v50);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(31, 2, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = swift_getKeyPath(&unk_100047648);
  v29 = _AssistantIntent.IntentProjection.subscript.getter(v28, v23);
  swift_release(v28);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v29, v6);
  swift_release(v29);
  v30._countAndFlagsBits = 0xD00000000000001ELL;
  v30._object = (void *)0x8000000100041870;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v30);
  v31 = v47;
  v32 = v48;
  v33 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v49);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v31, v6);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v33);
  v34._countAndFlagsBits = 46;
  v34._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v34);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v9);
  v15(v5, v26);
  v36 = sub_100006014(&qword_10005DE48);
  v37 = swift_allocObject(v36, 64, 7);
  *(_OWORD *)(v37 + 16) = xmmword_100046730;
  v38 = v45;
  *(_QWORD *)(v37 + 32) = v46;
  *(_QWORD *)(v37 + 40) = v38;
  *(_QWORD *)(v37 + 48) = v44;
  *(_QWORD *)(v37 + 56) = v35;
  v39 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v37);
  return v39;
}

uint64_t sub_10002ED30(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047648, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_10001ED88, (uint64_t)sub_100032F04);
}

uint64_t sub_10002ED54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v9 = type metadata accessor for _AssistantIntent.Value(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(a2);
  v14 = a3();
  v15 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v14);
  v16 = swift_release(KeyPath);
  v17 = a4(v16);
  _AssistantIntent.Value.init<A>(for:builder:)(v15, a5, 0, v17);
  v18 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = sub_100006014(&qword_10005DD10);
  v20 = swift_allocObject(v19, 40, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100042D70;
  *(_QWORD *)(v20 + 32) = v18;
  v21 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10002EE78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t KeyPath;
  unint64_t v12;
  uint64_t v13;
  Swift::String v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v43 = a1;
  v1 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v48 = *(_QWORD *)(v1 - 8);
  v49 = v1;
  __chkstk_darwin(v1);
  v47 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_100006014(&qword_10005DE20);
  v3 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005DE28);
  __chkstk_darwin(v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000209B8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(25, 1, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v10._countAndFlagsBits = 0x206E727554;
  v10._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v10);
  KeyPath = swift_getKeyPath(&unk_100047620);
  v12 = sub_100032DB8();
  v42 = v12;
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v12);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v6);
  swift_release(v13);
  v14._object = (void *)0x8000000100041770;
  v14._countAndFlagsBits = 0xD000000000000014;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v46 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16 = v50;
  v15(v5, v50);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v17._countAndFlagsBits = 0xD00000000000001ALL;
  v17._object = (void *)0x8000000100041790;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100047620);
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v18, v12);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v6);
  swift_release(v19);
  v20._countAndFlagsBits = 46;
  v20._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v45 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v15(v5, v16);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(30, 1, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v21._countAndFlagsBits = 0xD00000000000001DLL;
  v21._object = (void *)0x80000001000417B0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100047620);
  v23 = v42;
  v24 = _AssistantIntent.IntentProjection.subscript.getter(v22, v42);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v24, v6);
  swift_release(v24);
  v25._countAndFlagsBits = 46;
  v25._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v44 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v26 = v50;
  v15(v5, v50);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 2, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = swift_getKeyPath(&unk_100047620);
  v29 = _AssistantIntent.IntentProjection.subscript.getter(v28, v23);
  swift_release(v28);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v29, v6);
  swift_release(v29);
  v30._countAndFlagsBits = 0xD000000000000017;
  v30._object = (void *)0x80000001000417D0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v30);
  v31 = v47;
  v32 = v48;
  v33 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v49);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v31, v6);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v33);
  v34._countAndFlagsBits = 46;
  v34._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v34);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v5, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v9);
  v15(v5, v26);
  v36 = sub_100006014(&qword_10005DE30);
  v37 = swift_allocObject(v36, 64, 7);
  *(_OWORD *)(v37 + 16) = xmmword_100046730;
  v38 = v45;
  *(_QWORD *)(v37 + 32) = v46;
  *(_QWORD *)(v37 + 40) = v38;
  *(_QWORD *)(v37 + 48) = v44;
  *(_QWORD *)(v37 + 56) = v35;
  v39 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v37);
  return v39;
}

uint64_t sub_10002F380(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047620, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_1000209B8, (uint64_t)sub_10002F3A4);
}

uint64_t sub_10002F3A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(28271, 0xE200000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(6710895, 0xE300000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x656C62616E65, 0xE600000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x656C6261736964, 0xE700000000000000);
  v4 = sub_100006014(&qword_10005DD18);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100046730;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10002F468(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  uint64_t v10;
  Swift::String v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v37 = a1;
  v41 = sub_100006014(&qword_10005DE08);
  v1 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005DE10);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000071F8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(38, 1, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v8._countAndFlagsBits = 0x206E727554;
  v8._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_1000475F8);
  v42 = sub_100032DB8();
  v10 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v42);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v10, v4);
  swift_release(v10);
  v11._countAndFlagsBits = 0xD000000000000021;
  v11._object = (void *)0x80000001000416C0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13 = v41;
  v12(v3, v41);
  v36 = v12;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 1, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v14._countAndFlagsBits = 0xD000000000000027;
  v14._object = (void *)0x80000001000416F0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_1000475F8);
  v16 = _AssistantIntent.IntentProjection.subscript.getter(v15, v42);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v4);
  swift_release(v16);
  v17._countAndFlagsBits = 46;
  v17._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v12(v3, v13);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(37, 1, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v18._countAndFlagsBits = 0xD000000000000024;
  v18._object = (void *)0x8000000100041720;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_1000475F8);
  v20 = v42;
  v21 = _AssistantIntent.IntentProjection.subscript.getter(v19, v42);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v21, v4);
  swift_release(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v38 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v23 = v41;
  v24 = v36;
  v36(v3, v41);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = swift_getKeyPath(&unk_1000475F8);
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v26, v20);
  swift_release(v26);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v4);
  swift_release(v27);
  v28._object = (void *)0x8000000100041750;
  v28._countAndFlagsBits = 0xD00000000000001BLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v29 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v7);
  v24(v3, v23);
  v30 = sub_100006014(&qword_10005DE18);
  v31 = swift_allocObject(v30, 64, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100046730;
  v32 = v39;
  *(_QWORD *)(v31 + 32) = v40;
  *(_QWORD *)(v31 + 40) = v32;
  *(_QWORD *)(v31 + 48) = v38;
  *(_QWORD *)(v31 + 56) = v29;
  v33 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v31);
  return v33;
}

uint64_t sub_10002F8E8(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_1000475F8, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_1000071F8, (uint64_t)sub_100032F04);
}

uint64_t sub_10002F90C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t KeyPath;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  Swift::String v18;
  void (*v19)(char *, uint64_t);
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v42 = sub_100006014(&qword_10005DDF0);
  v2 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005DDF8);
  __chkstk_darwin(v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100008814();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(38, 1, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v9._countAndFlagsBits = 0x206E727554;
  v9._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v9);
  KeyPath = swift_getKeyPath(&unk_1000475D0);
  v37 = sub_100032DB8();
  v35 = a1;
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v37);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v5);
  swift_release(v11);
  v12._object = (void *)0x8000000100041630;
  v40 = (void *)0x8000000100041630;
  v12._countAndFlagsBits = 0xD000000000000021;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v36 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13 = v42;
  v36(v4, v42);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 1, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v14._countAndFlagsBits = 0xD000000000000027;
  v14._object = (void *)0x8000000100041660;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_1000475D0);
  v16 = v37;
  v17 = _AssistantIntent.IntentProjection.subscript.getter(v15, v37);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v5);
  swift_release(v17);
  v18._countAndFlagsBits = 46;
  v18._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v19 = v36;
  v36(v4, v13);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(43, 1, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v20._countAndFlagsBits = 0xD00000000000002ALL;
  v20._object = (void *)0x8000000100041690;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v21 = swift_getKeyPath(&unk_1000475D0);
  v22 = _AssistantIntent.IntentProjection.subscript.getter(v21, v16);
  swift_release(v21);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v5);
  swift_release(v22);
  v23._countAndFlagsBits = 46;
  v23._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v38 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v24 = v42;
  v19(v4, v42);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(33, 1, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = swift_getKeyPath(&unk_1000475D0);
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v26, v16);
  swift_release(v26);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v5);
  swift_release(v27);
  v28._countAndFlagsBits = 0xD000000000000021;
  v28._object = v40;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v29 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v8);
  v19(v4, v24);
  v30 = sub_100006014(&qword_10005DE00);
  v31 = swift_allocObject(v30, 64, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100046730;
  v32 = v39;
  *(_QWORD *)(v31 + 32) = v41;
  *(_QWORD *)(v31 + 40) = v32;
  *(_QWORD *)(v31 + 48) = v38;
  *(_QWORD *)(v31 + 56) = v29;
  v33 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v31);
  return v33;
}

uint64_t sub_10002FD80(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_1000475D0, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_100008814, (uint64_t)sub_100032F04);
}

uint64_t sub_10002FDA4(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  char *v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *);
  unsigned int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v54 = a1;
  v55 = sub_100006014(&qword_10005DDD8);
  v46 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = v3;
  __chkstk_darwin(v3);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006014(&qword_10005DDE0);
  __chkstk_darwin(v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000140AC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v12._countAndFlagsBits = 0x206E727554;
  v12._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_1000475A8);
  v44 = sub_100032DB8();
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v44);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v8);
  swift_release(v14);
  v15._object = (void *)0x80000001000415D0;
  v52 = (void *)0x80000001000415D0;
  v15._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v51 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v50 = *(void (**)(char *))(v4 + 104);
  v47 = v7;
  v48 = v5;
  v50(v7);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v7, v8);
  v49 = *(void (**)(char *, uint64_t))(v4 + 8);
  v49(v7, v5);
  v16._countAndFlagsBits = 46;
  v16._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v53 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v43 = *(void (**)(char *, uint64_t))(v46 + 8);
  v17 = v55;
  v43(v2, v55);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v18._countAndFlagsBits = 0xD000000000000017;
  v18._object = (void *)0x80000001000415F0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_1000475A8);
  v20 = v44;
  v21 = _AssistantIntent.IntentProjection.subscript.getter(v19, v44);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v21, v8);
  swift_release(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v46 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v23 = v17;
  v24 = v43;
  v43(v2, v23);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v25._countAndFlagsBits = 0xD00000000000001ALL;
  v25._object = (void *)0x8000000100041610;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = swift_getKeyPath(&unk_1000475A8);
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v26, v20);
  swift_release(v26);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v8);
  swift_release(v27);
  v28._countAndFlagsBits = 46;
  v28._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v45 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v24(v2, v55);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  v30 = swift_getKeyPath(&unk_1000475A8);
  v31 = _AssistantIntent.IntentProjection.subscript.getter(v30, v20);
  swift_release(v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v31, v8);
  swift_release(v31);
  v32._countAndFlagsBits = 0xD000000000000015;
  v32._object = v52;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v34 = v47;
  v33 = v48;
  ((void (*)(char *, _QWORD, uint64_t))v50)(v47, v51, v48);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v34, v8);
  v49(v34, v33);
  v35._countAndFlagsBits = 46;
  v35._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v36 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v11);
  v24(v2, v55);
  v37 = sub_100006014(&qword_10005DDE8);
  v38 = swift_allocObject(v37, 64, 7);
  *(_OWORD *)(v38 + 16) = xmmword_100046730;
  v39 = v46;
  *(_QWORD *)(v38 + 32) = v53;
  *(_QWORD *)(v38 + 40) = v39;
  *(_QWORD *)(v38 + 48) = v45;
  *(_QWORD *)(v38 + 56) = v36;
  v40 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v38);
  return v40;
}

uint64_t sub_1000302DC(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_1000475A8, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_1000140AC, (uint64_t)sub_100032F04);
}

uint64_t sub_100030300(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  char *v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  void (*v46)(char *);
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;

  v41 = a1;
  v49 = sub_100006014(&qword_10005DDC0);
  v42 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin(v49);
  v2 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = v3;
  __chkstk_darwin(v3);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006014(&qword_10005DDC8);
  __chkstk_darwin(v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100032BE8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 2, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v12._countAndFlagsBits = 0x206E727554;
  v12._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_100047580);
  v40 = sub_100032DB8();
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v40);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v8);
  swift_release(v14);
  v15._countAndFlagsBits = 0xD000000000000016;
  v15._object = (void *)0x8000000100041570;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v47 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v46 = *(void (**)(char *))(v4 + 104);
  v43 = v7;
  v44 = v5;
  v46(v7);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v7, v8);
  v45 = *(void (**)(char *, uint64_t))(v4 + 8);
  v45(v7, v5);
  v16._countAndFlagsBits = 46;
  v16._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v48 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v39 = *(void (**)(char *, uint64_t))(v42 + 8);
  v17 = v49;
  v39(v2, v49);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 1, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v18._countAndFlagsBits = 0xD00000000000001BLL;
  v18._object = (void *)0x8000000100041590;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_100047580);
  v20 = v40;
  v21 = _AssistantIntent.IntentProjection.subscript.getter(v19, v40);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v21, v8);
  swift_release(v21);
  v22._countAndFlagsBits = 46;
  v22._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v42 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v23 = v17;
  v24 = v39;
  v39(v2, v23);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 2, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = swift_getKeyPath(&unk_100047580);
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v26, v20);
  swift_release(v26);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v8);
  swift_release(v27);
  v28._object = (void *)0x80000001000415B0;
  v28._countAndFlagsBits = 0xD000000000000013;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  v30 = v43;
  v29 = v44;
  ((void (*)(char *, _QWORD, uint64_t))v46)(v43, v47, v44);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v30, v8);
  v45(v30, v29);
  v31._countAndFlagsBits = 46;
  v31._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v11);
  v24(v2, v49);
  v33 = sub_100006014(&qword_10005DDD0);
  v34 = swift_allocObject(v33, 56, 7);
  *(_OWORD *)(v34 + 16) = xmmword_100042D60;
  v35 = v42;
  *(_QWORD *)(v34 + 32) = v48;
  *(_QWORD *)(v34 + 40) = v35;
  *(_QWORD *)(v34 + 48) = v32;
  v36 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v34);
  return v36;
}

uint64_t sub_100030778(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047580, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_100032BE8, (uint64_t)sub_100032F04);
}

uint64_t sub_10003079C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  unint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);

  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v36 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v38 = (char *)&v33 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100006014(&qword_10005DDA8);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005DDB0);
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000273E8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v8._countAndFlagsBits = 0xD000000000000020;
  v8._object = (void *)0x8000000100041520;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_100047558);
  v10 = sub_100032DB8();
  v33 = v10;
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v10);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v4);
  swift_release(v11);
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v40 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13 = v34;
  v40(v3, v34);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(29, 1, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v14._object = (void *)0x8000000100041550;
  v14._countAndFlagsBits = 0xD00000000000001DLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_100047558);
  v16 = _AssistantIntent.IntentProjection.subscript.getter(v15, v10);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v4);
  swift_release(v16);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v18 = v13;
  v40(v3, v13);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 2, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v19._countAndFlagsBits = 0x6E696C206E65704FLL;
  v19._object = (void *)0xEE00206E6920736BLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v36;
  v22 = v38;
  v21 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v38, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v39);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v21);
  v23._countAndFlagsBits = 32;
  v23._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_100047558);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v33);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v4);
  swift_release(v25);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v27 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v7);
  v40(v3, v18);
  v28 = sub_100006014(&qword_10005DDB8);
  v29 = swift_allocObject(v28, 56, 7);
  *(_OWORD *)(v29 + 16) = xmmword_100042D60;
  v30 = v35;
  *(_QWORD *)(v29 + 32) = v37;
  *(_QWORD *)(v29 + 40) = v30;
  *(_QWORD *)(v29 + 48) = v27;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v29);
  return v31;
}

uint64_t sub_100030BCC(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047558, (uint64_t (*)(void))sub_100032DB8, (uint64_t (*)(uint64_t))sub_1000273E8, (uint64_t)sub_100030BF0);
}

uint64_t sub_100030BF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(28271, 0xE200000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(6710895, 0xE300000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x676B636162206E69, 0xED0000646E756F72);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x742077656E206E69, 0xEA00000000006261);
  v4 = sub_100006014(&qword_10005DD18);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100046730;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100030CC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t KeyPath;
  unint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  __chkstk_darwin(v2);
  v42 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_100006014(&qword_10005DD88);
  v4 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006014(&qword_10005DD90);
  __chkstk_darwin(v7);
  v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100015D04();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 0xD000000000000020;
  v11._object = (void *)0x80000001000414B0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100047530);
  v13 = sub_100019724();
  v38[1] = a1;
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v13);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v7);
  swift_release(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v38[0] = *(_QWORD *)(v4 + 8);
  v16 = v39;
  ((void (*)(char *, uint64_t))v38[0])(v6, v39);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v17._countAndFlagsBits = 0xD000000000000018;
  v17._object = (void *)0x80000001000414E0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100047530);
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v18, v13);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v7);
  swift_release(v19);
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v21 = v16;
  v22 = v16;
  v23 = (void (*)(char *, uint64_t))v38[0];
  ((void (*)(char *, uint64_t))v38[0])(v6, v22);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(26, 2, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v24._countAndFlagsBits = 0x20656B614DLL;
  v24._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100047530);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v13);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v7);
  swift_release(v26);
  v27._object = (void *)0x8000000100041500;
  v27._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v42;
  v29 = v43;
  v30 = v44;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v42, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v44);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v28, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for SearchEngineEntity.UpdateIntent_value, v10);
  v23(v6, v21);
  v33 = sub_100006014(&qword_10005DD98);
  v34 = swift_allocObject(v33, 56, 7);
  *(_OWORD *)(v34 + 16) = xmmword_100042D60;
  v35 = v40;
  *(_QWORD *)(v34 + 32) = v41;
  *(_QWORD *)(v34 + 40) = v35;
  *(_QWORD *)(v34 + 48) = v32;
  v36 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v34);
  return v36;
}

uint64_t sub_1000310F8(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047530, (uint64_t (*)(void))sub_100019724, (uint64_t (*)(uint64_t))sub_100015D04, (uint64_t)sub_10003111C);
}

uint64_t sub_100031120(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t KeyPath;
  unint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  __chkstk_darwin(v2);
  v42 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_100006014(&qword_10005DD70);
  v4 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006014(&qword_10005DD78);
  __chkstk_darwin(v7);
  v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100017404();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v11._object = (void *)0x8000000100041430;
  v11._countAndFlagsBits = 0xD000000000000020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100047508);
  v13 = sub_100019724();
  v38[1] = a1;
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v13);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v7);
  swift_release(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v38[0] = *(_QWORD *)(v4 + 8);
  v16 = v39;
  ((void (*)(char *, uint64_t))v38[0])(v6, v39);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v17._object = (void *)0x8000000100041460;
  v17._countAndFlagsBits = 0xD000000000000020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100047508);
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v18, v13);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v7);
  swift_release(v19);
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v21 = v16;
  v22 = v16;
  v23 = (void (*)(char *, uint64_t))v38[0];
  ((void (*)(char *, uint64_t))v38[0])(v6, v22);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 2, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v24._countAndFlagsBits = 0x20656B614DLL;
  v24._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100047508);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v13);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v7);
  swift_release(v26);
  v27._countAndFlagsBits = 0xD00000000000001DLL;
  v27._object = (void *)0x8000000100041490;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v42;
  v29 = v43;
  v30 = v44;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v42, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v44);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v28, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v10);
  v23(v6, v21);
  v33 = sub_100006014(&qword_10005DD80);
  v34 = swift_allocObject(v33, 56, 7);
  *(_OWORD *)(v34 + 16) = xmmword_100042D60;
  v35 = v40;
  *(_QWORD *)(v34 + 32) = v41;
  *(_QWORD *)(v34 + 40) = v35;
  *(_QWORD *)(v34 + 48) = v32;
  v36 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v34);
  return v36;
}

uint64_t sub_10003154C(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047508, (uint64_t (*)(void))sub_100019724, (uint64_t (*)(uint64_t))sub_100017404, (uint64_t)sub_10003111C);
}

uint64_t sub_100031570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x656C676F6F47, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6F6F686159, 0xE500000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6169736F6345, 0xE600000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B6375446B637544, 0xEA00000000006F47);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(1735289154, 0xE400000000000000);
  v5 = sub_100006014(&qword_10005DD18);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100047410;
  *(_QWORD *)(v6 + 32) = v0;
  *(_QWORD *)(v6 + 40) = v1;
  *(_QWORD *)(v6 + 48) = v2;
  *(_QWORD *)(v6 + 56) = v3;
  *(_QWORD *)(v6 + 64) = v4;
  v7 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_10003165C(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  unint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  unsigned int v44;
  void (*v45)(char *);

  v42 = a1;
  v38 = sub_100006014(&qword_10005DD58);
  v40 = *(void (**)(char *, uint64_t))(v38 - 8);
  __chkstk_darwin(v38);
  v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006014(&qword_10005DD60);
  __chkstk_darwin(v7);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10001D238();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(33, 2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 0x20656B614DLL;
  v11._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v44 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v45 = *(void (**)(char *))(v4 + 104);
  v45(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43 = *(void (**)(char *, uint64_t))(v4 + 8);
  v43(v6, v3);
  v12._countAndFlagsBits = 0xD00000000000001BLL;
  v12._object = (void *)0x80000001000413D0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_1000474E0);
  v41 = sub_10001DC14();
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v41);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v7);
  swift_release(v14);
  v15._countAndFlagsBits = 46;
  v15._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v16 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v17 = (void (*)(char *, uint64_t))*((_QWORD *)v40 + 1);
  v39 = v16;
  v40 = v17;
  v18 = v38;
  v17(v2, v38);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(26, 2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v19._countAndFlagsBits = 544503120;
  v19._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  ((void (*)(char *, _QWORD, uint64_t))v45)(v6, v44, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43(v6, v3);
  v20._object = (void *)0x80000001000413F0;
  v20._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v21 = swift_getKeyPath(&unk_1000474E0);
  v22 = _AssistantIntent.IntentProjection.subscript.getter(v21, v41);
  swift_release(v21);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v7);
  swift_release(v22);
  v23._countAndFlagsBits = 46;
  v23._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v24 = v18;
  v40(v2, v18);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v25._countAndFlagsBits = 544499027;
  v25._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  ((void (*)(char *, _QWORD, uint64_t))v45)(v6, v44, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43(v6, v3);
  v26._countAndFlagsBits = 0xD000000000000016;
  v26._object = (void *)0x8000000100041410;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v27 = swift_getKeyPath(&unk_1000474E0);
  v28 = _AssistantIntent.IntentProjection.subscript.getter(v27, v41);
  swift_release(v27);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v28, v7);
  swift_release(v28);
  v29._countAndFlagsBits = 46;
  v29._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v30 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v10);
  v40(v2, v24);
  v31 = sub_100006014(&qword_10005DD68);
  v32 = swift_allocObject(v31, 56, 7);
  *(_OWORD *)(v32 + 16) = xmmword_100042D60;
  v33 = v37;
  *(_QWORD *)(v32 + 32) = v39;
  *(_QWORD *)(v32 + 40) = v33;
  *(_QWORD *)(v32 + 48) = v30;
  v34 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v32);
  return v34;
}

uint64_t sub_100031B1C(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_1000474E0, (uint64_t (*)(void))sub_10001DC14, (uint64_t (*)(uint64_t))sub_10001D238, (uint64_t)sub_100031B40);
}

uint64_t sub_100031B40()
{
  return sub_100032068(7368564, 0xE300000000000000, 0x6D6F74746F62, 0xE600000000000000);
}

uint64_t sub_100031B60(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  Swift::String v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  unint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  unsigned int v44;
  void (*v45)(char *);

  v42 = a1;
  v38 = sub_100006014(&qword_10005DD40);
  v40 = *(void (**)(char *, uint64_t))(v38 - 8);
  __chkstk_darwin(v38);
  v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006014(&qword_10005DD48);
  __chkstk_darwin(v7);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100032C2C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(12, 2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 0x20656B614DLL;
  v11._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v44 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v45 = *(void (**)(char *))(v4 + 104);
  v45(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43 = *(void (**)(char *, uint64_t))(v4 + 8);
  v43(v6, v3);
  v12._countAndFlagsBits = 0x207362617420;
  v12._object = (void *)0xE600000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_1000474B8);
  v41 = sub_100032CE4();
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v41);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v7);
  swift_release(v14);
  v15._countAndFlagsBits = 46;
  v15._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v16 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v17 = (void (*)(char *, uint64_t))*((_QWORD *)v40 + 1);
  v39 = v16;
  v40 = v17;
  v18 = v38;
  v17(v2, v38);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v19._countAndFlagsBits = 0x742065676E616843;
  v19._object = (void *)0xEF206E6920736261;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  ((void (*)(char *, _QWORD, uint64_t))v45)(v6, v44, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43(v6, v3);
  v20._countAndFlagsBits = 544175136;
  v20._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v21 = swift_getKeyPath(&unk_1000474B8);
  v22 = _AssistantIntent.IntentProjection.subscript.getter(v21, v41);
  swift_release(v21);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v7);
  swift_release(v22);
  v23._countAndFlagsBits = 46;
  v23._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v24 = v18;
  v40(v2, v18);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v25._countAndFlagsBits = 544499027;
  v25._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  ((void (*)(char *, _QWORD, uint64_t))v45)(v6, v44, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v43(v6, v3);
  v26._countAndFlagsBits = 0x6F74207362617420;
  v26._object = (void *)0xEC00000020656220;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v27 = swift_getKeyPath(&unk_1000474B8);
  v28 = _AssistantIntent.IntentProjection.subscript.getter(v27, v41);
  swift_release(v27);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v28, v7);
  swift_release(v28);
  v29._countAndFlagsBits = 46;
  v29._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v30 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for TabLayoutEntity.UpdateIntent_value, v10);
  v40(v2, v24);
  v31 = sub_100006014(&qword_10005DD50);
  v32 = swift_allocObject(v31, 56, 7);
  *(_OWORD *)(v32 + 16) = xmmword_100042D60;
  v33 = v37;
  *(_QWORD *)(v32 + 32) = v39;
  *(_QWORD *)(v32 + 40) = v33;
  *(_QWORD *)(v32 + 48) = v30;
  v34 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v32);
  return v34;
}

uint64_t sub_100032018(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_1000474B8, (uint64_t (*)(void))sub_100032CE4, (uint64_t (*)(uint64_t))sub_100032C2C, (uint64_t)sub_10003203C);
}

uint64_t sub_10003203C()
{
  return sub_100032068(0x6574617261706573, 0xE800000000000000, 0x746361706D6F63, 0xE700000000000000);
}

uint64_t sub_100032068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(a1, a2);
  v7 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(a3, a4);
  v8 = sub_100006014(&qword_10005DD18);
  v9 = swift_allocObject(v8, 48, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100044810;
  *(_QWORD *)(v9 + 32) = v6;
  *(_QWORD *)(v9 + 40) = v7;
  v10 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v9);
  return v10;
}

uint64_t sub_1000320E8(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t KeyPath;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v34)(char *, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  v39 = sub_100006014(&qword_10005DD20);
  v37 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006014(&qword_10005DD28);
  __chkstk_darwin(v7);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10002D0A8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 2, &type metadata for OpenSafariSettingDeepLinks, v10);
  v11._countAndFlagsBits = 0x206E65704FLL;
  v11._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100047490);
  v35 = sub_10002C188();
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v35);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v7);
  swift_release(v13);
  v14._countAndFlagsBits = 544106784;
  v14._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v15._countAndFlagsBits = 0x6E69747465532029;
  v15._object = (void *)0xEA00000000007367;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for OpenSafariSettingDeepLinks, v10);
  v38 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for OpenSafariSettingDeepLinks, v10);
  v34 = *(void (**)(char *, uint64_t))(v37 + 8);
  v16 = v39;
  v34(v2, v39);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 1, &type metadata for OpenSafariSettingDeepLinks, v10);
  v17._countAndFlagsBits = 0x206E65704FLL;
  v17._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100047490);
  v19 = v35;
  v20 = _AssistantIntent.IntentProjection.subscript.getter(v18, v35);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v20, v7);
  swift_release(v20);
  v21._countAndFlagsBits = 0x676E697474657320;
  v21._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for OpenSafariSettingDeepLinks, v10);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for OpenSafariSettingDeepLinks, v10);
  v22 = v16;
  v23 = v34;
  v34(v2, v22);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for OpenSafariSettingDeepLinks, v10);
  v24._countAndFlagsBits = 0x20656D20656B6154;
  v24._object = (void *)0xEB00000000206F74;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100047490);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v19);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v7);
  swift_release(v26);
  v27._countAndFlagsBits = 0x676E697474657320;
  v27._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for OpenSafariSettingDeepLinks, v10);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for OpenSafariSettingDeepLinks, v10);
  v23(v2, v39);
  v29 = sub_100006014(&qword_10005DD30);
  v30 = swift_allocObject(v29, 56, 7);
  *(_OWORD *)(v30 + 16) = xmmword_100042D60;
  v31 = v37;
  *(_QWORD *)(v30 + 32) = v38;
  *(_QWORD *)(v30 + 40) = v31;
  *(_QWORD *)(v30 + 48) = v28;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v32;
}

uint64_t sub_100032520(uint64_t a1)
{
  return sub_10002ED54(a1, (uint64_t)&unk_100047490, (uint64_t (*)(void))sub_10002C188, (uint64_t (*)(uint64_t))sub_10002D0A8, (uint64_t)sub_100032544);
}

uint64_t sub_100032544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x686372616553, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x64616F6C6E776F44, 0xE900000000000073);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x666F72502077654ELL, 0xEB00000000656C69);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6F69736E65747845, 0xEA0000000000736ELL);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6C6C69466F747541, 0xE800000000000000);
  v5 = sub_100006014(&qword_10005DD18);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100047410;
  *(_QWORD *)(v6 + 32) = v0;
  *(_QWORD *)(v6 + 40) = v1;
  *(_QWORD *)(v6 + 48) = v2;
  *(_QWORD *)(v6 + 56) = v3;
  *(_QWORD *)(v6 + 64) = v4;
  v7 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v6);
  return v7;
}

void sub_10003264C()
{
  qword_10005E928 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100032668()
{
  if (qword_10005C368 != -1)
    swift_once(&qword_10005C368, sub_10003264C);
  return swift_bridgeObjectRetain(qword_10005E928);
}

ValueMetadata *type metadata accessor for DeviceExpertAssistantProvider()
{
  return &type metadata for DeviceExpertAssistantProvider;
}

uint64_t sub_1000326B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v0 = type metadata accessor for _AssistantIntent(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_10002629C();
  v51 = v4;
  v5 = sub_1000268CC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002E2E4, 0, sub_10002E728, 0, &type metadata for CloseTabsModeEntity.UpdateIntent_value, v5);
  v49 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v50 = sub_10002036C();
  v51 = v7;
  v8 = sub_10001ED88();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002E82C, 0, sub_10002ED30, 0, &type metadata for SearchEngineSuggestionsEntity.UpdateIntent_value, v8);
  v48 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_100021F94();
  v51 = v9;
  v10 = sub_1000209B8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002EE78, 0, sub_10002F380, 0, &type metadata for SafariSuggestionsEntity.UpdateIntent_value, v10);
  v47 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10000A27C();
  v51 = v11;
  v12 = sub_1000071F8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002F468, 0, sub_10002F8E8, 0, &type metadata for AutoFillCreditCardEntity.UpdateIntent_value, v12);
  v46 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10000A7AC();
  v51 = v13;
  v14 = sub_100008814();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002F90C, 0, sub_10002FD80, 0, &type metadata for AutoFillContactInfoEntity.UpdateIntent_value, v14);
  v45 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_1000156B4();
  v51 = v15;
  v16 = sub_1000140AC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10002FDA4, 0, sub_1000302DC, 0, &type metadata for BlockPopUpsEntity.UpdateIntent_value, v16);
  v44 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_100034BF0();
  v51 = v17;
  v18 = sub_100032BE8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_100030300, 0, sub_100030778, 0, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v18);
  v19 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_1000288BC();
  v51 = v20;
  v21 = sub_1000273E8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10003079C, 0, sub_100030BCC, 0, &type metadata for OpenLinksInBackgroundEntity.UpdateIntent_value, v21);
  v22 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10001A3B8();
  v51 = v23;
  v24 = sub_100015D04();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_100030CC8, 0, sub_1000310F8, 0, &type metadata for SearchEngineEntity.UpdateIntent_value, v24);
  v25 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10001AAB0();
  v51 = v26;
  v27 = sub_100017404();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_100031120, 0, sub_10003154C, 0, &type metadata for PrivateSearchEngineEntity.UpdateIntent_value, v27);
  v28 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10001E0C4();
  v51 = v29;
  v30 = sub_10001D238();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_10003165C, 0, sub_100031B1C, 0, &type metadata for TabBarLayoutEntity.UpdateIntent_value, v30);
  v31 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10003B880();
  v51 = v32;
  v33 = sub_100032C2C();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_100031B60, 0, sub_100032018, 0, &type metadata for TabLayoutEntity.UpdateIntent_value, v33);
  v34 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v50 = sub_10002DEE0();
  v35 = sub_10002D0A8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v50, sub_1000320E8, 0, sub_100032520, 0, &type metadata for OpenSafariSettingDeepLinks, v35);
  v36 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v37 = sub_100006014(&qword_10005DD08);
  v38 = swift_allocObject(v37, 136, 7);
  *(_OWORD *)(v38 + 16) = xmmword_100047420;
  v39 = v48;
  *(_QWORD *)(v38 + 32) = v49;
  *(_QWORD *)(v38 + 40) = v39;
  v40 = v46;
  *(_QWORD *)(v38 + 48) = v47;
  *(_QWORD *)(v38 + 56) = v40;
  v41 = v44;
  *(_QWORD *)(v38 + 64) = v45;
  *(_QWORD *)(v38 + 72) = v41;
  *(_QWORD *)(v38 + 80) = v19;
  *(_QWORD *)(v38 + 88) = v22;
  *(_QWORD *)(v38 + 96) = v25;
  *(_QWORD *)(v38 + 104) = v28;
  *(_QWORD *)(v38 + 112) = v31;
  *(_QWORD *)(v38 + 120) = v34;
  *(_QWORD *)(v38 + 128) = v36;
  v42 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v38);
  return v42;
}

unint64_t sub_100032BE8()
{
  unint64_t result;

  result = qword_10005DCF8;
  if (!qword_10005DCF8)
  {
    result = swift_getWitnessTable(&unk_1000477E0, &type metadata for LandscapeTabBarEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DCF8);
  }
  return result;
}

unint64_t sub_100032C2C()
{
  unint64_t result;

  result = qword_10005DD00;
  if (!qword_10005DD00)
  {
    result = swift_getWitnessTable(&unk_1000481A4, &type metadata for TabLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DD00);
  }
  return result;
}

_QWORD *sub_100032C70@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100032CA8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100032CE4()
{
  unint64_t result;

  result = qword_10005DD38;
  if (!qword_10005DD38)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005DD38);
  }
  return result;
}

_QWORD *sub_100032D3C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100032D78(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_retain(v2);
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100032DB8()
{
  unint64_t result;

  result = qword_10005DDA0;
  if (!qword_10005DDA0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_10005DDA0);
  }
  return result;
}

_QWORD *sub_100032E28@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100032E64(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

_QWORD *sub_100032E98@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100032ED0(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

ValueMetadata *type metadata accessor for AutoFillCreditCardControlToggle()
{
  return &type metadata for AutoFillCreditCardControlToggle;
}

uint64_t sub_100032F18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049664, 1);
}

uint64_t sub_100032F28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100047700);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_100007D30();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD00000000000003FLL, 0x80000001000418F0, KeyPath, sub_10003332C, 0, sub_100006908, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001FLL, 0x8000000100047680);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000031, 0x8000000100041930);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_10003332C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100041970);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

uint64_t sub_100033418@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v9;
  *(_BYTE *)(a2 + 16) = v10 & 1;
  *(_QWORD *)(a2 + 24) = v11;
  return result;
}

uint64_t sub_1000334A8()
{
  return sub_1000061A8(&qword_10005DE78, &qword_10005DE80, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_1000334D4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E930);
  sub_10000AAD4(v16, (uint64_t)qword_10005E930);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003F600);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

uint64_t sub_1000336F8()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E948);
  sub_10000AAD4(v0, (uint64_t)qword_10005E948);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000018, 0x8000000100041A60);
}

uint64_t sub_100033758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E960);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E960);
  IntentDescription.init(stringLiteral:)(0xD000000000000037, 0x8000000100041A20);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_1000337E0()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100047CD8);
  qword_10005E978 = result;
  return result;
}

uint64_t sub_100033804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005DFC0);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005DFC8);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100033910, 0, 0);
}

uint64_t sub_100033910()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_100034544();
  *v1 = v0;
  v1[1] = sub_100033990;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_100033D20, 0, &type metadata for LandscapeTabBarEntity, v2);
}

uint64_t sub_100033990()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_1000339E4, 0, 0);
}

uint64_t sub_1000339E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C388 != -1)
    swift_once(&qword_10005C388, sub_1000337E0);
  v2 = qword_10005E978;
  *(_QWORD *)(v0 + 168) = qword_10005E978;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005DF98, &qword_10005DFA0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100033AE0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_100033AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_100033B60;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100033B60()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100032BE8();
  v11 = sub_1000346A8();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_100033D20, 0, v7, v6, &type metadata for LandscapeTabBarEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, &type metadata for LandscapeTabBarEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for LandscapeTabBarEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100033D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005DFD0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C388 != -1)
    swift_once(&qword_10005C388, sub_1000337E0);
  v4 = qword_10005E978;
  swift_retain(qword_10005E978);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_1000346A8();
  v7 = sub_1000061A8(&qword_10005DFD8, &qword_10005DFD0, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for LandscapeTabBarEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_100033E2C()
{
  double result;

  if (qword_10005C388 != -1)
    swift_once(&qword_10005C388, sub_1000337E0);
  *(_QWORD *)&result = swift_retain(qword_10005E978).n128_u64[0];
  return result;
}

unint64_t sub_100033E70()
{
  unint64_t result;

  result = qword_10005DE88;
  if (!qword_10005DE88)
  {
    result = swift_getWitnessTable(&unk_100047870, &type metadata for LandscapeTabBarEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DE88);
  }
  return result;
}

unint64_t sub_100033EB8()
{
  unint64_t result;

  result = qword_10005DE90;
  if (!qword_10005DE90)
  {
    result = swift_getWitnessTable(&unk_100047898, &type metadata for LandscapeTabBarEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005DE90);
  }
  return result;
}

uint64_t sub_100033EFC(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000496E0, 1) + 8);
}

uint64_t sub_100033F20(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100032BE8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100033F60@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C378, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E948, (uint64_t)sub_1000336F8, a1);
}

uint64_t sub_100033F84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C380 != -1)
    swift_once(&qword_10005C380, sub_100033758);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E960);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_100033FE4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005DFBC);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_100033804(a1, v5, v4);
}

uint64_t sub_100034048@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100034BF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10003406C()
{
  return 0xD000000000000026;
}

unint64_t sub_10003408C()
{
  unint64_t result;

  result = qword_10005DEA0;
  if (!qword_10005DEA0)
  {
    result = swift_getWitnessTable(&unk_1000478F4, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DEA0);
  }
  return result;
}

uint64_t sub_1000340D4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000340EC, 0, 0);
}

uint64_t sub_1000340EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[3] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[4] = v1;
  v0[5] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100034168, v2, v3);
}

uint64_t sub_100034168()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[3];
  swift_release(v0[5]);
  v0[6] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_1000341C4, 0, 0);
}

uint64_t sub_1000341C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 56) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100034224, v2, v3);
}

uint64_t sub_100034224()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[6];
  swift_release(v0[7]);
  v0[8] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_100034278, 0, 0);
}

uint64_t sub_100034278()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  id v5;
  unsigned __int8 v6;

  if (*(_QWORD *)(v0 + 64) == 1)
  {
    v1 = type metadata accessor for _PrebuiltAppIntentError(0);
    v2 = sub_10001B360();
    swift_allocError(v1, v2, 0, 0);
    v3 = static _UnrecoverableError.unsupportedOnDevice.getter();
    swift_willThrow(v3);
  }
  else
  {
    v4 = *(unsigned __int8 **)(v0 + 16);
    v5 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "safari_browserDefaults");
    v6 = objc_msgSend(v5, "BOOLForKey:", kShowTabBarDefaultsKey);

    *v4 = v6;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100034344(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;

  v3 = *a2;
  v4 = swift_task_alloc(dword_10005DFAC);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_10000AD94;
  *(_BYTE *)(v4 + 64) = v3;
  return swift_task_switch(sub_100034F2C, 0, 0);
}

uint64_t sub_1000343A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005DF80 + dword_10005DF80);
  v2 = (_QWORD *)swift_task_alloc(unk_10005DF84);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

unint64_t sub_100034404()
{
  unint64_t result;

  result = qword_10005DEB0;
  if (!qword_10005DEB0)
  {
    result = swift_getWitnessTable(&unk_10004792C, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DEB0);
  }
  return result;
}

uint64_t sub_100034448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_1000347C4();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000344B4()
{
  unint64_t result;

  result = qword_10005DEC0;
  if (!qword_10005DEC0)
  {
    result = swift_getWitnessTable(&unk_100047984, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DEC0);
  }
  return result;
}

unint64_t sub_1000344FC()
{
  unint64_t result;

  result = qword_10005DEC8;
  if (!qword_10005DEC8)
  {
    result = swift_getWitnessTable(&unk_1000479E4, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DEC8);
  }
  return result;
}

unint64_t sub_100034544()
{
  unint64_t result;

  result = qword_10005DED0[0];
  if (!qword_10005DED0[0])
  {
    result = swift_getWitnessTable(&unk_100047A88, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, qword_10005DED0);
  }
  return result;
}

uint64_t sub_100034588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000347C4();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000345F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_1000347C4();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100034660()
{
  unint64_t result;

  result = qword_10005DEE8;
  if (!qword_10005DEE8)
  {
    result = swift_getWitnessTable(&unk_100047A0C, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DEE8);
  }
  return result;
}

unint64_t sub_1000346A8()
{
  unint64_t result;

  result = qword_10005DEF0;
  if (!qword_10005DEF0)
  {
    result = swift_getWitnessTable(&unk_100047BD0, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DEF0);
  }
  return result;
}

unint64_t sub_1000346F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005DEF8;
  if (!qword_10005DEF8)
  {
    v1 = sub_1000060C8(qword_10005DF00);
    sub_1000346A8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005DEF8);
  }
  return result;
}

uint64_t sub_100034754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100034404();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_1000347C4()
{
  unint64_t result;

  result = qword_10005DF18;
  if (!qword_10005DF18)
  {
    result = swift_getWitnessTable(&unk_1000478B4, &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DF18);
  }
  return result;
}

uint64_t sub_100034808()
{
  uint64_t v0;

  v0 = qword_10005DE68;
  swift_bridgeObjectRetain(off_10005DE70);
  return v0;
}

unint64_t sub_100034840()
{
  unint64_t result;

  result = qword_10005DF20;
  if (!qword_10005DF20)
  {
    result = swift_getWitnessTable(&unk_100047AE0, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF20);
  }
  return result;
}

unint64_t sub_100034888()
{
  unint64_t result;

  result = qword_10005DF28;
  if (!qword_10005DF28)
  {
    result = swift_getWitnessTable(&unk_100047B18, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF28);
  }
  return result;
}

unint64_t sub_1000348D0()
{
  unint64_t result;

  result = qword_10005DF30;
  if (!qword_10005DF30)
  {
    result = swift_getWitnessTable(&unk_100047B48, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF30);
  }
  return result;
}

unint64_t sub_100034918()
{
  unint64_t result;

  result = qword_10005DF38;
  if (!qword_10005DF38)
  {
    result = swift_getWitnessTable(&unk_100047B80, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF38);
  }
  return result;
}

unint64_t sub_100034960()
{
  unint64_t result;

  result = qword_10005DF40;
  if (!qword_10005DF40)
  {
    result = swift_getWitnessTable(&unk_100047BA8, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF40);
  }
  return result;
}

unint64_t sub_1000349A8()
{
  unint64_t result;

  result = qword_10005DF48;
  if (!qword_10005DF48)
  {
    result = swift_getWitnessTable(&unk_100047C28, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF48);
  }
  return result;
}

uint64_t sub_1000349EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10000CF8C();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100034A28@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C370, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E930, (uint64_t)sub_1000334D4, a1);
}

uint64_t sub_100034A4C()
{
  return sub_1000061A8(&qword_10005DF50, &qword_10005DF58, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100034A78(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100034544();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100034AB4()
{
  unint64_t result;

  result = qword_10005DF60;
  if (!qword_10005DF60)
  {
    result = swift_getWitnessTable(&unk_100047C58, &type metadata for LandscapeTabBarEntity);
    atomic_store(result, (unint64_t *)&qword_10005DF60);
  }
  return result;
}

uint64_t sub_100034AF8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CF8C();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100034B30(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000349A8();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity.LandscapeTabBarEntityQuery()
{
  return &type metadata for LandscapeTabBarEntity.LandscapeTabBarEntityQuery;
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity()
{
  return &type metadata for LandscapeTabBarEntity;
}

ValueMetadata *type metadata accessor for LandscapeTabBarEntity.UpdateIntent_value()
{
  return &type metadata for LandscapeTabBarEntity.UpdateIntent_value;
}

uint64_t sub_100034B98()
{
  return sub_1000061A8(&qword_10005DF68, &qword_10005DF70, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100034BC4()
{
  return sub_1000061A8(&qword_10005DF78, &qword_10005DF70, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100034BF0()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100006014(&qword_10005C6F8);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C700);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100006014(&qword_10005DFB0);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x80000001000419C0);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100034544();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100006014(&qword_10005C718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000030, 0x80000001000419E0);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_100034F14(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = a1;
  return swift_task_switch(sub_100034F2C, 0, 0);
}

uint64_t sub_100034F2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[2] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[3] = v1;
  v0[4] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100034FA8, v2, v3);
}

uint64_t sub_100034FA8()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[2];
  swift_release(v0[4]);
  v0[5] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_100035004, 0, 0);
}

uint64_t sub_100035004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100035064, v2, v3);
}

uint64_t sub_100035064()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[5];
  swift_release(v0[6]);
  v0[7] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_1000350B8, 0, 0);
}

uint64_t sub_1000350B8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  if (*(_QWORD *)(v0 + 56) == 1)
  {
    v1 = type metadata accessor for _PrebuiltAppIntentError(0);
    v2 = sub_10001B360();
    swift_allocError(v1, v2, 0, 0);
    v3 = static _UnrecoverableError.unsupportedOnDevice.getter();
    swift_willThrow(v3);
  }
  else
  {
    v4 = *(unsigned __int8 *)(v0 + 64);
    v5 = (void *)objc_opt_self(NSUserDefaults);
    v6 = objc_msgSend(v5, "safari_browserDefaults");
    v7 = kShowTabBarDefaultsKey;
    objc_msgSend(v6, "setBool:forKey:", v4, kShowTabBarDefaultsKey);

    v8 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
    v9 = objc_msgSend(v5, "safari_notificationNameForUserDefaultsKey:", v7);
    objc_msgSend(v8, "postNotificationName:object:userInfo:deliverImmediately:", v9, 0, 0, 1);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000351FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000352B8, 0, 0);
}

uint64_t sub_1000352B8()
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

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005DE80);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003F600);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005DF98, &qword_10005DFA0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005DF88, 0, &unk_10005DF90, 0, &type metadata for LandscapeTabBarEntity.UpdateIntent_value, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_100035410@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t *sub_10003541C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t, __n128);
  __n128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char v35;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v29);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (int *)type metadata accessor for BookmarkItem(0);
    v10 = v9[6];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = type metadata accessor for URL(0);
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    v14(v11, v12, v13);
    v15 = v9[7];
    v16 = *(uint64_t *)((char *)a2 + v15);
    *(uint64_t *)((char *)v4 + v15) = v16;
    v17 = v9[8];
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for UUID(0);
    v21 = *(void (**)(char *, char *, uint64_t, __n128))(*(_QWORD *)(v20 - 8) + 16);
    v22 = swift_retain(v16);
    v21(v18, v19, v20, v22);
    v23 = *(int *)(a3 + 20);
    v24 = (uint64_t *)((char *)v4 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      v27 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v24, v25, v27);
      v28 = 1;
    }
    else
    {
      v30 = *v25;
      *v24 = *v25;
      swift_retain(v30);
      v28 = 0;
    }
    swift_storeEnumTagMultiPayload(v24, v26, v28);
    v31 = *(int *)(a3 + 24);
    v32 = (char *)v4 + v31;
    v33 = (char *)a2 + v31;
    v34 = *(_QWORD *)v33;
    v35 = v33[8];
    sub_10000AED4(*(_QWORD *)v33, v35);
    *(_QWORD *)v32 = v34;
    v32[8] = v35;
  }
  return v4;
}

uint64_t sub_1000355CC(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = (int *)type metadata accessor for BookmarkItem(0);
  v5 = a1 + v4[6];
  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(_QWORD *)(a1 + v4[7]));
  v7 = a1 + v4[8];
  v8 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v10 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }
  return sub_10000AF70(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 8));
}

_QWORD *sub_1000356C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t, __n128);
  __n128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char v33;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (int *)type metadata accessor for BookmarkItem(0);
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for URL(0);
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v13(v10, v11, v12);
  v14 = v8[7];
  v15 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v15;
  v16 = v8[8];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for UUID(0);
  v20 = *(void (**)(char *, char *, uint64_t, __n128))(*(_QWORD *)(v19 - 8) + 16);
  v21 = swift_retain(v15);
  v20(v17, v18, v19, v21);
  v22 = *(int *)(a3 + 20);
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
  {
    v26 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v23, v24, v26);
    v27 = 1;
  }
  else
  {
    v28 = *v24;
    *v23 = *v24;
    swift_retain(v28);
    v27 = 0;
  }
  swift_storeEnumTagMultiPayload(v23, v25, v27);
  v29 = *(int *)(a3 + 24);
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = *(_QWORD *)v31;
  v33 = v31[8];
  sub_10000AED4(*(_QWORD *)v31, v33);
  *(_QWORD *)v30 = v32;
  v30[8] = v33;
  return a1;
}

_QWORD *sub_100035848(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = (int *)type metadata accessor for BookmarkItem(0);
  v11 = v10[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v10[7];
  v16 = *(_QWORD *)((char *)a1 + v15);
  v17 = *(_QWORD *)((char *)a2 + v15);
  *(_QWORD *)((char *)a1 + v15) = v17;
  swift_retain(v17);
  swift_release(v16);
  v18 = v10[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  if (a1 != a2)
  {
    v22 = *(int *)(a3 + 20);
    v23 = (_QWORD *)((char *)a1 + v22);
    v24 = (_QWORD *)((char *)a2 + v22);
    sub_100006368((uint64_t)a1 + v22, &qword_10005CA88);
    v25 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
    {
      v26 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v23, v24, v26);
      v27 = 1;
    }
    else
    {
      v28 = *v24;
      *v23 = *v24;
      swift_retain(v28);
      v27 = 0;
    }
    swift_storeEnumTagMultiPayload(v23, v25, v27);
  }
  v29 = *(int *)(a3 + 24);
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = *(_QWORD *)v31;
  v33 = v31[8];
  sub_10000AED4(*(_QWORD *)v31, v33);
  v34 = *(_QWORD *)v30;
  v35 = v30[8];
  *(_QWORD *)v30 = v32;
  v30[8] = v33;
  sub_10000AF70(v34, v35);
  return a1;
}

_OWORD *sub_100035A00(_OWORD *a1, _OWORD *a2, uint64_t a3)
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

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (int *)type metadata accessor for BookmarkItem(0);
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_QWORD *)((char *)a1 + v7[7]) = *(_QWORD *)((char *)a2 + v7[7]);
  v12 = v7[8];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = *(int *)(a3 + 20);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_100006014(&qword_10005CA88);
  if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
  {
    v20 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload(v17, v19, 1);
  }
  else
  {
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v23[8];
  return a1;
}

_QWORD *sub_100035B44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = (int *)type metadata accessor for BookmarkItem(0);
  v11 = v10[6];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = v10[7];
  v16 = *(_QWORD *)((char *)a1 + v15);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  swift_release(v16);
  v17 = v10[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  if (a1 != a2)
  {
    v21 = *(int *)(a3 + 20);
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    sub_100006368((uint64_t)a1 + v21, &qword_10005CA88);
    v24 = sub_100006014(&qword_10005CA88);
    if (swift_getEnumCaseMultiPayload(v23, v24) == 1)
    {
      v25 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v22, v23, v25);
      swift_storeEnumTagMultiPayload(v22, v24, 1);
    }
    else
    {
      memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
  }
  v26 = *(int *)(a3 + 24);
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = *(_QWORD *)v28;
  LOBYTE(v28) = v28[8];
  v30 = *(_QWORD *)v27;
  v31 = v27[8];
  *(_QWORD *)v27 = v29;
  v27[8] = (char)v28;
  sub_10000AF70(v30, v31);
  return a1;
}

uint64_t sub_100035CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100035CD8);
}

uint64_t sub_100035CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = type metadata accessor for BookmarkItem(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100006014(&qword_10005CA98);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 > 1)
    return (v14 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_100035D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100035D90);
}

uint64_t sub_100035D90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for BookmarkItem(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_100006014(&qword_10005CA98);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24) + 8) = -(char)a2;
  return result;
}

uint64_t type metadata accessor for ReadingListWidgetCell(uint64_t a1)
{
  uint64_t result;

  result = qword_10005E038;
  if (!qword_10005E038)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ReadingListWidgetCell);
  return result;
}

void sub_100035E78(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v2 = type metadata accessor for BookmarkItem(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100035F04(319);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = "\t";
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_100035F04(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10005CB10)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10005CB10);
  }
}

uint64_t sub_100035F58(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004974C, 1);
}

uint64_t sub_100035F68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = static VerticalAlignment.top.getter();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = sub_100006014(&qword_10005E098);
  return sub_100035FB4(a1, (_OWORD *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_100035FB4@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void (*v29)(char *, _QWORD, uint64_t);
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
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t *v76;
  _QWORD *v77;
  uint64_t v78;
  int v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  _OWORD v85[10];
  _QWORD v86[2];
  char v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[27];
  _OWORD v97[3];
  _OWORD v98[9];
  int v99;
  _OWORD v100[10];
  char v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _OWORD v110[3];

  v83 = sub_100006014(&qword_10005E0A0);
  __chkstk_darwin(v83);
  v77 = (char **)((char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_100006014(&qword_10005E0A8);
  __chkstk_darwin(v5);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for Image.ResizingMode(0);
  v8 = *(_QWORD *)(v67 - 8);
  __chkstk_darwin(v67);
  v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100006014(&qword_10005E0B0);
  v71 = *(_QWORD *)(v73 - 8);
  __chkstk_darwin(v73);
  v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_100006014(&qword_10005E0B8);
  __chkstk_darwin(v69);
  v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_100006014(&qword_10005E0C0);
  __chkstk_darwin(v70);
  v72 = (uint64_t)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_100006014(&qword_10005E0C8);
  v16 = __chkstk_darwin(v68);
  v74 = (uint64_t)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v75 = (char *)&v66 - v18;
  v78 = sub_100006014(&qword_10005E0D0);
  __chkstk_darwin(v78);
  v20 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100006014(&qword_10005E0D8);
  v22 = __chkstk_darwin(v21);
  v81 = (uint64_t)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v80 = (char **)((char *)&v66 - v25);
  v82 = static HorizontalAlignment.leading.getter(v24);
  sub_100036744(a1, (uint64_t)v98);
  v101 = 1;
  *(_OWORD *)((char *)&v100[7] + 7) = v98[7];
  *(_OWORD *)((char *)&v100[6] + 7) = v98[6];
  *(_OWORD *)((char *)&v100[3] + 7) = v98[3];
  *(_OWORD *)((char *)&v100[2] + 7) = v98[2];
  *(_OWORD *)((char *)&v100[8] + 7) = v98[8];
  *(_DWORD *)((char *)&v100[9] + 7) = v99;
  *(_OWORD *)((char *)&v100[4] + 7) = v98[4];
  *(_OWORD *)((char *)&v100[5] + 7) = v98[5];
  *(_OWORD *)((char *)v100 + 7) = v98[0];
  *(_OWORD *)((char *)&v100[1] + 7) = v98[1];
  v79 = 1;
  v108 = v100[6];
  v109 = v100[7];
  v110[0] = v100[8];
  *(_OWORD *)((char *)v110 + 11) = *(_OWORD *)((char *)&v100[8] + 11);
  v104 = v100[2];
  v105 = v100[3];
  v106 = v100[4];
  v107 = v100[5];
  v102 = v100[0];
  v103 = v100[1];
  v26 = *(int *)(type metadata accessor for BookmarkItem(0) + 28);
  v76 = a1;
  v27 = *(uint64_t *)((char *)a1 + v26);
  if (v27)
  {
    v66 = v20;
    v28 = v8;
    v29 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 104);
    v30 = v67;
    v29(v10, enum case for Image.ResizingMode.stretch(_:), v67);
    swift_retain(v27);
    v31 = Image.resizable(capInsets:resizingMode:)(v10, v27, 0.0, 0.0, 0.0, 0.0);
    v32 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v10, v30);
    static WidgetAccentedRenderingMode.fullColor.getter(v32);
    v33 = type metadata accessor for WidgetAccentedRenderingMode(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v7, 0, 1, v33);
    Image.widgetAccentedRenderingMode(_:)(v7, v31);
    swift_release(v31);
    v34 = sub_100006368((uint64_t)v7, &qword_10005E0A8);
    v35 = static Alignment.center.getter(v34);
    _FrameLayout.init(width:height:alignment:)(v97, 0x4048000000000000, 0, 0x4048000000000000, 0, v35, v36);
    v37 = v71;
    v38 = v73;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v14, v12, v73);
    v39 = &v14[*(int *)(v69 + 36)];
    v40 = v97[1];
    *(_OWORD *)v39 = v97[0];
    *((_OWORD *)v39 + 1) = v40;
    *((_OWORD *)v39 + 2) = v97[2];
    (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
    v41 = v72;
    sub_100006314((uint64_t)v14, v72, &qword_10005E0B8);
    *(_WORD *)(v41 + *(int *)(v70 + 36)) = 256;
    v42 = sub_100006368((uint64_t)v14, &qword_10005E0B8);
    v43 = static Alignment.center.getter(v42);
    v45 = v44;
    v46 = (uint64_t)v75;
    v47 = (uint64_t)&v75[*(int *)(v68 + 36)];
    sub_1000369E8((uint64_t)v76, v47);
    v48 = (uint64_t *)(v47 + *(int *)(sub_100006014(&qword_10005E0F0) + 36));
    *v48 = v43;
    v48[1] = v45;
    sub_1000123B0(v41, v46, &qword_10005E0C0);
    v49 = v74;
    sub_100006314(v46, v74, &qword_10005E0C8);
    v50 = (uint64_t)v77;
    *v77 = 0;
    *(_BYTE *)(v50 + 8) = 1;
    v51 = sub_100006014(&qword_10005E0F8);
    sub_100006314(v49, v50 + *(int *)(v51 + 48), &qword_10005E0C8);
    sub_100006368(v49, &qword_10005E0C8);
    v52 = (uint64_t)v66;
    sub_100006314(v50, (uint64_t)v66, &qword_10005E0A0);
    swift_storeEnumTagMultiPayload(v52, v78, 0);
    v53 = sub_1000061A8(&qword_10005E0E0, &qword_10005E0A0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v54 = v80;
    _ConditionalContent<>.init(storage:)(v80, v52, v83, &type metadata for Spacer, v53, &protocol witness table for Spacer);
    swift_release(v27);
    sub_100006368(v50, &qword_10005E0A0);
    sub_100006368(v46, &qword_10005E0C8);
  }
  else
  {
    *(_QWORD *)v20 = 0;
    v20[8] = 0;
    swift_storeEnumTagMultiPayload(v20, v78, 1);
    v55 = sub_1000061A8(&qword_10005E0E0, &qword_10005E0A0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v54 = v80;
    _ConditionalContent<>.init(storage:)(v80, v20, v83, &type metadata for Spacer, v55, &protocol witness table for Spacer);
  }
  v56 = v81;
  sub_100006314((uint64_t)v54, v81, &qword_10005E0D8);
  v57 = v82;
  v84 = (unint64_t)v82;
  v58 = v79;
  LOBYTE(v85[0]) = v79;
  *(_OWORD *)((char *)&v85[7] + 1) = v109;
  *(_OWORD *)((char *)&v85[6] + 1) = v108;
  *(_OWORD *)((char *)&v85[8] + 1) = v110[0];
  *(_OWORD *)((char *)&v85[8] + 12) = *(_OWORD *)((char *)v110 + 11);
  *(_OWORD *)((char *)&v85[2] + 1) = v104;
  *(_OWORD *)((char *)&v85[3] + 1) = v105;
  *(_OWORD *)((char *)&v85[4] + 1) = v106;
  *(_OWORD *)((char *)&v85[5] + 1) = v107;
  *(_OWORD *)((char *)v85 + 1) = v102;
  *(_OWORD *)((char *)&v85[1] + 1) = v103;
  v59 = v85[8];
  a2[8] = v85[7];
  a2[9] = v59;
  *(_OWORD *)((char *)a2 + 156) = *(_OWORD *)((char *)&v85[8] + 12);
  v60 = v85[4];
  a2[4] = v85[3];
  a2[5] = v60;
  v61 = v85[6];
  a2[6] = v85[5];
  a2[7] = v61;
  v62 = v85[0];
  *a2 = v84;
  a2[1] = v62;
  v63 = v85[2];
  a2[2] = v85[1];
  a2[3] = v63;
  v64 = sub_100006014(&qword_10005E0E8);
  sub_100006314(v56, (uint64_t)a2 + *(int *)(v64 + 48), &qword_10005E0D8);
  sub_100011D24((uint64_t)&v84);
  sub_100006368((uint64_t)v54, &qword_10005E0D8);
  sub_100006368(v56, &qword_10005E0D8);
  v94 = v108;
  v95 = v109;
  *(_OWORD *)v96 = v110[0];
  *(_OWORD *)&v96[11] = *(_OWORD *)((char *)v110 + 11);
  v90 = v104;
  v91 = v105;
  v92 = v106;
  v93 = v107;
  v88 = v102;
  v86[0] = v57;
  v86[1] = 0;
  v87 = v58;
  v89 = v103;
  return sub_100011DE8((uint64_t)v86);
}

uint64_t sub_100036744@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
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
  int v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;

  v4 = a1[1];
  v34 = *a1;
  v35 = v4;
  v5 = sub_1000062D0();
  swift_bridgeObjectRetain(v4);
  v6 = Text.init<A>(_:)(&v34, &type metadata for String, v5);
  v8 = v7;
  v10 = v9;
  v33 = v11;
  KeyPath = swift_getKeyPath(&unk_100047D80);
  if (qword_10005C1D8 != -1)
    swift_once(&qword_10005C1D8, sub_100005850);
  v12 = qword_10005E558;
  static Font.Weight.semibold.getter();
  v31 = Font.weight(_:)(v12);
  v13 = swift_getKeyPath(&unk_100047DB0);
  v14 = a1[3];
  v34 = a1[2];
  v35 = v14;
  swift_bridgeObjectRetain(v14);
  v15 = Text.init<A>(_:)(&v34, &type metadata for String, v5);
  v29 = v16;
  v30 = v15;
  v18 = v17;
  v20 = v19;
  v21 = swift_getKeyPath(&unk_100047D80);
  if (qword_10005C1D0 != -1)
    swift_once(&qword_10005C1D0, sub_100005834);
  v22 = v18 & 1;
  v23 = v10 & 1;
  v24 = qword_10005E550;
  v25 = swift_getKeyPath(&unk_100047DB0);
  swift_retain(v24);
  v27 = static HierarchicalShapeStyle.secondary.getter(v26);
  LOBYTE(v34) = v23;
  v38 = 0;
  v37 = v22;
  v36 = 0;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v33;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 2;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = v13;
  *(_QWORD *)(a2 + 64) = v31;
  *(_QWORD *)(a2 + 72) = v30;
  *(_QWORD *)(a2 + 80) = v29;
  *(_BYTE *)(a2 + 88) = v22;
  *(_QWORD *)(a2 + 96) = v20;
  *(_QWORD *)(a2 + 104) = v21;
  *(_QWORD *)(a2 + 112) = 1;
  *(_BYTE *)(a2 + 120) = 0;
  *(_QWORD *)(a2 + 128) = v25;
  *(_QWORD *)(a2 + 136) = v24;
  *(_DWORD *)(a2 + 144) = v27;
  sub_100006358(v6, v8, v23);
  swift_bridgeObjectRetain(v33);
  swift_retain(KeyPath);
  swift_retain(v13);
  swift_retain(v31);
  sub_100006358(v30, v29, v22);
  swift_bridgeObjectRetain(v20);
  swift_retain(v21);
  swift_retain(v25);
  swift_retain(v24);
  sub_1000063A4(v30, v29, v22);
  swift_release(v24);
  swift_release(v25);
  swift_release(v21);
  swift_bridgeObjectRelease(v20);
  sub_1000063A4(v6, v8, v23);
  swift_release(v31);
  swift_release(v13);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v33);
}

uint64_t sub_1000369E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  double v20;
  _QWORD *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  char v30;
  void (*v31)(char *, uint64_t);
  unsigned int *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  double v47[6];

  v46 = a2;
  v3 = type metadata accessor for _BlendModeEffect(0);
  __chkstk_darwin(v3);
  v45 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ColorScheme(0);
  v42 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v39 - v9;
  v11 = type metadata accessor for BlendMode(0);
  v43 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_100006014(&qword_10005E100);
  __chkstk_darwin(v41);
  v15 = (double *)((char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_10005C1C0 != -1)
    swift_once(&qword_10005C1C0, sub_1000057C4);
  v16 = qword_10005E540;
  v17 = a1 + *(int *)(type metadata accessor for ReadingListWidgetCell(0) + 24);
  v18 = *(_QWORD *)v17;
  v19 = *(_BYTE *)(v17 + 8);
  swift_retain(v16);
  sub_10000AED4(v18, v19);
  v20 = sub_100013644(v18, v19);
  sub_10000AF70(v18, v19);
  v21 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v47, 0, 0, _swiftEmptyArrayStorage, v20, 10.0, 0.0);
  v22 = v47[0];
  v23 = v47[2];
  v24 = v47[3];
  v25 = v47[4];
  v26 = static Alignment.center.getter(v21);
  v39 = v27;
  v40 = v26;
  sub_1000135E4((uint64_t)v10);
  v28 = v42;
  v29 = v47[1];
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v8, enum case for ColorScheme.dark(_:), v5);
  v30 = static ColorScheme.== infix(_:_:)(v10, v8);
  v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  v31(v8, v5);
  v31(v10, v5);
  v32 = (unsigned int *)&enum case for BlendMode.lighten(_:);
  v34 = v43;
  v33 = v44;
  if ((v30 & 1) == 0)
    v32 = (unsigned int *)&enum case for BlendMode.darken(_:);
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v13, *v32, v44);
  v35 = v47[0] * 0.5;
  v36 = (uint64_t)v45;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v45, v13, v33);
  sub_100036ED4(v36, (uint64_t)v15 + *(int *)(v41 + 36));
  *v15 = v35;
  v15[1] = v22;
  v15[2] = v29;
  v15[3] = v23;
  v15[4] = v24;
  v15[5] = v25;
  *((_QWORD *)v15 + 6) = v16;
  *((_WORD *)v15 + 28) = 256;
  v37 = v39;
  *((_QWORD *)v15 + 8) = v40;
  *((_QWORD *)v15 + 9) = v37;
  swift_bridgeObjectRetain(*(_QWORD *)&v24);
  swift_retain(v16);
  sub_100036F18(v36);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v33);
  swift_release(v16);
  swift_bridgeObjectRelease(*(_QWORD *)&v24);
  return sub_1000123B0((uint64_t)v15, v46, &qword_10005E100);
}

uint64_t sub_100036D40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  _BYTE v20[16];
  uint64_t v21;
  _OWORD v22[3];

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100006014(&qword_10005E078);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for BookmarkItem(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(v11 + 24), v3);
  v21 = v1;
  v12 = sub_100006014(&qword_10005E080);
  v13 = sub_1000061A8(&qword_10005E088, &qword_10005E080, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v14 = Link.init(destination:label:)(v6, sub_100036ECC, v20, v12, v13);
  v15 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(v22, 0, 1, 0x4048000000000000, 0, v15, v16);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 16))(a1, v10, v7);
  v17 = (_OWORD *)(a1 + *(int *)(sub_100006014(&qword_10005E090) + 36));
  v18 = v22[1];
  *v17 = v22[0];
  v17[1] = v18;
  v17[2] = v22[2];
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100036ECC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100035F68(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_100036ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _BlendModeEffect(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100036F18(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _BlendModeEffect(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100036F68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E108;
  if (!qword_10005E108)
  {
    v1 = sub_1000060C8(&qword_10005E090);
    sub_1000061A8(&qword_10005E110, &qword_10005E078, (uint64_t)&protocol conformance descriptor for Link<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005E108);
  }
  return result;
}

uint64_t destroy for ReadingListWidgetContentUnavailableView(uint64_t a1)
{
  return sub_10000AF70(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t _s21SafariWidgetExtension39ReadingListWidgetContentUnavailableViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10000AED4(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t assignWithCopy for ReadingListWidgetContentUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_10000AED4(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10000AF70(v6, v7);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t initializeWithTake for ReadingListWidgetContentUnavailableView(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ReadingListWidgetContentUnavailableView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_10000AF70(v6, v7);
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetContentUnavailableView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 10))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ReadingListWidgetContentUnavailableView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetContentUnavailableView()
{
  return &type metadata for ReadingListWidgetContentUnavailableView;
}

uint64_t sub_1000371A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000497AC, 1);
}

void sub_1000371B4(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  char v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t KeyPath;
  int v24;
  char v25;
  char v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = HIBYTE(a2);
  v6 = a2 & 1;
  v34 = static HorizontalAlignment.center.getter(a1);
  v7 = sub_100037464(v3 & 1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (qword_10005C1D8 != -1)
    swift_once(&qword_10005C1D8, sub_100005850);
  v14 = qword_10005E558;
  static Font.Weight.semibold.getter();
  v15 = Font.weight(_:)(v14);
  v16 = v11 & 1;
  v32 = Text.font(_:)(v15, v7, v9, v16, v13);
  v33 = v17;
  v19 = v18;
  v21 = v20;
  swift_release(v15);
  sub_1000063A4(v7, v9, v16);
  swift_bridgeObjectRelease(v13);
  sub_10000AED4(a1, v6);
  v22 = sub_100013224(a1, v6);
  sub_10000AF70(a1, v6);
  KeyPath = swift_getKeyPath(&unk_100047E68);
  v24 = static HierarchicalShapeStyle.tertiary.getter();
  v25 = static Edge.Set.all.getter();
  sub_10000AED4(a1, v6);
  v26 = sub_100013224(a1, v6);
  v27 = sub_10000AF70(a1, v6);
  v28.n128_u64[0] = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  if ((v26 & 1) == 0)
    v28.n128_f64[0] = EdgeInsets.init(_all:)(v27, v28);
  *(_QWORD *)a3 = v34;
  *(_QWORD *)(a3 + 8) = 0x4010000000000000;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = v32;
  *(_QWORD *)(a3 + 32) = v19;
  *(_BYTE *)(a3 + 40) = v21 & 1;
  *(_QWORD *)(a3 + 48) = v33;
  *(_QWORD *)(a3 + 56) = KeyPath;
  *(_BYTE *)(a3 + 64) = v22 & 1;
  *(_DWORD *)(a3 + 68) = v24;
  *(_BYTE *)(a3 + 72) = v25;
  *(_QWORD *)(a3 + 80) = v28.n128_u64[0];
  *(_QWORD *)(a3 + 88) = v29;
  *(_QWORD *)(a3 + 96) = v30;
  *(_QWORD *)(a3 + 104) = v31;
  *(_BYTE *)(a3 + 112) = v26 & 1;
}

BOOL sub_100037378(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100037390()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000373D4()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000373FC(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10003743C(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 9))
    v2 = 256;
  else
    v2 = 0;
  sub_1000371B4(*(_QWORD *)v1, v2 | *(unsigned __int8 *)(v1 + 8), a1);
}

uint64_t sub_100037464(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v14[2];

  v2 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v6 = 0x67756163206C6C41;
    v7 = 0xEE00217075207468;
  }
  else
  {
    v6 = 0x736D657449206F4ELL;
    v7 = 0xE800000000000000;
  }
  WBSLocalizedStringLiteral.init(stringLiteral:)(v6, v7);
  v8 = WBSLookUpLocalizedString(_:dsohandle:)(v5, &_mh_execute_header);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v14[0] = v8;
  v14[1] = v10;
  v11 = sub_1000062D0();
  return Text.init<A>(_:)(v14, &type metadata for String, v11);
}

uint64_t sub_10003755C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100037584(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t storeEnumTagSinglePayload for ReadingListWidgetContentUnavailableView.Variant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000375F4 + 4 * byte_100047DE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100037628 + 4 * byte_100047DE0[v4]))();
}

uint64_t sub_100037628(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100037630(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100037638);
  return result;
}

uint64_t sub_100037644(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10003764CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100037650(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100037658(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReadingListWidgetContentUnavailableView.Variant()
{
  return &type metadata for ReadingListWidgetContentUnavailableView.Variant;
}

unint64_t sub_100037678()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E118;
  if (!qword_10005E118)
  {
    v1 = sub_1000060C8(&qword_10005E120);
    sub_1000376E4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005E118);
  }
  return result;
}

unint64_t sub_1000376E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E128;
  if (!qword_10005E128)
  {
    v1 = sub_1000060C8(&qword_10005E130);
    sub_1000061A8(&qword_10005E138, &qword_10005E140, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_1000061A8(&qword_10005CC18, &qword_10005CC20, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10005E128);
  }
  return result;
}

unint64_t sub_100037784()
{
  unint64_t result;

  result = qword_10005E148;
  if (!qword_10005E148)
  {
    result = swift_getWitnessTable(&unk_100047EE0, &type metadata for ReadingListWidgetContentUnavailableView.Variant);
    atomic_store(result, (unint64_t *)&qword_10005E148);
  }
  return result;
}

uint64_t sub_1000377CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_10003780C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  char v15;

  v4 = *a1;
  v5 = a1[1];
  v6 = v4 == *a2 && v5 == a2[1];
  if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5) & 1) != 0)
  {
    v7 = a1[2];
    v8 = a1[3];
    v9 = v7 == a2[2] && v8 == a2[3];
    if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8) & 1) != 0)
    {
      v10 = (int *)type metadata accessor for BookmarkItem(0);
      if ((static URL.== infix(_:_:)((char *)a1 + v10[6], (char *)a2 + v10[6]) & 1) != 0)
      {
        v11 = v10[7];
        v12 = *(uint64_t *)((char *)a1 + v11);
        v13 = *(_QWORD *)((char *)a2 + v11);
        if (v12)
        {
          if (v13)
          {
            swift_retain(*(_QWORD *)((char *)a2 + v11));
            v14 = swift_retain(v12);
            v15 = static Image.== infix(_:_:)(v14);
            swift_release(v12);
            swift_release(v13);
            if ((v15 & 1) != 0)
              return static UUID.== infix(_:_:)((char *)a1 + v10[8], (char *)a2 + v10[8]);
          }
        }
        else if (!v13)
        {
          return static UUID.== infix(_:_:)((char *)a1 + v10[8], (char *)a2 + v10[8]);
        }
      }
    }
  }
  return 0;
}

uint64_t sub_10003790C(int64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  BOOL v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v2 = sub_100006014(&qword_10005CB58);
  __chkstk_darwin(v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for BookmarkItem(0);
  v22 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 1)
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    v23 = &_swiftEmptyArrayStorage;
    result = sub_10002D58C(0, a1, 0);
    v9 = 0;
    v10 = 1;
    v11 = v23;
    v20 = 0x8000000100041AF0;
    v21 = 0x8000000100041A80;
    v12 = a1;
    while (!v9)
    {
      URL.init(string:)(0xD00000000000006CLL, v21);
      v13 = type metadata accessor for URL(0);
      v14 = *(_QWORD *)(v13 - 8);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v15 = Image.init(systemName:)(0x697261666173, 0xE600000000000000);
      UUID.init()();
      *(_QWORD *)v8 = 0x1000000000000049;
      *((_QWORD *)v8 + 1) = v20;
      *((_QWORD *)v8 + 2) = 0x6F632E656C707061;
      *((_QWORD *)v8 + 3) = 0xE90000000000006DLL;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v8[*(int *)(v5 + 24)], v4, v13);
      *(_QWORD *)&v8[*(int *)(v5 + 28)] = v15;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
      v23 = v11;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_10002D58C(0, v11[2] + 1, 1);
        v11 = v23;
      }
      v18 = v11[2];
      v17 = v11[3];
      if (v18 >= v17 >> 1)
      {
        sub_10002D58C(v17 > 1, v18 + 1, 1);
        v11 = v23;
      }
      v11[2] = v18 + 1;
      result = sub_10000E5C8((uint64_t)v8, (uint64_t)v11+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(_QWORD *)(v22 + 72) * v18);
      v9 = v10 == a1;
      if (v10 == a1)
      {
        v10 = 0;
      }
      else if (__OFADD__(v10++, 1))
      {
        __break(1u);
        goto LABEL_16;
      }
      if (!--v12)
        return 0;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BookmarkItem(uint64_t a1)
{
  uint64_t result;

  result = qword_10005E1A8;
  if (!qword_10005E1A8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BookmarkItem);
  return result;
}

uint64_t *sub_100037BE0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v21);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for URL(0);
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
    v14 = a3[7];
    v15 = a3[8];
    v16 = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = v16;
    v17 = (char *)v4 + v15;
    v18 = (char *)a2 + v15;
    v19 = type metadata accessor for UUID(0);
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    swift_retain(v16);
    v20(v17, v18, v19);
  }
  return v4;
}

uint64_t sub_100037CE4(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + a2[6];
  v5 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release(*(_QWORD *)(a1 + a2[7]));
  v6 = a1 + a2[8];
  v7 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_100037D6C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v12(v9, v10, v11);
  v13 = a3[7];
  v14 = a3[8];
  v15 = *(_QWORD *)((char *)a2 + v13);
  *(_QWORD *)((char *)a1 + v13) = v15;
  v16 = (char *)a1 + v14;
  v17 = (char *)a2 + v14;
  v18 = type metadata accessor for UUID(0);
  v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_retain(v15);
  v19(v16, v17, v18);
  return a1;
}

_QWORD *sub_100037E44(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[7];
  v15 = *(_QWORD *)((char *)a1 + v14);
  v16 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v16;
  swift_retain(v16);
  swift_release(v15);
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

_OWORD *sub_100037F30(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

_QWORD *sub_100037FD0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[7];
  v15 = *(_QWORD *)((char *)a1 + v14);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  swift_release(v15);
  v16 = a3[8];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = type metadata accessor for UUID(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_100038094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000380A0);
}

uint64_t sub_1000380A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for URL(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = type metadata accessor for UUID(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_100038140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003814C);
}

uint64_t sub_10003814C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v8 = type metadata accessor for URL(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = type metadata accessor for UUID(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_1000381E8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[5];

  v5[0] = &unk_100047F40;
  v5[1] = &unk_100047F40;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v5[2] = *(_QWORD *)(result - 8) + 64;
    v5[3] = &unk_100047F58;
    result = type metadata accessor for UUID(319);
    if (v4 <= 0x3F)
    {
      v5[4] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 5, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for ReadingListWidgetData(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t assignWithCopy for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for ReadingListWidgetData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReadingListWidgetData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReadingListWidgetData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReadingListWidgetData()
{
  return &type metadata for ReadingListWidgetData;
}

unint64_t sub_1000383CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E1F0;
  if (!qword_10005E1F0)
  {
    v1 = type metadata accessor for UUID(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store(result, (unint64_t *)&qword_10005E1F0);
  }
  return result;
}

uint64_t sub_100038418()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v3;
  unint64_t v4;
  uint64_t inited;
  unint64_t *v6;

  v0 = type metadata accessor for ReadingListWidgetWebBookmarksDataSource();
  v3 = 0xD000000000000011;
  v4 = 0x8000000100041B40;
  inited = swift_initStaticObject(v0, &unk_10005C3C8);
  v6 = &v3;
  sub_100038490((uint64_t **)&v6);
  v1 = v4;
  swift_release(inited);
  return swift_bridgeObjectRelease(v1);
}

uint64_t sub_100038490(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  v1 = *a1;
  v3 = **a1;
  v2 = (*a1)[1];
  v4 = v1[2];
  v7[0] = v3;
  v7[1] = v2;
  v7[2] = v4;
  swift_bridgeObjectRetain(v2);
  swift_retain(v4);
  v5 = sub_100006014(&qword_10005E200);
  return TupleWidget.init(_:)(v7, v5);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100038528();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100038528()
{
  unint64_t result;

  result = qword_10005E1F8;
  if (!qword_10005E1F8)
  {
    result = swift_getWitnessTable(&unk_100048004, &type metadata for SafariWidgets);
    atomic_store(result, (unint64_t *)&qword_10005E1F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariWidgets()
{
  return &type metadata for SafariWidgets;
}

uint64_t sub_10003857C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049854, 1);
}

unint64_t sub_100038590()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E208;
  if (!qword_10005E208)
  {
    v1 = sub_1000060C8(&qword_10005E210);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005E208);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenLinksInBackgroundControlToggle()
{
  return &type metadata for OpenLinksInBackgroundControlToggle;
}

uint64_t sub_1000385EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100049898, 1);
}

uint64_t sub_1000385FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t OpaqueTypeConformance2;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
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
  void *v52;
  uint64_t v53;
  unint64_t v54;
  _QWORD v55[2];

  v50 = a1;
  v1 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006014(&qword_10005C440);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_100006014(&qword_10005C448);
  v45 = *(_QWORD *)(v42 - 8);
  __chkstk_darwin(v42);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005C450);
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006014(&qword_10005C458);
  v14 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  v49 = v14;
  __chkstk_darwin(v13);
  v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000480B8);
  v17 = sub_100006014(&qword_10005C460);
  v18 = sub_100028BE0();
  v19 = sub_1000061A8(&qword_10005C470, &qword_10005C460, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F>(kind:intentUpdatableProperty:content:value:)(0xD000000000000042, 0x8000000100041B60, KeyPath, sub_1000389FC, 0, sub_100038AE0, 0, v17, &type metadata for Text, v18, v19, &protocol witness table for Text);
  v20 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000022, 0x8000000100048030);
  v22 = v21;
  LOBYTE(v18) = v23;
  v25 = v24;
  v26 = sub_1000061A8(&qword_10005C478, &qword_10005C440, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v20, v22, v18 & 1, v25, v4, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v4);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0xD000000000000022, 0x8000000100041BB0);
  v27 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v3, v44);
  v51 = v27;
  v52 = v29;
  v55[0] = v4;
  v55[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v55, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = sub_1000062D0();
  v32 = v42;
  WidgetConfiguration.description<A>(_:)(&v51, v42, &type metadata for String, OpaqueTypeConformance2, v31);
  swift_bridgeObjectRelease(v29);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v32);
  v51 = v32;
  v52 = &type metadata for String;
  v53 = OpaqueTypeConformance2;
  v54 = v31;
  v33 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v34 = v41;
  v35 = v46;
  WidgetConfiguration.disablesControlStateCaching()(v46, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v35);
  v51 = v35;
  v52 = (void *)v33;
  v36 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v37 = v48;
  WidgetConfiguration.hiddenControl()(v48, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v34, v37);
}

uint64_t sub_1000389FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WBSLocalizedStringLiteral.init(stringLiteral:)(0x6E694C206E65704FLL, 0xEA0000000000736BLL);
  v4 = WBSLookUpLocalizedString(_:dsohandle:)(v3, &_mh_execute_header);
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_1000062D0();
  return Label<>.init<A>(_:systemImage:)(v9, 0x697261666173, 0xE600000000000000, &type metadata for String, v7);
}

uint64_t sub_100038AE0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD v18[2];

  v4 = type metadata accessor for WBSLocalizedStringLiteral(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v8 = 0x676B636142206E49;
    v9 = 0xED0000646E756F72;
  }
  else
  {
    v8 = 0x542077654E206E49;
    v9 = 0xEA00000000006261;
  }
  WBSLocalizedStringLiteral.init(stringLiteral:)(v8, v9);
  v10 = WBSLookUpLocalizedString(_:dsohandle:)(v7, &_mh_execute_header);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18[0] = v10;
  v18[1] = v12;
  v13 = sub_1000062D0();
  result = Text.init<A>(_:)(v18, &type metadata for String, v13);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = v16 & 1;
  *(_QWORD *)(a2 + 24) = v17;
  return result;
}

uint64_t sub_100038BF4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6D6F74746F62;
  else
    v3 = 7368564;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6D6F74746F62;
  else
    v5 = 7368564;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

uint64_t sub_100038C8C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x54746361706D6F63;
  else
    v3 = 0x6574617261706573;
  if (v2)
    v4 = 0xEE00726142626154;
  else
    v4 = 0xED00007261426261;
  if ((a2 & 1) != 0)
    v5 = 0x54746361706D6F63;
  else
    v5 = 0x6574617261706573;
  if ((a2 & 1) != 0)
    v6 = 0xED00007261426261;
  else
    v6 = 0xEE00726142626154;
  if (v3 == v5 && v4 == v6)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_100038D48(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100038D98(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100038DF4 + 4 * byte_1000480E4[a2]))(0x796144656E6FLL);
}

uint64_t sub_100038DF4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x796144656E6FLL && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE600000000000000);
  return v2 & 1;
}

uint64_t sub_100038E94()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, qword_10005E980);
  sub_10000AAD4(v16, (uint64_t)qword_10005E980);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x6F79616C20626154, 0xEA00000000007475);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000018, 0x800000010003F360, v8, v5, "App Entity title for 'Tab' configuration setting for Safari setting on iPad", 75, 2);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_1000390C0()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AAEC(v0, qword_10005E998);
  sub_10000AAD4(v0, (uint64_t)qword_10005E998);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000027, 0x8000000100041D10);
}

uint64_t sub_100039120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100006014(&qword_10005C788);
  sub_10000AAEC(v0, qword_10005E9B0);
  v1 = sub_10000AAD4(v0, (uint64_t)qword_10005E9B0);
  IntentDescription.init(stringLiteral:)(0xD000000000000030, 0x8000000100041CD0);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_1000391A8()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100048978);
  qword_10005E9C8 = result;
  return result;
}

uint64_t sub_1000391CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100006014(&qword_10005C758);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005C760);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006014(&qword_10005E3C8);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100006014(&qword_10005E3D0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_1000392D8, 0, 0);
}

uint64_t sub_1000392D8()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10003ADB0();
  *v1 = v0;
  v1[1] = sub_100039358;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_1000396E8, 0, &type metadata for TabLayoutEntity, v2);
}

uint64_t sub_100039358()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_1000393AC, 0, 0);
}

uint64_t sub_1000393AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10005C3A8 != -1)
    swift_once(&qword_10005C3A8, sub_1000391A8);
  v2 = qword_10005E9C8;
  *(_QWORD *)(v0 + 168) = qword_10005E9C8;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_1000061A8(&qword_10005E3A0, &qword_10005E3A8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_1000394A8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for TabLayoutConfigurationType, v5);
}

uint64_t sub_1000394A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_10000784C;
  else
    v5 = sub_100039528;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100039528()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100032C2C();
  v11 = sub_10003AE40();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_1000396E8, 0, v7, v6, &type metadata for TabLayoutEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for TabLayoutEntity.UpdateIntent_value, &type metadata for TabLayoutEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for TabLayoutEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000396EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100006014(&qword_10005E3D8);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10005C3A8 != -1)
    swift_once(&qword_10005C3A8, sub_1000391A8);
  v4 = qword_10005E9C8;
  swift_retain(qword_10005E9C8);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10003AE40();
  v7 = sub_1000061A8(&qword_10005E3E0, &qword_10005E3D8, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for TabLayoutEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1000397F4()
{
  double result;

  if (qword_10005C3A8 != -1)
    swift_once(&qword_10005C3A8, sub_1000391A8);
  *(_QWORD *)&result = swift_retain(qword_10005E9C8).n128_u64[0];
  return result;
}

uint64_t sub_100039834@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C398, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E998, (uint64_t)sub_1000390C0, a1);
}

uint64_t sub_100039858@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C3A0 != -1)
    swift_once(&qword_10005C3A0, sub_100039120);
  v2 = sub_100006014(&qword_10005C788);
  v3 = sub_10000AAD4(v2, (uint64_t)qword_10005E9B0);
  return sub_10000AD4C(v3, a1);
}

uint64_t sub_1000398B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005E3C4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AD94;
  return sub_1000391CC(a1, v5, v4);
}

uint64_t sub_10003991C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10003B880();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100039940()
{
  return 0xD000000000000020;
}

uint64_t sub_10003995C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100039974, 0, 0);
}

uint64_t sub_100039974()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[3] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[4] = v1;
  v0[5] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000399F0, v2, v3);
}

uint64_t sub_1000399F0()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[3];
  swift_release(v0[5]);
  v0[6] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_100039A4C, 0, 0);
}

uint64_t sub_100039A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 56) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100039AAC, v2, v3);
}

uint64_t sub_100039AAC()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[6];
  swift_release(v0[7]);
  v0[8] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_100039B00, 0, 0);
}

uint64_t sub_100039B00()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (*(_QWORD *)(v0 + 64))
  {
    v1 = *(_BYTE **)(v0 + 16);
    v2 = (void *)SFEnableStandaloneTabBarKey;
    v3 = (void *)objc_opt_self(NSUserDefaults);
    v4 = v2;
    v5 = objc_msgSend(v3, "safari_browserDefaults");
    v6 = objc_msgSend(v5, "BOOLForKey:", v4);

    *v1 = v6 ^ 1;
  }
  else
  {
    v7 = type metadata accessor for _PrebuiltAppIntentError(0);
    v8 = sub_10001B360();
    swift_allocError(v7, v8, 0, 0);
    v9 = static _UnrecoverableError.unsupportedOnDevice.getter();
    swift_willThrow(v9);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100039BEC(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 64) = *a2;
  return swift_task_switch(sub_100039C08, 0, 0);
}

uint64_t sub_100039C08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[2] = objc_opt_self(UIDevice);
  v1 = type metadata accessor for MainActor(0);
  v0[3] = v1;
  v0[4] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100039C84, v2, v3);
}

uint64_t sub_100039C84()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[2];
  swift_release(v0[4]);
  v0[5] = objc_msgSend(v1, "currentDevice");
  return swift_task_switch(sub_100039CE0, 0, 0);
}

uint64_t sub_100039CE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100039D40, v2, v3);
}

uint64_t sub_100039D40()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[5];
  swift_release(v0[6]);
  v0[7] = objc_msgSend(v1, "userInterfaceIdiom");

  return swift_task_switch(sub_100039D94, 0, 0);
}

uint64_t sub_100039D94()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  if (*(_QWORD *)(v0 + 56))
  {
    v1 = 0xEE00726142626154;
    v2 = (void *)SFEnableStandaloneTabBarKey;
    if ((*(_BYTE *)(v0 + 64) & 1) != 0)
    {
      v3 = _stringCompareWithSmolCheck(_:_:expecting:)(0x54746361706D6F63, 0xED00007261426261);
      v1 = 0xED00007261426261;
    }
    else
    {
      v3 = 1;
    }
    v8 = v2;
    swift_bridgeObjectRelease(v1);
    v9 = (void *)objc_opt_self(NSUserDefaults);
    v10 = objc_msgSend(v9, "safari_browserDefaults");
    objc_msgSend(v10, "setBool:forKey:", v3 & 1, v8);

    v11 = objc_msgSend((id)objc_opt_self(NSDistributedNotificationCenter), "defaultCenter");
    v12 = objc_msgSend(v9, "safari_notificationNameForUserDefaultsKey:", v8);

    objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", v12, 0, 0, 1);
    v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v4 = type metadata accessor for _PrebuiltAppIntentError(0);
    v5 = sub_10001B360();
    swift_allocError(v4, v5, 0, 0);
    v6 = static _UnrecoverableError.unsupportedOnDevice.getter();
    swift_willThrow(v6);
    v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v7();
}

uint64_t sub_100039F68(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005E388 + dword_10005E388);
  v2 = (_QWORD *)swift_task_alloc(unk_10005E38C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000ADAC;
  return v4();
}

uint64_t sub_100039FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10003AEF0();
  *v4 = v2;
  v4[1] = sub_100007FCC;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_10003A02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10003AEF0();
  *v5 = v2;
  v5[1] = sub_100008170;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10003A098(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10003AEF0();
  *v4 = v2;
  v4[1] = sub_10000ADAC;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

uint64_t sub_10003A100(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10003ACD8();
  *v5 = v2;
  v5[1] = sub_100008354;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10003A16C()
{
  uint64_t v0;

  v0 = qword_10005E218;
  swift_bridgeObjectRetain(off_10005E220);
  return v0;
}

uint64_t sub_10003A1A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100024164();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10003A1DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C390, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005E980, (uint64_t)sub_100038E94, a1);
}

uint64_t sub_10003A200(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003ADB0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10003A238(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100024164();
  return _UniqueEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10003A270(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003B05C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003A2A8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v0 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v0);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AAEC(v16, static TabLayoutConfigurationType.typeDisplayRepresentation);
  sub_10000AAD4(v16, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x6F79616C20626154, 0xEA00000000007475);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for entity representing the configuration of tabs in Safari on iPad", 73, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

uint64_t TabLayoutConfigurationType.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10005C3B0 != -1)
    swift_once(&qword_10005C3B0, sub_10003A2A8);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000AAD4(v0, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
}

uint64_t static TabLayoutConfigurationType.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C3B0 != -1)
    swift_once(&qword_10005C3B0, sub_10003A2A8);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AAD4(v2, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t TabLayoutConfigurationType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x54746361706D6F63;
  else
    return 0x6574617261706573;
}

unint64_t sub_10003A5C4()
{
  uint64_t v0;
  uint64_t v1;
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
  _BYTE *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  unint64_t result;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  void (*v37)(char *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;

  v0 = sub_100006014(&qword_10005D1A8);
  __chkstk_darwin(v0);
  v43 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v2);
  v42 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  __chkstk_darwin(v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v39 = *(_QWORD *)(v14 - 8);
  v33 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100006014(&qword_10005E3E8);
  v18 = sub_100006014(&qword_10005D280);
  v19 = *(_QWORD *)(v18 - 8);
  v40 = *(_QWORD *)(v19 + 72);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (v20 + 32) & ~v20;
  v22 = swift_allocObject(v17, v21 + 2 * v40, v20 | 7);
  v41 = v22;
  *(_OWORD *)(v22 + 16) = xmmword_100044810;
  v23 = (_BYTE *)(v22 + v21);
  v35 = &v23[*(int *)(v18 + 48)];
  *v23 = 0;
  v24 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x8000000100041D40);
  static Locale.current.getter(v24);
  v36 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v37 = *(void (**)(char *))(v5 + 104);
  v25 = v7;
  v37(v7);
  v34 = 0x800000010003F360;
  v26 = v10;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000018, 0x800000010003F360, v10, v7, "The configuration for tab visual representation", 47, 2);
  v39 = *(_QWORD *)(v39 + 56);
  v27 = v42;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v39)(v42, 1, 1, v14);
  v28 = type metadata accessor for DisplayRepresentation.Image(0);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v43;
  v29(v43, 1, 1, v28);
  DisplayRepresentation.init(title:subtitle:image:)(v16, v27, v30);
  v23[v40] = 1;
  v31 = String.LocalizationValue.init(stringLiteral:)(0x20746361706D6F43, 0xEF72614220626154);
  static Locale.current.getter(v31);
  ((void (*)(char *, _QWORD, uint64_t))v37)(v25, v36, v38);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000018, v34, v26, v25, "The configuration for tab visual representation", 47, 2);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v39)(v27, 1, 1, v33);
  v29(v30, 1, 1, v28);
  DisplayRepresentation.init(title:subtitle:image:)(v16, v27, v30);
  result = sub_100018838(v41);
  static TabLayoutConfigurationType.caseDisplayRepresentations = result;
  return result;
}

uint64_t *TabLayoutConfigurationType.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10005C3B8 != -1)
    swift_once(&qword_10005C3B8, sub_10003A5C4);
  return &static TabLayoutConfigurationType.caseDisplayRepresentations;
}

uint64_t static TabLayoutConfigurationType.caseDisplayRepresentations.getter()
{
  _BYTE v1[24];

  if (qword_10005C3B8 != -1)
    swift_once(&qword_10005C3B8, sub_10003A5C4);
  swift_beginAccess(&static TabLayoutConfigurationType.caseDisplayRepresentations, v1, 0, 0);
  return swift_bridgeObjectRetain(static TabLayoutConfigurationType.caseDisplayRepresentations);
}

uint64_t static TabLayoutConfigurationType.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_10005C3B8 != -1)
    swift_once(&qword_10005C3B8, sub_10003A5C4);
  swift_beginAccess(&static TabLayoutConfigurationType.caseDisplayRepresentations, v4, 1, 0);
  v2 = static TabLayoutConfigurationType.caseDisplayRepresentations;
  static TabLayoutConfigurationType.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease(v2);
}

uint64_t (*static TabLayoutConfigurationType.caseDisplayRepresentations.modify(uint64_t a1))(_QWORD)
{
  if (qword_10005C3B8 != -1)
    swift_once(&qword_10005C3B8, sub_10003A5C4);
  swift_beginAccess(&static TabLayoutConfigurationType.caseDisplayRepresentations, a1, 33, 0);
  return j__swift_endAccess;
}

SafariWidgetExtension::TabLayoutConfigurationType_optional __swiftcall TabLayoutConfigurationType.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  SafariWidgetExtension::TabLayoutConfigurationType_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100055748, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1)
    v4.value = SafariWidgetExtension_TabLayoutConfigurationType_compactTabBar;
  else
    v4.value = SafariWidgetExtension_TabLayoutConfigurationType_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

_UNKNOWN **static TabLayoutConfigurationType.allCases.getter()
{
  return &off_100055798;
}

uint64_t sub_10003AB94()
{
  return sub_1000061A8(&qword_10005E228, &qword_10005E230, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

unint64_t sub_10003ABC4()
{
  unint64_t result;

  result = qword_10005E238;
  if (!qword_10005E238)
  {
    result = swift_getWitnessTable(&unk_100048234, &type metadata for TabLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005E238);
  }
  return result;
}

unint64_t sub_10003AC0C()
{
  unint64_t result;

  result = qword_10005E240;
  if (!qword_10005E240)
  {
    result = swift_getWitnessTable(&unk_10004825C, &type metadata for TabLayoutEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10005E240);
  }
  return result;
}

uint64_t sub_10003AC50(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100049930, 1) + 8);
}

uint64_t sub_10003AC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_100032C2C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_10003AC8C()
{
  unint64_t result;

  result = qword_10005E250;
  if (!qword_10005E250)
  {
    result = swift_getWitnessTable(&unk_1000482B8, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E250);
  }
  return result;
}

unint64_t sub_10003ACD8()
{
  unint64_t result;

  result = qword_10005E260;
  if (!qword_10005E260)
  {
    result = swift_getWitnessTable(&unk_1000482F0, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E260);
  }
  return result;
}

unint64_t sub_10003AD20()
{
  unint64_t result;

  result = qword_10005E270;
  if (!qword_10005E270)
  {
    result = swift_getWitnessTable(&unk_100048348, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E270);
  }
  return result;
}

unint64_t sub_10003AD68()
{
  unint64_t result;

  result = qword_10005E278;
  if (!qword_10005E278)
  {
    result = swift_getWitnessTable(&unk_1000483A8, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E278);
  }
  return result;
}

unint64_t sub_10003ADB0()
{
  unint64_t result;

  result = qword_10005E280[0];
  if (!qword_10005E280[0])
  {
    result = swift_getWitnessTable(&unk_10004844C, &type metadata for TabLayoutEntity);
    atomic_store(result, qword_10005E280);
  }
  return result;
}

unint64_t sub_10003ADF8()
{
  unint64_t result;

  result = qword_10005E298;
  if (!qword_10005E298)
  {
    result = swift_getWitnessTable(&unk_1000483D0, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E298);
  }
  return result;
}

unint64_t sub_10003AE40()
{
  unint64_t result;

  result = qword_10005E2A0;
  if (!qword_10005E2A0)
  {
    result = swift_getWitnessTable(&unk_100048594, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2A0);
  }
  return result;
}

unint64_t sub_10003AE88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E2A8;
  if (!qword_10005E2A8)
  {
    v1 = sub_1000060C8(qword_10005E2B0);
    sub_10003AE40();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005E2A8);
  }
  return result;
}

unint64_t sub_10003AEF0()
{
  unint64_t result;

  result = qword_10005E2C8;
  if (!qword_10005E2C8)
  {
    result = swift_getWitnessTable(&unk_100048278, &type metadata for TabLayoutEntity.TabLayoutEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005E2C8);
  }
  return result;
}

unint64_t sub_10003AF38()
{
  unint64_t result;

  result = qword_10005E2D0;
  if (!qword_10005E2D0)
  {
    result = swift_getWitnessTable(&unk_1000484A4, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2D0);
  }
  return result;
}

unint64_t sub_10003AF80()
{
  unint64_t result;

  result = qword_10005E2D8;
  if (!qword_10005E2D8)
  {
    result = swift_getWitnessTable(&unk_1000484DC, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2D8);
  }
  return result;
}

unint64_t sub_10003AFC8()
{
  unint64_t result;

  result = qword_10005E2E0;
  if (!qword_10005E2E0)
  {
    result = swift_getWitnessTable(&unk_10004850C, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2E0);
  }
  return result;
}

unint64_t sub_10003B014()
{
  unint64_t result;

  result = qword_10005E2E8;
  if (!qword_10005E2E8)
  {
    result = swift_getWitnessTable(&unk_10004856C, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2E8);
  }
  return result;
}

unint64_t sub_10003B05C()
{
  unint64_t result;

  result = qword_10005E2F0;
  if (!qword_10005E2F0)
  {
    result = swift_getWitnessTable(&unk_1000485EC, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E2F0);
  }
  return result;
}

uint64_t sub_10003B0A0()
{
  return sub_1000061A8(&qword_10005E2F8, &qword_10005E300, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

unint64_t sub_10003B0D0()
{
  unint64_t result;

  result = qword_10005E308;
  if (!qword_10005E308)
  {
    result = swift_getWitnessTable(&unk_10004861C, &type metadata for TabLayoutEntity);
    atomic_store(result, (unint64_t *)&qword_10005E308);
  }
  return result;
}

uint64_t sub_10003B114(char *a1, char *a2)
{
  return sub_100038C8C(*a1, *a2);
}

uint64_t sub_10003B120@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100055748, v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void sub_10003B17C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6574617261706573;
  if (*v1)
    v2 = 0x54746361706D6F63;
  v3 = 0xEE00726142626154;
  if (*v1)
    v3 = 0xED00007261426261;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_10003B1D8()
{
  unint64_t result;

  result = qword_10005E310;
  if (!qword_10005E310)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E310);
  }
  return result;
}

Swift::Int sub_10003B21C()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  if (v1)
    v2 = 0x54746361706D6F63;
  else
    v2 = 0x6574617261706573;
  if (v1)
    v3 = 0xED00007261426261;
  else
    v3 = 0xEE00726142626154;
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10003B2B4(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0x54746361706D6F63;
  else
    v2 = 0x6574617261706573;
  if (*v1)
    v3 = 0xED00007261426261;
  else
    v3 = 0xEE00726142626154;
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10003B328(uint64_t a1)
{
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2)
    v3 = 0x54746361706D6F63;
  else
    v3 = 0x6574617261706573;
  if (v2)
    v4 = 0xED00007261426261;
  else
    v4 = 0xEE00726142626154;
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_10003B3C0()
{
  unint64_t result;

  result = qword_10005E318;
  if (!qword_10005E318)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E318);
  }
  return result;
}

unint64_t sub_10003B408()
{
  unint64_t result;

  result = qword_10005E320;
  if (!qword_10005E320)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E320);
  }
  return result;
}

unint64_t sub_10003B450()
{
  unint64_t result;

  result = qword_10005E328;
  if (!qword_10005E328)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E328);
  }
  return result;
}

unint64_t sub_10003B498()
{
  unint64_t result;

  result = qword_10005E330;
  if (!qword_10005E330)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E330);
  }
  return result;
}

unint64_t sub_10003B4E0()
{
  unint64_t result;

  result = qword_10005E338;
  if (!qword_10005E338)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E338);
  }
  return result;
}

unint64_t sub_10003B52C()
{
  unint64_t result;

  result = qword_10005E340;
  if (!qword_10005E340)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E340);
  }
  return result;
}

uint64_t sub_10003B570@<X0>(uint64_t a1@<X8>)
{
  return sub_100008684(&qword_10005C3B0, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static TabLayoutConfigurationType.typeDisplayRepresentation, (uint64_t)sub_10003A2A8, a1);
}

uint64_t sub_10003B594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCB4(a1, a2, a3, (uint64_t (*)(void))sub_1000240DC, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_10003B5A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000240DC();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10003B5E4()
{
  unint64_t result;

  result = qword_10005E348;
  if (!qword_10005E348)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E348);
  }
  return result;
}

unint64_t sub_10003B62C()
{
  unint64_t result;

  result = qword_10005E350;
  if (!qword_10005E350)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E350);
  }
  return result;
}

unint64_t sub_10003B674()
{
  unint64_t result;

  result = qword_10005E358;
  if (!qword_10005E358)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TabLayoutConfigurationType, &type metadata for TabLayoutConfigurationType);
    atomic_store(result, (unint64_t *)&qword_10005E358);
  }
  return result;
}

uint64_t sub_10003B6B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003B52C();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003B6F0()
{
  return sub_1000061A8(&qword_10005E360, &qword_10005E368, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10003B71C(_QWORD *a1@<X8>)
{
  *a1 = &off_1000557C0;
}

uint64_t storeEnumTagSinglePayload for TabLayoutConfigurationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10003B778 + 4 * byte_1000480ED[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10003B7AC + 4 * byte_1000480E8[v4]))();
}

uint64_t sub_10003B7AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10003B7B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10003B7BCLL);
  return result;
}

uint64_t sub_10003B7C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10003B7D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10003B7D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10003B7DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TabLayoutConfigurationType()
{
  return &type metadata for TabLayoutConfigurationType;
}

ValueMetadata *type metadata accessor for TabLayoutEntity.TabLayoutEntityQuery()
{
  return &type metadata for TabLayoutEntity.TabLayoutEntityQuery;
}

ValueMetadata *type metadata accessor for TabLayoutEntity()
{
  return &type metadata for TabLayoutEntity;
}

ValueMetadata *type metadata accessor for TabLayoutEntity.UpdateIntent_value()
{
  return &type metadata for TabLayoutEntity.UpdateIntent_value;
}

uint64_t sub_10003B828()
{
  return sub_1000061A8(&qword_10005E370, &qword_10005E378, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10003B854()
{
  return sub_1000061A8(&qword_10005E380, &qword_10005E378, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10003B880()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006014(&qword_10005C700);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100006014(&qword_10005C708);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100006014(&qword_10005E3B0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x8000000100041C80);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v31 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v29;
  v25[0] = *(_QWORD *)(v28 + 104);
  ((void (*)(char *, _QWORD, uint64_t))v25[0])(v2, enum case for InputConnectionBehavior.default(_:), v29);
  v22 = sub_10003ADB0();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100006014(&qword_10005E3B8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000029, 0x8000000100041CA0);
  v26(v11, 1, 1, v27);
  v30 = 2;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_1000240DC();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_100055720, v23);
  return v28;
}

uint64_t sub_10003BB70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10003BC2C, 0, 0);
}

uint64_t sub_10003BC2C()
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
  unint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100006014(&qword_10005E230);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100041C30);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0xD000000000000018, 0x800000010003F360, v4, v3, 0, 0, 256);
  v8 = sub_1000061A8(&qword_10005E3A0, &qword_10005E3A8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_1000240DC();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005E390, 0, &unk_10005E398, 0, &type metadata for TabLayoutEntity.UpdateIntent_value, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_10003BD90@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t *sub_10003BD9C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v14);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a2[1];
    v4[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)v4 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain(v7);
    v11 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v15 = *v10;
      *v9 = *v10;
      swift_retain(v15);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
    v16 = *(int *)(a3 + 24);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = v17;
      v22 = v19;
      v23 = 1;
    }
    else
    {
      v24 = *v18;
      *v17 = *v18;
      swift_retain(v24);
      v21 = v17;
      v22 = v19;
      v23 = 0;
    }
    swift_storeEnumTagMultiPayload(v21, v22, v23);
  }
  return v4;
}

uint64_t sub_10003BF04(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v5 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  v7 = (_QWORD *)(a1 + *(int *)(a2 + 24));
  v8 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v7, v8) != 1)
    return swift_release(*v7);
  v9 = type metadata accessor for WidgetRenderingMode(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
}

uint64_t sub_10003BFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  swift_bridgeObjectRetain(v6);
  v10 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
    v12 = 1;
  }
  else
  {
    v13 = *v9;
    *v8 = *v9;
    swift_retain(v13);
    v12 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v10, v12);
  v14 = *(int *)(a3 + 24);
  v15 = (uint64_t *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
  {
    v18 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
    v19 = 1;
  }
  else
  {
    v20 = *v16;
    *v15 = *v16;
    swift_retain(v20);
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v15, v17, v19);
  return a1;
}

uint64_t sub_10003C10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)(a1 + v8);
    v10 = (uint64_t *)(a2 + v8);
    sub_100006368(a1 + v8, &qword_10005C910);
    v11 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
    v15 = *(int *)(a3 + 24);
    v16 = (uint64_t *)(a1 + v15);
    v17 = (uint64_t *)(a2 + v15);
    sub_100006368(a1 + v15, &qword_10005CA90);
    v18 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v17, v18) == 1)
    {
      v19 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v16, v17, v19);
      v20 = 1;
    }
    else
    {
      v21 = *v17;
      *v16 = *v17;
      swift_retain(v21);
      v20 = 0;
    }
    swift_storeEnumTagMultiPayload(v16, v18, v20);
  }
  return a1;
}

_OWORD *sub_10003C274(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = *(int *)(a3 + 24);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
  {
    v15 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload(v12, v14, 1);
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10003C3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_100006368(a1 + v7, &qword_10005C910);
    v10 = sub_100006014(&qword_10005C910);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    v12 = *(int *)(a3 + 24);
    v13 = (void *)(a1 + v12);
    v14 = (const void *)(a2 + v12);
    sub_100006368(a1 + v12, &qword_10005CA90);
    v15 = sub_100006014(&qword_10005CA90);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload(v13, v15, 1);
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003C50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003C518);
}

uint64_t sub_10003C518(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100006014(&qword_10005CC28);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = sub_100006014(&qword_10005CAA0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_10003C5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003C5CC);
}

uint64_t sub_10003C5CC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v8 = sub_100006014(&qword_10005CC28);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = sub_100006014(&qword_10005CAA0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for LargeReadingListWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_10005E448;
  if (!qword_10005E448)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LargeReadingListWidgetView);
  return result;
}

void sub_10003C6AC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v6[0] = &unk_1000489C0;
  sub_10000FF54(319, (unint64_t *)&qword_10005CC98, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000FF54(319, (unint64_t *)&unk_10005CB18, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

uint64_t sub_10003C75C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004999C, 1);
}

uint64_t sub_10003C76C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t KeyPath;
  __int16 v16;
  int v17;
  uint64_t v18;
  uint64_t v20;

  v4 = sub_100006014(&qword_10005E4A0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v20 - v9;
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v20 - v12;
  *(_QWORD *)v10 = static HorizontalAlignment.center.getter(v11);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v14 = sub_100006014(&qword_10005E4A8);
  sub_10003C8F4((uint64_t)a1, (uint64_t)&v10[*(int *)(v14 + 44)]);
  sub_10003DB20((uint64_t)v10, (uint64_t)v13);
  if (*(_QWORD *)(*((_QWORD *)a1 + 1) + 16))
  {
    KeyPath = 0;
    v16 = 255;
  }
  else
  {
    v17 = *a1;
    KeyPath = swift_getKeyPath(&unk_100048A28);
    if (v17)
      v16 = 0;
    else
      v16 = 256;
  }
  sub_100006314((uint64_t)v13, (uint64_t)v7, &qword_10005E4A0);
  sub_100006314((uint64_t)v7, a2, &qword_10005E4A0);
  v18 = a2 + *(int *)(sub_100006014(&qword_10005E4B0) + 48);
  *(_QWORD *)v18 = KeyPath;
  *(_WORD *)(v18 + 8) = v16;
  sub_100011CAC(KeyPath, v16);
  sub_100006368((uint64_t)v13, &qword_10005E4A0);
  sub_100011CC8(KeyPath, v16);
  return sub_100006368((uint64_t)v7, &qword_10005E4A0);
}

uint64_t sub_10003C8F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[3];

  v82 = a2;
  v3 = type metadata accessor for WidgetFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  v73 = v4;
  v5 = __chkstk_darwin(v3);
  v74 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v71 = (char *)&v68 - v7;
  v81 = sub_100006014(&qword_10005E4B8);
  v79 = *(_QWORD *)(v81 - 8);
  v8 = __chkstk_darwin(v81);
  v80 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v75 = (char *)&v68 - v11;
  __chkstk_darwin(v10);
  v78 = (char *)&v68 - v12;
  v70 = type metadata accessor for LargeReadingListWidgetView(0);
  v13 = *(_QWORD *)(v70 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  __chkstk_darwin(v70);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_100006014(&qword_10005E4C0);
  v86 = *(_QWORD *)(v77 - 8);
  v16 = __chkstk_darwin(v77);
  v76 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v19 = (char *)&v68 - v18;
  v20 = sub_100006014(&qword_10005E4C8);
  v21 = __chkstk_darwin(v20);
  v85 = (uint64_t)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v68 - v24;
  *(_QWORD *)v25 = static VerticalAlignment.firstTextBaseline.getter(v23);
  *((_QWORD *)v25 + 1) = 0;
  v25[16] = 1;
  v26 = *(int *)(sub_100006014(&qword_10005E4D0) + 44);
  v83 = v25;
  sub_10003CF00((uint64_t)&v25[v26]);
  v87[0] = *(_QWORD *)(a1 + 8);
  v27 = v87[0];
  sub_100011C68(a1, (uint64_t)v15, type metadata accessor for LargeReadingListWidgetView);
  v28 = *(unsigned __int8 *)(v13 + 80);
  v29 = (v28 + 16) & ~v28;
  v68 = v28 | 7;
  v69 = v29 + v14;
  v30 = swift_allocObject(&unk_100059550, v29 + v14, v28 | 7);
  sub_10003DE3C((uint64_t)v15, v30 + v29, type metadata accessor for LargeReadingListWidgetView);
  swift_bridgeObjectRetain(v27);
  v31 = sub_100006014(&qword_10005E4D8);
  v32 = type metadata accessor for UUID(0);
  v33 = sub_100006014(&qword_10005E4E0);
  v34 = sub_1000061A8(&qword_10005E4E8, &qword_10005E4D8, (uint64_t)&protocol conformance descriptor for [A]);
  v35 = sub_1000061A8(&qword_10005E4F0, &qword_10005E4E0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v36 = sub_10003DBBC();
  v84 = v19;
  v37 = v31;
  v38 = v72;
  v39 = v73;
  v40 = v35;
  v41 = (uint64_t)v71;
  ForEach<>.init(_:content:)(v87, sub_10003DB70, v30, v37, v32, v33, v34, v40, v36);
  sub_100013614(v41);
  v42 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v74, v41, v38);
  v43 = (*(uint64_t (**)(char *, uint64_t))(v39 + 88))(v42, v38);
  if (v43 == enum case for WidgetFamily.systemSmall(_:))
    goto LABEL_7;
  if (v43 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v43 == enum case for WidgetFamily.systemLarge(_:))
    {
      v44 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v42, v38);
LABEL_7:
    v44 = 1;
    goto LABEL_8;
  }
  v44 = 2;
LABEL_8:
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v38);
  v45 = v44 - *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  v87[0] = 0;
  v87[1] = v45 & ~(v45 >> 63);
  KeyPath = swift_getKeyPath(&unk_100048A58);
  sub_100011C68(a1, (uint64_t)v15, type metadata accessor for LargeReadingListWidgetView);
  v47 = swift_allocObject(&unk_100059578, v69, v68);
  sub_10003DE3C((uint64_t)v15, v47 + v29, type metadata accessor for LargeReadingListWidgetView);
  v48 = sub_100006014(&qword_10005E500);
  v49 = sub_100006014(&qword_10005E508);
  v50 = sub_10003DD5C();
  v51 = sub_1000061A8(&qword_10005E520, &qword_10005E508, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v52 = v75;
  ForEach<>.init(_:id:content:)(v87, KeyPath, sub_10003DD10, v47, v48, v49, v50, &protocol witness table for Int, v51);
  v54 = v78;
  v53 = v79;
  v55 = v81;
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v78, v52, v81);
  v56 = v85;
  sub_100006314((uint64_t)v83, v85, &qword_10005E4C8);
  v57 = *(void (**)(char *, char *, uint64_t))(v86 + 16);
  v59 = v76;
  v58 = v77;
  v57(v76, v84, v77);
  v60 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  v61 = v80;
  v60(v80, v54, v55);
  v62 = v82;
  sub_100006314(v56, v82, &qword_10005E4C8);
  v63 = (int *)sub_100006014(&qword_10005E528);
  v64 = v62 + v63[12];
  *(_QWORD *)v64 = 0;
  *(_BYTE *)(v64 + 8) = 1;
  v57((char *)(v62 + v63[16]), v59, v58);
  v60((char *)(v62 + v63[20]), v61, v55);
  v65 = *(void (**)(char *, uint64_t))(v53 + 8);
  v65(v54, v55);
  v66 = *(void (**)(char *, uint64_t))(v86 + 8);
  v66(v84, v58);
  sub_100006368((uint64_t)v83, &qword_10005E4C8);
  v65(v61, v55);
  v66(v59, v58);
  return sub_100006368(v85, &qword_10005E4C8);
}

uint64_t sub_10003CF00@<X0>(uint64_t a1@<X8>)
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
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  _DWORD v21[4];

  v2 = type metadata accessor for WidgetRenderingMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v21 - v7;
  v9 = sub_100006014(&qword_10005CBE0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LargeReadingListWidgetView(0);
  v13 = sub_1000133B0((uint64_t)v8);
  static WidgetRenderingMode.accented.getter(v13);
  v14 = static WidgetRenderingMode.== infix(_:_:)(v8, v6);
  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v6, v2);
  v16 = ((uint64_t (*)(char *, uint64_t))v15)(v8, v2);
  if ((v14 & 1) != 0)
    v17 = static HierarchicalShapeStyle.primary.getter(v16);
  else
    v17 = static HierarchicalShapeStyle.secondary.getter(v16);
  v21[3] = v17;
  v18 = sub_100006014(&qword_10005CC00);
  v19 = sub_1000122E8();
  View.widgetAccentable(_:)(1, v18, v19);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v12, v9);
}

uint64_t sub_10003D078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v16;

  v4 = type metadata accessor for ReadingListWidgetCell(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v16 - v8;
  sub_100011C68(a1, (uint64_t)v7, type metadata accessor for BookmarkItem);
  v10 = &v7[*(int *)(v4 + 20)];
  *(_QWORD *)v10 = swift_getKeyPath(&unk_100048A70);
  v11 = sub_100006014(&qword_10005CA88);
  swift_storeEnumTagMultiPayload(v10, v11, 0);
  v12 = &v7[*(int *)(v4 + 24)];
  *(_QWORD *)v12 = swift_getKeyPath(&unk_100048AA0);
  v12[8] = 0;
  sub_10003DE3C((uint64_t)v7, (uint64_t)v9, type metadata accessor for ReadingListWidgetCell);
  v13 = sub_10003D1F8(a1);
  sub_100011C68((uint64_t)v9, (uint64_t)v7, type metadata accessor for ReadingListWidgetCell);
  sub_100011C68((uint64_t)v7, a2, type metadata accessor for ReadingListWidgetCell);
  v14 = a2 + *(int *)(sub_100006014(&qword_10005E530) + 48);
  *(_QWORD *)v14 = 0;
  *(_BYTE *)(v14 + 8) = !v13;
  *(_BYTE *)(v14 + 9) = v13;
  sub_100011EAC((uint64_t)v9, type metadata accessor for ReadingListWidgetCell);
  return sub_100011EAC((uint64_t)v7, type metadata accessor for ReadingListWidgetCell);
}

BOOL sub_10003D1F8(uint64_t a1)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  _BOOL8 v33;
  _QWORD *v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int v42;
  unint64_t v43;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v2 = v1;
  v4 = type metadata accessor for WidgetFamily(0);
  v49 = *(_QWORD *)(v4 - 8);
  v50 = v4;
  v5 = __chkstk_darwin(v4);
  v47 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v48 = (uint64_t)&v45 - v7;
  v46 = type metadata accessor for LargeReadingListWidgetView(0);
  v8 = __chkstk_darwin(v46);
  v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v54 = (uint64_t)&v45 - v10;
  v11 = type metadata accessor for BookmarkItem(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v51 = (uint64_t *)((char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_100006014(&qword_10005E538);
  __chkstk_darwin(v14);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100006014(&qword_10005CB90);
  v18 = __chkstk_darwin(v17);
  v20 = (uint64_t *)((char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v45 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v45 - v24;
  sub_100011C68(a1, (uint64_t)&v45 - v24, type metadata accessor for BookmarkItem);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v27 = 1;
  v26(v25, 0, 1, v11);
  v53 = v2;
  v28 = *(_QWORD *)(v2 + 8);
  v29 = *(_QWORD *)(v28 + 16);
  if (v29)
  {
    sub_100011C68(v28+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * (v29 - 1), (uint64_t)v23, type metadata accessor for BookmarkItem);
    v27 = 0;
  }
  v26(v23, v27, 1, v11);
  v30 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_100006314((uint64_t)v25, (uint64_t)v16, &qword_10005CB90);
  sub_100006314((uint64_t)v23, v30, &qword_10005CB90);
  v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v31((uint64_t)v16, 1, v11) != 1)
  {
    sub_100006314((uint64_t)v16, (uint64_t)v20, &qword_10005CB90);
    if (v31(v30, 1, v11) != 1)
    {
      v34 = v51;
      sub_10003DE3C(v30, (uint64_t)v51, type metadata accessor for BookmarkItem);
      v35 = sub_10003780C(v20, v34);
      sub_100011EAC((uint64_t)v34, type metadata accessor for BookmarkItem);
      sub_100006368((uint64_t)v23, &qword_10005CB90);
      sub_100006368((uint64_t)v25, &qword_10005CB90);
      sub_100011EAC((uint64_t)v20, type metadata accessor for BookmarkItem);
      sub_100006368((uint64_t)v16, &qword_10005CB90);
      v32 = v54;
      sub_100011C68(v53, v54, type metadata accessor for LargeReadingListWidgetView);
      if ((v35 & 1) == 0)
      {
        v33 = 0;
        goto LABEL_20;
      }
      goto LABEL_10;
    }
    sub_100006368((uint64_t)v23, &qword_10005CB90);
    sub_100006368((uint64_t)v25, &qword_10005CB90);
    sub_100011EAC((uint64_t)v20, type metadata accessor for BookmarkItem);
LABEL_8:
    sub_100006368((uint64_t)v16, &qword_10005E538);
    v32 = v54;
    sub_100011C68(v53, v54, type metadata accessor for LargeReadingListWidgetView);
    v33 = 0;
    goto LABEL_20;
  }
  sub_100006368((uint64_t)v23, &qword_10005CB90);
  sub_100006368((uint64_t)v25, &qword_10005CB90);
  if (v31(v30, 1, v11) != 1)
    goto LABEL_8;
  sub_100006368((uint64_t)v16, &qword_10005CB90);
  v32 = v54;
  sub_100011C68(v53, v54, type metadata accessor for LargeReadingListWidgetView);
LABEL_10:
  v36 = *(_QWORD *)(*(_QWORD *)(v32 + 8) + 16);
  v37 = v52;
  sub_100011C68(v32, v52, type metadata accessor for LargeReadingListWidgetView);
  if (v36)
  {
    v38 = v48;
    sub_100013614(v48);
    v40 = v49;
    v39 = v50;
    v41 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v47, v38, v50);
    v42 = (*(uint64_t (**)(char *, uint64_t))(v40 + 88))(v41, v39);
    if (v42 != enum case for WidgetFamily.systemSmall(_:))
    {
      if (v42 == enum case for WidgetFamily.systemMedium(_:))
      {
        v43 = 2;
        goto LABEL_19;
      }
      if (v42 == enum case for WidgetFamily.systemLarge(_:))
      {
        v43 = 5;
        goto LABEL_19;
      }
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
    }
    v43 = 1;
LABEL_19:
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    sub_100011EAC(v37, type metadata accessor for LargeReadingListWidgetView);
    v33 = v36 >= v43;
    goto LABEL_20;
  }
  sub_100011EAC(v37, type metadata accessor for LargeReadingListWidgetView);
  v33 = 1;
LABEL_20:
  sub_100011EAC(v32, type metadata accessor for LargeReadingListWidgetView);
  return v33;
}

BOOL sub_10003D74C@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *a1;
  v4 = static Color.clear.getter();
  v5 = static Alignment.center.getter(v4);
  _FrameLayout.init(width:height:alignment:)(&v14, 0, 1, 0x4048000000000000, 0, v5, v6);
  v7 = v14;
  v8 = v15;
  v9 = v16;
  v10 = v17;
  v12 = v18;
  v11 = v19;
  result = sub_10003D80C(v3);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = v9;
  *(_BYTE *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 56) = 0;
  *(_BYTE *)(a2 + 64) = !result;
  *(_BYTE *)(a2 + 65) = result;
  return result;
}

BOOL sub_10003D80C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = v1;
  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v15 - v9;
  type metadata accessor for LargeReadingListWidgetView(0);
  sub_100013614((uint64_t)v10);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v11 == enum case for WidgetFamily.systemSmall(_:))
    goto LABEL_7;
  if (v11 != enum case for WidgetFamily.systemMedium(_:))
  {
    if (v11 == enum case for WidgetFamily.systemLarge(_:))
    {
      v12 = 5;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
LABEL_7:
    v12 = 1;
    goto LABEL_8;
  }
  v12 = 2;
LABEL_8:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  v13 = v12 - *(_QWORD *)(*(_QWORD *)(v2 + 8) + 16);
  return (v13 & ~(v13 >> 63)) - 1 == a1;
}

double sub_10003D964@<D0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  double result;

  if (qword_10005C1C8 != -1)
    swift_once(&qword_10005C1C8, sub_1000057FC);
  v2 = qword_10005E548;
  *a1 = qword_10005E548;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10003D9B4()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = type metadata accessor for ContainerBackgroundPlacement(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006014(&qword_10005E488);
  v6 = __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v8 = static Alignment.center.getter(v6);
  v8[1] = v9;
  v10 = sub_100006014(&qword_10005E490);
  v11 = sub_10003C76C(v0, (uint64_t)v8 + *(int *)(v10 + 44));
  v12 = static ContainerBackgroundPlacement.widget.getter(v11);
  v13 = static Alignment.center.getter(v12);
  v15 = v14;
  v16 = sub_1000061A8(&qword_10005E498, &qword_10005E488, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.containerBackground<A>(for:alignment:content:)(v4, v13, v15, sub_10003D964, 0, v5, &type metadata for Color, v16, &protocol witness table for Color);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_100006368((uint64_t)v8, &qword_10005E488);
}

uint64_t sub_10003DB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006014(&qword_10005E4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003DB70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for LargeReadingListWidgetView(0);
  return sub_10003D078(a1, a2);
}

unint64_t sub_10003DBBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E4F8;
  if (!qword_10005E4F8)
  {
    v1 = type metadata accessor for BookmarkItem(255);
    result = swift_getWitnessTable(&unk_100047F88, v1);
    atomic_store(result, (unint64_t *)&qword_10005E4F8);
  }
  return result;
}

uint64_t sub_10003DC08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for LargeReadingListWidgetView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 8));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = sub_100006014(&qword_10005C910);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 24));
  v10 = sub_100006014(&qword_10005CA90);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

BOOL sub_10003DD10@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for LargeReadingListWidgetView(0);
  return sub_10003D74C(a1, a2);
}

unint64_t sub_10003DD5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005E510;
  if (!qword_10005E510)
  {
    v1 = sub_1000060C8(&qword_10005E500);
    sub_10003DDC8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Range<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005E510);
  }
  return result;
}

unint64_t sub_10003DDC8()
{
  unint64_t result;

  result = qword_10005E518;
  if (!qword_10005E518)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10005E518);
  }
  return result;
}

void sub_10003DE14(double *a1@<X8>)
{
  *a1 = EnvironmentValues.pixelLength.getter();
}

uint64_t sub_10003DE3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003DE80()
{
  _QWORD v1[4];

  v1[0] = sub_1000060C8(&qword_10005E488);
  v1[1] = &type metadata for Color;
  v1[2] = sub_1000061A8(&qword_10005E498, &qword_10005E488, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v1[3] = &protocol witness table for Color;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
}
