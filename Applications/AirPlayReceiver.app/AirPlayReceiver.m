uint64_t sub_100005538()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for PINViewModel()
{
  return objc_opt_self(_TtC15AirPlayReceiver12PINViewModel);
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
  sub_100005934(a1, &qword_10001E0C8, (uint64_t)&unk_100018BF8);
}

void *sub_100005598()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000055A4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for PINViewModel();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000055DC(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100012A50, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100005618(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100012A50, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100005660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005ADC(a1, a2, a3, (uint64_t)&unk_100012A50);
}

uint64_t sub_10000566C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_100012A7C, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_1000056B8(uint64_t a1, uint64_t a2)
{
  return sub_100005780(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000056C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100005704(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100005774(uint64_t a1, uint64_t a2)
{
  return sub_100005780(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005780(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000057BC(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100005830(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_1000058AC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

void sub_1000058EC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
  sub_100005934(a1, &qword_10001E0D0, (uint64_t)&unk_100018C28);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100005934(a1, &qword_10001E0D8, (uint64_t)&unk_100018C58);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100005934(a1, &qword_10001E0E0, (uint64_t)&unk_100018C88);
}

void sub_100005934(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100005978(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_100012A50, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_1000059C4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100005A4C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100012A7C, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_100005A88(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100012A7C, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100005AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005ADC(a1, a2, a3, (uint64_t)&unk_100012A7C);
}

Swift::Int sub_100005ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, a1);
  WitnessTable = swift_getWitnessTable(a4, a2);
  _CFObject.hash(into:)(v8, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_100005B3C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100005B80@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005BA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005C84((unint64_t *)&qword_10001E120, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012AEC);
  v3 = sub_100005C84(&qword_10001E128, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000128F8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005C2C()
{
  return sub_100005C84(&qword_10001E0E8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000128BC);
}

uint64_t sub_100005C58()
{
  return sub_100005C84(&qword_10001E0F0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)"1d");
}

uint64_t sub_100005C84(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005CC4()
{
  return sub_100005C84(&qword_10001E0F8, (uint64_t (*)(uint64_t))type metadata accessor for CFUserNotification, (uint64_t)&unk_1000129E0);
}

uint64_t sub_100005CF0()
{
  return sub_100005C84(&qword_10001E100, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100012AA8);
}

uint64_t sub_100005D1C()
{
  return sub_100005C84(&qword_10001E108, (uint64_t (*)(uint64_t))type metadata accessor for CFUserNotification, (uint64_t)&unk_100012A0C);
}

uint64_t sub_100005D48()
{
  return sub_100005C84(&qword_10001E110, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_1000129B4);
}

uint64_t sub_100005D74()
{
  return sub_100005C84(&qword_10001E118, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001292C);
}

uint64_t sub_100005DBC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007B48();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005DE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007B48();
  return Error<>._code.getter(a1, v2);
}

void sub_100005E14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, CFTimeInterval a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *oslog;
  uint64_t v21;
  _QWORD v22[3];
  _BYTE v23[8];
  uint64_t v24;

  BSDispatchQueueAssertMain(a1);
  v11 = OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing;
  if ((*(_BYTE *)(v5 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing) & 1) != 0)
  {
    __break(1u);
    swift_once(&qword_10001DFD8, sub_100010144);
    v12 = type metadata accessor for Logger(0);
    sub_100007A78(v12, (uint64_t)qword_10001F7D8);
    swift_errorRetain(a3);
    v13 = swift_errorRetain(a3);
    oslog = Logger.logObject.getter(v13);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v24 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_getErrorValue(a3, v23, v22);
      v17 = Error.localizedDescription.getter(v22[1], v22[2]);
      v19 = v18;
      v21 = sub_1000114A4(v17, v18, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, v22, v15 + 4, v15 + 12);
      swift_bridgeObjectRelease(v19);
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Unable to show accept dialog due to error: %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      swift_errorRelease(a3);
    }
    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      swift_errorRelease(a3);

    }
  }
  else
  {
    sub_1000060EC(a1, a2, a3, a4, a5);
    *(_BYTE *)(v5 + v11) = 1;
  }
}

void sub_10000605C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __CFRunLoopSource *v4;
  __CFUserNotification *v5;
  __CFUserNotification *v6;

  BSDispatchQueueAssertMain(a1);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing) = 0;
  v2 = off_10001E138;
  v3 = qword_10001E140;
  off_10001E138 = 0;
  qword_10001E140 = 0;
  sub_1000076CC((uint64_t)v2, v3);
  v4 = *(__CFRunLoopSource **)(v1 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource);
  if (v4)
  {
    *(_QWORD *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = 0;
    CFRunLoopSourceInvalidate(v4);

  }
  v5 = (__CFUserNotification *)qword_10001E130;
  if (qword_10001E130)
  {
    qword_10001E130 = 0;
    v6 = v5;
    CFUserNotificationCancel(v5);

  }
}

void sub_1000060EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, CFTimeInterval a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSString v12;
  NSString v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  id v20;
  NSString v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSString v27;
  id v28;
  uint64_t v29;
  uint64_t inited;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  id v35;
  NSString v36;
  NSString v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  id v43;
  NSString v44;
  NSString v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  _QWORD *v58;
  id v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t ObjCClassFromMetadata;
  const __CFString *v74;
  id v75;
  id v76;
  id v77;
  const __CFString *v78;
  id v79;
  id v80;
  char *v81;
  char *v82;
  uint64_t v83;
  void (*v84)(char *, char *, uint64_t);
  char *v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  const __CFDictionary *isa;
  CFUserNotificationRef v90;
  int v91;
  void *v92;
  CFRunLoopSourceRef RunLoopSource;
  void *v94;
  __CFRunLoopSource *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  __CFRunLoop *v100;
  __CFRunLoopSource *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  _QWORD *v120;
  uint64_t v121;
  char v122[48];

  v109 = a4;
  v108 = a3;
  v118 = a1;
  v119 = a2;
  v114 = type metadata accessor for URL(0);
  v112 = *(_QWORD *)(v114 - 8);
  __chkstk_darwin(v114);
  v111 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007274(&qword_10001E270);
  v8 = __chkstk_darwin(v7);
  v113 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain(v8);
  v10 = (void *)objc_opt_self(NSBundle);
  v11 = objc_msgSend(v10, "mainBundle");
  v12 = String._bridgeToObjectiveC()();
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v11, "localizedStringForKey:value:table:", v12, 0, v13);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

  v17 = objc_allocWithZone((Class)SBSMutableUserNotificationButtonDefinition);
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v19 = objc_msgSend(v17, "initWithTitle:", v18);

  objc_msgSend(v19, "setPresentationStyle:", 0);
  objc_msgSend(v19, "setIsPreferredButton:", 1);
  v20 = objc_msgSend(v10, "mainBundle");
  v21 = String._bridgeToObjectiveC()();
  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend(v20, "localizedStringForKey:value:table:", v21, 0, v22);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v25 = v24;

  v26 = objc_allocWithZone((Class)SBSMutableUserNotificationButtonDefinition);
  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  v28 = objc_msgSend(v26, "initWithTitle:", v27);

  objc_msgSend(v28, "setPresentationStyle:", 2);
  v29 = sub_100007274(&qword_10001E278);
  inited = swift_initStackObject(v29, v122);
  *(_OWORD *)(inited + 16) = xmmword_100012B50;
  *(_QWORD *)(inited + 32) = v28;
  *(_QWORD *)(inited + 40) = v19;
  v31 = sub_100007274(&qword_10001E280);
  v32 = swift_initStackObject(v31, &v121);
  *(_OWORD *)(v32 + 16) = xmmword_100012B60;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    swift_release(inited);
    __break(1u);
    goto LABEL_23;
  }
  v33 = v32;
  *(_QWORD *)(v32 + 32) = kCFUserNotificationAlertHeaderKey;
  v115 = v28;
  v116 = v19;
  v34 = (id)kCFUserNotificationAlertHeaderKey;
  v35 = objc_msgSend(v10, "mainBundle");
  v36 = String._bridgeToObjectiveC()();
  v37 = String._bridgeToObjectiveC()();
  v38 = objc_msgSend(v35, "localizedStringForKey:value:table:", v36, 0, v37);

  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  v41 = v40;

  *(_QWORD *)(v33 + 64) = &type metadata for String;
  *(_QWORD *)(v33 + 40) = v39;
  *(_QWORD *)(v33 + 48) = v41;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_23:
    swift_release(inited);
    __break(1u);
    goto LABEL_24;
  }
  v117 = inited;
  *(_QWORD *)(v33 + 72) = kCFUserNotificationAlertMessageKey;
  v42 = (id)kCFUserNotificationAlertMessageKey;
  v110 = v10;
  v43 = objc_msgSend(v10, "mainBundle");
  v44 = String._bridgeToObjectiveC()();
  v45 = String._bridgeToObjectiveC()();
  v46 = objc_msgSend(v43, "localizedStringForKey:value:table:", v44, 0, v45);

  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v49 = v48;

  v50 = sub_100007274(&qword_10001E288);
  v51 = swift_allocObject(v50, 72, 7);
  *(_OWORD *)(v51 + 16) = xmmword_100012B70;
  *(_QWORD *)(v51 + 56) = &type metadata for String;
  *(_QWORD *)(v51 + 64) = sub_1000072B4();
  v52 = v119;
  *(_QWORD *)(v51 + 32) = v118;
  *(_QWORD *)(v51 + 40) = v52;
  swift_bridgeObjectRetain(v52);
  v53 = String.init(format:_:)(v47, v49, v51);
  v55 = v54;
  swift_bridgeObjectRelease(v49);
  *(_QWORD *)(v33 + 104) = &type metadata for String;
  *(_QWORD *)(v33 + 80) = v53;
  *(_QWORD *)(v33 + 88) = v55;
  v56 = (void *)SBSUserNotificationButtonDefinitionsKey;
  if (!SBSUserNotificationButtonDefinitionsKey)
  {
LABEL_24:
    swift_release(v117);
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  *(_QWORD *)(v33 + 112) = SBSUserNotificationButtonDefinitionsKey;
  v120 = &_swiftEmptyArrayStorage;
  v57 = v56;
  sub_100007604(0, 2, 0);
  v58 = v120;
  v59 = v115;
  v60 = objc_msgSend(v59, "build");
  v61 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v60, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v119 = v59;

  v63 = v58[2];
  v62 = v58[3];
  if (v63 >= v62 >> 1)
  {
    sub_100007604(v62 > 1, v63 + 1, 1);
    v58 = v120;
  }
  v58[2] = v63 + 1;
  v58[v63 + 4] = v61;
  v64 = v116;
  v65 = objc_msgSend(v64, "build");
  v66 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v65, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v68 = v58[2];
  v67 = v58[3];
  if (v68 >= v67 >> 1)
  {
    sub_100007604(v67 > 1, v68 + 1, 1);
    v58 = v120;
  }
  v58[2] = v68 + 1;
  v58[v68 + 4] = v66;
  swift_release(v117);
  *(_QWORD *)(v33 + 144) = sub_100007274(&qword_10001E298);
  *(_QWORD *)(v33 + 120) = v58;
  if (!kCFUserNotificationAlertTopMostKey)
    goto LABEL_25;
  *(_QWORD *)(v33 + 152) = kCFUserNotificationAlertTopMostKey;
  *(_QWORD *)(v33 + 184) = &type metadata for Bool;
  *(_BYTE *)(v33 + 160) = 1;
  v69 = (void *)SBUserNotificationDismissOnLock;
  if (!SBUserNotificationDismissOnLock)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  *(_QWORD *)(v33 + 192) = SBUserNotificationDismissOnLock;
  *(_QWORD *)(v33 + 224) = &type metadata for Bool;
  *(_BYTE *)(v33 + 200) = 1;
  v70 = (void *)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  *(_QWORD *)(v33 + 232) = SBUserNotificationDontDismissOnUnlock;
  *(_QWORD *)(v33 + 264) = &type metadata for Bool;
  *(_BYTE *)(v33 + 240) = 1;
  v71 = (void *)SBUserNotificationIgnoresQuietMode;
  if (!SBUserNotificationIgnoresQuietMode)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  *(_QWORD *)(v33 + 272) = SBUserNotificationIgnoresQuietMode;
  *(_QWORD *)(v33 + 304) = &type metadata for Bool;
  *(_BYTE *)(v33 + 280) = 1;
  if (!kCFUserNotificationLocalizationURLKey)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  *(_QWORD *)(v33 + 312) = kCFUserNotificationLocalizationURLKey;
  v72 = sub_10000771C(0, &qword_10001E2A0, NSBundle_ptr);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v72);
  v74 = (id)kCFUserNotificationAlertTopMostKey;
  v75 = v69;
  v76 = v70;
  v77 = v71;
  v78 = (id)kCFUserNotificationLocalizationURLKey;
  v79 = objc_msgSend(v110, "bundleForClass:", ObjCClassFromMetadata);
  v80 = objc_msgSend(v79, "resourceURL");

  if (!v80)
  {
LABEL_30:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v112 + 56))(v113, 1, 1, v114);
LABEL_31:
    __break(1u);
  }
  v81 = v111;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v80);

  v83 = v112;
  v82 = v113;
  v84 = *(void (**)(char *, char *, uint64_t))(v112 + 32);
  v85 = v81;
  v86 = v114;
  v84(v113, v85, v114);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v82, 0, 1, v86);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v82, 1, v86) == 1)
    goto LABEL_31;
  *(_QWORD *)(v33 + 344) = v86;
  v87 = (char *)sub_100007620((_QWORD *)(v33 + 320));
  v84(v87, v82, v86);
  v88 = sub_100006BC0(v33);
  LODWORD(v120) = 0;
  type metadata accessor for CFString(0);
  sub_100005C84(&qword_10001E100, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100012AA8);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v88);
  v90 = CFUserNotificationCreate(kCFAllocatorDefault, a5, 3uLL, (SInt32 *)&v120, isa);

  v91 = (int)v120;
  if (!v90 || (_DWORD)v120)
  {
    v102 = sub_10000765C();
    swift_allocError(&type metadata for AcceptDialogError, v102, 0, 0);
    *(_DWORD *)v103 = v91;
    *(_BYTE *)(v103 + 4) = 0;
    swift_willThrow();
  }
  else
  {
    v92 = (void *)qword_10001E130;
    qword_10001E130 = (uint64_t)v90;
    v90 = v90;

    RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v90, (CFUserNotificationCallBack)sub_100006CD8, 0);
    if (RunLoopSource)
    {
      v94 = *(void **)(v107 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource);
      *(_QWORD *)(v107 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = RunLoopSource;
      v95 = RunLoopSource;

      v96 = swift_allocObject(&unk_100018D90, 32, 7);
      v97 = v109;
      *(_QWORD *)(v96 + 16) = v108;
      *(_QWORD *)(v96 + 24) = v97;
      v98 = off_10001E138;
      v99 = qword_10001E140;
      off_10001E138 = sub_1000076C4;
      qword_10001E140 = v96;
      swift_retain(v97);
      sub_1000076CC((uint64_t)v98, v99);
      v100 = CFRunLoopGetCurrent();
      v101 = v95;
      CFRunLoopAddSource(v100, v101, kCFRunLoopCommonModes);

      return;
    }
    v104 = sub_10000765C();
    swift_allocError(&type metadata for AcceptDialogError, v104, 0, 0);
    *(_DWORD *)v105 = 0;
    *(_BYTE *)(v105 + 4) = 1;
    swift_willThrow();

  }
}

