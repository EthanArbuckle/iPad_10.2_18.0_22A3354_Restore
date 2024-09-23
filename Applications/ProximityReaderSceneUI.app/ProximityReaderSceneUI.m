int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  char **v12;
  uint64_t v13;
  objc_class *ObjCClassFromMetadata;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v3 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DC0 != -1)
    swift_once(&qword_100019DC0, sub_100004F5C);
  v6 = qword_10001AB80;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v7 = sub_100004748(v3, (uint64_t)qword_10001ABA0);
  sub_100004760(v7, (uint64_t)v5);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) == 1)
  {
    sub_1000047A8((uint64_t)v5);
  }
  else
  {
    sub_100008DC0(v6, 0x6574617669746361, 0xEA00000000002928, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  v10 = *(void **)(v6 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener);
  if (v10)
  {
    v11 = static CommandLine.argc.getter(objc_msgSend(v10, "activate"));
    v12 = (char **)static CommandLine.unsafeArgv.getter();
    v13 = type metadata accessor for ProximityReaderSceneUIAppDelegate();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v13);
    v15 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v15)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v17 = v16;
      v15 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v17);
    }
    UIApplicationMain(v11, v12, 0, v15);

    LODWORD(v10) = 0;
  }
  else
  {
    __break(1u);
  }
  return (int)v10;
}

uint64_t sub_100004708(uint64_t *a1)
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

uint64_t sub_100004748(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100004760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004708(&qword_100019DE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000047A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004708(&qword_100019DE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000047E8(uint64_t a1, uint64_t a2)
{
  return sub_100004AC0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004804@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004834(uint64_t a1, id *a2)
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

uint64_t sub_1000048A8(uint64_t a1, id *a2)
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

uint64_t sub_100004924@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004968(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100004CF8(&qword_100019E88, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10000FB88);
  v3 = sub_100004CF8((unint64_t *)&unk_100019E90, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10000FB28);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000049EC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004A30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100004CF8((unint64_t *)&qword_10001A3E0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_10000FC18);
  v3 = sub_100004CF8((unint64_t *)&unk_100019EA0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_10000FA14);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004AB4(uint64_t a1, uint64_t a2)
{
  return sub_100004AC0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004AC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100004AFC(uint64_t a1)
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

Swift::Int sub_100004B3C(uint64_t a1)
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

uint64_t sub_100004BAC(_QWORD *a1, uint64_t *a2)
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

void type metadata accessor for Role(uint64_t a1)
{
  sub_100004C5C(a1, &qword_100019E48, (uint64_t)&unk_100014830);
}

void type metadata accessor for STBackgroundActivityIdentifier(uint64_t a1)
{
  sub_100004C5C(a1, &qword_100019E50, (uint64_t)&unk_100014858);
}

void sub_100004C5C(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100004CA0()
{
  return sub_100004CF8(&qword_100019E58, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_10000F9DC);
}

uint64_t sub_100004CCC()
{
  return sub_100004CF8(&qword_100019E60, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_10000F9B4);
}

uint64_t sub_100004CF8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100004D38()
{
  return sub_100004CF8(&qword_100019E68, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10000FAEC);
}

uint64_t sub_100004D64()
{
  return sub_100004CF8(&qword_100019E70, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10000FAC0);
}

uint64_t sub_100004D90()
{
  return sub_100004CF8(&qword_100019E78, (uint64_t (*)(uint64_t))type metadata accessor for Role, (uint64_t)&unk_10000FB5C);
}

uint64_t sub_100004DBC()
{
  return sub_100004CF8(&qword_100019E80, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_10000FA44);
}

id sub_100004F0C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewController()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI14ViewController);
}

id sub_100004F5C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ProximityReaderSceneUI()), "init");
  qword_10001AB80 = (uint64_t)result;
  return result;
}

uint64_t sub_100004F88()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t result;
  void *v21;
  _QWORD aBlock[5];
  uint64_t v23;
  objc_super v24;

  v1 = sub_100004708(&qword_100019DE0);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle] = 0;
  v4 = (objc_class *)type metadata accessor for ProximityReaderSceneUI();
  v24.receiver = v0;
  v24.super_class = v4;
  v5 = objc_msgSendSuper2(&v24, "init");
  v6 = qword_100019DD0;
  v7 = (char *)v5;
  if (v6 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v8 = sub_100004748(v1, (uint64_t)qword_10001ABA0);
  sub_100004760(v8, (uint64_t)v3);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v3, 1, v9);
  if ((_DWORD)v11 == 1)
  {
    v12 = sub_1000047A8((uint64_t)v3);
  }
  else
  {
    v13 = Logger.logObject.getter(v11);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "ProximityReaderSceneUI server init", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    v12 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v3, v9);
  }
  __chkstk_darwin(v12);
  aBlock[-2] = v7;
  v16 = swift_allocObject(&unk_100014930, 32, 7);
  *(_QWORD *)(v16 + 16) = sub_1000059A4;
  *(_QWORD *)(v16 + 24) = &aBlock[-4];
  aBlock[4] = sub_1000059BC;
  v23 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000052FC;
  aBlock[3] = &unk_100014948;
  v17 = _Block_copy(aBlock);
  v18 = (void *)objc_opt_self(BSServiceConnectionListener);
  swift_retain(v16);
  v19 = objc_msgSend(v18, "listenerWithConfigurator:", v17);
  _Block_release(v17);
  swift_release(v23);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation(v16, "", 0, 0, 0, 1);

  result = swift_release(v16);
  if ((v17 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v21 = *(void **)&v7[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener];
    *(_QWORD *)&v7[OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_listener] = v19;

    return (uint64_t)v7;
  }
  return result;
}

id sub_100005250(void *a1, uint64_t a2)
{
  NSString v4;
  NSString v5;

  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setDomain:", v4);

  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setService:", v5);

  return objc_msgSend(a1, "setDelegate:", a2);
}

uint64_t sub_1000052FC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

id sub_1000053D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityReaderSceneUI();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProximityReaderSceneUI()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI22ProximityReaderSceneUI);
}

void sub_100005460(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  unsigned int (*v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint8_t *v25;
  id v26;
  NSString v27;
  unsigned int v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  _QWORD *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint8_t *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unsigned int (*v52)(_QWORD, _QWORD, _QWORD);
  char *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;

  v2 = v1;
  v4 = sub_100004708(&qword_100019DE0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v46 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v46 - v11;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v54 = sub_100004748(v4, (uint64_t)qword_10001ABA0);
  sub_100004760(v54, (uint64_t)v12);
  v13 = type metadata accessor for Logger(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v14 + 48);
  if (v15(v12, 1, v13) == 1)
  {
    sub_1000047A8((uint64_t)v12);
  }
  else
  {
    v52 = v15;
    v53 = v10;
    v16 = a1;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v51 = a1;
      v19 = swift_slowAlloc(12, -1);
      v50 = v2;
      v20 = (uint8_t *)v19;
      v47 = (_QWORD *)swift_slowAlloc(8, -1);
      v49 = v14;
      *(_DWORD *)v20 = 138412290;
      v55 = v16;
      v21 = v16;
      v48 = v7;
      v22 = v21;
      a1 = v51;
      v14 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v20 + 4, v20 + 12);
      v23 = v47;
      *v47 = v16;

      v7 = v48;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "ProximityReaderSceneServerHandle listener: %@", v20, 0xCu);
      v24 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v23, 1, v24);
      swift_slowDealloc(v23, -1, -1);
      v25 = v20;
      v2 = v50;
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v15 = v52;
    v10 = v53;
  }
  v26 = objc_msgSend(a1, "remoteToken");
  v27 = String._bridgeToObjectiveC()();
  v28 = objc_msgSend(v26, "hasEntitlement:", v27);

  if (v28)
  {
    sub_100004760(v54, (uint64_t)v10);
    if (v15(v10, 1, v13) == 1)
    {
      sub_1000047A8((uint64_t)v10);
    }
    else
    {
      v30 = a1;
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v50 = v2;
        v33 = swift_slowAlloc(12, -1);
        v54 = v13;
        v34 = (uint8_t *)v33;
        v35 = (_QWORD *)swift_slowAlloc(8, -1);
        v51 = a1;
        *(_DWORD *)v34 = 138412290;
        v55 = v30;
        v36 = v30;
        v49 = v14;
        v37 = v36;
        v2 = v50;
        a1 = v51;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v34 + 4, v34 + 12);
        *v35 = v30;

        v14 = v49;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "ProximityReaderSceneServerHandle accepting: %@", v34, 0xCu);
        v38 = sub_100004708(&qword_100019FE0);
        swift_arrayDestroy(v35, 1, v38);
        swift_slowDealloc(v35, -1, -1);
        v39 = v34;
        v13 = v54;
        swift_slowDealloc(v39, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
    }
    v43 = objc_allocWithZone((Class)type metadata accessor for SceneUIServerHandle());
    v44 = sub_100005B58(a1);
    v45 = *(void **)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle) = v44;

  }
  else
  {
    sub_100004760(v54, (uint64_t)v7);
    v29 = ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(v7, 1, v13);
    if ((_DWORD)v29 == 1)
    {
      sub_1000047A8((uint64_t)v7);
    }
    else
    {
      v40 = Logger.logObject.getter(v29);
      v41 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v42 = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "ProximityReaderSceneUIServer connection to service denied", v42, 2u);
        swift_slowDealloc(v42, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v14 + 8))(v7, v13);
    }
    objc_msgSend(a1, "invalidate");
  }
}

id sub_1000059A4(void *a1)
{
  uint64_t v1;

  return sub_100005250(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1000059AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000059BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000059DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000059EC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_1000059F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface);
  }
  else
  {
    v4 = sub_100005A50();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100005A50()
{
  NSString v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend((id)objc_opt_self(BSMutableServiceInterface), "interfaceWithIdentifier:", v0);

  v2 = (void *)objc_opt_self(BSObjCProtocol);
  v3 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___ProximityReaderSceneUIServerInterface);
  objc_msgSend(v1, "setServer:", v3);

  v4 = objc_msgSend(v2, "protocolForProtocol:", &OBJC_PROTOCOL___ProximityReaderSceneUIClientInterface);
  objc_msgSend(v1, "setClient:", v4);

  objc_msgSend(v1, "setClientMessagingExpectation:", 0);
  return v1;
}

