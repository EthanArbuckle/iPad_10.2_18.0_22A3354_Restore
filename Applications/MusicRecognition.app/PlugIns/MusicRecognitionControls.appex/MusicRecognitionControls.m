uint64_t sub_100004A0C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004CCC(v0, qword_10000C388);
  sub_100004D0C(v0, (uint64_t)qword_10000C388);
  return Logger.init(subsystem:category:)(0xD00000000000003ALL, 0x8000000100007AA0, 1701998435, 0xE400000000000000);
}

uint64_t sub_100004A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100004BB8(&qword_10000C110);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004BF8();
  _ControlWidgetAdaptor.init(_:)(v4, &type metadata for MusicRecognitionToggle, v4);
  v5 = sub_100004C3C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100004B54();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100004B54()
{
  unint64_t result;

  result = qword_10000C108;
  if (!qword_10000C108)
  {
    result = swift_getWitnessTable(&unk_100007130, &type metadata for MusicRecognitionControlsBundle);
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicRecognitionControlsBundle()
{
  return &type metadata for MusicRecognitionControlsBundle;
}

uint64_t sub_100004BA8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000073A4, 1);
}

uint64_t sub_100004BB8(uint64_t *a1)
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

unint64_t sub_100004BF8()
{
  unint64_t result;

  result = qword_10000C118;
  if (!qword_10000C118)
  {
    result = swift_getWitnessTable(&unk_1000072E8, &type metadata for MusicRecognitionToggle);
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_100004C3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C120;
  if (!qword_10000C120)
  {
    v1 = sub_100004C88(&qword_10000C110);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_100004C88(uint64_t *a1)
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

uint64_t *sub_100004CCC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100004D0C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100004D24()
{
  _QWORD v1[2];

  v1[0] = sub_100004C88(&qword_10000C110);
  v1[1] = sub_100004C3C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

void sub_100004D70()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  qword_10000C128 = (uint64_t)v2;
}

unint64_t sub_100004DE0()
{
  unint64_t result;

  result = qword_10000C1D8;
  if (!qword_10000C1D8)
  {
    result = swift_getWitnessTable(&unk_1000071D0, &type metadata for ToggleIntent);
    atomic_store(result, (unint64_t *)&qword_10000C1D8);
  }
  return result;
}

unint64_t sub_100004E28()
{
  unint64_t result;

  result = qword_10000C1E0;
  if (!qword_10000C1E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_10000C1E0);
  }
  return result;
}

uint64_t sub_100004E6C()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  result = LocalizedStringKey.init(stringLiteral:)(0xD000000000000023, 0x8000000100007CB0);
  qword_10000C130 = result;
  *(_QWORD *)algn_10000C138 = v1;
  byte_10000C140 = v2 & 1;
  qword_10000C148 = v3;
  return result;
}

uint64_t sub_100004EB0()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  result = LocalizedStringKey.init(stringLiteral:)(0xD000000000000024, 0x8000000100007BD0);
  qword_10000C150 = result;
  *(_QWORD *)algn_10000C158 = v1;
  byte_10000C160 = v2 & 1;
  qword_10000C168 = v3;
  return result;
}

uint64_t sub_100004EF4()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  result = LocalizedStringKey.init(stringLiteral:)(0xD000000000000025, 0x8000000100007C60);
  qword_10000C170 = result;
  *(_QWORD *)algn_10000C178 = v1;
  byte_10000C180 = v2 & 1;
  qword_10000C188 = v3;
  return result;
}

uint64_t sub_100004F38()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  result = LocalizedStringKey.init(stringLiteral:)(0xD000000000000022, 0x8000000100007C00);
  qword_10000C190 = result;
  *(_QWORD *)algn_10000C198 = v1;
  byte_10000C1A0 = v2 & 1;
  qword_10000C1A8 = v3;
  return result;
}

uint64_t sub_100004F7C()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  result = LocalizedStringKey.init(stringLiteral:)(0xD000000000000023, 0x8000000100007C30);
  qword_10000C1B0 = result;
  *(_QWORD *)algn_10000C1B8 = v1;
  byte_10000C1C0 = v2 & 1;
  qword_10000C1C8 = v3;
  return result;
}

UIColor sub_100004FC0()
{
  UIColor result;

  sub_1000069CC(0, &qword_10000C2E0, UIColor_ptr);
  result.super.isa = UIColor.init(_colorLiteralRed:green:blue:alpha:)(0.0, 0.53333, 1.0, 1.0).super.isa;
  qword_10000C1D0 = (uint64_t)result.super.isa;
  return result;
}