unint64_t sub_100006BC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007274(&qword_10001E2D0);
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
    sub_100007894(v7, (uint64_t)&v14);
    v8 = v14;
    result = sub_1000072F8(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_1000078DC(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

void sub_100006CD8(void *a1, uint64_t a2)
{
  id v4;

  v4 = a1;
  sub_100006D18(a1, a2);

}

void sub_100006D18(void *a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  __CFUserNotification *userNotification;
  uint64_t v15;

  if (a1)
  {
    v2 = (void (*)(uint64_t, uint64_t))off_10001E138;
    if (off_10001E138)
    {
      v3 = (void *)qword_10001E130;
      if (qword_10001E130)
      {
        v6 = qword_10001E140;
        type metadata accessor for CFUserNotification(0);
        v8 = v7;
        userNotification = a1;
        sub_100007884((uint64_t)v2, v6);
        v9 = sub_100005C84(&qword_10001E2C8, (uint64_t (*)(uint64_t))type metadata accessor for CFUserNotification, (uint64_t)&unk_100012A7C);
        v10 = v3;
        LOBYTE(v9) = static _CFObject.== infix(_:_:)(userNotification, v10, v8, v9);

        if ((v9 & 1) != 0)
        {
          v11 = CFUserNotificationGetResponseDictionary(userNotification);
          if (v11)
          {
            v12 = v11;
            v15 = 0;
            static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(v11, &v15, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

            v13 = v15;
          }
          else
          {
            v13 = 0;
          }
          v2(a2, v13);
          swift_bridgeObjectRelease(v13);
        }
        sub_1000076CC((uint64_t)v2, v6);

      }
    }
  }
}

uint64_t sub_100006E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 aBlock;
  __int128 v35;
  uint64_t (*v36)();
  uint64_t v37;

  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v8;
  if (!a2)
  {
    aBlock = 0u;
    v35 = 0u;
    goto LABEL_15;
  }
  result = SBSUserNotificationButtonDefinitionResponseIndexKey;
  if (SBSUserNotificationButtonDefinitionResponseIndexKey)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(SBSUserNotificationButtonDefinitionResponseIndexKey);
    v18 = v17;
    if (*(_QWORD *)(a2 + 16) && (v19 = sub_100007380(v16, v17), (v20 & 1) != 0))
    {
      sub_100007848(*(_QWORD *)(a2 + 56) + 32 * v19, (uint64_t)&aBlock);
      swift_bridgeObjectRelease(v18);
      if (*((_QWORD *)&v35 + 1))
      {
        v21 = a3;
        if ((swift_dynamicCast(&v33, &aBlock, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
        {
          if (v33)
            v22 = 2;
          else
            v22 = 1;
          if (v33 == 1)
            v23 = 0;
          else
            v23 = v22;
          goto LABEL_17;
        }
LABEL_16:
        v23 = 2;
LABEL_17:
        sub_10000771C(0, &qword_10001E2B0, OS_dispatch_queue_ptr);
        v24 = (void *)static OS_dispatch_queue.main.getter();
        v25 = swift_allocObject(&unk_100018DB8, 33, 7);
        *(_QWORD *)(v25 + 16) = v21;
        *(_QWORD *)(v25 + 24) = a4;
        *(_BYTE *)(v25 + 32) = v23;
        v36 = sub_100007778;
        v37 = v25;
        *(_QWORD *)&aBlock = _NSConcreteStackBlock;
        *((_QWORD *)&aBlock + 1) = 1107296256;
        *(_QWORD *)&v35 = sub_100009F90;
        *((_QWORD *)&v35 + 1) = &unk_100018DD0;
        v26 = _Block_copy(&aBlock);
        v27 = v37;
        swift_retain(a4);
        swift_release(v27);
        static DispatchQoS.unspecified.getter(v28);
        *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
        v29 = sub_100005C84(&qword_10001E2B8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v30 = sub_100007274((uint64_t *)&unk_10001E840);
        v31 = sub_1000077B8();
        dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v30, v31, v7, v29);
        OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v10, v26);
        _Block_release(v26);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v7);
        return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      }
    }
    else
    {
      aBlock = 0u;
      v35 = 0u;
      swift_bridgeObjectRelease(v18);
    }
LABEL_15:
    v21 = a3;
    sub_1000076DC((uint64_t)&aBlock);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier;
  v2 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000071B0()
{
  return type metadata accessor for AcceptDialogController(0);
}

uint64_t type metadata accessor for AcceptDialogController(uint64_t a1)
{
  uint64_t result;

  result = qword_10001E178;
  if (!qword_10001E178)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AcceptDialogController);
  return result;
}

uint64_t sub_1000071F4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100012BA8;
    v4[2] = &unk_100012BC0;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100007274(uint64_t *a1)
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

unint64_t sub_1000072B4()
{
  unint64_t result;

  result = qword_10001E290;
  if (!qword_10001E290)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E290);
  }
  return result;
}

unint64_t sub_1000072F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, *(_QWORD *)(v1 + 40));
  type metadata accessor for CFString(0);
  v4 = v3;
  v5 = sub_100005C84(&qword_10001E2E0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100012A50);
  _CFObject.hash(into:)(v8, v4, v5);
  v6 = Hasher._finalize()();
  return sub_1000073E4(a1, v6);
}

unint64_t sub_100007380(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100007524(a1, a2, v5);
}

unint64_t sub_1000073E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v6 = v2;
    type metadata accessor for CFString(0);
    v9 = v8;
    v10 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * i);
    v11 = sub_100005C84(&qword_10001E2E0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100012A50);
    v12 = v10;
    v13 = static _CFObject.== infix(_:_:)(v12, a1, v9, v11);

    if ((v13 & 1) == 0)
    {
      v14 = ~v4;
      for (i = (i + 1) & v14; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v14)
      {
        v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * i);
        v16 = static _CFObject.== infix(_:_:)(v15, a1, v9, v11);

        if ((v16 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_100007524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100007604(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000078EC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

_QWORD *sub_100007620(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

unint64_t sub_10000765C()
{
  unint64_t result;

  result = qword_10001E2A8;
  if (!qword_10001E2A8)
  {
    result = swift_getWitnessTable(&unk_100012C9C, &type metadata for AcceptDialogError);
    atomic_store(result, (unint64_t *)&qword_10001E2A8);
  }
  return result;
}

uint64_t sub_1000076A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000076C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100006E80(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1000076CC(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000076DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007274((uint64_t *)&unk_10001E860);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000771C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007754()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100007778()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_1000077A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000077B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000077B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E2C0;
  if (!qword_10001E2C0)
  {
    v1 = sub_100007804((uint64_t *)&unk_10001E840);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001E2C0);
  }
  return result;
}

uint64_t sub_100007804(uint64_t *a1)
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

uint64_t sub_100007848(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007884(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100007894(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007274(&qword_10001E2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000078DC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000078EC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100007274(&qword_10001E2E8);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    v18 = sub_100007274(&qword_10001E2F0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100007A78(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AcceptDialogError(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AcceptDialogError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AcceptDialogError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_100007AF4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100007B14(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AcceptDialogError()
{
  return &type metadata for AcceptDialogError;
}

unint64_t sub_100007B48()
{
  unint64_t result;

  result = qword_10001E2F8;
  if (!qword_10001E2F8)
  {
    result = swift_getWitnessTable("ub", &type metadata for AcceptDialogError);
    atomic_store(result, (unint64_t *)&qword_10001E2F8);
  }
  return result;
}

void sub_100007B8C(void *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v2 = a1;
  v3 = (void *)v1[4];
  v1[4] = a1;
  v4 = a1;

  v5 = objc_msgSend(v4, "mirroringLayer");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setContentsGravity:", kCAGravityCenter);
    objc_msgSend(v6, "setNeedsDisplayOnBoundsChange:", 0);
  }
  v7 = (void *)v1[3];
  v1[3] = v6;
  v8 = v6;

  if (v2)
  {
    v9 = objc_msgSend(v4, "HUDLayer");
    v2 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setContentsGravity:", kCAGravityCenter);
      v10 = v2;
      objc_msgSend(v10, "setNeedsDisplayOnBoundsChange:", 0);

    }
  }

  v11 = (void *)v1[2];
  v1[2] = v2;

}

uint64_t sub_100007C90()
{
  uint64_t v0;

  sub_1000076CC(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for MirroringViewModel()
{
  return objc_opt_self(_TtC15AirPlayReceiver18MirroringViewModel);
}

uint64_t sub_100007CF4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for MirroringViewModel();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

id sub_100007DEC()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  v1 = (void *)objc_opt_self(CATransaction);
  objc_msgSend(v1, "begin");
  objc_msgSend(v1, "setDisableActions:", 1);
  v2 = objc_msgSend(v0, "layer");
  v3 = objc_msgSend(v2, "sublayers");

  if (!v3)
    return objc_msgSend(v1, "commit");
  v4 = sub_100008070();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if (!((unint64_t)v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain(v5);
    if (v6)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease_n(v5, 2);
    return objc_msgSend(v1, "commit");
  }
  if (v5 < 0)
    v11 = v5;
  else
    v11 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  result = (id)_CocoaArrayWrapper.endIndex.getter(v11);
  v6 = (uint64_t)result;
  if (!result)
    goto LABEL_14;
LABEL_4:
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v5);
      else
        v9 = *(id *)(v5 + 8 * v8 + 32);
      v10 = v9;
      ++v8;
      objc_msgSend(v0, "bounds");
      objc_msgSend(v10, "setFrame:");

    }
    while (v6 != v8);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

id sub_100008020()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LayerResizableUIView()
{
  return objc_opt_self(_TtC15AirPlayReceiver20LayerResizableUIView);
}

unint64_t sub_100008070()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E460;
  if (!qword_10001E460)
  {
    v1 = objc_opt_self(CALayer);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E460);
  }
  return result;
}

ValueMetadata *type metadata accessor for CALayerView()
{
  return &type metadata for CALayerView;
}

void *sub_1000080BC()
{
  return &protocol witness table for Never;
}

void sub_1000080C8(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v5 = objc_msgSend(a1, "layer");
  v6 = objc_msgSend(v5, "sublayers");

  if (v6)
  {
    v7 = sub_100008070();
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    v9 = a3;
    v10 = sub_1000082C4((uint64_t)v9, v8);
    swift_bridgeObjectRelease(v8);

    if ((v10 & 1) == 0)
    {
      v11 = objc_msgSend(a1, "layer");
      v12 = objc_msgSend(v11, "sublayers");

      if (!v12)
      {
LABEL_18:
        v19 = objc_msgSend(a1, "layer");
        objc_msgSend(v19, "addSublayer:", v9);

        return;
      }
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v7);

      if ((unint64_t)v13 >> 62)
      {
        if (v13 < 0)
          v18 = v13;
        else
          v18 = v13 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v13);
        v14 = _CocoaArrayWrapper.endIndex.getter(v18);
        if (v14)
          goto LABEL_7;
      }
      else
      {
        v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v13);
        if (v14)
        {
LABEL_7:
          if (v14 < 1)
          {
            __break(1u);
            return;
          }
          for (i = 0; i != v14; ++i)
          {
            if ((v13 & 0xC000000000000001) != 0)
              v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v13);
            else
              v16 = *(id *)(v13 + 8 * i + 32);
            v17 = v16;
            objc_msgSend(v16, "removeFromSuperlayer");

          }
        }
      }
      swift_bridgeObjectRelease_n(v13, 2);
      goto LABEL_18;
    }
  }
}

uint64_t sub_1000082C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;

  if ((unint64_t)a2 >> 62)
    goto LABEL_20;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v5 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v6 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
LABEL_5:
      v7 = v6;
      sub_100008070();
      v8 = static NSObject.== infix(_:_:)(v7, a1);

      if ((v8 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease(a2);
        return 1;
      }
      if (v4 == 1)
        goto LABEL_18;
      if (v5)
        break;
      v5 = 5;
      while (1)
      {
        v15 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        v16 = *(id *)(a2 + 8 * v5);
        v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0)
          goto LABEL_6;
        ++v5;
        if (v15 == v4)
          goto LABEL_18;
      }
      __break(1u);
    }
    v10 = 1;
    while (1)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      v13 = v11;
      v14 = static NSObject.== infix(_:_:)(v11, a1);
      swift_unknownObjectRelease(v13);
      if ((v14 & 1) != 0)
        goto LABEL_6;
      ++v10;
      if (v12 == v4)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    if (a2 < 0)
      v18 = a2;
    else
      v18 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
  }
LABEL_18:
  swift_bridgeObjectRelease(a2);
  return 0;
}

id sub_100008438()
{
  uint64_t *v0;
  uint64_t v1;
  id v2;
  id v3;

  v1 = *v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LayerResizableUIView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v3 = objc_msgSend(v2, "layer");
  objc_msgSend(v3, "addSublayer:", v1);

  return v2;
}

void sub_1000084B4(void *a1, uint64_t a2)
{
  void **v2;

  sub_1000080C8(a1, a2, *v2);
}

uint64_t sub_1000084CC(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_10000850C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100008630();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000855C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100008630();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000085AC()
{
  return static View._viewListCount(inputs:)();
}

void sub_1000085C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008630();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_1000085EC()
{
  unint64_t result;

  result = qword_10001E468;
  if (!qword_10001E468)
  {
    result = swift_getWitnessTable(&unk_100012DA4, &type metadata for CALayerView);
    atomic_store(result, (unint64_t *)&qword_10001E468);
  }
  return result;
}

unint64_t sub_100008630()
{
  unint64_t result;

  result = qword_10001E470;
  if (!qword_10001E470)
  {
    result = swift_getWitnessTable(&unk_100012DF4, &type metadata for CALayerView);
    atomic_store(result, (unint64_t *)&qword_10001E470);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for MirroringView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for MirroringView(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for MirroringView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 initializeWithTake for MirroringView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for MirroringView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MirroringView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MirroringView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MirroringView()
{
  return &type metadata for MirroringView;
}

uint64_t sub_1000087B8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013F1C, 1);
}

uint64_t sub_1000087C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  int v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _OWORD v89[8];
  uint64_t v90;
  _OWORD v91[8];
  uint64_t v92;
  _OWORD v93[8];
  uint64_t v94;

  sub_100007274(&qword_10001E490);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007274(&qword_10001E498);
  v9 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007274(&qword_10001E4A0);
  ((void (*)(void))__chkstk_darwin)();
  v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007274(&qword_10001E4A8);
  v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  v16 = __chkstk_darwin(v15);
  v17 = __chkstk_darwin(v16);
  v21 = *(void **)(a2 + 24);
  if (v21)
  {
    v73 = v20;
    v74 = v17;
    v77 = (uint64_t)&v70 - v18;
    v78 = v19;
    v79 = a3;
    v22 = v21;
    v72 = v12;
    v23 = v22;
    v24 = static SafeAreaRegions.all.getter();
    v25 = static Edge.Set.all.getter();
    v71 = v8;
    v26 = v14;
    v27 = a1;
    v28 = v25;
    v29 = static Alignment.center.getter();
    v76 = v23;
    sub_100008EDC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v93, 0.0, 1, INFINITY, 0, v29, v30, v23, v24, v28);
    v31 = *(void **)(a2 + 16);
    v32 = swift_allocObject(&unk_100019090, 32, 7);
    *(_QWORD *)(v32 + 16) = v27;
    *(_QWORD *)(v32 + 24) = a2;
    v33 = (uint64_t)v26;
    v75 = v31;
    swift_retain(a2);
    v34 = sub_100007274(&qword_10001E4B8);
    v35 = sub_100009404();
    Button.init(action:label:)(sub_1000093FC, v32, sub_1000090E8, 0, v34, v35);
    v36 = v26;
    v37 = v71;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v36, v11, v71);
    v38 = (_QWORD *)(v33 + *(int *)(v72 + 36));
    *v38 = 0;
    v38[1] = 0;
    v39 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v37);
    v40 = static Edge.Set.top.getter(v39);
    v41 = static Edge.Set.leading.getter();
    v42 = Edge.Set.init(rawValue:)(0);
    v43 = Edge.Set.init(rawValue:)(v42);
    if (Edge.Set.init(rawValue:)(v43 & v40) != v40)
      v42 = Edge.Set.init(rawValue:)(v42 | v40);
    v44 = Edge.Set.init(rawValue:)(v42);
    if (Edge.Set.init(rawValue:)(v44 & v41) != v41)
      LOBYTE(v42) = Edge.Set.init(rawValue:)(v42 | v41);
    v45 = EdgeInsets.init(_all:)(40.0);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v52 = v73;
    sub_10000950C(v33, v73, &qword_10001E4A0);
    v53 = v52 + *(int *)(v74 + 36);
    *(_BYTE *)v53 = v42;
    *(double *)(v53 + 8) = v45;
    *(_QWORD *)(v53 + 16) = v47;
    *(_QWORD *)(v53 + 24) = v49;
    *(_QWORD *)(v53 + 32) = v51;
    *(_BYTE *)(v53 + 40) = 0;
    sub_1000095E4(v33, &qword_10001E4A0);
    v54 = v52;
    v55 = v77;
    sub_1000095A0(v54, v77, &qword_10001E4A8);
    v86 = v93[6];
    v87 = v93[7];
    v88 = v94;
    v82 = v93[2];
    v83 = v93[3];
    v84 = v93[4];
    v85 = v93[5];
    v80 = v93[0];
    v81 = v93[1];
    v56 = v78;
    sub_10000950C(v55, v78, &qword_10001E4A8);
    v57 = v87;
    v89[6] = v86;
    v89[7] = v87;
    v58 = v82;
    v59 = v83;
    v89[2] = v82;
    v89[3] = v83;
    v61 = v84;
    v60 = v85;
    v89[4] = v84;
    v89[5] = v85;
    v63 = v80;
    v62 = v81;
    v89[0] = v80;
    v89[1] = v81;
    *((_OWORD *)v7 + 6) = v86;
    *((_OWORD *)v7 + 7) = v57;
    *((_OWORD *)v7 + 2) = v58;
    *((_OWORD *)v7 + 3) = v59;
    *((_OWORD *)v7 + 4) = v61;
    *((_OWORD *)v7 + 5) = v60;
    v64 = v88;
    v90 = v88;
    *(_OWORD *)v7 = v63;
    *((_OWORD *)v7 + 1) = v62;
    *((_QWORD *)v7 + 16) = v64;
    *((_QWORD *)v7 + 17) = v31;
    v65 = sub_100007274(&qword_10001E4F8);
    sub_10000950C(v56, (uint64_t)&v7[*(int *)(v65 + 64)], &qword_10001E4A8);
    sub_100009550((id *)v89);
    v66 = v75;
    sub_100009550((id *)v93);

    sub_1000095E4(v55, &qword_10001E4A8);
    sub_100009578((id *)v93);
    sub_1000095E4(v56, &qword_10001E4A8);

    v91[6] = v86;
    v91[7] = v87;
    v92 = v88;
    v91[2] = v82;
    v91[3] = v83;
    v91[4] = v84;
    v91[5] = v85;
    v91[0] = v80;
    v91[1] = v81;
    sub_100009578((id *)v91);
    v67 = sub_100007274(&qword_10001E4B0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v7, 0, 1, v67);
    return sub_1000095A0((uint64_t)v7, v79, &qword_10001E490);
  }
  else
  {
    v69 = sub_100007274(&qword_10001E4B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(a3, 1, 1, v69);
  }
}

__n128 sub_100008D20@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
  sub_10000950C(v16, a9, &qword_10001E478);
  v35 = a9 + *(int *)(sub_100007274(&qword_10001E488) + 36);
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

id sub_100008EDC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, char a18)
{
  double v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v43;
  double v45;
  double v46;
  double v47;
  _OWORD v48[7];

  v18 = a1;
  v20 = a18;
  v21 = a17;
  v22 = a15;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((a4 & 1) != 0)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v46 = a5;
    v47 = a7;
    v45 = a3;
    v43 = v25;
    v37 = static os_log_type_t.fault.getter();
    v38 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v37, &_mh_execute_header, v38, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v25 = v43;
    v24 = a10;
    v23 = a12;
    v18 = a1;
    a3 = v45;
    a5 = v46;
    a7 = v47;
    v20 = a18;
    v21 = a17;
    v22 = a15;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v48, *(_QWORD *)&v18, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, a14, v22);
  v39 = v48[2];
  *(_OWORD *)(a9 + 72) = v48[3];
  v40 = v48[5];
  *(_OWORD *)(a9 + 88) = v48[4];
  *(_OWORD *)(a9 + 104) = v40;
  *(_OWORD *)(a9 + 120) = v48[6];
  v41 = v48[1];
  *(_OWORD *)(a9 + 24) = v48[0];
  *(_OWORD *)(a9 + 40) = v41;
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v21;
  *(_BYTE *)(a9 + 16) = v20;
  *(_OWORD *)(a9 + 56) = v39;
  return a16;
}

