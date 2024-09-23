id sub_100004EB8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  type metadata accessor for BCSSecureCaptureSession(0);
  static BCSSecureCaptureSession.setSession(session:)(v1);
  return objc_msgSend(objc_allocWithZone((Class)BCSRootViewController), "init");
}

uint64_t sub_100004F0C(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_100004F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000053D8();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100004F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000053D8();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100004FE4()
{
  return static View._viewListCount(inputs:)();
}

void sub_100004FFC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000053D8();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_100005020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = swift_retain();
  v5 = static SafeAreaRegions.all.getter(v4);
  result = static Edge.Set.all.getter();
  *(_QWORD *)a2 = a1;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = result;
  return result;
}

uint64_t sub_100005060()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100005234(&qword_10000C038);
  v1 = sub_100005274();
  return LockedCameraCaptureUIScene.init(content:)(sub_100005020, 0, v0, v1);
}

uint64_t sub_1000050AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000051F0();
  return LockedCameraCaptureExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000513C();
  static AppExtension<>.main()();
  return 0;
}

unint64_t sub_10000513C()
{
  unint64_t result;

  result = qword_10000C020;
  if (!qword_10000C020)
  {
    result = swift_getWitnessTable(&unk_100007150, &type metadata for BarcodeScannerCaptureExtension);
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScannerCaptureExtension()
{
  return &type metadata for BarcodeScannerCaptureExtension;
}

uint64_t sub_100005194(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000772C, 1);
}

unint64_t sub_1000051A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C028;
  if (!qword_10000C028)
  {
    v1 = type metadata accessor for AppExtensionSceneConfiguration(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppExtensionSceneConfiguration, v1);
    atomic_store(result, (unint64_t *)&qword_10000C028);
  }
  return result;
}