uint64_t sub_100005018@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t OpaqueTypeConformance2;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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

  v34 = a1;
  v1 = type metadata accessor for LocalizedStringResource(0);
  v29 = *(_QWORD *)(v1 - 8);
  v30 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004BB8(&qword_10000C240);
  v28 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004BB8(&qword_10000C248);
  v31 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004BB8(&qword_10000C250);
  v11 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  v33 = v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100004BB8(&qword_10000C258);
  v15 = sub_100004C88(&qword_10000C260);
  v16 = sub_100004C88(&qword_10000C268);
  v17 = sub_100006948(&qword_10000C270, &qword_10000C268, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  v35 = v16;
  v36 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetTemplate.tint(_:)>>, 1);
  v35 = v15;
  v36 = OpaqueTypeConformance2;
  v19 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetTemplate.accessibilityIdentifier(_:)>>, 1);
  StaticControlConfiguration.init(kind:content:)(0xD00000000000003ALL, 0x8000000100007B40, sub_100005338, 0, v14, v19);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x8000000100007B10);
  v20 = sub_100006948(&qword_10000C278, &qword_10000C240, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  ControlWidgetConfiguration.displayName(_:)(v3, v4, v20);
  v21 = v30;
  v22 = *(void (**)(char *, uint64_t))(v29 + 8);
  v22(v3, v30);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000026, 0x8000000100007B80);
  v35 = v4;
  v36 = v20;
  v23 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  ControlWidgetConfiguration.description(_:)(v3, v7, v23);
  v22(v3, v21);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  v35 = v7;
  v36 = v23;
  v24 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v25 = v32;
  ControlWidgetConfiguration.showsInSystemSpaces()(v32, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v13, v25);
}

uint64_t sub_100005338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  id v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  unint64_t v38;
  uint64_t v39;

  v36 = a1;
  v1 = sub_100004BB8(&qword_10000C268);
  v32 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004BB8(&qword_10000C260);
  v35 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004BB8(&qword_10000C258);
  v33 = *(_QWORD *)(v7 - 8);
  v34 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = LocalizedStringKey.init(_:)(0xD000000000000020, 0x8000000100007B10);
  v30 = v11;
  v31 = v10;
  v13 = v12;
  v29 = v14;
  if (qword_10000C0B8 != -1)
    swift_once(&qword_10000C0B8, sub_100004D70);
  v15 = (id)qword_10000C128;
  if (qword_10000C128)
  {
    v16 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(v15, "BOOLForKey:", v16);

  }
  v39 = sub_1000065A4();
  v17 = sub_100004BB8(&qword_10000C280);
  v18 = sub_100004C88(&qword_10000C288);
  v19 = sub_100004C88(&qword_10000C290);
  v20 = sub_100006828();
  v37 = v19;
  v38 = v20;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of View.controlWidgetStatus(_:)>>, 1);
  v37 = v18;
  v38 = OpaqueTypeConformance2;
  v22 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of View.controlWidgetActionHint(_:)>>, 1);
  v23 = sub_100006988();
  ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)(v31, v30, v13 & 1, v29, v15, &v39, sub_100005684, 0, v17, &type metadata for ToggleIntent, v22, v23);
  if (qword_10000C0E8 != -1)
    swift_once(&qword_10000C0E8, sub_100004FC0);
  v24 = Color.init(_:)((id)qword_10000C1D0);
  v25 = sub_100006948(&qword_10000C270, &qword_10000C268, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  ControlWidgetTemplate.tint(_:)(v24, v1, v25);
  swift_release(v24);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v3, v1);
  v37 = v1;
  v38 = v25;
  v26 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of ControlWidgetTemplate.tint(_:)>>, 1);
  ControlWidgetTemplate.accessibilityIdentifier(_:)(0xD000000000000016, 0x80000001000072B0, v4, v26);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v36, v9, v34);
}