uint64_t sub_100005B58(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  char *v27;
  id v28;
  uint64_t result;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v37;
  objc_super v38;

  v3 = sub_100004708(&qword_100019DE0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v34 - v7;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface] = 0;
  v9 = (objc_class *)type metadata accessor for SceneUIServerHandle();
  v38.receiver = v1;
  v38.super_class = v9;
  v10 = objc_msgSendSuper2(&v38, "init");
  v11 = qword_100019DD0;
  v12 = (char *)v10;
  if (v11 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v13 = sub_100004748(v3, (uint64_t)qword_10001ABA0);
  sub_100004760(v13, (uint64_t)v8);
  v14 = type metadata accessor for Logger(0);
  v35 = *(_QWORD *)(v14 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v16 = v15(v8, 1, v14);
  if ((_DWORD)v16 == 1)
  {
    sub_10000893C((uint64_t)v8, &qword_100019DE0);
  }
  else
  {
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "SceneUIServerHandle init", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v14);
  }
  v20 = *(void **)&v12[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection];
  *(_QWORD *)&v12[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = a1;
  v21 = a1;

  v22 = swift_allocObject(&unk_100014B10, 32, 7);
  *(_QWORD *)(v22 + 16) = v12;
  *(_QWORD *)(v22 + 24) = v21;
  v23 = swift_allocObject(&unk_100014B38, 32, 7);
  *(_QWORD *)(v23 + 16) = sub_100008AA0;
  *(_QWORD *)(v23 + 24) = v22;
  aBlock[4] = sub_1000059BC;
  v37 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000052FC;
  aBlock[3] = &unk_100014B50;
  v24 = _Block_copy(aBlock);
  v25 = v37;
  v26 = v21;
  v27 = v12;
  v28 = v26;
  swift_retain(v23);
  swift_release(v25);
  objc_msgSend(v28, "configureConnection:", v24);

  _Block_release(v24);
  LOBYTE(v24) = swift_isEscapingClosureAtFileLocation(v23, "", 106, 37, 40, 1);
  result = swift_release(v23);
  if ((v24 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_100004760(v13, (uint64_t)v6);
    v30 = v15(v6, 1, v14);
    if ((_DWORD)v30 == 1)
    {
      sub_10000893C((uint64_t)v6, &qword_100019DE0);
    }
    else
    {
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "SceneUIServerHandle connection activate", v33, 2u);
        swift_slowDealloc(v33, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v14);
    }
    objc_msgSend(v28, "activate");
    swift_release(v22);

    return (uint64_t)v27;
  }
  return result;
}

void sub_100005F5C(void *a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  void *v20;
  uint64_t v21;

  v6 = sub_1000059F4();
  objc_msgSend(a1, "setInterface:", v6);

  sub_100008850(0, &qword_10001A100, OS_dispatch_queue_ptr);
  v7 = (void *)static OS_dispatch_queue.main.getter();
  objc_msgSend(a1, "setTargetQueue:", v7);

  v8 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  objc_msgSend(a1, "setServiceQuality:", v8);

  objc_msgSend(a1, "setInterfaceTarget:", a2);
  v20 = sub_10000618C;
  v21 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_100006198;
  v19 = &unk_100014B78;
  v9 = _Block_copy(&v16);
  objc_msgSend(a1, "setActivationHandler:", v9);
  _Block_release(v9);
  v10 = swift_allocObject(&unk_100014BB0, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, a2);
  v11 = swift_allocObject(&unk_100014BD8, 32, 7);
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  v20 = sub_100008B08;
  v21 = v11;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_100006198;
  v19 = &unk_100014BF0;
  v12 = _Block_copy(&v16);
  v13 = v21;
  v14 = a3;
  swift_release(v13);
  objc_msgSend(a1, "setInvalidationHandler:", v12);
  _Block_release(v12);
  v20 = sub_10000655C;
  v21 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_100006198;
  v19 = &unk_100014C18;
  v15 = _Block_copy(&v16);
  objc_msgSend(a1, "setInterruptionHandler:", v15);
  _Block_release(v15);
}

uint64_t sub_10000618C(uint64_t a1)
{
  return sub_1000063F0(a1, "activation handler");
}

void sub_100006198(uint64_t a1, void *a2)
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

void sub_1000061E8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  char *Strong;
  void *v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[24];
  _BYTE v21[24];

  v5 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v5);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = a3 + 16;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v9 = sub_100004748(v5, (uint64_t)qword_10001ABA0);
  sub_100004760(v9, (uint64_t)v7);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10);
  if ((_DWORD)v12 == 1)
  {
    sub_10000893C((uint64_t)v7, &qword_100019DE0);
  }
  else
  {
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "invalidation handler - remote client disconnected", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v7, v10);
  }
  objc_msgSend(a2, "invalidate");
  swift_beginAccess(v8, v21, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v8);
  if (Strong)
  {
    v17 = *(void **)&Strong[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection];
    *(_QWORD *)&Strong[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection] = 0;

  }
  swift_beginAccess(v8, v20, 0, 0);
  v18 = swift_unknownObjectWeakLoadStrong(v8);
  if (v18)
  {
    v19 = (void *)v18;
    sub_10000748C((uint64_t)sub_1000063E4, 0);

  }
}

uint64_t sub_1000063E4(uint64_t a1)
{
  return sub_1000063F0(a1, "could not invalidate remote ui");
}

uint64_t sub_1000063F0(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v3 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v6 = sub_100004748(v3, (uint64_t)qword_10001ABA0);
  sub_100004760(v6, (uint64_t)v5);
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  if ((_DWORD)v9 == 1)
    return sub_10000893C((uint64_t)v5, &qword_100019DE0);
  v11 = Logger.logObject.getter(v9);
  v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, a2, v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

id sub_10000655C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v2 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v5 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v5, (uint64_t)v4);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_10000893C((uint64_t)v4, &qword_100019DE0);
  }
  else
  {
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "interruption handler", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  return objc_msgSend(a1, "activate");
}

id sub_1000066DC()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  objc_class *v12;
  objc_super v14;

  v1 = v0;
  v2 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v5 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v5, (uint64_t)v4);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_10000893C((uint64_t)v4, &qword_100019DE0);
  }
  else
  {
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "SceneUIServerHandle destroyed", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  v12 = (objc_class *)type metadata accessor for SceneUIServerHandle();
  v14.receiver = v1;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, "dealloc");
}

uint64_t sub_1000068F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, _QWORD, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _QWORD *v64;
  id v65;
  uint64_t v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  id v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int (*v77)(char *, uint64_t, uint64_t);
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t aBlock[5];
  _QWORD *v91;
  _QWORD v92[2];
  __int128 v93;
  __int128 v94;

  v5 = v4;
  v81 = a4;
  v80 = a3;
  v88 = a2;
  v79 = a1;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v86 = *(_QWORD *)(v6 - 8);
  v87 = v6;
  __chkstk_darwin(v6);
  v85 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v83 = *(_QWORD *)(v8 - 8);
  v84 = v8;
  __chkstk_darwin(v8);
  v82 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = type metadata accessor for XPCUserInfoKey(0);
  v10 = *(_QWORD *)(v76 - 8);
  __chkstk_darwin(v76);
  v12 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100004708(&qword_100019DE0);
  v14 = __chkstk_darwin(v13);
  v89 = (uint64_t)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v74 - v16;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v75 = sub_100004748(v13, (uint64_t)qword_10001ABA0);
  sub_100004760(v75, (uint64_t)v17);
  v18 = type metadata accessor for Logger(0);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 - 8);
  v77 = (unsigned int (*)(char *, uint64_t, uint64_t))*((_QWORD *)v19 + 6);
  if (v77(v17, 1, v18) == 1)
  {
    sub_10000893C((uint64_t)v17, &qword_100019DE0);
  }
  else
  {
    v20 = objc_msgSend(v88, "debugDescription");
    v21 = v18;
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    v24 = v23;

    v25 = v22;
    v18 = v21;
    sub_100008DC0(v5, 0xD00000000000002BLL, 0x8000000100012B50, v25, v24);
    swift_bridgeObjectRelease(v24);
    (*((void (**)(char *, uint64_t))v19 + 1))(v17, v21);
  }
  v26 = objc_msgSend(objc_allocWithZone((Class)SBSUIProximityReaderSceneSpecification), "init");
  v78 = objc_msgSend(v26, "uiSceneSessionRole");

  v27 = *(void **)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint);
  v28 = v88;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint) = v88;
  v74 = v28;

  v29 = *(_QWORD *)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo);
  v30 = v79;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo) = v79;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v29);
  v31 = v10;
  v32 = *(uint64_t (**)(char *, _QWORD, uint64_t))(v10 + 104);
  v33 = v76;
  v34 = v32(v12, enum case for XPCUserInfoKey.uiMode(_:), v76);
  v35 = XPCUserInfoKey.rawValue.getter(v34);
  v37 = v36;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v33);
  v92[0] = v35;
  v92[1] = v37;
  AnyHashable.init<A>(_:)(aBlock, v92, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v30 + 16) && (v38 = sub_10000875C((uint64_t)aBlock), (v39 & 1) != 0))
  {
    sub_1000089B0(*(_QWORD *)(v30 + 56) + 32 * v38, (uint64_t)&v93);
  }
  else
  {
    v93 = 0u;
    v94 = 0u;
  }
  sub_100008908((uint64_t)aBlock);
  if (*((_QWORD *)&v94 + 1))
  {
    if ((swift_dynamicCast(v92, &v93, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v40 = v19;
      v41 = v92[0];
      v42 = v41 == UIMode.rawValue.getter(1);
      v19 = v40;
      if (v42)
        v43 = 0x726575737369;
      else
        v43 = 7364980;
      if (v42)
        v44 = 0xE600000000000000;
      else
        v44 = 0xE300000000000000;
      goto LABEL_21;
    }
    v43 = 0x6E776F6E6B6E75;
  }
  else
  {
    v43 = 0x6E776F6E6B6E75;
    sub_10000893C((uint64_t)&v93, &qword_10001A130);
  }
  v44 = 0xE700000000000000;
LABEL_21:
  v45 = v89;
  sub_100004760(v75, v89);
  if (v77((char *)v45, 1, v18) == 1)
  {
    swift_bridgeObjectRelease(v44);
    sub_10000893C(v89, &qword_100019DE0);
  }
  else
  {
    v79 = v18;
    v46 = v74;
    v47 = swift_bridgeObjectRetain(v44);
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.default.getter();
    v50 = v49;
    if (os_log_type_enabled(v48, v49))
    {
      v51 = swift_slowAlloc(22, -1);
      LODWORD(v75) = v50;
      v52 = v51;
      v53 = (_QWORD *)swift_slowAlloc(8, -1);
      v76 = swift_slowAlloc(32, -1);
      aBlock[0] = v76;
      *(_DWORD *)v52 = 138412546;
      *(_QWORD *)&v93 = v46;
      v77 = v19;
      v54 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, (char *)&v93 + 8, v52 + 4, v52 + 12);
      *v53 = v88;

      *(_WORD *)(v52 + 12) = 2080;
      swift_bridgeObjectRetain(v44);
      *(_QWORD *)&v93 = sub_10000E388(v43, v44, aBlock);
      v19 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, (char *)&v93 + 8, v52 + 14, v52 + 22);
      swift_bridgeObjectRelease_n(v44, 3);
      _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v75, "activateRemoteUI ep: %@ mode: %s", (uint8_t *)v52, 0x16u);
      v55 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v53, 1, v55);
      swift_slowDealloc(v53, -1, -1);
      v56 = v76;
      swift_arrayDestroy(v76, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v52, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v44, 2);

    }
    (*((void (**)(uint64_t, uint64_t))v19 + 1))(v89, v79);
  }
  v57 = *(void **)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = 0;

  sub_100008850(0, &qword_10001A100, OS_dispatch_queue_ptr);
  v58 = (void *)static OS_dispatch_queue.main.getter();
  v59 = (_QWORD *)swift_allocObject(&unk_100014A48, 40, 7);
  v60 = v78;
  v61 = v80;
  v59[2] = v78;
  v59[3] = v61;
  v62 = v81;
  v59[4] = v81;
  aBlock[4] = (uint64_t)sub_1000089A4;
  v91 = v59;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100007354;
  aBlock[3] = (uint64_t)&unk_100014A60;
  v63 = _Block_copy(aBlock);
  v64 = v91;
  v65 = v60;
  swift_retain(v62);
  v66 = swift_release(v64);
  v67 = v82;
  static DispatchQoS.unspecified.getter(v66);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v68 = sub_100008684();
  v69 = sub_100004708(&qword_10001A110);
  v70 = sub_1000086CC();
  v71 = v85;
  v72 = v87;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v69, v70, v87, v68);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v67, v71, v63);
  _Block_release(v63);

  (*(void (**)(char *, uint64_t))(v86 + 8))(v71, v72);
  return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v67, v84);
}

