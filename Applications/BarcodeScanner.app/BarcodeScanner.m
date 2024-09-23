uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(BCSAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

uint64_t sub_1000036D8()
{
  if (qword_10000D028[0] != -1)
    dispatch_once(qword_10000D028, &stru_100008370);
  return qword_10000D020;
}

void sub_100003718(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.BarcodeScanner.LifeCycle", "BarcodeScannerLifeCycle");
  v2 = (void *)qword_10000D020;
  qword_10000D020 = (uint64_t)v1;

}

unint64_t sub_100003C04()
{
  unint64_t result;

  result = qword_10000CE98;
  if (!qword_10000CE98)
  {
    result = swift_getWitnessTable(&unk_100005E6C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000CE98);
  }
  return result;
}

unint64_t sub_100003C4C()
{
  unint64_t result;

  result = qword_10000CEA0;
  if (!qword_10000CEA0)
  {
    result = swift_getWitnessTable(&unk_100005FB8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEA0);
  }
  return result;
}

uint64_t sub_100003C90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for LocalizedStringResource(0);
  sub_100005440(v8, qword_10000D930);
  sub_100005428(v8, (uint64_t)qword_10000D930);
  v9 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100005C70);
  static Locale.current.getter(v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0x6E65746E49707041, 0xEA00000000007374, v5, v3, "Code Scanner App Intent title", 29, 2);
}

uint64_t sub_100003E14(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[6] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_100003EA8, v5, v6);
}

uint64_t sub_100003EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = swift_release(*(_QWORD *)(v0 + 48));
  v2 = static Logger.intent.getter(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "BarcodeScannerIntent performed successfully", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v7 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 24);

  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  static IntentResult.result<>()(v9);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003F88()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100003FA8()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_100003FC8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100004010;
}

void sub_100004010(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100004044()
{
  unint64_t result;

  result = qword_10000CEA8;
  if (!qword_10000CEA8)
  {
    result = swift_getWitnessTable(&unk_100005E94, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000CEA8);
  }
  return result;
}

unint64_t sub_10000408C()
{
  unint64_t result;

  result = qword_10000CEB0;
  if (!qword_10000CEB0)
  {
    result = swift_getWitnessTable(&unk_100005EBC, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000CEB0);
  }
  return result;
}

uint64_t sub_1000040D0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007CD4, 1);
}

uint64_t sub_1000040E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004C04(a1, a2, a3, (uint64_t (*)(void))sub_1000040F4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_1000040F4()
{
  unint64_t result;

  result = qword_10000CEB8;
  if (!qword_10000CEB8)
  {
    result = swift_getWitnessTable(&unk_100005D9C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000CEB8);
  }
  return result;
}

uint64_t sub_100004138@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B80(&qword_10000CE80, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D930, (uint64_t)sub_100003C90, a1);
}

uint64_t sub_10000415C()
{
  return 1;
}

uint64_t sub_100004168()
{
  return 0;
}

uint64_t sub_100004178(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10000CF7C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000041C8;
  return sub_100003E14(a1);
}

uint64_t sub_1000041C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004210@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100005044();
  *a1 = result;
  return result;
}

void *sub_100004234()
{
  return &protocol witness table for Never;
}

void *sub_100004240()
{
  return &protocol witness table for Never;
}

uint64_t sub_100004250(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000040F4();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100004278()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100005004(&qword_10000CF48);
  __chkstk_darwin(v3);
  v21[0] = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100005440(v16, qword_10000D948);
  sub_100005428(v16, (uint64_t)qword_10000D948);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v11, v8, 0, 0, 256);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

