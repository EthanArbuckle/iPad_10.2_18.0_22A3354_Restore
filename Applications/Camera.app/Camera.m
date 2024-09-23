uint64_t start(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  id location;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_initWeak(&location, v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000023A4;
  v18 = sub_1000023B4;
  v19 = 0;
  v6 = objc_loadWeakRetained(&location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000023BC;
  v12[3] = &unk_1000042A8;
  objc_copyWeak(&v13, &location);
  v12[4] = &v14;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("CAMRegisterAppShortcuts"), 0, v7, v12));
  v9 = (void *)v15[5];
  v15[5] = v8;

  v10 = CAMApplicationMain(a1, a2);
  objc_destroyWeak(&v13);
  _Block_object_dispose(&v14, 8);

  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v4);
  return v10;
}

void sub_100002370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_1000023A4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000023B4(uint64_t a1)
{

}

void sub_1000023BC(uint64_t a1)
{
  id WeakRetained;
  _TtC6Camera28CameraAppShortcutsController *v3;

  v3 = objc_alloc_init(_TtC6Camera28CameraAppShortcutsController);
  -[CameraAppShortcutsController registerAppShortcutsIfNeeded](v3, "registerAppShortcutsIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

id sub_100002484()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CameraAppShortcutsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CameraAppShortcutsController()
{
  return objc_opt_self(_TtC6Camera28CameraAppShortcutsController);
}

unint64_t sub_1000024D4()
{
  unint64_t result;

  result = qword_1000081F0;
  if (!qword_1000081F0)
  {
    result = swift_getWitnessTable(&unk_1000038A0, &type metadata for CameraAppShortcuts);
    atomic_store(result, (unint64_t *)&qword_1000081F0);
  }
  return result;
}

uint64_t sub_100002518()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v0 = sub_10000257C(&qword_1000081F8);
  v1 = swift_allocObject(v0, 48, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100003820;
  v2 = sub_1000025BC();
  *(_QWORD *)(v1 + 32) = &type metadata for CameraUIAppIntents;
  *(_QWORD *)(v1 + 40) = v2;
  return v1;
}

ValueMetadata *type metadata accessor for CameraAppIntents()
{
  return &type metadata for CameraAppIntents;
}

uint64_t sub_10000257C(uint64_t *a1)
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

unint64_t sub_1000025BC()
{
  unint64_t result;

  result = qword_100008200;
  if (!qword_100008200)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CameraUIAppIntents, &type metadata for CameraUIAppIntents);
    atomic_store(result, (unint64_t *)&qword_100008200);
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraAppShortcuts()
{
  return &type metadata for CameraAppShortcuts;
}

uint64_t sub_100002618()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v14;
  unint64_t v15;
  Swift::String v16;
  uint64_t KeyPath;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
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
  unint64_t v34;
  unint64_t v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  Swift::String v39;
  uint64_t v40;
  Swift::String v41;
  uint64_t v42;
  Swift::String v43;
  uint64_t v44;
  Swift::String v45;
  uint64_t v46;
  Swift::String v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  Swift::String v64;
  uint64_t v65;
  uint64_t v66;
  Swift::String v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v102[2];
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  __int128 v112;
  unsigned int v113;
  void (*v114)(char *);
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  _QWORD v121[5];

  v119 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v116 = *(_QWORD *)(v119 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v118 = (char *)v102 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  ((void (*)(void))__chkstk_darwin)();
  v120 = (char *)v102 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v102 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LocalizedStringResource(0);
  ((void (*)(void))__chkstk_darwin)();
  v117 = (char *)v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = type metadata accessor for AppShortcut(0);
  v5 = *(_QWORD *)(v115 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121[0] = OpenCaptureModeIntent.init()(v6);
  v9 = sub_10000257C(&qword_100008208);
  v10 = *(_QWORD *)(sub_10000257C(&qword_100008210) - 8);
  v11 = swift_allocObject(v9, ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72), *(unsigned __int8 *)(v10 + 80) | 7);
  v112 = xmmword_100003820;
  *(_OWORD *)(v11 + 16) = xmmword_100003820;
  v12 = sub_10000257C(&qword_100008218);
  ((void (*)(void))__chkstk_darwin)();
  v14 = (char *)v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000032B8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1, &type metadata for OpenCaptureModeIntent, v15);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v16);
  KeyPath = swift_getKeyPath("hK");
  v18 = sub_10000257C(&qword_100008228);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v12, v18);
  swift_release(KeyPath);
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v19);
  AppShortcutPhrase.init(stringInterpolation:)(v14, &type metadata for OpenCaptureModeIntent, v15);
  v108 = 0xD000000000000025;
  v111 = v3;
  v20 = ((uint64_t (*)(void))String.LocalizationValue.init(stringLiteral:))();
  v21 = v120;
  static Locale.current.getter(v20);
  v113 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v114 = *(void (**)(char *))(v116 + 104);
  v22 = v118;
  v114(v118);
  v23 = v117;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v3, 0x74726F6853707041, 0xEC00000073747563, v21, v22, 0, 0, 256);
  v105 = 0xD000000000000012;
  v110 = v8;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v121, v11, v23);
  v109 = static AppShortcutsBuilder.buildExpression(_:)(v8);
  v116 = *(_QWORD *)(v5 + 8);
  v24 = ((uint64_t (*)(char *, uint64_t))v116)(v8, v115);
  v121[0] = StartCaptureIntent.init()(v24);
  v121[1] = v25;
  v121[2] = v26;
  v27 = sub_10000257C(&qword_100008230);
  v28 = *(_QWORD *)(sub_10000257C(&qword_100008238) - 8);
  v29 = *(_QWORD *)(v28 + 72);
  v30 = *(unsigned __int8 *)(v28 + 80);
  v104 = 2 * v29;
  v31 = swift_allocObject(v27, ((v30 + 32) & ~v30) + 3 * v29, v30 | 7);
  v107 = xmmword_100003880;
  v106 = v31;
  *(_OWORD *)(v31 + 16) = xmmword_100003880;
  v32 = sub_10000257C(&qword_100008240);
  v33 = *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64);
  ((void (*)(void))__chkstk_darwin)();
  v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  v35 = sub_100003324();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(7, 1, &type metadata for StartCaptureIntent, v35);
  v36._countAndFlagsBits = 0x206120656B6154;
  v36._object = (void *)0xE700000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v36);
  v37 = swift_getKeyPath(&unk_100003918);
  v38 = sub_10000257C(&qword_100008250);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v37, v32, v38);
  swift_release(v37);
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v39);
  v40 = AppShortcutPhrase.init(stringInterpolation:)((char *)v102 - v34, &type metadata for StartCaptureIntent, v35);
  __chkstk_darwin(v40);
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(9, 1, &type metadata for StartCaptureIntent, v35);
  v41._countAndFlagsBits = 0x612064726F636552;
  v41._object = (void *)0xE900000000000020;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v41);
  v42 = swift_getKeyPath(&unk_100003918);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v42, v32, v38);
  swift_release(v42);
  v43._countAndFlagsBits = 0;
  v43._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v43);
  v44 = AppShortcutPhrase.init(stringInterpolation:)((char *)v102 - v34, &type metadata for StartCaptureIntent, v35);
  __chkstk_darwin(v44);
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartCaptureIntent, v35);
  v45._object = (void *)0x8000000100003A70;
  v45._countAndFlagsBits = v105;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v45);
  v46 = swift_getKeyPath(&unk_100003918);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v46, v32, v38);
  swift_release(v46);
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v47);
  AppShortcutPhrase.init(stringInterpolation:)((char *)v102 - v34, &type metadata for StartCaptureIntent, v35);
  v48 = v111;
  v49 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000027, 0x8000000100003A90);
  v50 = v120;
  static Locale.current.getter(v49);
  v51 = v118;
  v52 = v113;
  v53 = (void (*)(char *, uint64_t, uint64_t))v114;
  ((void (*)(char *, _QWORD, uint64_t))v114)(v118, v113, v119);
  v54 = v117;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v48, 0x74726F6853707041, 0xEC00000073747563, v50, v51, 0, 0, 256);
  v105 = 0xD00000000000001ALL;
  v104 = 0x8000000100003AC0;
  v55 = v110;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v121, v106, v54);
  v106 = static AppShortcutsBuilder.buildExpression(_:)(v55);
  v56 = ((uint64_t (*)(char *, uint64_t))v116)(v55, v115);
  v121[0] = ChangeCameraDeviceIntent.init()(v56);
  v57 = sub_10000257C(&qword_100008258);
  v58 = *(_QWORD *)(sub_10000257C(&qword_100008260) - 8);
  v59 = swift_allocObject(v57, ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(_QWORD *)(v58 + 72), *(unsigned __int8 *)(v58 + 80) | 7);
  *(_OWORD *)(v59 + 16) = v112;
  v60 = sub_10000257C(&qword_100008268);
  __chkstk_darwin(v60);
  v62 = (char *)v102 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_100003398();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(7, 1, &type metadata for ChangeCameraDeviceIntent, v63);
  v64._countAndFlagsBits = 0;
  v64._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v64);
  v65 = swift_getKeyPath(&unk_100003948);
  v66 = sub_10000257C(&qword_100008278);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v65, v60, v66);
  swift_release(v65);
  v67._countAndFlagsBits = 0x6172656D616320;
  v67._object = (void *)0xE700000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v67);
  AppShortcutPhrase.init(stringInterpolation:)(v62, &type metadata for ChangeCameraDeviceIntent, v63);
  v68 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000027, 0x8000000100003AE0);
  v69 = v120;
  static Locale.current.getter(v68);
  v71 = v118;
  v70 = v119;
  v53(v118, v52, v119);
  v72 = v117;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v48, 0x74726F6853707041, 0xEC00000073747563, v69, v71, 0, 0, 256);
  v102[1] = 0x8000000100003B10;
  v73 = v110;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v121, v59, v72);
  v103 = static AppShortcutsBuilder.buildExpression(_:)(v73);
  v74 = v115;
  v75 = (void (*)(char *, uint64_t))v116;
  ((void (*)(char *, uint64_t))v116)(v73, v115);
  v76 = sub_10000257C(&qword_100008280);
  v77 = *(_QWORD *)(sub_10000257C(&qword_100008288) - 8);
  v78 = swift_allocObject(v76, ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80))+ *(_QWORD *)(v77 + 72), *(unsigned __int8 *)(v77 + 80) | 7);
  *(_OWORD *)(v78 + 16) = v112;
  v79 = sub_100003404();
  AppShortcutPhrase.init(stringLiteral:)(0x6D61632070696C46, 0xEB00000000617265, &type metadata for FlipCameraDeviceIntent, v79);
  v80 = String.LocalizationValue.init(stringLiteral:)(v108, 0x8000000100003B40);
  v81 = v120;
  static Locale.current.getter(v80);
  v82 = v118;
  ((void (*)(char *, _QWORD, uint64_t))v114)(v118, v113, v70);
  v83 = v117;
  v84 = LocalizedStringResource.init(_:table:locale:bundle:comment:)(v48, 0x74726F6853707041, 0xEC00000073747563, v81, v82, 0, 0, 256);
  v85 = v78;
  v86 = v83;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v84, v85, v83);
  *(_QWORD *)&v112 = static AppShortcutsBuilder.buildExpression(_:)(v73);
  v75(v73, v74);
  v87 = sub_10000257C(&qword_100008298);
  v88 = *(_QWORD *)(sub_10000257C(&qword_1000082A0) - 8);
  v89 = swift_allocObject(v87, ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80))+ 3 * *(_QWORD *)(v88 + 72), *(unsigned __int8 *)(v88 + 80) | 7);
  *(_OWORD *)(v89 + 16) = v107;
  v90 = sub_100003448();
  AppShortcutPhrase.init(stringLiteral:)(0x63657220706F7453, 0xEE00676E6964726FLL, &type metadata for StopCaptureIntent, v90);
  AppShortcutPhrase.init(stringLiteral:)(0x70616320706F7453, 0xEE00676E69727574, &type metadata for StopCaptureIntent, v90);
  AppShortcutPhrase.init(stringLiteral:)(0x64697620706F7453, 0xEA00000000006F65, &type metadata for StopCaptureIntent, v90);
  v91 = v111;
  v92 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000028, 0x8000000100003B70);
  v93 = v120;
  static Locale.current.getter(v92);
  ((void (*)(char *, _QWORD, uint64_t))v114)(v82, v113, v119);
  v94 = LocalizedStringResource.init(_:table:locale:bundle:comment:)(v91, 0x74726F6853707041, 0xEC00000073747563, v93, v82, 0, 0, 256);
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v94, v89, v86);
  v95 = static AppShortcutsBuilder.buildExpression(_:)(v73);
  ((void (*)(char *, uint64_t))v116)(v73, v74);
  v96 = sub_10000257C(&qword_1000082B0);
  v97 = swift_allocObject(v96, 72, 7);
  *(_OWORD *)(v97 + 16) = xmmword_100003890;
  v98 = v106;
  *(_QWORD *)(v97 + 32) = v109;
  *(_QWORD *)(v97 + 40) = v98;
  v99 = v112;
  *(_QWORD *)(v97 + 48) = v103;
  *(_QWORD *)(v97 + 56) = v99;
  *(_QWORD *)(v97 + 64) = v95;
  v100 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v97);
  return v100;
}