uint64_t sub_1000070F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;

  v6 = type metadata accessor for UISceneSessionActivationRequest(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v13 = sub_100004748(v10, (uint64_t)qword_10001ABA0);
  sub_100004760(v13, (uint64_t)v12);
  v14 = type metadata accessor for Logger(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14);
  if ((_DWORD)v16 == 1)
  {
    sub_10000893C((uint64_t)v12, &qword_100019DE0);
  }
  else
  {
    v27 = a1;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      v26 = v6;
      v20 = a2;
      v21 = v19;
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "activateRemoteUI() activateSceneSession", v19, 2u);
      v22 = v21;
      a2 = v20;
      v6 = v26;
      swift_slowDealloc(v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    a1 = v27;
  }
  UISceneSessionActivationRequest.init(role:userActivity:options:)(a1, 0, 0);
  v23 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v24 = swift_allocObject(&unk_100014A98, 32, 7);
  *(_QWORD *)(v24 + 16) = a2;
  *(_QWORD *)(v24 + 24) = a3;
  swift_retain(a3);
  UIApplication.activateSceneSession(for:errorHandler:)(v9, sub_1000089EC, v24);

  swift_release(v24);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100007354(uint64_t a1)
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

void sub_100007440(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_10000748C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD aBlock[5];
  uint64_t v41;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v39 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for DispatchQoS(0);
  v36 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004708(&qword_100019DE0);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v34 - v15;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v35 = sub_100004748(v11, (uint64_t)qword_10001ABA0);
  sub_100004760(v35, (uint64_t)v16);
  v17 = type metadata accessor for Logger(0);
  v18 = *(_QWORD *)(v17 - 8);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v19 = v34(v16, 1, v17);
  v37 = v18;
  if (v19 == 1)
  {
    sub_10000893C((uint64_t)v16, &qword_100019DE0);
  }
  else
  {
    sub_100008DC0(v3, 0xD000000000000016, 0x8000000100012B30, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v17);
  }
  sub_100008850(0, &qword_10001A100, OS_dispatch_queue_ptr);
  v20 = (void *)static OS_dispatch_queue.main.getter();
  v21 = swift_allocObject(&unk_1000149A8, 32, 7);
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  aBlock[4] = sub_10000867C;
  v41 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007354;
  aBlock[3] = &unk_1000149C0;
  v22 = _Block_copy(aBlock);
  v23 = v41;
  swift_retain(a2);
  v24 = swift_release(v23);
  static DispatchQoS.unspecified.getter(v24);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v25 = sub_100008684();
  v26 = sub_100004708(&qword_10001A110);
  v27 = sub_1000086CC();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v26, v27, v6, v25);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v8, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v38);
  v28 = *(void **)(v3 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = 0;

  v29 = *(void **)(v3 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection);
  if (v29)
    objc_msgSend(v29, "invalidate");
  if (qword_100019DC0 != -1)
    swift_once(&qword_100019DC0, sub_100004F5C);
  v30 = qword_10001AB80;
  sub_100004760(v35, (uint64_t)v14);
  v31 = v34(v14, 1, v17);
  v32 = v37;
  if (v31 == 1)
  {
    sub_10000893C((uint64_t)v14, &qword_100019DE0);
  }
  else
  {
    sub_100008DC0(v30, 0x6164696C61766E69, 0xEC00000029286574, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v17);
  }
  v33 = *(void **)(v30 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
  *(_QWORD *)(v30 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle) = 0;

}

void sub_100007894(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  char *v63;
  uint64_t v64;
  _QWORD aBlock[5];
  uint64_t v66;
  _QWORD v67[6];

  v60 = a1;
  v61 = a2;
  v59 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v59);
  v63 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend(objc_allocWithZone((Class)SBSUIProximityReaderSceneSpecification), "init");
  v62 = objc_msgSend(v3, "uiSceneSessionRole");

  v58 = (id)objc_opt_self(UIApplication);
  v4 = objc_msgSend(v58, "sharedApplication");
  v5 = objc_msgSend(v4, "connectedScenes");

  v6 = sub_100008850(0, &qword_10001A120, UIScene_ptr);
  v7 = sub_100008888();
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v5, v6, v7);

  v54 = v6;
  if ((v8 & 0xC000000000000001) != 0)
  {
    if (v8 < 0)
      v10 = v8;
    else
      v10 = v8 & 0xFFFFFFFFFFFFFF8;
    v11 = __CocoaSet.makeIterator()(v10);
    v9 = Set.Iterator.init(_cocoa:)(v67, v11, v6, v7);
    v8 = v67[0];
    v57 = v67[1];
    v12 = v67[2];
    v13 = v67[3];
    v14 = v67[4];
  }
  else
  {
    v13 = 0;
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = *(_QWORD *)(v8 + 56);
    v57 = v8 + 56;
    v12 = ~v15;
    v17 = -v15;
    if (v17 < 64)
      v18 = ~(-1 << v17);
    else
      v18 = -1;
    v14 = v18 & v16;
  }
  v55 = v8 & 0x7FFFFFFFFFFFFFFFLL;
  v56 = (unint64_t)(v12 + 64) >> 6;
  v53 = (char *)&type metadata for Swift.AnyObject + 8;
  while (v8 < 0)
  {
    v29 = __CocoaSet.Iterator.next()(v9);
    if (!v29)
      goto LABEL_48;
    v30 = v29;
    v64 = v29;
    swift_unknownObjectRetain(v29);
    swift_dynamicCast(aBlock, &v64, v53, v54, 7);
    v25 = (id)aBlock[0];
    swift_unknownObjectRelease(v30);
    v28 = v13;
    v26 = v14;
    if (!v25)
      goto LABEL_48;
LABEL_35:
    v34 = objc_msgSend(v25, "session", v53);
    v35 = objc_msgSend(v34, "role");

    v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
    v38 = v37;
    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
    if (v36 == v39 && v38 == v40)
    {

      swift_bridgeObjectRelease_n(v38, 2);
    }
    else
    {
      v42 = v40;
      v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v38, v39, v40, 0);

      swift_bridgeObjectRelease(v38);
      swift_bridgeObjectRelease(v42);
      if ((v43 & 1) == 0)
        goto LABEL_13;
    }
    v44 = v12;
    v45 = (uint64_t)v63;
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v46 = sub_100004748(v59, (uint64_t)qword_10001ABA0);
    sub_100004760(v46, v45);
    v47 = type metadata accessor for Logger(0);
    v48 = *(_QWORD *)(v47 - 8);
    v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v45, 1, v47);
    if ((_DWORD)v49 == 1)
    {
      sub_10000893C(v45, &qword_100019DE0);
    }
    else
    {
      v50 = Logger.logObject.getter(v49);
      v51 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "invalidateRemoteUI destroying scene", v52, 2u);
        swift_slowDealloc(v52, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v48 + 8))(v63, v47);
    }
    v19 = objc_msgSend(v58, "sharedApplication");
    v20 = objc_msgSend(v25, "session");
    v21 = swift_allocObject(&unk_1000149F8, 32, 7);
    v22 = v61;
    *(_QWORD *)(v21 + 16) = v60;
    *(_QWORD *)(v21 + 24) = v22;
    aBlock[4] = sub_1000088E8;
    v66 = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006198;
    aBlock[3] = &unk_100014A10;
    v23 = _Block_copy(aBlock);
    v24 = v66;
    swift_retain(v22);
    swift_release(v24);
    objc_msgSend(v19, "requestSceneSessionDestruction:options:errorHandler:", v20, 0, v23);
    _Block_release(v23);

    v25 = v20;
    v12 = v44;
LABEL_13:

    v13 = v28;
    v14 = v26;
  }
  if (v14)
  {
    v26 = (v14 - 1) & v14;
    v27 = __clz(__rbit64(v14)) | (v13 << 6);
    v28 = v13;
LABEL_34:
    v25 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v27);
    if (!v25)
      goto LABEL_48;
    goto LABEL_35;
  }
  v31 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v31 >= v56)
      goto LABEL_48;
    v32 = *(_QWORD *)(v57 + 8 * v31);
    v28 = v13 + 1;
    if (!v32)
    {
      v28 = v13 + 2;
      if (v13 + 2 >= v56)
        goto LABEL_48;
      v32 = *(_QWORD *)(v57 + 8 * v28);
      if (!v32)
      {
        v28 = v13 + 3;
        if (v13 + 3 >= v56)
          goto LABEL_48;
        v32 = *(_QWORD *)(v57 + 8 * v28);
        if (!v32)
        {
          v28 = v13 + 4;
          if (v13 + 4 >= v56)
            goto LABEL_48;
          v32 = *(_QWORD *)(v57 + 8 * v28);
          if (!v32)
          {
            v33 = v13 + 5;
            while (v56 != v33)
            {
              v32 = *(_QWORD *)(v57 + 8 * v33++);
              if (v32)
              {
                v28 = v33 - 1;
                goto LABEL_33;
              }
            }
LABEL_48:
            sub_1000088E0(v8);

            return;
          }
        }
      }
    }
LABEL_33:
    v26 = (v32 - 1) & v32;
    v27 = __clz(__rbit64(v32)) + (v28 << 6);
    goto LABEL_34;
  }
  __break(1u);
}

uint64_t sub_100007E9C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, const char *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  uint8_t *v21;
  uint64_t *v22;
  const char *v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v24 = a2;
  v6 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v9 = sub_100004748(v6, (uint64_t)qword_10001ABA0);
  sub_100004760(v9, (uint64_t)v8);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_10000893C((uint64_t)v8, &qword_100019DE0);
  }
  else
  {
    swift_errorRetain(a1);
    v12 = swift_errorRetain(a1);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v23 = a4;
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v15 = 138412290;
      v21 = v15 + 4;
      swift_errorRetain(a1);
      v16 = _swift_stdlib_bridgeErrorToNSError(a1);
      v25 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v21, v15 + 12);
      v17 = v22;
      *v22 = v16;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v23, v15, 0xCu);
      v18 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v17, 1, v18);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v15, -1, -1);

    }
    else
    {

      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v24(a1);
}

BOOL sub_1000082B4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene);
  if (v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v5 = objc_msgSend(a1, "session");
    v9[4] = sub_1000083B4;
    v9[5] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_100006198;
    v9[3] = &unk_100014970;
    v6 = _Block_copy(v9);
    objc_msgSend(v4, "requestSceneSessionDestruction:options:errorHandler:", v5, 0, v6);
    _Block_release(v6);

  }
  else
  {
    *(_QWORD *)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene) = a1;
    v7 = a1;
  }
  return v3 == 0;
}

