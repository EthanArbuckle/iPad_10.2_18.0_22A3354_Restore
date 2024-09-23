unint64_t sub_1000046AC()
{
  unint64_t result;

  result = qword_10000C018;
  if (!qword_10000C018)
  {
    result = swift_getWitnessTable(&unk_10000714C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

unint64_t sub_1000046F4()
{
  unint64_t result;

  result = qword_10000C020;
  if (!qword_10000C020)
  {
    result = swift_getWitnessTable(&unk_100007298, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t sub_100004738()
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
  sub_100005EE8(v8, qword_10000C170);
  sub_100005ED0(v8, (uint64_t)qword_10000C170);
  v9 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100007560);
  static Locale.current.getter(v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0x6E65746E49707041, 0xEA00000000007374, v5, v3, "Code Scanner App Intent title", 29, 2);
}

uint64_t sub_1000048BC(uint64_t a1)
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
  return swift_task_switch(sub_100004950, v5, v6);
}

uint64_t sub_100004950()
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

uint64_t sub_100004A30()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100004A50()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_100004A70(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100004AB8;
}

void sub_100004AB8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100004AEC()
{
  unint64_t result;

  result = qword_10000C028;
  if (!qword_10000C028)
  {
    result = swift_getWitnessTable(&unk_100007174, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_100004B34()
{
  unint64_t result;

  result = qword_10000C030;
  if (!qword_10000C030)
  {
    result = swift_getWitnessTable(&unk_10000719C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100004B78(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007BFC, 1);
}

uint64_t sub_100004B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000056AC(a1, a2, a3, (uint64_t (*)(void))sub_100004B9C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_100004B9C()
{
  unint64_t result;

  result = qword_10000C038;
  if (!qword_10000C038)
  {
    result = swift_getWitnessTable(&unk_10000707C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_100004BE0@<X0>(uint64_t a1@<X8>)
{
  return sub_100005628(&qword_10000C000, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000C170, (uint64_t)sub_100004738, a1);
}

uint64_t sub_100004C04()
{
  return 1;
}

uint64_t sub_100004C10()
{
  return 0;
}

uint64_t sub_100004C20(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10000C0FC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100004C70;
  return sub_1000048BC(a1);
}

uint64_t sub_100004C70()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004CB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100005AEC();
  *a1 = result;
  return result;
}

void *sub_100004CDC()
{
  return &protocol witness table for Never;
}

void *sub_100004CE8()
{
  return &protocol witness table for Never;
}

uint64_t sub_100004CF8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004B9C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100004D20()
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
  v3 = sub_100005AAC(&qword_10000C0C8);
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
  sub_100005EE8(v16, qword_10000C188);
  sub_100005ED0(v16, (uint64_t)qword_10000C188);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v11, v8, 0, 0, 256);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

unint64_t sub_100004F48()
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
  v3 = sub_100005AAC(&qword_10000C0C0);
  __chkstk_darwin(v3);
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005AAC(&qword_10000C0C8);
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
  v18 = sub_100005AAC(&qword_10000C0D0);
  v19 = sub_100005AAC(&qword_10000C0D8);
  v20 = swift_allocObject(v18, ((*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) | 7);
  *(_OWORD *)(v20 + 16) = xmmword_100007010;
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
  result = sub_100005210(v20);
  qword_10000C1A0 = result;
  return result;
}

unint64_t sub_100005210(uint64_t a1)
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

  v2 = sub_100005AAC(&qword_10000C0D8);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005AAC(&qword_10000C0E0);
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
    sub_100005E88(v11, (uint64_t)v5);
    result = sub_100005E38();
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

unint64_t sub_100005380()
{
  unint64_t result;

  result = qword_10000C048;
  if (!qword_10000C048)
  {
    result = swift_getWitnessTable(&unk_1000071B8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_1000053D0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008398, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100005420@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100005F28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100005448()
{
  unint64_t result;

  result = qword_10000C050;
  if (!qword_10000C050)
  {
    result = swift_getWitnessTable(&unk_1000072D0, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100005490()
{
  unint64_t result;

  result = qword_10000C058;
  if (!qword_10000C058)
  {
    result = swift_getWitnessTable(&unk_100007220, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

void *sub_1000054D4()
{
  return &protocol witness table for String;
}

unint64_t sub_1000054E4()
{
  unint64_t result;

  result = qword_10000C060;
  if (!qword_10000C060)
  {
    result = swift_getWitnessTable(&unk_100007300, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_10000552C()
{
  unint64_t result;

  result = qword_10000C068;
  if (!qword_10000C068)
  {
    result = swift_getWitnessTable(&unk_100007328, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100005574()
{
  unint64_t result;

  result = qword_10000C070;
  if (!qword_10000C070)
  {
    result = swift_getWitnessTable(&unk_100007350, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_1000055BC()
{
  unint64_t result;

  result = qword_10000C078;
  if (!qword_10000C078)
  {
    result = swift_getWitnessTable(&unk_1000073A8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

uint64_t sub_100005604@<X0>(uint64_t a1@<X8>)
{
  return sub_100005628(&qword_10000C008, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000C188, (uint64_t)sub_100004D20, a1);
}

uint64_t sub_100005628@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100005ED0(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_100005698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000056AC(a1, a2, a3, (uint64_t (*)(void))sub_1000056EC, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_1000056AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

unint64_t sub_1000056EC()
{
  unint64_t result;

  result = qword_10000C080;
  if (!qword_10000C080)
  {
    result = swift_getWitnessTable(&unk_100007258, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100005730(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000056EC();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000576C()
{
  unint64_t result;

  result = qword_10000C088;
  if (!qword_10000C088)
  {
    result = swift_getWitnessTable(&unk_1000073E8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

unint64_t sub_1000057B4()
{
  unint64_t result;

  result = qword_10000C090;
  if (!qword_10000C090)
  {
    result = swift_getWitnessTable(&unk_100007410, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_1000057FC()
{
  unint64_t result;

  result = qword_10000C098;
  if (!qword_10000C098)
  {
    result = swift_getWitnessTable(&unk_1000071E0, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_100005840()
{
  if (qword_10000C010 != -1)
    swift_once(&qword_10000C010, sub_100004F48);
  return swift_bridgeObjectRetain(qword_10000C1A0);
}

uint64_t sub_100005880(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000055BC();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000058B8()
{
  return sub_100005A6C(&qword_10000C0A0, &qword_10000C0A8, (uint64_t)&protocol conformance descriptor for [A]);
}

uint64_t sub_1000058E4(uint64_t *a1)
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

void sub_100005928(_QWORD *a1@<X8>)
{
  *a1 = &off_1000083D0;
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
    return ((uint64_t (*)(void))((char *)sub_1000059D0 + 4 * byte_100007020[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000059F0 + 4 * byte_100007025[v4]))();
}

_BYTE *sub_1000059D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000059F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000059F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100005A00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100005A08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100005A10(_DWORD *result)
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

uint64_t sub_100005A40()
{
  return sub_100005A6C(&qword_10000C0B0, &qword_10000C0B8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100005A6C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000058E4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005AAC(uint64_t *a1)
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

uint64_t sub_100005AEC()
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
  sub_100005AAC(&qword_10000C0E8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v28 - v6;
  v8 = sub_100005AAC(&qword_10000C0C8);
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
  v28 = sub_100005AAC(&qword_10000C0F0);
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
  v26 = sub_1000056EC();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v21, v10, v33, v7, v24, v25, &off_100008370, v26);
}

uint64_t sub_100005E0C(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t sub_100005E38()
{
  uint64_t v0;
  Swift::Int v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v0 + 40));
  String.hash(into:)(v3, 0x68636E75616CLL, 0xE600000000000000);
  v1 = Hasher._finalize()();
  return sub_100005E0C(v1);
}

uint64_t sub_100005E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005AAC(&qword_10000C0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005ED0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005EE8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005F28()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100005F3C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t sub_100005F88(uint64_t a1)
{
  return String.hash(into:)(a1, 0x68636E75616CLL, 0xE600000000000000);
}

Swift::Int sub_100005F9C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t sub_100005FE4()
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
  unint64_t v12;
  unint64_t v13;
  _QWORD v16[3];

  v0 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v16[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005AAC(&qword_10000C108);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v10);
  v16[0] = String.init(localized:table:bundle:locale:comment:)(v2, 0x617A696C61636F4CLL, 0xEB00000000656C62, 0, v5, "Code Scanner control button title", 33, 2);
  v16[1] = v11;
  v12 = sub_100006204();
  _ControlWidgetAdaptor.init(_:)(v16, &type metadata for BarcodeScannerWidget, v12);
  v13 = sub_100006248();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v9, v6, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000061A0();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_1000061A0()
{
  unint64_t result;

  result = qword_10000C100;
  if (!qword_10000C100)
  {
    result = swift_getWitnessTable(&unk_1000074CC, &type metadata for BarcodeScannerWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScannerWidgetBundle()
{
  return &type metadata for BarcodeScannerWidgetBundle;
}

uint64_t sub_1000061F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007C40, 1);
}

unint64_t sub_100006204()
{
  unint64_t result;

  result = qword_10000C110;
  if (!qword_10000C110)
  {
    result = swift_getWitnessTable(&unk_100007528, &type metadata for BarcodeScannerWidget);
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

unint64_t sub_100006248()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C118;
  if (!qword_10000C118)
  {
    v1 = sub_1000058E4(&qword_10000C108);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

uint64_t sub_100006294()
{
  _QWORD v1[2];

  v1[0] = sub_1000058E4(&qword_10000C108);
  v1[1] = sub_100006248();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

_QWORD *initializeBufferWithCopyOfBuffer for BarcodeScannerWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BarcodeScannerWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for BarcodeScannerWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for BarcodeScannerWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for BarcodeScannerWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BarcodeScannerWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BarcodeScannerWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BarcodeScannerWidget()
{
  return &type metadata for BarcodeScannerWidget;
}

uint64_t sub_100006424(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007C84, 1);
}

uint64_t sub_100006434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v16;
  uint64_t v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t OpaqueTypeConformance2;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v66 = a3;
  v5 = type metadata accessor for String.LocalizationValue(0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v65 = (char *)&v52 - v9;
  v10 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v11 = *(_QWORD *)(v10 - 8);
  v53 = v10;
  __chkstk_darwin(v10);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Locale(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedStringResource(0);
  v58 = *(_QWORD *)(v17 - 8);
  v59 = v17;
  v18 = __chkstk_darwin(v17);
  v61 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v21 = (char *)&v52 - v20;
  v22 = sub_100005AAC(&qword_10000C120);
  v23 = *(_QWORD *)(v22 - 8);
  v55 = v22;
  v56 = v23;
  __chkstk_darwin(v22);
  v25 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_100005AAC(&qword_10000C128);
  v62 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v54 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100005AAC(&qword_10000C130);
  v28 = *(_QWORD *)(v27 - 8);
  v63 = v27;
  v64 = v28;
  __chkstk_darwin(v27);
  v57 = (char *)&v52 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_allocObject(&unk_1000088E0, 32, 7);
  *(_QWORD *)(v30 + 16) = a1;
  *(_QWORD *)(v30 + 24) = a2;
  swift_bridgeObjectRetain(a2);
  v31 = sub_100005AAC(&qword_10000C138);
  v32 = sub_100005A6C(&qword_10000C140, &qword_10000C138, (uint64_t)&protocol conformance descriptor for ControlWidgetButton<A, B, C>);
  StaticControlConfiguration.init(kind:content:)(0xD00000000000001FLL, 0x80000001000075D0, sub_100006A80, v30, v31, v32);
  v33 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  v34 = v16;
  static Locale.current.getter(v33);
  v35 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
  v52(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  v36 = v16;
  v37 = v13;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v8, 0x617A696C61636F4CLL, 0xEB00000000656C62, v36, v13, "Code Scanner control button title", 33, 2);
  v38 = sub_100005A6C(&qword_10000C148, &qword_10000C120, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  v40 = v54;
  v39 = v55;
  ControlWidgetConfiguration.displayName(_:)(v21, v55, v38);
  v41 = v59;
  v42 = *(void (**)(char *, uint64_t))(v58 + 8);
  v42(v21, v59);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v25, v39);
  v43 = v65;
  v44 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000068, 0x80000001000075F0);
  static Locale.current.getter(v44);
  v52(v37, v35, v53);
  v45 = v61;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v43, 0x617A696C61636F4CLL, 0xEB00000000656C62, v34, v37, "Open Code Scanner to scan QR and App Clip codes for links to websites, apps, coupons, tickets, and more.", 104, 2);
  v67 = v39;
  v68 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v67, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v47 = v57;
  v48 = v60;
  ControlWidgetConfiguration.description(_:)(v45, v60, OpaqueTypeConformance2);
  v42(v45, v41);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v40, v48);
  v67 = v48;
  v68 = OpaqueTypeConformance2;
  v49 = swift_getOpaqueTypeConformance2(&v67, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v50 = v63;
  ControlWidgetConfiguration.showsInSystemSpaces()(v63, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v47, v50);
}

uint64_t sub_1000068FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  v9 = sub_100005AEC();
  v4 = swift_allocObject(&unk_100008908, 32, 7);
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_bridgeObjectRetain(a2);
  v5 = sub_100005AAC(&qword_10000C150);
  v6 = sub_100005A6C(&qword_10000C158, &qword_10000C150, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v7 = sub_100006A90();
  return ControlWidgetButton.init<>(action:label:)(&v9, sub_100006A88, v4, v5, &type metadata for BarcodeScannerIntent, v6, v7);
}

uint64_t sub_1000069BC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  _QWORD v5[2];

  v5[0] = a1;
  v5[1] = a2;
  v3 = sub_100006AD4();
  swift_bridgeObjectRetain(a2);
  return Label<>.init<A>(_:systemImage:)(v5, 0xD000000000000011, 0x8000000100007660, &type metadata for String, v3);
}

uint64_t sub_100006A30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100006B18();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006A54@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100006434(*v1, v1[1], a1);
}

uint64_t sub_100006A5C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006A80()
{
  uint64_t v0;

  return sub_1000068FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100006A88()
{
  uint64_t v0;

  return sub_1000069BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_100006A90()
{
  unint64_t result;

  result = qword_10000C160;
  if (!qword_10000C160)
  {
    result = swift_getWitnessTable(&unk_10000702C, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C160);
  }
  return result;
}

unint64_t sub_100006AD4()
{
  unint64_t result;

  result = qword_10000C168;
  if (!qword_10000C168)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C168);
  }
  return result;
}

uint64_t sub_100006B18()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE v6[16];

  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v1 = &v6[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v4);
  return String.init(localized:table:bundle:locale:comment:)(v1, 0x617A696C61636F4CLL, 0xEB00000000656C62, 0, v3, "Code Scanner control button title", 33, 2);
}

uint64_t sub_100006C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000058E4(&qword_10000C130);
  v1 = sub_1000058E4(&qword_10000C128);
  v5 = sub_1000058E4(&qword_10000C120);
  v6 = sub_100005A6C(&qword_10000C148, &qword_10000C120, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>, 1);
}