void sub_1000090A4(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))(a2 + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(a2 + 48);
    v4 = swift_retain(v3);
    v2(v4);
    sub_1000076CC((uint64_t)v2, v3);
  }
}

uint64_t sub_1000090E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  sub_100007274(&qword_10001E500);
  __chkstk_darwin();
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Font.TextStyle(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007274(&qword_10001E508);
  __chkstk_darwin();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = Image.init(systemName:)(0xD000000000000011, 0x8000000100013480);
  static SymbolRenderingMode.hierarchical.getter();
  v11 = type metadata accessor for SymbolRenderingMode(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  v12 = Image.symbolRenderingMode(_:)(v9, v10);
  swift_release(v10);
  v13 = sub_1000095E4((uint64_t)v9, &qword_10001E508);
  v14 = static Color.white.getter(v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Font.TextStyle.largeTitle(_:), v4);
  v15 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v3, 1, 1, v15);
  v16 = static Font.system(_:design:weight:)(v7, v3, 0, 1);
  sub_1000095E4((uint64_t)v3, &qword_10001E500);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = swift_getKeyPath(&unk_100012EF8);
  *a1 = v12;
  a1[1] = v14;
  a1[2] = result;
  a1[3] = v16;
  return result;
}

uint64_t sub_1000092E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
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
  uint64_t v15;

  v3 = sub_100007274(&qword_10001E478);
  v4 = __chkstk_darwin(v3);
  v6 = (uint64_t *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *v1;
  v7 = v1[1];
  *v6 = static Alignment.center.getter(v4);
  v6[1] = v9;
  v10 = sub_100007274(&qword_10001E480);
  v11 = sub_1000087C8(v8, v7, (uint64_t)v6 + *(int *)(v10 + 44));
  v12 = static Alignment.center.getter(v11);
  sub_100008D20(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v12, v13);
  return sub_1000095E4((uint64_t)v6, &qword_10001E478);
}

uint64_t sub_1000093D8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000093FC()
{
  uint64_t v0;

  sub_1000090A4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_100009404()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10001E4C0;
  if (!qword_10001E4C0)
  {
    v1 = sub_100007804(&qword_10001E4B8);
    v2[0] = sub_100009488();
    v2[1] = sub_1000096F8(&qword_10001E4E8, &qword_10001E4F0, (const char *)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for <> ModifiedContent<A, B>, v1, v2);
    atomic_store(result, (unint64_t *)&qword_10001E4C0);
  }
  return result;
}

unint64_t sub_100009488()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10001E4C8;
  if (!qword_10001E4C8)
  {
    v1 = sub_100007804(&qword_10001E4D0);
    v2[0] = &protocol witness table for Image;
    v2[1] = sub_1000096F8(&qword_10001E4D8, &qword_10001E4E0, (const char *)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for <> ModifiedContent<A, B>, v1, v2);
    atomic_store(result, (unint64_t *)&qword_10001E4C8);
  }
  return result;
}

uint64_t sub_10000950C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007274(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id *sub_100009550(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

id *sub_100009578(id *a1)
{

  return a1;
}

uint64_t sub_1000095A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007274(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000095E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100007274(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009620@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009648(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_100009674()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10001E510;
  if (!qword_10001E510)
  {
    v1 = sub_100007804(&qword_10001E488);
    v2[0] = sub_1000096F8(&qword_10001E518, &qword_10001E478, (const char *)&protocol conformance descriptor for ZStack<A>);
    v2[1] = &protocol witness table for _FlexFrameLayout;
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for <> ModifiedContent<A, B>, v1, v2);
    atomic_store(result, (unint64_t *)&qword_10001E510);
  }
  return result;
}

uint64_t sub_1000096F8(unint64_t *a1, uint64_t *a2, const char *a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007804(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RootView()
{
  return &type metadata for RootView;
}

uint64_t sub_10000974C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100013F60, 1);
}

uint64_t sub_10000975C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v26 = a2;
  v3 = sub_100007274(&qword_10001E520);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100007274(&qword_10001E528);
  v7 = __chkstk_darwin(v25);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static Alignment.center.getter(v7);
  v12 = v11;
  sub_100009908(a1, &v27);
  v13 = v27;
  v14 = v28;
  v15 = v29;
  v16 = v30;
  v27 = v10;
  v28 = v12;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v17 = sub_100007274(&qword_10001E530);
  v18 = sub_1000096F8(&qword_10001E538, &qword_10001E530, (const char *)&protocol conformance descriptor for ZStack<A>);
  View.statusBar(hidden:)(1, v17, v18);
  swift_release(v14);
  v19 = swift_release(v16);
  if (*(_QWORD *)(a1 + 24))
    v20 = static Color.clear.getter(v19);
  else
    v20 = static Color.black.getter(v19);
  v21 = v20;
  v22 = static Edge.Set.all.getter();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  v23 = &v9[*(int *)(v25 + 36)];
  *(_QWORD *)v23 = v21;
  v23[8] = v22;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_1000099E8((uint64_t)v9, v26);
}

uint64_t sub_100009908@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
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
  uint64_t result;
  uint64_t v16;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for MirroringViewModel();
  v6 = sub_100005C84((unint64_t *)&unk_10001E830, (uint64_t (*)(uint64_t))type metadata accessor for MirroringViewModel, (uint64_t)&unk_100012D34);
  v7 = swift_retain(v4);
  v8 = ObservedObject.init(wrappedValue:)(v7, v5, v6);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 24);
  if (v11)
  {
    v12 = type metadata accessor for PINViewModel();
    v13 = sub_100005C84(&qword_10001E540, (uint64_t (*)(uint64_t))type metadata accessor for PINViewModel, (uint64_t)&unk_1000127C8);
    v14 = swift_retain(v11);
    result = ObservedObject.init(wrappedValue:)(v14, v12, v13);
  }
  else
  {
    result = 0;
    v16 = 0;
  }
  *a2 = v8;
  a2[1] = v10;
  a2[2] = result;
  a2[3] = v16;
  return result;
}

uint64_t sub_1000099E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000975C(*(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_1000099E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007274(&qword_10001E528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009A34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];
  _QWORD v3[2];

  result = qword_10001E548;
  if (!qword_10001E548)
  {
    v1 = sub_100007804(&qword_10001E528);
    v3[0] = sub_100007804(&qword_10001E530);
    v3[1] = sub_1000096F8(&qword_10001E538, &qword_10001E530, (const char *)&protocol conformance descriptor for ZStack<A>);
    v2[0] = swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of View.statusBar(hidden:)>>, 1);
    v2[1] = sub_1000096F8(&qword_10001E550, &qword_10001E558, (const char *)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for <> ModifiedContent<A, B>, v1, v2);
    atomic_store(result, (unint64_t *)&qword_10001E548);
  }
  return result;
}

id sub_100009CB0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC15AirPlayReceiver11AppDelegate);
}