uint64_t sub_1000083B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v5 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v5, (uint64_t)v4);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
    return sub_10000893C((uint64_t)v4, &qword_100019DE0);
  swift_errorRetain(a1);
  v9 = swift_errorRetain(a1);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    swift_errorRetain(a1);
    v13 = _swift_stdlib_bridgeErrorToNSError(a1);
    v17 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v12 + 4, v12 + 12);
    v14 = v16;
    *v16 = v13;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "~~~~ Could not close scene %@", v12, 0xCu);
    v15 = sub_100004708(&qword_100019FE0);
    swift_arrayDestroy(v14, 1, v15);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v4, v6);
}

uint64_t type metadata accessor for SceneUIServerHandle()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI19SceneUIServerHandle);
}

uint64_t sub_100008640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008650(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100008658()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000867C()
{
  uint64_t v0;

  sub_100007894(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_100008684()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A108;
  if (!qword_10001A108)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001A108);
  }
  return result;
}

unint64_t sub_1000086CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A118;
  if (!qword_10001A118)
  {
    v1 = sub_100008718(&qword_10001A110);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001A118);
  }
  return result;
}

uint64_t sub_100008718(uint64_t *a1)
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

unint64_t sub_10000875C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000878C(a1, v4);
}

unint64_t sub_10000878C(uint64_t a1, uint64_t a2)
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
      sub_100008A0C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008908((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100008850(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_100008888()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A128;
  if (!qword_10001A128)
  {
    v1 = sub_100008850(255, &qword_10001A120, UIScene_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001A128);
  }
  return result;
}

uint64_t sub_1000088E0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000088E8(uint64_t a1)
{
  uint64_t v1;

  return sub_100007E9C(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), "~~~~ Could not close scene %@");
}

uint64_t sub_100008908(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000893C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004708(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008978()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000089A4()
{
  uint64_t v0;

  return sub_1000070F4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1000089B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000089EC(uint64_t a1)
{
  uint64_t v1;

  return sub_100007E9C(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), "Could not open scene %@");
}

uint64_t sub_100008A0C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008A48()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100008A6C(uint64_t a1)
{
  uint64_t v1;

  sub_100007440(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100008A74()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100008AA0(void *a1)
{
  uint64_t v1;

  sub_100005F5C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100008AA8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008AB8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008ADC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100008B08(uint64_t a1)
{
  uint64_t v1;

  sub_1000061E8(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100008B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004708(&qword_100019DE0);
  sub_100008CD8(v0, qword_10001AB88);
  v1 = sub_100004748(v0, (uint64_t)qword_10001AB88);
  Logger.init(subsystem:category:)(0xD000000000000019, 0x8000000100012C80, 0x4955706154, 0xE500000000000000);
  v2 = type metadata accessor for Logger(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100008BF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004708(&qword_100019DE0);
  sub_100008CD8(v0, qword_10001ABA0);
  v1 = sub_100004748(v0, (uint64_t)qword_10001ABA0);
  Logger.init(subsystem:category:)(0xD000000000000019, 0x8000000100012C80, 0x4955656E656353, 0xE700000000000000);
  v2 = type metadata accessor for Logger(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100008C8C()
{
  uint64_t result;

  result = MCGestaltIsInternalBuild();
  byte_10001ABB8 = result;
  return result;
}

uint64_t sub_100008CA8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for PRLoggers()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI9PRLoggers);
}

uint64_t *sub_100008CD8(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100008D18(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    result = String.index(_:offsetBy:limitedBy:)(v4 | (v3 << 16), -(uint64_t)result, 15, a2, a3);
    if ((v5 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

void sub_100008DC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t ObjectType;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;

  if (qword_100019DD8 != -1)
    swift_once(&qword_100019DD8, sub_100008C8C);
  if (byte_10001ABB8 == 1)
  {
    v10 = HIBYTE(a5) & 0xF;
    if ((a5 & 0x2000000000000000) == 0)
      v10 = a4 & 0xFFFFFFFFFFFFLL;
    if (v10)
    {
      v43 = a2;
      v44 = a3;
      swift_bridgeObjectRetain(a3);
      v11._countAndFlagsBits = 8250;
      v11._object = (void *)0xE200000000000000;
      String.append(_:)(v11);
      v12._countAndFlagsBits = a4;
      v12._object = (void *)a5;
      String.append(_:)(v12);
    }
    else
    {
      swift_bridgeObjectRetain(a3);
    }
    v13 = ObjectIdentifier.debugDescription.getter(a1);
    v15 = v14;
    v43 = v13;
    v44 = v14;
    ObjectType = 41;
    v42 = 0xE100000000000000;
    v40[0] = 0;
    v40[1] = 0xE000000000000000;
    v16 = sub_100009160();
    v17 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&ObjectType, v40, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v16, v16, v16);
    v19 = v18;
    swift_bridgeObjectRelease(v15);
    v20 = sub_100008D18(8uLL, v17, v19);
    v22 = v21;
    v39 = v23;
    v25 = v24;
    swift_bridgeObjectRelease(v19);
    swift_unknownObjectRetain_n(a1, 2);
    swift_bridgeObjectRetain(v25);
    v26 = swift_bridgeObjectRetain(a3);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc(32, -1);
      v38 = swift_slowAlloc(96, -1);
      v43 = v38;
      *(_DWORD *)v29 = 136381187;
      ObjectType = swift_getObjectType(a1, v30);
      v31 = sub_100004708(&qword_10001A298);
      v32 = String.init<A>(describing:)(&ObjectType, v31);
      v34 = v33;
      ObjectType = sub_10000E388(v32, v33, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&ObjectType, &v42, v29 + 4, v29 + 12);
      swift_unknownObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v34);
      *(_WORD *)(v29 + 12) = 2081;
      swift_bridgeObjectRetain(v25);
      v35 = static String._fromSubstring(_:)(v20, v22, v39, v25);
      v37 = v36;
      swift_bridgeObjectRelease(v25);
      ObjectType = sub_10000E388(v35, v37, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&ObjectType, &v42, v29 + 14, v29 + 22);
      swift_bridgeObjectRelease_n(v25, 2);
      swift_bridgeObjectRelease(v37);
      *(_WORD *)(v29 + 22) = 2081;
      swift_bridgeObjectRetain(a3);
      ObjectType = sub_10000E388(a2, a3, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&ObjectType, &v42, v29 + 24, v29 + 32);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "(o)%{private}s-%{private}s.%{private}s", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy(v38, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(a3, 2);
      swift_bridgeObjectRelease_n(v25, 2);
      swift_unknownObjectRelease_n(a1, 2);
    }

  }
}

unint64_t sub_100009160()
{
  unint64_t result;

  result = qword_10001A290;
  if (!qword_10001A290)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001A290);
  }
  return result;
}

uint64_t sub_1000091A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;

  v1 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v4 = sub_100004748(v1, (uint64_t)qword_10001ABA0);
  sub_100004760(v4, (uint64_t)v3);
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5) == 1)
    return sub_10000893C((uint64_t)v3, &qword_100019DE0);
  v8 = v0;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    *(_DWORD *)v11 = 136315138;
    v19 = v11 + 4;
    v20 = *(id *)&v8[OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action];
    v21 = v12;
    v13 = v20;
    v14 = sub_100004708(&qword_10001A370);
    v15 = String.init<A>(describing:)(&v20, v14);
    v17 = v16;
    v20 = (id)sub_10000E388(v15, v16, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v19, v11 + 12);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "TapUISceneActionHandler - Received action: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v3, v5);
}

uint64_t sub_1000094C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;

  v4[3] = a4;
  v5 = sub_100004708(&qword_100019DE0);
  v4[4] = v5;
  v6 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[5] = swift_task_alloc(v6);
  v4[6] = swift_task_alloc(v6);
  v4[7] = swift_task_alloc(v6);
  return swift_task_switch(sub_100009540, 0, 0);
}

uint64_t sub_100009540()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);

  type metadata accessor for AppManager(0);
  v1 = static AppManager.shared.getter();
  v2 = (int *)dispatch thunk of AppManager.callHandler.getter();
  v4 = v3;
  swift_release(v1);
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 72) = v4;
  if (v2)
  {
    v19 = (uint64_t (*)(void))((char *)v2 + *v2);
    v5 = (_QWORD *)swift_task_alloc(v2[1]);
    *(_QWORD *)(v0 + 80) = v5;
    *v5 = v0;
    v5[1] = sub_10000972C;
    return v19();
  }
  else
  {
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v7 = *(_QWORD *)(v0 + 48);
    v8 = sub_100004748(*(_QWORD *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100004760(v8, v7);
    v9 = type metadata accessor for Logger(0);
    v10 = *(_QWORD *)(v9 - 8);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9);
    v12 = *(_QWORD *)(v0 + 48);
    if (v11 == 1)
    {
      sub_10000893C(v12, &qword_100019DE0);
    }
    else
    {
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "BSAction activity can't continue, ignore", v15, 2u);
        swift_slowDealloc(v15, -1, -1);
      }
      v16 = *(_QWORD *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v16, v9);
    }
    objc_msgSend(*(id *)(v0 + 24), "setProceed:", 0);
    v17 = *(_QWORD *)(v0 + 48);
    v18 = *(_QWORD *)(v0 + 40);
    swift_task_dealloc(*(_QWORD *)(v0 + 56));
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000972C(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 80);
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100009A60;
  }
  else
  {
    *(_BYTE *)(v4 + 96) = a1 & 1;
    v6 = sub_1000097A4;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000097A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (*(_BYTE *)(v0 + 96) == 1)
  {
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v1 = *(_QWORD *)(v0 + 56);
    v2 = sub_100004748(*(_QWORD *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100004760(v2, v1);
    v3 = type metadata accessor for Logger(0);
    v4 = *(_QWORD *)(v3 - 8);
    v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3);
    v6 = *(_QWORD *)(v0 + 56);
    if (v5 == 1)
    {
      sub_10000893C(v6, &qword_100019DE0);
    }
    else
    {
      v13 = Logger.logObject.getter(v6);
      v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "BSAction activity handling success, proceed ", v15, 2u);
        swift_slowDealloc(v15, -1, -1);
      }
      v16 = *(_QWORD *)(v0 + 56);

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v3);
    }
    v17 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 72);
    objc_msgSend(*(id *)(v0 + 24), "setProceed:", 1);
    sub_10000C138(v17, v18);
  }
  else
  {
    sub_10000C138(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v7 = *(_QWORD *)(v0 + 48);
    v8 = sub_100004748(*(_QWORD *)(v0 + 32), (uint64_t)qword_10001ABA0);
    sub_100004760(v8, v7);
    v9 = type metadata accessor for Logger(0);
    v10 = *(_QWORD *)(v9 - 8);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9);
    v12 = *(_QWORD *)(v0 + 48);
    if (v11 == 1)
    {
      sub_10000893C(v12, &qword_100019DE0);
    }
    else
    {
      v19 = Logger.logObject.getter(v12);
      v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "BSAction activity can't continue, ignore", v21, 2u);
        swift_slowDealloc(v21, -1, -1);
      }
      v22 = *(_QWORD *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v22, v9);
    }
    objc_msgSend(*(id *)(v0 + 24), "setProceed:", 0);
  }
  v23 = *(_QWORD *)(v0 + 48);
  v24 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v18;

  sub_10000C138(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v1 = *(_QWORD *)(v0 + 40);
  v2 = sub_100004748(*(_QWORD *)(v0 + 32), (uint64_t)qword_10001ABA0);
  sub_100004760(v2, v1);
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3) == 1)
  {
    sub_10000893C(*(_QWORD *)(v0 + 40), &qword_100019DE0);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 88);
    swift_errorRetain(v5);
    v6 = swift_errorRetain(v5);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.default.getter();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(_QWORD *)(v0 + 88);
    if (v9)
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v11 = 138412290;
      swift_errorRetain(v10);
      v12 = _swift_stdlib_bridgeErrorToNSError(v10);
      *(_QWORD *)(v0 + 16) = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v11 + 4, v11 + 12);
      *v18 = v12;
      swift_errorRelease(v10);
      swift_errorRelease(v10);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "BSAction activity handling failed, do not proceed, thrown %@", v11, 0xCu);
      v13 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v18, 1, v13);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {

      swift_errorRelease(v10);
      swift_errorRelease(v10);
    }
    (*(void (**)(_QWORD, uint64_t))(v4 + 8))(*(_QWORD *)(v0 + 40), v3);
  }
  v14 = *(_QWORD *)(v0 + 88);
  objc_msgSend(*(id *)(v0 + 24), "setProceed:", 0);
  swift_errorRelease(v14);
  v15 = *(_QWORD *)(v0 + 48);
  v16 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009CBC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000893C(a1, &qword_10001A348);
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
  v17 = swift_allocObject(&unk_100014CA0, 32, 7);
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
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_10001A380, v17);
}