uint64_t sub_100005684@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_BYTE *, uint64_t);
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t KeyPath;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t OpaqueTypeConformance2;
  _BYTE *v69;
  uint64_t v70;
  _BYTE v72[4];
  int v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  _BYTE v91[24];
  _QWORD v92[3];

  v2 = a1;
  v73 = a1;
  v89 = a2;
  v3 = type metadata accessor for ContentTransition(0);
  v81 = *(_QWORD *)(v3 - 8);
  v82 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v80 = &v72[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for SymbolEffectOptions(0);
  v78 = *(_QWORD *)(v5 - 8);
  v79 = v5;
  ((void (*)(void))__chkstk_darwin)();
  v74 = &v72[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for BreatheSymbolEffect(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = &v72[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __chkstk_darwin(v9);
  v14 = &v72[-v13];
  __chkstk_darwin(v12);
  v16 = &v72[-v15];
  v17 = sub_100004BB8(&qword_10000C2B8);
  v76 = *(_QWORD *)(v17 - 8);
  v77 = v17;
  __chkstk_darwin(v17);
  v19 = &v72[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = sub_100004BB8(&qword_10000C2A8);
  __chkstk_darwin(v20);
  v22 = &v72[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v75 = sub_100004BB8(&qword_10000C290);
  __chkstk_darwin(v75);
  v90 = &v72[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = sub_100004BB8(&qword_10000C288);
  v87 = *(_QWORD *)(v24 - 8);
  v88 = v24;
  __chkstk_darwin(v24);
  v86 = &v72[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = sub_100004BB8(&qword_10000C280);
  v84 = *(_QWORD *)(v26 - 8);
  v85 = v26;
  __chkstk_darwin(v26);
  v83 = &v72[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v91[16] = v2;
  v28 = Label.init(title:icon:)(sub_100006A04, v91, sub_100005D88, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
  v29 = BreatheSymbolEffect.init()(v28);
  BreatheSymbolEffect.plain.getter(v29);
  v30 = *(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8);
  v31 = v30(v16, v7);
  v32 = v11;
  BreatheSymbolEffect.wholeSymbol.getter(v31);
  v33 = v30(v14, v7);
  v34 = v74;
  static SymbolEffectOptions.speed(_:)(v33, 1.35);
  v35 = &v22[*(int *)(v20 + 36)];
  v36 = sub_100006A0C(&qword_10000C2E8, (uint64_t (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect, (uint64_t)&protocol conformance descriptor for BreatheSymbolEffect);
  dispatch thunk of SymbolEffect.configuration.getter(v7, v36);
  v37 = type metadata accessor for _IndefiniteSymbolEffectModifier(0);
  v38 = v78;
  v39 = v34;
  v40 = v34;
  v41 = v79;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v78 + 16))(&v35[*(int *)(v37 + 20)], v39, v79);
  v35[*(int *)(v37 + 24)] = 1;
  v43 = v76;
  v42 = v77;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v76 + 16))(v22, v19, v77);
  (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v40, v41);
  v44 = v75;
  v30(v32, v7);
  v45 = (*(uint64_t (**)(_BYTE *, uint64_t))(v43 + 8))(v19, v42);
  v46 = v80;
  static ContentTransition.identity.getter(v45);
  KeyPath = swift_getKeyPath(&unk_100007328);
  v48 = (uint64_t)v90;
  v49 = (uint64_t *)&v90[*(int *)(v44 + 36)];
  v50 = sub_100004BB8(&qword_10000C2D0);
  v52 = v81;
  v51 = v82;
  (*(void (**)(char *, _BYTE *, uint64_t))(v81 + 16))((char *)v49 + *(int *)(v50 + 28), v46, v82);
  *v49 = KeyPath;
  sub_100006A70((uint64_t)v22, v48);
  (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v46, v51);
  sub_100006AB8((uint64_t)v22, &qword_10000C2A8);
  v53 = v73;
  if ((v73 & 1) != 0)
  {
    if (qword_10000C0C8 != -1)
      swift_once(&qword_10000C0C8, sub_100004EB0);
    v54 = &qword_10000C150;
  }
  else
  {
    if (qword_10000C0D0 != -1)
      swift_once(&qword_10000C0D0, sub_100004EF4);
    v54 = &qword_10000C170;
  }
  v55 = v86;
  v56 = v54[3];
  v57 = *((unsigned __int8 *)v54 + 16);
  v59 = *v54;
  v58 = v54[1];
  swift_bridgeObjectRetain(v58);
  swift_bridgeObjectRetain(v56);
  v60 = sub_100006828();
  v61 = v57;
  v62 = (uint64_t)v90;
  View.controlWidgetStatus(_:)(v59, v58, v61, v56, v44, v60);
  swift_bridgeObjectRelease(v56);
  swift_bridgeObjectRelease(v58);
  sub_100006AB8(v62, &qword_10000C290);
  if ((v53 & 1) != 0)
  {
    if (qword_10000C0D8 != -1)
      swift_once(&qword_10000C0D8, sub_100004F38);
    v63 = &qword_10000C190;
  }
  else
  {
    if (qword_10000C0E0 != -1)
      swift_once(&qword_10000C0E0, sub_100004F7C);
    v63 = &qword_10000C1B0;
  }
  v64 = v63[3];
  v65 = *((unsigned __int8 *)v63 + 16);
  v67 = *v63;
  v66 = v63[1];
  swift_bridgeObjectRetain(v66);
  swift_bridgeObjectRetain(v64);
  v92[0] = v44;
  v92[1] = v60;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v92, &opaque type descriptor for <<opaque return type of View.controlWidgetStatus(_:)>>, 1);
  v69 = v83;
  v70 = v88;
  View.controlWidgetActionHint(_:)(v67, v66, v65, v64, v88, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v64);
  swift_bridgeObjectRelease(v66);
  (*(void (**)(_BYTE *, uint64_t))(v87 + 8))(v55, v70);
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v84 + 32))(v89, v69, v85);
}

uint64_t sub_100005CAC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  void *v9;
  char v10;
  char v11;

  if ((a1 & 1) != 0)
  {
    if (qword_10000C0C0 != -1)
      swift_once(&qword_10000C0C0, sub_100004E6C);
    v3 = qword_10000C130;
    v4 = *(_QWORD *)algn_10000C138;
    v5 = byte_10000C140;
    v6 = qword_10000C148;
    swift_bridgeObjectRetain(*(_QWORD *)algn_10000C138);
    swift_bridgeObjectRetain(v6);
    result = Text.init(_:tableName:bundle:comment:)(v3, v4, v5, v6, 0, 0, 0, 0, 0, 256);
    v11 = v10 & 1;
  }
  else
  {
    result = 0;
    v11 = 0;
    v9 = &_swiftEmptyArrayStorage;
    v8 = 0xE000000000000000;
  }
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 24) = v9;
  return result;
}

uint64_t sub_100005D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Image.init(_:bundle:)(0xD000000000000017, 0x8000000100007C90, 0);
  *a1 = result;
  return result;
}

uint64_t sub_100005DCC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004CCC(v0, qword_10000C3A0);
  sub_100004D0C(v0, (uint64_t)qword_10000C3A0);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x8000000100007B10);
}

