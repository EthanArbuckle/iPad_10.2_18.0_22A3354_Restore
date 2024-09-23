uint64_t sub_100002DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100002F08(&qword_100008098);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002F48();
  _ControlWidgetAdaptor.init(_:)(v4, &type metadata for LaunchAppControl, v4);
  v5 = sub_100002F8C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100002EA4();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100002EA4()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&unk_100003A28, &type metadata for LauncherControlBundle);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for LauncherControlBundle()
{
  return &type metadata for LauncherControlBundle;
}

uint64_t sub_100002EF8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003B2C, 1);
}

uint64_t sub_100002F08(uint64_t *a1)
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

unint64_t sub_100002F48()
{
  unint64_t result;

  result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    result = swift_getWitnessTable(&unk_100003AA4, &type metadata for LaunchAppControl);
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

unint64_t sub_100002F8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000080A8;
  if (!qword_1000080A8)
  {
    v1 = sub_100002FD8(&qword_100008098);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000080A8);
  }
  return result;
}

uint64_t sub_100002FD8(uint64_t *a1)
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

uint64_t sub_10000301C()
{
  _QWORD v1[2];

  v1[0] = sub_100002FD8(&qword_100008098);
  v1[1] = sub_100002F8C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

ValueMetadata *type metadata accessor for LaunchAppControl()
{
  return &type metadata for LaunchAppControl;
}

uint64_t sub_100003078(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003B70, 1);
}

uint64_t sub_100003088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t OpaqueTypeConformance2;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;

  v62 = a1;
  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v2 = *(_QWORD *)(v1 - 8);
  v48 = v1;
  __chkstk_darwin();
  v63 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringResource(0);
  v53 = *(_QWORD *)(v8 - 8);
  v54 = v8;
  __chkstk_darwin();
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100002F08(&qword_1000080B0);
  v12 = *(_QWORD *)(v11 - 8);
  v50 = v11;
  v51 = v12;
  __chkstk_darwin();
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100002F08(&qword_1000080B8);
  v16 = *(_QWORD *)(v15 - 8);
  v56 = v15;
  v57 = v16;
  __chkstk_darwin();
  v49 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100002F08(&qword_1000080C0);
  v19 = *(_QWORD *)(v18 - 8);
  v58 = v18;
  v59 = v19;
  __chkstk_darwin();
  v52 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100002F08(&qword_1000080C8);
  v22 = *(_QWORD *)(v21 - 8);
  v60 = v21;
  v61 = v22;
  __chkstk_darwin();
  v55 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100002F08(&qword_1000080D0);
  v25 = sub_1000036F8(&qword_1000080D8, &qword_1000080D0, (uint64_t)&protocol conformance descriptor for ControlWidgetButton<A, B, C>);
  StaticControlConfiguration.init(kind:content:)(0xD000000000000020, 0x8000000100003E40, sub_10000355C, 0, v24, v25);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100003E70);
  static Locale.current.getter(v26);
  v27 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v28 = v63;
  v47(v63, enum case for LocalizedStringResource.BundleDescription.main(_:), v1);
  v29 = v5;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0xD000000000000018, 0x8000000100003A50, v5, v28, 0, 0, 256);
  v30 = sub_1000036F8(&qword_1000080E0, &qword_1000080B0, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  v31 = v50;
  ControlWidgetConfiguration.displayName(_:)(v10, v50, v30);
  v32 = v54;
  v33 = *(void (**)(char *, uint64_t))(v53 + 8);
  v33(v10, v54);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v31);
  v34 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ALL, 0x8000000100003E90);
  static Locale.current.getter(v34);
  v35 = v63;
  v47(v63, v27, v48);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0xD000000000000018, 0x8000000100003A50, v29, v35, 0, 0, 256);
  v64 = v31;
  v65 = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v64, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v37 = v52;
  v38 = v56;
  v39 = v49;
  ControlWidgetConfiguration.description(_:)(v10, v56, OpaqueTypeConformance2);
  v33(v10, v32);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v39, v38);
  v64 = v38;
  v65 = OpaqueTypeConformance2;
  v40 = swift_getOpaqueTypeConformance2(&v64, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v41 = v55;
  v42 = v58;
  ControlWidgetConfiguration.showsContextualMenu(_:)(1, v58, v40);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v37, v42);
  v64 = v42;
  v65 = v40;
  v43 = swift_getOpaqueTypeConformance2(&v64, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsContextualMenu(_:)>>, 1);
  v44 = v60;
  ControlWidgetConfiguration.showsInSystemSpaces()(v60, v43);
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v41, v44);
}

uint64_t sub_10000355C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;

  v4 = LaunchAppIntent.init()();
  v0 = sub_100002F08(&qword_1000080E8);
  v1 = sub_1000036F8(&qword_1000080F0, &qword_1000080E8, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v2 = sub_100003738();
  return ControlWidgetButton.init<>(action:label:)(&v4, sub_1000035F0, 0, v0, &type metadata for LaunchAppIntent, v1, v2);
}

uint64_t sub_1000035F0()
{
  return Label.init(title:icon:)(sub_10000362C, 0, sub_1000036B4, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_10000362C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000014, 0x8000000100003EB0);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1000036B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Image.init(systemName:)(0x662E6172656D6163, 0xEB000000006C6C69);
  *a1 = result;
  return result;
}

uint64_t sub_1000036F8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100002FD8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100003738()
{
  unint64_t result;

  result = qword_1000080F8;
  if (!qword_1000080F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&qword_1000080F8);
  }
  return result;
}

uint64_t sub_10000377C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_100002FD8(&qword_1000080C8);
  v1 = sub_100002FD8(&qword_1000080C0);
  v2 = sub_100002FD8(&qword_1000080B8);
  v7 = sub_100002FD8(&qword_1000080B0);
  v8 = sub_1000036F8(&qword_1000080E0, &qword_1000080B0, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsContextualMenu(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>, 1);
}

uint64_t sub_100003868()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24LauncherControlExtensionP33_31CFAC85211BD917064FF751DC29FD7719ResourceBundleClass);
}