uint64_t sub_100009E08()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = sub_100004708(&qword_100019DE0);
  v0[3] = v1;
  v2 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[4] = swift_task_alloc(v2);
  v0[5] = swift_task_alloc(v2);
  v0[6] = swift_task_alloc(v2);
  return swift_task_switch(sub_100009E80, 0, 0);
}

uint64_t sub_100009E80()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);

  type metadata accessor for AppManager(0);
  v1 = static AppManager.shared.getter();
  v2 = (int *)dispatch thunk of AppManager.homeButtonHandler.getter();
  v4 = v3;
  swift_release(v1);
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = v4;
  if (v2)
  {
    v19 = (uint64_t (*)(void))((char *)v2 + *v2);
    v5 = (_QWORD *)swift_task_alloc(v2[1]);
    *(_QWORD *)(v0 + 72) = v5;
    *v5 = v0;
    v5[1] = sub_10000A058;
    return v19();
  }
  else
  {
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = sub_100004748(*(_QWORD *)(v0 + 24), (uint64_t)qword_10001ABA0);
    sub_100004760(v8, v7);
    v9 = type metadata accessor for Logger(0);
    v10 = *(_QWORD *)(v9 - 8);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9);
    v12 = *(_QWORD *)(v0 + 40);
    if (v11 == 1)
    {
      sub_10000893C(v12, &qword_100019DE0);
    }
    else
    {
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "BSAction button can't continue, ignore", v15, 2u);
        swift_slowDealloc(v15, -1, -1);
      }
      v16 = *(_QWORD *)(v0 + 40);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v16, v9);
    }
    v17 = *(_QWORD *)(v0 + 40);
    v18 = *(_QWORD *)(v0 + 32);
    swift_task_dealloc(*(_QWORD *)(v0 + 48));
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000A058(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_10000A350;
  }
  else
  {
    *(_BYTE *)(v4 + 88) = a1 & 1;
    v6 = sub_10000A0D0;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_10000A0D0()
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
  int v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (*(_BYTE *)(v0 + 88) != 1)
  {
    sub_10000C138(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = sub_100004748(*(_QWORD *)(v0 + 24), (uint64_t)qword_10001ABA0);
    sub_100004760(v8, v7);
    v3 = type metadata accessor for Logger(0);
    v4 = *(_QWORD *)(v3 - 8);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3);
    v10 = *(_QWORD *)(v0 + 40);
    if (v9 == 1)
    {
      sub_10000893C(v10, &qword_100019DE0);
      goto LABEL_17;
    }
    v11 = Logger.logObject.getter(v10);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v15, "BSAction button can't continue, ignore", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }
    v14 = *(_QWORD *)(v0 + 40);
LABEL_16:

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v3);
    goto LABEL_17;
  }
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v1 = *(_QWORD *)(v0 + 48);
  v2 = sub_100004748(*(_QWORD *)(v0 + 24), (uint64_t)qword_10001ABA0);
  sub_100004760(v2, v1);
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3);
  if ((_DWORD)v5 != 1)
  {
    v11 = Logger.logObject.getter(v5);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "BSAction button handling success, proceed ", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }
    v14 = *(_QWORD *)(v0 + 48);
    sub_10000C138(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
    goto LABEL_16;
  }
  v6 = *(_QWORD *)(v0 + 48);
  sub_10000C138(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  sub_10000893C(v6, &qword_100019DE0);
LABEL_17:
  v17 = *(_QWORD *)(v0 + 40);
  v18 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v19;
  NSObject *log;

  sub_10000C138(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v1 = *(_QWORD *)(v0 + 32);
  v2 = sub_100004748(*(_QWORD *)(v0 + 24), (uint64_t)qword_10001ABA0);
  sub_100004760(v2, v1);
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, 1, v3);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 32);
  if (v5 == 1)
  {
    swift_errorRelease(*(_QWORD *)(v0 + 80));
    sub_10000893C(v7, &qword_100019DE0);
  }
  else
  {
    swift_errorRetain(*(_QWORD *)(v0 + 80));
    v8 = swift_errorRetain(v6);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 80);
    if (v11)
    {
      log = v9;
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v13 = 138412290;
      swift_errorRetain(v12);
      v14 = _swift_stdlib_bridgeErrorToNSError(v12);
      *(_QWORD *)(v0 + 16) = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v13 + 4, v13 + 12);
      *v19 = v14;
      swift_errorRelease(v12);
      swift_errorRelease(v12);
      _os_log_impl((void *)&_mh_execute_header, log, v10, "BSAction button handling failed, do not proceed, thrown %@", v13, 0xCu);
      v15 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v19, 1, v15);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v13, -1, -1);
      swift_errorRelease(v12);

    }
    else
    {
      swift_errorRelease(*(_QWORD *)(v0 + 80));

      swift_errorRelease(v12);
      swift_errorRelease(v12);
    }
    (*(void (**)(_QWORD, uint64_t))(v4 + 8))(*(_QWORD *)(v0 + 32), v3);
  }
  v16 = *(_QWORD *)(v0 + 40);
  v17 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000A5F0(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for TapUISceneActionHandler()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI23TapUISceneActionHandler);
}

unint64_t sub_10000A654()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A330;
  if (!qword_10001A330)
  {
    v1 = objc_opt_self(BSAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A330);
  }
  return result;
}

unint64_t sub_10000A690()
{
  unint64_t result;
  unint64_t v1;

  result = qword_10001A338;
  if (!qword_10001A338)
  {
    v1 = sub_10000A654();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001A338);
  }
  return result;
}

uint64_t sub_10000A6D8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000A73C;
  return v6(a1);
}