uint64_t sub_100009D88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  if (qword_10001DFC0 != -1)
    swift_once(&qword_10001DFC0, sub_1000100BC);
  v2 = type metadata accessor for Logger(0);
  sub_100007A78(v2, (uint64_t)qword_10001F790);
  v3 = swift_bridgeObjectRetain_n(a1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v13 = a1;
    v14 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain(a1);
    v8 = sub_100007274((uint64_t *)&unk_10001E5F0);
    v9 = String.init<A>(describing:)(&v13, v8);
    v11 = v10;
    v13 = sub_1000114A4(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "didFinishLaunching: options=%s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
  }
  return 1;
}

unint64_t sub_100009F48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E120;
  if (!qword_10001E120)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable("]b", v1);
    atomic_store(result, (unint64_t *)&qword_10001E120);
  }
  return result;
}

uint64_t sub_100009F90(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100009FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  objc_msgSend(*(id *)(a1 + 32), "stop");
  swift_beginAccess(v2, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_10000F098(0x6D73694472657375, 0xED00006465737369);

  }
}

id sub_10000A1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  int *v7;
  uint64_t state;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint8_t *v13;
  os_log_type_t v14;
  const char *v15;
  id result;
  uint64_t state64;
  _BYTE v18[24];

  v1 = v0;
  state64 = 0;
  if (qword_10001DFE0 != -1)
    swift_once(&qword_10001DFE0, sub_10001016C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007A78(v2, (uint64_t)qword_10001F7F0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received device locked notification", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = (int *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken, v18, 0, 0);
  state = notify_get_state(*v7, &state64);
  v9 = state64;
  v10 = Logger.logObject.getter(state);
  v11 = static os_log_type_t.default.getter();
  v12 = os_log_type_enabled(v10, v11);
  if (v9 == 1)
  {
    if (!v12)
      goto LABEL_11;
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    v14 = v11;
    v15 = "Received device locked notification, device is now locked. Forcing permission dialog";
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    v14 = v11;
    v15 = "Received device locked notification, device is now unlocked. Disabling force permission";
  }
  _os_log_impl((void *)&_mh_execute_header, v10, v14, v15, v13, 2u);
  swift_slowDealloc(v13, -1, -1);
LABEL_11:

  result = *(id *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
  if (result)
    return objc_msgSend(result, "setForcePermissionDialog:", v9 == 1);
  return result;
}

id sub_10000A3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  NSString v7;
  id v8;
  id v9;
  NSString v10;
  Class isa;
  id v12;
  unsigned int v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  _BYTE v44[16];
  id v45;

  v1 = v0;
  BSDispatchQueueAssertMain();
  v2 = getpid();
  v3 = objc_msgSend((id)objc_opt_self(RBSTarget), "targetWithPid:", v2);
  v4 = sub_100007274(&qword_10001E278);
  v5 = swift_allocObject(v4, 40, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100012FB0;
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend((id)objc_opt_self(RBSDomainAttribute), "attributeWithDomain:name:", v6, v7);

  *(_QWORD *)(v5 + 32) = v8;
  specialized Array._endMutation()();
  v9 = objc_allocWithZone((Class)RBSAssertion);
  v10 = String._bridgeToObjectiveC()();
  sub_10000771C(0, &qword_10001E870, RBSAttribute_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  v12 = objc_msgSend(v9, "initWithExplanation:target:attributes:", v10, v3, isa);

  v45 = 0;
  v13 = objc_msgSend(v12, "acquireWithError:", &v45);
  v14 = v45;
  if (!v13)
  {
    v29 = v45;
    v30 = _convertNSErrorToError(_:)(v14);

    swift_willThrow();
    if (qword_10001DFC0 != -1)
      swift_once(&qword_10001DFC0, sub_1000100BC);
    v31 = type metadata accessor for Logger(0);
    sub_100007A78(v31, (uint64_t)qword_10001F790);
    v32 = swift_errorRetain(v30);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = (void *)swift_slowAlloc(32, -1);
      v45 = v36;
      *(_DWORD *)v35 = 136315138;
      swift_getErrorValue(v30, v44, v43);
      v37 = Error.localizedDescription.getter(v43[1], v43[2]);
      v39 = v38;
      v42 = sub_1000114A4(v37, v38, (uint64_t *)&v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease(v39);
      swift_errorRelease(v30);
      swift_errorRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "FATAL: Unable to acquire domain assertion for airplay receiver: %s", v35, 0xCu);
      swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);
    }
    else
    {
      swift_errorRelease(v30);
      swift_errorRelease(v30);
    }

    exit(-1);
  }
  v15 = qword_10001DFE0;
  v16 = v45;
  if (v15 != -1)
    swift_once(&qword_10001DFE0, sub_10001016C);
  v17 = type metadata accessor for Logger(0);
  sub_100007A78(v17, (uint64_t)qword_10001F7F0);
  v18 = v12;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = (void *)swift_slowAlloc(32, -1);
    v45 = v22;
    v41 = v1;
    *(_DWORD *)v21 = 136315138;
    v40 = v21 + 4;
    v23 = v18;
    v24 = objc_msgSend(v23, "description");
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    v42 = sub_1000114A4(v25, v27, (uint64_t *)&v45);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43, v21 + 4, v21 + 12);

    swift_bridgeObjectRelease(v27);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Acquired background runtime assertion: %s", v21, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v18, "addObserver:", v1, v40, v41);
  return v18;
}

void sub_10000A928(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v6;
  __objc2_prop_list *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  if (v3)
  {
    *(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = 0;
    v6 = v3;
    objc_msgSend(v6, "removeObserver:", v2);
    v7 = &UIWindowSceneDelegate__properties;
    objc_msgSend(v6, "invalidate");

    if (qword_10001DFE0 != -1)
      swift_once(&qword_10001DFE0, sub_10001016C);
    v8 = type metadata accessor for Logger(0);
    sub_100007A78(v8, (uint64_t)qword_10001F7F0);
    v9 = v6;
    swift_bridgeObjectRetain_n(a2, 2);
    v10 = v9;
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc(22, -1);
      v21 = a1;
      v14 = swift_slowAlloc(64, -1);
      v23 = v14;
      *(_DWORD *)v13 = 136315394;
      v20 = v13 + 4;
      v15 = v10;
      v16 = objc_msgSend(v15, "description");
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v19 = v18;

      v22 = sub_1000114A4(v17, v19, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 4, v13 + 12);

      swift_bridgeObjectRelease(v19);
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v22 = sub_1000114A4(v21, a2, &v23);
      v7 = &UIWindowSceneDelegate__properties;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 14, v13 + 22);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Invalidating background runtime assertion: %s, reason: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    objc_msgSend(v10, *(SEL *)&v7[316], v20);

  }
}

void sub_10000ABB8(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString v38;
  id v39;
  char *v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void **v56;
  const char *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  char *v62;
  int *v63;
  void *Strong;
  void *v65;
  id v66;
  _QWORD v67[2];
  char *v68;
  char *v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[24];
  void **aBlock;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void *ObjectType;
  void *v81;
  uint64_t v82;
  _QWORD v83[3];
  _QWORD v84[6];

  v3 = type metadata accessor for URL(0);
  v74 = *(_QWORD *)(v3 - 8);
  v75 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000A3E0();
  v7 = *(void **)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
  *(_QWORD *)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v6;
  v8 = v6;
  if (v7)
    objc_msgSend(v7, "removeObserver:", v1);
  objc_msgSend(v7, "invalidate");

  v68 = v1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v10 = __CocoaSet.makeIterator()(v9);
    v11 = sub_10000771C(0, &qword_10001E850, UIOpenURLContext_ptr);
    v12 = sub_10000FECC();
    v13 = Set.Iterator.init(_cocoa:)(v84, v10, v11, v12);
    a1 = v84[0];
    v72 = v84[1];
    v15 = v84[2];
    v14 = v84[3];
    v16 = v84[4];
  }
  else
  {
    v17 = -1 << *(_BYTE *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 56);
    v72 = a1 + 56;
    v15 = ~v17;
    v19 = -v17;
    if (v19 < 64)
      v20 = ~(-1 << v19);
    else
      v20 = -1;
    v16 = v20 & v18;
    v13 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v14 = 0;
  }
  v21 = 0;
  v70 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v67[1] = v15;
  v71 = (unint64_t)(v15 + 64) >> 6;
  v73 = 0x8000000100013870;
  v69 = (char *)&type metadata for Swift.AnyObject + 8;
  while (a1 < 0)
  {
    v26 = __CocoaSet.Iterator.next()(v13);
    if (!v26)
      goto LABEL_39;
    v27 = v26;
    v83[0] = v26;
    v28 = sub_10000771C(0, &qword_10001E850, UIOpenURLContext_ptr);
    swift_unknownObjectRetain(v27, v29);
    swift_dynamicCast(&aBlock, v83, v69, v28, 7);
    v30 = aBlock;
    swift_unknownObjectRelease(v27);
    v25 = v14;
    v23 = v16;
    if (!v30)
      goto LABEL_39;
LABEL_36:
    v34 = objc_msgSend(v30, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v35 = URL.absoluteString.getter();
    v37 = v36;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v5, v75);
    if (v35 == 0xD00000000000001FLL && v37 == v73)
    {
      swift_bridgeObjectRelease(0x8000000100013870);

      v21 = 1;
    }
    else
    {
      v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, 0xD00000000000001FLL, 0x8000000100013870, 0);
      swift_bridgeObjectRelease(v37);

      v21 |= v22;
    }
    v14 = v25;
    v16 = v23;
  }
  if (v16)
  {
    v23 = (v16 - 1) & v16;
    v24 = __clz(__rbit64(v16)) | (v14 << 6);
    v25 = v14;
    goto LABEL_35;
  }
  v31 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v31 >= v71)
    goto LABEL_39;
  v32 = *(_QWORD *)(v72 + 8 * v31);
  v25 = v14 + 1;
  if (v32)
    goto LABEL_34;
  v25 = v14 + 2;
  if (v14 + 2 >= v71)
    goto LABEL_39;
  v32 = *(_QWORD *)(v72 + 8 * v25);
  if (v32)
    goto LABEL_34;
  v25 = v14 + 3;
  if (v14 + 3 >= v71)
    goto LABEL_39;
  v32 = *(_QWORD *)(v72 + 8 * v25);
  if (v32)
    goto LABEL_34;
  v25 = v14 + 4;
  if (v14 + 4 >= v71)
    goto LABEL_39;
  v32 = *(_QWORD *)(v72 + 8 * v25);
  if (v32)
  {
LABEL_34:
    v23 = (v32 - 1) & v32;
    v24 = __clz(__rbit64(v32)) + (v25 << 6);
LABEL_35:
    v30 = (void **)*(id *)(*(_QWORD *)(a1 + 48) + 8 * v24);
    if (!v30)
      goto LABEL_39;
    goto LABEL_36;
  }
  v33 = v14 + 5;
  while (v71 != v33)
  {
    v32 = *(_QWORD *)(v72 + 8 * v33++);
    if (v32)
    {
      v25 = v33 - 1;
      goto LABEL_34;
    }
  }
LABEL_39:
  sub_10000FF24(a1);
  v38 = String._bridgeToObjectiveC()();
  v39 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v40 = v68;
  v41 = (uint64_t)&v68[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken];
  swift_beginAccess(&v68[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken], v83, 0, 0);
  sub_10000950C(v41, (uint64_t)&aBlock, (uint64_t *)&unk_10001E860);
  v42 = ObjectType;
  sub_1000095E4((uint64_t)&aBlock, (uint64_t *)&unk_10001E860);
  if (!v42)
  {
LABEL_42:
    v49 = *(void **)&v40[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
    v50 = (void *)objc_opt_self(NSOperationQueue);
    v51 = v49;
    v52 = v38;
    v53 = objc_msgSend(v50, "mainQueue");
    v54 = swift_allocObject(&unk_100019340, 24, 7);
    swift_unknownObjectWeakInit(v54 + 16, v40);
    v81 = sub_10000FF2C;
    v82 = v54;
    aBlock = _NSConcreteStackBlock;
    v78 = 1107296256;
    v79 = sub_10000B508;
    ObjectType = &unk_100019510;
    v55 = _Block_copy(&aBlock);
    swift_release(v82);
    v56 = (void **)objc_msgSend(v39, "addObserverForName:object:queue:usingBlock:", v52, v51, v53, v55);
    _Block_release(v55);

    ObjectType = (void *)swift_getObjectType(v56);
    aBlock = v56;
    swift_beginAccess(v41, v76, 33, 0);
    sub_10000FF34((uint64_t)&aBlock, v41);
    swift_endAccess(v76);
    v57 = (const char *)kSBSLockStateNotifyKey;
    sub_10000771C(0, &qword_10001E2B0, OS_dispatch_queue_ptr);
    v58 = static OS_dispatch_queue.main.getter();
    v59 = swift_allocObject(&unk_100019548, 24, 7);
    *(_QWORD *)(v59 + 16) = v40;
    v81 = sub_10000FF7C;
    v82 = v59;
    aBlock = _NSConcreteStackBlock;
    v78 = 1107296256;
    v79 = sub_10000B5AC;
    ObjectType = &unk_100019560;
    v60 = _Block_copy(&aBlock);
    v61 = v82;
    v62 = v40;
    swift_release(v61);
    v63 = (int *)&v62[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken];
    swift_beginAccess(&v62[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken], &aBlock, 33, 0);
    notify_register_dispatch(v57, v63, v58, v60);
    swift_endAccess(&aBlock);
    _Block_release(v60);

    if ((v21 & 1) != 0)
    {
      Strong = (void *)swift_unknownObjectWeakLoadStrong(&v62[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene]);
      if (!Strong)
        goto LABEL_46;
      v65 = Strong;
      if (!objc_msgSend(Strong, "activationState"))
      {

        goto LABEL_48;
      }
      v66 = objc_msgSend(v65, "activationState");

      if (v66 != (id)1)
LABEL_46:
        sub_10000B5E8(0x4C52556D6F7266, 0xE700000000000000);
    }
LABEL_48:
    sub_10000A1D8();

    return;
  }
  sub_10000950C(v41, (uint64_t)&aBlock, (uint64_t *)&unk_10001E860);
  v43 = ObjectType;
  if (ObjectType)
  {
    v44 = sub_10000FF9C(&aBlock, (uint64_t)ObjectType);
    v45 = *(v43 - 1);
    __chkstk_darwin(v44);
    v47 = (char *)v67 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v45 + 16))(v47);
    v48 = _bridgeAnythingToObjectiveC<A>(_:)(v47, v43);
    (*(void (**)(char *, _QWORD *))(v45 + 8))(v47, v43);
    sub_10000FFC0(&aBlock);
    objc_msgSend(v39, "removeObserver:", v48);
    swift_unknownObjectRelease(v48);
    v40 = v68;
    goto LABEL_42;
  }