unint64_t sub_1000044A0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t result;
  uint64_t v27;
  char *v28;
  char *v29;

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100005004(&qword_10000CF40);
  __chkstk_darwin(v3);
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005004(&qword_10000CF48);
  __chkstk_darwin(v5);
  v28 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100005004(&qword_10000CF50);
  v19 = sub_100005004(&qword_10000CF58);
  v20 = swift_allocObject(v18, ((*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) | 7);
  *(_OWORD *)(v20 + 16) = xmmword_100005D30;
  v21 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v13, v10, 0, 0, 256);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v23 = v28;
  v22(v28, 1, 1, v14);
  v24 = type metadata accessor for DisplayRepresentation.Image(0);
  v25 = v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v29, 1, 1, v24);
  DisplayRepresentation.init(title:subtitle:image:)(v17, v23, v25);
  result = sub_100004768(v20);
  qword_10000D960 = result;
  return result;
}

unint64_t sub_100004768(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_100005004(&qword_10000CF58);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005004(&qword_10000CF60);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v12 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000053E0(v11, (uint64_t)v5);
    result = sub_100005390();
    if ((v14 & 1) != 0)
      break;
    v15 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = v8[7];
    v17 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15, v5, v17);
    v18 = v8[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v8[2] = v20;
    v11 += v12;
    if (!--v9)
    {
      swift_release(v8);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000048D8()
{
  unint64_t result;

  result = qword_10000CEC8;
  if (!qword_10000CEC8)
  {
    result = swift_getWitnessTable(&unk_100005ED8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEC8);
  }
  return result;
}

uint64_t sub_100004928@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000083B8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100004978@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100005480();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000049A0()
{
  unint64_t result;

  result = qword_10000CED0;
  if (!qword_10000CED0)
  {
    result = swift_getWitnessTable(&unk_100005FF0, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CED0);
  }
  return result;
}

unint64_t sub_1000049E8()
{
  unint64_t result;

  result = qword_10000CED8;
  if (!qword_10000CED8)
  {
    result = swift_getWitnessTable(&unk_100005F40, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CED8);
  }
  return result;
}

void *sub_100004A2C()
{
  return &protocol witness table for String;
}

unint64_t sub_100004A3C()
{
  unint64_t result;

  result = qword_10000CEE0;
  if (!qword_10000CEE0)
  {
    result = swift_getWitnessTable(&unk_100006020, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEE0);
  }
  return result;
}

unint64_t sub_100004A84()
{
  unint64_t result;

  result = qword_10000CEE8;
  if (!qword_10000CEE8)
  {
    result = swift_getWitnessTable(&unk_100006048, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEE8);
  }
  return result;
}

unint64_t sub_100004ACC()
{
  unint64_t result;

  result = qword_10000CEF0;
  if (!qword_10000CEF0)
  {
    result = swift_getWitnessTable(&unk_100006070, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEF0);
  }
  return result;
}

unint64_t sub_100004B14()
{
  unint64_t result;

  result = qword_10000CEF8;
  if (!qword_10000CEF8)
  {
    result = swift_getWitnessTable(&unk_1000060C8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CEF8);
  }
  return result;
}

uint64_t sub_100004B5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004B80(&qword_10000CE88, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D948, (uint64_t)sub_100004278, a1);
}

uint64_t sub_100004B80@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100005428(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_100004BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004C04(a1, a2, a3, (uint64_t (*)(void))sub_100004C44, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_100004C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

unint64_t sub_100004C44()
{
  unint64_t result;

  result = qword_10000CF00;
  if (!qword_10000CF00)
  {
    result = swift_getWitnessTable(&unk_100005F78, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CF00);
  }
  return result;
}

uint64_t sub_100004C88(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004C44();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004CC4()
{
  unint64_t result;

  result = qword_10000CF08;
  if (!qword_10000CF08)
  {
    result = swift_getWitnessTable(&unk_100006108, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CF08);
  }
  return result;
}

unint64_t sub_100004D0C()
{
  unint64_t result;

  result = qword_10000CF10;
  if (!qword_10000CF10)
  {
    result = swift_getWitnessTable(&unk_100006130, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CF10);
  }
  return result;
}

unint64_t sub_100004D54()
{
  unint64_t result;

  result = qword_10000CF18;
  if (!qword_10000CF18)
  {
    result = swift_getWitnessTable(&unk_100005F00, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000CF18);
  }
  return result;
}

uint64_t sub_100004D98()
{
  if (qword_10000CE90 != -1)
    swift_once(&qword_10000CE90, sub_1000044A0);
  return swift_bridgeObjectRetain(qword_10000D960);
}

uint64_t sub_100004DD8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004B14();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100004E10()
{
  return sub_100004FC4(&qword_10000CF20, &qword_10000CF28, (uint64_t)&protocol conformance descriptor for [A]);
}

uint64_t sub_100004E3C(uint64_t *a1)
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

void sub_100004E80(_QWORD *a1@<X8>)
{
  *a1 = &off_1000083F0;
}

uint64_t getEnumTagSinglePayload for LaunchCodeScannerAppEnum(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LaunchCodeScannerAppEnum(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100004F28 + 4 * byte_100005D40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100004F48 + 4 * byte_100005D45[v4]))();
}

_BYTE *sub_100004F28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100004F48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004F50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004F58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004F60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100004F68(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeScannerAppEnum()
{
  return &type metadata for LaunchCodeScannerAppEnum;
}

ValueMetadata *type metadata accessor for BarcodeScannerIntent()
{
  return &type metadata for BarcodeScannerIntent;
}

uint64_t sub_100004F98()
{
  return sub_100004FC4(&qword_10000CF30, &qword_10000CF38, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100004FC4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004E3C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005004(uint64_t *a1)
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

uint64_t sub_100005044()
{
  uint64_t v0;
  char *v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  char *v25;
  unint64_t v26;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33[2];

  type metadata accessor for String.LocalizationValue(0);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  ((void (*)(void))__chkstk_darwin)();
  v30 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005004(&qword_10000CF68);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v28 - v6;
  v8 = sub_100005004(&qword_10000CF48);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Locale(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LocalizedStringResource(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  v28 = sub_100005004(&qword_10000CF70);
  static Locale.current.getter(v28);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for LocalizedStringResource.BundleDescription.main(_:), v11);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0x6E65746E49707041, 0xEA00000000007374, v17, v14, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v10, 1, 1, v18);
  v33[0] = 1;
  v22 = type metadata accessor for IntentDialog(0);
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v7, 1, 1, v22);
  v24 = v29;
  v23(v29, 1, 1, v22);
  v25 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v30, enum case for InputConnectionBehavior.default(_:), v32);
  v26 = sub_100004C44();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v21, v10, v33, v7, v24, v25, &off_100008390, v26);
}

uint64_t sub_100005364(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t sub_100005390()
{
  uint64_t v0;
  Swift::Int v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v0 + 40));
  String.hash(into:)(v3, 0x68636E75616CLL, 0xE600000000000000);
  v1 = Hasher._finalize()();
  return sub_100005364(v1);
}

uint64_t sub_1000053E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005004(&qword_10000CF58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005428(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005440(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005480()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100005494()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t sub_1000054E0(uint64_t a1)
{
  return String.hash(into:)(a1, 0x68636E75616CLL, 0xE600000000000000);
}

Swift::Int sub_1000054F4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t sub_10000553C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC14BarcodeScannerP33_C3B591404CB3B922C1AE069CDD04702919ResourceBundleClass);
}

void sub_10000556C(void *a1)
{
  void *v1;
  int v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_bcs_privacyPreservingDescription"));
  v2 = 138543362;
  v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BarcodeScanner: Failed to continue user activity %{public}@", (uint8_t *)&v2, 0xCu);

}

id objc_msgSend__bcs_privacyPreservingDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bcs_privacyPreservingDescription");
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationDidEnterBackground");
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationWillEnterForeground");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_continueUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueUserActivity:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_resumeCapturing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeCapturing");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_suspendCapturing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendCapturing");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