uint64_t sub_10000A73C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000A788(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_10000A654();
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_10000AA04(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_10000ABE8(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10000AE84((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_10000A654();
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10000AF04((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_10000AA04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100004708(&qword_10001A340);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000A654();
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10000ABE8(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()(result);
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10000ABE8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100004708(&qword_10001A340);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10000AE84(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_10000AF04(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10000ABE8(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10000B078();
      goto LABEL_14;
    }
    sub_10000B220(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10000A654();
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_10000B078()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100004708(&qword_10001A340);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000B220(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100004708(&qword_10001A340);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000B498(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint8_t *v47;
  _DWORD *v48;
  _DWORD *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  _DWORD *v59;
  id v60;
  id v61;
  int v62;
  id v63;
  uint64_t v64;

  v2 = v1;
  v4 = sub_100004708(&qword_10001A348);
  __chkstk_darwin(v4);
  v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004708(&qword_100019DE0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v58 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v58 - v14;
  v16 = objc_opt_self(SBUIBackgroundActivityAction);
  v17 = swift_dynamicCastObjCClass(a1, v16);
  if (v17)
  {
    v18 = v17;
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v19 = sub_100004748(v7, (uint64_t)qword_10001ABA0);
    sub_100004760(v19, (uint64_t)v15);
    v20 = type metadata accessor for Logger(0);
    v21 = *(_QWORD *)(v20 - 8);
    v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v15, 1, v20);
    if ((_DWORD)v22 == 1)
    {
      sub_10000893C((uint64_t)v15, &qword_100019DE0);
    }
    else
    {
      v31 = Logger.logObject.getter(v22);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "BSAction: SBUIBackgroundActivityAction received", v33, 2u);
        swift_slowDealloc(v33, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v20);
    }
    v34 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v6, 1, 1, v34);
    v35 = (_QWORD *)swift_allocObject(&unk_100014C78, 40, 7);
    v35[2] = 0;
    v35[3] = 0;
    v35[4] = v18;
    v36 = a1;
    v37 = sub_100009CBC((uint64_t)v6, (uint64_t)&unk_10001A368, (uint64_t)v35);
    swift_release(v37);
LABEL_27:
    v56 = *(void **)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action) = a1;
    v57 = a1;

    sub_1000091A4();
    return 1;
  }
  v23 = objc_opt_self(SBUIButtonAction);
  v24 = swift_dynamicCastObjCClass(a1, v23);
  v25 = qword_100019DD0;
  if (v24)
  {
    v26 = (void *)v24;
    v27 = a1;
    if (v25 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v28 = sub_100004748(v7, (uint64_t)qword_10001ABA0);
    sub_100004760(v28, (uint64_t)v13);
    v29 = type metadata accessor for Logger(0);
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v13, 1, v29) == 1)
    {
      sub_10000893C((uint64_t)v13, &qword_100019DE0);
    }
    else
    {
      v43 = v27;
      v44 = Logger.logObject.getter(v43);
      v45 = static os_log_type_t.default.getter();
      v62 = v45;
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(12, -1);
        v60 = v43;
        v47 = v46;
        v61 = v27;
        *(_DWORD *)v46 = 134217984;
        v48 = v46 + 12;
        v59 = v46 + 4;
        v63 = objc_msgSend(v26, "buttonEvents");
        v49 = v48;
        v27 = v61;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v59, v49);

        _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v62, "BSAction: SBUIButtonAction received, %lu", v47, 0xCu);
        swift_slowDealloc(v47, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v29);
    }
    v53 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v6, 1, 1, v53);
    v54 = swift_allocObject(&unk_100014C50, 32, 7);
    *(_QWORD *)(v54 + 16) = 0;
    *(_QWORD *)(v54 + 24) = 0;
    v55 = sub_100009CBC((uint64_t)v6, (uint64_t)&unk_10001A358, v54);
    swift_release(v55);

    goto LABEL_27;
  }
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v38 = sub_100004748(v7, (uint64_t)qword_10001ABA0);
  sub_100004760(v38, (uint64_t)v10);
  v39 = type metadata accessor for Logger(0);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v10, 1, v39);
  if ((_DWORD)v41 == 1)
  {
    sub_10000893C((uint64_t)v10, &qword_100019DE0);
    return 0;
  }
  else
  {
    v50 = Logger.logObject.getter(v41);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Unknown action", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v39);
    return 0;
  }
}

id sub_10000BA28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v51;
  id v52;
  os_log_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60[5];

  v6 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v6);
  v8 = (uint64_t)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
LABEL_45:
    swift_once(&qword_100019DD0, sub_100008BF0);
  v9 = sub_100004748(v6, (uint64_t)qword_10001ABA0);
  sub_100004760(v9, v8);
  v10 = type metadata accessor for Logger(0);
  v55 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v8, 1, v10) == 1)
  {
    sub_10000893C(v8, &qword_100019DE0);
  }
  else
  {
    swift_bridgeObjectRetain_n(a1, 2);
    v11 = (id)a2;
    v12 = a3;
    v13 = v11;
    a2 = (uint64_t)v12;
    v14 = Logger.logObject.getter(a2);
    v15 = static os_log_type_t.default.getter();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v17 = swift_slowAlloc(32, -1);
      v52 = (id)a2;
      a2 = v17;
      v18 = (_QWORD *)swift_slowAlloc(16, -1);
      v54 = swift_slowAlloc(32, -1);
      v60[0] = v54;
      *(_DWORD *)a2 = 136315650;
      v53 = v14;
      v19 = sub_10000A654();
      v20 = sub_10000A690();
      v21 = swift_bridgeObjectRetain(a1);
      v22 = Set.description.getter(v21, v19, v20);
      v24 = v23;
      swift_bridgeObjectRelease(a1);
      v59 = (id)sub_10000E388(v22, v24, v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, v60, a2 + 4, a2 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(a2 + 12) = 2112;
      v59 = v13;
      v25 = v13;
      HIDWORD(v51) = v16;
      v26 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, v60, a2 + 14, a2 + 22);
      *v18 = v13;

      *(_WORD *)(a2 + 22) = 2112;
      v59 = v52;
      v27 = v52;
      v28 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, v60, a2 + 24, a2 + 32);
      v18[1] = v27;

      v14 = v53;
      _os_log_impl((void *)&_mh_execute_header, v53, BYTE4(v51), "TapUISceneActionHandler:  Responding to BSActions:%s, for fbsScene %@ uiScene %@", (uint8_t *)a2, 0x20u);
      v29 = sub_100004708(&qword_100019FE0);
      swift_arrayDestroy(v18, 2, v29);
      swift_slowDealloc(v18, -1, -1);
      v30 = v54;
      swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(a2, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n(a1, 2);
    }

    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v8, v10);
  }
  v59 = &_swiftEmptySetSingleton;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v31 = a1;
    else
      v31 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v32 = __CocoaSet.makeIterator()(v31);
    v33 = sub_10000A654();
    v34 = sub_10000A690();
    v35 = Set.Iterator.init(_cocoa:)(v60, v32, v33, v34);
    a1 = v60[0];
    v6 = v60[1];
    v8 = v60[2];
    v36 = v60[3];
    v37 = v60[4];
  }
  else
  {
    v38 = -1 << *(_BYTE *)(a1 + 32);
    v6 = a1 + 56;
    v8 = ~v38;
    v39 = -v38;
    if (v39 < 64)
      v40 = ~(-1 << v39);
    else
      v40 = -1;
    v37 = v40 & *(_QWORD *)(a1 + 56);
    v35 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v36 = 0;
  }
  v54 = v8;
  v55 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  a3 = (void *)((unint64_t)(v8 + 64) >> 6);
  while (a1 < 0)
  {
    v43 = __CocoaSet.Iterator.next()(v35);
    if (!v43)
      goto LABEL_43;
    v44 = v43;
    v57 = v43;
    v45 = sub_10000A654();
    swift_unknownObjectRetain(v44);
    swift_dynamicCast(&v58, &v57, (char *)&type metadata for Swift.AnyObject + 8, v45, 7);
    v46 = v58;
    swift_unknownObjectRelease(v44);
    a2 = v36;
    v41 = v37;
    if (!v46)
      goto LABEL_43;
LABEL_41:
    v8 = v56;
    if ((sub_10000B498(v46) & 1) != 0)
    {

    }
    else
    {
      v8 = (uint64_t)&v59;
      sub_10000A788((Swift::Int *)&v58, v46);

    }
    v36 = a2;
    v37 = v41;
  }
  if (v37)
  {
    v41 = (v37 - 1) & v37;
    v42 = __clz(__rbit64(v37)) | (v36 << 6);
    a2 = v36;
    goto LABEL_40;
  }
  v47 = v36 + 1;
  if (__OFADD__(v36, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v47 >= (uint64_t)a3)
    goto LABEL_43;
  v48 = *(_QWORD *)(v6 + 8 * v47);
  a2 = v36 + 1;
  if (v48)
    goto LABEL_39;
  a2 = v36 + 2;
  if (v36 + 2 >= (uint64_t)a3)
    goto LABEL_43;
  v48 = *(_QWORD *)(v6 + 8 * a2);
  if (v48)
    goto LABEL_39;
  a2 = v36 + 3;
  if (v36 + 3 >= (uint64_t)a3)
    goto LABEL_43;
  v48 = *(_QWORD *)(v6 + 8 * a2);
  if (v48)
    goto LABEL_39;
  a2 = v36 + 4;
  if (v36 + 4 >= (uint64_t)a3)
    goto LABEL_43;
  v48 = *(_QWORD *)(v6 + 8 * a2);
  if (v48)
  {
LABEL_39:
    v41 = (v48 - 1) & v48;
    v42 = __clz(__rbit64(v48)) + (a2 << 6);
LABEL_40:
    v46 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v42);
    if (!v46)
      goto LABEL_43;
    goto LABEL_41;
  }
  v49 = v36 + 5;
  while (a3 != (void *)v49)
  {
    v48 = *(_QWORD *)(v6 + 8 * v49++);
    if (v48)
    {
      a2 = v49 - 1;
      goto LABEL_39;
    }
  }
LABEL_43:
  sub_1000088E0(a1);
  return v59;
}

uint64_t sub_10000BFD0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BFF4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10001A354);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000C058;
  return sub_100009E08();
}

uint64_t sub_10000C058()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000C0A0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C0CC(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10001A364);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000C1DC;
  return sub_1000094C4(a1, v4, v5, v6);
}

uint64_t sub_10000C138(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000C148()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C16C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001A37C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000C058;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001A378 + dword_10001A378))(a1, v4);
}

uint64_t sub_10000C228(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v5 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v5, (uint64_t)v4);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) == 1)
    return sub_1000047A8((uint64_t)v4);
  swift_errorRetain(a1);
  v9 = swift_errorRetain(a1);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    swift_errorRetain(a1);
    v13 = _swift_stdlib_bridgeErrorToNSError(a1);
    v17 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v12 + 4, v12 + 12);
    v14 = v16;
    *v16 = v13;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not destroy scene %@", v12, 0xCu);
    v15 = sub_100004708(&qword_100019FE0);
    swift_arrayDestroy(v14, 1, v15);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v4, v6);
}

void sub_10000C460(void *a1)
{
  Class isa;

  objc_msgSend(a1, "setDesiredHardwareButtonEvents:", 16);
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_10000DEC0();
  isa = Set._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a1, "setDesiredBackgroundActivities:", isa);

}

void sub_10000C4DC(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

void sub_10000C648(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v9 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = qword_100019DD0;
  v13 = a3;
  v14 = a1;
  if (v12 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v15 = sub_100004748(v9, (uint64_t)qword_10001ABA0);
  sub_100004760(v15, (uint64_t)v11);
  v16 = type metadata accessor for Logger(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v11, 1, v16) == 1)
  {
    sub_1000047A8((uint64_t)v11);
  }
  else
  {
    sub_100008DC0((uint64_t)v14, a4, a5, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v16);
  }

}

id sub_10000C810()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TapUISceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TapUISceneDelegate()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI18TapUISceneDelegate);
}

void *sub_10000C898(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  Swift::Int v12;
  void *result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100004708(&qword_10001A3E8);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v38 = v1;
    v39 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v39 + 8 * v4);
      v7 = *(_QWORD *)(v3 + 40);
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v10 = v9;
      Hasher.init(_seed:)(v40, v7);
      v11 = v6;
      String.hash(into:)(v40, v8, v10);
      v12 = Hasher._finalize()();
      result = (void *)swift_bridgeObjectRelease(v10);
      v14 = -1 << *(_BYTE *)(v3 + 32);
      v15 = v12 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
        v21 = v20;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        if (v19 == v22 && v21 == v23)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v21, 2);