LABEL_50:
  __break(1u);
}

void sub_10000B3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (char *)Strong;
    if (qword_10001DFE0 != -1)
      swift_once(&qword_10001DFE0, sub_10001016C);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100007A78(v5, (uint64_t)qword_10001F7F0);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Received APRKAlternateBonjourBrowsingDisabled notification, stopping receiver server", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v10 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
    v11 = *(void **)&v4[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
    if (v11)
    {
      objc_msgSend(v11, "setDelegate:", 0);
      v11 = *(void **)&v4[v10];
    }
    objc_msgSend(v11, "stopReceiverServer");

  }
}

uint64_t sub_10000B508(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000B5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_10000B5E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  id v8;
  id result;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  BSDispatchQueueAssertMain();
  v6 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
  v7 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
  if (v7)
  {
    v8 = objc_msgSend(v7, "delegate");
    if (v8)
      return (id)swift_unknownObjectRelease(v8);
  }
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v10 = type metadata accessor for Logger(0);
  sub_100007A78(v10, (uint64_t)qword_10001F808);
  v11 = swift_bridgeObjectRetain_n(a2, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v17 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain(a2);
    v16 = sub_1000114A4(a1, a2, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Start receiver server for reason: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    result = *(id *)(v3 + v6);
    if (!result)
      return result;
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    result = *(id *)(v3 + v6);
    if (!result)
      return result;
  }
  objc_msgSend(result, "setDelegate:", v3);
  result = *(id *)(v3 + v6);
  if (result)
    return objc_msgSend(result, "startReceiverServerWithSupportedRenderingModes:", 1);
  return result;
}

void sub_10000B814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v1)
  {
    v2 = v0;
    v3 = *(_QWORD *)(v1 + 16);
    v4 = *(void (**)(uint64_t))(v3 + 40);
    if (v4)
    {
      v5 = *(_QWORD *)(v3 + 48);
      v6 = swift_retain(v5);
      v4(v6);
      sub_1000076CC((uint64_t)v4, v5);
    }
    v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController) = 0;
    swift_release(v7);
    sub_10000B8C0();
    v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController);
    if (v8)
    {
      v9 = swift_retain(*(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController));
      sub_10000605C(v9);
      swift_release(v8);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000B8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v1 = v0;
  v2 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer), "invalidate");
  v3 = *(void **)(v0 + v2);
  *(_QWORD *)(v1 + v2) = 0;
  objc_msgSend(v3, "invalidate");

  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v4)
  {
    v5 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;
    swift_retain(v4);
    swift_release(v5);
    v6 = type metadata accessor for RootViewModel();
    v7 = sub_100005C84((unint64_t *)&unk_10001E820, (uint64_t (*)(uint64_t))type metadata accessor for RootViewModel, (uint64_t)&unk_1000130F8);
    v8 = ObservableObject<>.objectWillChange.getter(v6, v7);
    ObservableObjectPublisher.send()();
    swift_release(v4);
    swift_release(v8);
    v9 = (_QWORD *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
    v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8);
    *v9 = 0;
    v9[1] = 0;
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000B9A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t aBlock[6];

  v5 = sub_10000A3E0();
  v6 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v5;
  v7 = v5;
  if (v6)
    objc_msgSend(v6, "removeObserver:", v2);
  objc_msgSend(v6, "invalidate");

  if (qword_10001DFD0 != -1)
    swift_once(&qword_10001DFD0, sub_1000100F0);
  v8 = type metadata accessor for Logger(0);
  sub_100007A78(v8, (uint64_t)qword_10001F7C0);
  v9 = swift_bridgeObjectRetain_n(a2, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain(a2);
    v21 = sub_1000114A4(a1, a2, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, aBlock, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Foreground requested for reason: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    v14 = swift_bridgeObjectRelease_n(a2, 2);
  }
  v15 = (id)SBSCreateOpenApplicationService(v14);
  if (v15)
  {
    v16 = v15;
    v17 = String._bridgeToObjectiveC()();
    aBlock[4] = (uint64_t)sub_10000BCA4;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000BF44;
    aBlock[3] = (uint64_t)&unk_1000194E8;
    v18 = _Block_copy(aBlock);
    objc_msgSend(v16, "openApplication:withOptions:completion:", v17, 0, v18);
    _Block_release(v18);

  }
  else
  {
    v17 = Logger.logObject.getter(0);
    v19 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v17, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v19, "Unable to foreground because open application service could not be created.", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }
  }

}

void sub_10000BCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *oslog;
  uint64_t v16;
  _QWORD v17[3];
  _BYTE v18[8];
  uint64_t v19;

  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_10001DFD0 != -1)
      swift_once(&qword_10001DFD0, sub_1000100F0);
    v3 = type metadata accessor for Logger(0);
    sub_100007A78(v3, (uint64_t)qword_10001F7C0);
    swift_errorRetain(a2);
    v4 = swift_errorRetain(a2);
    oslog = Logger.logObject.getter(v4);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = swift_slowAlloc(32, -1);
      v19 = v7;
      *(_DWORD *)v6 = 136315138;
      swift_getErrorValue(a2, v18, v17);
      v8 = Error.localizedDescription.getter(v17[1], v17[2]);
      v10 = v9;
      v16 = sub_1000114A4(v8, v9, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, v17, v6 + 4, v6 + 12);
      swift_bridgeObjectRelease(v10);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Unable to foreground ourself due to error: %s", v6, 0xCu);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);

      swift_errorRelease(a2);
      return;
    }
    swift_errorRelease(a2);
    swift_errorRelease(a2);
    swift_errorRelease(a2);
  }
  else
  {
    if (qword_10001DFD0 != -1)
      swift_once(&qword_10001DFD0, sub_1000100F0);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_100007A78(v11, (uint64_t)qword_10001F7C0);
    oslog = Logger.logObject.getter(v12);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Foreground request completed.", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }
  }

}

void sub_10000BF44(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

double sub_10000BFB8(NSObject *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  void *v29;
  id v30;
  void (*v31)(char *, os_log_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  void *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  os_log_t v57;

  v6 = v5;
  v57 = a1;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = &v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName];
  v16 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8];
  if (v16
    && (*(_QWORD *)v15 == a2 ? (v17 = v16 == a3) : (v17 = 0),
        v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v15, v16, a2, a3, 0) & 1) != 0))
  {
    if (qword_10001DFE8 != -1)
      swift_once(&qword_10001DFE8, sub_10001018C);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_100007A78(v18, (uint64_t)qword_10001F808);
    v57 = (os_log_t)Logger.logObject.getter(v19);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v57, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, v20, "Another request is already in-flight, skip this request", v21, 2u);
      swift_slowDealloc(v21, -1, -1);
    }

  }
  else
  {
    v53 = a4;
    v55 = a2;
    if (qword_10001DFE8 != -1)
      swift_once(&qword_10001DFE8, sub_10001018C);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_100007A78(v23, (uint64_t)qword_10001F808);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Presenting alert with request to begin stream...", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }
    v54 = a5;
    v56 = a3;

    v28 = sub_10000A3E0();
    v29 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
    *(_QWORD *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v28;
    v30 = v28;
    if (v29)
      objc_msgSend(v29, "removeObserver:", v6);
    objc_msgSend(v29, "invalidate");

    v31 = *(void (**)(char *, os_log_t, uint64_t))(v12 + 16);
    v31((char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v57, v11);
    v32 = type metadata accessor for AcceptDialogController(0);
    v33 = swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
    *(_BYTE *)(v33 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing) = 0;
    *(_QWORD *)(v33 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = 0;
    v34 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
    v34(v33 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    v35 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
    v36 = *(_QWORD *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController];
    *(_QWORD *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController] = v33;
    v37 = swift_retain(v33);
    if (v36)
    {
      sub_10000605C(v37);
      swift_release(v36);
    }
    v22 = swift_release(v33);
    v38 = *(_QWORD *)&v6[v35];
    if (v38)
    {
      ((void (*)(char *, os_log_t, uint64_t, __n128))v31)((char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v57, v11, v22);
      v39 = *(unsigned __int8 *)(v12 + 80);
      v40 = (v39 + 24) & ~v39;
      v41 = (v13 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
      v42 = (v41 + 23) & 0xFFFFFFFFFFFFFFF8;
      v43 = swift_allocObject(&unk_100019480, v42 + 16, v39 | 7);
      *(_QWORD *)(v43 + 16) = v6;
      v34(v43 + v40, v14, v11);
      v44 = (uint64_t *)(v43 + v41);
      v46 = v55;
      v45 = v56;
      *v44 = v55;
      v44[1] = (uint64_t)v45;
      v47 = (uint64_t *)(v43 + v42);
      v49 = v53;
      v48 = v54;
      *v47 = v53;
      v47[1] = v48;
      swift_retain(v38);
      v50 = v6;
      swift_bridgeObjectRetain(v45);
      sub_100007884(v49, v48);
      sub_100005E14(v46, v45, (uint64_t)sub_10000FD60, v43, 240.0);
      swift_release(v43);
      v22.n128_u64[0] = swift_release(v38).n128_u64[0];
    }
  }
  return v22.n128_f64[0];
}

void sub_10000C3BC(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  _BYTE v24[12];
  int v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[5];
  uint64_t v29;

  v26 = a4;
  v27 = a7;
  v25 = a1;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(&v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], a3, v11);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 24) & ~v14;
  v16 = (v15 + v13 + 31) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject(&unk_1000194A8, v16 + 16, v14 | 7);
  *(_QWORD *)(v17 + 16) = a2;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(v17 + v15, &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v11);
  v18 = v17 + ((v15 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v18 = v26;
  *(_QWORD *)(v18 + 8) = a5;
  *(_BYTE *)(v18 + 16) = v25;
  v19 = (uint64_t *)(v17 + v16);
  v20 = v27;
  *v19 = a6;
  v19[1] = v20;
  aBlock[4] = sub_10000FE70;
  v29 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009F90;
  aBlock[3] = &unk_1000194C0;
  v21 = _Block_copy(aBlock);
  v22 = v29;
  v23 = a2;
  swift_bridgeObjectRetain(a5);
  sub_100007884(a6, v20);
  swift_release(v22);
  BSDispatchMain(v21);
  _Block_release(v21);
}

void sub_10000C548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void (*a6)(BOOL), uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(BOOL);
  char *v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *Strong;
  void *v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(BOOL);

  v54 = a7;
  v55 = a6;
  v52 = a5;
  v50 = a3;
  v51 = a4;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v48 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007274(&qword_10001E808);
  __chkstk_darwin(v12);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100007274(&qword_10001E810);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v48 - v20;
  __chkstk_darwin(v19);
  v23 = (char *)&v48 - v22;
  v53 = a1;
  v49 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
  v24 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController);
  if (v24)
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v25((char *)&v48 - v22, v24 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, v9);
    v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v26(v23, 0, 1, v9);
  }
  else
  {
    v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v26((char *)&v48 - v22, 1, 1, v9);
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  }
  v25(v21, a2, v9);
  v26(v21, 0, 1, v9);
  v27 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_10000950C((uint64_t)v23, (uint64_t)v14, &qword_10001E810);
  sub_10000950C((uint64_t)v21, v27, &qword_10001E810);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v28((uint64_t)v14, 1, v9) != 1)
  {
    sub_10000950C((uint64_t)v14, (uint64_t)v18, &qword_10001E810);
    if (v28(v27, 1, v9) != 1)
    {
      v31 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v48, v27, v9);
      v32 = sub_100005C84(&qword_10001E818, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v33 = dispatch thunk of static Equatable.== infix(_:_:)(v18, v31, v9, v32);
      v34 = *(void (**)(char *, uint64_t))(v10 + 8);
      v34(v31, v9);
      sub_1000095E4((uint64_t)v21, &qword_10001E810);
      sub_1000095E4((uint64_t)v23, &qword_10001E810);
      v34(v18, v9);
      v29 = sub_1000095E4((uint64_t)v14, &qword_10001E810);
      v30 = v55;
      if ((v33 & 1) != 0)
        goto LABEL_13;
LABEL_10:
      if (v30)
        v30(0);
      return;
    }
    sub_1000095E4((uint64_t)v21, &qword_10001E810);
    sub_1000095E4((uint64_t)v23, &qword_10001E810);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
LABEL_9:
    sub_1000095E4((uint64_t)v14, &qword_10001E808);
    v30 = v55;
    goto LABEL_10;
  }
  sub_1000095E4((uint64_t)v21, &qword_10001E810);
  sub_1000095E4((uint64_t)v23, &qword_10001E810);
  if (v28(v27, 1, v9) != 1)
    goto LABEL_9;
  v29 = sub_1000095E4((uint64_t)v14, &qword_10001E810);
  v30 = v55;
LABEL_13:
  v35 = v53;
  v36 = *(_QWORD *)(v53 + v49);
  *(_QWORD *)(v53 + v49) = 0;
  if (v36)
  {
    sub_10000605C(v29);
    swift_release(v36);
  }
  v37 = (_QWORD *)(v35 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
  v38 = *(_QWORD *)(v35 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8);
  v39 = v51;
  *v37 = v50;
  v37[1] = v39;
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRelease(v38);
  v40 = v52;
  if (v52 != 2)
  {
    v41 = sub_10000A3E0();
    v42 = *(void **)(v35 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
    *(_QWORD *)(v35 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v41;
    v43 = v41;
    if (v42)
      objc_msgSend(v42, "removeObserver:", v35);
    objc_msgSend(v42, "invalidate");

  }
  if (v30)
    v30(v40 == 0);
  if (v40)
  {
    v44 = v37[1];
    *v37 = 0;
    v37[1] = 0;
    swift_bridgeObjectRelease(v44);
    return;
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v35 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene);
  if (!Strong)
  {
LABEL_26:
    sub_10000B9A4(0xD000000000000010, 0x80000001000137A0);
    return;
  }
  v46 = Strong;
  if (objc_msgSend(Strong, "activationState"))
  {
    v47 = objc_msgSend(v46, "activationState");

    if (v47 == (id)1)
      return;
    goto LABEL_26;
  }

}

id sub_10000CA08()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  objc_super v5;

  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene], 0);
  v1 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeExpirationTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer] = 0;
  v2 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken];
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(_DWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken] = 0;
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v5, "init");
}

