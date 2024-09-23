int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  int v13;
  char **v14;
  uint64_t v15;
  objc_class *ObjCClassFromMetadata;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BE60 != -1)
    swift_once(&qword_10003BE60, sub_10000CAE0);
  v7 = qword_10003EAB0;
  v8 = static MAGLog.service.getter();
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Service will start listening for clients", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v12 = *(void **)(v7 + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener);
  if (v12)
  {
    v13 = static CommandLine.argc.getter(objc_msgSend(v12, "activate"));
    v14 = (char **)static CommandLine.unsafeArgv.getter();
    v15 = type metadata accessor for MAGAngelApp();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v15);
    v17 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v17)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v19 = v18;
      v17 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v19);
    }
    v20 = type metadata accessor for MAGAngelAppDelegate(0);
    v21 = (objc_class *)swift_getObjCClassFromMetadata(v20);
    v22 = NSStringFromClass(v21);
    if (!v22)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v24 = v23;
      v22 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v24);
    }
    UIApplicationMain(v13, v14, v17, v22);

    LODWORD(v12) = 0;
  }
  else
  {
    __break(1u);
  }
  return (int)v12;
}

_QWORD *sub_1000056B0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1000056C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000056CC(uint64_t a1, uint64_t a2)
{
  return sub_100005A28(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000056EC(uint64_t a1, uint64_t a2)
{
  return sub_100005A28(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000056FC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005724(uint64_t a1, id *a2)
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

uint64_t sub_100005798(uint64_t a1, id *a2)
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

uint64_t sub_100005814@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005858(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005CB0(&qword_10003C010, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002AAFC);
  v3 = sub_100005CB0(&qword_10003C018, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002A8F8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000058DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005CB0(&qword_10003C000, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10002AA6C);
  v3 = sub_100005CB0(&qword_10003C008, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10002AA0C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005960@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000059A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005CB0(&qword_10003BFB0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_10002A7A8);
  v3 = sub_100005CB0(&qword_10003BFB8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_10002A750);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005A28(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005A64(uint64_t a1)
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

Swift::Int sub_100005AA4(uint64_t a1)
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

uint64_t sub_100005B14(_QWORD *a1, uint64_t *a2)
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

__n128 sub_100005B9C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005BAC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005BCC(uint64_t result, int a2, int a3)
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
  sub_100005D44(a1, &qword_10003BF70, (uint64_t)&unk_1000355D0);
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BF78, (uint64_t)&unk_1000355F8);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BF80, (uint64_t)&unk_100035620);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BF88, (uint64_t)&unk_100035640);
}

void type metadata accessor for TorchMode(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BF90, (uint64_t)&unk_100035660);
}

uint64_t sub_100005C58()
{
  return sub_100005CB0(&qword_10003BF98, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_10002A718);
}

uint64_t sub_100005C84()
{
  return sub_100005CB0(&qword_10003BFA0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_10002A6F0);
}

uint64_t sub_100005CB0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005CF0()
{
  return sub_100005CB0(&qword_10003BFA8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_10002A780);
}

void type metadata accessor for Role(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BFC0, (uint64_t)&unk_100035680);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100005D44(a1, &qword_10003BFC8, (uint64_t)&unk_1000356A8);
}

void sub_100005D44(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100005D88()
{
  return sub_100005CB0(&qword_10003BFD0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002A8BC);
}

uint64_t sub_100005DB4()
{
  return sub_100005CB0(&qword_10003BFD8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002A890);
}

uint64_t sub_100005DE0()
{
  return sub_100005CB0(&qword_10003BFE0, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10002A9D0);
}

uint64_t sub_100005E0C()
{
  return sub_100005CB0(&qword_10003BFE8, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10002A9A4);
}

uint64_t sub_100005E38()
{
  return sub_100005CB0(&qword_10003BFF0, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10002AA40);
}

uint64_t sub_100005E64()
{
  return sub_100005CB0(&qword_10003BFF8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10002A92C);
}

id sub_100005EA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  char *v12;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  char *v40;
  objc_class *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  id v49;
  id v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  char *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  objc_super v64;

  v63 = a6;
  v49 = a5;
  v56 = a12;
  v57 = a8;
  v55 = a11;
  v53 = a7;
  v54 = a10;
  v52 = a9;
  v19 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v19);
  v62 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v12[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem] = 0;
  v21 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene;
  v58 = (char *)OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene;
  v22 = objc_allocWithZone((Class)SCNScene);
  v23 = v12;
  v59 = v12;
  v24 = v23;
  *(_QWORD *)&v12[v21] = objc_msgSend(v22, "init");
  v25 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer;
  v51 = (char *)OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer;
  *(_QWORD *)((char *)v24 + v25) = objc_msgSend((id)objc_opt_self(SCNRenderer), "rendererWithDevice:options:", 0, 0);
  Date.init()();
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
  v26 = a1;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService) = a1;
  v60 = a2;
  v61 = a3;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_textDetectionService) = a2;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine) = a3;
  v27 = a4;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences) = a4;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager) = a5;
  v28 = v63;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_anstPersonDetectionManager) = v63;
  v30 = v52;
  v29 = v53;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService) = v53;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService) = a8;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakService) = v30;
  v32 = v54;
  v31 = v55;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_imageCaptionService) = v54;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakEventHandler) = v31;
  v33 = v56;
  *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor) = v56;
  v34 = *(char **)&v58[(_QWORD)v59];
  v50 = *(id *)&v51[(_QWORD)v24];
  v51 = v34;
  v59 = v26;
  swift_retain(a2);
  swift_retain(a3);
  v35 = v27;
  swift_retain(v27);
  v58 = (char *)v49;
  swift_retain(v28);
  v36 = v29;
  swift_retain(v29);
  v57 = v57;
  swift_retain(v30);
  swift_retain(v32);
  v37 = v31;
  swift_retain(v31);
  v38 = v33;
  v39 = v50;
  v40 = v51;
  objc_msgSend(v39, "setScene:", v40);

  v41 = (objc_class *)type metadata accessor for MAGAngelDetectionManager(0);
  v64.receiver = v24;
  v64.super_class = v41;
  v42 = objc_msgSendSuper2(&v64, "init");
  v43 = type metadata accessor for TaskPriority(0);
  v44 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v62, 1, 1, v43);
  v45 = (_QWORD *)swift_allocObject(&unk_100035780, 40, 7);
  v45[2] = 0;
  v45[3] = 0;
  v45[4] = v42;
  v46 = v42;
  v47 = sub_1000063BC(v44, (uint64_t)&unk_10003C180, (uint64_t)v45);
  swift_release(v47);

  swift_release(v60);
  swift_release(v61);
  swift_release(v35);

  swift_release(v63);
  swift_release(v36);

  swift_release(v30);
  swift_release(v32);
  swift_release(v37);

  return v46;
}

uint64_t sub_100006254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch(sub_10000626C, 0, 0);
}

uint64_t sub_10000626C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 24) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000062D4, v2, v3);
}

uint64_t sub_1000062D4()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(char **)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  v2 = *(_QWORD *)&v1[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakEventHandler];
  swift_retain(v2);
  v3 = v1;
  v4 = objc_msgSend(v3, "description");
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  v8 = swift_allocObject(&unk_1000357D0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, v3);
  swift_retain(v8);
  MAGPointAndSpeakEventHandler.register(_:asActionHandler:)(v5, v7, &unk_10003C1A0, v8);
  swift_release_n(v8, 2);
  swift_bridgeObjectRelease(v7);
  swift_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000063BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000B358(a1, &qword_10003CB10);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_1000357A8, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_10003C190, v17);
}

uint64_t sub_100006508(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[9] = a1;
  v2[10] = v1;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v2[11] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v2[14] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[15] = v6;
  v2[16] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100006590, 0, 0);
}

uint64_t sub_100006590()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = v0[16];
  v2 = v0[13];
  v17 = v0[15];
  v18 = v0[14];
  v4 = v0[11];
  v3 = v0[12];
  v5 = (void *)v0[9];
  v6 = (char *)v0[10];
  v7 = *(_QWORD *)&v6[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_textDetectionService];
  v8 = swift_retain(v7);
  v9 = (void *)MAGTextDetectionService.queue.getter(v8);
  swift_release(v7);
  v10 = swift_allocObject(&unk_1000358E8, 32, 7);
  *(_QWORD *)(v10 + 16) = v6;
  *(_QWORD *)(v10 + 24) = v5;
  v0[6] = sub_10000B400;
  v0[7] = v10;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000A3F4;
  v0[5] = &unk_100035900;
  v11 = _Block_copy(v0 + 2);
  v12 = v6;
  static DispatchQoS.unspecified.getter(v5);
  v0[8] = &_swiftEmptyArrayStorage;
  v13 = sub_10000B1B8();
  v14 = sub_10000ADD4(&qword_10003C1E0);
  v15 = sub_10000B200();
  dispatch thunk of SetAlgebra.init<A>(_:)(v0 + 8, v14, v15, v4, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v1, v2, v11);
  _Block_release(v11);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v1, v18);
  swift_release(v0[7]);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_100006724(char *a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  char *v7;

  v4 = *(_QWORD *)&a1[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_textDetectionService];
  swift_retain(v4);
  v5 = objc_msgSend(a2, "capturedImage");
  v6 = swift_allocObject(&unk_100035938, 24, 7);
  *(_QWORD *)(v6 + 16) = a1;
  v7 = a1;
  dispatch thunk of MAGTextDetectionService.detectText(fromPixelBuffer:languageCorrection:completionBlock:)(v5, 1, sub_10000B408, v6);
  swift_release(v4);

  return swift_release(v6);
}

uint64_t sub_1000067C8(void *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v25[24];

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v25[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v8);
  v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a1)
  {
    v11 = a1;
    Date.init()(v11);
    v12 = &a2[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
    swift_beginAccess(&a2[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime], v25, 33, 0);
    (*(void (**)(char *, _BYTE *, uint64_t))(v5 + 40))(v12, v7, v4);
    swift_endAccess(v25);
    v13 = type metadata accessor for TaskPriority(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
    v14 = (_QWORD *)swift_allocObject(&unk_100035988, 48, 7);
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = a2;
    v14[5] = v11;
    v15 = a2;
    v16 = &unk_10003C228;
    v17 = (uint64_t)v10;
    v18 = v14;
  }
  else
  {
    v19 = type metadata accessor for TaskPriority(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v10, 1, 1, v19);
    type metadata accessor for MainActor(0);
    v20 = a2;
    v21 = static MainActor.shared.getter(v20);
    v18 = (_QWORD *)swift_allocObject(&unk_100035960, 40, 7);
    v18[2] = v21;
    v18[3] = &protocol witness table for MainActor;
    v18[4] = v20;
    v16 = &unk_10003C218;
    v17 = (uint64_t)v10;
  }
  v22 = sub_1000063BC(v17, (uint64_t)v16, (uint64_t)v18);
  return swift_release(v22);
}

uint64_t sub_1000069A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100006A0C, v6, v7);
}

uint64_t sub_100006A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  swift_retain(v2);
  dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter(1);
  swift_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[2] = a4;
  v5[3] = a5;
  v6 = type metadata accessor for MAGOutputEventEnvironment(0);
  v5[4] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[5] = v7;
  v5[6] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MAGOutputEventSource(0);
  v5[7] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[8] = v9;
  v5[9] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MAGOutputEvent(0);
  v5[10] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v5[11] = v11;
  v5[12] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100006B10, 0, 0);
}

uint64_t sub_100006B10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
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

  v2 = v0[8];
  v1 = v0[9];
  v4 = v0[6];
  v3 = v0[7];
  v5 = v0[4];
  v6 = v0[5];
  v7 = v0[3];
  v8 = *(_QWORD *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v0[13] = v8;
  v9 = sub_10000ADD4(&qword_10003C230);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10002AB60;
  swift_retain(v8);
  *(_QWORD *)(v10 + 32) = detectTextBlocks(forDocument:)(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, enum case for MAGOutputEventSource.liveDetection(_:), v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v4, enum case for MAGOutputEventEnvironment.angel(_:), v5);
  static MAGOutputEvent.detectedText(_:source:environment:)(v10, v1, v4);
  swift_bridgeObjectRelease(v10);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v11 = type metadata accessor for MainActor(0);
  v0[14] = static MainActor.shared.getter();
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  return swift_task_switch(sub_100006C70, v12, v13);
}

uint64_t sub_100006C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 112));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v2);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006CF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for MAGOutputEventEnvironment(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOutputEventSource(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v2[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEvent(0);
  v2[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[14] = v8;
  v2[15] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v2[16] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[17] = v10;
  v2[18] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100006DCC, 0, 0);
}

void sub_100006DCC()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  id v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v1 = *(_QWORD *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 40), "timestamp");
  v3 = v2;
  v4 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService;
  v5 = *(id *)(v1 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService);
  v6 = dispatch thunk of MAGARService.lastARFrameTimestamp.getter();

  if (v3 - v6 < 0.1)
    goto LABEL_20;
  v7 = *(void **)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 48);
  v9 = *(id *)(v1 + v4);
  dispatch thunk of MAGARService.lastARFrameTimestamp.setter(objc_msgSend(v7, "timestamp"));

  v10 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager;
  objc_msgSend(*(id *)(v8 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager), "computePersonDetectionFromFrame:interfaceOrientation:", v7, 1);
  v11 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_anstPersonDetectionManager;
  v12 = *(_QWORD *)(v8 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_anstPersonDetectionManager);
  swift_retain(v12);
  v13 = dispatch thunk of ANSTPersonDetectionManager.computePersonDetectionFromFrame(frame:interfaceOrientation:)(v7, 1);
  swift_release(v12);
  v14 = *(_QWORD *)(v8 + v11);
  v15 = *(void **)(v8 + v10);
  swift_retain(v14);
  v16 = objc_msgSend(v15, "detectedPersonArray");
  v17 = sub_10000B39C(0, &qword_10003C208, DetectedPersonData_ptr);
  v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

  dispatch thunk of ANSTPersonDetectionManager.matchANSTDetections(to:anstDetections:orientation:)(v18, v13, 1);
  swift_bridgeObjectRelease(v18);
  swift_release(v14);
  swift_bridgeObjectRelease(v13);
  v19 = *(_QWORD *)(v0 + 48);
  v20 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences;
  v21 = *(_QWORD *)(v19 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences);
  KeyPath = swift_getKeyPath(&unk_10002ABB8);
  v23 = swift_getKeyPath(&unk_10002ABE0);
  v24 = swift_retain(v21);
  static Published.subscript.getter(v24, KeyPath, v23);
  swift_release(v23);
  swift_release(KeyPath);
  swift_release(v21);
  if (*(_BYTE *)(v0 + 176) == 1)
  {
    v25 = *(_QWORD *)(v0 + 40);
    v26 = *(_QWORD *)(v0 + 48);
    v27 = objc_msgSend(*(id *)(v8 + v10), "detectedPersonArray");
    v28 = sub_10000B39C(0, &qword_10003C208, DetectedPersonData_ptr);
    v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v28);

    v30 = static SpatialPersonDetection.spatialize(_:frame:orientation:)(v29, v25, 1);
    swift_bridgeObjectRelease(v29);
    v31 = *(id *)(v26 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
    dispatch thunk of MAGObjectUnderstandingService.updateSeatOccupancy(for:)(v30);

    swift_bridgeObjectRelease(v30);
  }
  v32 = *(_QWORD *)(v19 + v20);
  v33 = swift_getKeyPath(&unk_10002AC00);
  v34 = swift_getKeyPath(&unk_10002AC28);
  v35 = swift_retain(v32);
  static Published.subscript.getter(v35, v33, v34);
  swift_release(v34);
  swift_release(v33);
  swift_release(v32);
  if (*(_BYTE *)(v0 + 177) != 1)
    goto LABEL_20;
  v36 = objc_msgSend(*(id *)(v8 + v10), "detectedPersonArray");
  v37 = sub_10000B39C(0, &qword_10003C208, DetectedPersonData_ptr);
  v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v36, v37);

  if (!((unint64_t)v38 >> 62))
  {
    if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_7;
    goto LABEL_19;
  }
  if (v38 < 0)
    v56 = v38;
  else
    v56 = v38 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v38);
  v57 = _CocoaArrayWrapper.endIndex.getter(v56);
  swift_bridgeObjectRelease(v38);
  if (!v57)
  {
LABEL_19:
    swift_bridgeObjectRelease(v38);
LABEL_20:
    v58 = *(_QWORD *)(v0 + 120);
    v59 = *(_QWORD *)(v0 + 96);
    v60 = *(_QWORD *)(v0 + 72);
    swift_task_dealloc(*(_QWORD *)(v0 + 144));
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    (*(void (**)(void))(v0 + 8))();
    return;
  }
LABEL_7:
  if ((v38 & 0xC000000000000001) != 0)
  {
    v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v38);
LABEL_10:
    v40 = v39;
    *(_QWORD *)(v0 + 152) = v39;
    swift_bridgeObjectRelease(v38);
    if (objc_msgSend(v40, "isEnabled"))
    {
      if (objc_msgSend(v40, "isValid"))
      {
        objc_msgSend(v40, "position");
        v42 = v41;
        if (v41 >= 1)
        {
          v43 = *(_QWORD *)(v0 + 136);
          v44 = *(_QWORD *)(v0 + 144);
          v45 = *(_QWORD *)(v0 + 96);
          v61 = *(_QWORD *)(v0 + 128);
          v62 = *(_QWORD *)(v0 + 88);
          v46 = *(_QWORD *)(v0 + 72);
          v63 = *(_QWORD *)(v0 + 80);
          v64 = *(_QWORD *)(v0 + 64);
          v47 = *(_QWORD *)(v0 + 48);
          v65 = *(_QWORD *)(v0 + 56);
          v48 = objc_retain(*(id *)(v47
                                  + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
          dispatch thunk of MAGPulseFeedbackProcessor.processPulseFeedback(nearestPersonData:depth:)(v40, v42);

          Date.init()(v49);
          v50 = v47 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
          swift_beginAccess(v47 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v0 + 16, 33, 0);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 40))(v50, v44, v61);
          swift_endAccess(v0 + 16);
          v51 = *(_QWORD *)(v47 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
          *(_QWORD *)(v0 + 160) = v51;
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v62 + 104))(v45, enum case for MAGOutputEventSource.liveDetection(_:), v63);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104))(v46, enum case for MAGOutputEventEnvironment.angel(_:), v65);
          swift_retain(v51);
          v52 = v40;
          static MAGOutputEvent.peopleDetection(closestPerson:depth:source:environment:)(v40, v42, v45, v46);

          (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v46, v65);
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v45, v63);
          v53 = type metadata accessor for MainActor(0);
          *(_QWORD *)(v0 + 168) = static MainActor.shared.getter(v53);
          v54 = dispatch thunk of Actor.unownedExecutor.getter(v53, &protocol witness table for MainActor);
          swift_task_switch(sub_1000073B4, v54, v55);
          return;
        }
      }
    }

    goto LABEL_20;
  }
  if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v39 = *(id *)(v38 + 32);
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_1000073B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[20];
  v3 = v0[14];
  v2 = v0[15];
  v4 = v0[13];
  swift_release(v0[21]);
  dispatch thunk of MAGOutputEngine.schedule(_:)(v2);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(sub_100007420, 0, 0);
}

uint64_t sub_100007420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 144));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007484(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for MAGOutputEventEnvironment(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOutputEventSource(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v2[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEvent(0);
  v2[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[14] = v8;
  v2[15] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v2[16] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[17] = v10;
  v2[18] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DetectedDoor(0);
  v2[19] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[20] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[21] = swift_task_alloc(v13);
  v2[22] = swift_task_alloc(v13);
  v14 = sub_10000ADD4(&qword_10003C1F0);
  v2[23] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v2[24] = v15;
  v2[25] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (*(_QWORD *)(*(_QWORD *)(sub_10000ADD4(&qword_10003C1F8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[26] = swift_task_alloc(v16);
  v2[27] = swift_task_alloc(v16);
  v17 = (*(_QWORD *)(*(_QWORD *)(sub_10000ADD4(&qword_10003C200) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[28] = swift_task_alloc(v17);
  v2[29] = swift_task_alloc(v17);
  return swift_task_switch(sub_100007628, 0, 0);
}

uint64_t sub_100007628()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[6];
  v2 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService;
  v0[30] = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService;
  v3 = *(_QWORD *)(v1 + v2);
  v0[31] = v3;
  v0[32] = objc_opt_self(UIScreen);
  v4 = type metadata accessor for MainActor(0);
  v0[33] = v4;
  v5 = swift_retain(v3);
  v0[34] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000076C4, v6, v7);
}

uint64_t sub_1000076C4()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[32];
  swift_release(v0[34]);
  v0[35] = objc_msgSend(v1, "mainScreen");
  return swift_task_switch(sub_100007720, 0, 0);
}

uint64_t sub_100007720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 264);
  *(_QWORD *)(v1 + 288) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_100007780, v3, v4);
}

uint64_t sub_100007780()
{
  _QWORD *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD *v6;
  char *v8;

  v1 = (void *)v0[35];
  swift_release(v0[36]);
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v8 = (char *)&async function pointer to dispatch thunk of MAGDoorDetectionService.detectDoorsWithFrame(frame:size:detectDecorations:)
     + async function pointer to dispatch thunk of MAGDoorDetectionService.detectDoorsWithFrame(frame:size:detectDecorations:);
  v6 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MAGDoorDetectionService.detectDoorsWithFrame(frame:size:detectDecorations:)
                                  + 1));
  v0[37] = v6;
  *v6 = v0;
  v6[1] = sub_10000781C;
  return ((uint64_t (*)(_QWORD, uint64_t, double, double))v8)(v0[5], 1, v3, v5);
}

uint64_t sub_10000781C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 296);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 248);
  *(_QWORD *)(*(_QWORD *)v1 + 304) = a1;
  swift_task_dealloc(v2);
  swift_release(v3);
  return swift_task_switch(sub_100007884, 0, 0);
}

uint64_t sub_100007884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  float v9;
  unint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  float v25;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  id v45;
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
  void *v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v1 = *(_QWORD *)(v0 + 304);
  if (!v1)
    goto LABEL_22;
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 304));
LABEL_22:
    v34 = *(_QWORD *)(v0 + 224);
    v36 = *(_QWORD *)(v0 + 208);
    v35 = *(_QWORD *)(v0 + 216);
    v37 = *(_QWORD *)(v0 + 200);
    v39 = *(_QWORD *)(v0 + 168);
    v38 = *(_QWORD *)(v0 + 176);
    v40 = *(_QWORD *)(v0 + 144);
    v41 = *(_QWORD *)(v0 + 120);
    v42 = *(_QWORD *)(v0 + 96);
    v72 = *(_QWORD *)(v0 + 72);
    swift_task_dealloc(*(_QWORD *)(v0 + 232));
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v72);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v71 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 160);
  v67 = *(void (**)(uint64_t))(v6 + 16);
  v68 = v1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v67(v2);
  v65 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56);
  v65(v2, 0, 1, v5);
  v70 = v1;
  result = swift_bridgeObjectRetain(v1);
  v8 = 0;
  v9 = 3.4028e38;
  while (1)
  {
    if (v8 == v71)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v3 + 56))(*(_QWORD *)(v0 + 208), 1, 1, *(_QWORD *)(v0 + 184));
      v8 = v71;
    }
    else
    {
      if (v8 >= *(_QWORD *)(v70 + 16))
      {
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      v10 = *(unint64_t **)(v0 + 208);
      v11 = *(_QWORD *)(v0 + 184);
      v12 = *(_QWORD *)(v0 + 152);
      v13 = *(_QWORD *)(v0 + 200) + *(int *)(v4 + 48);
      ((void (*)(uint64_t, unint64_t, uint64_t))v67)(v13, v68 + *(_QWORD *)(v6 + 72) * v8, v12);
      v14 = (char *)v10 + *(int *)(v4 + 48);
      *v10 = v8;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v14, v13, v12);
      (*(void (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v10, 0, 1, v11);
      ++v8;
    }
    v15 = *(_QWORD *)(v0 + 216);
    v16 = *(_QWORD *)(v0 + 184);
    sub_10000B2C8(*(_QWORD *)(v0 + 208), v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v15, 1, v16) == 1)
      break;
    v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
    v18 = v17(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 216) + *(int *)(v4 + 48), *(_QWORD *)(v0 + 152));
    v19 = DetectedDoor.depth.getter(v18);
    if ((v19 & 0x100000000) != 0)
      goto LABEL_12;
    result = DetectedDoor.depth.getter(v19);
    if ((result & 0x100000000) != 0)
      goto LABEL_33;
    if (*(float *)&result > 4.0)
    {
LABEL_12:
      v20 = *(_QWORD *)(v0 + 40);
      v21 = *(_QWORD *)(*(_QWORD *)(v0 + 48) + *(_QWORD *)(v0 + 240));
      v22 = swift_retain(v21);
      DetectedDoor.normalizedBbox.getter(v22);
      v23 = dispatch thunk of MAGDoorDetectionService.getAverageRectDistance(_:inFrame:)(v20);
      swift_release(v21);
      result = DetectedDoor.depth.setter(v23 | ((HIDWORD(v23) & 1) << 32));
    }
    v24 = DetectedDoor.depth.getter(result);
    if ((v24 & (unint64_t)&_mh_execute_header) != 0)
      v25 = 3.4028e38;
    else
      v25 = *(float *)&v24;
    if (v25 < v9)
    {
      v26 = *(_QWORD *)(v0 + 232);
      v27 = *(_QWORD *)(v0 + 176);
      v28 = *(_QWORD *)(v0 + 152);
      sub_10000B358(v26, &qword_10003C200);
      v17(v26, v27, v28);
      result = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v65)(v26, 0, 1, v28);
      v9 = v25;
    }
    else
    {
      result = (*(uint64_t (**)(_QWORD, _QWORD))(v6 + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
    }
  }
  v30 = *(_QWORD *)(v0 + 224);
  v29 = *(_QWORD *)(v0 + 232);
  v32 = *(_QWORD *)(v0 + 152);
  v31 = *(_QWORD *)(v0 + 160);
  swift_bridgeObjectRelease(v70);
  sub_10000B310(v29, v30);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v30, 1, v32) == 1)
  {
    v33 = *(_QWORD *)(v0 + 224);
    sub_10000B358(*(_QWORD *)(v0 + 232), &qword_10003C200);
    swift_bridgeObjectRelease(v70);
    sub_10000B358(v33, &qword_10003C200);
    goto LABEL_22;
  }
  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v6 + 32))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 152));
  if (v9 >= 3.4028e38)
    goto LABEL_28;
  v43 = v9 * 1000.0;
  if ((~COERCE_INT(v9 * 1000.0) & 0x7F800000) == 0)
    goto LABEL_30;
  if (v43 <= -2147500000.0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v43 < 2147500000.0)
  {
    v44 = (int)v43;
    v45 = objc_retain(*(id *)(*(_QWORD *)(v0 + 48)
                            + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
    dispatch thunk of MAGPulseFeedbackProcessor.processDoorPulseFeedback(depth:)(v44);

LABEL_28:
    v73 = *(_QWORD *)(v0 + 264);
    v46 = *(_QWORD *)(v0 + 240);
    v47 = *(_QWORD *)(v0 + 136);
    v48 = *(_QWORD *)(v0 + 144);
    v49 = *(_QWORD *)(v0 + 128);
    v69 = *(_QWORD *)(v0 + 168);
    v50 = *(_QWORD *)(v0 + 96);
    v51 = *(_QWORD *)(v0 + 72);
    v62 = *(_QWORD *)(v0 + 88);
    v63 = *(_QWORD *)(v0 + 80);
    v52 = *(_QWORD *)(v0 + 48);
    v64 = *(_QWORD *)(v0 + 64);
    v66 = *(_QWORD *)(v0 + 56);
    Date.init()(result);
    v53 = v52 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
    swift_beginAccess(v52 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v0 + 16, 33, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 40))(v53, v48, v49);
    swift_endAccess(v0 + 16);
    v54 = *(_QWORD *)(v52 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
    *(_QWORD *)(v0 + 312) = v54;
    v55 = *(_QWORD *)(v52 + v46);
    swift_retain(v54);
    v56 = swift_retain(v55);
    v57 = (void *)dispatch thunk of MAGDoorDetectionService.openStateConfidenceThreshold.getter(v56);
    swift_release(v55);
    v58 = Float.init(truncating:)(v57);

    (*(void (**)(uint64_t, _QWORD, uint64_t))(v62 + 104))(v50, enum case for MAGOutputEventSource.liveDetection(_:), v63);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v64 + 104))(v51, enum case for MAGOutputEventEnvironment.angel(_:), v66);
    static MAGOutputEvent.doorDetection(_:_:openStateConfidenceThreshold:source:environment:)(v69, v70, v50, v51, v58);
    swift_bridgeObjectRelease(v70);
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v51, v66);
    v59 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v50, v63);
    *(_QWORD *)(v0 + 320) = static MainActor.shared.getter(v59);
    v60 = dispatch thunk of Actor.unownedExecutor.getter(v73, &protocol witness table for MainActor);
    return swift_task_switch(sub_100007E70, v60, v61);
  }
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_100007E70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[39];
  v3 = v0[14];
  v2 = v0[15];
  v4 = v0[13];
  swift_release(v0[40]);
  dispatch thunk of MAGOutputEngine.schedule(_:)(v2);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(sub_100007EDC, 0, 0);
}

uint64_t sub_100007EDC()
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
  uint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 232);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
  sub_10000B358(v1, &qword_10003C200);
  v2 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 144);
  v9 = *(_QWORD *)(v0 + 120);
  v10 = *(_QWORD *)(v0 + 96);
  v12 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007FC0(uint64_t a1, uint64_t a2)
{
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

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = type metadata accessor for MAGOutputEventEnvironment(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v3[10] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MAGOutputEventSource(0);
  v3[11] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[12] = v7;
  v3[13] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000ADD4(&qword_10003C1E8);
  v3[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MAGOutputEvent(0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v3[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v3[18] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v3[19] = v12;
  v3[20] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000080C0, 0, 0);
}

uint64_t sub_1000080C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = v1[19];
  v2 = v1[20];
  v4 = v1[18];
  v5 = v1[14];
  v6 = v1[7];
  v7 = v1[5];
  Date.init()(a1);
  v8 = v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v1 + 2, 33, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v8, v2, v4);
  swift_endAccess(v1 + 2);
  v9 = *(_QWORD *)(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v1[21] = v9;
  v10 = type metadata accessor for DetectedObject(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v5, v7, v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  v12 = *(void **)(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain(v9);
  v13 = v12;
  v1[22] = dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  v14 = type metadata accessor for MainActor(0);
  v1[23] = v14;
  v1[24] = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008214, v15, v16);
}

uint64_t sub_100008214()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  float v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v1 = *(void **)(v0 + 176);
  v2 = swift_release(*(_QWORD *)(v0 + 192));
  v3 = SCNNode.base.getter(v2);
  v5 = v4;
  v7 = v6;

  *(float *)(v0 + 208) = v3;
  *(_DWORD *)(v0 + 212) = v5;
  *(_DWORD *)(v0 + 216) = v7;
  return swift_task_switch(sub_100008278, 0, 0);
}

uint64_t sub_100008278()
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
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v14;
  uint64_t v15;

  v15 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 48);
  v9.n128_f64[0] = SIMD3<>.init(_:)(*(float *)(v0 + 208), *(float *)(v0 + 212), *(float *)(v0 + 216));
  v14 = v9;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v2, enum case for MAGOutputEventSource.liveDetection(_:), v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v6, enum case for MAGOutputEventEnvironment.angel(_:), v7);
  static MAGOutputEvent.objectUnderstanding(detectedObject:cameraPosition:detectedOccupants:source:environment:)(v1, v8, v2, v6, v14);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v10 = sub_10000B358(v1, &qword_10003C1E8);
  *(_QWORD *)(v0 + 200) = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000083AC, v11, v12);
}

uint64_t sub_1000083AC()
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

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 80);
  swift_release(*(_QWORD *)(v0 + 200));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v3);
  swift_release(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008450(uint64_t a1, uint64_t a2)
{
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

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = type metadata accessor for MAGOutputEventEnvironment(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v3[10] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MAGOutputEventSource(0);
  v3[11] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[12] = v7;
  v3[13] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MAGOutputEvent(0);
  v3[14] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v3[15] = v9;
  v3[16] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  v3[17] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v3[18] = v11;
  v3[19] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000852C, 0, 0);
}

uint64_t sub_10000852C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v1[18];
  v2 = v1[19];
  v4 = v1[17];
  v5 = v1[7];
  Date.init()(a1);
  v6 = v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v1 + 2, 33, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v6, v2, v4);
  swift_endAccess(v1 + 2);
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v1[20] = v7;
  v8 = *(void **)(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain(v7);
  v9 = v8;
  v1[21] = dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  v10 = type metadata accessor for MainActor(0);
  v1[22] = v10;
  v1[23] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008630, v11, v12);
}

uint64_t sub_100008630()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  float v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v1 = *(void **)(v0 + 168);
  v2 = swift_release(*(_QWORD *)(v0 + 184));
  v3 = SCNNode.base.getter(v2);
  v5 = v4;
  v7 = v6;

  *(float *)(v0 + 200) = v3;
  *(_DWORD *)(v0 + 204) = v5;
  *(_DWORD *)(v0 + 208) = v7;
  return swift_task_switch(sub_100008694, 0, 0);
}

uint64_t sub_100008694()
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
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v15;

  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  v9 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 48);
  v10.n128_f64[0] = SIMD3<>.init(_:)(*(float *)(v0 + 200), *(float *)(v0 + 204), *(float *)(v0 + 208));
  v15 = v10;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, enum case for MAGOutputEventSource.liveDetection(_:), v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, enum case for MAGOutputEventEnvironment.angel(_:), v7);
  static MAGOutputEvent.objectUnderstanding(detectedObjectGroup:cameraPosition:detectedOccupants:source:environment:)(v9, v8, v2, v5, v15);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  *(_QWORD *)(v0 + 192) = static MainActor.shared.getter(v11);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000087B0, v12, v13);
}

uint64_t sub_1000087B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 80);
  swift_release(*(_QWORD *)(v0 + 192));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v3);
  swift_release(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008848(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for MAGOutputEventEnvironment(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOutputEventSource(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v2[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEvent(0);
  v2[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[14] = v8;
  v2[15] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v2[16] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[17] = v10;
  v2[18] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100008920, 0, 0);
}

uint64_t sub_100008920(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v1[17];
  v2 = v1[18];
  v4 = v1[16];
  v5 = v1[6];
  Date.init()(a1);
  v6 = v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v1 + 2, 33, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v6, v2, v4);
  swift_endAccess(v1 + 2);
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v1[19] = v7;
  v8 = *(void **)(v5 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain(v7);
  v9 = v8;
  v1[20] = dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  v10 = type metadata accessor for MainActor(0);
  v1[21] = v10;
  v1[22] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008A24, v11, v12);
}

uint64_t sub_100008A24()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  float v3;
  int v4;
  int v5;
  int v6;
  int v7;

  v1 = *(void **)(v0 + 160);
  v2 = swift_release(*(_QWORD *)(v0 + 176));
  v3 = SCNNode.base.getter(v2);
  v5 = v4;
  v7 = v6;

  *(float *)(v0 + 192) = v3;
  *(_DWORD *)(v0 + 196) = v5;
  *(_DWORD *)(v0 + 200) = v7;
  return swift_task_switch(sub_100008A88, 0, 0);
}

uint64_t sub_100008A88()
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
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v14;

  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 64);
  v8 = *(_QWORD *)(v0 + 40);
  v9.n128_f64[0] = SIMD3<>.init(_:)(*(float *)(v0 + 192), *(float *)(v0 + 196), *(float *)(v0 + 200));
  v14 = v9;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, enum case for MAGOutputEventSource.liveDetection(_:), v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v5, enum case for MAGOutputEventEnvironment.angel(_:), v6);
  static MAGOutputEvent.objectUnderstanding(furnitureDetections:cameraPosition:source:environment:)(v8, v2, v5, v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  *(_QWORD *)(v0 + 184) = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008B9C, v11, v12);
}

uint64_t sub_100008B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 72);
  swift_release(*(_QWORD *)(v0 + 184));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v3);
  swift_release(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch(sub_100008C4C, 0, 0);
}

uint64_t sub_100008C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences);
  KeyPath = swift_getKeyPath(&unk_10002ABB8);
  v3 = swift_getKeyPath(&unk_10002ABE0);
  v4 = swift_retain(v1);
  static Published.subscript.getter(v4, KeyPath, v3);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v1);
  if (*(_BYTE *)(v0 + 32) == 1)
  {
    v5 = *(void **)(v0 + 16);
    v6 = *(_QWORD *)(v0 + 24);
    v7 = *(id *)(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
    dispatch thunk of MAGObjectUnderstandingService.understandObjects(frame:)(v5);

    v8 = *(id *)(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer);
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v8, "updateAtTime:");

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100008D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences);
  KeyPath = swift_getKeyPath(&unk_10002ABB8);
  v3 = swift_getKeyPath(&unk_10002ABE0);
  v4 = swift_retain(v1);
  static Published.subscript.getter(v4, KeyPath, v3);
  swift_release(v1);
  swift_release(KeyPath);
  swift_release(v3);
  v5 = *(void **)(v0 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  if (v9 == 1)
  {
    v6 = *(void **)(v0 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene);
    v7 = v5;
    v8 = v6;
    dispatch thunk of MAGObjectUnderstandingService.startService(with:)();

  }
  else
  {
    v8 = v5;
    dispatch thunk of MAGObjectUnderstandingService.stopService()();
  }

}

uint64_t sub_100008E20(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
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

  v2[8] = a1;
  v2[9] = a2;
  v3 = type metadata accessor for DetectedTextBlock(0);
  v2[10] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[11] = v4;
  v2[12] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DetectedTextAndLanguage(0);
  v2[13] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[14] = v6;
  v2[15] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEventEnvironment(0);
  v2[16] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[17] = v8;
  v2[18] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MAGOutputEventSource(0);
  v2[19] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[20] = v10;
  v2[21] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MAGOutputAnnouncement(0);
  v2[22] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[23] = v12;
  v2[24] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MAGOutputEvent(0);
  v2[25] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v2[26] = v14;
  v2[27] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  v2[28] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v2[29] = v16;
  v2[30] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Date(0);
  v2[31] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v2[32] = v18;
  v2[33] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for MainActor(0);
  v2[34] = static MainActor.shared.getter();
  v20 = dispatch thunk of Actor.unownedExecutor.getter(v19, &protocol witness table for MainActor);
  return swift_task_switch(sub_100008FCC, v20, v21);
}

uint64_t sub_100008FCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t *v16;
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
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;

  v1 = v0;
  v2 = v0 + 16;
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 72);
  swift_release(v3);
  swift_beginAccess(v4 + 16, v2, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4 + 16);
  if (Strong)
  {
    v6 = (char *)Strong;
    v8 = (_QWORD *)(v1 + 240);
    v7 = *(_QWORD *)(v1 + 240);
    v9 = *(_QWORD *)(v1 + 256);
    v10 = *(_QWORD *)(v1 + 264);
    v11 = *(_QWORD *)(v1 + 248);
    v12 = *(_QWORD *)(v1 + 232);
    v86 = *(_QWORD *)(v1 + 224);
    Date.init()();
    v91 = v6;
    v13 = &v6[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
    swift_beginAccess(v13, v1 + 40, 33, 0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 40))(v13, v10, v11);
    v14 = swift_endAccess(v1 + 40);
    MAGPointAndSpeakEvent.eventType.getter(v14);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 88))(v7, v86);
    if (v15 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.processPointAndSpeakUpdate(_:))
    {
      v8 = (_QWORD *)(v1 + 216);
      v16 = *(uint64_t **)(v1 + 240);
      v18 = *(_QWORD *)(v1 + 160);
      v17 = *(_QWORD *)(v1 + 168);
      v87 = *(_QWORD *)(v1 + 216);
      v20 = *(_QWORD *)(v1 + 144);
      v19 = *(_QWORD *)(v1 + 152);
      v21 = *(_QWORD *)(v1 + 128);
      v22 = *(_QWORD *)(v1 + 136);
      (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v1 + 232) + 96))(v16, *(_QWORD *)(v1 + 224));
      v23 = *v16;
      v24 = *(_QWORD *)&v91[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, enum case for MAGOutputEventSource.liveDetection(_:), v19);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v20, enum case for MAGOutputEventEnvironment.angel(_:), v21);
      swift_retain(v24);
      static MAGOutputEvent.pointAndSpeak(_:source:environment:)(v23, v17, v20);
      swift_bridgeObjectRelease(v23);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      dispatch thunk of MAGOutputEngine.schedule(_:)(v87);

      v25 = v24;
    }
    else
    {
      if (v15 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handDetected(_:))
      {
        v8 = (_QWORD *)(v1 + 216);
        v26 = *(_QWORD *)(v1 + 192);
        v88 = *(_QWORD *)(v1 + 184);
        v27 = *(_QWORD *)(v1 + 168);
        v82 = *(_QWORD *)(v1 + 216);
        v84 = *(_QWORD *)(v1 + 176);
        v29 = *(_QWORD *)(v1 + 152);
        v28 = *(_QWORD *)(v1 + 160);
        v30 = *(_QWORD *)(v1 + 136);
        v31 = *(_QWORD *)(v1 + 144);
        v32 = *(_QWORD *)(v1 + 128);
        v33 = *(_QWORD *)&v91[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine];
        (*(void (**)(uint64_t, _QWORD))(v88 + 104))(v26, enum case for MAGOutputAnnouncement.handDetected(_:));
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v27, enum case for MAGOutputEventSource.magAction(_:), v29);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104))(v31, enum case for MAGOutputEventEnvironment.angel(_:), v32);
        swift_retain(v33);
        static MAGOutputEvent.announcement(_:source:environment:)(v26, v27, v31);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v26, v84);
        dispatch thunk of MAGOutputEngine.schedule(_:)(v82);
        swift_release(v33);

LABEL_9:
        v42 = v8 - 1;
        v43 = v8 - 2;
LABEL_10:
        (*(void (**)(_QWORD, _QWORD))(*v42 + 8))(*v8, *v43);
        goto LABEL_11;
      }
      if (v15 != enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handTooClose(_:))
      {
        if (v15 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handleNoContentAvailable(_:))
        {
          v8 = (_QWORD *)(v1 + 120);
          v52 = *(_QWORD *)(v1 + 120);
          v76 = *(_QWORD *)(v1 + 216);
          v77 = *(_QWORD *)(v1 + 208);
          v78 = *(_QWORD *)(v1 + 200);
          v81 = *(_QWORD *)(v1 + 160);
          v71 = *(_QWORD *)(v1 + 152);
          v72 = *(_QWORD *)(v1 + 168);
          v73 = *(_QWORD *)(v1 + 136);
          v74 = *(_QWORD *)(v1 + 128);
          v75 = *(_QWORD *)(v1 + 144);
          v53 = *(_QWORD *)(v1 + 112);
          v70 = *(_QWORD *)(v1 + 104);
          v79 = *(_QWORD *)(v1 + 96);
          v80 = *(_QWORD *)(v1 + 88);
          v90 = *(_QWORD *)(v1 + 80);
          v54 = String.localized.getter(0xD00000000000001ELL, 0x8000000100030950);
          v56 = v55;
          v57 = objc_msgSend((id)objc_opt_self(AVSpeechSynthesisVoice), "currentLanguageCode");
          v58 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
          v60 = v59;

          DetectedTextAndLanguage.init(text:locale:)(v54, v56, v58, v60);
          v61 = sub_10000ADD4(&qword_10003C1A8);
          v62 = *(unsigned __int8 *)(v53 + 80);
          v63 = (v62 + 32) & ~v62;
          v64 = swift_allocObject(v61, v63 + *(_QWORD *)(v53 + 72), v62 | 7);
          *(_OWORD *)(v64 + 16) = xmmword_10002AB60;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16))(v64 + v63, v52, v70);
          DetectedTextBlock.init(stringLocaleMap:normalizedBbox:confidence:detectLanguages:outputRegion:)(v64, 1, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, 0.0);
          v65 = *(_QWORD *)&v91[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine];
          v66 = sub_10000ADD4(&qword_10003C1B0);
          v67 = *(unsigned __int8 *)(v80 + 80);
          v68 = (v67 + 32) & ~v67;
          v69 = swift_allocObject(v66, v68 + *(_QWORD *)(v80 + 72), v67 | 7);
          *(_OWORD *)(v69 + 16) = xmmword_10002AB60;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 16))(v69 + v68, v79, v90);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v81 + 104))(v72, enum case for MAGOutputEventSource.liveDetection(_:), v71);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v73 + 104))(v75, enum case for MAGOutputEventEnvironment.app(_:), v74);
          swift_retain(v65);
          static MAGOutputEvent.pointAndSpeak(_:source:environment:)(v69, v72, v75);
          swift_bridgeObjectRelease(v69);
          (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v75, v74);
          (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v72, v71);
          dispatch thunk of MAGOutputEngine.schedule(_:)(v76);

          swift_release(v65);
          (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
          (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v90);
          v43 = (_QWORD *)(v1 + 104);
          v42 = (_QWORD *)(v1 + 112);
        }
        else
        {

          v43 = (_QWORD *)(v1 + 224);
          v42 = (_QWORD *)(v1 + 232);
        }
        goto LABEL_10;
      }
      v8 = (_QWORD *)(v1 + 216);
      v34 = *(_QWORD *)(v1 + 192);
      v89 = *(_QWORD *)(v1 + 184);
      v35 = *(_QWORD *)(v1 + 168);
      v83 = *(_QWORD *)(v1 + 216);
      v85 = *(_QWORD *)(v1 + 176);
      v36 = *(_QWORD *)(v1 + 152);
      v37 = *(_QWORD *)(v1 + 160);
      v38 = *(_QWORD *)(v1 + 136);
      v39 = *(_QWORD *)(v1 + 144);
      v40 = *(_QWORD *)(v1 + 128);
      v41 = *(_QWORD *)&v91[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine];
      (*(void (**)(uint64_t, _QWORD))(v89 + 104))(v34, enum case for MAGOutputAnnouncement.handTooClose(_:));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v35, enum case for MAGOutputEventSource.magAction(_:), v36);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v39, enum case for MAGOutputEventEnvironment.angel(_:), v40);
      swift_retain(v41);
      static MAGOutputEvent.announcement(_:source:environment:)(v34, v35, v39);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v34, v85);
      dispatch thunk of MAGOutputEngine.schedule(_:)(v83);

      v25 = v41;
    }
    swift_release(v25);
    goto LABEL_9;
  }
LABEL_11:
  v44 = *(_QWORD *)(v1 + 240);
  v45 = *(_QWORD *)(v1 + 216);
  v46 = *(_QWORD *)(v1 + 192);
  v47 = *(_QWORD *)(v1 + 168);
  v48 = *(_QWORD *)(v1 + 144);
  v49 = *(_QWORD *)(v1 + 120);
  v50 = *(_QWORD *)(v1 + 96);
  swift_task_dealloc(*(_QWORD *)(v1 + 264));
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100009748(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = type metadata accessor for Logger(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000097A8, 0, 0);
}

uint64_t sub_1000097A8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v1 = (void *)v0[2];
  v2 = *(_QWORD *)(v0[3] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakService);
  v0[7] = v2;
  swift_retain(v2);
  v3 = objc_msgSend(v1, "capturedImage");
  v4 = type metadata accessor for MAGCVPixelBufferWrapper(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = MAGCVPixelBufferWrapper.init(pixelBuffer:)(v3);
  v0[8] = v5;
  v8 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MAGPointAndSpeakService.predictHandPose(fromPixelBufferWrapper:)
                                       + async function pointer to dispatch thunk of MAGPointAndSpeakService.predictHandPose(fromPixelBufferWrapper:));
  v6 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MAGPointAndSpeakService.predictHandPose(fromPixelBufferWrapper:)
                                  + 1));
  v0[9] = v6;
  *v6 = v0;
  v6[1] = sub_100009870;
  return v8(v5);
}

uint64_t sub_100009870()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 72);
  v3 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_1000098F4, 0, 0);
  v5 = *(_QWORD *)(v3 + 56);
  swift_release(*(_QWORD *)(v3 + 64));
  swift_release(v5);
  swift_task_dealloc(*(_QWORD *)(v3 + 48));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1000098F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 56);
  swift_release(*(_QWORD *)(v0 + 64));
  v2 = swift_release(v1);
  v3 = static Log.angel.getter(v2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Magnifier Angel requests hand pose prediction, but none could be created", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 32);
  swift_errorRelease(*(_QWORD *)(v0 + 80));

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000099D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for Logger(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOutputEventEnvironment(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v2[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEventSource(0);
  v2[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[14] = v8;
  v2[15] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MAGOutputEvent(0);
  v2[16] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[17] = v10;
  v2[18] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v2[19] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[20] = v12;
  v2[21] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100009AD8, 0, 0);
}

uint64_t sub_100009AD8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (void *)v0[5];
  v2 = *(_QWORD *)(v0[6] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_imageCaptionService);
  v0[22] = v2;
  swift_retain(v2);
  v3 = objc_msgSend(v1, "capturedImage");
  v4 = type metadata accessor for MAGCVPixelBufferWrapper(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = MAGCVPixelBufferWrapper.init(pixelBuffer:)(v3);
  v0[23] = v5;
  v6 = (_QWORD *)swift_task_alloc(async function pointer to MAGImageCaptionService.generateImageCaption(for:)[1]);
  v0[24] = v6;
  *v6 = v0;
  v6[1] = sub_100009B8C;
  return MAGImageCaptionService.generateImageCaption(for:)(v5);
}

uint64_t sub_100009B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v6 = *(_QWORD **)v3;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 192);
  *(_QWORD *)(*(_QWORD *)v3 + 200) = v2;
  swift_task_dealloc(v7);
  if (v2)
  {
    v8 = sub_100009E58;
  }
  else
  {
    v9 = v6[22];
    swift_release(v6[23]);
    swift_release(v9);
    v6[26] = a2;
    v6[27] = a1;
    v8 = sub_100009C14;
  }
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_100009C14(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1[26];
  v3 = v1[20];
  v4 = v1[21];
  v5 = v1[19];
  v6 = v1[15];
  v18 = v1[27];
  v19 = v1[14];
  v7 = v1[12];
  v20 = v1[13];
  v21 = v1[11];
  v22 = v1[10];
  v8 = v1[6];
  Date.init()(a1);
  v9 = v8 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess(v8 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime, v1 + 2, 33, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v9, v4, v5);
  swift_endAccess(v1 + 2);
  v10 = *(_QWORD *)(v8 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v1[28] = v10;
  swift_retain(v10);
  v11 = String.localized.getter(v18, v2);
  v13 = v12;
  swift_bridgeObjectRelease(v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v6, enum case for MAGOutputEventSource.liveDetection(_:), v20);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v7, enum case for MAGOutputEventEnvironment.angel(_:), v22);
  static MAGOutputEvent.imageCaptionResult(_:source:environment:)(v11, v13, v6, v7);
  swift_bridgeObjectRelease(v13);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v7, v22);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v6, v20);
  v14 = type metadata accessor for MainActor(0);
  v1[29] = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009DC0, v15, v16);
}

uint64_t sub_100009DC0()
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

  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 232));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v2);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009E58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 184));
  v2 = swift_release(v1);
  v3 = static Log.angel.getter(v2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Magnifier Angel could not generate image descrioption", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 72);
  v9 = *(_QWORD *)(v0 + 56);
  swift_errorRelease(*(_QWORD *)(v0 + 200));

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 120);
  v12 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009F6C()
{
  char *v0;
  char *v1;
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
  void (**v18)(char *, uint64_t);
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  void *v29;
  const void *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char *v50;
  void (**v51)(char *, uint64_t);
  _QWORD v52[2];
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  void (**v62)(char *, uint64_t);
  uint64_t v63;
  char *v64;
  void *v65;
  void **aBlock;
  uint64_t v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  void (*v70)();
  uint64_t v71;

  v1 = v0;
  v2 = type metadata accessor for DispatchTimeInterval(0);
  v54 = *(_QWORD *)(v2 - 8);
  v55 = v2;
  __chkstk_darwin(v2);
  v53 = (_QWORD *)((char *)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v62 = *(void (***)(char *, uint64_t))(v4 - 8);
  __chkstk_darwin(v4);
  v64 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v60 = *(_QWORD *)(v6 - 8);
  v61 = (char *)v6;
  __chkstk_darwin(v6);
  v8 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchTime(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)v52 - v14;
  v63 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem;
  v16 = *(_QWORD *)&v0[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem];
  if (v16)
  {
    v17 = swift_retain(v16);
    dispatch thunk of DispatchWorkItem.cancel()(v17);
    swift_release(v16);
  }
  v52[1] = sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
  v58 = ((uint64_t (*)(void))static OS_dispatch_queue.main.getter)();
  static DispatchTime.now()();
  + infix(_:_:)(v13, 0.5);
  v18 = *(void (***)(char *, uint64_t))(v10 + 8);
  ((void (*)(char *, uint64_t))v18)(v13, v9);
  v19 = swift_allocObject(&unk_100035848, 24, 7);
  *(_QWORD *)(v19 + 16) = v1;
  v70 = sub_10000B17C;
  v71 = v19;
  aBlock = _NSConcreteStackBlock;
  v67 = 1107296256;
  v68 = sub_10000A3F4;
  v69 = &unk_100035860;
  v20 = _Block_copy(&aBlock);
  v59 = v9;
  v52[0] = v13;
  v21 = v20;
  v22 = v71;
  v56 = v1;
  v23 = swift_release(v22);
  static DispatchQoS.unspecified.getter(v23);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v24 = sub_10000B1B8();
  v25 = sub_10000ADD4(&qword_10003C1E0);
  v57 = v1;
  v26 = v25;
  v27 = sub_10000B200();
  v28 = v64;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v26, v27, v4, v24);
  v29 = (void *)v58;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v15, v8, v28, v21);
  v30 = v21;
  v31 = v59;
  _Block_release(v30);

  v62[1](v28, v4);
  (*(void (**)(char *, char *))(v60 + 8))(v8, v61);
  v61 = v15;
  v62 = v18;
  ((void (*)(char *, uint64_t))v18)(v15, v31);
  v32 = swift_allocObject(&unk_100035898, 24, 7);
  v33 = v56;
  *(_QWORD *)(v32 + 16) = v56;
  v70 = sub_10000B290;
  v71 = v32;
  aBlock = _NSConcreteStackBlock;
  v67 = 1107296256;
  v68 = sub_10000A3F4;
  v69 = &unk_1000358B0;
  v34 = _Block_copy(&aBlock);
  v65 = &_swiftEmptyArrayStorage;
  v35 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v65, v26, v27, v4, v24);
  v36 = type metadata accessor for DispatchWorkItem(0);
  swift_allocObject(v36, *(unsigned int *)(v36 + 48), *(unsigned __int16 *)(v36 + 52));
  v37 = DispatchWorkItem.init(flags:block:)(v28, v34);
  swift_release(v71);
  v38 = v63;
  v39 = v57;
  v40 = *(_QWORD *)&v57[v63];
  *(_QWORD *)&v57[v63] = v37;
  v41 = v39;
  result = swift_release(v40);
  v43 = *(_QWORD *)&v41[v38];
  if (v43)
  {
    v44 = swift_retain(v43);
    v45 = (void *)static OS_dispatch_queue.main.getter(v44);
    v46 = v52[0];
    static DispatchTime.now()();
    v48 = v53;
    v47 = v54;
    *v53 = 60;
    v49 = v55;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v47 + 104))(v48, enum case for DispatchTimeInterval.seconds(_:), v55);
    v50 = v61;
    + infix(_:_:)(v46, v48);
    (*(void (**)(_QWORD *, uint64_t))(v47 + 8))(v48, v49);
    v51 = v62;
    ((void (*)(uint64_t, uint64_t))v62)(v46, v31);
    OS_dispatch_queue.asyncAfter(deadline:execute:)(v50, v43);
    swift_release(v43);

    return ((uint64_t (*)(char *, uint64_t))v51)(v50, v31);
  }
  return result;
}

uint64_t sub_10000A3F4(uint64_t a1)
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

void sub_10000A420(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  BOOL v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v3 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(AVCaptureDevice), "defaultDeviceWithMediaType:", AVMediaTypeVideo);
  if (!v6)
    return;
  v7 = v6;
  if (objc_msgSend(v6, "torchMode") == (id)1 && a1 == 0)
  {
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 1, 1, v14);
    v11 = (_QWORD *)swift_allocObject(&unk_100035820, 40, 7);
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v1;
    v15 = v1;
    v13 = &unk_10003C1D0;
  }
  else
  {
    if (objc_msgSend(v7, "torchMode"))
      v9 = 0;
    else
      v9 = a1 == 1;
    if (!v9)
      goto LABEL_14;
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject(&unk_1000357F8, 40, 7);
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v1;
    v12 = v1;
    v13 = &unk_10003C1C0;
  }
  v16 = sub_1000063BC((uint64_t)v5, (uint64_t)v13, (uint64_t)v11);
  swift_release(v16);
LABEL_14:
  v23 = 0;
  v17 = objc_msgSend(v7, "lockForConfiguration:", &v23);
  v18 = v23;
  if (v17)
  {
    v19 = v23;
    if (objc_msgSend(v7, "isTorchModeSupported:", a1))
      objc_msgSend(v7, "setTorchMode:", a1);
    objc_msgSend(v7, "unlockForConfiguration");

  }
  else
  {
    v20 = v23;
    v21 = _convertNSErrorToError(_:)(v18);

    swift_willThrow();
    swift_errorRelease(v21);
  }
}

uint64_t sub_10000A664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[2] = a4;
  v5 = type metadata accessor for MAGOutputEventEnvironment(0);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEventSource(0);
  v4[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[7] = v8;
  v4[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MAGOutputAnnouncement(0);
  v4[9] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v4[10] = v10;
  v4[11] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MAGOutputEvent(0);
  v4[12] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[13] = v12;
  v4[14] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A73C, 0, 0);
}

uint64_t sub_10000A73C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;

  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[8];
  v14 = v0[9];
  v5 = v0[6];
  v4 = v0[7];
  v6 = v0[3];
  v7 = *(_QWORD *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v8 = v0[4];
  v9 = v0[5];
  v0[15] = v7;
  (*(void (**)(uint64_t, _QWORD))(v2 + 104))(v1, enum case for MAGOutputAnnouncement.automaticFlashlightOff(_:));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, enum case for MAGOutputEventSource.magAction(_:), v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v9, enum case for MAGOutputEventEnvironment.angel(_:), v6);
  swift_retain(v7);
  static MAGOutputEvent.announcement(_:source:environment:)(v1, v3, v9);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v14);
  v10 = type metadata accessor for MainActor(0);
  v0[16] = static MainActor.shared.getter();
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000B574, v11, v12);
}

uint64_t sub_10000A88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[2] = a4;
  v5 = type metadata accessor for MAGOutputEventEnvironment(0);
  v4[3] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[4] = v6;
  v4[5] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MAGOutputEventSource(0);
  v4[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[7] = v8;
  v4[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MAGOutputAnnouncement(0);
  v4[9] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v4[10] = v10;
  v4[11] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MAGOutputEvent(0);
  v4[12] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[13] = v12;
  v4[14] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A964, 0, 0);
}

uint64_t sub_10000A964()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;

  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[8];
  v14 = v0[9];
  v5 = v0[6];
  v4 = v0[7];
  v6 = v0[3];
  v7 = *(_QWORD *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  v8 = v0[4];
  v9 = v0[5];
  v0[15] = v7;
  (*(void (**)(uint64_t, _QWORD))(v2 + 104))(v1, enum case for MAGOutputAnnouncement.tooDarkAutomaticFlashlightOn(_:));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, enum case for MAGOutputEventSource.magAction(_:), v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v9, enum case for MAGOutputEventEnvironment.angel(_:), v6);
  swift_retain(v7);
  static MAGOutputEvent.announcement(_:source:environment:)(v1, v3, v9);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v14);
  v10 = type metadata accessor for MainActor(0);
  v0[16] = static MainActor.shared.getter();
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000AAB4, v11, v12);
}

uint64_t sub_10000AAB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 128));
  dispatch thunk of MAGOutputEngine.schedule(_:)(v2);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000AB78()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelDetectionManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000ACDC()
{
  return type metadata accessor for MAGAngelDetectionManager(0);
}

uint64_t type metadata accessor for MAGAngelDetectionManager(uint64_t a1)
{
  uint64_t result;

  result = qword_10003C120;
  if (!qword_10003C120)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MAGAngelDetectionManager);
  return result;
}

uint64_t sub_10000AD20(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[17];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[8] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[9] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[10] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[11] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[12] = "\b";
  v4[13] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[14] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[15] = *(_QWORD *)(result - 8) + 64;
    v4[16] = (char *)&value witness table for Builtin.Int64 + 64;
    return swift_updateClassMetadata2(a1, 256, 17, v4, a1 + 80);
  }
  return result;
}

uint64_t sub_10000ADD4(uint64_t *a1)
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

uint64_t sub_10000AE18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_10003C17C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000B558;
  v3[2] = v2;
  return swift_task_switch(sub_10000626C, 0, 0);
}

uint64_t sub_10000AE78(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000AEDC;
  return v6(a1);
}

uint64_t sub_10000AEDC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000AF28()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AF4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003C18C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000B558;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003C188 + dword_10003C188))(a1, v4);
}

uint64_t sub_10000AFBC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AFE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10003C19C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000B030;
  return sub_100008E20(a1, v1);
}

uint64_t sub_10000B030()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000B07C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003C1BC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return sub_10000A88C(a1, v4, v5, v6);
}

uint64_t sub_10000B0EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003C1CC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return sub_10000A664(a1, v4, v5, v6);
}

uint64_t sub_10000B158()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000B17C()
{
  sub_10000A420(1);
}

uint64_t sub_10000B1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B1B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000B1B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CB60;
  if (!qword_10003CB60)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10003CB60);
  }
  return result;
}

unint64_t sub_10000B200()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CB70;
  if (!qword_10003CB70)
  {
    v1 = sub_10000B24C(&qword_10003C1E0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003CB70);
  }
  return result;
}

uint64_t sub_10000B24C(uint64_t *a1)
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

void sub_10000B290()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_10000A420(0);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
}

uint64_t sub_10000B2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000ADD4(&qword_10003C1F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000ADD4(&qword_10003C200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B358(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000ADD4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B39C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000B3D4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B400()
{
  uint64_t v0;

  return sub_100006724(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000B408(void *a1)
{
  uint64_t v1;

  return sub_1000067C8(a1, *(char **)(v1 + 16));
}

uint64_t sub_10000B414()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B440(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003C214);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B030;
  return sub_1000069A0(a1, v4, v5, v6);
}

uint64_t sub_10000B4AC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B4E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10003C224);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000B558;
  return sub_100006A60(a1, v4, v5, v7, v6);
}

BOOL sub_10000B578(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000B58C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000B5D0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000B5F8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000B638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_stream;
  v2 = sub_10000ADD4(&qword_10003CBD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_continuation;
  v4 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10000B6B8()
{
  return type metadata accessor for MAGAngelClientRequestStream(0);
}

uint64_t type metadata accessor for MAGAngelClientRequestStream(uint64_t a1)
{
  uint64_t result;

  result = qword_10003C270;
  if (!qword_10003C270)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MAGAngelClientRequestStream);
  return result;
}

void sub_10000B6FC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  sub_10000B7A4(319, &qword_10003C280, (uint64_t (*)(_QWORD, ValueMetadata *))&type metadata accessor for AsyncStream);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000B7A4(319, (unint64_t *)&unk_10003C288, (uint64_t (*)(_QWORD, ValueMetadata *))&type metadata accessor for AsyncStream.Continuation);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 2, v6, a1 + 80);
    }
  }
}

void sub_10000B7A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, ValueMetadata *))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, &type metadata for MAGAngelClientRequest);
    if (!v5)
      atomic_store(v4, a2);
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for MAGAngelClientRequest(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MAGAngelClientRequest(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MAGAngelClientRequest(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_10000B8D4 + 4 * byte_10002AC55[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_10000B908 + 4 * byte_10002AC50[v4]))();
}

uint64_t sub_10000B908(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B910(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000B918);
  return result;
}

uint64_t sub_10000B924(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000B92CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_10000B930(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B938(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B944(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000B950(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGAngelClientRequest()
{
  return &type metadata for MAGAngelClientRequest;
}

unint64_t sub_10000B96C()
{
  unint64_t result;

  result = qword_10003C310;
  if (!qword_10003C310)
  {
    result = swift_getWitnessTable(&unk_10002ACD8, &type metadata for MAGAngelClientRequest);
    atomic_store(result, (unint64_t *)&qword_10003C310);
  }
  return result;
}

id sub_10000B9B0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id result;
  void *v23;
  id v24;
  objc_super v25;

  v3 = type metadata accessor for MAGAngelRootView(0);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (id *)((char *)&v25.receiver - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  v8 = (char *)&v25 - v7;
  v9 = (objc_class *)type metadata accessor for MAGAngelWindow();
  v25.receiver = v1;
  v25.super_class = v9;
  v10 = objc_msgSendSuper2(&v25, "initWithWindowScene:", a1);
  v11 = (void *)objc_opt_self(UIColor);
  v12 = v10;
  v13 = objc_msgSend(v11, "clearColor");
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v12, "setClipsToBounds:", 1);
  *v6 = swift_getKeyPath(&unk_10002AD18);
  v14 = sub_10000ADD4(&qword_10003C340);
  v15 = swift_storeEnumTagMultiPayload(v6, v14, 0);
  v16 = (char *)v6 + *(int *)(v3 + 20);
  *(_QWORD *)v16 = sub_10000D784;
  *((_QWORD *)v16 + 1) = 0;
  v16[16] = 0;
  AccessibilityFocusState.init<>()(v15);
  sub_10000BDD0((uint64_t)v6, (uint64_t)v8);
  sub_10000BE14((uint64_t)v8, (uint64_t)v6);
  v17 = sub_10000BE58();
  v18 = AnyView.init<A>(_:)(v6, v3, v17);
  v19 = (void *)_makeUIHostingController(_:tracksContentSize:secure:)(v18, 0, 1);
  swift_release(v18);
  v20 = objc_opt_self(UIViewController);
  v21 = (void *)swift_dynamicCastObjCClassUnconditional(v19, v20, 0, 0, 0);
  result = objc_msgSend(v21, "view");
  if (result)
  {
    v23 = result;
    v24 = objc_msgSend(v11, "clearColor");
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v12, "setRootViewController:", v21);
    sub_10000BEA0((uint64_t)v8);
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000BCC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _swift_stdlib_reportUnimplementedInitializer("MagnifierAngel.MAGAngelWindow", 29, a3, a4, 0);
  __break(1u);
}

id sub_10000BCE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MAGAngelWindow()
{
  return objc_opt_self(_TtC14MagnifierAngel14MAGAngelWindow);
}

uint64_t sub_10000BD30()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10000BD50(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_10000BDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000BE58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C348;
  if (!qword_10003C348)
  {
    v1 = type metadata accessor for MAGAngelRootView(255);
    result = swift_getWitnessTable(&unk_10002AFD0, v1);
    atomic_store(result, (unint64_t *)&qword_10003C348);
  }
  return result;
}

uint64_t sub_10000BEA0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000BEDC()
{
  return sub_10000BFB8((uint64_t)&unk_10002AF08, (uint64_t)&unk_10002AF30);
}

uint64_t sub_10000BEF0()
{
  return sub_10000BFB8((uint64_t)&unk_10002ADE8, (uint64_t)&unk_10002AE10);
}

uint64_t sub_10000BF04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for MAGAngelPreferences(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_10000C490();
  qword_10003EAA0 = v1;
  return result;
}

uint64_t sub_10000BF40()
{
  return sub_10000BFB8((uint64_t)&unk_10002ADA0, (uint64_t)&unk_10002ADC8);
}

uint64_t sub_10000BF54@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002ADE8, (uint64_t)&unk_10002AE10, a2);
}

uint64_t sub_10000BF68(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002ADE8, (uint64_t)&unk_10002AE10);
}

uint64_t sub_10000BF7C()
{
  return sub_10000BFB8((uint64_t)&unk_10002AE30, (uint64_t)&unk_10002AE58);
}

uint64_t sub_10000BF90()
{
  return sub_10000BFB8((uint64_t)&unk_10002AE78, (uint64_t)&unk_10002AEA0);
}

uint64_t sub_10000BFA4()
{
  return sub_10000BFB8((uint64_t)&unk_10002AEC0, (uint64_t)&unk_10002AEE8);
}

uint64_t sub_10000BFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  unsigned __int8 v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

unint64_t sub_10000C020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  char v18;

  v1 = v0;
  KeyPath = swift_getKeyPath(&unk_10002ADA0);
  v3 = swift_getKeyPath(&unk_10002ADC8);
  static Published.subscript.getter(v1, KeyPath, v3);
  swift_release(KeyPath);
  swift_release(v3);
  if (v18 == 1)
  {
    v4._object = (void *)0x8000000100030C80;
    v4._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v4);
  }
  v5 = swift_getKeyPath(&unk_10002ADE8);
  v6 = swift_getKeyPath(&unk_10002AE10);
  static Published.subscript.getter(v1, v5, v6);
  swift_release(v5);
  swift_release(v6);
  if (v18 == 1)
  {
    v7._countAndFlagsBits = 0xD000000000000019;
    v7._object = (void *)0x8000000100030C60;
    String.append(_:)(v7);
  }
  v8 = swift_getKeyPath(&unk_10002AE30);
  v9 = swift_getKeyPath(&unk_10002AE58);
  static Published.subscript.getter(v1, v8, v9);
  swift_release(v8);
  swift_release(v9);
  if (v18 == 1)
  {
    v10._object = (void *)0x8000000100030C40;
    v10._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v10);
  }
  v11 = swift_getKeyPath(&unk_10002AE78);
  v12 = swift_getKeyPath(&unk_10002AEA0);
  static Published.subscript.getter(v1, v11, v12);
  swift_release(v11);
  swift_release(v12);
  if (v18 == 1)
  {
    v13._countAndFlagsBits = 0xD00000000000001BLL;
    v13._object = (void *)0x8000000100030C20;
    String.append(_:)(v13);
  }
  v14 = swift_getKeyPath(&unk_10002AEC0);
  v15 = swift_getKeyPath(&unk_10002AEE8);
  static Published.subscript.getter(v1, v14, v15);
  swift_release(v14);
  swift_release(v15);
  if (v18 == 1)
  {
    v16._countAndFlagsBits = 0xD000000000000018;
    v16._object = (void *)0x8000000100030C00;
    String.append(_:)(v16);
  }
  swift_bridgeObjectRelease(0xE000000000000000);
  return 0xD000000000000015;
}

uint64_t sub_10000C2B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__textDetectionEnabled;
  v2 = sub_10000ADD4(&qword_10003C460);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__peopleDetectionEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__doorDetectionEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__objectUnderstandingEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__imageDescriptionsEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__pointSpeakEnabled, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10000C378()
{
  return type metadata accessor for MAGAngelPreferences(0);
}

uint64_t type metadata accessor for MAGAngelPreferences(uint64_t a1)
{
  uint64_t result;

  result = qword_10003C3A8;
  if (!qword_10003C3A8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MAGAngelPreferences);
  return result;
}

void sub_10000C3BC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  sub_10000C430();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = v4[0];
    v4[4] = v4[0];
    v4[5] = v4[0];
    swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
  }
}

void sub_10000C430()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_10003C3B8)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_10003C3B8);
  }
}

void *sub_10000C484()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000C490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  v1 = sub_10000ADD4(&qword_10003C460);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__textDetectionEnabled;
  v19 = 0;
  Published.init(initialValue:)(&v19, &type metadata for Bool);
  v6 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v6(v5, v4, v1);
  v7 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__peopleDetectionEnabled;
  v18 = 0;
  Published.init(initialValue:)(&v18, &type metadata for Bool);
  v6(v7, v4, v1);
  v8 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__doorDetectionEnabled;
  v17 = 0;
  Published.init(initialValue:)(&v17, &type metadata for Bool);
  v6(v8, v4, v1);
  v9 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__objectUnderstandingEnabled;
  v16 = 0;
  Published.init(initialValue:)(&v16, &type metadata for Bool);
  v6(v9, v4, v1);
  v10 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__imageDescriptionsEnabled;
  v15 = 0;
  Published.init(initialValue:)(&v15, &type metadata for Bool);
  v6(v10, v4, v1);
  v11 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__pointSpeakEnabled;
  v14 = 0;
  Published.init(initialValue:)(&v14, &type metadata for Bool);
  v6(v11, v4, v1);
  return v0;
}

uint64_t sub_10000C62C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_10000C654@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002ADA0, (uint64_t)&unk_10002ADC8, a2);
}

uint64_t sub_10000C668@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002ADA0, (uint64_t)&unk_10002ADC8, a2);
}

uint64_t sub_10000C68C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002ADA0, (uint64_t)&unk_10002ADC8);
}

uint64_t sub_10000C6A0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002ADA0, (uint64_t)&unk_10002ADC8);
}

uint64_t sub_10000C6C4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002ADE8, (uint64_t)&unk_10002AE10, a2);
}

uint64_t sub_10000C6E8(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002ADE8, (uint64_t)&unk_10002AE10);
}

uint64_t sub_10000C70C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AE30, (uint64_t)&unk_10002AE58, a2);
}

uint64_t sub_10000C720@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AE30, (uint64_t)&unk_10002AE58, a2);
}

uint64_t sub_10000C744(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AE30, (uint64_t)&unk_10002AE58);
}

uint64_t sub_10000C758(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AE30, (uint64_t)&unk_10002AE58);
}

uint64_t sub_10000C77C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AE78, (uint64_t)&unk_10002AEA0, a2);
}

uint64_t sub_10000C790@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AE78, (uint64_t)&unk_10002AEA0, a2);
}

uint64_t sub_10000C7B4(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AE78, (uint64_t)&unk_10002AEA0);
}

uint64_t sub_10000C7C8(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AE78, (uint64_t)&unk_10002AEA0);
}

uint64_t sub_10000C7EC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AEC0, (uint64_t)&unk_10002AEE8, a2);
}

uint64_t sub_10000C800@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  char v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(v6, KeyPath, v8);
  swift_release(KeyPath);
  result = swift_release(v8);
  *a4 = v10;
  return result;
}

uint64_t sub_10000C878@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000C800(a1, (uint64_t)&unk_10002AEC0, (uint64_t)&unk_10002AEE8, a2);
}

uint64_t sub_10000C89C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AEC0, (uint64_t)&unk_10002AEE8);
}

uint64_t sub_10000C8B0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  char v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  swift_retain(v8);
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

uint64_t sub_10000C91C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000C8B0(a1, a2, a3, a4, (uint64_t)&unk_10002AEC0, (uint64_t)&unk_10002AEE8);
}

uint64_t sub_10000C948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t result;
  uint64_t v15;

  v0 = sub_10000ADD4(&qword_10003C468);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (uint64_t *)((char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000ADD4(&qword_10003CBD0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MAGAngelClientRequestStream(0);
  v13 = swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  *v3 = 5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for AsyncStream.Continuation.BufferingPolicy.bufferingNewest<A>(_:), v0);
  static AsyncStream.makeStream(of:bufferingPolicy:)(v11, v7, &type metadata for MAGAngelClientRequest, v3, &type metadata for MAGAngelClientRequest);
  (*(void (**)(_QWORD *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v13 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_stream, v11, v8);
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_continuation, v7, v4);
  qword_10003EAA8 = v13;
  return result;
}

uint64_t sub_10000CAE0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t result;

  if (qword_10003BE58 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v0 = qword_10003EAA8;
  v1 = objc_allocWithZone((Class)type metadata accessor for MAGAngelConnectionManager());
  v2 = swift_retain(v0);
  result = sub_1000232E4(v2);
  qword_10003EAB0 = result;
  return result;
}

uint64_t sub_10000CB4C()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v1 = type metadata accessor for MAGAudioService(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  result = MAGAudioService.init(audioSession:)(v0);
  qword_10003EAB8 = result;
  return result;
}

uint64_t sub_10000CBB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  if (qword_10003BE68 != -1)
    swift_once(&qword_10003BE68, sub_10000CB4C);
  v0 = qword_10003EAB8;
  v1 = type metadata accessor for MAGOutputEngine(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v2 = swift_retain(v0);
  result = MAGOutputEngine.init(audioService:audioSessionAutomaticallyDeactivatesAfterSpeaking:)(v2, 1);
  qword_10003EAC0 = result;
  return result;
}

id sub_10000CC28(uint64_t a1)
{
  return sub_10000D6BC(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGPulseFeedbackProcessor, &static MAGAngelCompositionRoot.pulseFeedbackProcessor);
}

uint64_t *MAGAngelCompositionRoot.pulseFeedbackProcessor.unsafeMutableAddressor()
{
  if (qword_10003BE78 != -1)
    swift_once(&qword_10003BE78, sub_10000CC28);
  return &static MAGAngelCompositionRoot.pulseFeedbackProcessor;
}

id static MAGAngelCompositionRoot.pulseFeedbackProcessor.getter()
{
  if (qword_10003BE78 != -1)
    swift_once(&qword_10003BE78, sub_10000CC28);
  return (id)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
}

uint64_t sub_10000CCBC(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGTextDetectionService, (uint64_t (*)(void))&MAGTextDetectionService.init(), &qword_10003EAD0);
}

uint64_t sub_10000CCD8(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGImageCaptionService, (uint64_t (*)(void))&MAGImageCaptionService.init(), &qword_10003EAD8);
}

uint64_t sub_10000CCF4(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGCaptureEventHandler, (uint64_t (*)(void))&MAGCaptureEventHandler.init(), &qword_10003EAE0);
}

uint64_t sub_10000CD10()
{
  id v0;
  uint64_t v1;
  id v2;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone((Class)AVCaptureSession), "init");
  if (qword_10003BE90 != -1)
    swift_once(&qword_10003BE90, sub_10000CCF4);
  v1 = qword_10003EAE0;
  v2 = objc_allocWithZone((Class)type metadata accessor for MAGCaptureService(0));
  swift_retain(v1);
  result = MAGCaptureService.init(captureSession:eventHandler:)(v0, v1);
  qword_10003EAE8 = result;
  return result;
}

uint64_t sub_10000CDAC(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGAREventHandler, (uint64_t (*)(void))&MAGAREventHandler.init(), &qword_10003EAF0);
}

uint64_t sub_10000CDC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t result;

  if (qword_10003BEA0 != -1)
    swift_once(&qword_10003BEA0, sub_10000CDAC);
  v0 = qword_10003EAF0;
  v1 = qword_10003BE98;
  swift_retain(qword_10003EAF0);
  if (v1 != -1)
    swift_once(&qword_10003BE98, sub_10000CD10);
  v2 = MAGCaptureService.captureSessionQueue.getter();
  v3 = objc_allocWithZone((Class)type metadata accessor for MAGARService(0));
  result = MAGARService.init(eventHandler:captureSessionQueue:)(v0, v2);
  qword_10003EAF8 = result;
  return result;
}

uint64_t sub_10000CE78()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;

  if (qword_10003BE80 != -1)
    swift_once(&qword_10003BE80, sub_10000CCBC);
  v0 = qword_10003EAD0;
  v1 = qword_10003BEA8;
  swift_retain(qword_10003EAD0);
  if (v1 != -1)
    swift_once(&qword_10003BEA8, sub_10000CDC8);
  v2 = (void *)qword_10003EAF8;
  v3 = type metadata accessor for MAGDoorDetectionService(0);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  result = MAGDoorDetectionService.init(textDetectionService:arService:)(v0, v2);
  qword_10003EB00 = result;
  return result;
}

uint64_t sub_10000CF30(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGOUEventHandler, (uint64_t (*)(void))&MAGOUEventHandler.init(), &qword_10003EB08);
}

uint64_t sub_10000CF4C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t result;

  if (qword_10003BEA8 != -1)
    swift_once(&qword_10003BEA8, sub_10000CDC8);
  v0 = qword_10003BEB8;
  v1 = (id)qword_10003EAF8;
  if (v0 != -1)
    swift_once(&qword_10003BEB8, sub_10000CF30);
  v2 = qword_10003EB08;
  v3 = qword_10003BE78;
  swift_retain(qword_10003EB08);
  if (v3 != -1)
    swift_once(&qword_10003BE78, sub_10000CC28);
  v4 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  v5 = objc_allocWithZone((Class)type metadata accessor for MAGObjectUnderstandingService(0));
  result = MAGObjectUnderstandingService.init(arService:eventHandler:pulseFeedbackProcessor:)(v1, v2, v4);
  qword_10003EB10 = result;
  return result;
}

uint64_t sub_10000D03C(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for MAGPointAndSpeakEventHandler, (uint64_t (*)(void))&MAGPointAndSpeakEventHandler.init(), &static MAGAngelCompositionRoot.pointAndSpeakEventHandler);
}

uint64_t *MAGAngelCompositionRoot.pointAndSpeakEventHandler.unsafeMutableAddressor()
{
  if (qword_10003BEC8 != -1)
    swift_once(&qword_10003BEC8, sub_10000D03C);
  return &static MAGAngelCompositionRoot.pointAndSpeakEventHandler;
}

uint64_t static MAGAngelCompositionRoot.pointAndSpeakEventHandler.getter()
{
  if (qword_10003BEC8 != -1)
    swift_once(&qword_10003BEC8, sub_10000D03C);
  return swift_retain(static MAGAngelCompositionRoot.pointAndSpeakEventHandler);
}

ValueMetadata *type metadata accessor for MAGAngelCompositionRoot()
{
  return &type metadata for MAGAngelCompositionRoot;
}

uint64_t sub_10000D0E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;

  if (qword_10003BEC8 != -1)
    swift_once(&qword_10003BEC8, sub_10000D03C);
  v0 = static MAGAngelCompositionRoot.pointAndSpeakEventHandler;
  v1 = qword_10003BEA8;
  swift_retain(static MAGAngelCompositionRoot.pointAndSpeakEventHandler);
  if (v1 != -1)
    swift_once(&qword_10003BEA8, sub_10000CDC8);
  v2 = qword_10003BE80;
  v3 = (id)qword_10003EAF8;
  if (v2 != -1)
    swift_once(&qword_10003BE80, sub_10000CCBC);
  v4 = qword_10003EAD0;
  v5 = qword_10003BE70;
  swift_retain(qword_10003EAD0);
  if (v5 != -1)
    swift_once(&qword_10003BE70, sub_10000CBB0);
  v6 = qword_10003EAC0;
  v7 = qword_10003BE78;
  swift_retain(qword_10003EAC0);
  if (v7 != -1)
    swift_once(&qword_10003BE78, sub_10000CC28);
  v8 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  v9 = type metadata accessor for MAGPointAndSpeakService(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  result = MAGPointAndSpeakService.init(eventHandler:arService:textDetectionService:outputEngine:pulseFeedbackProcessor:)(v0, v3, v4, v6, v8);
  qword_10003EB20 = result;
  return result;
}

uint64_t sub_10000D260()
{
  if (qword_10003BE50 != -1)
    swift_once(&qword_10003BE50, sub_10000BF04);
  qword_10003EB28 = qword_10003EAA0;
  return swift_retain(qword_10003EAA0);
}

id sub_10000D2A8()
{
  double v0;
  double v1;
  double v2;
  float v3;
  float v4;
  float v5;
  id v6;
  double v7;
  double v8;
  double v9;
  id result;

  v0 = static Detection.centerDetectionRectSize.getter();
  v2 = v1;
  v3 = static Detection.labellingTolerance.getter();
  v4 = static Detection.significantAreaThresholdMM.getter();
  v5 = static Detection.closeDetectionFactor.getter();
  v6 = objc_allocWithZone((Class)PersonDetectionManager);
  *(float *)&v7 = v3;
  *(float *)&v8 = v4;
  *(float *)&v9 = v5;
  result = objc_msgSend(v6, "initWithCenterDetectionSize:labellingTolerance:significantAreaThresholdMM:closeDetectionFactor:", v0, v2, v7, v8, v9);
  qword_10003EB30 = (uint64_t)result;
  return result;
}

uint64_t sub_10000D328(uint64_t a1)
{
  return sub_10000D344(a1, (uint64_t (*)(_QWORD))&type metadata accessor for ANSTPersonDetectionManager, (uint64_t (*)(void))&ANSTPersonDetectionManager.init(), &qword_10003EB38);
}

uint64_t sub_10000D344(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = a2(0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  result = a3();
  *a4 = result;
  return result;
}

id sub_10000D38C()
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
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id result;
  id v22;
  uint64_t v23;
  id v24;

  if (qword_10003BEA8 != -1)
    swift_once(&qword_10003BEA8, sub_10000CDC8);
  v0 = qword_10003BE80;
  v24 = (id)qword_10003EAF8;
  if (v0 != -1)
    swift_once(&qword_10003BE80, sub_10000CCBC);
  v1 = qword_10003BE70;
  v23 = qword_10003EAD0;
  swift_retain(qword_10003EAD0);
  if (v1 != -1)
    swift_once(&qword_10003BE70, sub_10000CBB0);
  v2 = qword_10003EAC0;
  v3 = qword_10003BED8;
  swift_retain(qword_10003EAC0);
  if (v3 != -1)
    swift_once(&qword_10003BED8, sub_10000D260);
  v4 = qword_10003EB28;
  v5 = qword_10003BEE0;
  swift_retain(qword_10003EB28);
  if (v5 != -1)
    swift_once(&qword_10003BEE0, sub_10000D2A8);
  v6 = qword_10003BEE8;
  v22 = (id)qword_10003EB30;
  if (v6 != -1)
    swift_once(&qword_10003BEE8, sub_10000D328);
  v7 = qword_10003EB38;
  v8 = qword_10003BEB0;
  swift_retain(qword_10003EB38);
  if (v8 != -1)
    swift_once(&qword_10003BEB0, sub_10000CE78);
  v9 = qword_10003EB00;
  v10 = qword_10003BEC0;
  swift_retain(qword_10003EB00);
  if (v10 != -1)
    swift_once(&qword_10003BEC0, sub_10000CF4C);
  v11 = qword_10003BED0;
  v12 = (id)qword_10003EB10;
  if (v11 != -1)
    swift_once(&qword_10003BED0, sub_10000D0E8);
  v13 = qword_10003EB20;
  v14 = qword_10003BE88;
  swift_retain(qword_10003EB20);
  if (v14 != -1)
    swift_once(&qword_10003BE88, sub_10000CCD8);
  v15 = qword_10003EAD8;
  v16 = qword_10003BEC8;
  swift_retain(qword_10003EAD8);
  if (v16 != -1)
    swift_once(&qword_10003BEC8, sub_10000D03C);
  v17 = static MAGAngelCompositionRoot.pointAndSpeakEventHandler;
  v18 = qword_10003BE78;
  swift_retain(static MAGAngelCompositionRoot.pointAndSpeakEventHandler);
  if (v18 != -1)
    swift_once(&qword_10003BE78, sub_10000CC28);
  v19 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  v20 = objc_allocWithZone((Class)type metadata accessor for MAGAngelDetectionManager(0));
  result = sub_100005EA0(v24, v23, v2, v4, v22, v7, v9, v12, v13, v15, v17, v19);
  qword_10003EB40 = (uint64_t)result;
  return result;
}

id sub_10000D6A8(uint64_t a1)
{
  return sub_10000D6BC(a1, (uint64_t (*)(_QWORD))type metadata accessor for MAGAngelProxy, &qword_10003EB48);
}

id sub_10000D6BC(uint64_t a1, uint64_t (*a2)(_QWORD), _QWORD *a3)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)a2(0)), "init");
  *a3 = result;
  return result;
}

id sub_10000D730(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for MAGAngelApp()
{
  return objc_opt_self(_TtC14MagnifierAngel11MAGAngelApp);
}

uint64_t sub_10000D784()
{
  if (qword_10003BED8 != -1)
    swift_once(&qword_10003BED8, sub_10000D260);
  return swift_retain(qword_10003EB28);
}

uint64_t *sub_10000D7C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_10000ADD4(&qword_10003C340);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = *(_QWORD *)v16;
    v18 = *((_QWORD *)v16 + 1);
    v19 = v16[16];
    sub_10000D984(*(_QWORD *)v16, v18);
    *(_QWORD *)v15 = v17;
    *((_QWORD *)v15 + 1) = v18;
    v15[16] = v19;
    v20 = *(int *)(a3 + 24);
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = type metadata accessor for AccessibilityTechnologies(0);
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = sub_10000ADD4(&qword_10003C498);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v26 = (int *)sub_10000ADD4(&qword_10003C4A0);
    v21[v26[9]] = v22[v26[9]];
    v27 = v26[10];
    v12 = *(_QWORD *)&v22[v27];
    *(_QWORD *)&v21[v27] = v12;
    v21[v26[11]] = v22[v26[11]];
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_10000D984(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_10000D98C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_10000ADD4(&qword_10003C340);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  sub_10000DA64(*(_QWORD *)((char *)a1 + *(int *)(a2 + 20)), *(_QWORD *)((char *)a1 + *(int *)(a2 + 20) + 8));
  v6 = (char *)a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for AccessibilityTechnologies(0);
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  v9 = *(_QWORD *)&v6[*(int *)(sub_10000ADD4(&qword_10003C4A0) + 40)];
  return swift_release(v9);
}

uint64_t sub_10000DA64(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t *sub_10000DA6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_10000ADD4(&qword_10003C340);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(_QWORD *)v14;
  v16 = *((_QWORD *)v14 + 1);
  v17 = v14[16];
  sub_10000D984(*(_QWORD *)v14, v16);
  *(_QWORD *)v13 = v15;
  *((_QWORD *)v13 + 1) = v16;
  v13[16] = v17;
  v18 = *(int *)(a3 + 24);
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = type metadata accessor for AccessibilityTechnologies(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = sub_10000ADD4(&qword_10003C498);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = (int *)sub_10000ADD4(&qword_10003C4A0);
  v19[v24[9]] = v20[v24[9]];
  v25 = v24[10];
  v26 = *(_QWORD *)&v20[v25];
  *(_QWORD *)&v19[v25] = v26;
  v19[v24[11]] = v20[v24[11]];
  swift_retain(v26);
  return a1;
}

uint64_t *sub_10000DC04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a1 != a2)
  {
    sub_10000B358((uint64_t)a1, &qword_10003C340);
    v6 = sub_10000ADD4(&qword_10003C340);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = *(_QWORD *)v14;
  v16 = *((_QWORD *)v14 + 1);
  v17 = v14[16];
  sub_10000D984(*(_QWORD *)v14, v16);
  v18 = *(_QWORD *)v13;
  v19 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v13 = v15;
  *((_QWORD *)v13 + 1) = v16;
  v13[16] = v17;
  sub_10000DA64(v18, v19);
  v20 = *(int *)(a3 + 24);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = type metadata accessor for AccessibilityTechnologies(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v16) = v25(v21, 1, v23);
  v26 = v25(v22, 1, v23);
  if (!(_DWORD)v16)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_11;
  }
  if (v26)
  {
LABEL_11:
    v27 = sub_10000ADD4(&qword_10003C498);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_12:
  v28 = (int *)sub_10000ADD4(&qword_10003C4A0);
  v21[v28[9]] = v22[v28[9]];
  v29 = v28[10];
  v30 = *(_QWORD *)&v21[v29];
  v31 = *(_QWORD *)&v22[v29];
  *(_QWORD *)&v21[v29] = v31;
  swift_retain(v31);
  swift_release(v30);
  v21[v28[11]] = v22[v28[11]];
  return a1;
}

char *sub_10000DE10(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;

  v6 = sub_10000ADD4(&qword_10003C340);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(int *)(a3 + 24);
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  v10[16] = v11[16];
  v12 = &a1[v9];
  v13 = &a2[v9];
  v14 = type metadata accessor for AccessibilityTechnologies(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = sub_10000ADD4(&qword_10003C498);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v17 = (int *)sub_10000ADD4(&qword_10003C4A0);
  v12[v17[9]] = v13[v17[9]];
  *(_QWORD *)&v12[v17[10]] = *(_QWORD *)&v13[v17[10]];
  v12[v17[11]] = v13[v17[11]];
  return a1;
}

char *sub_10000DF80(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 != a2)
  {
    sub_10000B358((uint64_t)a1, &qword_10003C340);
    v6 = sub_10000ADD4(&qword_10003C340);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = v10[16];
  v12 = *(_QWORD *)v9;
  v13 = *((_QWORD *)v9 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_10000DA64(v12, v13);
  v14 = *(int *)(a3 + 24);
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = type metadata accessor for AccessibilityTechnologies(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_10;
  }
  if (v21)
  {
LABEL_10:
    v22 = sub_10000ADD4(&qword_10003C498);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
LABEL_11:
  v23 = (int *)sub_10000ADD4(&qword_10003C4A0);
  v15[v23[9]] = v16[v23[9]];
  v24 = v23[10];
  v25 = *(_QWORD *)&v15[v24];
  *(_QWORD *)&v15[v24] = *(_QWORD *)&v16[v24];
  swift_release(v25);
  v15[v23[11]] = v16[v23[11]];
  return a1;
}

uint64_t sub_10000E170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000E17C);
}

uint64_t sub_10000E17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = sub_10000ADD4(&qword_10003C4A8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v9 > 1)
      return (v9 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v10 = sub_10000ADD4(&qword_10003C4A0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v10);
  }
}

uint64_t sub_10000E228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000E234);
}

uint64_t sub_10000E234(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_10000ADD4(&qword_10003C4A8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
      return result;
    }
    v10 = sub_10000ADD4(&qword_10003C4A0);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for MAGAngelRootView(uint64_t a1)
{
  return sub_1000113D8(a1, (uint64_t *)&unk_10003C508, (uint64_t)&nominal type descriptor for MAGAngelRootView);
}

void sub_10000E2F4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  sub_10000E380(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = &unk_10002AFB8;
    sub_10000E3D4();
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_10000E380(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10003C518)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10003C518);
  }
}

void sub_10000E3D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_10003C520)
  {
    v0 = type metadata accessor for AccessibilityFocusState(0, &type metadata for Bool, &protocol witness table for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_10003C520);
  }
}

uint64_t sub_10000E430(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002BFAC, 1);
}

uint64_t sub_10000E440@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  char *v11;
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t OpaqueTypeConformance2;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unsigned __int8 v77;

  v2 = v1;
  v72 = a1;
  v3 = type metadata accessor for AccessibilityActionKind(0);
  v73 = *(_QWORD *)(v3 - 8);
  v74 = v3;
  __chkstk_darwin(v3);
  v71 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  v69 = *(_QWORD *)(v5 - 8);
  v70 = v5;
  __chkstk_darwin(v5);
  v68 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = type metadata accessor for MAGAngelRootView(0);
  v7 = *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64);
  v66 = *(_QWORD *)(v62 - 8);
  v67 = v7;
  __chkstk_darwin(v62);
  v65 = (uint64_t)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000ADD4(&qword_10003C558);
  __chkstk_darwin(v9);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10000ADD4(&qword_10003C560);
  __chkstk_darwin(v12);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10000ADD4(&qword_10003C568);
  __chkstk_darwin(v15);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_10000ADD4(&qword_10003C570);
  v19 = *(_QWORD *)(v18 - 8);
  v59 = v18;
  v60 = v19;
  __chkstk_darwin(v18);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_10000ADD4(&qword_10003C578);
  v63 = *(_QWORD *)(v22 - 8);
  v64 = v22;
  __chkstk_darwin(v22);
  v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_10000ADD4(&qword_10003C580);
  __chkstk_darwin(v61);
  v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_10000E948(v1, (uint64_t)v11);
  v28 = static Alignment.center.getter(v27);
  sub_100010A90(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v14, 0.0, 1, 0.0, 1, v28, v29);
  v30 = sub_10000B358((uint64_t)v11, &qword_10003C558);
  v31 = static Color.black.getter(v30);
  v32 = Color.opacity(_:)(0.4);
  v33 = swift_release(v31);
  LOBYTE(v31) = static Edge.Set.all.getter(v33);
  sub_100013C7C((uint64_t)v14, (uint64_t)v17, &qword_10003C560);
  v34 = &v17[*(int *)(v15 + 36)];
  *(_QWORD *)v34 = v32;
  v34[8] = v31;
  sub_10000B358((uint64_t)v14, &qword_10003C560);
  v35 = sub_100010FD0();
  View.allowsSecureDrawing()(v15, v35);
  sub_10000B358((uint64_t)v17, &qword_10003C568);
  v36 = sub_10000ADD4(&qword_10003C4A0);
  AccessibilityFocusState.projectedValue.getter(&v75, v36);
  v37 = v75;
  v38 = v76;
  v39 = v77;
  v75 = v15;
  v76 = v35;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v75, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
  v41 = v59;
  View.accessibilityFocused(_:)(v37, v38, v39, v59, OpaqueTypeConformance2);
  swift_release(v38);
  swift_release(v37);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v21, v41);
  v42 = v65;
  sub_100011234(v2, v65, type metadata accessor for MAGAngelRootView);
  v43 = *(unsigned __int8 *)(v66 + 80);
  v44 = (v43 + 16) & ~v43;
  v45 = swift_allocObject(&unk_100035AD8, v44 + v67, v43 | 7);
  v46 = sub_100013934(v42, v45 + v44, type metadata accessor for MAGAngelRootView);
  v47 = v68;
  static TaskPriority.userInitiated.getter(v46);
  v48 = v61;
  v49 = &v26[*(int *)(v61 + 36)];
  v50 = type metadata accessor for _TaskModifier(0);
  v52 = v69;
  v51 = v70;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(&v49[*(int *)(v50 + 20)], v47, v70);
  *(_QWORD *)v49 = &unk_10003C5C8;
  *((_QWORD *)v49 + 1) = v45;
  v54 = v63;
  v53 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v26, v24, v64);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v47, v51);
  v55 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v24, v53);
  v56 = v71;
  static AccessibilityActionKind.escape.getter(v55);
  v57 = sub_100011158();
  View.accessibilityAction(_:_:)(v56, sub_100010EF0, 0, v48, v57);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v56, v74);
  return sub_10000B358((uint64_t)v26, &qword_10003C580);
}

uint64_t sub_10000E948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char HasJindo;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t IsPad;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  __int128 v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t OpaqueTypeConformance2;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _OWORD v119[3];

  v115 = a2;
  v3 = sub_10000ADD4(&qword_10003C5E8);
  v4 = __chkstk_darwin(v3);
  v114 = (uint64_t)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v98 - v6;
  v8 = type metadata accessor for AccessibilityChildBehavior(0);
  v111 = *(_QWORD *)(v8 - 8);
  v112 = v8;
  __chkstk_darwin(v8);
  v110 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v101);
  v11 = (_OWORD *)((char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v104 = type metadata accessor for ContentShapeKinds(0);
  v12 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104);
  v102 = (char *)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000ADD4(&qword_10003C5F0);
  __chkstk_darwin(v14);
  v16 = (uint64_t *)((char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = sub_10000ADD4(&qword_10003C5F8);
  __chkstk_darwin(v17);
  v19 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = sub_10000ADD4(&qword_10003C600);
  __chkstk_darwin(v103);
  v21 = (char *)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_10000ADD4(&qword_10003C608);
  v107 = *(_QWORD *)(v22 - 8);
  v108 = v22;
  __chkstk_darwin(v22);
  v105 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10000ADD4(&qword_10003C610);
  v25 = __chkstk_darwin(v24);
  v109 = (uint64_t)&v98 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v25);
  v29 = (char *)&v98 - v28;
  __chkstk_darwin(v27);
  v106 = (uint64_t)&v98 - v30;
  v31 = sub_10000ADD4(&qword_10003C618);
  v32 = __chkstk_darwin(v31);
  v34 = (char *)&v98 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v32);
  v116 = (uint64_t)&v98 - v36;
  HasJindo = AXDeviceHasJindo(v35);
  v113 = a1;
  if ((HasJindo & 1) == 0)
  {
    *v16 = static Alignment.center.getter();
    v16[1] = v43;
    v44 = sub_10000ADD4(&qword_10003C620);
    v45 = sub_10000F158(a1, (uint64_t)v16 + *(int *)(v44 + 44));
    IsPad = AXDeviceIsPad(v45);
    v47 = v12;
    v99 = v29;
    v48 = IsPad;
    v49 = AXDeviceIsPad(IsPad);
    if (v48)
      v50 = 0x4069000000000000;
    else
      v50 = 0x4066800000000000;
    v100 = v7;
    if (v49)
      v51 = 0x4049000000000000;
    else
      v51 = 0x4046800000000000;
    v52 = static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)(v119, v50, 0, v51, 0, v52, v53);
    sub_100013C7C((uint64_t)v16, (uint64_t)v19, &qword_10003C5F0);
    v54 = &v19[*(int *)(v17 + 36)];
    v55 = v119[1];
    *(_OWORD *)v54 = v119[0];
    *((_OWORD *)v54 + 1) = v55;
    *((_OWORD *)v54 + 2) = v119[2];
    v56 = sub_10000B358((uint64_t)v16, &qword_10003C5F0);
    v57 = v102;
    static ContentShapeKinds.accessibility.getter(v56);
    v58 = (char *)v11 + *(int *)(v101 + 20);
    v59 = enum case for RoundedCornerStyle.continuous(_:);
    v60 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 104))(v58, v59, v60);
    __asm { FMOV            V0.2D, #13.0 }
    *v11 = _Q0;
    v66 = v103;
    v67 = (uint64_t)&v21[*(int *)(v103 + 36)];
    sub_100011234((uint64_t)v11, v67, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    v68 = sub_10000ADD4(&qword_10003C628);
    v69 = (uint64_t)v11;
    v70 = v47;
    v71 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 16);
    v72 = v104;
    v71(v67 + *(int *)(v68 + 40), v57, v104);
    *(_BYTE *)(v67 + *(int *)(v68 + 36)) = 0;
    sub_100013C7C((uint64_t)v19, (uint64_t)v21, &qword_10003C5F8);
    sub_100011538(v69, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v57, v72);
    v73 = sub_10000B358((uint64_t)v19, &qword_10003C5F8);
    v74 = v110;
    static AccessibilityChildBehavior.combine.getter(v73);
    v75 = sub_100011278();
    v76 = v105;
    View.accessibilityElement(children:)(v74, v66, v75);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v74, v112);
    sub_10000B358((uint64_t)v21, &qword_10003C600);
    v77 = String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
    v79 = v78;
    v118[0] = v77;
    v118[1] = v78;
    v117[0] = v66;
    v117[1] = v75;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v117, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    v81 = sub_100011380();
    v82 = (uint64_t)v99;
    v83 = v108;
    View.accessibilityLabel<A>(_:)(v118, v108, &type metadata for String, OpaqueTypeConformance2, v81);
    swift_bridgeObjectRelease(v79);
    (*(void (**)(char *, uint64_t))(v107 + 8))(v76, v83);
    v84 = v106;
    sub_100013CC0(v82, v106, &qword_10003C610);
    v85 = v109;
    sub_100013C7C(v84, v109, &qword_10003C610);
    sub_100013C7C(v85, (uint64_t)v34, &qword_10003C610);
    v86 = &v34[*(int *)(sub_10000ADD4(&qword_10003C658) + 48)];
    *(_QWORD *)v86 = 0;
    v86[8] = 1;
    v7 = v100;
    sub_10000B358(v84, &qword_10003C610);
    sub_10000B358(v85, &qword_10003C610);
    v87 = sub_10000ADD4(&qword_10003C660);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v34, 0, 1, v87);
    v39 = v116;
    v88 = sub_100013CC0((uint64_t)v34, v116, &qword_10003C618);
    if ((static MAGAXUtilities.isVoiceOverRunning.getter(v88) & 1) == 0)
      goto LABEL_3;
LABEL_11:
    *(_QWORD *)v7 = static HorizontalAlignment.center.getter();
    *((_QWORD *)v7 + 1) = 0;
    v7[16] = 1;
    v89 = sub_10000ADD4(&qword_10003C678);
    sub_10000FFC0(v113, (uint64_t)&v7[*(int *)(v89 + 44)]);
    v90 = sub_10000ADD4(&qword_10003C668);
    v42 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v7, 0, 1, v90);
    goto LABEL_12;
  }
  v38 = sub_10000ADD4(&qword_10003C660);
  v39 = v116;
  v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v116, 1, 1, v38);
  if ((static MAGAXUtilities.isVoiceOverRunning.getter(v40) & 1) != 0)
    goto LABEL_11;
LABEL_3:
  v41 = sub_10000ADD4(&qword_10003C668);
  v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v7, 1, 1, v41);
LABEL_12:
  v91 = AXDeviceHasJindo(v42);
  sub_100013C7C(v39, (uint64_t)v34, &qword_10003C618);
  v92 = v114;
  sub_100013C7C((uint64_t)v7, v114, &qword_10003C5E8);
  v93 = v115;
  sub_100013C7C((uint64_t)v34, v115, &qword_10003C618);
  v94 = (uint64_t)v7;
  v95 = sub_10000ADD4(&qword_10003C670);
  sub_100013C7C(v92, v93 + *(int *)(v95 + 48), &qword_10003C5E8);
  v96 = v93 + *(int *)(v95 + 64);
  *(_QWORD *)v96 = 0;
  *(_BYTE *)(v96 + 8) = v91 ^ 1;
  *(_BYTE *)(v96 + 9) = v91;
  sub_10000B358(v94, &qword_10003C5E8);
  sub_10000B358(v39, &qword_10003C618);
  sub_10000B358(v92, &qword_10003C5E8);
  return sub_10000B358((uint64_t)v34, &qword_10003C618);
}

uint64_t sub_10000F158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  _BYTE *v28;
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
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v65[12];
  int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  _BYTE v87[7];
  char v88;
  _BYTE v89[7];
  char v90;
  _BYTE v91[7];
  char v92;
  _BYTE v93[7];
  char v94;
  unsigned __int8 v95;
  _BYTE v96[7];
  char v97;
  _BYTE v98[7];
  _BYTE v99[7];
  _QWORD v100[2];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _OWORD v113[2];
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  char v128;
  _BYTE v129[7];
  uint64_t v130;
  char v131;
  _BYTE v132[7];
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  _BYTE v138[7];
  char v139;
  _BYTE v140[7];
  double v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;

  *(_QWORD *)&v86 = a1;
  v77 = a2;
  *((_QWORD *)&v86 + 1) = type metadata accessor for ColorScheme(0);
  v85 = *(_QWORD *)(*((_QWORD *)&v86 + 1) - 8);
  __chkstk_darwin(*((_QWORD *)&v86 + 1));
  v3 = &v65[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v4);
  v6 = &v65[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_10000ADD4(&qword_10003C6C8);
  __chkstk_darwin(v7);
  v9 = &v65[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v84 = sub_10000ADD4(&qword_10003C6D0);
  v10 = __chkstk_darwin(v84);
  v12 = &v65[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  v78 = &v65[-v13];
  v14 = (char *)v6 + *(int *)(v4 + 20);
  v15 = enum case for RoundedCornerStyle.continuous(_:);
  v16 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #13.0 }
  *v6 = _Q0;
  v22 = v86;
  sub_100012D30((uint64_t)v3);
  v23 = sub_10000F778((uint64_t)v3);
  (*(void (**)(_BYTE *, _QWORD))(v85 + 8))(v3, *((_QWORD *)&v86 + 1));
  sub_100011234((uint64_t)v6, (uint64_t)v9, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  *(_QWORD *)&v9[*(int *)(v7 + 52)] = v23;
  *(_WORD *)&v9[*(int *)(v7 + 56)] = 256;
  v24 = sub_100011538((uint64_t)v6, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
  v25 = static Color.black.getter(v24);
  v26 = (uint64_t)v12;
  sub_100013C7C((uint64_t)v9, (uint64_t)v12, &qword_10003C6C8);
  v27 = (uint64_t *)&v12[*(int *)(v84 + 36)];
  *v27 = v25;
  v27[1] = 0x4014000000000000;
  v27[2] = 0;
  v27[3] = 0;
  sub_10000B358((uint64_t)v9, &qword_10003C6C8);
  v28 = v78;
  v29 = sub_100013CC0((uint64_t)v12, (uint64_t)v78, &qword_10003C6D0);
  v80 = static VerticalAlignment.center.getter(v29);
  v30 = sub_10000F8E8(v22, (uint64_t)&v114);
  v31 = v115;
  v79 = v114;
  v32 = v117;
  v74 = v117;
  v75 = v115;
  v67 = v118;
  v68 = v116;
  LOBYTE(v3) = v120;
  v83 = v119;
  v84 = v121;
  v85 = v124;
  v86 = v125;
  v81 = v126;
  v70 = v123;
  v71 = v127;
  v94 = 1;
  v92 = v120;
  v90 = v122;
  v88 = v126;
  LOBYTE(v25) = v122;
  v72 = v120;
  v73 = v122;
  v69 = static Edge.Set.vertical.getter(v30);
  v33 = EdgeInsets.init(_all:)(12.0);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v95 = 0;
  v82 = static Edge.Set.horizontal.getter();
  v40 = EdgeInsets.init(_all:)(12.0);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v66 = v95;
  v97 = 0;
  v76 = v26;
  sub_100013C7C((uint64_t)v28, v26, &qword_10003C6D0);
  LOBYTE(v22) = v97;
  v47 = v77;
  sub_100013C7C(v26, v77, &qword_10003C6D0);
  v48 = (_OWORD *)(v47 + *(int *)(sub_10000ADD4(&qword_10003C6D8) + 48));
  v100[0] = v80;
  v100[1] = 0;
  LOBYTE(v101) = 1;
  *(_DWORD *)((char *)&v101 + 1) = *(_DWORD *)v93;
  DWORD1(v101) = *(_DWORD *)&v93[3];
  *((_QWORD *)&v101 + 1) = v79;
  *(_QWORD *)&v102 = v31;
  v49 = v68;
  *((_QWORD *)&v102 + 1) = v68;
  *(_QWORD *)&v103 = v32;
  v50 = v67;
  *((_QWORD *)&v103 + 1) = v67;
  *(_QWORD *)&v104 = v83;
  BYTE8(v104) = (_BYTE)v3;
  *(_DWORD *)((char *)&v104 + 9) = *(_DWORD *)v91;
  HIDWORD(v104) = *(_DWORD *)&v91[3];
  *(_QWORD *)&v105 = v84;
  BYTE8(v105) = v25;
  *(_DWORD *)((char *)&v105 + 9) = *(_DWORD *)v89;
  HIDWORD(v105) = *(_DWORD *)&v89[3];
  v52 = v70;
  v51 = v71;
  *(_QWORD *)&v106 = v70;
  *((_QWORD *)&v106 + 1) = v85;
  v107 = v86;
  LOBYTE(v108) = v81;
  *(_DWORD *)((char *)&v108 + 1) = *(_DWORD *)v87;
  DWORD1(v108) = *(_DWORD *)&v87[3];
  *((_QWORD *)&v108 + 1) = v71;
  LOBYTE(v25) = v69;
  LOBYTE(v109) = v69;
  DWORD1(v109) = *(_DWORD *)&v96[3];
  *(_DWORD *)((char *)&v109 + 1) = *(_DWORD *)v96;
  *((double *)&v109 + 1) = v33;
  *(_QWORD *)&v110 = v35;
  *((_QWORD *)&v110 + 1) = v37;
  *(_QWORD *)&v111 = v39;
  LOBYTE(v3) = v66;
  BYTE8(v111) = v66;
  HIDWORD(v111) = *(_DWORD *)&v99[3];
  *(_DWORD *)((char *)&v111 + 9) = *(_DWORD *)v99;
  LOBYTE(v112) = v82;
  DWORD1(v112) = *(_DWORD *)&v98[3];
  *(_DWORD *)((char *)&v112 + 1) = *(_DWORD *)v98;
  *((double *)&v112 + 1) = v40;
  *(_QWORD *)&v113[0] = v42;
  *((_QWORD *)&v113[0] + 1) = v44;
  *(_QWORD *)&v113[1] = v46;
  BYTE8(v113[1]) = v22;
  v53 = v101;
  *v48 = (unint64_t)v80;
  v48[1] = v53;
  v54 = v102;
  v55 = v103;
  v56 = v105;
  v57 = v106;
  v48[4] = v104;
  v48[5] = v56;
  v48[2] = v54;
  v48[3] = v55;
  v58 = v107;
  v59 = v109;
  v60 = v110;
  v48[8] = v108;
  v48[9] = v59;
  v48[6] = v57;
  v48[7] = v58;
  v61 = v111;
  v62 = v112;
  *(_OWORD *)((char *)v48 + 217) = *(_OWORD *)((char *)v113 + 9);
  v63 = v113[0];
  v48[12] = v62;
  v48[13] = v63;
  v48[10] = v60;
  v48[11] = v61;
  sub_100012F70((uint64_t)v100);
  sub_10000B358((uint64_t)v78, &qword_10003C6D0);
  v114 = v80;
  v115 = 0;
  LOBYTE(v116) = 1;
  *(_DWORD *)((char *)&v116 + 1) = *(_DWORD *)v93;
  HIDWORD(v116) = *(_DWORD *)&v93[3];
  v117 = v79;
  v118 = v75;
  v119 = v49;
  v120 = v74;
  v121 = v50;
  v122 = v83;
  LOBYTE(v123) = v72;
  *(_DWORD *)((char *)&v123 + 1) = *(_DWORD *)v91;
  HIDWORD(v123) = *(_DWORD *)&v91[3];
  v124 = v84;
  LOBYTE(v125) = v73;
  *(_DWORD *)((char *)&v125 + 1) = *(_DWORD *)v89;
  DWORD1(v125) = *(_DWORD *)&v89[3];
  *((_QWORD *)&v125 + 1) = v52;
  v126 = v85;
  v127 = v86;
  v128 = v81;
  *(_DWORD *)v129 = *(_DWORD *)v87;
  *(_DWORD *)&v129[3] = *(_DWORD *)&v87[3];
  v130 = v51;
  v131 = v25;
  *(_DWORD *)&v132[3] = *(_DWORD *)&v96[3];
  *(_DWORD *)v132 = *(_DWORD *)v96;
  v133 = v33;
  v134 = v35;
  v135 = v37;
  v136 = v39;
  v137 = (char)v3;
  *(_DWORD *)&v138[3] = *(_DWORD *)&v99[3];
  *(_DWORD *)v138 = *(_DWORD *)v99;
  v139 = v82;
  *(_DWORD *)&v140[3] = *(_DWORD *)&v98[3];
  *(_DWORD *)v140 = *(_DWORD *)v98;
  v141 = v40;
  v142 = v42;
  v143 = v44;
  v144 = v46;
  v145 = v22;
  sub_100013014((uint64_t)&v114);
  return sub_10000B358(v76, &qword_10003C6D0);
}

uint64_t sub_10000F778(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v16;
  uint64_t v17;

  v2 = type metadata accessor for Color.RGBColorSpace(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == enum case for ColorScheme.light(_:))
  {
    v17 = static Color.white.getter();
    v11 = sub_100013158();
    return Color.init<A>(_:)(&v17, &type metadata for Color, v11, &protocol witness table for Color);
  }
  else
  {
    v13 = v10;
    v14 = enum case for ColorScheme.dark(_:);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Color.RGBColorSpace.sRGB(_:), v2);
    v12 = Color.init(_:white:opacity:)(v5, 0.25, 1.0);
    if (v13 != v14)
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v12;
}

uint64_t sub_10000F8E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t (*v21)(char *, uint64_t);
  int v22;
  void (*v23)(_QWORD);
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(_QWORD);
  double v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  void (*v50)(uint64_t, uint64_t);
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  unsigned int v89;
  void (*v90)(char *, _QWORD, uint64_t);
  int v91;
  uint64_t (*v92)(char *, uint64_t);
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t KeyPath;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  _QWORD v104[2];
  uint64_t v105;
  unsigned __int8 v106;
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  uint64_t v110;

  v4 = sub_10000ADD4(&qword_10003C6E0);
  __chkstk_darwin(v4);
  v103 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Color.RGBColorSpace(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ColorScheme(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v101 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v102 = (uint64_t)&v79 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v79 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v79 - v19;
  v100 = Image.init(_internalSystemName:)(0xD000000000000014, 0x8000000100030D60);
  v93 = a1;
  sub_100012D30((uint64_t)v20);
  v94 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v94(v18, v20, v10);
  v21 = *(uint64_t (**)(char *, uint64_t))(v11 + 88);
  KeyPath = v10;
  v92 = v21;
  v22 = v21(v18, v10);
  v91 = enum case for ColorScheme.light(_:);
  v97 = v6;
  if (v22 == enum case for ColorScheme.light(_:))
  {
    v23 = *(void (**)(_QWORD))(v7 + 104);
    v89 = enum case for Color.RGBColorSpace.sRGB(_:);
    v90 = (void (*)(char *, _QWORD, uint64_t))v23;
    v23(v9);
    v99 = Color.init(_:white:opacity:)(v9, 0.45, 1.0);
    v24 = KeyPath;
  }
  else
  {
    v25 = v22;
    v26 = enum case for ColorScheme.dark(_:);
    v27 = *(void (**)(_QWORD))(v7 + 104);
    v89 = enum case for Color.RGBColorSpace.sRGB(_:);
    v90 = (void (*)(char *, _QWORD, uint64_t))v27;
    v27(v9);
    v99 = Color.init(_:white:opacity:)(v9, 0.65, 1.0);
    v24 = KeyPath;
    if (v25 != v26)
      (*(void (**)(char *, uint64_t))(v11 + 8))(v18, KeyPath);
  }
  v80 = *(void (**)(char *, uint64_t))(v11 + 8);
  v80(v20, v24);
  KeyPath = swift_getKeyPath(&unk_10002B020);
  v28 = ((double (*)(void))static Font.Weight.medium.getter)();
  v29 = type metadata accessor for Font.Design(0);
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56);
  v31 = (uint64_t)v103;
  v88 = v29;
  v87 = v30;
  ((void (*)(char *, uint64_t, uint64_t))v30)(v103, 1, 1);
  v96 = static Font.system(size:weight:design:)(*(_QWORD *)&v28, 0, v31, 16.0);
  sub_10000B358(v31, &qword_10003C6E0);
  v95 = swift_getKeyPath(&unk_10002B050);
  if (AXDeviceIsPad())
    v32 = 0x4030AAAAAAAAAAABLL;
  else
    v32 = 0x402E000000000000;
  v33 = static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)(&v105, 0, 1, v32, 0, v33, v34);
  v86 = v105;
  v85 = v106;
  v84 = v107;
  v83 = v108;
  v81 = v109;
  v82 = v110;
  v104[0] = String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
  v104[1] = v35;
  v36 = sub_100011380();
  v37 = Text.init<A>(_:)(v104, &type metadata for String, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = v102;
  sub_100012D30(v102);
  v45 = v101;
  v94(v101, (char *)v44, v24);
  v46 = v92(v45, v24);
  if (v46 == v91)
  {
    v90(v9, v89, v97);
    v47 = Color.init(_:white:opacity:)(v9, 0.45, 1.0);
  }
  else
  {
    v48 = v46;
    v49 = enum case for ColorScheme.dark(_:);
    v90(v9, v89, v97);
    v47 = Color.init(_:white:opacity:)(v9, 0.65, 1.0);
    if (v48 != v49)
    {
      v50 = (void (*)(uint64_t, uint64_t))v80;
      v80(v101, v24);
      goto LABEL_13;
    }
  }
  v50 = (void (*)(uint64_t, uint64_t))v80;
LABEL_13:
  v51 = v41 & 1;
  v50(v102, v24);
  v52 = Text.foregroundColor(_:)(v47, v37, v39, v41 & 1, v43);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  swift_release(v47);
  v59 = v56 & 1;
  sub_1000130A8(v37, v39, v51);
  v60 = swift_bridgeObjectRelease(v43);
  v61 = static Font.Weight.medium.getter(v60);
  v62 = (uint64_t)v103;
  v87(v103, 1, 1, v88);
  v63 = static Font.system(size:weight:design:)(*(_QWORD *)&v61, 0, v62, 16.0);
  sub_10000B358(v62, &qword_10003C6E0);
  v64 = Text.font(_:)(v63, v52, v54, v59, v58);
  v66 = v65;
  v68 = v67;
  v70 = v69;
  swift_release(v63);
  LOBYTE(v63) = v68 & 1;
  sub_1000130A8(v52, v54, v59);
  swift_bridgeObjectRelease(v58);
  v72 = v99;
  v71 = v100;
  v73 = KeyPath;
  *(_QWORD *)a2 = v100;
  *(_QWORD *)(a2 + 8) = v73;
  v75 = v95;
  v74 = v96;
  *(_QWORD *)(a2 + 16) = v72;
  *(_QWORD *)(a2 + 24) = v75;
  v76 = v86;
  *(_QWORD *)(a2 + 32) = v74;
  *(_QWORD *)(a2 + 40) = v76;
  *(_BYTE *)(a2 + 48) = v85;
  *(_QWORD *)(a2 + 56) = v84;
  *(_BYTE *)(a2 + 64) = v83;
  v77 = v82;
  *(_QWORD *)(a2 + 72) = v81;
  *(_QWORD *)(a2 + 80) = v77;
  *(_QWORD *)(a2 + 88) = v64;
  *(_QWORD *)(a2 + 96) = v66;
  *(_BYTE *)(a2 + 104) = v63;
  *(_QWORD *)(a2 + 112) = v70;
  swift_retain(v71);
  swift_retain(v73);
  swift_retain(v72);
  swift_retain(v75);
  swift_retain(v74);
  sub_100013004(v64, v66, v63);
  swift_bridgeObjectRetain(v70);
  sub_1000130A8(v64, v66, v63);
  swift_release(v74);
  swift_release(v75);
  swift_release(v72);
  swift_release(v73);
  swift_release(v71);
  return swift_bridgeObjectRelease(v70);
}

uint64_t sub_10000FFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;

  v4 = sub_10000ADD4(&qword_10003C680);
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000ADD4(&qword_10003C688);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v26 - v12;
  *(_QWORD *)v6 = static VerticalAlignment.center.getter(v11);
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v14 = sub_10000ADD4(&qword_10003C690);
  v15 = sub_10001018C(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = static Edge.Set.all.getter(v15);
  v16 = EdgeInsets.init(_all:)(10.0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_100013C7C((uint64_t)v6, (uint64_t)v10, &qword_10003C680);
  v23 = &v10[*(int *)(v7 + 36)];
  *v23 = a1;
  *((double *)v23 + 1) = v16;
  *((_QWORD *)v23 + 2) = v18;
  *((_QWORD *)v23 + 3) = v20;
  *((_QWORD *)v23 + 4) = v22;
  v23[40] = 0;
  sub_10000B358((uint64_t)v6, &qword_10003C680);
  sub_100013CC0((uint64_t)v10, (uint64_t)v13, &qword_10003C688);
  sub_100013C7C((uint64_t)v13, (uint64_t)v10, &qword_10003C688);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v24 = sub_10000ADD4(&qword_10003C698);
  sub_100013C7C((uint64_t)v10, a2 + *(int *)(v24 + 48), &qword_10003C688);
  sub_10000B358((uint64_t)v13, &qword_10003C688);
  return sub_10000B358((uint64_t)v10, &qword_10003C688);
}

uint64_t sub_10001018C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int *v84;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v93 = a2;
  v3 = sub_10000ADD4(&qword_10003C6A0);
  v4 = __chkstk_darwin(v3);
  v98 = (uint64_t)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v103 = (uint64_t)&v86 - v6;
  v7 = type metadata accessor for MAGAngelRootView(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DetectionButton(0);
  v12 = __chkstk_darwin(v11);
  v89 = (uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v97 = (uint64_t)&v86 - v15;
  v16 = __chkstk_darwin(v14);
  v95 = (uint64_t)&v86 - v17;
  v18 = __chkstk_darwin(v16);
  v105 = (uint64_t)&v86 - v19;
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v86 - v21;
  v23 = __chkstk_darwin(v20);
  v96 = (char *)&v86 - v24;
  __chkstk_darwin(v23);
  v26 = (char *)&v86 - v25;
  v106 = a1;
  sub_100011234(a1, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
  v27 = *(unsigned __int8 *)(v8 + 80);
  v28 = (v27 + 16) & ~v27;
  v29 = v28 + v9;
  v104 = v27 | 7;
  v30 = swift_allocObject(&unk_100035B00, v28 + v9, v27 | 7);
  v31 = v28;
  sub_100013934((uint64_t)v10, v30 + v28, type metadata accessor for MAGAngelRootView);
  v32 = &v26[*(int *)(v11 + 28)];
  v33 = enum case for Control.imageCaption(_:);
  v34 = type metadata accessor for Control(0);
  v101 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v34 - 8) + 104);
  v102 = v34;
  v101(v32, v33);
  v91 = (unint64_t)"control.name.detectionMode";
  *(_QWORD *)v26 = String.localized.getter(0xD000000000000017, 0x8000000100030D20);
  *((_QWORD *)v26 + 1) = v35;
  v90 = (unint64_t)"control.button.on.value";
  *((_QWORD *)v26 + 2) = String.localized.getter(0xD000000000000018, 0x8000000100030D40);
  *((_QWORD *)v26 + 3) = v36;
  *((_QWORD *)v26 + 4) = sub_10001152C;
  *((_QWORD *)v26 + 5) = v30;
  v92 = v26;
  v26[48] = 0;
  v37 = static Detection.isLidarAvailable.getter();
  v99 = v11;
  v100 = v29;
  v94 = v28;
  if ((v37 & 1) != 0)
  {
    sub_100011234(v106, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
    v38 = swift_allocObject(&unk_100035B78, v29, v104);
    sub_100013934((uint64_t)v10, v38 + v28, type metadata accessor for MAGAngelRootView);
    v39 = (uint64_t)v96;
    v40 = &v96[*(int *)(v11 + 28)];
    v41 = v102;
    v86 = 0x8000000100030D20;
    v88 = 0xD000000000000018;
    ((void (*)(char *, _QWORD, uint64_t))v101)(v40, enum case for Control.peopleDetection(_:), v102);
    *(_QWORD *)v39 = String.localized.getter(0xD000000000000017, 0x8000000100030D20);
    *(_QWORD *)(v39 + 8) = v42;
    v87 = 0x8000000100030D40;
    *(_QWORD *)(v39 + 16) = String.localized.getter(0xD000000000000018, 0x8000000100030D40);
    *(_QWORD *)(v39 + 24) = v43;
    *(_QWORD *)(v39 + 32) = sub_10001152C;
    *(_QWORD *)(v39 + 40) = v38;
    *(_BYTE *)(v39 + 48) = 0;
    sub_100011234(v106, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
    v44 = v100;
    v45 = swift_allocObject(&unk_100035BA0, v100, v104);
    sub_100013934((uint64_t)v10, v45 + v31, type metadata accessor for MAGAngelRootView);
    v46 = v41;
    v47 = v101;
    ((void (*)(char *, _QWORD, uint64_t))v101)(&v22[*(int *)(v11 + 28)], enum case for Control.doorDetection(_:), v46);
    v48 = v86;
    *(_QWORD *)v22 = String.localized.getter(0xD000000000000017, v86);
    *((_QWORD *)v22 + 1) = v49;
    *((_QWORD *)v22 + 2) = String.localized.getter(v88, 0x8000000100030D40);
    *((_QWORD *)v22 + 3) = v50;
    *((_QWORD *)v22 + 4) = sub_10001152C;
    *((_QWORD *)v22 + 5) = v45;
    v22[48] = 0;
    sub_100011234(v106, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
    v51 = swift_allocObject(&unk_100035BC8, v44, v104);
    sub_100013934((uint64_t)v10, v51 + v31, type metadata accessor for MAGAngelRootView);
    v52 = v105;
    ((void (*)(uint64_t, _QWORD, uint64_t))v47)(v105 + *(int *)(v11 + 28), enum case for Control.objectUnderstanding(_:), v102);
    *(_QWORD *)v52 = String.localized.getter(0xD000000000000017, v48);
    *(_QWORD *)(v52 + 8) = v53;
    *(_QWORD *)(v52 + 16) = String.localized.getter(v88, v87);
    *(_QWORD *)(v52 + 24) = v54;
    *(_QWORD *)(v52 + 32) = sub_10001152C;
    *(_QWORD *)(v52 + 40) = v51;
    *(_BYTE *)(v52 + 48) = 0;
    v55 = v95;
    sub_100011234(v39, v95, type metadata accessor for DetectionButton);
    v56 = v97;
    sub_100011234((uint64_t)v22, v97, type metadata accessor for DetectionButton);
    v57 = v89;
    sub_100011234(v52, v89, type metadata accessor for DetectionButton);
    v58 = v98;
    sub_100011234(v55, v98, type metadata accessor for DetectionButton);
    v59 = sub_10000ADD4(&qword_10003C6B8);
    sub_100011234(v56, v58 + *(int *)(v59 + 48), type metadata accessor for DetectionButton);
    sub_100011234(v57, v58 + *(int *)(v59 + 64), type metadata accessor for DetectionButton);
    sub_100011538(v52, type metadata accessor for DetectionButton);
    sub_100011538((uint64_t)v22, type metadata accessor for DetectionButton);
    sub_100011538(v39, type metadata accessor for DetectionButton);
    sub_100011538(v57, type metadata accessor for DetectionButton);
    v60 = v56;
    v29 = v100;
    sub_100011538(v60, type metadata accessor for DetectionButton);
    sub_100011538(v55, type metadata accessor for DetectionButton);
    v61 = sub_10000ADD4(&qword_10003C6A8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v58, 0, 1, v61);
    sub_100013CC0(v58, v103, &qword_10003C6A0);
    v62 = v22;
    v31 = v94;
  }
  else
  {
    v63 = sub_10000ADD4(&qword_10003C6A8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v103, 1, 1, v63);
    v62 = v22;
  }
  v64 = v106;
  sub_100011234(v106, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
  v65 = v104;
  v66 = swift_allocObject(&unk_100035B28, v29, v104);
  sub_100013934((uint64_t)v10, v66 + v31, type metadata accessor for MAGAngelRootView);
  v67 = (uint64_t)v96;
  v68 = v101;
  v69 = v102;
  ((void (*)(char *, _QWORD, uint64_t))v101)(&v96[*(int *)(v99 + 28)], enum case for Control.textDetection(_:), v102);
  v91 |= 0x8000000000000000;
  *(_QWORD *)v67 = String.localized.getter(0xD000000000000017, v91);
  *(_QWORD *)(v67 + 8) = v70;
  v71 = v90 | 0x8000000000000000;
  *(_QWORD *)(v67 + 16) = String.localized.getter(0xD000000000000018, v90 | 0x8000000000000000);
  *(_QWORD *)(v67 + 24) = v72;
  *(_QWORD *)(v67 + 32) = sub_10001152C;
  *(_QWORD *)(v67 + 40) = v66;
  *(_BYTE *)(v67 + 48) = 0;
  sub_100011234(v64, (uint64_t)v10, type metadata accessor for MAGAngelRootView);
  v73 = swift_allocObject(&unk_100035B50, v100, v65);
  sub_100013934((uint64_t)v10, v73 + v94, type metadata accessor for MAGAngelRootView);
  ((void (*)(char *, _QWORD, uint64_t))v68)(&v62[*(int *)(v99 + 28)], enum case for Control.pointSpeak(_:), v69);
  *(_QWORD *)v62 = String.localized.getter(0xD000000000000017, v91);
  *((_QWORD *)v62 + 1) = v74;
  *((_QWORD *)v62 + 2) = String.localized.getter(0xD000000000000018, v71);
  *((_QWORD *)v62 + 3) = v75;
  *((_QWORD *)v62 + 4) = sub_10001152C;
  *((_QWORD *)v62 + 5) = v73;
  v62[48] = 0;
  v76 = (uint64_t)v62;
  v77 = (uint64_t)v92;
  v78 = v105;
  sub_100011234((uint64_t)v92, v105, type metadata accessor for DetectionButton);
  v79 = v103;
  v80 = v98;
  sub_100013C7C(v103, v98, &qword_10003C6A0);
  v81 = v95;
  sub_100011234(v67, v95, type metadata accessor for DetectionButton);
  v82 = v97;
  sub_100011234(v76, v97, type metadata accessor for DetectionButton);
  v83 = v93;
  sub_100011234(v78, v93, type metadata accessor for DetectionButton);
  v84 = (int *)sub_10000ADD4(&qword_10003C6B0);
  sub_100013C7C(v80, v83 + v84[12], &qword_10003C6A0);
  sub_100011234(v81, v83 + v84[16], type metadata accessor for DetectionButton);
  sub_100011234(v82, v83 + v84[20], type metadata accessor for DetectionButton);
  sub_100011538(v76, type metadata accessor for DetectionButton);
  sub_100011538(v67, type metadata accessor for DetectionButton);
  sub_10000B358(v79, &qword_10003C6A0);
  sub_100011538(v77, type metadata accessor for DetectionButton);
  sub_100011538(v82, type metadata accessor for DetectionButton);
  sub_100011538(v81, type metadata accessor for DetectionButton);
  sub_10000B358(v80, &qword_10003C6A0);
  return sub_100011538(v105, type metadata accessor for DetectionButton);
}

uint64_t sub_100010A18(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (uint64_t *)(a1 + *(int *)(type metadata accessor for MAGAngelRootView(0) + 20));
  v2 = *v1;
  v3 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  v5 = type metadata accessor for MAGAngelPreferences(0);
  v6 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
  return StateObject.wrappedValue.getter(v2, v3, v4, v5, v6);
}

__n128 sub_100010A90@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
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
  sub_100013C7C(v16, a9, &qword_10003C558);
  v35 = a9 + *(int *)(sub_10000ADD4(&qword_10003C560) + 36);
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

uint64_t sub_100010C4C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int16 a18)
{
  __int16 v19;
  uint64_t v20;
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
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _OWORD v49[7];

  v19 = a18;
  v20 = a16;
  v22 = a14;
  v21 = a15;
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
    v47 = a5;
    v48 = a7;
    v45 = a1;
    v46 = a3;
    v44 = v25;
    v37 = static os_log_type_t.fault.getter();
    v38 = (void *)static Log.runtimeIssuesLog.getter();
    v39 = v37;
    v20 = a16;
    os_log(_:dso:log:_:_:)(v39, &_mh_execute_header, v38, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v22 = a14;
    v21 = a15;
    v25 = v44;
    v24 = a10;
    v23 = a12;
    a1 = v45;
    a3 = v46;
    a5 = v47;
    a7 = v48;
    v19 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v49, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  v40 = v49[2];
  *(_OWORD *)(a9 + 72) = v49[3];
  v41 = v49[5];
  *(_OWORD *)(a9 + 88) = v49[4];
  *(_OWORD *)(a9 + 104) = v41;
  *(_OWORD *)(a9 + 120) = v49[6];
  v42 = v49[1];
  *(_OWORD *)(a9 + 24) = v49[0];
  *(_OWORD *)(a9 + 40) = v42;
  *(_QWORD *)a9 = v20;
  *(_QWORD *)(a9 + 8) = a17;
  *(_BYTE *)(a9 + 16) = v19 & 1;
  *(_BYTE *)(a9 + 17) = HIBYTE(v19) & 1;
  *(_OWORD *)(a9 + 56) = v40;
  return swift_retain(v20);
}

uint64_t sub_100010E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 24) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_100010E8C, v3, v4);
}

uint64_t sub_100010E8C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release(*(_QWORD *)(v0 + 24));
  type metadata accessor for MAGAngelRootView(0);
  *(_BYTE *)(v0 + 32) = 1;
  v1 = sub_10000ADD4(&qword_10003C4A0);
  AccessibilityFocusState.wrappedValue.setter(v0 + 32, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;
  char v7;

  v0 = sub_10000ADD4(&qword_10003C5E0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BE58 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v7 = 2;
  v4 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_100010FD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C588;
  if (!qword_10003C588)
  {
    v1 = sub_10000B24C(&qword_10003C568);
    sub_1000139C0(&qword_10003C590, &qword_10003C560, (void (*)(void))sub_100011074);
    sub_100013C3C(&qword_10003C5B0, &qword_10003C5B8, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C588);
  }
  return result;
}

unint64_t sub_100011074()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C598;
  if (!qword_10003C598)
  {
    v1 = sub_10000B24C(&qword_10003C558);
    sub_100013C3C(&qword_10003C5A0, &qword_10003C5A8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C598);
  }
  return result;
}

uint64_t sub_1000110F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MAGAngelRootView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc(dword_10003C5C4);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_10000B030;
  return sub_100010E20(v3);
}

unint64_t sub_100011158()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  unint64_t v5;

  result = qword_10003C5D0;
  if (!qword_10003C5D0)
  {
    v1 = sub_10000B24C(&qword_10003C580);
    v2 = sub_10000B24C(&qword_10003C570);
    v4 = sub_10000B24C(&qword_10003C568);
    v5 = sub_100010FD0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.allowsSecureDrawing()>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.accessibilityFocused(_:)>>, 1);
    sub_100005CB0(&qword_10003C5D8, (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier, (uint64_t)&protocol conformance descriptor for _TaskModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C5D0);
  }
  return result;
}

uint64_t sub_100011234(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100011278()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C630;
  if (!qword_10003C630)
  {
    v1 = sub_10000B24C(&qword_10003C600);
    sub_1000112FC();
    sub_100013C3C(&qword_10003C648, &qword_10003C628, (uint64_t)&protocol conformance descriptor for _ContentShapeKindModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C630);
  }
  return result;
}

unint64_t sub_1000112FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C638;
  if (!qword_10003C638)
  {
    v1 = sub_10000B24C(&qword_10003C5F8);
    sub_100013C3C(&qword_10003C640, &qword_10003C5F0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C638);
  }
  return result;
}

unint64_t sub_100011380()
{
  unint64_t result;

  result = qword_10003C650;
  if (!qword_10003C650)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10003C650);
  }
  return result;
}

uint64_t type metadata accessor for DetectionButton(uint64_t a1)
{
  return sub_1000113D8(a1, qword_10003C748, (uint64_t)&nominal type descriptor for DetectionButton);
}

uint64_t sub_1000113D8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100011410()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for MAGAngelRootView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_10000ADD4(&qword_10003C340);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  sub_10000DA64(*(_QWORD *)((char *)v6 + *(int *)(v1 + 20)), *(_QWORD *)((char *)v6 + *(int *)(v1 + 20) + 8));
  v9 = (char *)v6 + *(int *)(v1 + 24);
  v10 = type metadata accessor for AccessibilityTechnologies(0);
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  v12 = sub_10000ADD4(&qword_10003C4A0);
  swift_release(*(_QWORD *)&v9[*(int *)(v12 + 40)]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100011538(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100011580()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MAGAngelRootView(0) - 8) + 80);
  return sub_100010A18(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_1000115B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t KeyPath;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  v2 = v1;
  v98 = a1;
  v3 = type metadata accessor for ButtonBorderShape(0);
  v87 = *(_QWORD *)(v3 - 8);
  v88 = v3;
  __chkstk_darwin(v3);
  v86 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for BorderedProminentButtonStyle(0);
  v83 = *(_QWORD *)(v5 - 8);
  v84 = v5;
  __chkstk_darwin(v5);
  v80 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = type metadata accessor for DetectionButton(0);
  v7 = *(_QWORD *)(v97 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v97);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_10000ADD4(&qword_10003C7F8);
  v78 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10000ADD4(&qword_10003C800);
  v81 = *(_QWORD *)(v12 - 8);
  v82 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_10000ADD4(&qword_10003C808);
  __chkstk_darwin(v77);
  v16 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_10000ADD4(&qword_10003C810);
  __chkstk_darwin(v85);
  v89 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_10000ADD4(&qword_10003C818);
  __chkstk_darwin(v90);
  v91 = (uint64_t)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_10000ADD4(&qword_10003C820);
  v19 = __chkstk_darwin(v94);
  v95 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v96 = (char *)&v76 - v21;
  v92 = sub_10000ADD4(&qword_10003C828);
  __chkstk_darwin(v92);
  v93 = (uint64_t)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BE58 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v23 = qword_10003EAA8;
  sub_100011234(v2, (uint64_t)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for DetectionButton);
  v24 = *(unsigned __int8 *)(v7 + 80);
  v25 = (v24 + 16) & ~v24;
  v26 = (v8 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = swift_allocObject(&unk_100035C10, v26 + 8, v24 | 7);
  v28 = sub_100013934((uint64_t)v9, v27 + v25, type metadata accessor for DetectionButton);
  *(_QWORD *)(v27 + v26) = v23;
  v29 = v2;
  __chkstk_darwin(v28);
  *(&v76 - 2) = v2;
  swift_retain(v23);
  v30 = sub_10000ADD4(&qword_10003C830);
  v31 = sub_1000139C0(&qword_10003C838, &qword_10003C830, (void (*)(void))sub_100013A28);
  v32 = Button.init(action:label:)(sub_100013978, v27, sub_1000139B8, &v76 - 4, v30, v31);
  v33 = v80;
  BorderedProminentButtonStyle.init()(v32);
  v34 = sub_100013C3C(&qword_10003C860, &qword_10003C7F8, (uint64_t)&protocol conformance descriptor for Button<A>);
  v35 = sub_100005CB0(&qword_10003C7E0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v36 = v79;
  v37 = v84;
  View.buttonStyle<A>(_:)(v33, v79, v84, v34, v35);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v33, v37);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v11, v36);
  v39 = v86;
  static ButtonBorderShape.circle.getter(v38);
  KeyPath = swift_getKeyPath(&unk_10002B160);
  v41 = (uint64_t *)&v16[*(int *)(v77 + 36)];
  v42 = sub_10000ADD4(&qword_10003C7E8);
  v44 = v87;
  v43 = v88;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))((char *)v41 + *(int *)(v42 + 28), v39, v88);
  *v41 = KeyPath;
  v46 = v81;
  v45 = v82;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v16, v14, v82);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v43);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v45);
  v47 = sub_100012188();
  if ((v47 & 1) != 0)
  {
    v48 = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");
    v49 = Color.init(_:)(v48);
  }
  else
  {
    v49 = static Color.black.getter(v47);
  }
  v50 = v49;
  v51 = (uint64_t)v89;
  v52 = swift_getKeyPath(&unk_10002B190);
  v99 = v50;
  swift_retain(v50);
  v53 = AnyShapeStyle.init<A>(_:)(&v99, &type metadata for Color, &protocol witness table for Color);
  sub_100013C7C((uint64_t)v16, v51, &qword_10003C808);
  swift_release(v50);
  v54 = (uint64_t *)(v51 + *(int *)(v85 + 36));
  *v54 = v52;
  v54[1] = v53;
  sub_10000B358((uint64_t)v16, &qword_10003C808);
  v55 = sub_100012188();
  if ((v55 & 1) != 0)
  {
    v56 = static Color.black.getter(v55);
  }
  else
  {
    v57 = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");
    v56 = Color.init(_:)(v57);
  }
  v58 = v56;
  v59 = v91;
  sub_100013C7C(v51, v91, &qword_10003C810);
  v60 = v90;
  *(_QWORD *)(v59 + *(int *)(v90 + 36)) = v58;
  v61 = sub_10000B358(v51, &qword_10003C810);
  v62 = Control.accessibilityLabel.getter(v61);
  v64 = v63;
  v99 = v62;
  v100 = v63;
  v65 = sub_100013B14();
  v66 = sub_100011380();
  v67 = (uint64_t)v95;
  View.accessibilityLabel<A>(_:)(&v99, v60, &type metadata for String, v65, v66);
  swift_bridgeObjectRelease(v64);
  sub_10000B358(v59, &qword_10003C818);
  v68 = sub_100012188();
  v69 = 24;
  if ((v68 & 1) != 0)
    v69 = 8;
  v70 = 16;
  if ((v68 & 1) != 0)
    v70 = 0;
  v71 = *(_QWORD *)(v29 + v69);
  v72 = *(_QWORD *)(v29 + v70);
  swift_bridgeObjectRetain(v71);
  v99 = v72;
  v100 = v71;
  v73 = (uint64_t)v96;
  ModifiedContent<>.accessibilityValue<A>(_:)(&v99, v94, &type metadata for String, v66);
  swift_bridgeObjectRelease(v71);
  sub_10000B358(v67, &qword_10003C820);
  v74 = v93;
  sub_100013C7C(v73, v93, &qword_10003C820);
  *(_BYTE *)(v74 + *(int *)(v92 + 36)) = 1;
  sub_10000B358(v73, &qword_10003C820);
  return sub_100013CC0(v74, v98, &qword_10003C828);
}

uint64_t sub_100011D14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  _BYTE v16[9];
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for Control(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for DetectionButton(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a1 + *(int *)(v10 + 28), v6);
  v11 = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 88))(v9, v6);
  if (v11 == enum case for Control.peopleDetection(_:))
  {
    v18 = 6;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v18;
  }
  else if (v11 == enum case for Control.doorDetection(_:))
  {
    v19 = 7;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v19;
  }
  else if (v11 == enum case for Control.objectUnderstanding(_:))
  {
    v20 = 5;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v20;
  }
  else if (v11 == enum case for Control.imageCaption(_:))
  {
    v17 = 8;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v17;
  }
  else if (v11 == enum case for Control.pointSpeak(_:))
  {
    v22 = 9;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v22;
  }
  else
  {
    if (v11 != enum case for Control.textDetection(_:))
    {
      v23 = 1;
      v15 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
      AsyncStream.Continuation.yield(_:)(&v23, v15);
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
    }
    v21 = 4;
    v12 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
    v13 = &v21;
  }
  AsyncStream.Continuation.yield(_:)(v13, v12);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_100011FD0(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _BYTE v24[7];
  _OWORD v25[8];
  uint64_t v26;

  v2 = type metadata accessor for Image.ResizingMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DetectionButton(0);
  v6 = Control.angelIconName.getter();
  v8 = Image.init(_internalSystemName:)(v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  v9 = Image.resizable(capInsets:resizingMode:)(v5, v8, 0.0, 0.0, 0.0, 0.0);
  swift_release(v8);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = static Alignment.center.getter(v10);
  sub_100010C4C(0.0, 1, 0.0, 1, 35.0, 0, 0.0, 1, (uint64_t)v25, 0.0, 1, 35.0, 0, v11, v12, v9, 0, 1);
  v13 = swift_release(v9);
  LOBYTE(v8) = static Edge.Set.all.getter(v13);
  v14 = EdgeInsets.init(_all:)(4.0);
  v23 = 0;
  v15 = v25[7];
  *(_OWORD *)(a1 + 96) = v25[6];
  *(_OWORD *)(a1 + 112) = v15;
  *(_QWORD *)(a1 + 128) = v26;
  v16 = v25[3];
  *(_OWORD *)(a1 + 32) = v25[2];
  *(_OWORD *)(a1 + 48) = v16;
  v17 = v25[5];
  *(_OWORD *)(a1 + 64) = v25[4];
  *(_OWORD *)(a1 + 80) = v17;
  v18 = v25[1];
  *(_OWORD *)a1 = v25[0];
  *(_OWORD *)(a1 + 16) = v18;
  *(_BYTE *)(a1 + 136) = v8;
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v24;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v24[3];
  *(double *)(a1 + 144) = v14;
  *(_QWORD *)(a1 + 152) = v19;
  *(_QWORD *)(a1 + 160) = v20;
  *(_QWORD *)(a1 + 168) = v21;
  *(_BYTE *)(a1 + 176) = v23;
}

uint64_t sub_100012188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
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
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[16];

  v1 = type metadata accessor for Control(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = &v56[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for DetectionButton(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(int *)(v5 + 28), v1);
  v6 = (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 88))(v4, v1);
  if (v6 == enum case for Control.peopleDetection(_:))
  {
    v7 = *(_QWORD *)(v0 + 32);
    v8 = *(_QWORD *)(v0 + 40);
    v9 = *(unsigned __int8 *)(v0 + 48);
    v10 = type metadata accessor for MAGAngelPreferences(0);
    v11 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v12 = StateObject.wrappedValue.getter(v7, v8, v9, v10, v11);
    KeyPath = swift_getKeyPath(&unk_10002B2E0);
    v14 = swift_getKeyPath(&unk_10002B308);
    static Published.subscript.getter(v12, KeyPath, v14);
    swift_release(v12);
    swift_release(KeyPath);
    swift_release(v14);
    return v56[11];
  }
  else if (v6 == enum case for Control.doorDetection(_:))
  {
    v16 = *(_QWORD *)(v0 + 32);
    v17 = *(_QWORD *)(v0 + 40);
    v18 = *(unsigned __int8 *)(v0 + 48);
    v19 = type metadata accessor for MAGAngelPreferences(0);
    v20 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v21 = StateObject.wrappedValue.getter(v16, v17, v18, v19, v20);
    v22 = swift_getKeyPath(&unk_10002B298);
    v23 = swift_getKeyPath(&unk_10002B2C0);
    static Published.subscript.getter(v21, v22, v23);
    swift_release(v21);
    swift_release(v22);
    swift_release(v23);
    return v56[12];
  }
  else if (v6 == enum case for Control.objectUnderstanding(_:))
  {
    v24 = *(_QWORD *)(v0 + 32);
    v25 = *(_QWORD *)(v0 + 40);
    v26 = *(unsigned __int8 *)(v0 + 48);
    v27 = type metadata accessor for MAGAngelPreferences(0);
    v28 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v29 = StateObject.wrappedValue.getter(v24, v25, v26, v27, v28);
    v30 = swift_getKeyPath(&unk_10002B250);
    v31 = swift_getKeyPath(&unk_10002B278);
    static Published.subscript.getter(v29, v30, v31);
    swift_release(v29);
    swift_release(v30);
    swift_release(v31);
    return v56[13];
  }
  else if (v6 == enum case for Control.imageCaption(_:))
  {
    v32 = *(_QWORD *)(v0 + 32);
    v33 = *(_QWORD *)(v0 + 40);
    v34 = *(unsigned __int8 *)(v0 + 48);
    v35 = type metadata accessor for MAGAngelPreferences(0);
    v36 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v37 = StateObject.wrappedValue.getter(v32, v33, v34, v35, v36);
    v38 = swift_getKeyPath(&unk_10002B328);
    v39 = swift_getKeyPath(&unk_10002B350);
    static Published.subscript.getter(v37, v38, v39);
    swift_release(v37);
    swift_release(v38);
    swift_release(v39);
    return v56[10];
  }
  else if (v6 == enum case for Control.pointSpeak(_:))
  {
    v40 = *(_QWORD *)(v0 + 32);
    v41 = *(_QWORD *)(v0 + 40);
    v42 = *(unsigned __int8 *)(v0 + 48);
    v43 = type metadata accessor for MAGAngelPreferences(0);
    v44 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v45 = StateObject.wrappedValue.getter(v40, v41, v42, v43, v44);
    v46 = swift_getKeyPath(&unk_10002B1C0);
    v47 = swift_getKeyPath(&unk_10002B1E8);
    static Published.subscript.getter(v45, v46, v47);
    swift_release(v45);
    swift_release(v46);
    swift_release(v47);
    return v56[15];
  }
  else if (v6 == enum case for Control.textDetection(_:))
  {
    v48 = *(_QWORD *)(v0 + 32);
    v49 = *(_QWORD *)(v0 + 40);
    v50 = *(unsigned __int8 *)(v0 + 48);
    v51 = type metadata accessor for MAGAngelPreferences(0);
    v52 = sub_100005CB0(&qword_10003C6C0, type metadata accessor for MAGAngelPreferences, (uint64_t)&unk_10002AD64);
    v53 = StateObject.wrappedValue.getter(v48, v49, v50, v51, v52);
    v54 = swift_getKeyPath(&unk_10002B208);
    v55 = swift_getKeyPath(&unk_10002B230);
    static Published.subscript.getter(v53, v54, v55);
    swift_release(v53);
    swift_release(v54);
    swift_release(v55);
    return v56[14];
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
}

uint64_t sub_100012664()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100012680@<X0>(uint64_t a1@<X8>)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
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
  char *v26;
  uint64_t KeyPath;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v55 = a1;
  v1 = type metadata accessor for ButtonBorderShape(0);
  v53 = *(_QWORD *)(v1 - 8);
  v54 = v1;
  __chkstk_darwin(v1);
  v52 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for BorderedProminentButtonStyle(0);
  v46 = *(_QWORD *)(v3 - 8);
  v47 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000ADD4(&qword_10003C7A0);
  v45 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000ADD4(&qword_10003C7A8);
  v48 = *(_QWORD *)(v9 - 8);
  v49 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_10000ADD4(&qword_10003C7B0);
  __chkstk_darwin(v44);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_10000ADD4(&qword_10003C7B8);
  __chkstk_darwin(v50);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_10000ADD4(&qword_10003C7C0);
  __chkstk_darwin(v51);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003BE58 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v18 = qword_10003EAA8;
  swift_retain(qword_10003EAA8);
  v19 = sub_10000ADD4(&qword_10003C7C8);
  v20 = sub_100013AB4(&qword_10003C7D0, &qword_10003C7C8);
  v21 = Button.init(action:label:)(sub_100013788, v18, sub_100012BD8, 0, v19, v20);
  BorderedProminentButtonStyle.init()(v21);
  v22 = sub_100013C3C(&qword_10003C7D8, &qword_10003C7A0, (uint64_t)&protocol conformance descriptor for Button<A>);
  v23 = sub_100005CB0(&qword_10003C7E0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v24 = v47;
  View.buttonStyle<A>(_:)(v5, v6, v47, v22, v23);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v5, v24);
  v25 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v8, v6);
  v26 = v52;
  static ButtonBorderShape.roundedRectangle.getter(v25);
  KeyPath = swift_getKeyPath(&unk_10002B160);
  v28 = (uint64_t *)&v13[*(int *)(v44 + 36)];
  v29 = sub_10000ADD4(&qword_10003C7E8);
  v31 = v53;
  v30 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))((char *)v28 + *(int *)(v29 + 28), v26, v54);
  *v28 = KeyPath;
  v33 = v48;
  v32 = v49;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v13, v11, v49);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v30);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v32);
  v34 = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");
  v35 = Color.init(_:)(v34);
  v36 = swift_getKeyPath(&unk_10002B190);
  v56 = v35;
  swift_retain(v35);
  v37 = AnyShapeStyle.init<A>(_:)(&v56, &type metadata for Color, &protocol witness table for Color);
  sub_100013C7C((uint64_t)v13, (uint64_t)v15, &qword_10003C7B0);
  swift_release(v35);
  v38 = (uint64_t *)&v15[*(int *)(v50 + 36)];
  *v38 = v36;
  v38[1] = v37;
  v39 = sub_10000B358((uint64_t)v13, &qword_10003C7B0);
  v40 = static Color.black.getter(v39);
  sub_100013C7C((uint64_t)v15, (uint64_t)v17, &qword_10003C7B8);
  *(_QWORD *)&v17[*(int *)(v51 + 36)] = v40;
  sub_10000B358((uint64_t)v15, &qword_10003C7B8);
  v41 = v55;
  sub_100013C7C((uint64_t)v17, v55, &qword_10003C7C0);
  *(_BYTE *)(v41 + *(int *)(sub_10000ADD4(&qword_10003C7F0) + 36)) = 1;
  return sub_10000B358((uint64_t)v17, &qword_10003C7C0);
}

uint64_t sub_100012B28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;
  char v7;

  v0 = sub_10000ADD4(&qword_10003C5E0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 1;
  v4 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_100012BD8(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
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
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[0] = String.localized.getter(0xD000000000000017, 0x8000000100030D80);
  v32[1] = v2;
  v3 = sub_100011380();
  v4 = Text.init<A>(_:)(v32, &type metadata for String, v3);
  v6 = v5;
  v8 = v7;
  v10 = v9 & 1;
  v11 = static Font.title2.getter();
  v12 = Text.font(_:)(v11, v4, v6, v10, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_release(v11);
  sub_1000130A8(v4, v6, v10);
  v19 = swift_bridgeObjectRelease(v8);
  v20 = static Font.Weight.medium.getter(v19);
  v21 = Text.fontWeight(_:)(*(_QWORD *)&v20, 0, v12, v14, v16 & 1, v18);
  v23 = v22;
  LOBYTE(v8) = v24;
  v26 = v25;
  sub_1000130A8(v12, v14, v16 & 1);
  v27 = swift_bridgeObjectRelease(v18);
  LOBYTE(v11) = static Edge.Set.all.getter(v27);
  v28 = EdgeInsets.init(_all:)(5.0);
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v8 & 1;
  *(_QWORD *)(a1 + 24) = v26;
  *(_BYTE *)(a1 + 32) = v11;
  *(double *)(a1 + 40) = v28;
  *(_QWORD *)(a1 + 48) = v29;
  *(_QWORD *)(a1 + 56) = v30;
  *(_QWORD *)(a1 + 64) = v31;
  *(_BYTE *)(a1 + 72) = 0;
}

uint64_t sub_100012D30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000ADD4(&qword_10003C340);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100013C7C(v2, (uint64_t)v10, &qword_10003C340);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = static os_log_type_t.fault.getter();
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v20[1] = a1;
      v19 = v18;
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = sub_100025D00(0x686353726F6C6F43, 0xEB00000000656D65, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100012F70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *(_BYTE *)(a1 + 128);
  v9 = *(_QWORD *)(a1 + 136);
  swift_retain(*(_QWORD *)(a1 + 56));
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  sub_100013004(v6, v7, v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t sub_100013004(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100013014(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *(_BYTE *)(a1 + 128);
  v9 = *(_QWORD *)(a1 + 136);
  swift_release(*(_QWORD *)(a1 + 48));
  swift_release(v3);
  swift_release(v2);
  swift_release(v4);
  swift_release(v5);
  sub_1000130A8(v6, v7, v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t sub_1000130A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000130B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000130E0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100013108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013130(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_100013158()
{
  unint64_t result;

  result = qword_10003C6E8;
  if (!qword_10003C6E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Color, &type metadata for Color);
    atomic_store(result, (unint64_t *)&qword_10003C6E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for StopRecognitionButton()
{
  return &type metadata for StopRecognitionButton;
}

uint64_t sub_1000131AC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v16);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[4];
    v10 = a2[5];
    v11 = *((_BYTE *)a2 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    sub_10000D984(v9, v10);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    *(_BYTE *)(a1 + 48) = v11;
    v12 = *(int *)(a3 + 28);
    v13 = a1 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = type metadata accessor for Control(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100013280(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  sub_10000DA64(a1[4], a1[5]);
  v4 = (char *)a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for Control(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000132DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  sub_10000D984(v8, v9);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v10;
  v11 = *(int *)(a3 + 28);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for Control(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_100013384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 40);
  v12 = *(_BYTE *)(a2 + 48);
  sub_10000D984(v10, v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = v12;
  sub_10000DA64(v13, v14);
  v15 = *(int *)(a3 + 28);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for Control(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_100013454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = type metadata accessor for Control(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_1000134C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_BYTE *)(a2 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = v10;
  sub_10000DA64(v11, v12);
  v13 = *(int *)(a3 + 28);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for Control(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_100013558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013564);
}

uint64_t sub_100013564(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for Control(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1000135E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000135EC);
}

uint64_t sub_1000135EC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for Control(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_100013660(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_10002B0A8;
  v4[1] = &unk_10002B0A8;
  v4[2] = &unk_10002AFB8;
  result = type metadata accessor for Control(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_1000136E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C788;
  if (!qword_10003C788)
  {
    v1 = sub_10000B24C(&qword_10003C790);
    sub_100011158();
    sub_100005CB0(&qword_10003C798, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C788);
  }
  return result;
}

uint64_t sub_100013768(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002BFFC, 1);
}

uint64_t sub_100013778(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002BFD4, 1);
}

uint64_t sub_100013788()
{
  return sub_100012B28();
}

uint64_t sub_100013790()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_1000137B0(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ButtonBorderShape(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues._buttonBorderShape.setter(v3);
}

uint64_t sub_100013830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013858(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

uint64_t sub_100013880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;

  v1 = type metadata accessor for DetectionButton(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (_QWORD *)(v0 + v4);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(v7[3]);
  sub_10000DA64(v7[4], v7[5]);
  v8 = (char *)v7 + *(int *)(v1 + 28);
  v9 = type metadata accessor for Control(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100013934(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013978()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DetectionButton(0) - 8) + 80);
  return sub_100011D14(v0 + ((v1 + 16) & ~v1));
}

void sub_1000139B8(uint64_t a1@<X8>)
{
  sub_100011FD0(a1);
}

uint64_t sub_1000139C0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000B24C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013A28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C840;
  if (!qword_10003C840)
  {
    v1 = sub_10000B24C(&qword_10003C848);
    sub_100013AB4(&qword_10003C850, &qword_10003C858);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C840);
  }
  return result;
}

uint64_t sub_100013AB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000B24C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013B14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C868;
  if (!qword_10003C868)
  {
    v1 = sub_10000B24C(&qword_10003C818);
    sub_100013B98();
    sub_100013C3C(&qword_10003C898, &qword_10003C8A0, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C868);
  }
  return result;
}

unint64_t sub_100013B98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C870;
  if (!qword_10003C870)
  {
    v1 = sub_10000B24C(&qword_10003C810);
    sub_100013EF4(&qword_10003C878, &qword_10003C808, &qword_10003C7F8, &qword_10003C860);
    sub_100013C3C(&qword_10003C888, &qword_10003C890, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C870);
  }
  return result;
}

uint64_t sub_100013C3C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000B24C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013C7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000ADD4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013CC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000ADD4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013D34()
{
  return sub_100013D60(&qword_10003C8A8, &qword_10003C7F0, (void (*)(void))sub_100013DCC);
}

uint64_t sub_100013D60(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000B24C(a2);
    a3();
    sub_100013FF4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013DCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C8B0;
  if (!qword_10003C8B0)
  {
    v1 = sub_10000B24C(&qword_10003C7C0);
    sub_100013E50();
    sub_100013C3C(&qword_10003C898, &qword_10003C8A0, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C8B0);
  }
  return result;
}

unint64_t sub_100013E50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C8B8;
  if (!qword_10003C8B8)
  {
    v1 = sub_10000B24C(&qword_10003C7B8);
    sub_100013EF4(&qword_10003C8C0, &qword_10003C7B0, &qword_10003C7A0, &qword_10003C7D8);
    sub_100013C3C(&qword_10003C888, &qword_10003C890, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C8B8);
  }
  return result;
}

uint64_t sub_100013EF4(unint64_t *a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[4];

  result = *a1;
  if (!result)
  {
    v8 = sub_10000B24C(a2);
    v9[0] = sub_10000B24C(a3);
    v9[1] = type metadata accessor for BorderedProminentButtonStyle(255);
    v9[2] = sub_100013C3C(a4, a3, (uint64_t)&protocol conformance descriptor for Button<A>);
    v9[3] = sub_100005CB0(&qword_10003C7E0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2(v9, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    sub_100013C3C(&qword_10003C880, &qword_10003C7E8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013FF4()
{
  unint64_t result;

  result = qword_10003C8C8;
  if (!qword_10003C8C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AccessibilityIgnoresInvertColorsViewModifier, &type metadata for _AccessibilityIgnoresInvertColorsViewModifier);
    atomic_store(result, (unint64_t *)&qword_10003C8C8);
  }
  return result;
}

uint64_t sub_100014038()
{
  return sub_100013D60(&qword_10003C8D0, &qword_10003C828, (void (*)(void))sub_100014064);
}

unint64_t sub_100014064()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C8D8;
  if (!qword_10003C8D8)
  {
    v1 = sub_10000B24C(&qword_10003C820);
    sub_100013B14();
    sub_100005CB0(&qword_10003C798, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C8D8);
  }
  return result;
}

uint64_t sub_1000140EC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  char v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_10002B5A0);
  v5 = swift_getKeyPath(&unk_10002B5C8);
  static Published.subscript.getter(v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100014168(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_10002B5A0);
  v5 = swift_getKeyPath(&unk_10002B5C8);
  v7 = v2;
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_1000142F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
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

  v4[40] = a4;
  v5 = type metadata accessor for DispatchTime(0);
  v4[41] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[42] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[43] = swift_task_alloc(v7);
  v4[44] = swift_task_alloc(v7);
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v4[45] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v4[46] = v9;
  v4[47] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v4[48] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v4[49] = v11;
  v4[50] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v4[51] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v4[52] = v13;
  v4[53] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000ADD4(&qword_10003CBC8);
  v4[54] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v4[55] = v15;
  v4[56] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MainActor(0);
  v4[57] = v16;
  v4[58] = static MainActor.shared.getter(v16);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v4[59] = v17;
  v4[60] = v18;
  return swift_task_switch(sub_100014440, v17, v18);
}

uint64_t sub_100014440()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_10003BE58 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v1 = sub_10000ADD4(&qword_10003CBD0);
  v2 = AsyncStream.makeAsyncIterator()(v1);
  v3 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v0[61] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy;
  v0[62] = v3;
  v4 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestFrameCheckDelay;
  v0[63] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption;
  v0[64] = v4;
  v0[65] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v0[66] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive;
  v0[67] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  v0[68] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder;
  v5 = static MainActor.shared.getter(v2);
  v0[69] = v5;
  v6 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v0[70] = v6;
  *v6 = v0;
  v6[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v0 + 76, v5, &protocol witness table for MainActor);
}

uint64_t sub_10001456C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 552);
  swift_task_dealloc(*(_QWORD *)(*v0 + 560));
  swift_release(v2);
  return swift_task_switch(sub_1000145C4, *(_QWORD *)(v1 + 472), *(_QWORD *)(v1 + 480));
}

uint64_t sub_1000145C4(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v2 = *(unsigned __int8 *)(v1 + 608);
  *(_BYTE *)(v1 + 610) = v2;
  if (v2 == 12)
  {
    v3 = *(_QWORD *)(v1 + 464);
    v4 = *(_QWORD *)(v1 + 448);
    v5 = *(_QWORD *)(v1 + 424);
    v6 = *(_QWORD *)(v1 + 400);
    v7 = *(_QWORD *)(v1 + 376);
    v9 = *(_QWORD *)(v1 + 344);
    v8 = *(_QWORD *)(v1 + 352);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 440) + 8))(v4, *(_QWORD *)(v1 + 432));
    swift_release(v3);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v11 = static Log.angel.getter(a1);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    v14 = os_log_type_enabled(v12, v13);
    v16 = *(_QWORD *)(v1 + 416);
    v15 = *(_QWORD *)(v1 + 424);
    v17 = *(_QWORD *)(v1 + 408);
    if (v14)
    {
      v18 = swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      v24 = v19;
      *(_DWORD *)v18 = 136315138;
      *(_BYTE *)(v1 + 609) = v2;
      v20 = String.init<A>(describing:)(v1 + 609, &type metadata for MAGAngelClientRequest);
      v22 = v21;
      *(_QWORD *)(v18 + 4) = sub_100025D00(v20, v21, &v24);
      swift_bridgeObjectRelease(v22);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "App delegate did receive client request: %s", (uint8_t *)v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    if (v2 <= 0xB && ((1 << v2) & 0x80E) != 0 || (*(_BYTE *)(*(_QWORD *)(v1 + 320) + *(_QWORD *)(v1 + 488)) & 1) != 0)
      __asm { BR              X10 }
    v23 = (_QWORD *)swift_task_alloc(dword_10003CBDC);
    *(_QWORD *)(v1 + 568) = v23;
    *v23 = v1;
    v23[1] = sub_1000151D4;
    return sub_100015DCC();
  }
}

uint64_t sub_100014844()
{
  uint64_t v0;
  _QWORD *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = v1[50];
  v4 = v1[47];
  v32 = v1[49];
  v33 = v1[48];
  v5 = v1[45];
  v31 = v1[46];
  v34 = v1[40];
  v35 = v1[66];
  v6 = v0;
  v7 = objc_msgSend(objc_allocWithZone((Class)SBSUIMagnifierSceneSpecification), "init");
  v8 = objc_msgSend(v7, "uiSceneSessionRole");

  sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100035E90, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v1[6] = sub_10001C5B8;
  v1[7] = v10;
  v1[2] = _NSConcreteStackBlock;
  v1[3] = 1107296256;
  v1[4] = sub_10000A3F4;
  v1[5] = &unk_100035EA8;
  v11 = _Block_copy(v2);
  v12 = v8;
  static DispatchQoS.unspecified.getter();
  v1[39] = &_swiftEmptyArrayStorage;
  v13 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v14 = sub_10000ADD4(&qword_10003C1E0);
  v15 = sub_10000B200();
  dispatch thunk of SetAlgebra.init<A>(_:)(v6, v14, v15, v5, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v3, v4, v11);
  _Block_release(v11);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v3, v33);
  swift_release(v1[7]);
  *(_BYTE *)(v34 + v35) = 1;
  v16 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v16, "setLiveRecognitionOverlayOpen:", 1);

  v18 = v1[68];
  v19 = v1[40];
  if (!*(_QWORD *)(v19 + v18) && (*(_BYTE *)(v19 + v1[66]) & 1) == 0 && *(_BYTE *)(v19 + v1[61]) == 1)
  {
    v20 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v21 = *(void **)(v19 + v18);
    *(_QWORD *)(v19 + v18) = v20;

    v22 = *(void **)(v19 + v18);
    if (v22)
    {
      v23 = v1[68];
      v24 = v1[40];
      sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
      v25 = v22;
      v26 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v25, "setDelegate:queue:", v24, v26);

      v17 = *(id *)(v24 + v23);
      if (v17)
        v17 = objc_msgSend(v17, "startWithOptions:", 0);
    }
  }
  v27 = static MainActor.shared.getter(v17);
  v1[69] = v27;
  v28 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v1[70] = v28;
  *v28 = v1;
  v28[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v30, v27, &protocol witness table for MainActor, v1[54]);
}

uint64_t sub_100014A2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1[57];
  v1[72] = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v1[73] = v3;
  v1[74] = v4;
  return swift_task_switch(sub_100015B54, v3, v4);
}

uint64_t sub_100014A8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD);
  BOOL *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;

  v2 = *(_QWORD *)(v0[40] + v0[65]);
  KeyPath = swift_getKeyPath(&unk_10002B510);
  v4 = swift_getKeyPath(&unk_10002B538);
  swift_retain(v2);
  v5 = (void (*)(uint64_t, _QWORD))static Published.subscript.modify(v1, v2, KeyPath, v4);
  *v6 = !*v6;
  v5(v1, 0);
  swift_release(v2);
  swift_release(KeyPath);
  swift_release(v4);
  if ((sub_10001850C() & 1) != 0)
  {
    v7 = v0[66];
    v8 = v0[40];
    sub_100016F84();
    if ((*(_BYTE *)(v8 + v7) & 1) == 0)
      sub_1000164B8();
  }
  sub_10001796C();
  sub_100018770();
  v10 = v0[68];
  v11 = v0[40];
  if (!*(_QWORD *)(v11 + v10) && (*(_BYTE *)(v11 + v0[66]) & 1) == 0 && *(_BYTE *)(v11 + v0[61]) == 1)
  {
    v12 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v13 = *(void **)(v11 + v10);
    *(_QWORD *)(v11 + v10) = v12;

    v14 = *(void **)(v11 + v10);
    if (v14)
    {
      v15 = v0[68];
      v16 = v0[40];
      sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
      v17 = v14;
      v18 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v17, "setDelegate:queue:", v16, v18);

      v9 = *(id *)(v16 + v15);
      if (v9)
        v9 = objc_msgSend(v9, "startWithOptions:", 0);
    }
  }
  v19 = static MainActor.shared.getter(v9);
  v0[69] = v19;
  v20 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v0[70] = v20;
  *v20 = v0;
  v20[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v22, v19, &protocol witness table for MainActor);
}

uint64_t sub_100014E58(id a1)
{
  uint64_t v1;
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v2[63];
  v5 = v2[40];
  if ((*(_BYTE *)(v5 + v4) & 1) == 0)
  {
    v6 = v2[64];
    v38 = v2[49];
    v39 = v2[48];
    v7 = v2[45];
    v36 = v2[47];
    v37 = v2[46];
    v8 = v2[43];
    v32 = v2[50];
    v33 = v2[44];
    v9 = v2[41];
    v10 = v2[42];
    *(_BYTE *)(v5 + v4) = 1;
    v34 = v1;
    sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
    v35 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)(v8, *(double *)(v5 + v6));
    v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v11(v8, v9);
    v12 = swift_allocObject(&unk_100035E40, 24, 7);
    swift_unknownObjectWeakInit(v12 + 16, v5);
    v2[12] = sub_10001C58C;
    v2[13] = v12;
    v2[8] = _NSConcreteStackBlock;
    v2[9] = 1107296256;
    v2[10] = sub_10000A3F4;
    v2[11] = &unk_100035E58;
    v13 = _Block_copy(v3);
    v14 = swift_retain(v12);
    static DispatchQoS.unspecified.getter(v14);
    v2[38] = &_swiftEmptyArrayStorage;
    v15 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v16 = sub_10000ADD4(&qword_10003C1E0);
    v17 = sub_10000B200();
    dispatch thunk of SetAlgebra.init<A>(_:)(v34, v16, v17, v7, v15);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v33, v32, v36, v13);
    _Block_release(v13);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v7);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v32, v39);
    v11(v33, v9);
    v18 = v2[13];
    swift_release(v12);
    a1 = (id)swift_release(v18);
  }
  v19 = v2[68];
  v20 = v2[40];
  if (!*(_QWORD *)(v20 + v19) && (*(_BYTE *)(v20 + v2[66]) & 1) == 0 && *(_BYTE *)(v20 + v2[61]) == 1)
  {
    v21 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v22 = *(void **)(v20 + v19);
    *(_QWORD *)(v20 + v19) = v21;

    v23 = *(void **)(v20 + v19);
    if (v23)
    {
      v24 = v2[68];
      v25 = v2[40];
      sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
      v26 = v23;
      v27 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v26, "setDelegate:queue:", v25, v27);

      a1 = *(id *)(v25 + v24);
      if (a1)
        a1 = objc_msgSend(a1, "startWithOptions:", 0);
    }
  }
  v28 = static MainActor.shared.getter(a1);
  v2[69] = v28;
  v29 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v2[70] = v29;
  *v29 = v2;
  v29[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v31, v28, &protocol witness table for MainActor);
}

uint64_t sub_1000151D4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 568));
  return swift_task_switch(sub_100015220, *(_QWORD *)(v1 + 472), *(_QWORD *)(v1 + 480));
}

void sub_100015220()
{
  __asm { BR              X10 }
}

uint64_t sub_100015268()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;

  sub_1000169F8();
  v2 = v0[68];
  v3 = v0[40];
  if (!*(_QWORD *)(v3 + v2) && (*(_BYTE *)(v3 + v0[66]) & 1) == 0 && *(_BYTE *)(v3 + v0[61]) == 1)
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v5 = *(void **)(v3 + v2);
    *(_QWORD *)(v3 + v2) = v4;

    v6 = *(void **)(v3 + v2);
    if (v6)
    {
      v7 = v0[68];
      v8 = v0[40];
      sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
      v9 = v6;
      v10 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v9, "setDelegate:queue:", v8, v10);

      v1 = *(id *)(v8 + v7);
      if (v1)
        v1 = objc_msgSend(v1, "startWithOptions:", 0);
    }
  }
  v11 = static MainActor.shared.getter(v1);
  v0[69] = v11;
  v12 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v0[70] = v12;
  *v12 = v0;
  v12[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v0 + 76, v11, &protocol witness table for MainActor);
}

uint64_t sub_100015B54()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = v0[40];
  if (*(_BYTE *)(v1 + v0[66]) == 1)
  {
    swift_release(v0[72]);
    sub_1000169F8();
    return swift_task_switch(sub_100015BF8, v0[59], v0[60]);
  }
  if ((*(_BYTE *)(v1 + v0[61]) & 1) != 0)
  {
    swift_release(v0[72]);
    sub_1000164B8();
    return swift_task_switch(sub_100015BF8, v0[59], v0[60]);
  }
  v3 = (_QWORD *)swift_task_alloc(dword_10003CBDC);
  v0[75] = v3;
  *v3 = v0;
  v3[1] = sub_100015D3C;
  return sub_100015DCC();
}

uint64_t sub_100015BF8(id a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;

  v2 = v1[68];
  v3 = v1[40];
  if (!*(_QWORD *)(v3 + v2) && (*(_BYTE *)(v3 + v1[66]) & 1) == 0 && *(_BYTE *)(v3 + v1[61]) == 1)
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v5 = *(void **)(v3 + v2);
    *(_QWORD *)(v3 + v2) = v4;

    v6 = *(void **)(v3 + v2);
    if (v6)
    {
      v7 = v1[68];
      v8 = v1[40];
      sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
      v9 = v6;
      v10 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v9, "setDelegate:queue:", v8, v10);

      a1 = *(id *)(v8 + v7);
      if (a1)
        a1 = objc_msgSend(a1, "startWithOptions:", 0);
    }
  }
  v11 = static MainActor.shared.getter(a1);
  v1[69] = v11;
  v12 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  v1[70] = v12;
  *v12 = v1;
  v12[1] = sub_10001456C;
  return AsyncStream.Iterator.next(isolation:)(v1 + 76, v11, &protocol witness table for MainActor, v1[54]);
}

uint64_t sub_100015D3C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 600));
  return swift_task_switch(sub_100015D8C, *(_QWORD *)(v1 + 584), *(_QWORD *)(v1 + 592));
}

uint64_t sub_100015D8C()
{
  _QWORD *v0;

  swift_release(v0[72]);
  sub_1000164B8();
  return swift_task_switch(sub_100015BF8, v0[59], v0[60]);
}

uint64_t sub_100015DCC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
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

  v1[8] = v0;
  v2 = type metadata accessor for Date(0);
  v1[9] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[10] = v3;
  v1[11] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MAGOutputEventEnvironment(0);
  v1[12] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[13] = v5;
  v1[14] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MAGOutputEventSource(0);
  v1[15] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v1[16] = v7;
  v1[17] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MAGOutputEvent(0);
  v1[18] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v1[19] = v9;
  v1[20] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v1[21] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v1[22] = v11;
  v1[23] = v12;
  return swift_task_switch(sub_100015ED8, v11, v12);
}

uint64_t sub_100015ED8()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  char *v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v30 = *(_QWORD *)(v0 + 152);
  v32 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 64);
  MSNMonitorBeginException("magnifierangel");
  v9 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  *(_QWORD *)(v0 + 192) = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v10 = *(_QWORD *)(v8 + v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, enum case for MAGOutputEventSource.liveDetection(_:), v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, enum case for MAGOutputEventEnvironment.angel(_:), v7);
  swift_retain(v10);
  static MAGOutputEvent.liveRecognitionStarted(source:environment:)(v2, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  dispatch thunk of MAGOutputEngine.schedule(_:)(v1);
  swift_release(v10);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v1, v32);
  sub_100016F84();
  if (AXDeviceHasJindo(v11))
  {
    v12 = *(_QWORD *)(v0 + 64);
    *(_BYTE *)(v12 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy) = 1;
    v13 = *(void **)(v12 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy);
    *(_QWORD *)(v0 + 200) = v13;
    v14 = v13;
    return swift_task_switch(sub_100016200, 0, 0);
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 168));
    v28 = *(_QWORD *)(v0 + 192);
    v29 = *(_QWORD *)(v0 + 160);
    v31 = *(_QWORD *)(v0 + 136);
    v33 = *(_QWORD *)(v0 + 112);
    v17 = *(_QWORD *)(v0 + 80);
    v16 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 64);
    v19 = *(_QWORD *)(v0 + 72);
    v20 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    objc_msgSend(v20, "addObserver:selector:name:object:", v18, "checkForDeactivationReasonWithNotification:", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);

    v21 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
    objc_msgSend(v21, "setLiveRecognitionActive:", 1);

    v22 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
    v23 = (char *)*(id *)(v18 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
    Date.init()();
    v24 = &v23[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
    swift_beginAccess(&v23[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime], v0 + 16, 33, 0);
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 40);
    v25(v24, v16, v19);
    swift_endAccess(v0 + 16);

    *(_QWORD *)(*(_QWORD *)(v18 + v22) + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
    Date.init()();
    v26 = (char *)(v18 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime);
    swift_beginAccess(v18 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime, v0 + 40, 33, 0);
    v25(v26, v16, v19);
    swift_endAccess(v0 + 40);
    v27 = *(_QWORD *)(v18 + v28);
    swift_retain(v27);
    dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter(1);
    swift_release(v27);
    swift_task_dealloc(v29);
    swift_task_dealloc(v31);
    swift_task_dealloc(v33);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100016200()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v1 = (_QWORD *)swift_task_alloc(dword_10003CE64);
  *(_QWORD *)(v0 + 208) = v1;
  *v1 = v0;
  v1[1] = sub_100016274;
  return sub_10001FCB8();
}

uint64_t sub_100016274()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 200);
  swift_task_dealloc(*(_QWORD *)(*v0 + 208));

  return swift_task_switch(sub_1000162C4, *(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 184));
}

uint64_t sub_1000162C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  swift_release(*(_QWORD *)(v0 + 168));
  v14 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 136);
  v17 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", v3, "checkForDeactivationReasonWithNotification:", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);

  v6 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v6, "setLiveRecognitionActive:", 1);

  v7 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  v8 = (char *)*(id *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
  Date.init()();
  v9 = &v8[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
  swift_beginAccess(&v8[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime], v0 + 16, 33, 0);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 40);
  v10(v9, v1, v4);
  swift_endAccess(v0 + 16);

  *(_QWORD *)(*(_QWORD *)(v3 + v7) + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
  Date.init()();
  v11 = (char *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime);
  swift_beginAccess(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime, v0 + 40, 33, 0);
  v10(v11, v1, v4);
  swift_endAccess(v0 + 40);
  v12 = *(_QWORD *)(v3 + v14);
  swift_retain(v12);
  dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter(1);
  swift_release(v12);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000164B8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v18 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchQoS(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone((Class)SBSUIMagnifierSceneSpecification), "init");
  v8 = objc_msgSend(v7, "uiSceneSessionRole");

  sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100035F58, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  aBlock[4] = sub_10001C6A4;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A3F4;
  aBlock[3] = &unk_100035F70;
  v11 = _Block_copy(aBlock);
  v12 = v8;
  static DispatchQoS.unspecified.getter();
  v20 = &_swiftEmptyArrayStorage;
  v13 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v14 = sub_10000ADD4(&qword_10003C1E0);
  v15 = sub_10000B200();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v14, v15, v0, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v2, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release(v22);
  *(_BYTE *)(v19 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) = 1;
  v16 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v16, "setLiveRecognitionOverlayOpen:", 1);

}

uint64_t sub_10001673C()
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD aBlock[5];
  uint64_t v31;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchTime(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v11);
  v16 = (char *)&v24 - v15;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) & 1) == 0)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 1;
    sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
    v27 = v3;
    v25 = static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)(v13, *(double *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestFrameCheckDelay));
    v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v13, v9);
    v17 = swift_allocObject(&unk_100035E40, 24, 7);
    swift_unknownObjectWeakInit(v17 + 16, v1);
    aBlock[4] = sub_10001C58C;
    v31 = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000A3F4;
    aBlock[3] = &unk_100035F20;
    v18 = _Block_copy(aBlock);
    v19 = swift_retain(v17);
    static DispatchQoS.unspecified.getter(v19);
    v29 = &_swiftEmptyArrayStorage;
    v20 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v21 = sub_10000ADD4(&qword_10003C1E0);
    v22 = sub_10000B200();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v2, v20);
    v23 = (void *)v25;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v8, v5, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
    v26(v16, v9);
    swift_release(v31);
    return swift_release(v17);
  }
  return result;
}

void sub_1000169F8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t KeyPath;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v2);
  v4 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOutputEventEnvironment(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for MAGOutputEventSource(0);
  v69 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v67 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for MAGOutputEvent(0);
  v68 = *(_QWORD *)(v70 - 8);
  __chkstk_darwin(v70);
  v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v65 = *(_QWORD *)(v12 - 8);
  v66 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v16 = *(_QWORD *)&v0[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine];
  v17 = swift_retain(v16);
  dispatch thunk of MAGOutputEngine.stopSpeechImmediately()(v17);
  swift_release(v16);
  v18 = *(_QWORD *)&v1[v15];
  v19 = swift_retain(v18);
  dispatch thunk of MAGOutputEngine.clearEventQueue()(v19);
  swift_release(v18);
  v20 = *(_QWORD *)&v1[v15];
  v21 = swift_retain(v20);
  dispatch thunk of MAGOutputEngine.resetSpeechContent()(v21);
  v22 = swift_release(v20);
  v23 = static Log.angel.getter(v22);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    v64 = v8;
    v27 = v6;
    v28 = v5;
    v29 = v4;
    v30 = v26;
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Deactivating Scene Session and/or Jindo Activity and stopping arSession", v26, 2u);
    v31 = v30;
    v4 = v29;
    v5 = v28;
    v6 = v27;
    v8 = v64;
    swift_slowDealloc(v31, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v65 + 8))(v14, v66);
  v32 = *(_QWORD *)&v1[v15];
  v33 = v69;
  v34 = v67;
  v35 = v71;
  (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v67, enum case for MAGOutputEventSource.liveDetection(_:), v71);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for MAGOutputEventEnvironment.angel(_:), v5);
  swift_retain(v32);
  static MAGOutputEvent.liveRecognitionStopped(source:environment:)(v34, v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  dispatch thunk of MAGOutputEngine.schedule(_:)(v11);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v11, v70);
  v36 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService;
  v37 = *(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService];
  dispatch thunk of MAGARService.stopARSession()();

  v38 = *(id *)&v1[v36];
  dispatch thunk of MAGARService.arSession.setter(0);

  v39 = *(void **)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder];
  *(_QWORD *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder] = 0;

  v40 = MSNMonitorEndException("magnifierangel");
  if (AXDeviceHasJindo(v40))
  {
    v41 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v4, 1, 1, v41);
    type metadata accessor for MainActor(0);
    v42 = v1;
    v43 = static MainActor.shared.getter(v42);
    v44 = (_QWORD *)swift_allocObject(&unk_100035DA0, 40, 7);
    v44[2] = v43;
    v44[3] = &protocol witness table for MainActor;
    v44[4] = v42;
    v45 = sub_1000063BC((uint64_t)v4, (uint64_t)&unk_10003CB48, (uint64_t)v44);
    swift_release(v45);
  }
  sub_100017758();
  v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy] = 0;
  v46 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v47 = *(_QWORD *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
  KeyPath = swift_getKeyPath(&unk_10002B558);
  v49 = swift_getKeyPath(&unk_10002B580);
  v76 = 0;
  swift_retain(v47);
  static Published.subscript.setter(&v76, v47, KeyPath, v49);
  v50 = *(_QWORD *)&v1[v46];
  v51 = swift_getKeyPath(&unk_10002B480);
  v52 = swift_getKeyPath(&unk_10002B4A8);
  v75 = 0;
  swift_retain(v50);
  static Published.subscript.setter(&v75, v50, v51, v52);
  v53 = *(_QWORD *)&v1[v46];
  v54 = swift_getKeyPath(&unk_10002B4C8);
  v55 = swift_getKeyPath(&unk_10002B4F0);
  v74 = 0;
  swift_retain(v53);
  static Published.subscript.setter(&v74, v53, v54, v55);
  v56 = *(_QWORD *)&v1[v46];
  v57 = swift_getKeyPath(&unk_10002B510);
  v58 = swift_getKeyPath(&unk_10002B538);
  v73 = 0;
  swift_retain(v56);
  static Published.subscript.setter(&v73, v56, v57, v58);
  v59 = *(_QWORD *)&v1[v46];
  v60 = swift_getKeyPath(&unk_10002B5E8);
  v61 = swift_getKeyPath(&unk_10002B610);
  v72 = 0;
  swift_retain(v59);
  static Published.subscript.setter(&v72, v59, v60, v61);
  v62 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v62, "setLiveRecognitionActive:", 0);

  sub_10001796C();
}

void sub_100016F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
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
  _BYTE v32[16];

  v1 = v0;
  v2 = type metadata accessor for MFFeatureFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v32[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) & 1) == 0)
  {
    v6 = *(void **)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
    v7 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
    v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences);
    KeyPath = swift_getKeyPath(&unk_10002B480);
    v10 = swift_getKeyPath(&unk_10002B4A8);
    v11 = v6;
    v12 = swift_retain(v8);
    static Published.subscript.getter(v12, KeyPath, v10);
    swift_release(v8);
    swift_release(KeyPath);
    swift_release(v10);
    if ((v32[15] & 1) != 0)
      goto LABEL_4;
    v13 = *(_QWORD *)(v1 + v7);
    v14 = swift_getKeyPath(&unk_10002B4C8);
    v15 = swift_getKeyPath(&unk_10002B4F0);
    v16 = swift_retain(v13);
    static Published.subscript.getter(v16, v14, v15);
    swift_release(v13);
    swift_release(v14);
    swift_release(v15);
    if ((v32[14] & 1) != 0)
    {
LABEL_4:
      v17 = 1;
    }
    else
    {
      v27 = *(_QWORD *)(v1 + v7);
      v28 = swift_getKeyPath(&unk_10002B510);
      v29 = swift_getKeyPath(&unk_10002B538);
      v30 = swift_retain(v27);
      static Published.subscript.getter(v30, v28, v29);
      swift_release(v27);
      swift_release(v28);
      swift_release(v29);
      if (v32[13] == 1)
      {
        v31 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for MFFeatureFlags.groupTextDetections(_:), v2);
        v17 = MFFeatureFlags.isEnabled.getter(v31);
        (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      }
      else
      {
        v17 = 0;
      }
    }
    v18 = *(_QWORD *)(v1 + v7);
    v19 = swift_getKeyPath(&unk_10002B558);
    v20 = swift_getKeyPath(&unk_10002B580);
    v21 = swift_retain(v18);
    static Published.subscript.getter(v21, v19, v20);
    swift_release(v18);
    swift_release(v19);
    swift_release(v20);
    v22 = v32[12];
    v23 = *(_QWORD *)(v1 + v7);
    v24 = swift_getKeyPath(&unk_10002B5A0);
    v25 = swift_getKeyPath(&unk_10002B5C8);
    v26 = swift_retain(v23);
    static Published.subscript.getter(v26, v24, v25);
    swift_release(v23);
    swift_release(v24);
    swift_release(v25);
    dispatch thunk of MAGARService.startARSession(sceneDepth:personSegmentation:sceneReconstruction:)(v17 & 1, v22, v32[11]);

  }
}

uint64_t sub_10001724C(void *a1)
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v17;

  v2 = type metadata accessor for UISceneSessionActivationRequest(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static Log.angel.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "activateUIScene() activateSceneSession", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  UISceneSessionActivationRequest.init(role:userActivity:options:)(a1, 0, 0);
  v15 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  UIApplication.activateSceneSession(for:errorHandler:)(v5, sub_1000173E0, 0);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000173E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter(v4);
  swift_errorRetain(a1);
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v17 = v2;
    v11 = (uint8_t *)v10;
    v12 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    swift_errorRetain(a1);
    v13 = _swift_stdlib_bridgeErrorToNSError(a1);
    v18 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v11 + 4, v11 + 12);
    *v12 = v13;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Could not open scene %@", v11, 0xCu);
    v14 = sub_10000ADD4((uint64_t *)&unk_10003D370);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    v15 = v11;
    v2 = v17;
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1000175A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[3] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[4] = v6;
  v4[5] = v7;
  return swift_task_switch(sub_10001760C, v6, v7);
}

uint64_t sub_10001760C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy);
  *(_QWORD *)(v0 + 48) = v1;
  v2 = v1;
  return swift_task_switch(sub_100017658, 0, 0);
}

uint64_t sub_100017658()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v3 = (uint64_t (__cdecl *)())((char *)&dword_10003CE70 + dword_10003CE70);
  v1 = (_QWORD *)swift_task_alloc(unk_10003CE74);
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_1000176D8;
  return v3();
}

uint64_t sub_1000176D8()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 48);
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));

  return swift_task_switch(sub_100017728, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_100017728()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100017758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
  v8 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100017E90;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A3F4;
  aBlock[3] = &unk_100035DB8;
  v9 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  v15 = &_swiftEmptyArrayStorage;
  v10 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v11 = sub_10000ADD4(&qword_10003C1E0);
  v12 = sub_10000B200();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v0, v10);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(_BYTE *)(v14 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) = 0;
  v13 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v13, "setLiveRecognitionOverlayOpen:", 0);

}

void sub_10001796C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  NSNumber v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSNumber v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSNumber v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSNumber v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSNumber v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  Class isa;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;

  v1 = v0;
  v2 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences);
  KeyPath = swift_getKeyPath(&unk_10002B558);
  v5 = swift_getKeyPath(&unk_10002B580);
  v6 = swift_retain(v3);
  static Published.subscript.getter(v6, KeyPath, v5);
  swift_release(v3);
  swift_release(KeyPath);
  swift_release(v5);
  if (v58 == 1)
  {
    v7.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v9 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v8 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v9 >= v8 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
    v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7.super.super.isa);
    specialized Array._endMutation()(v10);
  }
  v11 = *(_QWORD *)(v1 + v2);
  v12 = swift_getKeyPath(&unk_10002B480);
  v13 = swift_getKeyPath(&unk_10002B4A8);
  v14 = swift_retain(v11);
  static Published.subscript.getter(v14, v12, v13);
  swift_release(v11);
  swift_release(v12);
  swift_release(v13);
  if (v57 == 1)
  {
    v15.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v17 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v16 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v17 >= v16 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
    v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15.super.super.isa);
    specialized Array._endMutation()(v18);
  }
  v19 = *(_QWORD *)(v1 + v2);
  v20 = swift_getKeyPath(&unk_10002B5E8);
  v21 = swift_getKeyPath(&unk_10002B610);
  v22 = swift_retain(v19);
  static Published.subscript.getter(v22, v20, v21);
  swift_release(v19);
  swift_release(v20);
  swift_release(v21);
  if (v56 == 1)
  {
    v23.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v25 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v24 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v25 >= v24 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1);
    v26 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v25, v23.super.super.isa);
    specialized Array._endMutation()(v26);
  }
  v27 = *(_QWORD *)(v1 + v2);
  v28 = swift_getKeyPath(&unk_10002B4C8);
  v29 = swift_getKeyPath(&unk_10002B4F0);
  v30 = swift_retain(v27);
  static Published.subscript.getter(v30, v28, v29);
  swift_release(v27);
  swift_release(v28);
  swift_release(v29);
  if (v55 == 1)
  {
    v31.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v33 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v32 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v33 >= v32 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
    v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v31.super.super.isa);
    specialized Array._endMutation()(v34);
  }
  v35 = *(_QWORD *)(v1 + v2);
  v36 = swift_getKeyPath(&unk_10002B510);
  v37 = swift_getKeyPath(&unk_10002B538);
  v38 = swift_retain(v35);
  static Published.subscript.getter(v38, v36, v37);
  swift_release(v35);
  swift_release(v36);
  swift_release(v37);
  if (v54 == 1)
  {
    v39.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v41 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v40 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v41 >= v40 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
    v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v39.super.super.isa);
    specialized Array._endMutation()(v42);
  }
  v43 = *(_QWORD *)(v1 + v2);
  v44 = swift_getKeyPath(&unk_10002B5A0);
  v45 = swift_getKeyPath(&unk_10002B5C8);
  v46 = swift_retain(v43);
  static Published.subscript.getter(v46, v44, v45);
  swift_release(v43);
  swift_release(v44);
  swift_release(v45);
  if (v53 == 1)
  {
    v47.super.super.isa = UInt32._bridgeToObjectiveC()().super.super.isa;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v49 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v48 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v49 >= v48 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
    v50 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v49, v47.super.super.isa);
    specialized Array._endMutation()(v50);
  }
  v51 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  sub_10000B39C(0, (unint64_t *)&unk_10003CB50, NSNumber_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  objc_msgSend(v51, "setEnabledLiveRecognitionModes:", isa);

}

void sub_100017E90()
{
  id v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD aBlock[6];
  _QWORD v46[6];

  v0 = objc_msgSend(objc_allocWithZone((Class)SBSUIMagnifierSceneSpecification), "init");
  v43 = objc_msgSend(v0, "uiSceneSessionRole");

  v42 = (id)objc_opt_self(UIApplication);
  v1 = objc_msgSend(v42, "sharedApplication");
  v2 = objc_msgSend(v1, "connectedScenes");

  v3 = sub_10000B39C(0, &qword_10003CB78, UIScene_ptr);
  v4 = sub_10001C3F8();
  v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v3, v4);

  v39 = v3;
  if ((v5 & 0xC000000000000001) != 0)
  {
    if (v5 < 0)
      v7 = v5;
    else
      v7 = v5 & 0xFFFFFFFFFFFFFF8;
    v8 = __CocoaSet.makeIterator()(v7);
    v6 = Set.Iterator.init(_cocoa:)(v46, v8, v3, v4);
    v5 = v46[0];
    v41 = v46[1];
    v9 = v46[2];
    v10 = v46[3];
    v11 = v46[4];
  }
  else
  {
    v10 = 0;
    v12 = -1 << *(_BYTE *)(v5 + 32);
    v41 = v5 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(v5 + 56);
  }
  v38 = v9;
  v40 = (unint64_t)(v9 + 64) >> 6;
  while (v5 < 0)
  {
    v23 = __CocoaSet.Iterator.next()(v6);
    if (!v23)
      goto LABEL_41;
    v24 = v23;
    v44 = v23;
    swift_unknownObjectRetain(v23);
    swift_dynamicCast(aBlock, &v44, (char *)&type metadata for Swift.AnyObject + 8, v39, 7);
    v19 = (id)aBlock[0];
    swift_unknownObjectRelease(v24);
    v22 = v10;
    v20 = v11;
    if (!v19)
      goto LABEL_41;
LABEL_35:
    v28 = objc_msgSend(v19, "session", v38);
    v29 = objc_msgSend(v28, "role");

    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    v32 = v31;
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
    if (v30 == v33 && v32 == v34)
    {

      swift_bridgeObjectRelease_n(v32, 2, v15);
LABEL_12:
      v16 = objc_msgSend(v42, "sharedApplication");
      v17 = objc_msgSend(v19, "session");
      aBlock[4] = sub_1000182DC;
      aBlock[5] = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000184BC;
      aBlock[3] = &unk_100035DE0;
      v18 = _Block_copy(aBlock);
      objc_msgSend(v16, "requestSceneSessionDestruction:options:errorHandler:", v17, 0, v18);
      _Block_release(v18);

      v19 = v17;
      goto LABEL_13;
    }
    v36 = v34;
    v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v32, v33, v34, 0);

    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease(v36);
    if ((v37 & 1) != 0)
      goto LABEL_12;
LABEL_13:

    v10 = v22;
    v11 = v20;
  }
  if (v11)
  {
    v20 = (v11 - 1) & v11;
    v21 = __clz(__rbit64(v11)) | (v10 << 6);
    v22 = v10;
LABEL_34:
    v19 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v21);
    if (!v19)
      goto LABEL_41;
    goto LABEL_35;
  }
  v25 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v25 >= v40)
      goto LABEL_41;
    v26 = *(_QWORD *)(v41 + 8 * v25);
    v22 = v10 + 1;
    if (!v26)
    {
      v22 = v10 + 2;
      if (v10 + 2 >= v40)
        goto LABEL_41;
      v26 = *(_QWORD *)(v41 + 8 * v22);
      if (!v26)
      {
        v22 = v10 + 3;
        if (v10 + 3 >= v40)
          goto LABEL_41;
        v26 = *(_QWORD *)(v41 + 8 * v22);
        if (!v26)
        {
          v22 = v10 + 4;
          if (v10 + 4 >= v40)
            goto LABEL_41;
          v26 = *(_QWORD *)(v41 + 8 * v22);
          if (!v26)
          {
            v27 = v10 + 5;
            while (v40 != v27)
            {
              v26 = *(_QWORD *)(v41 + 8 * v27++);
              if (v26)
              {
                v22 = v27 - 1;
                goto LABEL_33;
              }
            }
LABEL_41:
            sub_10001C450(v5);

            return;
          }
        }
      }
    }
LABEL_33:
    v20 = (v26 - 1) & v26;
    v21 = __clz(__rbit64(v26)) + (v22 << 6);
    goto LABEL_34;
  }
  __break(1u);
}

void sub_1000182DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter(v4);
  swift_errorRetain(a1);
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v17 = v2;
    v11 = (uint8_t *)v10;
    v12 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    swift_errorRetain(a1);
    v13 = _swift_stdlib_bridgeErrorToNSError(a1);
    v18 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v11 + 4, v11 + 12);
    *v12 = v13;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "~~~~ Could not close scene %@", v11, 0xCu);
    v14 = sub_10000ADD4((uint64_t *)&unk_10003D370);
    swift_arrayDestroy(v12, 1, v14);
    swift_slowDealloc(v12, -1, -1);
    v15 = v11;
    v2 = v17;
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v16 = objc_msgSend((id)objc_opt_self(AXSettings), "sharedInstance");
  objc_msgSend(v16, "setLiveRecognitionActive:", 0);

  exit(0);
}

void sub_1000184BC(uint64_t a1, void *a2)
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

uint64_t sub_10001850C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t KeyPath;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v1 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences);
  KeyPath = swift_getKeyPath(&unk_10002B510);
  v4 = swift_getKeyPath(&unk_10002B538);
  v5 = swift_retain(v2);
  static Published.subscript.getter(v5, KeyPath, v4);
  swift_release(v2);
  swift_release(KeyPath);
  swift_release(v4);
  if ((v32 & 1) != 0)
    return 1;
  v6 = *(_QWORD *)(v0 + v1);
  v7 = swift_getKeyPath(&unk_10002B5A0);
  v8 = swift_getKeyPath(&unk_10002B5C8);
  v9 = swift_retain(v6);
  static Published.subscript.getter(v9, v7, v8);
  swift_release(v6);
  swift_release(v7);
  swift_release(v8);
  if ((v31 & 1) != 0)
    return 1;
  v10 = *(_QWORD *)(v0 + v1);
  v11 = swift_getKeyPath(&unk_10002B558);
  v12 = swift_getKeyPath(&unk_10002B580);
  v13 = swift_retain(v10);
  static Published.subscript.getter(v13, v11, v12);
  swift_release(v10);
  swift_release(v11);
  swift_release(v12);
  if ((v30 & 1) != 0)
    return 1;
  v14 = *(_QWORD *)(v0 + v1);
  v15 = swift_getKeyPath(&unk_10002B480);
  v16 = swift_getKeyPath(&unk_10002B4A8);
  v17 = swift_retain(v14);
  static Published.subscript.getter(v17, v15, v16);
  swift_release(v14);
  swift_release(v15);
  swift_release(v16);
  if ((v29 & 1) != 0)
    return 1;
  v18 = *(_QWORD *)(v0 + v1);
  v19 = swift_getKeyPath(&unk_10002B5E8);
  v20 = swift_getKeyPath(&unk_10002B610);
  v21 = swift_retain(v18);
  static Published.subscript.getter(v21, v19, v20);
  swift_release(v18);
  swift_release(v19);
  swift_release(v20);
  if ((v28 & 1) != 0)
    return 1;
  v23 = *(_QWORD *)(v0 + v1);
  v24 = swift_getKeyPath(&unk_10002B4C8);
  v25 = swift_getKeyPath(&unk_10002B4F0);
  v26 = swift_retain(v23);
  static Published.subscript.getter(v26, v24, v25);
  swift_release(v23);
  swift_release(v24);
  swift_release(v25);
  return v27;
}

void sub_100018770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t KeyPath;
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
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) & 1) == 0)
  {
    v1 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences);
    KeyPath = swift_getKeyPath(&unk_10002B558);
    v4 = swift_getKeyPath(&unk_10002B580);
    v5 = swift_retain(v2);
    static Published.subscript.getter(v5, KeyPath, v4);
    swift_release(v4);
    swift_release(KeyPath);
    swift_release(v2);
    if ((v31 & 1) == 0)
    {
      v6 = *(_QWORD *)(v0 + v1);
      v7 = swift_getKeyPath(&unk_10002B480);
      v8 = swift_getKeyPath(&unk_10002B4A8);
      v9 = swift_retain(v6);
      static Published.subscript.getter(v9, v7, v8);
      swift_release(v8);
      swift_release(v7);
      swift_release(v6);
      if ((v30 & 1) == 0)
      {
        v10 = *(_QWORD *)(v0 + v1);
        v11 = swift_getKeyPath(&unk_10002B5E8);
        v12 = swift_getKeyPath(&unk_10002B610);
        v13 = swift_retain(v10);
        static Published.subscript.getter(v13, v11, v12);
        swift_release(v12);
        swift_release(v11);
        swift_release(v10);
        if ((v29 & 1) == 0)
        {
          v14 = *(_QWORD *)(v0 + v1);
          v15 = swift_getKeyPath(&unk_10002B4C8);
          v16 = swift_getKeyPath(&unk_10002B4F0);
          v17 = swift_retain(v14);
          static Published.subscript.getter(v17, v15, v16);
          swift_release(v16);
          swift_release(v15);
          swift_release(v14);
          if ((v28 & 1) == 0)
          {
            v18 = *(_QWORD *)(v0 + v1);
            v19 = swift_getKeyPath(&unk_10002B510);
            v20 = swift_getKeyPath(&unk_10002B538);
            v21 = swift_retain(v18);
            static Published.subscript.getter(v21, v19, v20);
            swift_release(v20);
            swift_release(v19);
            swift_release(v18);
            if ((v27 & 1) == 0)
            {
              v22 = *(_QWORD *)(v0 + v1);
              v23 = swift_getKeyPath(&unk_10002B5A0);
              v24 = swift_getKeyPath(&unk_10002B5C8);
              v25 = swift_retain(v22);
              static Published.subscript.getter(v25, v23, v24);
              swift_release(v24);
              swift_release(v23);
              swift_release(v22);
              if ((v26 & 1) == 0)
                sub_1000169F8();
            }
          }
        }
      }
    }
  }
}

void sub_1000189E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t Strong;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _BYTE v16[24];

  v2 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v2);
  v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v6 = (id)Strong;
    v7 = *(id *)(Strong + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
    v8 = (void *)dispatch thunk of MAGARService.arSession.getter();

    if (v8 && (v9 = objc_msgSend(v8, "currentFrame"), v8, v9))
    {
      v10 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
      type metadata accessor for MainActor(0);
      v11 = v6;
      v6 = v9;
      v12 = static MainActor.shared.getter(v6);
      v13 = (_QWORD *)swift_allocObject(&unk_100035EE0, 48, 7);
      v13[2] = v12;
      v13[3] = &protocol witness table for MainActor;
      v13[4] = v11;
      v13[5] = v6;
      v14 = sub_1000063BC((uint64_t)v4, (uint64_t)&unk_10003CBE8, (uint64_t)v13);
      swift_release(v14);

    }
    else
    {
      *((_BYTE *)v6 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 0;
      sub_10001673C();
    }

  }
}

uint64_t sub_100018B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[5] = a4;
  v5[6] = a5;
  v6 = type metadata accessor for Date(0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v5[9] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v5[10] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v5[11] = v9;
  v5[12] = v10;
  return swift_task_switch(sub_100018BFC, v9, v10);
}

uint64_t sub_100018BFC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[5] + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
  v0[13] = v1;
  v2 = dword_10003C174;
  v1;
  v3 = (_QWORD *)swift_task_alloc(v2);
  v0[14] = v3;
  *v3 = v0;
  v3[1] = sub_100018C6C;
  return sub_1000099D8(v0[6]);
}

uint64_t sub_100018C6C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 104);
  swift_task_dealloc(*(_QWORD *)(*v0 + 112));

  return swift_task_switch(sub_100018CBC, *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96));
}

uint64_t sub_100018CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = swift_release(*(_QWORD *)(v0 + 80));
  *(_BYTE *)(v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 0;
  Date.init()(v5);
  v6 = v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime;
  swift_beginAccess(v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime, v0 + 16, 33, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v6, v1, v2);
  swift_endAccess(v0 + 16);
  sub_100018D64();
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100018D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD aBlock[5];
  uint64_t v30;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v27 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v23 - v12;
  v14 = sub_10000B39C(0, (unint64_t *)&qword_10003C1D8, OS_dispatch_queue_ptr);
  v15 = (void *)static OS_dispatch_queue.main.getter(v14);
  static DispatchTime.now()();
  + infix(_:_:)(v11, *(double *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestDeactivationDelay));
  v24 = *(void (**)(char *, uint64_t))(v8 + 8);
  v24(v11, v7);
  v16 = swift_allocObject(&unk_100035E40, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, v0);
  aBlock[4] = sub_10001C66C;
  v30 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A3F4;
  aBlock[3] = &unk_100035EF8;
  v17 = _Block_copy(aBlock);
  v18 = swift_retain(v16);
  static DispatchQoS.unspecified.getter(v18);
  v28 = &_swiftEmptyArrayStorage;
  v19 = sub_100005CB0((unint64_t *)&qword_10003CB60, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v20 = sub_10000ADD4(&qword_10003C1E0);
  v21 = sub_10000B200();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v20, v21, v1, v19);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v6, v3, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
  v24(v13, v7);
  swift_release(v30);
  return swift_release(v16);
}

uint64_t sub_100019008(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2[17] = a1;
  v2[18] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[19] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[20] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[21] = swift_task_alloc(v5);
  v2[22] = swift_task_alloc(v5);
  v6 = type metadata accessor for Date(0);
  v2[23] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[24] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[25] = swift_task_alloc(v8);
  v2[26] = swift_task_alloc(v8);
  v9 = type metadata accessor for MAGAREvent.AREventType(0);
  v2[27] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[28] = v10;
  v2[29] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MainActor(0);
  v2[30] = static MainActor.shared.getter(v11);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v2[31] = v12;
  v2[32] = v13;
  return swift_task_switch(sub_10001910C, v12, v13);
}

void sub_10001910C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  double v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  double v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  void *v69;
  void *v70;
  char *v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  id v94;
  id v95;
  double v96;
  double v97;
  double v98;
  double v99;
  id v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;

  v1 = *(_QWORD *)(v0 + 144) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 264) = Strong;
  if (!Strong)
  {
    swift_release(*(_QWORD *)(v0 + 240));
LABEL_68:
    v156 = *(_QWORD *)(v0 + 200);
    v157 = *(_QWORD *)(v0 + 208);
    v159 = *(_QWORD *)(v0 + 168);
    v158 = *(_QWORD *)(v0 + 176);
    swift_task_dealloc(*(_QWORD *)(v0 + 232));
    swift_task_dealloc(v157);
    swift_task_dealloc(v156);
    swift_task_dealloc(v158);
    swift_task_dealloc(v159);
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v3 = (char *)Strong;
  v5 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 216);
  MAGAREvent.eventType.getter();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
  if (v7 != enum case for MAGAREvent.AREventType.didReceiveARFrame(_:))
  {
    if (v7 == enum case for MAGAREvent.AREventType.didReceiveARSpatialMappingPointClouds(_:))
    {
      v48 = *(_QWORD *)(v0 + 232);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 224) + 96))(v48, *(_QWORD *)(v0 + 216));
      v49 = *(void **)v48;
      v50 = *(_QWORD *)(v48 + 8);
      *(_QWORD *)(v0 + 376) = v50;

      v51 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      KeyPath = swift_getKeyPath(&unk_10002B5A0);
      v53 = swift_getKeyPath(&unk_10002B5C8);
      v54 = swift_retain(v51);
      static Published.subscript.getter(v54, KeyPath, v53);
      swift_release(v51);
      swift_release(KeyPath);
      swift_release(v53);
      if (*(_BYTE *)(v0 + 392) == 1)
      {
        v55 = *(void **)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
        *(_QWORD *)(v0 + 384) = v55;
        v56 = v55;
        swift_task_switch(sub_10001A234, 0, 0);
        return;
      }
      v62 = *(_QWORD *)(v0 + 240);
      swift_bridgeObjectRelease(v50);

      swift_release(v62);
      goto LABEL_68;
    }
    if (v7 == enum case for MAGAREvent.AREventType.sessionWasInterrupted(_:))
    {
      swift_release(*(_QWORD *)(v0 + 240));
      v57 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      v58 = swift_getKeyPath(&unk_10002B5A0);
      v59 = swift_getKeyPath(&unk_10002B5C8);
      v60 = swift_retain(v57);
      static Published.subscript.getter(v60, v58, v59);
      swift_release(v57);
      swift_release(v58);
      swift_release(v59);
      if (*(_BYTE *)(v0 + 394) == 1)
      {
        v61 = *(id *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService];
        dispatch thunk of MAGObjectUnderstandingService.stopService()();

        goto LABEL_68;
      }
    }
    else
    {
      v63 = *(_QWORD *)(v0 + 240);
      if (v7 != enum case for MAGAREvent.AREventType.sessionInterruptionEnded(_:))
      {
        v75 = *(_QWORD *)(v0 + 224);
        v74 = *(_QWORD *)(v0 + 232);
        v76 = *(_QWORD *)(v0 + 216);

        swift_release(v63);
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v76);
        goto LABEL_68;
      }
      swift_release(*(_QWORD *)(v0 + 240));
      v64 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      v65 = swift_getKeyPath(&unk_10002B5A0);
      v66 = swift_getKeyPath(&unk_10002B5C8);
      v67 = swift_retain(v64);
      static Published.subscript.getter(v67, v65, v66);
      swift_release(v64);
      swift_release(v65);
      swift_release(v66);
      if (*(_BYTE *)(v0 + 400) == 1)
      {
        v68 = *(char **)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
        v69 = *(void **)&v68[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService];
        v70 = *(void **)&v68[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene];
        v71 = v68;
        v72 = v69;
        v73 = v70;
        dispatch thunk of MAGObjectUnderstandingService.startService(with:)();

        goto LABEL_68;
      }
    }
LABEL_67:

    goto LABEL_68;
  }
  v8 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 224) + 96))(v8, *(_QWORD *)(v0 + 216));
  v9 = *(void **)v8;
  v10 = *(void **)(v8 + 8);
  *(_QWORD *)(v0 + 272) = v10;

  v11 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v12 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine];
  v13 = swift_retain(v12);
  v14 = dispatch thunk of MAGOutputEngine.isSpeaking.getter(v13);
  swift_release(v12);
  if ((v14 & 1) != 0
    || (v15 = *(_QWORD *)&v3[v11],
        v16 = swift_retain(v15),
        v17 = dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.getter(v16),
        v18 = swift_release(v15),
        (v17 & 1) == 0))
  {
LABEL_66:
    v155 = *(_QWORD *)(v0 + 240);

    swift_release(v155);
    goto LABEL_67;
  }
  v160 = v11;
  v20 = *(_QWORD *)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 208);
  v21 = *(_QWORD *)(v0 + 184);
  v22 = *(_QWORD *)(v0 + 192);
  Date.init()(v18);
  v161 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  v23 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager]
      + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess(v23, v0 + 112, 0, 0);
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  v24(v20, v23, v21);
  v25 = Date.timeIntervalSince(_:)(v20);
  v26 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v26(v20, v21);
  v27 = ((uint64_t (*)(uint64_t, uint64_t))v26)(v19, v21);
  if (*(double *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelInactiveTimeOut] >= v25)
    goto LABEL_25;
  v29 = *(_QWORD *)(v0 + 200);
  v28 = *(_QWORD *)(v0 + 208);
  v30 = *(_QWORD *)(v0 + 184);
  Date.init()(v27);
  v31 = &v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastPixelBufferCheckTime];
  swift_beginAccess(&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastPixelBufferCheckTime], v0 + 40, 0, 0);
  v24(v29, (uint64_t)v31, v30);
  v32 = Date.timeIntervalSince(_:)(v29);
  v26(v29, v30);
  v27 = ((uint64_t (*)(uint64_t, uint64_t))v26)(v28, v30);
  if (v32 <= 1.0)
  {
LABEL_25:
    *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
    goto LABEL_29;
  }
  v33 = objc_msgSend(v10, "capturedImage");
  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager], "computeLuminanceFromPixelBuffer:", v33);
  v35 = v34;

  if (v35 >= 1.0
    || vabdd_f64(v35, *(double *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue]) >= 0.5)
  {
    *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
LABEL_28:
    v77 = *(_QWORD *)(v0 + 208);
    v78 = *(_QWORD *)(v0 + 184);
    v79 = *(_QWORD *)(v0 + 192);
    *(double *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue] = v35;
    Date.init()(v36);
    swift_beginAccess(v31, v0 + 64, 33, 0);
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 40))(v31, v77, v78);
    v27 = swift_endAccess(v0 + 64);
LABEL_29:
    v81 = *(_QWORD *)(v0 + 200);
    v80 = *(_QWORD *)(v0 + 208);
    v82 = *(_QWORD *)(v0 + 184);
    Date.init()(v27);
    v83 = &v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime];
    swift_beginAccess(&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime], v0 + 88, 0, 0);
    v24(v81, (uint64_t)v83, v82);
    v84 = Date.timeIntervalSince(_:)(v81);
    v26(v81, v82);
    v85 = ((uint64_t (*)(uint64_t, uint64_t))v26)(v80, v82);
    if (*(double *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_maxAngelRuntime] < v84)
    {
      v86 = static Log.angel.getter(v85);
      v87 = Logger.logObject.getter(v86);
      v88 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v89 = 0;
        _os_log_impl((void *)&_mh_execute_header, v87, v88, "Deactivating angel because it has been active for 30 minutes", v89, 2u);
        swift_slowDealloc(v89, -1, -1);
      }
      v91 = *(_QWORD *)(v0 + 160);
      v90 = *(_QWORD *)(v0 + 168);
      v92 = *(_QWORD *)(v0 + 152);

      (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v90, v92);
      sub_1000169F8();
    }
    if (!*(_QWORD *)(*(_QWORD *)&v3[v161] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus))
    {
      objc_msgSend(v10, "estimatedLuminance");
      if (v93 == 0.0)
      {
        v94 = *(id *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager];
        v95 = objc_msgSend(v10, "capturedImage");
        objc_msgSend(v94, "computeLuminanceFromPixelBuffer:", v95);
        v97 = v96;

        v98 = v97 / 96.0;
      }
      else
      {
        objc_msgSend(v10, "estimatedLuminance");
        v98 = v99;
      }
      if (v98 > 0.0 && v98 < static Detection.luminanceThreshold.getter())
      {
        v100 = *(id *)&v3[v161];
        sub_100009F6C();

        *(_QWORD *)(*(_QWORD *)&v3[v161] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 1;
      }
    }
    v101 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector;
    v102 = v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector];
    if (v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector])
    {
      if (v102 != 1)
      {
LABEL_49:
        if (v102 == 2)
        {
          v3[v101] = 3;
          v122 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
          v123 = swift_getKeyPath(&unk_10002B5A0);
          v124 = swift_getKeyPath(&unk_10002B5C8);
          v125 = swift_retain(v122);
          static Published.subscript.getter(v125, v123, v124);
          swift_release(v122);
          swift_release(v123);
          swift_release(v124);
          if (*(_BYTE *)(v0 + 396) == 1)
          {
            v126 = *(void **)&v3[v161];
            *(_QWORD *)(v0 + 312) = v126;
            v127 = dword_10003C164;
            v126;
            v128 = (_QWORD *)swift_task_alloc(v127);
            *(_QWORD *)(v0 + 320) = v128;
            *v128 = v0;
            v128[1] = sub_10001A07C;
            sub_100008C34((uint64_t)v10);
            return;
          }
          v102 = v3[v101];
        }
        if (v102 == 3)
        {
          v129 = *(_QWORD *)&v3[v160];
          v130 = swift_retain(v129);
          v131 = dispatch thunk of MAGOutputEngine.isSpeaking.getter(v130);
          swift_release(v129);
          if ((v131 & 1) != 0)
          {
            v132 = *(_QWORD *)(v0 + 240);

            swift_release(v132);
            goto LABEL_68;
          }
          v3[v101] = 5;
          v133 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
          v134 = swift_getKeyPath(&unk_10002B5E8);
          v135 = swift_getKeyPath(&unk_10002B610);
          v136 = swift_retain(v133);
          static Published.subscript.getter(v136, v134, v135);
          swift_release(v133);
          swift_release(v134);
          swift_release(v135);
          if ((*(_BYTE *)(v0 + 395) & 1) != 0)
          {
            v137 = *(void **)&v3[v161];
            *(_QWORD *)(v0 + 328) = v137;
            v138 = dword_10003C174;
            v137;
            v139 = (_QWORD *)swift_task_alloc(v138);
            *(_QWORD *)(v0 + 336) = v139;
            *v139 = v0;
            v139[1] = sub_10001A0CC;
            sub_1000099D8((uint64_t)v10);
            return;
          }
          v102 = v3[v101];
        }
        if (v102 == 5)
        {
          v3[v101] = 4;
          v140 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
          v141 = swift_getKeyPath(&unk_10002B4C8);
          v142 = swift_getKeyPath(&unk_10002B4F0);
          v143 = swift_retain(v140);
          static Published.subscript.getter(v143, v141, v142);
          swift_release(v140);
          swift_release(v141);
          swift_release(v142);
          if (*(_BYTE *)(v0 + 401) == 1)
          {
            v144 = *(void **)&v3[v161];
            *(_QWORD *)(v0 + 344) = v144;
            v145 = dword_10003C16C;
            v144;
            v146 = (_QWORD *)swift_task_alloc(v145);
            *(_QWORD *)(v0 + 352) = v146;
            *v146 = v0;
            v146[1] = sub_10001A11C;
            sub_100009748((uint64_t)v10);
            return;
          }
          v102 = v3[v101];
        }
        if (v102 == 4)
        {
          v3[v101] = 0;
          v147 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
          v148 = swift_getKeyPath(&unk_10002B510);
          v149 = swift_getKeyPath(&unk_10002B538);
          v150 = swift_retain(v147);
          static Published.subscript.getter(v150, v148, v149);
          swift_release(v147);
          swift_release(v148);
          swift_release(v149);
          if (*(_BYTE *)(v0 + 393) == 1)
          {
            v151 = *(_QWORD *)&v3[v160];
            swift_retain(v151);
            dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter(0);
            swift_release(v151);
            v152 = *(void **)&v3[v161];
            *(_QWORD *)(v0 + 360) = v152;
            v153 = dword_10003C134;
            v152;
            v154 = (_QWORD *)swift_task_alloc(v153);
            *(_QWORD *)(v0 + 368) = v154;
            *v154 = v0;
            v154[1] = sub_10001A1E4;
            sub_100006508((uint64_t)v10);
            return;
          }
        }
        goto LABEL_66;
      }
    }
    else
    {
      v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector] = 1;
      v110 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
      v111 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      v112 = swift_getKeyPath(&unk_10002B558);
      v113 = swift_getKeyPath(&unk_10002B580);
      v114 = swift_retain(v111);
      static Published.subscript.getter(v114, v112, v113);
      swift_release(v111);
      swift_release(v112);
      swift_release(v113);
      if ((*(_BYTE *)(v0 + 398) & 1) != 0)
        goto LABEL_46;
      v115 = *(_QWORD *)&v3[v110];
      v116 = swift_getKeyPath(&unk_10002B5A0);
      v117 = swift_getKeyPath(&unk_10002B5C8);
      v118 = swift_retain(v115);
      static Published.subscript.getter(v118, v116, v117);
      swift_release(v115);
      swift_release(v116);
      swift_release(v117);
      if (*(_BYTE *)(v0 + 399) == 1)
      {
LABEL_46:
        v119 = *(void **)&v3[v161];
        *(_QWORD *)(v0 + 280) = v119;
        v120 = dword_10003C13C;
        v119;
        v121 = (_QWORD *)swift_task_alloc(v120);
        *(_QWORD *)(v0 + 288) = v121;
        *v121 = v0;
        v121[1] = sub_100019FDC;
        sub_100006CF4((uint64_t)v10);
        return;
      }
      v102 = v3[v101];
      if (v102 != 1)
        goto LABEL_49;
    }
    v3[v101] = 2;
    v103 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
    v104 = swift_getKeyPath(&unk_10002B480);
    v105 = swift_getKeyPath(&unk_10002B4A8);
    v106 = swift_retain(v103);
    static Published.subscript.getter(v106, v104, v105);
    swift_release(v103);
    swift_release(v104);
    swift_release(v105);
    if ((*(_BYTE *)(v0 + 397) & 1) != 0)
    {
      v107 = *(void **)&v3[v161];
      *(_QWORD *)(v0 + 296) = v107;
      v108 = dword_10003C144;
      v107;
      v109 = (_QWORD *)swift_task_alloc(v108);
      *(_QWORD *)(v0 + 304) = v109;
      *v109 = v0;
      v109[1] = sub_10001A02C;
      sub_100007484((uint64_t)v10);
      return;
    }
    v102 = v3[v101];
    goto LABEL_49;
  }
  v37 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames];
  v38 = __OFADD__(v37, 1);
  v39 = v37 + 1;
  if (!v38)
  {
    *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = v39;
    if (v39 >= 901)
    {
      v40 = static Log.angel.getter(v36);
      v41 = Logger.logObject.getter(v40);
      v42 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Deactivating UIScene because the angel has not been used for an extended period of time", v43, 2u);
        swift_slowDealloc(v43, -1, -1);
      }
      v44 = *(_QWORD *)(v0 + 176);
      v45 = v41;
      v47 = *(_QWORD *)(v0 + 152);
      v46 = *(_QWORD *)(v0 + 160);

      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v47);
      sub_1000169F8();
    }
    goto LABEL_28;
  }
  __break(1u);
}

uint64_t sub_100019FDC()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 280);
  swift_task_dealloc(*(_QWORD *)(*v0 + 288));

  return swift_task_switch(sub_10001C6B0, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A02C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 296);
  swift_task_dealloc(*(_QWORD *)(*v0 + 304));

  return swift_task_switch(sub_10001C6B0, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A07C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 312);
  swift_task_dealloc(*(_QWORD *)(*v0 + 320));

  return swift_task_switch(sub_10001C6B0, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A0CC()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 328);
  swift_task_dealloc(*(_QWORD *)(*v0 + 336));

  return swift_task_switch(sub_10001C6B0, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A11C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 344);
  swift_task_dealloc(*(_QWORD *)(*v0 + 352));

  return swift_task_switch(sub_10001A16C, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A16C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 264);
  v2 = *(void **)(v0 + 272);
  swift_release(*(_QWORD *)(v0 + 240));

  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 176);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A1E4()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;

  v1 = *v0;
  v2 = *(void **)(*v0 + 360);
  swift_task_dealloc(*(_QWORD *)(*v0 + 368));

  return swift_task_switch(sub_10001C6B0, *(_QWORD *)(v1 + 248), *(_QWORD *)(v1 + 256));
}

uint64_t sub_10001A234()
{
  _QWORD *v0;
  uint64_t v1;
  char *v2;
  id v3;

  v1 = v0[47];
  v2 = (char *)v0[48];
  v3 = *(id *)&v2[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService];
  dispatch thunk of MAGObjectUnderstandingService.understandObjects(spatialMappingPointClouds:)(v1);

  swift_bridgeObjectRelease(v1);
  return swift_task_switch(sub_10001A29C, v0[31], v0[32]);
}

uint64_t sub_10001A29C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 264);
  swift_release(*(_QWORD *)(v0 + 240));

  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 176);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A310(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[5] = a1;
  v2[6] = a2;
  v3 = type metadata accessor for DetectedObject(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGOUEvent.MAGOUEventType(0);
  v2[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[11] = v6;
  v2[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v2[13] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v2[14] = v8;
  v2[15] = v9;
  return swift_task_switch(sub_10001A3CC, v8, v9);
}

uint64_t sub_10001A3CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 48) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  *(_QWORD *)(v0 + 128) = Strong;
  if (Strong)
  {
    v3 = (char *)Strong;
    v5 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 96);
    v6 = *(_QWORD *)(v0 + 80);
    MAGOUEvent.eventType.getter();
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
    if (v7 == enum case for MAGOUEvent.MAGOUEventType.didRecievePointerContactWithObject(_:))
    {
      v8 = *(_QWORD *)(v0 + 96);
      v9 = *(_QWORD *)(v0 + 72);
      v10 = *(_QWORD *)(v0 + 56);
      v11 = *(_QWORD *)(v0 + 64);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v8, *(_QWORD *)(v0 + 80));
      v12 = *(_QWORD *)(v8 + *(int *)(sub_10000ADD4(&qword_10003CBC0) + 48));
      *(_QWORD *)(v0 + 136) = v12;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v8, v10);
      v13 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      KeyPath = swift_getKeyPath(&unk_10002B5A0);
      v15 = swift_getKeyPath(&unk_10002B5C8);
      v16 = swift_retain(v13);
      static Published.subscript.getter(v16, KeyPath, v15);
      swift_release(v15);
      swift_release(KeyPath);
      swift_release(v13);
      if (*(_BYTE *)(v0 + 218) == 1)
      {
        v17 = *(void **)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
        *(_QWORD *)(v0 + 144) = v17;
        v18 = dword_10003C14C;
        v17;
        v19 = (_QWORD *)swift_task_alloc(v18);
        *(_QWORD *)(v0 + 152) = v19;
        *v19 = v0;
        v19[1] = sub_10001A81C;
        return sub_100007FC0(*(_QWORD *)(v0 + 72), v12);
      }
      v30 = *(_QWORD *)(v0 + 104);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
      v31 = v30;
LABEL_16:
      swift_release(v31);
LABEL_17:
      swift_bridgeObjectRelease(v12);

      goto LABEL_18;
    }
    if (v7 == enum case for MAGOUEvent.MAGOUEventType.didRecievePointerContactWithObjectGroup(_:))
    {
      v21 = *(uint64_t **)(v0 + 96);
      (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v21, *(_QWORD *)(v0 + 80));
      v12 = *v21;
      *(_QWORD *)(v0 + 160) = *v21;
      v22 = v21[1];
      *(_QWORD *)(v0 + 168) = v22;
      v23 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      v24 = swift_getKeyPath(&unk_10002B5A0);
      v25 = swift_getKeyPath(&unk_10002B5C8);
      v26 = swift_retain(v23);
      static Published.subscript.getter(v26, v24, v25);
      swift_release(v25);
      swift_release(v24);
      swift_release(v23);
      if (*(_BYTE *)(v0 + 217) == 1)
      {
        v27 = *(void **)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
        *(_QWORD *)(v0 + 176) = v27;
        v28 = dword_10003C154;
        v27;
        v29 = (_QWORD *)swift_task_alloc(v28);
        *(_QWORD *)(v0 + 184) = v29;
        *v29 = v0;
        v29[1] = sub_10001A8F0;
        return sub_100008450(v12, v22);
      }
      swift_release(*(_QWORD *)(v0 + 104));
      swift_bridgeObjectRelease(v22);
      goto LABEL_17;
    }
    if (v7 == enum case for MAGOUEvent.MAGOUEventType.didReceivePointerContactsWithFurnitureDetections(_:))
    {
      v32 = *(uint64_t **)(v0 + 96);
      (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 88) + 96))(v32, *(_QWORD *)(v0 + 80));
      v12 = *v32;
      *(_QWORD *)(v0 + 192) = v12;
      v33 = *(_QWORD *)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences];
      v34 = swift_getKeyPath(&unk_10002B5A0);
      v35 = swift_getKeyPath(&unk_10002B5C8);
      v36 = swift_retain(v33);
      static Published.subscript.getter(v36, v34, v35);
      swift_release(v35);
      swift_release(v34);
      swift_release(v33);
      if (*(_BYTE *)(v0 + 216) == 1)
      {
        v37 = *(void **)&v3[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
        *(_QWORD *)(v0 + 200) = v37;
        v38 = dword_10003C15C;
        v37;
        v39 = (_QWORD *)swift_task_alloc(v38);
        *(_QWORD *)(v0 + 208) = v39;
        *v39 = v0;
        v39[1] = sub_10001A9AC;
        return sub_100008848(v12);
      }
      v31 = *(_QWORD *)(v0 + 104);
      goto LABEL_16;
    }
    v40 = *(_QWORD *)(v0 + 96);
    v41 = *(_QWORD *)(v0 + 80);
    v42 = *(_QWORD *)(v0 + 88);
    swift_release(*(_QWORD *)(v0 + 104));

    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 104));
  }
LABEL_18:
  v43 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 96));
  swift_task_dealloc(v43);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A81C()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(void **)(*v0 + 144);
  v3 = *(_QWORD *)(*v0 + 136);
  swift_task_dealloc(*(_QWORD *)(*v0 + 152));
  swift_bridgeObjectRelease(v3);

  return swift_task_switch(sub_10001A880, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
}

uint64_t sub_10001A880()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 56);
  swift_release(*(_QWORD *)(v0 + 104));

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 96));
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A8F0()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *v0;
  v2 = *(void **)(*v0 + 176);
  v3 = *(_QWORD *)(*v0 + 160);
  v4 = *(_QWORD *)(*v0 + 168);
  swift_task_dealloc(*(_QWORD *)(*v0 + 184));
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);

  return swift_task_switch(sub_10001A95C, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
}

uint64_t sub_10001A95C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 128);
  swift_release(*(_QWORD *)(v0 + 104));

  v2 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 96));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A9AC()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(void **)(*v0 + 200);
  v3 = *(_QWORD *)(*v0 + 192);
  swift_task_dealloc(*(_QWORD *)(*v0 + 208));
  swift_bridgeObjectRelease(v3);

  return swift_task_switch(sub_10001C6AC, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
}

void sub_10001AA58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t Strong;
  char *v10;
  char *v11;
  double v12;
  void (*v13)(_BYTE *, uint64_t);
  _BYTE v14[24];
  char v15[24];

  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v14[-v7];
  a1 += 16;
  swift_beginAccess(a1, v15, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v10 = (char *)Strong;
    Date.init()(Strong);
    v11 = &v10[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime];
    swift_beginAccess(&v10[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime], v14, 0, 0);
    (*(void (**)(_BYTE *, char *, uint64_t))(v3 + 16))(v6, v11, v2);
    v12 = Date.timeIntervalSince(_:)(v6);
    v13 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
    v13(v6, v2);
    v13(v8, v2);
    if (*(double *)&v10[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestDeactivationDelay] <= v12)
      sub_1000169F8();

  }
}

uint64_t sub_10001AB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001AC00, v6, v7);
}

uint64_t sub_10001AC00()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  *(_BYTE *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) = 1;
  v2 = *(id *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
  v3 = (void *)dispatch thunk of MAGARService.arSession.getter();

  objc_msgSend(v3, "pause");
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001ACE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001AD54, v6, v7);
}

uint64_t sub_10001AD54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  *(_BYTE *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) = 0;
  sub_100016F84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10001AE08(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
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
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char *v36;
  char *v37;
  objc_super v39;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2, a2);
  v5 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService;
  v6 = qword_10003BEA8;
  v7 = v2;
  if (v6 != -1)
    swift_once(&qword_10003BEA8, sub_10000CDC8);
  v8 = (void *)qword_10003EAF8;
  *(_QWORD *)&v3[v5] = qword_10003EAF8;
  v9 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService;
  v10 = qword_10003BEC0;
  v11 = v8;
  if (v10 != -1)
    swift_once(&qword_10003BEC0, sub_10000CF4C);
  v12 = (void *)qword_10003EB10;
  *(_QWORD *)&v7[v9] = qword_10003EB10;
  v13 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arEventHandler;
  v14 = qword_10003BEA0;
  v15 = v12;
  if (v14 != -1)
    swift_once(&qword_10003BEA0, sub_10000CDAC);
  v16 = qword_10003EAF0;
  *(_QWORD *)&v7[v13] = qword_10003EAF0;
  v17 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_ouEventHandler;
  v18 = qword_10003BEB8;
  swift_retain(v16);
  if (v18 != -1)
    swift_once(&qword_10003BEB8, sub_10000CF30);
  v19 = qword_10003EB08;
  *(_QWORD *)&v7[v17] = qword_10003EB08;
  v20 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v21 = qword_10003BE70;
  swift_retain(v19);
  if (v21 != -1)
    swift_once(&qword_10003BE70, sub_10000CBB0);
  v22 = qword_10003EAC0;
  *(_QWORD *)&v7[v20] = qword_10003EAC0;
  v23 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v24 = qword_10003BED8;
  swift_retain(v22);
  if (v24 != -1)
    swift_once(&qword_10003BED8, sub_10000D260);
  v25 = qword_10003EB28;
  *(_QWORD *)&v7[v23] = qword_10003EB28;
  v26 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  v27 = qword_10003BEF0;
  swift_retain(v25);
  if (v27 != -1)
    swift_once(&qword_10003BEF0, sub_10000D38C);
  v28 = (void *)qword_10003EB40;
  *(_QWORD *)&v7[v26] = qword_10003EB40;
  v29 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy;
  v30 = qword_10003BEF8;
  v31 = v28;
  if (v30 != -1)
    swift_once(&qword_10003BEF8, sub_10000D6A8);
  v32 = (void *)qword_10003EB48;
  *(_QWORD *)&v7[v29] = qword_10003EB48;
  v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy] = 0;
  v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption] = 0;
  v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive] = 0;
  v33 = Date.init()(v32);
  Date.init()(v33);
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_maxAngelRuntime] = 0x4082C00000000000;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelInactiveTimeOut] = 0x404E000000000000;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
  v34 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager;
  v35 = objc_msgSend(objc_allocWithZone((Class)ARFrameLuminanceManager), "init");
  *(_QWORD *)&v7[v34] = v35;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder] = 0;
  v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning] = 0;
  v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestFrameCheckDelay] = 0x3FD6666666666666;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestDeactivationDelay] = 0x4024000000000000;
  Date.init()(v35);
  v36 = &v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierSceneUIShowActivity];
  *(_QWORD *)v36 = 0xD000000000000027;
  *((_QWORD *)v36 + 1) = 0x8000000100031080;
  v37 = &v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierAngelBundleID];
  *(_QWORD *)v37 = 0xD000000000000026;
  *((_QWORD *)v37 + 1) = 0x80000001000310B0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask] = 0;

  v39.receiver = v7;
  v39.super_class = ObjectType;
  return objc_msgSendSuper2(&v39, "init");
}

uint64_t sub_10001B328()
{
  return type metadata accessor for MAGAngelAppDelegate(0);
}

uint64_t type metadata accessor for MAGAngelAppDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CAF8;
  if (!qword_10003CAF8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MAGAngelAppDelegate);
  return result;
}

uint64_t sub_10001B36C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[11];
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[8] = &unk_10002B3A8;
  v4[9] = &unk_10002B3A8;
  v4[10] = &unk_10002B3A8;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    v6 = v5;
    v7 = (char *)&value witness table for Builtin.Int64 + 64;
    v8 = (char *)&value witness table for Builtin.Int64 + 64;
    v9 = (char *)&value witness table for Builtin.Int64 + 64;
    v10 = (char *)&value witness table for Builtin.Int64 + 64;
    v11 = (char *)&value witness table for Builtin.UnknownObject + 64;
    v12 = &unk_10002B3C0;
    v13 = &unk_10002B3A8;
    v14 = &unk_10002B3D8;
    v15 = (char *)&value witness table for Builtin.Int64 + 64;
    v16 = (char *)&value witness table for Builtin.Int64 + 64;
    v17 = v5;
    v18 = &unk_10002B3F0;
    v19 = &unk_10002B3F0;
    v20 = &unk_10002B3C0;
    return swift_updateClassMetadata2(a1, 256, 27, v4, a1 + 80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DetectionType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DetectionType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_10001B530 + 4 * byte_10002B385[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10001B564 + 4 * byte_10002B380[v4]))();
}

uint64_t sub_10001B564(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B56C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001B574);
  return result;
}

uint64_t sub_10001B580(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001B588);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_10001B58C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B594(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DetectionType()
{
  return &type metadata for DetectionType;
}

unint64_t sub_10001B5B4()
{
  unint64_t result;

  result = qword_10003CB08;
  if (!qword_10003CB08)
  {
    result = swift_getWitnessTable(&unk_10002B458, &type metadata for DetectionType);
    atomic_store(result, (unint64_t *)&qword_10003CB08);
  }
  return result;
}

uint64_t sub_10001B5F8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static Log.angel.getter(v7);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(12, -1);
    v39 = v1;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc(32, -1);
    v41 = v15;
    *(_DWORD *)v14 = 136315138;
    v40 = sub_100025D00(0xD00000000000002DLL, 0x8000000100031190, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v14 + 4, v14 + 12);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    v16 = v14;
    v1 = v39;
    swift_slowDealloc(v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 1, 1, v17);
  type metadata accessor for MainActor(0);
  v18 = v1;
  v19 = static MainActor.shared.getter();
  v20 = (_QWORD *)swift_allocObject(&unk_100035E18, 40, 7);
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = v18;
  v21 = sub_1000063BC((uint64_t)v4, (uint64_t)&unk_10003CB98, (uint64_t)v20);
  v22 = *(_QWORD *)&v18[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask];
  *(_QWORD *)&v18[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask] = v21;
  swift_release(v22);
  v23 = *(_QWORD *)&v18[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arEventHandler];
  v24 = v18;
  swift_retain(v23);
  v25 = objc_msgSend(v24, "description");
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
  v28 = v27;

  v29 = swift_allocObject(&unk_100035E40, 24, 7);
  swift_unknownObjectWeakInit(v29 + 16, v24);
  swift_retain(v29);
  MAGAREventHandler.register(_:asActionHandler:)(v26, v28, &unk_10003CBA8, v29);
  swift_release_n(v29, 2);
  swift_bridgeObjectRelease(v28);
  swift_release(v23);
  v30 = *(_QWORD *)&v24[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_ouEventHandler];
  v31 = v24;
  swift_retain(v30);
  v32 = objc_msgSend(v31, "description");
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v35 = v34;

  v36 = swift_allocObject(&unk_100035E40, 24, 7);
  swift_unknownObjectWeakInit(v36 + 16, v31);
  swift_retain(v36);
  MAGOUEventHandler.register(_:handler:)(v33, v35, &unk_10003CBB8, v36);
  swift_release_n(v36, 2);
  swift_bridgeObjectRelease(v35);
  swift_release(v30);
  return 1;
}

id sub_10001BB34(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  char **p_name;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter(v4);
  v7 = a1;
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  p_name = &ActivityStore.name;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc(22, -1);
    v26 = v2;
    v12 = v11;
    v25 = swift_slowAlloc(64, -1);
    v28 = v25;
    *(_DWORD *)v12 = 136315394;
    v27 = sub_100025D00(0xD000000000000032, 0x8000000100031130, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v12 + 4, v12 + 12);
    *(_WORD *)(v12 + 12) = 2080;
    v13 = objc_msgSend(v7, "role");
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v24 = v3;
    v16 = v15;

    p_name = (char **)(&ActivityStore + 24);
    v27 = sub_100025D00(v14, v16, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v12 + 14, v12 + 22);

    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s role=%s", (uint8_t *)v12, 0x16u);
    v17 = v25;
    swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  v18 = objc_msgSend(v7, p_name[397]);
  v19 = objc_allocWithZone((Class)UISceneConfiguration);
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "initWithName:sessionRole:", v20, v18);

  return v21;
}

void sub_10001BDDC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint8_t *v36;
  id v37;
  _QWORD *v38;
  os_log_t v39;
  uint64_t v40;
  uint8_t *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  os_log_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;

  v63 = a3;
  v7 = v4;
  v9 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v53 - v17;
  if (a1)
  {
    v59 = a2;
    objc_msgSend(a1, "clientAuditToken");
    v61 = v65;
    v62 = v64;
    v19 = objc_allocWithZone((Class)BSAuditToken);
    v64 = v62;
    v65 = v61;
    v20 = objc_msgSend(v19, "initWithAuditToken:", &v64);
    v21 = objc_msgSend(v20, "pid");
    v22 = (void *)objc_opt_self(RBSProcessIdentifier);
    LODWORD(v62) = (_DWORD)v21;
    v23 = objc_msgSend(v22, "identifierWithPid:", v21);
    if (v23)
    {
      v24 = v23;
      v60 = v13;
      *(_QWORD *)&v61 = v12;
      v25 = (void *)objc_opt_self(RBSProcessHandle);
      *(_QWORD *)&v64 = 0;
      v26 = v24;
      v27 = objc_msgSend(v25, "handleForIdentifier:error:", v26, &v64);
      v28 = v64;
      if (v27)
      {
        v29 = v27;
        v58 = v20;
        v30 = (id)v64;

        static Log.angel.getter(v31);
        v32 = v29;
        v33 = Logger.logObject.getter(v32);
        v34 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v33, v34))
        {
          v55 = v33;
          v35 = swift_slowAlloc(12, -1);
          v57 = a4;
          v36 = (uint8_t *)v35;
          v54 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v36 = 138412290;
          v56 = v7;
          *(_QWORD *)&v64 = v32;
          v37 = v32;
          v7 = v56;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, (char *)&v64 + 8, v36 + 4, v36 + 12);
          v38 = v54;
          *v54 = v29;

          v39 = v55;
          _os_log_impl((void *)&_mh_execute_header, v55, v34, v59, v36, 0xCu);
          v40 = sub_10000ADD4((uint64_t *)&unk_10003D370);
          swift_arrayDestroy(v38, 1, v40);
          swift_slowDealloc(v38, -1, -1);
          v41 = v36;
          a4 = v57;
          swift_slowDealloc(v41, -1, -1);

        }
        else
        {

          v26 = v33;
        }
        v16 = v18;
        v20 = v58;
      }
      else
      {
        v42 = (id)v64;
        v43 = _convertNSErrorToError(_:)(v28);

        swift_willThrow();
        v45 = static Log.angel.getter(v44);
        v26 = Logger.logObject.getter(v45);
        v46 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v26, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v47 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v46, "Could not find viewfinder process handle", v47, 2u);
          swift_slowDealloc(v47, -1, -1);
        }
        swift_errorRelease(v43);
      }

      (*(void (**)(char *, _QWORD))(v60 + 8))(v16, v61);
    }
    if ((_DWORD)v62 != getpid())
    {
      v48 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v11, 1, 1, v48);
      type metadata accessor for MainActor(0);
      v49 = v7;
      v50 = static MainActor.shared.getter(v49);
      v51 = (_QWORD *)swift_allocObject(v63, 40, 7);
      v51[2] = v50;
      v51[3] = &protocol witness table for MainActor;
      v51[4] = v49;
      v52 = sub_1000063BC((uint64_t)v11, a4, (uint64_t)v51);
      swift_release(v52);
    }

  }
}

uint64_t sub_10001C264(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003CB1C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return sub_10001ACE8(a1, v4, v5, v6);
}

uint64_t sub_10001C2FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003CB34);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return sub_10001AB94(a1, v4, v5, v6);
}

uint64_t sub_10001C374(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003CB44);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B030;
  return sub_1000175A0(a1, v4, v5, v6);
}

uint64_t sub_10001C3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001C3F0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10001C3F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CB80;
  if (!qword_10003CB80)
  {
    v1 = sub_10000B39C(255, &qword_10003CB78, UIScene_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10003CB80);
  }
  return result;
}

uint64_t sub_10001C450(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001C45C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003CB94);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return sub_1000142F4(a1, v4, v5, v6);
}

uint64_t sub_10001C4C8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C4EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10003CBA4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000B030;
  return sub_100019008(a1, v1);
}

uint64_t sub_10001C53C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10003CBB4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000B558;
  return sub_10001A310(a1, v1);
}

void sub_10001C58C()
{
  uint64_t v0;

  sub_1000189E4(v0);
}

uint64_t sub_10001C594()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C5B8()
{
  uint64_t v0;

  return sub_10001724C(*(void **)(v0 + 16));
}

uint64_t sub_10001C5C0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001C5F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10003CBE4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000B558;
  return sub_100018B68(a1, v4, v5, v7, v6);
}

void sub_10001C66C()
{
  uint64_t v0;

  sub_10001AA58(v0);
}

void sub_10001C884()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  objc_msgSendSuper2(&v15, "viewDidLoad");
  v1 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView];
  if (v1)
  {
    String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
    objc_msgSend(v1, "setAccessibilityLabel:", v4);

    objc_msgSend(v1, "setTintColor:", *(_QWORD *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor]);
    v5 = v1;
    v6 = objc_msgSend(v0, "view");
    if (!v6)
    {
      __break(1u);
      goto LABEL_9;
    }
    v7 = v6;
    objc_msgSend(v6, "addSubview:", v5);

  }
  v8 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView];
  if (!v8)
  {
LABEL_7:
    sub_10001CA68();
    return;
  }
  String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
  v10 = v9;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  objc_msgSend(v8, "setAccessibilityLabel:", v11);

  objc_msgSend(v8, "setTintColor:", *(_QWORD *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor]);
  v12 = v8;
  v13 = objc_msgSend(v0, "view");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "addSubview:", v12);

    goto LABEL_7;
  }
LABEL_9:
  __break(1u);
}

void sub_10001CA68()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  Class isa;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSString v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  Class v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  NSString v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  double v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  Class v106;
  void *v107;
  id v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  NSString v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  uint64_t v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  Class v138;
  void *v139;
  id v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSString v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  id v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  NSString v171;
  void *v172;
  id v173;
  id v174;
  void *v175;
  uint64_t v176;
  id v177;
  id v178;
  void *v179;
  id v180;
  id v181;
  id v182;
  id v183;
  void *v184;
  id v185;
  id v186;
  id v187;
  id v188;
  void *v189;
  id v190;
  id v191;
  uint64_t v192;
  uint64_t v193;
  Class v194;
  char *v195;
  uint64_t v196;
  __int128 v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  uint64_t v201;

  v1 = v0;
  v2 = type metadata accessor for UIButton.Configuration(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v195 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_allocWithZone((Class)type metadata accessor for MAGAngelLeadingView());
  v6 = sub_10001E850(0);
  v7 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  v8 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView];
  *(_QWORD *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView] = v6;

  objc_msgSend(*(id *)&v0[v7], "setHidden:", 1);
  objc_msgSend(*(id *)&v0[v7], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = *(id *)&v0[v7];
  v10 = objc_msgSend(v0, "view");
  if (!v10)
  {
    __break(1u);
    goto LABEL_33;
  }
  v11 = v10;
  objc_msgSend(v10, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v9, "setFrame:", v13, v15, v17, v19);
  v20 = *(id *)&v1[v7];
  String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
  v22 = v21;
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v20, "setAccessibilityLabel:", v23);

  v24 = *(void **)&v1[v7];
  v196 = *(_QWORD *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor];
  objc_msgSend(v24, "setTintColor:");
  v25 = objc_msgSend(v1, "view");
  if (!v25)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v26 = v25;
  objc_msgSend(v25, "addSubview:", *(_QWORD *)&v1[v7]);

  v200 = sub_10000ADD4(&qword_10003CE08);
  v27 = swift_allocObject(v200, 48, 7);
  v197 = xmmword_10002B630;
  *(_OWORD *)(v27 + 16) = xmmword_10002B630;
  v28 = objc_msgSend(*(id *)&v1[v7], "leadingAnchor");
  v29 = objc_msgSend(v1, "view");
  if (!v29)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v30 = v29;
  v195 = v4;
  v31 = objc_msgSend(v29, "leadingAnchor");

  v32 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v31, 30.0);
  *(_QWORD *)(v27 + 32) = v32;
  v33 = objc_msgSend(*(id *)&v1[v7], "topAnchor");
  v34 = objc_msgSend(v1, "view");
  if (!v34)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v35 = v34;
  v36 = (void *)objc_opt_self(NSLayoutConstraint);
  v37 = objc_msgSend(v35, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  v38 = objc_msgSend(v37, "bottomAnchor");
  v39 = objc_msgSend(v33, "constraintEqualToAnchor:", v38);

  *(_QWORD *)(v27 + 40) = v39;
  v201 = v27;
  specialized Array._endMutation()(v40);
  v41 = v201;
  v198 = sub_10000B39C(0, &qword_10003CE10, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v41);
  v199 = v36;
  objc_msgSend(v36, "activateConstraints:", isa);

  v43 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v44 = *(id *)&v1[v43];
  String.localized.getter(0xD00000000000001ALL, 0x8000000100030D00);
  v46 = v45;
  v47 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v46);
  objc_msgSend(v44, "setText:", v47);

  objc_msgSend(*(id *)&v1[v43], "setTextColor:", v196);
  objc_msgSend(*(id *)&v1[v43], "setHidden:", 1);
  objc_msgSend(*(id *)&v1[v43], "sizeToFit");
  v48 = *(void **)&v1[v43];
  v49 = objc_allocWithZone((Class)UIFontMetrics);
  v50 = v48;
  v51 = objc_msgSend(v49, "initForTextStyle:", UIFontTextStyleBody);
  v52 = (void *)objc_opt_self(UIFontDescriptor);
  v53 = objc_msgSend(v52, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v53, "pointSize");
  if (v54 <= 20.0)
    v55 = v54;
  else
    v55 = 20.0;
  v56 = (void *)objc_opt_self(UIFont);
  v57 = objc_msgSend(v56, "systemFontOfSize:weight:", v55, UIFontWeightMedium);
  v58 = objc_msgSend(v51, "scaledFontForFont:", v57);

  objc_msgSend(v50, "setFont:", v58);
  objc_msgSend(*(id *)&v1[v43], "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(*(id *)&v1[v43], "setUserInteractionEnabled:", 0);
  v59 = objc_msgSend(v1, "view");
  if (!v59)
    goto LABEL_36;
  v60 = v59;
  objc_msgSend(v59, "addSubview:", *(_QWORD *)&v1[v43]);

  v61 = swift_allocObject(v200, 48, 7);
  *(_OWORD *)(v61 + 16) = v197;
  v62 = objc_msgSend(*(id *)&v1[v43], "topAnchor");
  v63 = objc_msgSend(v1, "view");
  if (!v63)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v64 = v63;
  v65 = objc_msgSend(v63, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  v66 = objc_msgSend(v65, "bottomAnchor");
  v67 = objc_msgSend(v62, "constraintEqualToAnchor:", v66);

  *(_QWORD *)(v61 + 32) = v67;
  v68 = objc_msgSend(*(id *)&v1[v43], "leadingAnchor");
  v69 = objc_msgSend(v1, "view");
  if (!v69)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v70 = v69;
  v71 = objc_msgSend(v69, "leadingAnchor");

  v72 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", v71, 72.0);
  *(_QWORD *)(v61 + 40) = v72;
  v201 = v61;
  specialized Array._endMutation()(v73);
  v74 = v201;
  v75 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v74);
  objc_msgSend(v199, "activateConstraints:", v75);

  v76 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v77 = *(id *)&v1[v76];
  String.localized.getter(0x7974697669746361, 0xEE006E6F2E73692ELL);
  v79 = v78;
  v80 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v79);
  objc_msgSend(v77, "setText:", v80);

  v81 = *(void **)&v1[v76];
  v82 = (void *)objc_opt_self(UIColor);
  v83 = v81;
  v84 = objc_msgSend(v82, "grayColor");
  objc_msgSend(v83, "setTextColor:", v84);

  objc_msgSend(*(id *)&v1[v76], "setHidden:", 1);
  objc_msgSend(*(id *)&v1[v76], "sizeToFit");
  v85 = *(void **)&v1[v76];
  v86 = objc_allocWithZone((Class)UIFontMetrics);
  v87 = v85;
  v88 = objc_msgSend(v86, "initForTextStyle:", UIFontTextStyleFootnote);
  v89 = objc_msgSend(v52, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote);
  objc_msgSend(v89, "pointSize");
  if (v90 > 20.0)
    v90 = 20.0;
  v91 = objc_msgSend(v56, "systemFontOfSize:weight:", v90, UIFontWeightMedium);
  v92 = objc_msgSend(v88, "scaledFontForFont:", v91);

  objc_msgSend(v87, "setFont:", v92);
  objc_msgSend(*(id *)&v1[v76], "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(*(id *)&v1[v76], "setUserInteractionEnabled:", 0);
  v93 = objc_msgSend(v1, "view");
  if (!v93)
    goto LABEL_39;
  v94 = v93;
  objc_msgSend(v93, "addSubview:", *(_QWORD *)&v1[v76]);

  v95 = swift_allocObject(v200, 48, 7);
  *(_OWORD *)(v95 + 16) = v197;
  v96 = objc_msgSend(*(id *)&v1[v76], "leadingAnchor");
  v97 = objc_msgSend(v1, "view");
  if (!v97)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v98 = v97;
  v99 = objc_msgSend(v97, "leadingAnchor");

  v100 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", v99, 72.0);
  *(_QWORD *)(v95 + 32) = v100;
  v101 = objc_msgSend(*(id *)&v1[v76], "topAnchor");
  v102 = objc_msgSend(*(id *)&v1[v43], "bottomAnchor");
  v103 = objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, 2.0);

  *(_QWORD *)(v95 + 40) = v103;
  v201 = v95;
  specialized Array._endMutation()(v104);
  v105 = v201;
  v106 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v105);
  objc_msgSend(v199, "activateConstraints:", v106);

  v107 = *(void **)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView];
  objc_msgSend(v107, "setTintColor:", v196);
  objc_msgSend(v107, "setHidden:", 1);
  objc_msgSend(v107, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v108 = objc_msgSend(v1, "view");
  if (!v108)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v109 = v108;
  objc_msgSend(v108, "frame");
  v111 = v110;
  v113 = v112;
  v115 = v114;
  v117 = v116;

  objc_msgSend(v107, "setFrame:", v111, v113, v115, v117);
  String.localized.getter(0x7974697669746361, 0xEE006E6F2E73692ELL);
  v119 = v118;
  v120 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v119);
  objc_msgSend(v107, "setAccessibilityLabel:", v120);

  v121 = objc_msgSend(v1, "view");
  if (!v121)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v122 = v121;
  objc_msgSend(v121, "addSubview:", v107);

  v123 = objc_msgSend(v1, "view");
  if (!v123)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v124 = v123;
  objc_msgSend(v123, "bringSubviewToFront:", v107);

  v125 = swift_allocObject(v200, 48, 7);
  *(_OWORD *)(v125 + 16) = v197;
  v126 = objc_msgSend(v107, "trailingAnchor");
  v127 = objc_msgSend(v1, "view");
  if (!v127)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v128 = v127;
  v129 = objc_msgSend(v127, "trailingAnchor");

  v130 = objc_msgSend(v126, "constraintEqualToAnchor:constant:", v129, -34.0);
  *(_QWORD *)(v125 + 32) = v130;
  v131 = objc_msgSend(v107, "topAnchor");
  v132 = objc_msgSend(v1, "view");
  if (!v132)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v133 = v132;
  v134 = objc_msgSend(v132, "topAnchor");

  v135 = objc_msgSend(v131, "constraintEqualToAnchor:constant:", v134, 50.0);
  *(_QWORD *)(v125 + 40) = v135;
  v201 = v125;
  specialized Array._endMutation()(v136);
  v137 = v201;
  v138 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v137);
  objc_msgSend(v199, "activateConstraints:", v138);

  v139 = (void *)objc_opt_self(UIButtonConfiguration);
  v140 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithLegibilityWeight:", 1);
  v141 = objc_msgSend(v139, "sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:", v140);

  v142 = v196;
  objc_msgSend(v141, "setBaseBackgroundColor:", v196);
  objc_msgSend(v141, "setBaseForegroundColor:", v142);
  String.localized.getter(0x7475622E706F7473, 0xEB000000006E6F74);
  v144 = v143;
  v145 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v144);
  objc_msgSend(v141, "setTitle:", v145);

  sub_10000B39C(0, &qword_10003CE18, SBUISystemApertureButton_ptr);
  v146 = v195;
  static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)(v141);
  sub_10000B39C(0, (unint64_t *)&unk_10003CE20, UIAction_ptr);
  v147 = swift_allocObject(&unk_100036010, 24, 7);
  *(_QWORD *)(v147 + 16) = v1;
  v148 = v1;
  v149 = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10001EF44, v147);
  v150 = UIButton.init(configuration:primaryAction:)(v146, v149);
  v151 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton;
  v152 = *(void **)&v148[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton];
  *(_QWORD *)&v148[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = v150;

  v153 = *(void **)&v148[v151];
  if (!v153)
    goto LABEL_31;
  objc_msgSend(v153, "setHidden:", 1);
  v154 = *(void **)&v148[v151];
  if (!v154)
    goto LABEL_31;
  objc_msgSend(v154, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v155 = *(void **)&v148[v151];
  if (!v155)
    goto LABEL_31;
  v156 = v155;
  v157 = objc_msgSend(v148, "view");
  if (!v157)
    goto LABEL_46;
  v158 = v157;
  objc_msgSend(v157, "frame");
  v160 = v159;
  v162 = v161;
  v164 = v163;
  v166 = v165;

  objc_msgSend(v156, "setFrame:", v160, v162, v164, v166);
  v167 = *(void **)&v148[v151];
  if (!v167)
    goto LABEL_31;
  v168 = v167;
  String.localized.getter(0x7475622E706F7473, 0xEB000000006E6F74);
  v170 = v169;
  v171 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v170);
  objc_msgSend(v168, "setAccessibilityLabel:", v171);

  v172 = *(void **)&v148[v151];
  if (!v172)
    goto LABEL_31;
  v173 = v172;
  v174 = objc_msgSend(v148, "view");
  if (!v174)
    goto LABEL_47;
  v175 = v174;
  objc_msgSend(v174, "addSubview:", v173);

  v176 = swift_allocObject(v200, 56, 7);
  *(_OWORD *)(v176 + 16) = xmmword_10002B640;
  v177 = objc_msgSend(v173, "leadingAnchor");
  v178 = objc_msgSend(v148, "view");
  if (!v178)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v179 = v178;
  v180 = objc_msgSend(v178, "leadingAnchor");

  v181 = objc_msgSend(v177, "constraintEqualToAnchor:constant:", v180, 20.0);
  *(_QWORD *)(v176 + 32) = v181;
  v182 = objc_msgSend(v173, "trailingAnchor");
  v183 = objc_msgSend(v148, "view");
  if (!v183)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v184 = v183;
  v185 = objc_msgSend(v183, "trailingAnchor");

  v186 = objc_msgSend(v182, "constraintEqualToAnchor:constant:", v185, -20.0);
  *(_QWORD *)(v176 + 40) = v186;
  v187 = objc_msgSend(v173, "bottomAnchor");
  v188 = objc_msgSend(v148, "view");
  if (v188)
  {
    v189 = v188;
    v190 = objc_msgSend(v188, "bottomAnchor");

    v191 = objc_msgSend(v187, "constraintEqualToAnchor:constant:", v190, -20.0);
    *(_QWORD *)(v176 + 48) = v191;
    v201 = v176;
    specialized Array._endMutation()(v192);
    v193 = v201;
    v194 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v193);
    objc_msgSend(v199, "activateConstraints:", v194);

LABEL_31:
    return;
  }
LABEL_50:
  __break(1u);
}

uint64_t sub_10001DCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;

  v3 = sub_10000ADD4(&qword_10003C5E0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_clientRequestStream);
  v11 = 1;
  swift_retain(v7);
  v8 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v11, v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return swift_release(v7);
}

void sub_10001DDAC(void *a1, double a2, double a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  objc_super v18;

  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  objc_msgSendSuper2(&v18, "viewWillTransitionToSize:withTransitionCoordinator:", a1, a2, a3);
  v7 = swift_allocObject(&unk_100036038, 24, 7);
  *(_QWORD *)(v7 + 16) = v3;
  v16 = sub_10001F384;
  v17 = v7;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10001E0D8;
  v15 = &unk_100036050;
  v8 = _Block_copy(&v12);
  v9 = v17;
  v10 = v3;
  swift_release(v9);
  v16 = (void (*)(uint64_t))MAGAngelContentState.hash(into:);
  v17 = 0;
  v12 = _NSConcreteStackBlock;
  v13 = 1107296256;
  v14 = sub_10001E0D8;
  v15 = &unk_100036078;
  v11 = _Block_copy(&v12);
  objc_msgSend(a1, "animateAlongsideTransition:completion:", v8, v11);
  _Block_release(v11);
  _Block_release(v8);
}

void sub_10001DED4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = *(_QWORD *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode);
  switch(v3)
  {
    case 4:
      v5 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView);
      if (v5)
        objc_msgSend(v5, "setHidden:", 1);
      v6 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView);
      if (v6)
        objc_msgSend(v6, "setHidden:", 1);
      v7 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView);
      if (v7)
        objc_msgSend(v7, "setHidden:", 1);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView), "setHidden:", 0);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView), "setHidden:", 0);
      v8 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton);
      if (v8)
        objc_msgSend(v8, "setHidden:", 0);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel), "setHidden:", 0);
      v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel);
      goto LABEL_15;
    case 3:
      v10 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView);
      if (v10)
        objc_msgSend(v10, "setHidden:", 0);
      v11 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView);
      if (v11)
        objc_msgSend(v11, "setHidden:", 0);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView), "setHidden:", 1);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView), "setHidden:", 1);
      v12 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton);
      if (v12)
        objc_msgSend(v12, "setHidden:", 1);
      objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel), "setHidden:", 1);
      v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel);
      v9 = 1;
      goto LABEL_23;
    case 2:
      v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView);
      if (v4)
      {
LABEL_15:
        v9 = 0;
LABEL_23:
        objc_msgSend(v4, "setHidden:", v9);
      }
      break;
  }
}

uint64_t sub_10001E0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

id sub_10001E194(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString v28;
  id v29;
  objc_super v31;

  v6 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_angelPreferences;
  v7 = qword_10003BED8;
  v8 = v3;
  if (v7 != -1)
    swift_once(&qword_10003BED8, sub_10000D260);
  v9 = qword_10003EB28;
  *(_QWORD *)&v3[v6] = qword_10003EB28;
  v10 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_clientRequestStream;
  v11 = qword_10003BE58;
  swift_retain(v9);
  if (v11 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v12 = qword_10003EAA8;
  *(_QWORD *)&v8[v10] = qword_10003EAA8;
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole] = 2;
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode] = 4;
  v13 = (void *)SBUISystemApertureElementIdentifierUnknown;
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierUnknown;
  v14 = &v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea;
  swift_retain(v12);
  v16 = v13;
  *(double *)&v8[v15] = sub_10001EF4C();
  v17 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView;
  v18 = (objc_class *)type metadata accessor for MAGAngelLeadingView();
  v19 = objc_allocWithZone(v18);
  *(_QWORD *)&v8[v17] = sub_10001E850(1);
  v20 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView;
  *(_QWORD *)&v8[v20] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MAGAngelTrailingView()), "init");
  v21 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView;
  v22 = objc_allocWithZone(v18);
  *(_QWORD *)&v8[v21] = sub_10001E850(1);
  v23 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  *(_QWORD *)&v8[v23] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v24 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView;
  *(_QWORD *)&v8[v24] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MAGAngelCustomTrailingView()), "init");
  v25 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  *(_QWORD *)&v8[v25] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v26 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  *(_QWORD *)&v8[v26] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = 0;
  v27 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor;
  *(_QWORD *)&v8[v27] = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");

  if (a2)
  {
    v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v28 = 0;
  }
  v31.receiver = v8;
  v31.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  v29 = objc_msgSendSuper2(&v31, "initWithNibName:bundle:", v28, a3);

  return v29;
}

id sub_10001E4A0(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  objc_super v27;

  v3 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_angelPreferences;
  v4 = qword_10003BED8;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_10003BED8, sub_10000D260);
  v6 = qword_10003EB28;
  *(_QWORD *)&v1[v3] = qword_10003EB28;
  v7 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_clientRequestStream;
  v8 = qword_10003BE58;
  swift_retain(v6);
  if (v8 != -1)
    swift_once(&qword_10003BE58, sub_10000C948);
  v9 = qword_10003EAA8;
  *(_QWORD *)&v5[v7] = qword_10003EAA8;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole] = 2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode] = 4;
  v10 = (void *)SBUISystemApertureElementIdentifierUnknown;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierUnknown;
  v11 = &v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea;
  swift_retain(v9);
  v13 = v10;
  *(double *)&v5[v12] = sub_10001EF4C();
  v14 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView;
  v15 = (objc_class *)type metadata accessor for MAGAngelLeadingView();
  v16 = objc_allocWithZone(v15);
  *(_QWORD *)&v5[v14] = sub_10001E850(1);
  v17 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView;
  *(_QWORD *)&v5[v17] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MAGAngelTrailingView()), "init");
  v18 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView;
  v19 = objc_allocWithZone(v15);
  *(_QWORD *)&v5[v18] = sub_10001E850(1);
  v20 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  *(_QWORD *)&v5[v20] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v21 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView;
  *(_QWORD *)&v5[v21] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MAGAngelCustomTrailingView()), "init");
  v22 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  *(_QWORD *)&v5[v22] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v23 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  *(_QWORD *)&v5[v23] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = 0;
  v24 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor;
  *(_QWORD *)&v5[v24] = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");

  v27.receiver = v5;
  v27.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  v25 = objc_msgSendSuper2(&v27, "initWithCoder:", a1);

  return v25;
}

id sub_10001E738()
{
  return sub_10001EED0(type metadata accessor for MAGAngelSystemApertureViewController);
}

uint64_t type metadata accessor for MAGAngelSystemApertureViewController()
{
  return objc_opt_self(_TtC14MagnifierAngel36MAGAngelSystemApertureViewController);
}

id sub_10001E850(char a1)
{
  char *v1;
  double *v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  id v10;
  NSString v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v3 = (double *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_compressedElementSize];
  v4 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  v6 = v5;
  *v3 = v4;
  v3[1] = v5;
  v7 = (double *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_customElementSize];
  v8 = MAGAngelContentState.hash(into:)(37.7, 37.7);
  *v7 = v8;
  v7[1] = v9;
  if ((a1 & 1) == 0)
  {
    v4 = v8;
    v6 = v9;
  }
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for MAGAngelLeadingView();
  v10 = objc_msgSendSuper2(&v17, "initWithFrame:", 0.0, 0.0, v4, v6);
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v11);

  if (v12)
  {
    v13 = objc_msgSend(v12, "imageWithRenderingMode:", 2);

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v13);
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v4, v6);
  v15 = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");
  objc_msgSend(v14, "setTintColor:", v15);

  objc_msgSend(v10, "addSubview:", v14);
  return v10;
}

id sub_10001EAF4()
{
  return sub_10001EED0(type metadata accessor for MAGAngelLeadingView);
}

uint64_t type metadata accessor for MAGAngelLeadingView()
{
  return objc_opt_self(_TtC14MagnifierAngel19MAGAngelLeadingView);
}

char *sub_10001EB20()
{
  char *v0;
  double *v1;
  double v2;
  double v3;
  double v4;
  char *v5;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v1 = (double *)&v0[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize];
  v2 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  v4 = v3;
  *v1 = v2;
  v1[1] = v3;
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for MAGAngelTrailingView();
  v5 = (char *)objc_msgSendSuper2(&v12, "initWithFrame:", 0.0, 0.0, v2, v4);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v7, "imageWithRenderingMode:", 2);

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v8);
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, *(double *)&v5[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize], *(double *)&v5[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize + 8]);
  v10 = objc_msgSend((id)objc_opt_self(UIColor), "systemYellowColor");
  objc_msgSend(v9, "setTintColor:", v10);

  objc_msgSend(v5, "addSubview:", v9);
  return v5;
}

id sub_10001ED84()
{
  return sub_10001EED0(type metadata accessor for MAGAngelTrailingView);
}

uint64_t type metadata accessor for MAGAngelTrailingView()
{
  return objc_opt_self(_TtC14MagnifierAngel20MAGAngelTrailingView);
}

void sub_10001EE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _swift_stdlib_reportUnimplementedInitializer(a3, a4, "init(frame:)", 12, 0);
  __break(1u);
}

id sub_10001EEC4()
{
  return sub_10001EED0(type metadata accessor for MAGAngelCustomTrailingView);
}

id sub_10001EED0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for MAGAngelCustomTrailingView()
{
  return objc_opt_self(_TtC14MagnifierAngel26MAGAngelCustomTrailingView);
}

uint64_t sub_10001EF20()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001EF44(uint64_t a1)
{
  uint64_t v1;

  return sub_10001DCE0(a1, *(_QWORD *)(v1 + 16));
}

double sub_10001EF4C()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
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
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  double v58;
  id v59;
  double v60;
  uint64_t v61;

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "preferredContentSizeCategory");

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraExtraLarge);
  v4 = v3;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v2 == v5 && v4 == v6)
    goto LABEL_13;
  v9 = v6;
  v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v5, v6, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v9);
  if ((v10 & 1) != 0)
  {
LABEL_14:

    *(double *)&v22 = 160.0;
    return *(double *)&v22;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraLarge);
  v4 = v12;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v11 == v13 && v4 == v14)
  {
LABEL_13:
    swift_bridgeObjectRelease_n(v4, 2, v7);
    goto LABEL_14;
  }
  v16 = v14;
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v4, v13, v14, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v16);
  if ((v17 & 1) != 0)
    goto LABEL_14;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraLarge);
  v4 = v19;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v21 = v20;
  if (v18 == v7 && v4 == v20)
    goto LABEL_13;
  v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v4, v7, v20, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v21);
  if ((v24 & 1) != 0)
    goto LABEL_14;
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityLarge);
  v4 = v26;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v28 = v27;
  if (v25 == v7 && v4 == v27)
    goto LABEL_13;
  v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v4, v7, v27, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v28);
  if ((v29 & 1) != 0)
    goto LABEL_14;
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityMedium);
  v32 = v31;
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v35 = v33;
  if (v30 == v34 && v32 == v33)
  {
    swift_bridgeObjectRelease_n(v32, 2, v34);
LABEL_24:

    v37 = 0x200000000000;
LABEL_25:
    v22 = v37 & 0xFFFFFFFFFFFFLL | 0x4062000000000000;
    return *(double *)&v22;
  }
  v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v32, v34, v33, 0);
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v35);
  if ((v36 & 1) != 0)
    goto LABEL_24;
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraExtraLarge);
  v40 = v39;
  v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v43 = v41;
  if (v38 == v42 && v40 == v41)
  {
    swift_bridgeObjectRelease_n(v40, 2, v42);
LABEL_30:

    v37 = 0xC00000000000;
    goto LABEL_25;
  }
  v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v40, v42, v41, 0);
  swift_bridgeObjectRelease(v40);
  swift_bridgeObjectRelease(v43);
  if ((v44 & 1) != 0)
    goto LABEL_30;
  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraLarge);
  v47 = v46;
  v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v50 = v48;
  if (v45 == v49 && v47 == v48)
  {
    swift_bridgeObjectRelease_n(v47, 2, v49);
LABEL_35:

    *(double *)&v22 = 140.0;
    return *(double *)&v22;
  }
  v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v47, v49, v48, 0);
  swift_bridgeObjectRelease(v47);
  swift_bridgeObjectRelease(v50);
  if ((v51 & 1) != 0)
    goto LABEL_35;
  v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraLarge);
  v54 = v53;
  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v61 = v55;
  if (v52 == v56 && v54 == v55)
  {
    v60 = 130.0;
  }
  else
  {
    v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v52, v54, v56, v55, 0);
    v58 = 120.0;
    if ((v57 & 1) != 0)
      v58 = 130.0;
    v60 = v58;
  }
  v59 = v1;

  swift_bridgeObjectRelease(v54);
  swift_bridgeObjectRelease(v61);
  return v60;
}

void sub_10001F384(uint64_t a1)
{
  uint64_t v1;

  sub_10001DED4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001F38C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001F39C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001F3B0(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_10002189C(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_10002194C(result, v3, 0, a1);
  swift_bridgeObjectRetain(v6);
  return v5;
}

id MAGAngelProxy.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

uint64_t static MAGAngelContentState.__derived_struct_equals(_:_:)()
{
  return 1;
}

uint64_t sub_10001F454()
{
  return 0;
}

uint64_t sub_10001F460()
{
  return 0;
}

void sub_10001F46C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001F478(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001F5B0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001F4A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001F5B0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MAGAngelContentState.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = sub_10000ADD4(&qword_10003CE48);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10001F58C(a1, v6);
  v8 = sub_10001F5B0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for MAGAngelContentState.CodingKeys, &type metadata for MAGAngelContentState.CodingKeys, v8, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

_QWORD *sub_10001F58C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001F5B0()
{
  unint64_t result;

  result = qword_10003CE50;
  if (!qword_10003CE50)
  {
    result = swift_getWitnessTable(&unk_10002B930, &type metadata for MAGAngelContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003CE50);
  }
  return result;
}

Swift::Int MAGAngelContentState.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  return Hasher._finalize()();
}

uint64_t MAGAngelContentState.init(from:)(_QWORD *a1)
{
  return sub_10001F67C(a1);
}

Swift::Int sub_10001F64C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  return Hasher._finalize()();
}

uint64_t sub_10001F67C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001F69C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F770(a1, a2, a3, &qword_10003CE48, (uint64_t (*)(void))sub_10001F5B0, (uint64_t)&type metadata for MAGAngelContentState.CodingKeys);
}

uint64_t sub_10001F6C8@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_10001F6F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000224D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001F71C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000224D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001F744(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001F770(a1, a2, a3, &qword_10003D080, (uint64_t (*)(void))sub_1000224D0, (uint64_t)&type metadata for MAGAngelAttributes.CodingKeys);
}

uint64_t sub_10001F770(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v9 = sub_10000ADD4(a4);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  sub_10001F58C(a1, v13);
  v15 = a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)(a6, a6, v15, v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10001F840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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
  uint64_t isUniquelyReferenced_nonNull_native;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[24];

  v1 = v0;
  *(_QWORD *)(v0 + 16) = &_swiftEmptyDictionarySingleton;
  v2 = (uint64_t *)(v0 + 16);
  sub_10000ADD4(&qword_10003D108);
  v3 = static Activity.activities.getter();
  if ((unint64_t)v3 >> 62)
  {
LABEL_26:
    if (v3 < 0)
      v27 = v3;
    else
      v27 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v3);
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      v29 = v1;
      v30 = v3;
      v31 = v3 & 0xC000000000000001;
      v5 = 4;
      while (1)
      {
        v8 = v5 - 4;
        if (v31)
        {
          v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, v3);
          v10 = v5 - 3;
          if (__OFADD__(v8, 1))
            goto LABEL_23;
        }
        else
        {
          v9 = *(_QWORD *)(v3 + 8 * v5);
          swift_retain(v9);
          v10 = v5 - 3;
          if (__OFADD__(v8, 1))
          {
LABEL_23:
            __break(1u);
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
        }
        v32 = v10;
        v1 = v4;
        v11 = Activity.id.getter();
        v13 = v12;
        swift_beginAccess(v2, v34, 33, 0);
        swift_retain(v9);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
        v3 = *v2;
        v33 = *v2;
        *v2 = 0x8000000000000000;
        v16 = sub_100021134(v11, v13);
        v17 = *(_QWORD *)(v3 + 16);
        v18 = (v15 & 1) == 0;
        v19 = v17 + v18;
        if (__OFADD__(v17, v18))
          goto LABEL_24;
        v20 = v15;
        if (*(_QWORD *)(v3 + 24) >= v19)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v3 = v33;
            if ((v15 & 1) != 0)
              goto LABEL_4;
          }
          else
          {
            sub_1000216E8();
            v3 = v33;
            if ((v20 & 1) != 0)
              goto LABEL_4;
          }
        }
        else
        {
          sub_100021198(v19, isUniquelyReferenced_nonNull_native);
          v21 = sub_100021134(v11, v13);
          if ((v20 & 1) != (v22 & 1))
          {
            result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
            __break(1u);
            return result;
          }
          v16 = v21;
          v3 = v33;
          if ((v20 & 1) != 0)
          {
LABEL_4:
            v6 = *(_QWORD *)(v3 + 56);
            swift_release(*(_QWORD *)(v6 + 8 * v16));
            *(_QWORD *)(v6 + 8 * v16) = v9;
            goto LABEL_5;
          }
        }
        *(_QWORD *)(v3 + 8 * (v16 >> 6) + 64) |= 1 << v16;
        v23 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
        *v23 = v11;
        v23[1] = v13;
        *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v16) = v9;
        v24 = *(_QWORD *)(v3 + 16);
        v25 = __OFADD__(v24, 1);
        v26 = v24 + 1;
        if (v25)
          goto LABEL_25;
        *(_QWORD *)(v3 + 16) = v26;
        swift_bridgeObjectRetain(v13);
LABEL_5:
        v7 = *v2;
        *v2 = v3;
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(v7);
        swift_endAccess(v34);
        swift_release(v9);
        ++v5;
        v4 = v1;
        v3 = v30;
        if (v32 == v1)
        {
          swift_bridgeObjectRelease(v30);
          return v29;
        }
      }
    }
  }
  swift_bridgeObjectRelease(v3);
  return v1;
}

void *sub_10001FAF4()
{
  uint64_t v0;
  void *result;

  v0 = type metadata accessor for ActivityStore();
  swift_allocObject(v0, 24, 7);
  result = (void *)sub_10001F840();
  off_10003CE40 = result;
  return result;
}

uint64_t sub_10001FB30()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10001FB54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for MAGAngelGateway(0);
  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_10001FB90();
  qword_10003EB58 = v1;
  return result;
}

uint64_t sub_10001FB90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v1 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  Logger.init(subsystem:category:)(0xD000000000000026, 0x80000001000310B0, 0xD00000000000001CLL, 0x8000000100031950);
  if (qword_10003BF00 != -1)
    swift_once(&qword_10003BF00, sub_10001FAF4);
  v2 = off_10003CE40;
  swift_beginAccess((char *)off_10003CE40 + 16, v13, 0, 0);
  v3 = v2[2];
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = sub_10001F3B0(v3);
    if (v5)
    {
      v6 = v4;
      v7 = v5;
      swift_bridgeObjectRetain(v3);
      v8 = sub_100021134(v6, v7);
      if ((v9 & 1) != 0)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v8);
        swift_retain(v10);
      }
      else
      {
        v10 = 0;
      }
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(v3);
      v11 = *(_QWORD *)(v1 + 16);
      *(_QWORD *)(v1 + 16) = v10;
      swift_release(v11);
    }
  }
  return v1;
}

uint64_t sub_10001FCB8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[11] = v0;
  v2 = sub_10000ADD4(&qword_10003D0F0);
  v1[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000ADD4(&qword_10003D100);
  v1[13] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[14] = v4;
  v1[15] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ActivityPresentationOptions(0);
  v1[16] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[17] = v6;
  v1[18] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001FD68, 0, 0);
}

uint64_t sub_10001FD68()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v3)(void);
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
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v40)(void);
  _QWORD *v41;
  uint64_t v42;

  v1 = v0 + 11;
  if (*(_QWORD *)(v0[11] + 16))
  {
    v40 = (uint64_t (*)(void))((char *)&dword_10003CE70 + dword_10003CE70);
    v2 = (_QWORD *)swift_task_alloc(unk_10003CE74);
    v0[19] = v2;
    *v2 = v0;
    v2[1] = sub_100020334;
    v3 = v40;
  }
  else
  {
    v4 = v0[18];
    v5 = v0[15];
    v6 = v0[12];
    v7 = sub_10000ADD4(&qword_10003D118);
    v8 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
    v9 = *(_QWORD *)(v8 - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = (v10 + 32) & ~v10;
    v12 = swift_allocObject(v7, v11 + *(_QWORD *)(v9 + 72), v10 | 7);
    *(_OWORD *)(v12 + 16) = xmmword_10002AB60;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v12 + v11, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v8);
    ActivityPresentationOptions.init(destinations:)(v12);
    sub_10000ADD4(&qword_10003D108);
    Date.init(timeIntervalSinceNow:)(1200.0);
    v13 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 0, 1, v13);
    v14 = sub_10002236C();
    v15 = sub_1000223B4();
    v16 = sub_1000223FC();
    v17 = ActivityContent.init(state:staleDate:relevanceScore:)(v16, v6, &type metadata for MAGAngelContentState, v14, v15, v16, 0.0);
    v18 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)(v17, v5, v4, 0xD000000000000026, 0x80000001000310B0, 1, &_swiftEmptyArrayStorage, 1, 0);
    v41 = v0 + 5;
    (*(void (**)(_QWORD, _QWORD))(v0[14] + 8))(v0[15], v0[13]);
    v19 = swift_retain_n(v18, 2);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v42 = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = Activity.id.getter();
      v26 = v25;
      v0[10] = sub_100025D00(v24, v25, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 10, v0 + 11, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v26);
      swift_release_n(v18, 2);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Requested activity (%s) successfully.", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

    }
    else
    {

      swift_release_n(v18, 2);
    }
    v27 = *(_QWORD *)(*v1 + 16);
    *(_QWORD *)(*v1 + 16) = v18;
    swift_retain(v18);
    swift_release(v27);
    if (qword_10003BF00 != -1)
      swift_once(&qword_10003BF00, sub_10001FAF4);
    v29 = v0[17];
    v28 = v0[18];
    v30 = v0[16];
    v31 = off_10003CE40;
    v32 = Activity.id.getter();
    v34 = v33;
    swift_beginAccess(v31 + 2, v41, 33, 0);
    swift_retain(v18);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v31[2]);
    v42 = v31[2];
    v31[2] = 0x8000000000000000;
    sub_1000214AC(v18, v32, v34, isUniquelyReferenced_nonNull_native);
    v36 = v31[2];
    v31[2] = v42;
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(v34);
    swift_endAccess(v41);
    swift_release(v18);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    v37 = v0[15];
    v38 = v0[12];
    swift_task_dealloc(v0[18]);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t sub_100020334()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100020388, 0, 0);
}

uint64_t sub_100020388()
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
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = sub_10000ADD4(&qword_10003D118);
  v5 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = swift_allocObject(v4, v8 + *(_QWORD *)(v6 + 72), v7 | 7);
  *(_OWORD *)(v9 + 16) = xmmword_10002AB60;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v9 + v8, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v5);
  ActivityPresentationOptions.init(destinations:)(v9);
  sub_10000ADD4(&qword_10003D108);
  Date.init(timeIntervalSinceNow:)(1200.0);
  v10 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 0, 1, v10);
  v11 = sub_10002236C();
  v12 = sub_1000223B4();
  v13 = sub_1000223FC();
  v14 = ActivityContent.init(state:staleDate:relevanceScore:)(v13, v3, &type metadata for MAGAngelContentState, v11, v12, v13, 0.0);
  v15 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)(v14, v2, v1, 0xD000000000000026, 0x80000001000310B0, 1, &_swiftEmptyArrayStorage, 1, 0);
  v38 = v0 + 40;
  v16 = v0 + 88;
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  v17 = swift_retain_n(v15, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    v39 = v21;
    *(_DWORD *)v20 = 136315138;
    v22 = Activity.id.getter();
    v24 = v23;
    *(_QWORD *)(v0 + 80) = sub_100025D00(v22, v23, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease(v24);
    swift_release_n(v15, 2);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Requested activity (%s) successfully.", v20, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);

  }
  else
  {

    swift_release_n(v15, 2);
  }
  v25 = *(_QWORD *)(*(_QWORD *)v16 + 16);
  *(_QWORD *)(*(_QWORD *)v16 + 16) = v15;
  swift_retain(v15);
  swift_release(v25);
  if (qword_10003BF00 != -1)
    swift_once(&qword_10003BF00, sub_10001FAF4);
  v27 = *(_QWORD *)(v0 + 136);
  v26 = *(_QWORD *)(v0 + 144);
  v28 = *(_QWORD *)(v0 + 128);
  v29 = off_10003CE40;
  v30 = Activity.id.getter();
  v32 = v31;
  swift_beginAccess(v29 + 2, v38, 33, 0);
  swift_retain(v15);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v29[2]);
  v39 = v29[2];
  v29[2] = 0x8000000000000000;
  sub_1000214AC(v15, v30, v32, isUniquelyReferenced_nonNull_native);
  v34 = v29[2];
  v29[2] = v39;
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease(v32);
  swift_endAccess(v38);
  swift_release(v15);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  v35 = *(_QWORD *)(v0 + 120);
  v36 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 144));
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100020910()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_release(v0[2]);
  v1 = (char *)v0 + OBJC_IVAR____TtC14MagnifierAngel15MAGAngelGateway_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t MAGAngelProxy.start()()
{
  return swift_task_switch(sub_10002097C, 0, 0);
}

uint64_t sub_10002097C()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v1 = (_QWORD *)swift_task_alloc(dword_10003CE64);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000B030;
  return sub_10001FCB8();
}

uint64_t sub_100020B0C(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch(sub_100020B54, 0, 0);
}

uint64_t sub_100020B54()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v1 = (_QWORD *)swift_task_alloc(dword_10003CE64);
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_100020BC8;
  return sub_10001FCB8();
}

uint64_t sub_100020BC8()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t MAGAngelProxy.finish()()
{
  return swift_task_switch(sub_100020C40, 0, 0);
}

uint64_t sub_100020C40()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v3 = (uint64_t (__cdecl *)())((char *)&dword_10003CE70 + dword_10003CE70);
  v1 = (_QWORD *)swift_task_alloc(unk_10003CE74);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000B558;
  return v3();
}

uint64_t sub_100020DDC(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch(sub_100020E24, 0, 0);
}

uint64_t sub_100020E24()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  if (qword_10003BF08 != -1)
    swift_once(&qword_10003BF08, sub_10001FB54);
  v3 = (uint64_t (__cdecl *)())((char *)&dword_10003CE70 + dword_10003CE70);
  v1 = (_QWORD *)swift_task_alloc(unk_10003CE74);
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_100022880;
  return v3();
}

id MAGAngelProxy.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return objc_msgSendSuper2(&v2, "init");
}

id MAGAngelProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100020F40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10000B558;
  return v6();
}

uint64_t sub_100020F94(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10000B558;
  return v7();
}

uint64_t sub_100020FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000B358(a1, &qword_10003CB10);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100036188, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_10003D0C8, v17);
}

unint64_t sub_100021134(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100021608(a1, a2, v5);
}

Swift::Int sub_100021198(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000ADD4(&qword_10003D110);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_retain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_1000214AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100021134(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000216E8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100021198(v15, a4 & 1);
  v21 = sub_100021134(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

unint64_t sub_100021608(uint64_t a1, uint64_t a2, uint64_t a3)
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

void *sub_1000216E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_10000ADD4(&qword_10003D110);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_retain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002189C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_10002194C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1000219A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v0[8] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[9] = v2;
  v0[10] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000ADD4(&qword_10003D0F0);
  v0[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000ADD4(&qword_10003D0F8);
  v0[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100021A48, 0, 0);
}

uint64_t sub_100021A48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;

  v1 = v0 + 16;
  if (qword_10003BF00 != -1)
LABEL_32:
    swift_once(&qword_10003BF00, sub_10001FAF4);
  v2 = off_10003CE40;
  swift_beginAccess((char *)off_10003CE40 + 16, v1, 0, 0);
  v3 = v2[2];
  *(_QWORD *)(v0 + 104) = v3;
  v4 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(v0 + 144) = v4;
  v5 = 1 << v4;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v3 + 64);
  swift_bridgeObjectRetain(v3);
  v8 = 0;
  while (v7)
  {
    v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v10 = v9 | (v8 << 6);
    result = *(_QWORD *)(v0 + 104);
LABEL_26:
    *(_QWORD *)(v0 + 112) = v7;
    *(_QWORD *)(v0 + 120) = v8;
    v17 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v10);
    v1 = *v17;
    v18 = v17[1];
    v19 = off_10003CE40;
    swift_beginAccess((char *)off_10003CE40 + 16, v0 + 40, 0, 0);
    v20 = v19[2];
    if (*(_QWORD *)(v20 + 16))
    {
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v20);
      v21 = v1;
      v1 = v20;
      v22 = sub_100021134(v21, v18);
      if ((v23 & 1) != 0)
      {
        v25 = *(_QWORD *)(v0 + 88);
        v24 = *(_QWORD *)(v0 + 96);
        v26 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v22);
        *(_QWORD *)(v0 + 128) = v26;
        swift_retain(v26);
        swift_bridgeObjectRelease(v20);
        swift_bridgeObjectRelease(v18);
        Date.init(timeIntervalSinceNow:)(1200.0);
        v27 = type metadata accessor for Date(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v25, 0, 1, v27);
        v28 = sub_10002236C();
        v29 = sub_1000223B4();
        v30 = sub_1000223FC();
        ActivityContent.init(state:staleDate:relevanceScore:)(v30, v25, &type metadata for MAGAngelContentState, v28, v29, v30, 0.0);
        v31 = sub_10000ADD4(&qword_10003D100);
        v32 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v24, 0, 1, v31);
        static ActivityUIDismissalPolicy.immediate.getter(v32);
        v37 = (char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
            + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:);
        v33 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                         + 1));
        *(_QWORD *)(v0 + 136) = v33;
        *v33 = v0;
        v33[1] = sub_100021DC4;
        return ((uint64_t (*)(_QWORD, _QWORD))v37)(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
      }
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v18);
    }
  }
  v12 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  v13 = (unint64_t)((1 << *(_BYTE *)(v0 + 144)) + 63) >> 6;
  result = *(_QWORD *)(v0 + 104);
  if (v12 >= v13)
    goto LABEL_30;
  v14 = result + 64;
  v15 = *(_QWORD *)(result + 64 + 8 * v12);
  ++v8;
  if (v15)
    goto LABEL_25;
  v8 = v12 + 1;
  if (v12 + 1 >= v13)
    goto LABEL_30;
  v15 = *(_QWORD *)(v14 + 8 * v8);
  if (v15)
    goto LABEL_25;
  v8 = v12 + 2;
  if (v12 + 2 >= v13)
    goto LABEL_30;
  v15 = *(_QWORD *)(v14 + 8 * v8);
  if (v15)
    goto LABEL_25;
  v8 = v12 + 3;
  if (v12 + 3 >= v13)
    goto LABEL_30;
  v15 = *(_QWORD *)(v14 + 8 * v8);
  if (v15)
    goto LABEL_25;
  v8 = v12 + 4;
  if (v12 + 4 >= v13)
    goto LABEL_30;
  v15 = *(_QWORD *)(v14 + 8 * v8);
  if (v15)
  {
LABEL_25:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
    goto LABEL_26;
  }
  v16 = v12 + 5;
  if (v16 >= v13)
  {
LABEL_30:
    v34 = *(_QWORD *)(v0 + 88);
    v35 = *(_QWORD *)(v0 + 96);
    v36 = *(_QWORD *)(v0 + 80);
    swift_release(result);
    swift_task_dealloc(v35);
    swift_task_dealloc(v34);
    swift_task_dealloc(v36);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v15 = *(_QWORD *)(v14 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v13)
      goto LABEL_30;
    v15 = *(_QWORD *)(v14 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_100021DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 136));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_10000B358(v2, &qword_10003D0F8);
  return swift_task_switch(sub_100021E5C, 0, 0);
}

void sub_100021E5C()
{
  uint64_t v0;
  int64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  while (v2)
  {
    v3 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    v4 = v3 | (v1 << 6);
    v5 = *(_QWORD *)(v0 + 104);
LABEL_22:
    *(_QWORD *)(v0 + 112) = v2;
    *(_QWORD *)(v0 + 120) = v1;
    v11 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v4);
    v12 = *v11;
    v13 = v11[1];
    v14 = off_10003CE40;
    swift_beginAccess((char *)off_10003CE40 + 16, v0 + 40, 0, 0);
    v15 = v14[2];
    if (*(_QWORD *)(v15 + 16))
    {
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v15);
      v16 = sub_100021134(v12, v13);
      if ((v17 & 1) != 0)
      {
        v19 = *(_QWORD *)(v0 + 88);
        v18 = *(_QWORD *)(v0 + 96);
        v20 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
        *(_QWORD *)(v0 + 128) = v20;
        swift_retain(v20);
        swift_bridgeObjectRelease(v15);
        swift_bridgeObjectRelease(v13);
        Date.init(timeIntervalSinceNow:)(1200.0);
        v21 = type metadata accessor for Date(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v19, 0, 1, v21);
        v22 = sub_10002236C();
        v23 = sub_1000223B4();
        v24 = sub_1000223FC();
        ActivityContent.init(state:staleDate:relevanceScore:)(v24, v19, &type metadata for MAGAngelContentState, v22, v23, v24, 0.0);
        v25 = sub_10000ADD4(&qword_10003D100);
        v26 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v18, 0, 1, v25);
        static ActivityUIDismissalPolicy.immediate.getter(v26);
        v31 = (char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
            + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:);
        v27 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                         + 1));
        *(_QWORD *)(v0 + 136) = v27;
        *v27 = v0;
        v27[1] = sub_100021DC4;
        ((void (*)(_QWORD, _QWORD))v31)(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
        return;
      }
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v13);
    }
  }
  v6 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  v7 = (unint64_t)((1 << *(_BYTE *)(v0 + 144)) + 63) >> 6;
  v5 = *(_QWORD *)(v0 + 104);
  if (v6 >= v7)
    goto LABEL_26;
  v8 = v5 + 64;
  v9 = *(_QWORD *)(v5 + 64 + 8 * v6);
  ++v1;
  if (v9)
    goto LABEL_21;
  v1 = v6 + 1;
  if (v6 + 1 >= v7)
    goto LABEL_26;
  v9 = *(_QWORD *)(v8 + 8 * v1);
  if (v9)
    goto LABEL_21;
  v1 = v6 + 2;
  if (v6 + 2 >= v7)
    goto LABEL_26;
  v9 = *(_QWORD *)(v8 + 8 * v1);
  if (v9)
    goto LABEL_21;
  v1 = v6 + 3;
  if (v6 + 3 >= v7)
    goto LABEL_26;
  v9 = *(_QWORD *)(v8 + 8 * v1);
  if (v9)
    goto LABEL_21;
  v1 = v6 + 4;
  if (v6 + 4 >= v7)
    goto LABEL_26;
  v9 = *(_QWORD *)(v8 + 8 * v1);
  if (v9)
  {
LABEL_21:
    v2 = (v9 - 1) & v9;
    v4 = __clz(__rbit64(v9)) + (v1 << 6);
    goto LABEL_22;
  }
  v10 = v6 + 5;
  if (v10 >= v7)
  {
LABEL_26:
    v28 = *(_QWORD *)(v0 + 88);
    v29 = *(_QWORD *)(v0 + 96);
    v30 = *(_QWORD *)(v0 + 80);
    swift_release(v5);
    swift_task_dealloc(v29);
    swift_task_dealloc(v28);
    swift_task_dealloc(v30);
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v9 = *(_QWORD *)(v8 + 8 * v10);
  if (v9)
  {
    v1 = v10;
    goto LABEL_21;
  }
  while (1)
  {
    v1 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v1 >= v7)
      goto LABEL_26;
    v9 = *(_QWORD *)(v8 + 8 * v1);
    ++v10;
    if (v9)
      goto LABEL_21;
  }
LABEL_28:
  __break(1u);
}

uint64_t type metadata accessor for MAGAngelProxy()
{
  return objc_opt_self(_TtC14MagnifierAngel13MAGAngelProxy);
}

unint64_t sub_100022188()
{
  unint64_t result;

  result = qword_10003CE78;
  if (!qword_10003CE78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MAGAngelContentState, &type metadata for MAGAngelContentState);
    atomic_store(result, (unint64_t *)&qword_10003CE78);
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGAngelContentState()
{
  return &type metadata for MAGAngelContentState;
}

uint64_t type metadata accessor for ActivityStore()
{
  return objc_opt_self(_TtC14MagnifierAngelP33_A59F198E855F9E00BC39C279848AA53013ActivityStore);
}

uint64_t sub_1000221FC()
{
  return type metadata accessor for MAGAngelGateway(0);
}

uint64_t type metadata accessor for MAGAngelGateway(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CF68;
  if (!qword_10003CF68)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MAGAngelGateway);
  return result;
}

uint64_t sub_100022240(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = "\b";
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGAngelAttributes()
{
  return &type metadata for MAGAngelAttributes;
}

ValueMetadata *type metadata accessor for MAGAngelContentState.CodingKeys()
{
  return &type metadata for MAGAngelContentState.CodingKeys;
}

unint64_t sub_1000222DC()
{
  unint64_t result;

  result = qword_10003D048;
  if (!qword_10003D048)
  {
    result = swift_getWitnessTable(&unk_10002B8B8, &type metadata for MAGAngelAttributes);
    atomic_store(result, (unint64_t *)&qword_10003D048);
  }
  return result;
}

unint64_t sub_100022324()
{
  unint64_t result;

  result = qword_10003D050;
  if (!qword_10003D050)
  {
    result = swift_getWitnessTable(&unk_10002B890, &type metadata for MAGAngelAttributes);
    atomic_store(result, (unint64_t *)&qword_10003D050);
  }
  return result;
}

unint64_t sub_10002236C()
{
  unint64_t result;

  result = qword_10003D058;
  if (!qword_10003D058)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MAGAngelContentState, &type metadata for MAGAngelContentState);
    atomic_store(result, (unint64_t *)&qword_10003D058);
  }
  return result;
}

unint64_t sub_1000223B4()
{
  unint64_t result;

  result = qword_10003D060;
  if (!qword_10003D060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MAGAngelContentState, &type metadata for MAGAngelContentState);
    atomic_store(result, (unint64_t *)&qword_10003D060);
  }
  return result;
}

unint64_t sub_1000223FC()
{
  unint64_t result;

  result = qword_10003D068;
  if (!qword_10003D068)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for MAGAngelContentState, &type metadata for MAGAngelContentState);
    atomic_store(result, (unint64_t *)&qword_10003D068);
  }
  return result;
}

unint64_t sub_100022444()
{
  unint64_t result;

  result = qword_10003D070;
  if (!qword_10003D070)
  {
    result = swift_getWitnessTable(&unk_10002B840, &type metadata for MAGAngelContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D070);
  }
  return result;
}

unint64_t sub_10002248C()
{
  unint64_t result;

  result = qword_10003D078;
  if (!qword_10003D078)
  {
    result = swift_getWitnessTable(&unk_10002B868, &type metadata for MAGAngelContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D078);
  }
  return result;
}

unint64_t sub_1000224D0()
{
  unint64_t result;

  result = qword_10003D088;
  if (!qword_10003D088)
  {
    result = swift_getWitnessTable(&unk_10002B9D0, &type metadata for MAGAngelAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D088);
  }
  return result;
}

uint64_t sub_100022518()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_10003D094);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_10000B558;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_10003D090 + dword_10003D090))(v2, v3);
}

uint64_t sub_100022580()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10003D0A4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000B558;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003D0A0 + dword_10003D0A0))(v2, v3, v4);
}

uint64_t sub_1000225FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003D0B4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000B558;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10003D0B0 + dword_10003D0B0))(a1, v4, v5, v6);
}

uint64_t sub_100022680()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000226A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003D0C4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000B030;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003D0C0 + dword_10003D0C0))(a1, v4);
}

uint64_t sub_100022718()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022744()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_10003D0D4);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_10000B558;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_10003D0D0 + dword_10003D0D0))(v2, v3);
}

uint64_t sub_1000227B0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

ValueMetadata *type metadata accessor for MAGAngelAttributes.CodingKeys()
{
  return &type metadata for MAGAngelAttributes.CodingKeys;
}

unint64_t sub_1000227F0()
{
  unint64_t result;

  result = qword_10003D120;
  if (!qword_10003D120)
  {
    result = swift_getWitnessTable(&unk_10002B980, &type metadata for MAGAngelAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D120);
  }
  return result;
}

unint64_t sub_100022838()
{
  unint64_t result;

  result = qword_10003D128;
  if (!qword_10003D128)
  {
    result = swift_getWitnessTable(&unk_10002B9A8, &type metadata for MAGAngelAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D128);
  }
  return result;
}

uint64_t type metadata accessor for MAGAngelSceneDelegate()
{
  return objc_opt_self(_TtC14MagnifierAngel21MAGAngelSceneDelegate);
}

uint64_t type metadata accessor for MAGAngelSystemApertureSceneDelegate()
{
  return objc_opt_self(_TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate);
}

void sub_100022AE4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint8_t *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v34 - v10;
  v12 = static Log.angel.getter(v9);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v35 = v4;
    v15 = swift_slowAlloc(12, -1);
    v34 = a1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    v37 = v17;
    *(_DWORD *)v16 = 136315138;
    v36 = sub_100025D00(0xD00000000000001FLL, 0x8000000100031A20, &v37);
    v4 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v16 + 4, v16 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v16;
    a1 = v34;
    swift_slowDealloc(v18, -1, -1);
  }

  v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v11, v4);
  v20 = objc_opt_self(UIWindowScene);
  v21 = swift_dynamicCastObjCClass(a1, v20);
  if (v21)
  {
    v22 = v21;
    v23 = objc_allocWithZone((Class)type metadata accessor for MAGAngelWindow());
    v24 = a1;
    v25 = objc_msgSend(v23, "initWithWindowScene:", v22);
    v26 = OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window;
    v27 = *(void **)(v2 + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window) = v25;

    v28 = *(void **)(v2 + v26);
    if (v28)
    {
      v29 = v28;
      objc_msgSend(v29, "makeKeyAndVisible");

    }
  }
  else
  {
    v30 = static Log.angel.getter(0);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "SessionSceneDelegate: Received a UIScene that is not of type UIWindowScene.", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }

    v19(v8, v4);
  }
}

void sub_100022DBC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  char *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  char *v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(char **)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v60 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v60 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v60 - v16;
  v18 = static Log.angel.getter(v15);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v64 = v2;
  v65 = v11;
  if (v21)
  {
    v22 = swift_slowAlloc(12, -1);
    v63 = (void (*)(char *, uint64_t))v4;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc(32, -1);
    v67 = v24;
    v62 = v5;
    *(_DWORD *)v23 = 136315138;
    v66 = sub_100025D00(0xD00000000000001FLL, 0x8000000100031A20, &v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v23 + 4, v23 + 12);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s", v23, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v25 = v23;
    v4 = (uint64_t)v63;
    swift_slowDealloc(v25, -1, -1);

    v26 = (void (*)(char *, uint64_t))*((_QWORD *)v62 + 1);
  }
  else
  {

    v26 = (void (*)(char *, uint64_t))*((_QWORD *)v5 + 1);
  }
  v26(v17, v4);
  v27 = type metadata accessor for ActivityScene(0);
  v28 = swift_dynamicCastClass(a1, v27);
  if (v28)
  {
    v29 = (void *)v28;
    v30 = a1;
    static Log.angel.getter(v30);
    v31 = v30;
    v32 = Logger.logObject.getter(v31);
    v33 = v14;
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = swift_slowAlloc(32, -1);
      v63 = v26;
      v61 = v36;
      v67 = v36;
      v62 = v33;
      *(_DWORD *)v35 = 136315138;
      v60 = v35 + 4;
      v37 = v4;
      v38 = objc_msgSend(v29, "description");
      v39 = v29;
      v40 = v31;
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
      v43 = v42;

      v4 = v37;
      v44 = v41;
      v31 = v40;
      v29 = v39;
      v66 = sub_100025D00(v44, v43, &v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &v67, v60, v35 + 12);

      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v32, v34, "SessionSceneDelegate: Connecting session scene: %s", v35, 0xCu);
      v45 = v61;
      swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
      v26 = v63;
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v35, -1, -1);

      v46 = v62;
      v47 = v37;
    }
    else
    {

      v46 = v33;
      v47 = v4;
    }
    v26(v46, v47);
    v52 = v65;
    v53 = objc_msgSend(v29, "SBUI_isHostedBySystemAperture");
    if ((_DWORD)v53)
    {
      v54 = static Log.angel.getter(v53);
      v55 = Logger.logObject.getter(v54);
      v56 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Returning system aperture view controller", v57, 2u);
        swift_slowDealloc(v57, -1, -1);
      }

      v26(v52, v4);
      v58 = OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider;
      v59 = v64;
      objc_msgSend(*(id *)(v64 + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider), "loadViewIfNeeded");
      objc_msgSend(v29, "setSystemApertureElementViewControllerProvider:", *(_QWORD *)(v59 + v58));
    }

  }
  else
  {
    v48 = static Log.angel.getter(0);
    v49 = Logger.logObject.getter(v48);
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v51, 2u);
      swift_slowDealloc(v51, -1, -1);
    }

    v26(v8, v4);
  }
}

uint64_t sub_1000232E4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  id v26;
  uint64_t result;
  void *v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  id v35;
  _QWORD aBlock[5];
  uint64_t v37;
  objc_super v38;

  v2 = v1;
  v33 = a1;
  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  __chkstk_darwin();
  v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v2[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection] = 0;
  v30 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_queue;
  v29[1] = sub_100026964();
  v11 = v2;
  v12 = static MAGAngelConstants.MachService.dispatchQueueLabel.getter();
  v14 = v13;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_1000269A0();
  v16 = sub_10000ADD4(&qword_10003D388);
  v17 = sub_1000269E8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v6, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v32);
  v18 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v12, v14, v10, v8, v5, 0);
  *(_QWORD *)&v2[v30] = v18;
  v19 = v33;
  *(_QWORD *)&v11[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_clientRequestStream] = v33;
  swift_retain(v19);

  v20 = (objc_class *)type metadata accessor for MAGAngelConnectionManager();
  v38.receiver = v11;
  v38.super_class = v20;
  v21 = objc_msgSendSuper2(&v38, "init");
  v35 = v21;
  v22 = swift_allocObject(&unk_1000364A0, 32, 7);
  *(_QWORD *)(v22 + 16) = sub_100026A34;
  *(_QWORD *)(v22 + 24) = &v34;
  aBlock[4] = sub_100026A78;
  v37 = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002368C;
  aBlock[3] = &unk_1000364B8;
  v23 = _Block_copy(aBlock);
  v24 = (void *)objc_opt_self(BSServiceConnectionListener);
  v25 = (char *)v21;
  swift_retain(v22);
  v26 = objc_msgSend(v24, "listenerWithConfigurator:", v23);
  _Block_release(v23);
  swift_release(v37);
  LOBYTE(v21) = swift_isEscapingClosureAtFileLocation(v22, "", 0, 0, 0, 1);

  swift_release(v19);
  result = swift_release(v22);
  if ((v21 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v28 = *(void **)&v25[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener];
    *(_QWORD *)&v25[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener] = v26;

    return (uint64_t)v25;
  }
  return result;
}

id sub_1000235F4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter();
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  objc_msgSend(a1, "setDomain:", v6);

  static MAGAngelConstants.MachService.launchAngelMachServiceID.getter();
  v8 = v7;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(a1, "setService:", v9);

  return objc_msgSend(a1, "setDelegate:", a2);
}

id sub_100023690()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener;
  v2 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener];
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = 0;

  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for MAGAngelConnectionManager();
  return objc_msgSendSuper2(&v5, "dealloc");
}

void sub_1000237C4(void *a1, char *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  void *v22;
  uint64_t v23;

  objc_msgSend(a1, "setTargetQueue:", *(_QWORD *)&a2[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_queue]);
  v4 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  objc_msgSend(a1, "setServiceQuality:", v4);

  v5 = (void *)MAGMakeServiceInterface()();
  objc_msgSend(a1, "setInterface:", v5);

  objc_msgSend(a1, "setInterfaceTarget:", a2);
  v6 = swift_allocObject(&unk_1000363B0, 24, 7);
  *(_QWORD *)(v6 + 16) = a2;
  v22 = sub_10002694C;
  v23 = v6;
  v18 = _NSConcreteStackBlock;
  v19 = 1107296256;
  v20 = sub_1000184BC;
  v21 = &unk_1000363C8;
  v7 = _Block_copy(&v18);
  v8 = v23;
  v9 = a2;
  swift_release(v8);
  objc_msgSend(a1, "setActivationHandler:", v7);
  _Block_release(v7);
  v10 = swift_allocObject(&unk_100036400, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  v22 = sub_100026954;
  v23 = v10;
  v18 = _NSConcreteStackBlock;
  v19 = 1107296256;
  v20 = sub_1000184BC;
  v21 = &unk_100036418;
  v11 = _Block_copy(&v18);
  v12 = v23;
  v13 = v9;
  swift_release(v12);
  objc_msgSend(a1, "setInvalidationHandler:", v11);
  _Block_release(v11);
  v14 = swift_allocObject(&unk_100036450, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  v22 = sub_10002695C;
  v23 = v14;
  v18 = _NSConcreteStackBlock;
  v19 = 1107296256;
  v20 = sub_1000184BC;
  v21 = &unk_100036468;
  v15 = _Block_copy(&v18);
  v16 = v23;
  v17 = v13;
  swift_release(v16);
  objc_msgSend(a1, "setInterruptionHandler:", v15);
  _Block_release(v15);
}

uint64_t sub_1000239FC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter(v5);
  v8 = a2;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v20 = v3;
    v11 = swift_slowAlloc(12, -1);
    v19 = v4;
    v12 = (uint8_t *)v11;
    v13 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    v21 = v8;
    v14 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v12 + 4, v12 + 12);
    *v13 = v8;

    v3 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ activation handler called", v12, 0xCu);
    v15 = sub_10000ADD4((uint64_t *)&unk_10003D370);
    swift_arrayDestroy(v13, 1, v15);
    swift_slowDealloc(v13, -1, -1);
    v16 = v12;
    v4 = v19;
    swift_slowDealloc(v16, -1, -1);
  }
  else
  {

    v9 = v8;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

void sub_100023BAC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter(v5);
  v8 = a2;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v20 = v3;
    v11 = swift_slowAlloc(12, -1);
    v19 = v4;
    v12 = (uint8_t *)v11;
    v13 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    v21 = v8;
    v14 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v12 + 4, v12 + 12);
    *v13 = v8;

    v3 = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ invalidation handler called", v12, 0xCu);
    v15 = sub_10000ADD4((uint64_t *)&unk_10003D370);
    swift_arrayDestroy(v13, 1, v15);
    swift_slowDealloc(v13, -1, -1);
    v16 = v12;
    v4 = v19;
    swift_slowDealloc(v16, -1, -1);
  }
  else
  {

    v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v17 = *(Class *)((char *)&v8->isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection);
  *(Class *)((char *)&v8->isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection) = 0;

}

id sub_100023D70(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject **v15;
  uint64_t v16;
  uint8_t *v17;
  NSObject **v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter(v6);
  v9 = a2;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v21 = a1;
    v12 = swift_slowAlloc(12, -1);
    v20 = v5;
    v13 = (uint8_t *)v12;
    v19 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v13 = 138412290;
    v22 = v9;
    v14 = v9;
    a1 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v13 + 4, v13 + 12);
    v15 = v19;
    *v19 = v9;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%@ interruption handler called", v13, 0xCu);
    v16 = sub_10000ADD4((uint64_t *)&unk_10003D370);
    swift_arrayDestroy(v15, 1, v16);
    swift_slowDealloc(v15, -1, -1);
    v17 = v13;
    v5 = v20;
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return objc_msgSend(a1, "activate");
}

uint64_t sub_100023F3C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t type metadata accessor for MAGAngelConnectionManager()
{
  return objc_opt_self(_TtC14MagnifierAngel25MAGAngelConnectionManager);
}

uint64_t sub_100024044()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000014, 0x8000000100031DA0, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 0;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000242A0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0x557373696D736964, 0xEB00000000292849, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 1;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100024504()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0x2928495565646968, 0xE800000000000000, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 2;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100024760()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0x4955656C67676F74, 0xEA00000000002928, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 3;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000249C0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000015, 0x8000000100031D80, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 4;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100024C20()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD00000000000001ALL, 0x8000000100031D60, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 5;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100024E80()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000017, 0x8000000100031D40, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 6;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000250E0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000015, 0x8000000100031D20, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 7;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100025340()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000019, 0x8000000100031D00, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 8;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000255A0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0xD000000000000015, 0x8000000100031CE0, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 9;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100025800()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0x6562697263736564, 0xEF2928656E656353, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 10;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100025A9C()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_10000ADD4(&qword_10003C5E0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static MAGLog.service.getter(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v23 = v2;
    v14 = swift_slowAlloc(12, -1);
    v22 = v3;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v21[1] = v1;
    v17 = v16;
    v25 = v16;
    *(_DWORD *)v15 = 136315138;
    v24 = sub_100025D00(0x65657053706F7473, 0xEC00000029286863, &v25);
    v2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Recv client message: '%s'", v15, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v15;
    v3 = v22;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  LOBYTE(v25) = 11;
  v19 = sub_10000ADD4((uint64_t *)&unk_10003CE30);
  AsyncStream.Continuation.yield(_:)(&v25, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100025D00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_100025DD0(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_100026340((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_100026340((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001F67C(v13);
  return v8;
}

uint64_t sub_100025DD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100025F88(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100025F88(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10002601C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000261F4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000261F4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10002601C(uint64_t a1, unint64_t a2)
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
      v5 = sub_100026190(v4, 0);
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

_QWORD *sub_100026190(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000ADD4(&qword_10003D308);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000261F4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000ADD4(&qword_10003D308);
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

uint64_t sub_100026340(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100026380(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  uint8_t *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t aBlock[5];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, "remoteProcess");
  static MAGAngelConstants.MachService.clientEntitlement.getter();
  v9 = v8;
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  LODWORD(v9) = objc_msgSend(v7, "hasEntitlement:", v10);

  if ((_DWORD)v9)
  {
    v12 = swift_allocObject(&unk_100036338, 24, 7);
    *(_QWORD *)(v12 + 16) = v1;
    v13 = swift_allocObject(&unk_100036360, 32, 7);
    *(_QWORD *)(v13 + 16) = sub_1000268FC;
    *(_QWORD *)(v13 + 24) = v12;
    aBlock[4] = (uint64_t)sub_100026914;
    v33 = v13;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10002368C;
    aBlock[3] = (uint64_t)&unk_100036378;
    v14 = _Block_copy(aBlock);
    v15 = v33;
    v16 = v1;
    swift_retain(v13);
    swift_release(v15);
    objc_msgSend(a1, "configureConnection:", v14);
    _Block_release(v14);
    LOBYTE(v14) = swift_isEscapingClosureAtFileLocation(v13, "", 101, 51, 40, 1);
    swift_release(v13);
    if ((v14 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(a1, "activate");
      v17 = *(void **)&v16[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection];
      *(_QWORD *)&v16[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection] = a1;
      v18 = a1;
      swift_release(v12);

    }
  }
  else
  {
    static MAGLog.service.getter(v11);
    v19 = a1;
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, (os_log_type_t)v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v31 = v3;
      aBlock[0] = v30;
      *(_DWORD *)v22 = 136315138;
      v29 = v22 + 4;
      v23 = objc_msgSend(v19, "remoteProcess");
      v24 = objc_msgSend(v23, "description");

      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
      v27 = v26;

      v34 = sub_100025D00(v25, v27, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v29, v22 + 12);

      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v21, "\"%s\" is not entitled. invalidating connection", v22, 0xCu);
      v28 = v30;
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v31);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    objc_msgSend(v19, "invalidate");
  }
}

unint64_t sub_100026714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static MAGLog.service.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v12 = v9;
    *(_DWORD *)v8 = 136315138;
    v11 = sub_100025D00(0x53746E6572727563, 0xEE00292865746174, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v8 + 4, v8 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Recv client message: '%s'", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  if (qword_10003BE50 != -1)
    swift_once(&qword_10003BE50, sub_10000BF04);
  return sub_10000C020();
}

uint64_t sub_1000268D8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000268FC(void *a1)
{
  uint64_t v1;

  sub_1000237C4(a1, *(char **)(v1 + 16));
}

uint64_t sub_100026904()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026914()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100026934(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100026944(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002694C(uint64_t a1)
{
  uint64_t v1;

  return sub_1000239FC(a1, *(void **)(v1 + 16));
}

void sub_100026954(uint64_t a1)
{
  uint64_t v1;

  sub_100023BAC(a1, *(void **)(v1 + 16));
}

id sub_10002695C(void *a1)
{
  uint64_t v1;

  return sub_100023D70(a1, *(void **)(v1 + 16));
}

unint64_t sub_100026964()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C1D8;
  if (!qword_10003C1D8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003C1D8);
  }
  return result;
}

unint64_t sub_1000269A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D380;
  if (!qword_10003D380)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10003D380);
  }
  return result;
}

unint64_t sub_1000269E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D390;
  if (!qword_10003D390)
  {
    v1 = sub_10000B24C(&qword_10003D388);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003D390);
  }
  return result;
}

id sub_100026A34(void *a1)
{
  uint64_t v1;

  return sub_1000235F4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100026A3C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100026A7C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC14MagnifierAngelP33_880FF47551DC3CEE35D5FAF68A17B65519ResourceBundleClass);
}