LABEL_4:

          goto LABEL_5;
        }
        v25 = v23;
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v22, v23, 0);
        swift_bridgeObjectRelease(v21);
        result = (void *)swift_bridgeObjectRelease(v25);
        if ((v26 & 1) != 0)
          goto LABEL_4;
        v27 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v27;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)(v5 + 8 * (v15 >> 6));
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15));
          v21 = v29;
          v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
          if (v28 == v30 && v21 == v31)
            goto LABEL_3;
          v33 = v31;
          v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v21, v30, v31, 0);
          swift_bridgeObjectRelease(v21);
          result = (void *)swift_bridgeObjectRelease(v33);
          if ((v34 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v16) = v18 | v17;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15) = v11;
      v35 = *(_QWORD *)(v3 + 16);
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v37;
LABEL_5:
      if (++v4 == v38)
        return (void *)v3;
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_10000CAC4(id a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  void **v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  char *v30;
  void **v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  uint8_t *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t inited;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void **v81;
  id v82;
  NSArray v83;
  objc_class *ObjCClassFromMetadata;
  NSString *v85;
  char *v86;
  uint8_t *v87;
  NSString *v88;
  uint64_t v89;
  id v90;
  uint8_t *v91;
  uint64_t v92;
  _QWORD *v93;
  id v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void **v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  void **v104;
  _QWORD *v105;
  uint8_t *v106;
  uint64_t v107;
  char *v108;
  int v109;
  char *v110;
  char *v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  id v115;
  id v116;
  void *v117;
  uint64_t v118;
  int v119;
  char *v120;
  id v121;
  void *v122;
  char *v123;
  uint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  void *v128;
  NSObject *v129;
  os_log_type_t v130;
  _BOOL4 v131;
  uint8_t *v132;
  void *v133;
  char *v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  _QWORD *v138;
  char *v139;
  os_log_type_t v140;
  uint8_t *v141;
  uint64_t v142;
  uint8_t *v143;
  _QWORD *v144;
  char *v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  uint8_t *v151;
  char *v152;
  char *v153;
  _QWORD *v154;
  uint8_t *v155;
  char v156[120];
  void **aBlock;
  uint64_t v158;
  void (*v159)(uint64_t, void *);
  void *v160;
  uint64_t (*v161)();
  uint64_t v162;

  v3 = v2;
  ObjectType = swift_getObjectType(v2, a2);
  v6 = sub_100004708(&qword_100019DE0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v144 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (uint8_t *)&v144 - v11;
  v13 = __chkstk_darwin(v10);
  v153 = (char *)&v144 - v14;
  v15 = __chkstk_darwin(v13);
  v152 = (char *)&v144 - v16;
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v144 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v144 - v20;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v154 = (_QWORD *)sub_100004748(v6, (uint64_t)qword_10001ABA0);
  sub_100004760((uint64_t)v154, (uint64_t)v21);
  v22 = type metadata accessor for Logger(0);
  v23 = *(_QWORD **)(v22 - 8);
  v155 = (uint8_t *)v23[6];
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v155)(v21, 1, v22) == 1)
  {
    sub_1000047A8((uint64_t)v21);
  }
  else
  {
    v151 = v12;
    v150 = a1;
    v24 = (void **)a1;
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v145 = v9;
      v27 = swift_slowAlloc(12, -1);
      v147 = v22;
      v28 = (uint8_t *)v27;
      v29 = swift_slowAlloc(8, -1);
      v146 = v23;
      v144 = (_QWORD *)v29;
      v149 = v3;
      v148 = ObjectType;
      *(_DWORD *)v28 = 138412290;
      aBlock = v24;
      v30 = v19;
      v31 = v24;
      v9 = v145;
      v32 = v148;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v158, v28 + 4, v28 + 12);
      v33 = v144;
      *v144 = v24;

      v19 = v30;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "TapUISceneDelegate:scene() with: %@", v28, 0xCu);
      v34 = sub_100004708(&qword_100019FE0);
      v35 = v33;
      ObjectType = v32;
      v3 = v149;
      swift_arrayDestroy(v35, 1, v34);
      v23 = v146;
      swift_slowDealloc(v35, -1, -1);
      v36 = v28;
      v22 = v147;
      swift_slowDealloc(v36, -1, -1);
    }
    else
    {

    }
    ((void (*)(char *, uint64_t))v23[1])(v21, v22);
    v12 = v151;
    a1 = v150;
  }
  v37 = objc_opt_self(UIWindowScene);
  v38 = swift_dynamicCastObjCClass(a1, v37);
  if (!v38)
  {
    sub_100004760((uint64_t)v154, (uint64_t)v9);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v155)(v9, 1, v22) != 1)
    {
      v100 = (void **)a1;
      v101 = Logger.logObject.getter(v100);
      v102 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v101, v102))
      {
        v103 = (uint8_t *)swift_slowAlloc(12, -1);
        v154 = (_QWORD *)swift_slowAlloc(8, -1);
        v155 = v103;
        *(_DWORD *)v103 = 138412290;
        aBlock = v100;
        v104 = v100;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v158, v103 + 4, v103 + 12);
        v105 = v154;
        *v154 = v100;

        v106 = v155;
        _os_log_impl((void *)&_mh_execute_header, v101, v102, "TapUISceneDelegate:scene() Got a non UIWindowScene: %@", v155, 0xCu);
        v107 = sub_100004708(&qword_100019FE0);
        swift_arrayDestroy(v105, 1, v107);
        swift_slowDealloc(v105, -1, -1);
        swift_slowDealloc(v106, -1, -1);
      }
      else
      {

      }
      ((void (*)(char *, uint64_t))v23[1])(v9, v22);
      return;
    }
    v98 = (uint64_t)v9;
LABEL_21:
    sub_1000047A8(v98);
    return;
  }
  v39 = (void *)v38;
  v40 = qword_100019DC0;
  v41 = (char *)a1;
  if (v40 != -1)
    swift_once(&qword_100019DC0, sub_100004F5C);
  v42 = *(char **)(qword_10001AB80 + OBJC_IVAR____TtC22ProximityReaderSceneUI22ProximityReaderSceneUI_handle);
  if (!v42)
  {
    sub_100004760((uint64_t)v154, (uint64_t)v12);
    v99 = ((uint64_t (*)(uint8_t *, uint64_t, uint64_t))v155)(v12, 1, v22);
    if ((_DWORD)v99 == 1)
    {
      sub_1000047A8((uint64_t)v12);
    }
    else
    {
      v112 = Logger.logObject.getter(v99);
      v113 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v112, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v114 = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "TapUISceneDelegate:scene() Unusable scene handle = nil", v114, 2u);
        swift_slowDealloc(v114, -1, -1);
      }

      ((void (*)(uint8_t *, uint64_t))v23[1])(v12, v22);
    }
    v115 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v116 = objc_msgSend(v39, "session");
    v161 = sub_10000C224;
    v162 = 0;
    aBlock = _NSConcreteStackBlock;
    v158 = 1107296256;
    v159 = sub_100006198;
    v160 = &unk_100014CB8;
    v117 = _Block_copy(&aBlock);
    objc_msgSend(v115, "requestSceneSessionDestruction:options:errorHandler:", v116, 0, v117);
    _Block_release(v117);

    goto LABEL_46;
  }
  v43 = *(void **)&v42[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint];
  if (!v43)
  {
    v108 = v153;
    sub_100004760((uint64_t)v154, (uint64_t)v153);
    v109 = ((uint64_t (*)(char *, uint64_t, uint64_t))v155)(v108, 1, v22);
    v110 = v42;
    v111 = v110;
    if (v109 == 1)
    {
      sub_1000047A8((uint64_t)v108);
    }
    else
    {
      v125 = Logger.logObject.getter(v110);
      v126 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v125, v126))
      {
        v127 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v127 = 0;
        _os_log_impl((void *)&_mh_execute_header, v125, v126, "TapUISceneDelegate:scene() Unusable scene endpoint = nil", v127, 2u);
        swift_slowDealloc(v127, -1, -1);
      }

      ((void (*)(char *, uint64_t))v23[1])(v108, v22);
    }
    v115 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v116 = objc_msgSend(v39, "session");
    v161 = sub_10000C224;
    v162 = 0;
    aBlock = _NSConcreteStackBlock;
    v158 = 1107296256;
    v159 = sub_100006198;
    v160 = &unk_100014CE0;
    v128 = _Block_copy(&aBlock);
    objc_msgSend(v115, "requestSceneSessionDestruction:options:errorHandler:", v116, 0, v128);
    _Block_release(v128);

    goto LABEL_46;
  }
  v153 = v41;
  v44 = *(_QWORD *)&v42[OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_userInfo];
  if (!v44)
  {
    v118 = (uint64_t)v152;
    sub_100004760((uint64_t)v154, (uint64_t)v152);
    v119 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v155)(v118, 1, v22);
    v120 = v42;
    v121 = v43;
    v122 = v121;
    if (v119 == 1)
    {
      sub_1000047A8(v118);
      v123 = v153;
    }
    else
    {
      v129 = Logger.logObject.getter(v121);
      v130 = static os_log_type_t.error.getter();
      v131 = os_log_type_enabled(v129, v130);
      v123 = v153;
      if (v131)
      {
        v132 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v132 = 0;
        _os_log_impl((void *)&_mh_execute_header, v129, v130, "TapUISceneDelegate:scene() Unusable scene userInfo = nil", v132, 2u);
        swift_slowDealloc(v132, -1, -1);
      }

      ((void (*)(uint64_t, uint64_t))v23[1])(v118, v22);
    }
    v115 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v116 = objc_msgSend(v39, "session");
    v161 = sub_10000C224;
    v162 = 0;
    aBlock = _NSConcreteStackBlock;
    v158 = 1107296256;
    v159 = sub_100006198;
    v160 = &unk_100014D08;
    v133 = _Block_copy(&aBlock);
    objc_msgSend(v115, "requestSceneSessionDestruction:options:errorHandler:", v116, 0, v133);
    _Block_release(v133);

LABEL_46:
    return;
  }
  v152 = v19;
  v45 = v42;
  v46 = v43;
  swift_bridgeObjectRetain(v44);
  if (!sub_1000082B4(v39))
  {
    swift_bridgeObjectRelease(v44);
    v124 = (uint64_t)v152;
    sub_100004760((uint64_t)v154, (uint64_t)v152);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v155)(v124, 1, v22) != 1)
    {
      v155 = v45;
      v134 = v153;
      v135 = Logger.logObject.getter(v134);
      v136 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v135, v136))
      {
        v153 = v134;
        v137 = (uint8_t *)swift_slowAlloc(12, -1);
        v138 = (_QWORD *)swift_slowAlloc(8, -1);
        v154 = v46;
        v151 = v137;
        *(_DWORD *)v137 = 138412290;
        aBlock = (void **)v39;
        v139 = v153;
        v46 = v154;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v158, v137 + 4, v137 + 12);
        *v138 = v39;

        v134 = v153;
        v140 = v136;
        v141 = v151;
        _os_log_impl((void *)&_mh_execute_header, v135, v140, "TapUISceneDelegate:scene() Duplicate scene: %@", v151, 0xCu);
        v142 = sub_100004708(&qword_100019FE0);
        swift_arrayDestroy(v138, 1, v142);
        swift_slowDealloc(v138, -1, -1);
        swift_slowDealloc(v141, -1, -1);
        v143 = v155;
      }
      else
      {

        v143 = (uint8_t *)v134;
      }

      ((void (*)(char *, uint64_t))v23[1])(v152, v22);
      return;
    }

    v98 = v124;
    goto LABEL_21;
  }
  v147 = v44;
  v155 = v45;
  v148 = ObjectType;
  v154 = v46;
  v149 = v3;
  v146 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v39);
  v47 = sub_100004708(&qword_10001A3C8);
  inited = swift_initStackObject(v47, v156);
  *(_OWORD *)(inited + 16) = xmmword_10000FD50;
  v49 = (void *)STBackgroundActivityIdentifierInCall;
  *(_QWORD *)(inited + 32) = STBackgroundActivityIdentifierInCall;
  v152 = (char *)(inited + 32);
  v50 = (void *)STBackgroundActivityIdentifierInVideoConference;
  v51 = (void *)STBackgroundActivityIdentifierCallRinging;
  *(_QWORD *)(inited + 40) = STBackgroundActivityIdentifierInVideoConference;
  *(_QWORD *)(inited + 48) = v51;
  v52 = (void *)STBackgroundActivityIdentifierVideoConferenceRinging;
  v53 = (void *)STBackgroundActivityIdentifierSharePlay;
  *(_QWORD *)(inited + 56) = STBackgroundActivityIdentifierVideoConferenceRinging;
  *(_QWORD *)(inited + 64) = v53;
  v54 = (void *)STBackgroundActivityIdentifierSharePlayInactive;
  v55 = (void *)STBackgroundActivityIdentifierActivePushToTalkCall;
  *(_QWORD *)(inited + 72) = STBackgroundActivityIdentifierSharePlayInactive;
  *(_QWORD *)(inited + 80) = v55;
  v56 = (void *)STBackgroundActivityIdentifierIdlePushToTalkCall;
  v57 = (void *)STBackgroundActivityIdentifierCallHandoff;
  *(_QWORD *)(inited + 88) = STBackgroundActivityIdentifierIdlePushToTalkCall;
  *(_QWORD *)(inited + 96) = v57;
  v150 = (id)STBackgroundActivityIdentifierCallScreening;
  v58 = STBackgroundActivityIdentifierVideoConferenceHandoff;
  v151 = (uint8_t *)STBackgroundActivityIdentifierVideoConferenceHandoff;
  *(_QWORD *)(inited + 104) = STBackgroundActivityIdentifierCallScreening;
  *(_QWORD *)(inited + 112) = v58;
  v59 = v49;
  v60 = v50;
  v61 = v51;
  v62 = v52;
  v63 = v53;
  v64 = v54;
  v65 = v55;
  v66 = v56;
  v67 = v57;
  v68 = v150;
  v69 = v151;
  v70 = sub_10000C898(inited);
  swift_setDeallocating(inited);
  type metadata accessor for STBackgroundActivityIdentifier(0);
  swift_arrayDestroy(v152, 11, v71);
  v72 = objc_msgSend(v39, "_FBSScene");
  v73 = swift_allocObject(&unk_100014D40, 24, 7);
  *(_QWORD *)(v73 + 16) = v70;
  v74 = swift_allocObject(&unk_100014D68, 32, 7);
  *(_QWORD *)(v74 + 16) = sub_10000DEA8;
  *(_QWORD *)(v74 + 24) = v73;
  v161 = sub_1000059BC;
  v162 = v74;
  aBlock = _NSConcreteStackBlock;
  v158 = 1107296256;
  v159 = sub_10000C4DC;
  v160 = &unk_100014D80;
  v75 = _Block_copy(&aBlock);
  v76 = v162;
  swift_retain(v74);
  swift_release(v76);
  objc_msgSend(v72, "updateClientSettingsWithBlock:", v75);

  _Block_release(v75);
  LOBYTE(v72) = swift_isEscapingClosureAtFileLocation(v74, "", 112, 67, 52, 1);
  swift_release(v74);
  if ((v72 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v77 = sub_100004708(&qword_10001A3D0);
    v78 = swift_allocObject(v77, 40, 7);
    *(_OWORD *)(v78 + 16) = xmmword_10000FD60;
    v79 = v149;
    v80 = *(void **)(v149 + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_actionHandler);
    *(_QWORD *)(v78 + 32) = v80;
    aBlock = (void **)v78;
    specialized Array._endMutation()();
    v81 = aBlock;
    v82 = v80;
    sub_100004708(&qword_10001A3D8);
    v83.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v81);
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v148);
    v85 = NSStringFromClass(ObjCClassFromMetadata);
    v86 = v153;
    v87 = v155;
    if (v85)
    {
      v88 = v85;
      objc_msgSend(v39, "_registerBSActionResponderArray:forKey:", v83.super.isa, v85);

      v89 = type metadata accessor for TapRemoteSceneController(0);
      v90 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v89)), "init");
      v91 = v87;
      v92 = v147;
      v93 = v154;
      dispatch thunk of TapRemoteSceneController.setup(scene:userInfo:endpoint:handle:)(v86, v147, v154, v91);

      swift_bridgeObjectRelease(v92);
      v94 = v146;
      objc_msgSend(v146, "setRootViewController:", v90);
      objc_msgSend(v94, "setContentsPosition:", 0);
      v95 = OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window;
      v96 = *(void **)(v79 + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window);
      *(_QWORD *)(v79 + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window) = v94;
      v97 = v94;

      objc_msgSend(*(id *)(v79 + v95), "setRootViewController:", v90);
      objc_msgSend(v97, "makeKeyAndVisible");
      swift_release(v73);

      return;
    }
  }
  __break(1u);
}