id sub_10000CB00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC15AirPlayReceiver13SceneDelegate);
}

void sub_10000CC2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *Strong;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (qword_10001DFE0 != -1)
    swift_once(&qword_10001DFE0, sub_10001016C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100007A78(v2, (uint64_t)qword_10001F7F0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Runtime assertion will invalidate! Dismissing all UI...", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene);
  if (!Strong)
    goto LABEL_8;
  v11 = Strong;
  if (!objc_msgSend(Strong, "activationState"))
  {

    return;
  }
  v8 = objc_msgSend(v11, "activationState");

  if (v8 != (id)1)
  {
LABEL_8:
    v9 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
    v10 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
    if (v10)
    {
      objc_msgSend(v10, "setDelegate:", 0);
      v10 = *(void **)(a1 + v9);
    }
    objc_msgSend(v10, "stopReceiverServer");
    sub_10000B814();
  }
}

void sub_10000CEF0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;

  v2 = v1;
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100007A78(v4, (uint64_t)qword_10001F808);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "didStartStreaming", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = swift_allocObject(&unk_1000193E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v2;
  *(_QWORD *)(v9 + 24) = a1;
  v14[4] = sub_10000FCA8;
  v15 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100009F90;
  v14[3] = &unk_1000193F8;
  v10 = _Block_copy(v14);
  v11 = v15;
  v12 = v2;
  v13 = a1;
  swift_release(v11);
  BSDispatchMain(v10);
  _Block_release(v10);
}

void sub_10000D054(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *Strong;
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v2)
  {
    v5 = *(_QWORD *)(v2 + 16);
    swift_retain(v5);
    v6 = a2;
    sub_100007B8C(a2);
    v7 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = a2;
    v8 = v6;

    v9 = type metadata accessor for MirroringViewModel();
    v10 = sub_100005C84((unint64_t *)&unk_10001E830, (uint64_t (*)(uint64_t))type metadata accessor for MirroringViewModel, (uint64_t)&unk_100012D34);
    v11 = ObservableObject<>.objectWillChange.getter(v9, v10);
    ObservableObjectPublisher.send()();
    swift_release(v5);

    swift_release(v11);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene);
    if (!Strong)
      goto LABEL_5;
    v14 = Strong;
    if (!objc_msgSend(Strong, "activationState"))
    {

      return;
    }
    v13 = objc_msgSend(v14, "activationState");

    if (v13 != (id)1)
LABEL_5:
      sub_10000B9A4(0xD000000000000010, 0x80000001000137A0);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D200(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v1)
  {
    v3 = *(_QWORD *)(v1 + 16);
    swift_retain(v3);
    sub_100007B8C(0);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

    v5 = type metadata accessor for MirroringViewModel();
    v6 = sub_100005C84((unint64_t *)&unk_10001E830, (uint64_t (*)(uint64_t))type metadata accessor for MirroringViewModel, (uint64_t)&unk_100012D34);
    v7 = ObservableObject<>.objectWillChange.getter(v5, v6);
    ObservableObjectPublisher.send()();
    swift_release(v3);
    swift_release(v7);
    v8 = (_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
    v9 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8);
    *v8 = 0;
    v8[1] = 0;
    swift_bridgeObjectRelease(v9);
    sub_10000F098(0xD000000000000010, 0x8000000100013780);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  _QWORD *v20;

  v5 = v4;
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_100007A78(v10, (uint64_t)qword_10001F808);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "shouldShowGlobalPasscode", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = (_QWORD *)swift_allocObject(&unk_1000192F0, 56, 7);
  v15[2] = v5;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  v15[6] = a4;
  v19[4] = sub_10000E920;
  v20 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_100009F90;
  v19[3] = &unk_100019308;
  v16 = _Block_copy(v19);
  v17 = v20;
  v18 = v5;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  swift_release(v17);
  BSDispatchMain(v16);
  _Block_release(v16);
}

void sub_10000D4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;

  sub_10000B9A4(0x4E4950776F6873, 0xE700000000000000);
  v10 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v10)
  {
    v11 = type metadata accessor for PINViewModel();
    v12 = (_QWORD *)swift_allocObject(v11, 48, 7);
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = a4;
    v12[5] = a5;
    v13 = *(_QWORD *)(v10 + 24);
    *(_QWORD *)(v10 + 24) = v12;
    swift_retain(v10);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a5);
    swift_retain(v12);
    swift_release(v13);
    v14 = type metadata accessor for RootViewModel();
    v15 = sub_100005C84((unint64_t *)&unk_10001E820, (uint64_t (*)(uint64_t))type metadata accessor for RootViewModel, (uint64_t)&unk_1000130F8);
    v16 = ObservableObject<>.objectWillChange.getter(v14, v15);
    ObservableObjectPublisher.send()();
    swift_release(v10);
    swift_release(v12);
    swift_release(v16);
    v17 = objc_allocWithZone((Class)BSContinuousMachTimer);
    v18 = String._bridgeToObjectiveC()();
    v19 = objc_msgSend(v17, "initWithIdentifier:", v18);

    v20 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer;
    v21 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer);
    *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer) = v19;
    v22 = v19;
    objc_msgSend(v21, "invalidate");

    v23 = *(void **)(a1 + v20);
    if (v23)
    {
      sub_10000771C(0, &qword_10001E2B0, OS_dispatch_queue_ptr);
      v24 = v23;
      v25 = (void *)static OS_dispatch_queue.main.getter();
      v26 = swift_allocObject(&unk_100019340, 24, 7);
      swift_unknownObjectWeakInit(v26 + 16, a1);
      v28[4] = sub_10000E954;
      v29 = v26;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 1107296256;
      v28[2] = sub_10000D8B4;
      v28[3] = &unk_100019358;
      v27 = _Block_copy(v28);
      swift_release(v29);
      objc_msgSend(v24, "scheduleWithFireInterval:leewayInterval:queue:handler:", v25, v27, 30.0, 0.0);
      _Block_release(v27);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D758(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (char *)Strong;
    if (qword_10001DFE8 != -1)
      swift_once(&qword_10001DFE8, sub_10001018C);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_100007A78(v5, (uint64_t)qword_10001F808);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "PIN UI timed out. Suspending...", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    sub_10000B8C0();
    v10 = &v4[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName];
    v11 = *(_QWORD *)&v4[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8];
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    swift_bridgeObjectRelease(v11);
    v12 = *(_QWORD *)&v4[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel];
    if (v12)
    {
      if (!*(_QWORD *)(*(_QWORD *)(v12 + 16) + 56))
        sub_10000F098(0xD000000000000010, 0x8000000100013760);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000D8B4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

void sub_10000D980()
{
  sub_10000FB18("shouldHideGlobalPasscode", (uint64_t)&unk_1000192A0, (uint64_t)sub_10000E8CC, (uint64_t)&unk_1000192B8);
}

void sub_10000D9FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  os_log_t v43;
  int v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t aBlock[5];
  uint64_t v55;

  v6 = v5;
  v50 = a5;
  v51 = a2;
  v52 = a4;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v49 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v42 - v13;
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v15 = type metadata accessor for Logger(0);
  sub_100007A78(v15, (uint64_t)qword_10001F808);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16(v14, a1, v9);
  v17 = swift_bridgeObjectRetain_n(a3, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc(22, -1);
    v47 = a1;
    v22 = v21;
    v45 = swift_slowAlloc(64, -1);
    aBlock[0] = v45;
    *(_DWORD *)v22 = 136315394;
    v46 = v16;
    v44 = v20;
    v43 = v18;
    v23 = UUID.uuidString.getter();
    v25 = v24;
    v53 = sub_1000114A4(v23, v24, aBlock);
    v48 = v6;
    v16 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, aBlock, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v25);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v26 = v51;
    v53 = sub_1000114A4(v51, a3, aBlock);
    v6 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, aBlock, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease_n(a3, 3);
    v27 = v43;
    _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v44, "shouldAskPermission with uuid: %s fromClient: %s", (uint8_t *)v22, 0x16u);
    v28 = v45;
    swift_arrayDestroy(v45, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    v29 = v22;
    a1 = v47;
    swift_slowDealloc(v29, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);

    swift_bridgeObjectRelease_n(a3, 2);
    v26 = v51;
  }
  v30 = v49;
  v16(v49, a1, v9);
  v31 = *(unsigned __int8 *)(v10 + 80);
  v32 = (v31 + 24) & ~v31;
  v33 = (v11 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  v35 = swift_allocObject(&unk_100019228, v34 + 16, v31 | 7);
  *(_QWORD *)(v35 + 16) = v6;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v35 + v32, v30, v9);
  v36 = (uint64_t *)(v35 + v33);
  *v36 = v26;
  v36[1] = a3;
  v37 = (_QWORD *)(v35 + v34);
  v38 = v50;
  *v37 = v52;
  v37[1] = v38;
  aBlock[4] = (uint64_t)sub_10000E80C;
  v55 = v35;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009F90;
  aBlock[3] = (uint64_t)&unk_100019240;
  v39 = _Block_copy(aBlock);
  v40 = v55;
  swift_bridgeObjectRetain(a3);
  v41 = v6;
  swift_retain(v38);
  swift_release(v40);
  BSDispatchMain(v39);
  _Block_release(v39);
}

double sub_10000DD94(uint64_t a1, NSObject *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  double result;

  v11 = swift_allocObject(&unk_100019278, 32, 7);
  *(_QWORD *)(v11 + 16) = a5;
  *(_QWORD *)(v11 + 24) = a6;
  swift_retain(a6);
  sub_10000BFB8(a2, a3, a4, (uint64_t)sub_10000E888, v11);
  *(_QWORD *)&result = swift_release(v11).n128_u64[0];
  return result;
}

void sub_10000DF2C(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t *v30;
  uint64_t v31;
  char *v32;
  void *v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t aBlock[5];
  uint64_t v37;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = __chkstk_darwin(v4);
  v8 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - v9;
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v11 = type metadata accessor for Logger(0);
  sub_100007A78(v11, (uint64_t)qword_10001F808);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12 = v34(v10, a1, v4);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc(12, -1);
    v33 = v1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    v31 = a1;
    v18 = v17;
    aBlock[0] = v17;
    v32 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)v16 = 136315138;
    v30 = v16 + 4;
    v19 = UUID.uuidString.getter();
    v21 = v20;
    v35 = sub_1000114A4(v19, v20, aBlock);
    v8 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, aBlock, v30, v16 + 12);
    swift_bridgeObjectRelease(v21);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "cancelPermission with uuid: %s", v16, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    v22 = v18;
    a1 = v31;
    swift_slowDealloc(v22, -1, -1);
    v23 = v16;
    v2 = v33;
    swift_slowDealloc(v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  v34(v8, a1, v4);
  v24 = *(unsigned __int8 *)(v5 + 80);
  v25 = (v24 + 24) & ~v24;
  v26 = swift_allocObject(&unk_1000191B0, v25 + v6, v24 | 7);
  *(_QWORD *)(v26 + 16) = v2;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v26 + v25, v8, v4);
  aBlock[4] = (uint64_t)sub_10000E6E4;
  v37 = v26;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009F90;
  aBlock[3] = (uint64_t)&unk_1000191C8;
  v27 = _Block_copy(aBlock);
  v28 = v37;
  v29 = v2;
  swift_release(v28);
  BSDispatchMain(v27);
  _Block_release(v27);
}

double sub_10000E208(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  double result;
  char *v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v36 = a2;
  v3 = type metadata accessor for UUID(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007274(&qword_10001E808);
  __chkstk_darwin(v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100007274(&qword_10001E810);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v33 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v33 - v16;
  v18 = sub_10000A3E0();
  v19 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v18;
  v20 = v18;
  if (v19)
    objc_msgSend(v19, "removeObserver:", a1);
  objc_msgSend(v19, "invalidate");

  v21 = *(_QWORD *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController);
  v35 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
  if (v21)
  {
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v22(v17, v21 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, v3);
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 0, 1, v3);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 1, 1, v3);
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  }
  v22(v15, v36, v3);
  v23(v15, 0, 1, v3);
  v24 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_10000950C((uint64_t)v17, (uint64_t)v8, &qword_10001E810);
  sub_10000950C((uint64_t)v15, v24, &qword_10001E810);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v25((uint64_t)v8, 1, v3) != 1)
  {
    sub_10000950C((uint64_t)v8, (uint64_t)v12, &qword_10001E810);
    if (v25(v24, 1, v3) != 1)
    {
      v27 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v34, v24, v3);
      v28 = sub_100005C84(&qword_10001E818, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v29 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v27, v3, v28);
      v30 = *(void (**)(char *, uint64_t))(v4 + 8);
      v30(v27, v3);
      sub_1000095E4((uint64_t)v15, &qword_10001E810);
      sub_1000095E4((uint64_t)v17, &qword_10001E810);
      v30(v12, v3);
      sub_1000095E4((uint64_t)v8, &qword_10001E810);
      if ((v29 & 1) == 0)
        return result;
      goto LABEL_13;
    }
    sub_1000095E4((uint64_t)v15, &qword_10001E810);
    sub_1000095E4((uint64_t)v17, &qword_10001E810);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
LABEL_11:
    sub_1000095E4((uint64_t)v8, &qword_10001E808);
    return result;
  }
  sub_1000095E4((uint64_t)v15, &qword_10001E810);
  sub_1000095E4((uint64_t)v17, &qword_10001E810);
  if (v25(v24, 1, v3) != 1)
    goto LABEL_11;
  sub_1000095E4((uint64_t)v8, &qword_10001E810);
LABEL_13:
  v31 = *(_QWORD *)(a1 + v35);
  if (v31)
  {
    v32 = swift_retain(*(_QWORD *)(a1 + v35));
    sub_10000605C(v32);
    *(_QWORD *)&result = swift_release(v31).n128_u64[0];
  }
  return result;
}

uint64_t sub_10000E670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