uint64_t sub_100005E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch(sub_100005E44, 0, 0);
}

uint64_t sub_100005E44()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  if (*(_BYTE *)(v0 + 40) == 1)
  {
    if (qword_10000C0B0 != -1)
      swift_once(&qword_10000C0B0, sub_100004A0C);
    v1 = type metadata accessor for Logger(0);
    sub_100004D0C(v1, (uint64_t)qword_10000C388);
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Start matching", v4, 2u);
      swift_slowDealloc(v4, -1, -1);
    }

    if (qword_10000C100 != -1)
      swift_once(&qword_10000C100, sub_100006BE4);
    v5 = (_QWORD *)swift_task_alloc(async function pointer to SHManagedSession.result()[1]);
    *(_QWORD *)(v0 + 32) = v5;
    *v5 = v0;
    v5[1] = sub_100006100;
    return SHManagedSession.result()();
  }
  else
  {
    if (qword_10000C0B0 != -1)
      swift_once(&qword_10000C0B0, sub_100004A0C);
    v7 = type metadata accessor for Logger(0);
    sub_100004D0C(v7, (uint64_t)qword_10000C388);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Stop matching", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    if (qword_10000C100 != -1)
      swift_once(&qword_10000C100, sub_100006BE4);
    SHManagedSession.cancel()();
    v11 = sub_1000069CC(0, &qword_10000C238, NSDistributedNotificationCenter_ptr);
    v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(v11), "defaultCenter");
    if (qword_10000C0F8 != -1)
      swift_once(&qword_10000C0F8, sub_100006BB0);
    objc_msgSend(v12, "postNotificationName:object:", qword_10000C3B8, 0);

    static IntentResult.result<>()();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100006100(void *a1, void *a2, unsigned __int8 a3)
{
  uint64_t v3;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v3 + 32));
  sub_1000067D0(a1, a2, a3);
  return swift_task_switch(sub_100006178, 0, 0);
}