unint64_t sub_1000032B8()
{
  unint64_t result;

  result = qword_100008220;
  if (!qword_100008220)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for OpenCaptureModeIntent, &type metadata for OpenCaptureModeIntent);
    atomic_store(result, (unint64_t *)&qword_100008220);
  }
  return result;
}

uint64_t sub_1000032FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = OpenCaptureModeIntent.$target.getter(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100003324()
{
  unint64_t result;

  result = qword_100008248;
  if (!qword_100008248)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for StartCaptureIntent, &type metadata for StartCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_100008248);
  }
  return result;
}

uint64_t sub_100003368@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = StartCaptureIntent.$captureMode.getter(*a1, a1[1], a1[2]);
  *a2 = result;
  return result;
}

unint64_t sub_100003398()
{
  unint64_t result;

  result = qword_100008270;
  if (!qword_100008270)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ChangeCameraDeviceIntent, &type metadata for ChangeCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_100008270);
  }
  return result;
}

uint64_t sub_1000033DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = ChangeCameraDeviceIntent.$device.getter(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100003404()
{
  unint64_t result;

  result = qword_100008290;
  if (!qword_100008290)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for FlipCameraDeviceIntent, &type metadata for FlipCameraDeviceIntent);
    atomic_store(result, (unint64_t *)&qword_100008290);
  }
  return result;
}

unint64_t sub_100003448()
{
  unint64_t result;

  result = qword_1000082A8;
  if (!qword_1000082A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for StopCaptureIntent, &type metadata for StopCaptureIntent);
    atomic_store(result, (unint64_t *)&qword_1000082A8);
  }
  return result;
}

uint64_t sub_10000348C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC6CameraP33_BD628B633CF933D8B85B6F3021653A6A19ResourceBundleClass);
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_registerAppShortcutsIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAppShortcutsIfNeeded");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}