unint64_t sub_1000051F0()
{
  unint64_t result;

  result = qword_10000C030;
  if (!qword_10000C030)
  {
    result = swift_getWitnessTable(&unk_100007110, &type metadata for BarcodeScannerCaptureExtension);
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100005234(uint64_t *a1)
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

unint64_t sub_100005274()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C040;
  if (!qword_10000C040)
  {
    v1 = sub_1000052E0(&qword_10000C038);
    sub_100005324();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

uint64_t sub_1000052E0(uint64_t *a1)
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

unint64_t sub_100005324()
{
  unint64_t result;

  result = qword_10000C048;
  if (!qword_10000C048)
  {
    result = swift_getWitnessTable(&unk_100007218, &type metadata for BarcodeScanner);
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

ValueMetadata *type metadata accessor for BarcodeScanner()
{
  return &type metadata for BarcodeScanner;
}

unint64_t sub_10000537C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C050;
  if (!qword_10000C050)
  {
    v1 = sub_1000052E0(&qword_10000C058);
    result = swift_getWitnessTable(&protocol conformance descriptor for LockedCameraCaptureUIScene<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

void *sub_1000053CC()
{
  return &protocol witness table for Never;
}

unint64_t sub_1000053D8()
{
  unint64_t result;

  result = qword_10000C060;
  if (!qword_10000C060)
  {
    result = swift_getWitnessTable(&unk_1000071A0, &type metadata for BarcodeScanner);
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100005420()
{
  unint64_t result;

  result = qword_10000C068;
  if (!qword_10000C068)
  {
    result = swift_getWitnessTable(&unk_1000073AC, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_100005468()
{
  unint64_t result;

  result = qword_10000C070;
  if (!qword_10000C070)
  {
    result = swift_getWitnessTable(&unk_1000074F8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

uint64_t sub_1000054AC()
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
  sub_100006BD4(v8, qword_10000CC50);
  sub_100006BBC(v8, (uint64_t)qword_10000CC50);
  v9 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100007080);
  static Locale.current.getter(v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0x6E65746E49707041, 0xEA00000000007374, v5, v3, "Code Scanner App Intent title", 29, 2);
}

uint64_t sub_100005630(uint64_t a1)
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
  return swift_task_switch(sub_1000056C4, v5, v6);
}

uint64_t sub_1000056C4()
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

uint64_t sub_1000057A4()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000057C4()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_1000057E4(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_10000582C;
}

void sub_10000582C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100005860()
{
  unint64_t result;

  result = qword_10000C078;
  if (!qword_10000C078)
  {
    result = swift_getWitnessTable(&unk_1000073D4, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_1000058A8()
{
  unint64_t result;

  result = qword_10000C080;
  if (!qword_10000C080)
  {
    result = swift_getWitnessTable(&unk_1000073FC, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_1000058EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000778C, 1);
}

uint64_t sub_1000058FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006420(a1, a2, a3, (uint64_t (*)(void))sub_100005910, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_100005910()
{
  unint64_t result;

  result = qword_10000C088;
  if (!qword_10000C088)
  {
    result = swift_getWitnessTable(&unk_1000072DC, &type metadata for BarcodeScannerIntent);
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_100005954@<X0>(uint64_t a1@<X8>)
{
  return sub_10000639C(&qword_10000C008, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CC50, (uint64_t)sub_1000054AC, a1);
}

uint64_t sub_100005978()
{
  return 1;
}

uint64_t sub_100005984()
{
  return 0;
}

uint64_t sub_100005994(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10000C14C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000059E4;
  return sub_100005630(a1);
}

uint64_t sub_1000059E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005A2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000067D8();
  *a1 = result;
  return result;
}

void *sub_100005A50()
{
  return &protocol witness table for Never;
}

void *sub_100005A5C()
{
  return &protocol witness table for Never;
}

uint64_t sub_100005A6C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005910();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100005A94()
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
  v3 = sub_100005234(&qword_10000C118);
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
  sub_100006BD4(v16, qword_10000CC68);
  sub_100006BBC(v16, (uint64_t)qword_10000CC68);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x646F43206E616353, 0xE900000000000065);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v2, 0x6E65746E49707041, 0xEA00000000007374, v11, v8, 0, 0, 256);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

unint64_t sub_100005CBC()
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
  v3 = sub_100005234(&qword_10000C110);
  __chkstk_darwin(v3);
  v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005234(&qword_10000C118);
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
  v18 = sub_100005234(&qword_10000C120);
  v19 = sub_100005234(&qword_10000C128);
  v20 = swift_allocObject(v18, ((*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v19 - 8) + 80) | 7);
  *(_OWORD *)(v20 + 16) = xmmword_100007270;
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
  result = sub_100005F84(v20);
  qword_10000CC80 = result;
  return result;
}

unint64_t sub_100005F84(uint64_t a1)
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

  v2 = sub_100005234(&qword_10000C128);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005234(&qword_10000C130);
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
    sub_100006B74(v11, (uint64_t)v5);
    result = sub_100006B24();
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

unint64_t sub_1000060F4()
{
  unint64_t result;

  result = qword_10000C098;
  if (!qword_10000C098)
  {
    result = swift_getWitnessTable(&unk_100007418, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_100006144@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000083A8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100006194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100006C14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000061BC()
{
  unint64_t result;

  result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    result = swift_getWitnessTable(&unk_100007530, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

unint64_t sub_100006204()
{
  unint64_t result;

  result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    result = swift_getWitnessTable(&unk_100007480, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

void *sub_100006248()
{
  return &protocol witness table for String;
}

unint64_t sub_100006258()
{
  unint64_t result;

  result = qword_10000C0B0;
  if (!qword_10000C0B0)
  {
    result = swift_getWitnessTable(&unk_100007560, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0B0);
  }
  return result;
}

unint64_t sub_1000062A0()
{
  unint64_t result;

  result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    result = swift_getWitnessTable(&unk_100007588, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

unint64_t sub_1000062E8()
{
  unint64_t result;

  result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    result = swift_getWitnessTable(&unk_1000075B0, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100006330()
{
  unint64_t result;

  result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    result = swift_getWitnessTable(&unk_100007608, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

uint64_t sub_100006378@<X0>(uint64_t a1@<X8>)
{
  return sub_10000639C(&qword_10000C010, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000CC68, (uint64_t)sub_100005A94, a1);
}

uint64_t sub_10000639C@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100006BBC(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_10000640C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006420(a1, a2, a3, (uint64_t (*)(void))sub_100006460, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_100006420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

unint64_t sub_100006460()
{
  unint64_t result;

  result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    result = swift_getWitnessTable(&unk_1000074B8, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

uint64_t sub_1000064A4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006460();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000064E0()
{
  unint64_t result;

  result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    result = swift_getWitnessTable(&unk_100007648, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100006528()
{
  unint64_t result;

  result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    result = swift_getWitnessTable(&unk_100007670, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_100006570()
{
  unint64_t result;

  result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    result = swift_getWitnessTable(&unk_100007440, &type metadata for LaunchCodeScannerAppEnum);
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_1000065B4()
{
  if (qword_10000C018 != -1)
    swift_once(&qword_10000C018, sub_100005CBC);
  return swift_bridgeObjectRetain(qword_10000CC80);
}

uint64_t sub_1000065F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006330();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000662C()
{
  return sub_100006798(&qword_10000C0F0, &qword_10000C0F8, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_100006658(_QWORD *a1@<X8>)
{
  *a1 = &off_1000083E0;
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
    return ((uint64_t (*)(void))((char *)sub_100006700 + 4 * byte_100007280[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100006720 + 4 * byte_100007285[v4]))();
}

_BYTE *sub_100006700(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100006720(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006728(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006730(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006738(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006740(_DWORD *result)
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

uint64_t sub_10000676C()
{
  return sub_100006798(&qword_10000C100, &qword_10000C108, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100006798(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000052E0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000067D8()
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
  sub_100005234(&qword_10000C138);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v29 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v28 - v6;
  v8 = sub_100005234(&qword_10000C118);
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
  v28 = sub_100005234(&qword_10000C140);
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
  v26 = sub_100006460();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v21, v10, v33, v7, v24, v25, &off_100008380, v26);
}

uint64_t sub_100006AF8(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t sub_100006B24()
{
  uint64_t v0;
  Swift::Int v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v0 + 40));
  String.hash(into:)(v3, 0x68636E75616CLL, 0xE600000000000000);
  v1 = Hasher._finalize()();
  return sub_100006AF8(v1);
}

uint64_t sub_100006B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005234(&qword_10000C128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006BBC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100006BD4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006C14()
{
  return 0x68636E75616CLL;
}

Swift::Int sub_100006C28()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t sub_100006C74(uint64_t a1)
{
  return String.hash(into:)(a1, 0x68636E75616CLL, 0xE600000000000000);
}

Swift::Int sub_100006C88(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}