uint64_t sub_100006178()
{
  uint64_t v0;

  static IntentResult.result<>()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_1000061AC@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000061E4(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_100006218(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100006260;
}

void sub_100006260(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100006294()
{
  unint64_t result;

  result = qword_10000C1E8;
  if (!qword_10000C1E8)
  {
    result = swift_getWitnessTable(&unk_100007260, &type metadata for ToggleIntent);
    atomic_store(result, (unint64_t *)&qword_10000C1E8);
  }
  return result;
}

unint64_t sub_1000062DC()
{
  unint64_t result;

  result = qword_10000C1F0;
  if (!qword_10000C1F0)
  {
    result = swift_getWitnessTable(&unk_100007288, &type metadata for ToggleIntent);
    atomic_store(result, (unint64_t *)&qword_10000C1F0);
  }
  return result;
}

uint64_t sub_100006320(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000073E8, 1);
}

uint64_t sub_100006330(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100004DE0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100006370@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C0F0 != -1)
    swift_once(&qword_10000C0F0, sub_100005DCC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004D0C(v2, (uint64_t)qword_10000C3A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000063F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_10000C234);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100006458;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch(sub_100005E44, 0, 0);
}

uint64_t sub_100006458()
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

uint64_t sub_1000064A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000065A4();
  *a1 = result;
  return result;
}

uint64_t sub_1000064C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004DE0();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ToggleIntent()
{
  return &type metadata for ToggleIntent;
}

uint64_t sub_1000064FC()
{
  return sub_100006948(&qword_10000C200, &qword_10000C208, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100006528(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ContentTransition(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.contentTransition.setter(v3);
}

uint64_t sub_1000065A4()
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
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[15];
  char v21;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100004BB8(&qword_10000C210);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100004BB8(&qword_10000C218);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100004BB8(&qword_10000C220);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004BB8(&qword_10000C228);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x8000000100007B10);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v21 = 2;
  v17 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  v18 = type metadata accessor for IntentDialog(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v16, v12, &v21, v9, v6, v3);
}

void sub_1000067D0(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 >= 2u)
  {
    if (a3 != 2)
      return;
    swift_errorRelease();
    a1 = a2;
  }

}

ValueMetadata *type metadata accessor for MusicRecognitionToggle()
{
  return &type metadata for MusicRecognitionToggle;
}

uint64_t sub_100006818(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000742C, 1);
}

unint64_t sub_100006828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C298;
  if (!qword_10000C298)
  {
    v1 = sub_100004C88(&qword_10000C290);
    sub_1000068AC();
    sub_100006948(&qword_10000C2C8, &qword_10000C2D0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

unint64_t sub_1000068AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    v1 = sub_100004C88(&qword_10000C2A8);
    sub_100006948(&qword_10000C2B0, &qword_10000C2B8, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    sub_100006A0C(&qword_10000C2C0, (uint64_t (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier, (uint64_t)&protocol conformance descriptor for _IndefiniteSymbolEffectModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_100006948(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004C88(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006988()
{
  unint64_t result;

  result = qword_10000C2D8;
  if (!qword_10000C2D8)
  {
    result = swift_getWitnessTable(&unk_100007180, &type metadata for ToggleIntent);
    atomic_store(result, (unint64_t *)&qword_10000C2D8);
  }
  return result;
}

uint64_t sub_1000069CC(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100006A04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100005CAC(*(_BYTE *)(v1 + 16), a1);
}

uint64_t sub_100006A0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006A4C()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100006A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004BB8(&qword_10000C2A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006AB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004BB8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100004C88(&qword_10000C250);
  v1 = sub_100004C88(&qword_10000C248);
  v5 = sub_100004C88(&qword_10000C240);
  v6 = sub_100006948(&qword_10000C278, &qword_10000C240, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>, 1);
}

NSString sub_100006BB0()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_10000C3B8 = (uint64_t)result;
  return result;
}

uint64_t sub_100006BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for SHManagedSession(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v1 = SHManagedSession.init()();
  swift_retain();
  SHManagedSession.enableLiveActivity.setter(1);
  result = swift_release(v1);
  qword_10000C3C0 = v1;
  return result;
}

uint64_t sub_100006C38()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24MusicRecognitionControlsP33_1EA8E8A52CCBAA4AC5EB59005068C58C19ResourceBundleClass);
}