double sub_10000E6E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for UUID(0) - 8) + 80);
  return sub_10000E208(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_10000E714(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E724(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000E72C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000E750(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_10000E764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  swift_release(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

double sub_10000E80C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_10000DD94(*(_QWORD *)(v0 + 16), (v0 + v2), *(_QWORD *)(v0 + v3), *(void **)(v0 + v3 + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000E864()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E888()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000E8A8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E8CC()
{
  sub_10000B8C0();
}

uint64_t sub_10000E8EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10000E920()
{
  uint64_t *v0;

  sub_10000D4D8(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10000E930()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E954(uint64_t a1)
{
  uint64_t v1;

  sub_10000D758(a1, v1);
}

void sub_10000E95C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain(v5);
  if (qword_10001DFC8 != -1)
    swift_once(&qword_10001DFC8, sub_1000100D4);
  v8 = sub_100007A78(v3, (uint64_t)qword_10001F7A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
  v9 = v1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v10, v11))
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    goto LABEL_7;
  }
  v17 = v4;
  v18 = a1;
  v12 = (uint8_t *)swift_slowAlloc(12, -1);
  v13 = swift_slowAlloc(32, -1);
  v20 = v13;
  *(_DWORD *)v12 = 136315138;
  v14 = *(_QWORD *)&v9[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
  if (v14)
  {
    v15 = v13;
    v16 = *(_QWORD *)&v9[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain(*(_QWORD *)&v9[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8]);
    v19 = sub_1000114A4(v16, v14, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s] openURLContexts", v12, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v3);
    a1 = v18;
LABEL_7:
    sub_10000ABB8(a1);
    return;
  }

  __break(1u);
}

void sub_10000EB8C(void *a1, id a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain(v7);
  v10 = objc_msgSend(a1, "_FBSScene");
  v11 = objc_msgSend(v10, "identifier");

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = (uint64_t *)&v2[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
  v16 = *(_QWORD *)&v2[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
  *v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRelease(v16);
  if (qword_10001DFC8 != -1)
    swift_once(&qword_10001DFC8, sub_1000100D4);
  v17 = sub_100007A78(v5, (uint64_t)qword_10001F7A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v17, v5);
  v18 = v2;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v49 = v6;
    v50 = a1;
    v51 = a2;
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = swift_slowAlloc(32, -1);
    v53 = v22;
    *(_DWORD *)v21 = 136315138;
    v23 = v15[1];
    if (!v23)
    {

      __break(1u);
      return;
    }
    v24 = v22;
    v25 = *v15;
    swift_bridgeObjectRetain(v23);
    v52 = sub_1000114A4(v25, v23, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v21 + 4, v21 + 12);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%s] sceneWillConnect", v21, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v5);
    a1 = v50;
    a2 = v51;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  v26 = objc_opt_self(UIWindowScene);
  v27 = swift_dynamicCastObjCClass(a1, v26);
  if (v27)
  {
    v28 = (void *)v27;
    v51 = a1;
    objc_msgSend(v28, "_setBackgroundStyle:", 4);
    swift_unknownObjectWeakAssign(&v18[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene], v28);
    v29 = objc_msgSend((id)objc_opt_self(APRKStreamRenderingManager), "sharedInstance");
    objc_msgSend(v29, "setPreemptionPolicy:", 2);
    objc_msgSend(v29, "setMaxNumberOfConcurrentSessions:", 1);
    objc_msgSend(v29, "setAltAdvertisingEnabled:", 1);
    objc_msgSend(v29, "setOptimizeAudioRenderingLatency:", 1);
    objc_msgSend(v29, "setEnableMixingMediaAudio:", 1);
    v30 = *(void **)&v18[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
    *(_QWORD *)&v18[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager] = v29;
    v31 = v29;

    v32 = type metadata accessor for MirroringViewModel();
    v33 = swift_allocObject(v32, 64, 7);
    *(_OWORD *)(v33 + 16) = 0u;
    *(_OWORD *)(v33 + 32) = 0u;
    *(_OWORD *)(v33 + 48) = 0u;
    v34 = swift_allocObject(&unk_100019340, 24, 7);
    swift_unknownObjectWeakInit(v34 + 16, v18);
    v35 = swift_allocObject(&unk_100019598, 32, 7);
    *(_QWORD *)(v35 + 16) = v33;
    *(_QWORD *)(v35 + 24) = v34;
    *(_QWORD *)(v33 + 40) = sub_100010050;
    *(_QWORD *)(v33 + 48) = v35;
    swift_retain(v33);
    sub_1000076CC(0, 0);
    v36 = type metadata accessor for RootViewModel();
    v37 = swift_allocObject(v36, 32, 7);
    *(_QWORD *)(v37 + 16) = v33;
    *(_QWORD *)(v37 + 24) = 0;
    v38 = *(_QWORD *)&v18[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel];
    *(_QWORD *)&v18[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel] = v37;
    swift_retain(v33);
    swift_release(v38);
    v39 = a2;
    v40 = objc_msgSend(a2, "URLContexts");
    v41 = sub_10000771C(0, &qword_10001E850, UIOpenURLContext_ptr);
    v42 = sub_10000FECC();
    v43 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v40, v41, v42);

    if ((v43 & 0xC000000000000001) != 0)
    {
      if (v43 < 0)
        v44 = v43;
      else
        v44 = v43 & 0xFFFFFFFFFFFFFF8;
      v45 = __CocoaSet.count.getter(v44);
    }
    else
    {
      v45 = *(_QWORD *)(v43 + 16);
    }
    swift_bridgeObjectRelease(v43);
    if (v45)
    {
      v46 = objc_msgSend(v39, "URLContexts");
      v47 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v46, v41, v42);

      sub_10000E95C(v47);
      swift_bridgeObjectRelease(v47);
    }
    swift_release(v33);

  }
}

void sub_10000F098(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_10001DFD0 != -1)
    swift_once(&qword_10001DFD0, sub_1000100F0);
  v4 = type metadata accessor for Logger(0);
  sub_100007A78(v4, (uint64_t)qword_10001F7C0);
  v5 = swift_bridgeObjectRetain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(a2);
    v11 = sub_1000114A4(a1, a2, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Suspending UI for reason: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v10 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v10, "suspend");

}

void sub_10000F268()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t Strong;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[2];

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain(v3);
  if (qword_10001DFC8 != -1)
    swift_once(&qword_10001DFC8, sub_1000100D4);
  v6 = sub_100007A78(v1, (uint64_t)qword_10001F7A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  v7 = v0;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v36 = v1;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v38[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
    if (!v12)
    {

      __break(1u);
      goto LABEL_19;
    }
    v13 = v11;
    v14 = *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain(*(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8]);
    v37 = sub_1000114A4(v14, v12, v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%s] sceneWillEnterForeground", v10, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    v1 = v36;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  v15 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController;
  if (!*(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController])
  {
    Strong = swift_unknownObjectWeakLoadStrong(&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__windowScene]);
    if (Strong)
    {
      v17 = (void *)Strong;
      v18 = type metadata accessor for UIWindowController();
      v19 = (_QWORD *)swift_allocObject(v18, 48, 7);
      v20 = swift_unknownObjectWeakInit(v19 + 2, 0);
      swift_unknownObjectWeakAssign(v20, v17);
      v19[4] = 1852399981;
      v19[5] = 0xE400000000000000;
      v21 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v17);
      v19[3] = v21;
      v22 = v21;
      objc_msgSend(v22, "setWindowLevel:", 1.0);

      v23 = *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel];
      if (v23)
      {
        v24 = type metadata accessor for RootViewModel();
        v25 = sub_100005C84((unint64_t *)&unk_10001E820, (uint64_t (*)(uint64_t))type metadata accessor for RootViewModel, (uint64_t)&unk_1000130F8);
        v26 = swift_retain(v23);
        v38[0] = ObservedObject.init(wrappedValue:)(v26, v24, v25);
        v38[1] = v27;
        v28 = sub_10000FFE0();
        v29 = AnyView.init<A>(_:)(v38, &type metadata for RootView, v28);
        sub_100010E30(v29);
        swift_release(v29);
        v30 = *(_QWORD *)&v7[v15];
        *(_QWORD *)&v7[v15] = v19;
        swift_release(v30);
        goto LABEL_11;
      }
LABEL_20:
      __break(1u);
      return;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_11:
  sub_10000A928(0x756F726765726F66, 0xEA0000000000646ELL);
  sub_10000B5E8(0x756F726765726F66, 0xEA0000000000646ELL);
  if (qword_10001DFE0 != -1)
    swift_once(&qword_10001DFE0, sub_10001016C);
  v31 = sub_100007A78(v1, (uint64_t)qword_10001F7F0);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "App coming to foreground - disabling Force permission dialog", v34, 2u);
    swift_slowDealloc(v34, -1, -1);
  }

  v35 = *(void **)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
  if (v35)
    objc_msgSend(v35, "setForcePermissionDialog:", 0);
}

void sub_10000F6B4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain(v3);
  if (qword_10001DFC8 != -1)
    swift_once(&qword_10001DFC8, sub_1000100D4);
  v6 = sub_100007A78(v1, (uint64_t)qword_10001F7A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v1);
  v7 = v0;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v19 = v2;
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v21 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
    if (!v12)
    {

      __break(1u);
      return;
    }
    v13 = v11;
    v14 = *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain(*(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8]);
    v20 = sub_1000114A4(v14, v12, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%s] sceneDidEnterBackground", v10, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  v15 = sub_10000A3E0();
  v16 = *(void **)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
  *(_QWORD *)&v7[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v15;
  v17 = v15;
  if (v16)
    objc_msgSend(v16, "removeObserver:", v7);
  objc_msgSend(v16, "invalidate");

  sub_10000B814();
}

uint64_t sub_10000F91C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000771C(0, &qword_10001E2B0, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100019430, 24, 7);
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_10000FCB0;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009F90;
  aBlock[3] = &unk_100019448;
  v11 = _Block_copy(aBlock);
  v12 = v22;
  v13 = v1;
  v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_100005C84(&qword_10001E2B8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100007274((uint64_t *)&unk_10001E840);
  v17 = sub_1000077B8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10000FB18(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;

  v9 = v4;
  if (qword_10001DFE8 != -1)
    swift_once(&qword_10001DFE8, sub_10001018C);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_100007A78(v10, (uint64_t)qword_10001F808);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, a1, v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = swift_allocObject(a2, 24, 7);
  *(_QWORD *)(v15 + 16) = v9;
  v19[4] = a3;
  v20 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_100009F90;
  v19[3] = a4;
  v16 = _Block_copy(v19);
  v17 = v20;
  v18 = v9;
  swift_release(v17);
  BSDispatchMain(v16);
  _Block_release(v16);
}

void sub_10000FC74()
{
  uint64_t v0;

  sub_10000D200(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000FC7C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000FCA8()
{
  uint64_t v0;

  sub_10000D054(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10000FCB0()
{
  uint64_t v0;

  sub_10000CC2C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000FCB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v5 + 8));
  if (*(_QWORD *)(v0 + v6))
    swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v3 | 7);
}

void sub_10000FD60(int a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_10000C3BC(a1, *(void **)(v1 + 16), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10000FDC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = (v5 + 7) & 0xFFFFFFFFFFFFF8;
  v7 = (v5 + 31) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  if (*(_QWORD *)(v0 + v7))
    swift_release(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v3 | 7);
}

void sub_10000FE70()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v2 + *(_QWORD *)(v1 + 64);
  sub_10000C548(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(unsigned __int8 *)(v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16), *(void (**)(BOOL))(v0 + ((v3 + 31) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 31) & 0xFFFFFFFFFFFFFFF8) + 8));
}

unint64_t sub_10000FECC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E858;
  if (!qword_10001E858)
  {
    v1 = sub_10000771C(255, &qword_10001E850, UIOpenURLContext_ptr);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001E858);
  }
  return result;
}

uint64_t sub_10000FF24(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_10000FF2C(uint64_t a1)
{
  uint64_t v1;

  sub_10000B3D8(a1, v1);
}

uint64_t sub_10000FF34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007274((uint64_t *)&unk_10001E860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_10000FF7C()
{
  return sub_10000A1D8();
}

_QWORD *sub_10000FF9C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000FFC0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10000FFE0()
{
  unint64_t result;

  result = qword_10001E878;
  if (!qword_10001E878)
  {
    result = swift_getWitnessTable("%b", &type metadata for RootView);
    atomic_store(result, (unint64_t *)&qword_10001E878);
  }
  return result;
}

uint64_t sub_100010024()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100010050()
{
  uint64_t v0;

  sub_100009FBC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000100BC(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F790, 7368801, 0xE300000000000000);
}

uint64_t sub_1000100D4(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F7A8, 0x656E656373, 0xE500000000000000);
}

uint64_t sub_1000100F0(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F7C0, 26997, 0xE200000000000000);
}

uint64_t *sub_100010104(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100010144(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F7D8, 0x6944747065636361, 0xEC000000676F6C61);
}

uint64_t sub_10001016C(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F7F0, 0x656D69746E7572, 0xE700000000000000);
}

uint64_t sub_10001018C(uint64_t a1)
{
  return sub_1000101B4(a1, qword_10001F808, 0x4D79616C70726961, 0xEC0000006C65646FLL);
}

uint64_t sub_1000101B4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100010104(v7, a2);
  sub_100007A78(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000019, 0x80000001000137C0, a3, a4);
}

ValueMetadata *type metadata accessor for PINView()
{
  return &type metadata for PINView;
}

uint64_t sub_100010238(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000141CC, 1);
}

uint64_t sub_100010248@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
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
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  char v129;
  uint64_t KeyPath;
  uint64_t v131;
  uint64_t v132;
  char v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  int v161;
  uint64_t v162;
  int v163;
  double v164;
  int v165;
  char *v166;
  int v167;
  _QWORD *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  char v175;
  uint64_t v176;
  uint64_t v177;
  _BYTE v178[7];
  _BYTE v179[7];
  char v180;
  _BYTE v181[7];
  char v182;
  _BYTE v183[7];
  _BYTE v184[7];
  char v185;
  _BYTE v186[7];
  char v187;
  _BYTE v188[7];
  char v189;

  v168 = a1;
  v3 = sub_100007274(&qword_10001E500);
  __chkstk_darwin(v3);
  v166 = (char *)&v157 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = LocalizedStringKey.init(stringLiteral:)(0x4C5449545F4E4950, 0xE900000000000045);
  v6 = Text.init(_:tableName:bundle:comment:)(v5);
  v8 = v7;
  v10 = v9;
  v12 = v11 & 1;
  v13 = static Font.title.getter();
  v14 = Text.font(_:)(v13, v6, v8, v12, v10);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  swift_release(v13);
  v21 = v18 & 1;
  sub_100010C1C(v6, v8, v12);
  v22 = swift_bridgeObjectRelease(v10);
  v23 = static Font.Weight.medium.getter(v22);
  v24 = Text.fontWeight(_:)(*(_QWORD *)&v23, 0, v14, v16, v21, v20);
  v26 = v25;
  v28 = v27;
  v30 = v29 & 1;
  sub_100010C1C(v14, v16, v21);
  v31 = swift_bridgeObjectRelease(v20);
  v32 = static Color.white.getter(v31);
  v33 = Text.foregroundColor(_:)(v32, v24, v26, v30, v28);
  v35 = v34;
  LOBYTE(v16) = v36;
  v38 = v37;
  swift_release(v32);
  sub_100010C1C(v24, v26, v30);
  v39 = swift_bridgeObjectRelease(v28);
  v40 = static Color.black.getter(v39);
  v41 = Color.opacity(_:)(0.2);
  swift_release(v40);
  v172 = Text.shadow(color:radius:x:y:)(v41, v33, v35, v16 & 1, v38, 4.0, 0.0, 4.0);
  v171 = v42;
  LOBYTE(v40) = v43;
  v173 = v44;
  swift_release(v41);
  v163 = v40 & 1;
  sub_100010C1C(v33, v35, v16 & 1);
  v45 = swift_bridgeObjectRelease(v38);
  v165 = static Edge.Set.bottom.getter(v45);
  v164 = EdgeInsets.init(_all:)(0.5);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = v168[5];
  v176 = v168[4];
  v177 = v52;
  v53 = sub_100010C2C();
  v160 = v53;
  swift_bridgeObjectRetain(v52);
  v54 = Text.init<A>(_:)(&v176, &type metadata for String, v53);
  v56 = v55;
  v58 = v57;
  v60 = v59 & 1;
  v61 = static Font.footnote.getter();
  v62 = Text.font(_:)(v61, v54, v56, v60, v58);
  v64 = v63;
  LOBYTE(v16) = v65;
  v67 = v66;
  swift_release(v61);
  sub_100010C1C(v54, v56, v60);
  v68 = swift_bridgeObjectRelease(v58);
  v69 = static Font.Weight.medium.getter(v68);
  v70 = Text.fontWeight(_:)(*(_QWORD *)&v69, 0, v62, v64, v16 & 1, v67);
  v72 = v71;
  v74 = v73;
  v76 = v75 & 1;
  sub_100010C1C(v62, v64, v16 & 1);
  v77 = swift_bridgeObjectRelease(v67);
  v78 = static Color.white.getter(v77);
  v79 = Text.foregroundColor(_:)(v78, v70, v72, v76, v74);
  v81 = v80;
  LOBYTE(v64) = v82;
  v84 = v83;
  swift_release(v78);
  sub_100010C1C(v70, v72, v76);
  v85 = swift_bridgeObjectRelease(v74);
  v86 = static Color.black.getter(v85);
  v87 = Color.opacity(_:)(0.2);
  swift_release(v86);
  v170 = Text.shadow(color:radius:x:y:)(v87, v79, v81, v64 & 1, v84, 4.0, 0.0, 4.0);
  v169 = v88;
  LOBYTE(v86) = v89;
  v162 = v90;
  swift_release(v87);
  v167 = v86 & 1;
  sub_100010C1C(v79, v81, v64 & 1);
  v91 = swift_bridgeObjectRelease(v84);
  v161 = static Edge.Set.bottom.getter(v91);
  v92 = EdgeInsets.init(_all:)(0.5);
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v99 = v168[3];
  v176 = v168[2];
  v177 = v99;
  swift_bridgeObjectRetain(v99);
  v100 = Text.init<A>(_:)(&v176, &type metadata for String, v160);
  v102 = v101;
  v104 = v103;
  v106 = v105 & 1;
  v107 = type metadata accessor for Font.Design(0);
  v108 = (uint64_t)v166;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v107 - 8) + 56))(v166, 1, 1, v107);
  v109 = static Font.system(size:weight:design:)(0, 1, v108, 48.0);
  sub_100010C70(v108);
  v110 = Text.font(_:)(v109, v100, v102, v106, v104);
  v112 = v111;
  LOBYTE(v84) = v113;
  v115 = v114;
  swift_release(v109);
  LOBYTE(v109) = v84 & 1;
  sub_100010C1C(v100, v102, v106);
  v116 = swift_bridgeObjectRelease(v104);
  v117 = static Font.Weight.medium.getter(v116);
  v118 = Text.fontWeight(_:)(*(_QWORD *)&v117, 0, v110, v112, v84 & 1, v115);
  v120 = v119;
  v122 = v121;
  v124 = v123 & 1;
  sub_100010C1C(v110, v112, v109);
  swift_bridgeObjectRelease(v115);
  v125 = Text.tracking(_:)(v118, v120, v124, v122, 16.0);
  v127 = v126;
  v166 = v128;
  LOBYTE(v115) = v129 & 1;
  LODWORD(v160) = v129 & 1;
  sub_100010C1C(v118, v120, v124);
  swift_bridgeObjectRelease(v122);
  KeyPath = swift_getKeyPath(&unk_100013068);
  v158 = KeyPath;
  v159 = static Color.white.getter(KeyPath);
  v131 = swift_getKeyPath(&unk_100013098);
  v132 = static Color.black.getter(v131);
  v168 = (_QWORD *)Color.opacity(_:)(0.2);
  swift_release(v132);
  v133 = v163;
  v175 = v163;
  v174 = v167;
  v189 = v163;
  v187 = 0;
  v185 = v167;
  v182 = 0;
  v180 = v115;
  *(_DWORD *)(a2 + 17) = v176;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v176 + 3);
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v188;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v188[3];
  v134 = *(_DWORD *)v186;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v186[3];
  *(_DWORD *)(a2 + 73) = v134;
  LOBYTE(v134) = v185;
  v135 = *(_DWORD *)v184;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v184[3];
  *(_DWORD *)(a2 + 97) = v135;
  v136 = *(_DWORD *)v183;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v183[3];
  *(_DWORD *)(a2 + 113) = v136;
  LOBYTE(v136) = v182;
  v137 = *(_DWORD *)v181;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v181[3];
  *(_DWORD *)(a2 + 153) = v137;
  LOBYTE(v137) = v180;
  v138 = *(_DWORD *)v179;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v179[3];
  *(_DWORD *)(a2 + 177) = v138;
  v139 = *(_DWORD *)v178;
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v178[3];
  *(_DWORD *)(a2 + 201) = v139;
  v140 = v172;
  v141 = v171;
  *(_QWORD *)a2 = v172;
  *(_QWORD *)(a2 + 8) = v141;
  *(_BYTE *)(a2 + 16) = v133;
  v142 = v173;
  *(_QWORD *)(a2 + 24) = v173;
  *(_BYTE *)(a2 + 32) = v165;
  *(double *)(a2 + 40) = v164;
  *(_QWORD *)(a2 + 48) = v47;
  *(_QWORD *)(a2 + 56) = v49;
  *(_QWORD *)(a2 + 64) = v51;
  *(_BYTE *)(a2 + 72) = 0;
  v143 = v170;
  v144 = v169;
  *(_QWORD *)(a2 + 80) = v170;
  *(_QWORD *)(a2 + 88) = v144;
  *(_BYTE *)(a2 + 96) = v134;
  v145 = v162;
  *(_QWORD *)(a2 + 104) = v162;
  *(_BYTE *)(a2 + 112) = v161;
  *(double *)(a2 + 120) = v92;
  *(_QWORD *)(a2 + 128) = v94;
  *(_QWORD *)(a2 + 136) = v96;
  *(_QWORD *)(a2 + 144) = v98;
  *(_BYTE *)(a2 + 152) = v136;
  v146 = v125;
  *(_QWORD *)(a2 + 160) = v125;
  *(_QWORD *)(a2 + 168) = v127;
  v147 = v127;
  *(_BYTE *)(a2 + 176) = v137;
  v148 = v166;
  *(_QWORD *)(a2 + 184) = v166;
  *(_QWORD *)(a2 + 192) = KeyPath;
  *(_BYTE *)(a2 + 200) = 1;
  v149 = v159;
  *(_QWORD *)(a2 + 208) = v131;
  *(_QWORD *)(a2 + 216) = v149;
  *(_QWORD *)(a2 + 224) = v168;
  *(_OWORD *)(a2 + 232) = xmmword_100012FF0;
  *(_QWORD *)(a2 + 248) = 0x4010000000000000;
  sub_100010D4C(v140, v141, v133);
  swift_bridgeObjectRetain(v142);
  sub_100010D4C(v143, v144, v167);
  v150 = v145;
  swift_bridgeObjectRetain(v145);
  v151 = v146;
  LOBYTE(v143) = v160;
  sub_100010D4C(v146, v147, v160);
  v152 = v148;
  swift_bridgeObjectRetain(v148);
  v153 = v158;
  swift_retain(v158);
  swift_retain(v131);
  v154 = v149;
  swift_retain(v149);
  v155 = v168;
  swift_retain(v168);
  sub_100010C1C(v151, v147, v143);
  swift_release(v155);
  swift_release(v154);
  swift_release(v131);
  swift_release(v153);
  swift_bridgeObjectRelease(v152);
  sub_100010C1C(v170, v169, v174);
  swift_bridgeObjectRelease(v150);
  sub_100010C1C(v172, v171, v175);
  return swift_bridgeObjectRelease(v173);
}