void sub_10000DB48()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_100004708(&qword_100019DE0);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v28 - v7;
  __chkstk_darwin(v6);
  v10 = (char *)&v28 - v9;
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v11 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v11, (uint64_t)v10);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v10, 1, v12) == 1)
  {
    sub_1000047A8((uint64_t)v10);
  }
  else
  {
    sub_100008DC0(v1, 0xD000000000000016, 0x8000000100012E10, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  v15 = *(void **)(v1 + OBJC_IVAR____TtC22ProximityReaderSceneUI18TapUISceneDelegate_window);
  if (v15)
  {
    v16 = objc_msgSend(v15, "rootViewController");
    if (v16)
    {
      v17 = v16;
      v18 = type metadata accessor for TapRemoteSceneController(0);
      if (swift_dynamicCastClass(v17, v18))
      {
        sub_100004760(v11, (uint64_t)v8);
        v19 = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v8, 1, v12);
        if ((_DWORD)v19 == 1)
        {
          v20 = sub_1000047A8((uint64_t)v8);
        }
        else
        {
          v25 = Logger.logObject.getter(v19);
          v26 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v25, v26))
          {
            v27 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v27 = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, v26, "TapUISceneDelegate:scene() didDisconnect: CLEANUP!!!", v27, 2u);
            swift_slowDealloc(v27, -1, -1);
          }

          v20 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v8, v12);
        }
        dispatch thunk of TapRemoteSceneController.disconnected()(v20);

        return;
      }

    }
  }
  sub_100004760(v11, (uint64_t)v5);
  v21 = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v5, 1, v12);
  if ((_DWORD)v21 == 1)
  {
    sub_1000047A8((uint64_t)v5);
  }
  else
  {
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "TapUISceneDelegate:scene() didDisconnect: cannot get root controller", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  }
}

uint64_t sub_10000DE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000DE7C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000DE84()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000DEA8(void *a1)
{
  sub_10000C460(a1);
}

uint64_t sub_10000DEB0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000DEC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A3E0;
  if (!qword_10001A3E0)
  {
    type metadata accessor for STBackgroundActivityIdentifier(255);
    result = swift_getWitnessTable(&unk_10000FC18, v1);
    atomic_store(result, (unint64_t *)&qword_10001A3E0);
  }
  return result;
}

id sub_10000DFDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProximityReaderSceneUIAppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProximityReaderSceneUIAppDelegate()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI33ProximityReaderSceneUIAppDelegate);
}

id sub_10000E02C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  id v13;
  NSString v14;
  id v15;
  uint64_t v17;

  v2 = sub_100004708(&qword_100019DE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019DD0 != -1)
    swift_once(&qword_100019DD0, sub_100008BF0);
  v5 = sub_100004748(v2, (uint64_t)qword_10001ABA0);
  sub_100004760(v5, (uint64_t)v4);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_1000047A8((uint64_t)v4);
  }
  else
  {
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "ProximityReaderSceneUIApplicationDelegate: SBUIProximityReader Configuration", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }
  v12 = objc_msgSend(a1, "role");
  v13 = objc_allocWithZone((Class)UISceneConfiguration);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithName:sessionRole:", v14, v12);

  return v15;
}

id sub_10000E328()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DefaultSceneDelegate()
{
  return objc_opt_self(_TtC22ProximityReaderSceneUI20DefaultSceneDelegate);
}

uint64_t sub_10000E388(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_10000E458(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_1000089B0((uint64_t)v13, *a3);
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
      sub_1000089B0((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000EF0C(v13);
  return v8;
}

uint64_t sub_10000E458(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000E610(a5, a6);
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

uint64_t sub_10000E610(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000E6A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000E87C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000E87C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000E6A4(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000E818(v4, 0);
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

_QWORD *sub_10000E818(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004708((uint64_t *)&unk_10001A570);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000E87C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004708((uint64_t *)&unk_10001A570);
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

void sub_10000E9C8(void (**a1)(char *, uint64_t), void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void (**v36)(char *, uint64_t);
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void (**v44)(char *, uint64_t);
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  _QWORD *v49;
  void (**v50)(char *, uint64_t);
  uint64_t v51;
  _QWORD *v52;
  uint8_t *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  unsigned int (*v59)(_QWORD, _QWORD, _QWORD);
  void (**v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v3 = v2;
  v6 = sub_100004708(&qword_100019DE0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v53 - v10;
  if (qword_100019DC8 != -1)
    swift_once(&qword_100019DC8, sub_100008B58);
  v12 = sub_100004748(v6, (uint64_t)qword_10001AB88);
  sub_100004760(v12, (uint64_t)v11);
  v13 = type metadata accessor for Logger(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v14 + 48);
  if (v15(v11, 1, v13) == 1)
  {
    sub_1000047A8((uint64_t)v11);
  }
  else
  {
    v59 = v15;
    v60 = a1;
    v16 = a2;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc(12, -1);
      v58 = v9;
      v20 = (uint8_t *)v19;
      v55 = swift_slowAlloc(32, -1);
      v62 = v55;
      v57 = v3;
      *(_DWORD *)v20 = 136315138;
      v21 = v20 + 12;
      v53 = v20 + 4;
      v54 = v20;
      v22 = v14;
      v23 = objc_msgSend(v16, "role");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v56 = v13;
      v26 = v25;

      v14 = v22;
      v61 = sub_10000E388(v24, v26, &v62);
      v27 = v21;
      v3 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62, v53, v27);

      v28 = v26;
      v13 = v56;
      swift_bridgeObjectRelease(v28);
      v29 = v54;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "DefaultSceneDelegate: Scene will connect called with role: %s", v54, 0xCu);
      v30 = v55;
      swift_arrayDestroy(v55, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      v31 = v29;
      v9 = v58;
      swift_slowDealloc(v31, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    v15 = v59;
    a1 = v60;
  }
  v32 = objc_opt_self(UIWindowScene);
  v33 = swift_dynamicCastObjCClass(a1, v32);
  if (v33)
  {
    v34 = v33;
    v35 = objc_allocWithZone((Class)UIWindow);
    v36 = a1;
    v37 = objc_msgSend(v35, "initWithWindowScene:", v34);
    v38 = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
    v39 = objc_msgSend(v38, "view");
    if (v39)
    {
      v40 = v39;
      v41 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
      objc_msgSend(v40, "setBackgroundColor:", v41);

      objc_msgSend(v37, "setRootViewController:", v38);
      objc_msgSend(v37, "makeKeyAndVisible");
      v42 = *(void **)(v3 + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window);
      *(_QWORD *)(v3 + OBJC_IVAR____TtC22ProximityReaderSceneUI20DefaultSceneDelegate_window) = v37;

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_100019DD0 != -1)
      swift_once(&qword_100019DD0, sub_100008BF0);
    v43 = sub_100004748(v6, (uint64_t)qword_10001ABA0);
    sub_100004760(v43, (uint64_t)v9);
    if (v15(v9, 1, v13) == 1)
    {
      sub_1000047A8((uint64_t)v9);
    }
    else
    {
      v60 = (void (**)(char *, uint64_t))v14;
      v44 = a1;
      v45 = Logger.logObject.getter(v44);
      v46 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc(12, -1);
        v48 = swift_slowAlloc(8, -1);
        v58 = v9;
        v49 = (_QWORD *)v48;
        *(_DWORD *)v47 = 138412290;
        v62 = (uint64_t)v44;
        v50 = v44;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v47 + 4, v47 + 12);
        *v49 = v44;

        _os_log_impl((void *)&_mh_execute_header, v45, v46, "DefaultSceneDelegate: Got a non UIWindowScene: %@", v47, 0xCu);
        v51 = sub_100004708(&qword_100019FE0);
        swift_arrayDestroy(v49, 1, v51);
        v52 = v49;
        v9 = v58;
        swift_slowDealloc(v52, -1, -1);
        swift_slowDealloc(v47, -1, -1);
      }
      else
      {

      }
      v60[1](v9, v13);
    }
  }
}

uint64_t sub_10000EF0C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}