void *sub_100010B44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _OWORD v6[16];
  _BYTE __src[263];

  v3 = *(_QWORD **)(v1 + 8);
  v4 = static HorizontalAlignment.center.getter();
  sub_100010248(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_100010C1C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_100010C2C()
{
  unint64_t result;

  result = qword_10001E8E0;
  if (!qword_10001E8E0)
  {
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E8E0);
  }
  return result;
}

uint64_t sub_100010C70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007274(&qword_10001E500);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010CB0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100010CD8(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100010CFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100010D24(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100010D4C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_100010D60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E8E8;
  if (!qword_10001E8E8)
  {
    v1 = sub_100007804(&qword_10001E8F0);
    result = swift_getWitnessTable((const char *)&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001E8E8);
  }
  return result;
}

uint64_t sub_100010DAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for RootViewModel()
{
  return objc_opt_self(_TtC15AirPlayReceiver13RootViewModel);
}

uint64_t sub_100010DF8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for RootViewModel();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

void sub_100010E30(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t Strong;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
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
  id v34;
  void *v35;
  id v36;
  id v37;
  os_log_t osloga;
  NSObject *oslog;
  uint64_t v40;
  uint64_t v41;

  v2 = v1;
  Strong = swift_unknownObjectWeakLoadStrong(v1 + 2);
  if (Strong)
  {
    v5 = Strong;
    if (qword_10001DFD0 != -1)
      swift_once(&qword_10001DFD0, sub_1000100F0);
    v6 = type metadata accessor for Logger(0);
    sub_100007A78(v6, (uint64_t)qword_10001F7C0);
    v7 = swift_retain(v1);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      osloga = v5;
      v11 = swift_slowAlloc(32, -1);
      v41 = v11;
      *(_DWORD *)v10 = 136315138;
      v13 = v2[4];
      v12 = v2[5];
      swift_bridgeObjectRetain(v12);
      v40 = sub_1000114A4(v13, v12, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v10 + 4, v10 + 12);
      swift_release(v2);
      swift_bridgeObjectRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Showing [%s] window.", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      v14 = v11;
      v5 = osloga;
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

      swift_release(v2);
    }
    v19 = (void *)v2[3];
    v41 = a1;
    v20 = objc_allocWithZone((Class)sub_100007274(&qword_10001EAB0));
    swift_retain(a1);
    v21 = (void *)UIHostingController.init(rootView:)(&v41);
    objc_msgSend(v19, "setRootViewController:", v21);

    v22 = objc_msgSend(v19, "rootViewController");
    if (v22)
    {
      v23 = v22;
      v24 = objc_msgSend(v22, "view");

      if (!v24)
      {
        __break(1u);
LABEL_20:
        __break(1u);
        return;
      }
      v25 = -[NSObject coordinateSpace](v5, "coordinateSpace");
      objc_msgSend(v25, "bounds");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      swift_unknownObjectRelease(v25);
      objc_msgSend(v24, "setFrame:", v27, v29, v31, v33);

    }
    v34 = objc_msgSend(v19, "rootViewController");
    if (!v34)
    {
LABEL_18:
      objc_msgSend(v19, "setHidden:", 0);
      objc_msgSend(v19, "makeKeyAndVisible");

      return;
    }
    v35 = v34;
    v36 = objc_msgSend(v34, "view");

    if (v36)
    {
      v37 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
      objc_msgSend(v36, "setBackgroundColor:", v37);

      goto LABEL_18;
    }
    goto LABEL_20;
  }
  if (qword_10001DFD0 != -1)
    swift_once(&qword_10001DFD0, sub_1000100F0);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100007A78(v15, (uint64_t)qword_10001F7C0);
  oslog = Logger.logObject.getter(v16);
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "Unable to show mirroring content, because no scene exists.", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

}

unint64_t sub_10001125C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String v3;
  Swift::String v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;

  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease(0xE000000000000000);
  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain(v2);
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(v2);
  v4._countAndFlagsBits = 0x6F646E6977203A5DLL;
  v4._object = (void *)0xEA00000000003D77;
  String.append(_:)(v4);
  v5 = objc_msgSend(*(id *)(v0 + 24), "description");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  v9._countAndFlagsBits = v6;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  v10._countAndFlagsBits = 62;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  return 0xD000000000000014;
}

uint64_t sub_10001135C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for UIWindowController()
{
  return objc_opt_self(_TtC15AirPlayReceiver18UIWindowController);
}

unint64_t sub_1000113B0()
{
  return sub_10001125C();
}

uint64_t sub_1000113D0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000113E0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100011414(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100011434(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_1000114A4(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_1000114A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100011574(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100007848((uint64_t)v12, *a3);
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
      sub_100007848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000FFC0(v12);
  return v7;
}

uint64_t sub_100011574(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10001172C(a5, a6);
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

uint64_t sub_10001172C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000117C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100011998(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100011998(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000117C0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100011934(v4, 0);
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

_QWORD *sub_100011934(uint64_t a1, uint64_t a2)
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
  v4 = sub_100007274(&qword_10001EAB8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100011998(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007274(&qword_10001EAB8);
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

_BYTE **sub_100011AE4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_100011AF4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC15AirPlayReceiverP33_C65430AC313ACA959BB139D2DF595DAC19ResourceBundleClass);
}
