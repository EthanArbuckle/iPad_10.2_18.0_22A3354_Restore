id sub_100002A38(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  void *object;
  NSString v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  Swift::String v25;
  Swift::String v26;
  void *v27;
  NSString v28;
  objc_super v30;
  Swift::String v31;
  Swift::String v32;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_activityIndicator;
  v4 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager;
  if (qword_100023440 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v7 = (void *)qword_100024770;
  *(_QWORD *)&v5[v6] = qword_100024770;
  v8 = v7;

  v30.receiver = v5;
  v30.super_class = (Class)type metadata accessor for SetupInProgressCardViewController();
  v9 = objc_msgSendSuper2(&v30, "initWithContentView:", a1);
  objc_msgSend(v9, "setDismissalType:", 0);
  v10 = v9;
  v11 = sub_100002D14();
  v13 = v12;
  v14 = (void *)objc_opt_self(NSBundle);
  v15 = objc_msgSend(v14, "mainBundle");
  v31._object = (void *)0xEA0000000000656CLL;
  v16._countAndFlagsBits = v11;
  v16._object = v13;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v31._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v31)._object;
  swift_bridgeObjectRelease(v13);

  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v10, "setTitle:", v19);

  v20 = v10;
  v21 = sub_100002E54();
  v23 = v22;
  v24 = objc_msgSend(v14, "mainBundle");
  v32._object = (void *)0x80000001000150A0;
  v25._countAndFlagsBits = v21;
  v25._object = v23;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  v32._countAndFlagsBits = 0xD000000000000010;
  v27 = NSLocalizedString(_:tableName:bundle:value:comment:)(v25, (Swift::String_optional)0, (NSBundle)v24, v26, v32)._object;
  swift_bridgeObjectRelease(v23);

  v28 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v27);
  objc_msgSend(v20, "setSubtitle:", v28);

  return v20;
}

unint64_t sub_100002D14()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v1 = 0xD000000000000016;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager);
  if (!v2)
  {
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v4 = (void *)static OS_os_log.default.getter();
    v5 = static os_log_type_t.default.getter();
    v6 = "Unable to get device class. Using generic title for in progress card";
    v7 = 68;
LABEL_10:
    os_log(_:dso:log:type:_:)(v6, v7, 2, &_mh_execute_header, v4, v5, &_swiftEmptyArrayStorage);

    return v1;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1)
    return 0xD00000000000001DLL;
  if (v3 == 11)
    return 0xD00000000000001DLL;
  if (v3 != 3)
  {
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v4 = (void *)static OS_os_log.default.getter();
    v5 = static os_log_type_t.default.getter();
    v6 = "Unsupported device class. Using generic title for in progress card";
    v7 = 66;
    goto LABEL_10;
  }
  return 0xD00000000000001BLL;
}

unint64_t sub_100002E54()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v1 = 0xD000000000000019;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_remoteSetupManager);
  if (!v2)
  {
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v4 = (void *)static OS_os_log.default.getter();
    v5 = static os_log_type_t.default.getter();
    v6 = "Unable to get device class. Using generic subtitle for in progress card";
    v7 = 71;
LABEL_10:
    os_log(_:dso:log:type:_:)(v6, v7, 2, &_mh_execute_header, v4, v5, &_swiftEmptyArrayStorage);

    return v1;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1)
    return 0xD000000000000020;
  if (v3 == 11)
    return 0xD000000000000020;
  if (v3 != 3)
  {
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v4 = (void *)static OS_os_log.default.getter();
    v5 = static os_log_type_t.default.getter();
    v6 = "Unsupported device class. Using generic subtitle for in progress card";
    v7 = 69;
    goto LABEL_10;
  }
  return 0xD00000000000001ELL;
}

id sub_100002F94()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupInProgressCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupInProgressCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController);
}

void type metadata accessor for MGDeviceClass(uint64_t a1)
{
  sub_100003794(a1, &qword_1000234B0, (uint64_t)&unk_10001CA20);
}

BOOL sub_100003030(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003044(uint64_t a1, uint64_t a2)
{
  return sub_100003280(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003050(uint64_t a1, id *a2)
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

uint64_t sub_1000030C4(uint64_t a1, id *a2)
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

uint64_t sub_100003140@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

_DWORD *sub_100003180@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_100003190(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_10000319C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000031E0@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003208(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100003820(&qword_1000234F0, (uint64_t)&unk_1000146F0);
  v3 = sub_100003820(&qword_1000234F8, (uint64_t)&unk_100014698);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003274(uint64_t a1, uint64_t a2)
{
  return sub_100003280(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003280(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_1000032BC(uint64_t a1)
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

Swift::Int sub_1000032FC(uint64_t a1)
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

uint64_t sub_10000336C(_QWORD *a1, uint64_t *a2)
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

void sub_1000033F4()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  Class isa;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup33SetupInProgressCardViewController_activityIndicator];
  objc_msgSend(v2, "setActivityIndicatorViewStyle:", 101);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_msgSend(v1, "contentView");
  objc_msgSend(v3, "addSubview:", v2);

  v4 = objc_msgSend(v1, "contentView");
  v5 = objc_msgSend(v4, "mainContentGuide");

  v6 = (void *)objc_opt_self(NSLayoutConstraint);
  v7 = sub_1000036E0(&qword_1000234B8);
  v8 = swift_allocObject(v7, 64, 7);
  *(_OWORD *)(v8 + 16) = xmmword_1000144A0;
  v9 = objc_msgSend(v2, "topAnchor");
  v10 = objc_msgSend(v5, "topAnchor");
  v11 = objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v10);

  *(_QWORD *)(v8 + 32) = v11;
  v12 = objc_msgSend(v2, "bottomAnchor");
  v13 = objc_msgSend(v5, "bottomAnchor");
  v14 = objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v13);

  *(_QWORD *)(v8 + 40) = v14;
  v15 = objc_msgSend(v2, "centerYAnchor");
  v16 = objc_msgSend(v5, "centerYAnchor");
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:", v16);

  *(_QWORD *)(v8 + 48) = v17;
  v18 = objc_msgSend(v2, "centerXAnchor");
  v19 = objc_msgSend(v5, "centerXAnchor");
  v20 = objc_msgSend(v18, "constraintEqualToAnchor:", v19);

  *(_QWORD *)(v8 + 56) = v20;
  specialized Array._endMutation()();
  sub_100003720(0, &qword_100023A70, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v6, "activateConstraints:", isa);

}

uint64_t sub_1000036E0(uint64_t *a1)
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

uint64_t sub_100003720(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for ObjectType(uint64_t a1)
{
  sub_100003794(a1, &qword_1000234C0, (uint64_t)&unk_10001CA48);
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_100003794(a1, &qword_1000234C8, (uint64_t)&unk_10001CA70);
}

void type metadata accessor for CUPasswordType(uint64_t a1)
{
  sub_100003794(a1, &qword_1000234D0, (uint64_t)&unk_10001CAA0);
}

void sub_100003794(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_1000037D8()
{
  return sub_100003820(&qword_1000234D8, (uint64_t)&unk_100014660);
}

uint64_t sub_1000037FC()
{
  return sub_100003820(&qword_1000234E0, (uint64_t)&unk_100014638);
}

uint64_t sub_100003820(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for ObjectType(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003860()
{
  return sub_100003820(&qword_1000234E8, (uint64_t)&unk_1000146C8);
}

char *sub_100003890(void *a1)
{
  void *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for CaptivePortalDetectedCardViewController();
  v3 = (char *)objc_msgSendSuper2(&v16, "initWithContentView:", a1);
  v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  *(_QWORD *)v4 = 0xD00000000000001ALL;
  *((_QWORD *)v4 + 1) = 0x8000000100015110;
  v6 = v3;
  swift_bridgeObjectRelease(v5);
  v7 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase + 8];
  *(_QWORD *)v7 = 0xD00000000000001DLL;
  *((_QWORD *)v7 + 1) = 0x8000000100015130;
  swift_bridgeObjectRelease(v8);
  v9 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  v10 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  *(_QWORD *)v9 = 0xD000000000000020;
  *((_QWORD *)v9 + 1) = 0x8000000100015150;
  swift_bridgeObjectRelease(v10);
  v11 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName + 8];
  *(_QWORD *)v11 = 0xD000000000000014;
  *((_QWORD *)v11 + 1) = 0x8000000100015180;
  swift_bridgeObjectRelease(v12);
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "systemGrayColor");
  v14 = *(void **)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v13;

  return v6;
}

id sub_100003A1C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaptivePortalDetectedCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CaptivePortalDetectedCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup39CaptivePortalDetectedCardViewController);
}

uint64_t sub_100003A6C()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v6, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100005FF8((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_1000036E0(&qword_100023660);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100005D74((uint64_t)v7);
    return 0;
  }
}

void sub_100003B24(void *a1, void (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;

  if (!a1
    || (v4 = v2, (v5 = objc_msgSend(a1, "userInfo")) == 0)
    || (v6 = v5,
        v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable), v6, !v7))
  {
    v41 = 0u;
    v42 = 0u;
LABEL_8:
    sub_100005D74((uint64_t)&v41);
    goto LABEL_9;
  }
  v39[0] = 0x656369766564;
  v39[1] = 0xE600000000000000;
  AnyHashable.init<A>(_:)(v39, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v7 + 16) && (v8 = sub_100012810((uint64_t)v40), (v9 & 1) != 0))
  {
    sub_100005ECC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  swift_bridgeObjectRelease(v7);
  sub_100005E98((uint64_t)v40);
  if (!*((_QWORD *)&v42 + 1))
    goto LABEL_8;
  v13 = sub_1000036E0(&qword_100023668);
  if ((swift_dynamicCast(v40, &v41, (char *)&type metadata for Any + 8, v13, 6) & 1) != 0)
  {
    v14 = v40[0];
    v15 = objc_allocWithZone((Class)CBDevice);
    v16 = sub_100005DB4(v14);
    v17 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v18 = swift_allocObject(v17, 72, 7);
    *(_OWORD *)(v18 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v18 + 56) = sub_100003720(0, &qword_100023670, CBDevice_ptr);
    *(_QWORD *)(v18 + 64) = sub_100006124();
    *(_QWORD *)(v18 + 32) = v16;
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v19 = v16;
    v20 = (void *)static OS_os_log.default.getter(v19);
    v21 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Started CoreBluetooth device %@", 31, 2, &_mh_execute_header, v20, v21, v18);
    swift_bridgeObjectRelease(v18);

    v22 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_cbDevice);
    *(_QWORD *)(v4 + OBJC_IVAR___RemoteViewController_cbDevice) = v19;

    v23 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
    if (v23)
    {
      v24 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_cbDevice);
      v25 = v24;
      v26 = v23;
      sub_100010214(v24);

    }
    v27 = (void *)objc_opt_self(NSNotificationCenter);
    v28 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023468 != -1)
      swift_once(&qword_100023468, sub_1000127A8);
    objc_msgSend(v28, "addObserver:selector:name:object:", v4, "_setupComplete", qword_100024798, 0);

    v29 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023460 != -1)
      swift_once(&qword_100023460, sub_100012774);
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, "_setupCancelled:", qword_100024790, 0);

    v30 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023470 != -1)
      swift_once(&qword_100023470, sub_1000127DC);
    objc_msgSend(v30, "addObserver:selector:name:object:", v4, "_setupFailed", qword_1000247A0, 0);

    v31 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023448 != -1)
      swift_once(&qword_100023448, sub_1000126D8);
    objc_msgSend(v31, "addObserver:selector:name:object:", v4, "_passwordRequested:", qword_100024778, 0);

    v32 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023450 != -1)
      swift_once(&qword_100023450, sub_10001270C);
    objc_msgSend(v32, "addObserver:selector:name:object:", v4, "_passwordPresented:", qword_100024780, 0);

    v33 = objc_msgSend(v27, "defaultCenter");
    if (qword_100023458 != -1)
      swift_once(&qword_100023458, sub_100012740);
    objc_msgSend(v33, "addObserver:selector:name:object:", v4, "_passwordAccepted", qword_100024788, 0);

    v34 = objc_msgSend(objc_allocWithZone((Class)SFClient), "init");
    v35 = *(void **)(v4 + OBJC_IVAR___RemoteViewController_sharingClient);
    *(_QWORD *)(v4 + OBJC_IVAR___RemoteViewController_sharingClient) = v34;

    if (a2)
      a2();
    v36 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v37 = (void *)static OS_os_log.default.getter(v36);
    v38 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("RemoteAlert configure complete", 30, 2, &_mh_execute_header, v37, v38, &_swiftEmptyArrayStorage);

    return;
  }
LABEL_9:
  v10 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v11 = (void *)static OS_os_log.default.getter(v10);
  v12 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Failed to get CBExtensionKeyDevice from userInfo dictionary", 59, 2, &_mh_execute_header, v11, v12, &_swiftEmptyArrayStorage);

  if (a2)
    a2();
}

void sub_100004334(char a1)
{
  char *v1;
  char *v2;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  char *v17;
  _QWORD v18[5];
  uint64_t v19;
  objc_super v20;

  v2 = v1;
  v20.receiver = v2;
  v20.super_class = (Class)type metadata accessor for RemoteViewController();
  objc_msgSendSuper2(&v20, "viewDidAppear:", a1 & 1);
  if (qword_100023408 != -1)
    swift_once(&qword_100023408, sub_1000083A8);
  if (byte_100024740 != 1)
  {
    v8 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v8);
    v9 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Remote setup prox card triggered, but flow is not enabled. Bailing", 66, 2, &_mh_execute_header, v6, v9, &_swiftEmptyArrayStorage);
    goto LABEL_12;
  }
  if (!*(_QWORD *)&v2[OBJC_IVAR___RemoteViewController_cbDevice])
  {
    v10 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v10);
    v11 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("RemoteViewController was presented without a remote device. Bailing", 67, 2, &_mh_execute_header, v6, v11, &_swiftEmptyArrayStorage);
    goto LABEL_12;
  }
  if (qword_100023420 != -1)
    swift_once(&qword_100023420, sub_10000C480);
  v4 = objc_msgSend((id)qword_100023A90, "networkName");
  if (!v4 || (v4, (objc_msgSend((id)qword_100023A90, "reachabilityFlags") & 2) == 0))
  {
    v5 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v5);
    v7 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Device is not connected to a wifi network. Bailing", 50, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);
LABEL_12:

    sub_10000483C();
    return;
  }
  v12 = *(void **)&v2[OBJC_IVAR___RemoteViewController_sharingClient];
  if (v12)
  {
    v13 = swift_allocObject(&unk_10001CC10, 24, 7);
    *(_QWORD *)(v13 + 16) = v2;
    v18[4] = sub_100006040;
    v19 = v13;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_100004754;
    v18[3] = &unk_10001CC28;
    v14 = _Block_copy(v18);
    v15 = v19;
    v16 = v12;
    v17 = v2;
    swift_release(v15);
    objc_msgSend(v16, "startProxCardTransactionWithOptions:completion:", 0, v14);

    _Block_release(v14);
  }
}

void sub_1000045CC(char a1, char *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v5 = (void *)static OS_os_log.default.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if ((a1 & 1) != 0)
  {
    os_log(_:dso:log:type:_:)("About to present prox card...", 29, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);

    v7 = sub_100006048();
    v8 = objc_msgSend(v7, "navigationController");
    v9 = *(void **)&a2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    *(_QWORD *)&a2[OBJC_IVAR___RemoteViewController_cardNavigationController] = v8;

    v12 = (id)static OS_os_log.default.getter(v10);
    v11 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Initial prox card presented", 27, 2, &_mh_execute_header, v12, v11, &_swiftEmptyArrayStorage);

  }
  else
  {
    os_log(_:dso:log:type:_:)("SharingClient does not want us to proceed showing the prox card. Bailing.", 73, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);

    a2[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 1;
    sub_10000483C();
  }
}

uint64_t sub_100004754(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_10000483C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSString v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;

  v1 = v0;
  v2 = (void *)sub_100003A6C();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "dismiss");
    swift_unknownObjectRelease(v3);
  }
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
  if (v4)
  {
    *(_BYTE *)(v4 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    v5 = *(void **)(v4 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v5)
      objc_msgSend(v5, "invalidate");
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit) == 1)
  {
    v6 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v7 = (void *)static OS_os_log.default.getter(v6);
    v8 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Flow dismissed in a non-manual manner. Resetting.", 49, 2, &_mh_execute_header, v7, v8, &_swiftEmptyArrayStorage);

    v9 = objc_msgSend(objc_allocWithZone((Class)CBController), "init");
    v10 = String._bridgeToObjectiveC()();
    v11 = swift_allocObject(&unk_10001CBC0, 24, 7);
    *(_QWORD *)(v11 + 16) = v9;
    v16[4] = sub_100005FAC;
    v17 = v11;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_100004B40;
    v16[3] = &unk_10001CBD8;
    v12 = _Block_copy(v16);
    v13 = v17;
    v14 = v9;
    swift_release(v13);
    objc_msgSend(v14, "resetCBExtensionID:completionHandler:", v10, v12);
    _Block_release(v12);

  }
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___RemoteViewController_sharingClient), "invalidate");
}

id sub_100004A24(uint64_t a1, id a2)
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _BYTE v13[8];

  result = objc_msgSend(a2, "invalidate");
  if (a1)
  {
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v4 = swift_errorRetain(a1);
    v5 = (void *)static OS_os_log.default.getter(v4);
    v6 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v7 = swift_allocObject(v6, 72, 7);
    *(_OWORD *)(v7 + 16) = xmmword_1000147B0;
    swift_getErrorValue(a1, v13, v12);
    v8 = Error.localizedDescription.getter(v12[1], v12[2]);
    v10 = v9;
    *(_QWORD *)(v7 + 56) = &type metadata for String;
    *(_QWORD *)(v7 + 64) = sub_100005FB4();
    *(_QWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 40) = v10;
    v11 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Failed to reset flow with error: %@", 35, 2, &_mh_execute_header, v5, v11, v7);

    swift_bridgeObjectRelease(v7);
    return (id)swift_errorRelease(a1);
  }
  return result;
}

void sub_100004B40(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

void sub_100004BC8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;

  v1 = type metadata accessor for SetupCompleteCardViewController();
  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1)), "init");
  v3 = *(void **)(v0 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v4, "pushViewController:animated:", v2, 1);

  }
  *(_BYTE *)(v0 + OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit) = 1;
}

void sub_100004C80(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD aBlock[3];
  void *v24;
  id (*v25)();
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;

  v2 = v1;
  v1[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 1;
  v3 = objc_msgSend(a1, "userInfo");
  if (v3)
  {
    v4 = v3;
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    if (qword_100023438 != -1)
      swift_once(&qword_100023438, sub_100010168);
    v28 = xmmword_100024760;
    swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100024760 + 1));
    AnyHashable.init<A>(_:)(&v28, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v5 + 16) && (v6 = sub_100012810((uint64_t)aBlock), (v7 & 1) != 0))
    {
      sub_100005ECC(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v28);
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
    }
    swift_bridgeObjectRelease(v5);
    sub_100005E98((uint64_t)aBlock);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  sub_100005F08((uint64_t)&v28, (uint64_t)aBlock);
  if (!v24)
  {
    sub_100005D74((uint64_t)aBlock);
LABEL_16:
    v14 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v15 = (void *)static OS_os_log.default.getter(v14);
    v16 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Recieved a setupCancelled notification with an invalid cancel reason", 68, 2, &_mh_execute_header, v15, v16, &_swiftEmptyArrayStorage);

    v17 = type metadata accessor for SetupFailedCardViewController();
    v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v17)), "init");
    v19 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v20, "pushViewController:animated:", v18, 1);

    }
    goto LABEL_18;
  }
  if (!swift_dynamicCast(&v27, aBlock, (char *)&type metadata for Any + 8, &type metadata for RemoteSetupCancelReason, 6))goto LABEL_16;
  if ((v27 & 1) != 0)
  {
    v8 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
    if (v8)
    {
      v9 = swift_allocObject(&unk_10001CB70, 24, 7);
      *(_QWORD *)(v9 + 16) = v2;
      v25 = sub_100005F74;
      v26 = v9;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000096EC;
      v24 = &unk_10001CB88;
      v10 = _Block_copy(aBlock);
      v11 = v26;
      v12 = v8;
      v13 = v2;
      swift_release(v11);
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v10);
      _Block_release(v10);

    }
    goto LABEL_19;
  }
  v21 = type metadata accessor for SetupCancelledCardViewController();
  v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v21)), "init");
  v22 = *(void **)&v2[OBJC_IVAR___RemoteViewController_cardNavigationController];
  if (v22)
  {
    objc_msgSend(v22, "pushViewController:animated:", v18, 1);
LABEL_18:

LABEL_19:
    sub_100005D74((uint64_t)&v28);
    return;
  }
  sub_100005D74((uint64_t)&v28);

}

void sub_100004FF4()
{
  sub_1000059BC((uint64_t (*)(_QWORD))type metadata accessor for SetupFailedCardViewController);
}

void sub_100005034(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  unsigned int v26;
  __int128 v27;
  __int128 v28;

  v2 = v1;
  v3 = objc_msgSend(a1, "userInfo");
  if (v3)
  {
    v4 = v3;
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    *(_QWORD *)&v27 = 0xD000000000000011;
    *((_QWORD *)&v27 + 1) = 0x8000000100015280;
    AnyHashable.init<A>(_:)(&v27, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v5 + 16) && (v6 = sub_100012810((uint64_t)v25), (v7 & 1) != 0))
    {
      sub_100005ECC(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v27);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    swift_bridgeObjectRelease(v5);
    sub_100005E98((uint64_t)v25);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  sub_100005F08((uint64_t)&v27, (uint64_t)v25);
  if (!v25[3])
  {
    sub_100005D74((uint64_t)v25);
    goto LABEL_13;
  }
  type metadata accessor for CUPasswordType(0);
  if ((swift_dynamicCast(&v26, v25, (char *)&type metadata for Any + 8, v8, 6) & 1) == 0)
  {
LABEL_13:
    v12 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v13 = (void *)static OS_os_log.default.getter(v12);
    v14 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Recieved a password request notification with wrong data type for password key", 78, 2, &_mh_execute_header, v13, v14, &_swiftEmptyArrayStorage);
    goto LABEL_14;
  }
  v9 = v26;
  if (v26 != 8)
  {
    if ((sub_1000100D4(v26, (uint64_t)&off_10001C8C8) & 1) != 0)
    {
      v20 = type metadata accessor for PinEntryCardViewController();
      v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v20)), "init");
      v11 = v21;
      switch(v9)
      {
        case 3u:
          objc_msgSend(v21, "setNumberOfDigits:", 8);
          break;
        case 2u:
          objc_msgSend(v21, "setNumberOfDigits:", 6);
          break;
        case 1u:
          objc_msgSend(v21, "setNumberOfDigits:", 4);
          break;
      }
      goto LABEL_27;
    }
    v22 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v13 = (void *)static OS_os_log.default.getter(v22);
    v23 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Requested password is not a numeric pin or QR code", 50, 2, &_mh_execute_header, v13, v23, &_swiftEmptyArrayStorage);
LABEL_14:

    v15 = *(_QWORD *)(v2 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
    if (v15)
    {
      *(_BYTE *)(v15 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
      v16 = *(void **)(v15 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
      if (v16)
        objc_msgSend(v16, "invalidate");
    }
    v17 = type metadata accessor for SetupFailedCardViewController();
    v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v17)), "init");
    v18 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v19, "pushViewController:animated:", v11, 1);

    }
    goto LABEL_29;
  }
  v10 = type metadata accessor for QRCodeScannerCardViewController();
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v10)), "init");
LABEL_27:
  v24 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (!v24)
  {
    sub_100005D74((uint64_t)&v27);

    return;
  }
  objc_msgSend(v24, "pushViewController:animated:", v11, 1);
LABEL_29:

  sub_100005D74((uint64_t)&v27);
}

void sub_1000053EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41[5];
  __int128 v42;
  __int128 v43;

  v2 = v1;
  v4 = objc_msgSend(a1, "userInfo");
  if (!v4)
  {
    v42 = 0u;
    v43 = 0u;
LABEL_27:
    sub_100005D74((uint64_t)&v42);
    goto LABEL_28;
  }
  v5 = v4;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  if (qword_100023430 != -1)
    swift_once(&qword_100023430, sub_100010138);
  v39 = qword_100024750;
  v40 = *(_QWORD *)algn_100024758;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100024758);
  AnyHashable.init<A>(_:)(&v39, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_100012810((uint64_t)v41), (v8 & 1) != 0))
  {
    sub_100005ECC(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v42);
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }
  swift_bridgeObjectRelease(v6);
  sub_100005E98((uint64_t)v41);
  if (!*((_QWORD *)&v43 + 1))
    goto LABEL_27;
  if ((swift_dynamicCast(v41, &v42, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_28:
    v28 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v29 = (void *)static OS_os_log.default.getter(v28);
    v30 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Recieved a password present notification with no password or password type", 74, 2, &_mh_execute_header, v29, v30, &_swiftEmptyArrayStorage);
    goto LABEL_29;
  }
  v10 = v41[0];
  v9 = v41[1];
  v11 = objc_msgSend(a1, "userInfo");
  if (!v11)
  {
    v42 = 0u;
    v43 = 0u;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    goto LABEL_27;
  }
  v12 = v11;
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v39 = 0xD000000000000011;
  v40 = 0x8000000100015280;
  AnyHashable.init<A>(_:)(&v39, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v13 + 16) && (v14 = sub_100012810((uint64_t)v41), (v15 & 1) != 0))
  {
    sub_100005ECC(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v42);
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }
  swift_bridgeObjectRelease(v13);
  sub_100005E98((uint64_t)v41);
  if (!*((_QWORD *)&v43 + 1))
    goto LABEL_26;
  type metadata accessor for CUPasswordType(0);
  if ((swift_dynamicCast(v41, &v42, (char *)&type metadata for Any + 8, v16, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(v9);
    goto LABEL_28;
  }
  v17 = v41[0];
  if ((sub_1000100D4(LODWORD(v41[0]), (uint64_t)&off_10001C8F8) & 1) != 0)
  {
    v18 = type metadata accessor for QRCodeDisplayCardViewController();
    v19 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v18)), "init");
    v20 = (uint64_t *)&v19[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password];
    v21 = *(_QWORD *)&v19[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password + 8];
    *v20 = v10;
    v20[1] = v9;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRelease(v21);
    if (v17 == 2)
      v19[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType] = 1;
    v22 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
    if (v22)
      objc_msgSend(v22, "pushViewController:animated:", v19, 1);
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v23 = swift_bridgeObjectRetain(v9);
    v24 = static OS_os_log.default.getter(v23);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v41[0] = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain(v9);
      *(_QWORD *)&v42 = sub_10000E504(v10, v9, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, (char *)&v42 + 8, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease_n(v9, 3);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Presented authentication for code %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v9, 2);
    }

    return;
  }
  swift_bridgeObjectRelease(v9);
  v37 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v29 = (void *)static OS_os_log.default.getter(v37);
  v38 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Requested password present is not a QR code or AppClip code", 59, 2, &_mh_execute_header, v29, v38, &_swiftEmptyArrayStorage);
LABEL_29:

  v31 = *(_QWORD *)(v2 + OBJC_IVAR___RemoteViewController_remoteSetupManager);
  if (v31)
  {
    *(_BYTE *)(v31 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    v32 = *(void **)(v31 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v32)
      objc_msgSend(v32, "invalidate");
  }
  v33 = type metadata accessor for SetupFailedCardViewController();
  v34 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v33)), "init");
  v35 = *(void **)(v2 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v35)
  {
    v36 = v35;
    objc_msgSend(v36, "pushViewController:animated:", v34, 1);

  }
}

void sub_1000059B0()
{
  sub_1000059BC((uint64_t (*)(_QWORD))type metadata accessor for SetupInProgressCardViewController);
}

void sub_1000059BC(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = a1(0);
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)), "init");
  v3 = *(void **)(v1 + OBJC_IVAR___RemoteViewController_cardNavigationController);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v4, "pushViewController:animated:", v5, 1);

  }
}

id sub_100005A68(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  NSString v11;
  id v12;
  objc_super v14;

  *(_QWORD *)&v3[OBJC_IVAR___RemoteViewController_cbDevice] = 0;
  v3[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___RemoteViewController_cardNavigationController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___RemoteViewController_sharingClient] = 0;
  v6 = OBJC_IVAR___RemoteViewController_remoteSetupManager;
  v7 = qword_100023440;
  v8 = v3;
  if (v7 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v9 = (void *)qword_100024770;
  *(_QWORD *)&v3[v6] = qword_100024770;
  v10 = v9;

  if (a2)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for RemoteViewController();
  v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", v11, a3);

  return v12;
}

id sub_100005BD8(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  *(_QWORD *)&v1[OBJC_IVAR___RemoteViewController_cbDevice] = 0;
  v1[OBJC_IVAR___RemoteViewController_resetSetupFlowOnExit] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___RemoteViewController_cardNavigationController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___RemoteViewController_sharingClient] = 0;
  v3 = OBJC_IVAR___RemoteViewController_remoteSetupManager;
  v4 = qword_100023440;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v6 = (void *)qword_100024770;
  *(_QWORD *)&v5[v3] = qword_100024770;
  v7 = v6;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for RemoteViewController();
  v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

id sub_100005CCC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteViewController()
{
  return objc_opt_self(RemoteViewController);
}

uint64_t sub_100005D74(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000036E0((uint64_t *)&unk_1000235E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100005DB4(uint64_t a1)
{
  void *v1;
  Class isa;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9 = 0;
  v4 = objc_msgSend(v1, "initWithDictionary:error:", isa, &v9);

  v5 = v9;
  if (v4)
  {
    v6 = v9;
  }
  else
  {
    v7 = v9;
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_100005E98(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100005ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000036E0((uint64_t *)&unk_1000235E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005F50()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100005F74()
{
  return sub_10000483C();
}

uint64_t sub_100005F94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005FA4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_100005FAC(uint64_t a1)
{
  uint64_t v1;

  return sub_100004A24(a1, *(id *)(v1 + 16));
}

unint64_t sub_100005FB4()
{
  unint64_t result;

  result = qword_100023A60;
  if (!qword_100023A60)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100023A60);
  }
  return result;
}

uint64_t sub_100005FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000036E0((uint64_t *)&unk_1000235E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100006040(char a1)
{
  uint64_t v1;

  sub_1000045CC(a1, *(char **)(v1 + 16));
}

id sub_100006048()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  if ((sub_10000C59C() & 1) != 0)
  {
    v0 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v1 = (void *)static OS_os_log.default.getter(v0);
    v2 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("The current network is a captive portal network. Presenting captive network failure card instead of ", 100, 2, &_mh_execute_header, v1, v2, &_swiftEmptyArrayStorage);

    v3 = type metadata accessor for CaptivePortalDetectedCardViewController();
  }
  else
  {
    v3 = type metadata accessor for WelcomeCardViewController();
  }
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)), "init");
}

uint64_t sub_1000060E4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000060F4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006118()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_100006124()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100023678;
  if (!qword_100023678)
  {
    v1 = sub_100003720(255, &qword_100023670, CBDevice_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100023678);
  }
  return result;
}

id sub_1000061D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v5;
  NSString *v6;

  v5 = (objc_class *)type metadata accessor for AppDelegate();
  v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup11AppDelegate);
}

id sub_100006280(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  NSString v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  void *v23;
  NSString v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  _QWORD aBlock[5];
  uint64_t v31;
  objc_super v32;
  Swift::String v33;
  Swift::String v34;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager;
  v4 = qword_100023440;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v6 = (void *)qword_100024770;
  *(_QWORD *)&v5[v3] = qword_100024770;
  v7 = v6;

  v32.receiver = v5;
  v32.super_class = (Class)type metadata accessor for PinEntryCardViewController();
  v8 = objc_msgSendSuper2(&v32, "initWithContentView:", a1);
  objc_msgSend(v8, "setDismissalType:", 1);
  v9 = (void *)objc_opt_self(NSBundle);
  v10 = v8;
  v11 = objc_msgSend(v9, "mainBundle");
  v33._object = (void *)0xEA0000000000656CLL;
  v12._countAndFlagsBits = 0x445241435F4E4950;
  v12._object = (void *)0xEE00454C5449545FLL;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v33._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v33)._object;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v10, "setTitle:", v15);

  v16 = v10;
  v17 = sub_1000066A0();
  v19 = v18;
  v20 = objc_msgSend(v9, "mainBundle");
  v34._object = (void *)0xE90000000000004ELL;
  v21._countAndFlagsBits = v17;
  v21._object = v19;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0x4950207265746E45;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v34)._object;
  swift_bridgeObjectRelease(v19);

  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v16, "setSubtitle:", v24);

  v25 = swift_allocObject(&unk_10001CC88, 24, 7);
  swift_unknownObjectWeakInit(v25 + 16, v16);
  aBlock[4] = sub_100006868;
  v31 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006620;
  aBlock[3] = &unk_10001CCA0;
  v26 = _Block_copy(aBlock);
  v27 = v31;
  v28 = v16;
  swift_release(v27);
  objc_msgSend(v28, "setTextEntryCompletionHandler:", v26);

  _Block_release(v26);
  return v28;
}

void sub_10000655C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *Strong;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12[24];

  v5 = a3 + 16;
  swift_beginAccess(a3 + 16, v12, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    v8 = objc_msgSend(Strong, "navigationController");
    if (v8)
    {
      v9 = v8;

    }
    v10 = *(void **)&v7[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager];
    if (v10)
    {
      v11 = v10;
      sub_100010B20(a1, a2);

    }
  }
}

uint64_t sub_100006620(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v6 = v5;
  swift_retain(v2);
  v3(v4, v6);
  swift_release(v2);
  return swift_bridgeObjectRelease(v6);
}

unint64_t sub_1000066A0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = 0xD000000000000011;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26PinEntryCardViewController_remoteSetupManager);
  if (!v2)
  {
    v4 = sub_100006808();
    v5 = (void *)static OS_os_log.default.getter(v4);
    v6 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Using generic subtitle for pin card", 63, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);
LABEL_8:

    return v1;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1)
    return 0xD000000000000018;
  if (v3 != 3)
  {
    v7 = sub_100006808();
    v5 = (void *)static OS_os_log.default.getter(v7);
    v8 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unsupported device class. Using generic title subtitle for pin card", 67, 2, &_mh_execute_header, v5, v8, &_swiftEmptyArrayStorage);
    goto LABEL_8;
  }
  return 0xD000000000000016;
}

id sub_1000067A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinEntryCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PinEntryCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup26PinEntryCardViewController);
}

unint64_t sub_100006808()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100023A40;
  if (!qword_100023A40)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100023A40);
  }
  return result;
}

uint64_t sub_100006844()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100006868(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000655C(a1, a2, v2);
}

uint64_t sub_100006870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006880(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000692C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  id v11;
  NSString v12;
  id v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  void *v23;
  NSString v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  Swift::String v30;
  Swift::String v31;
  void *v32;
  NSString v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview);
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = 1;
  objc_msgSend(v1, "setContentMode:", 1);
  objc_msgSend(v1, "setScrollEnabled:", 1);
  objc_msgSend(v1, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v1, "setShowsVerticalScrollIndicator:", 1);
  v3 = sub_100006F60((uint64_t)&_swiftEmptyArrayStorage, 0xD000000000000024, (void *)0x8000000100015A20);
  v5 = v4;
  v6 = (void *)objc_opt_self(NSBundle);
  v7 = objc_msgSend(v6, "mainBundle");
  v38._object = (void *)0x8000000100015A50;
  v8._countAndFlagsBits = v3;
  v8._object = v5;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v38._countAndFlagsBits = 0xD000000000000014;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v38)._object;
  swift_bridgeObjectRelease(v5);

  v11 = objc_allocWithZone((Class)NSMutableAttributedString);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v13 = objc_msgSend(v11, "initWithString:", v12);

  v14 = objc_msgSend(objc_allocWithZone((Class)NSMutableParagraphStyle), "init");
  LODWORD(v15) = 0;
  objc_msgSend(v14, "setHyphenationFactor:", v15);
  objc_msgSend(v14, "setAlignment:", 4);
  objc_msgSend(v14, "setParagraphSpacingBefore:", 15.0);
  v37 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleBody);
  v16 = objc_msgSend(v13, "length");
  objc_msgSend(v13, "addAttribute:value:range:", NSParagraphStyleAttributeName, v14, 0, v16);
  objc_msgSend(v13, "addAttribute:value:range:", NSFontAttributeName, v37, 0, v16);
  v17 = *(void **)(v0
                 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView);
  objc_msgSend(v17, "setAttributedText:", v13);
  objc_msgSend(v17, "setDataDetectorTypes:", 2);
  v18 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  objc_msgSend(v17, "setTextColor:", v18);

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setEditable:", 0);
  objc_msgSend(v17, "setScrollEnabled:", 0);
  v19 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton);
  v20 = objc_msgSend(v6, "mainBundle");
  v21._countAndFlagsBits = 0xD000000000000025;
  v39._object = (void *)0xE800000000000000;
  v21._object = (void *)0x8000000100015A70;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v39._countAndFlagsBits = 0x6565726761736944;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v39)._object;

  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v19, "setTitle:forState:", v24, 0);

  v25 = (void *)objc_opt_self(UIView);
  if (objc_msgSend(v25, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v19, "semanticContentAttribute")))
  {
    v26 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v27 = objc_msgSend(v26, "preferredContentSizeCategory");

    LOBYTE(v26) = UIContentSizeCategory.isAccessibilityCategory.getter(v27);
    if ((v26 & 1) != 0)
      v2 = 1;
    else
      v2 = 2;
  }
  objc_msgSend(v19, "setContentHorizontalAlignment:", v2);
  objc_msgSend(v19, "addTarget:action:forControlEvents:", v0, "disagreeButtonAction", 64);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v28 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton);
  v29 = objc_msgSend(v6, "mainBundle");
  v30._countAndFlagsBits = 0xD000000000000022;
  v40._object = (void *)0xE500000000000000;
  v30._object = (void *)0x8000000100015AA0;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0x6565726741;
  v32 = NSLocalizedString(_:tableName:bundle:value:comment:)(v30, (Swift::String_optional)0, (NSBundle)v29, v31, v40)._object;

  v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v28, "setTitle:forState:", v33, 0);

  if (objc_msgSend(v25, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v28, "semanticContentAttribute"))|| (v34 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication"), v35 = objc_msgSend(v34, "preferredContentSizeCategory"), v34, LOBYTE(v34) = UIContentSizeCategory.isAccessibilityCategory.getter(v35), v35, (v34 & 1) != 0))
  {
    v36 = 1;
  }
  else
  {
    v36 = 2;
  }
  objc_msgSend(v28, "setContentHorizontalAlignment:", v36);
  objc_msgSend(v28, "addTarget:action:forControlEvents:", v0, "agreeButtonAction", 64);
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

uint64_t sub_100006F60(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  NSString v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  BOOL v17;
  void *object;
  id v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t countAndFlagsBits;
  Swift::String v24;
  Swift::String v25;

  v6 = (void *)objc_opt_self(ASTLocalization);
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v6, "localizedStringForKey:", v7);

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  v12 = (void *)objc_opt_self(NSBundle);
  v13 = objc_msgSend(v12, "mainBundle");
  v24._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = v9;
  v14._object = v11;
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  v24._countAndFlagsBits = 0;
  v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v24);
  swift_bridgeObjectRelease(v11);

  v17 = v16._countAndFlagsBits == a2 && v16._object == a3;
  object = a3;
  if (!v17)
  {
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(v16._countAndFlagsBits, v16._object, a2, a3, 0) & 1) == 0)
    {
      countAndFlagsBits = String.init(format:arguments:)(v16._countAndFlagsBits, v16._object, a1);
      swift_bridgeObjectRelease(v16._object);
      return countAndFlagsBits;
    }
    object = v16._object;
  }
  swift_bridgeObjectRelease(object);
  v19 = objc_msgSend(v12, "mainBundle");
  v25._object = (void *)0xE000000000000000;
  v20._countAndFlagsBits = a2;
  v20._object = a3;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v20, (Swift::String_optional)0, (NSBundle)v19, v21, v25)._countAndFlagsBits;

  return countAndFlagsBits;
}

void sub_100007118()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend(v0, "contentView");
  v2 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview];
  objc_msgSend(v1, "addSubview:", v2);

  objc_msgSend(v2, "addSubview:", *(_QWORD *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView]);
  v3 = objc_msgSend(v0, "contentView");
  objc_msgSend(v3, "addSubview:", *(_QWORD *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton]);

  v4 = objc_msgSend(v0, "contentView");
  objc_msgSend(v4, "addSubview:", *(_QWORD *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton]);

}

void sub_1000071FC()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  Class isa;

  v1 = v0;
  v2 = objc_msgSend(v0, "contentView");
  v3 = objc_msgSend(v2, "mainContentGuide");

  v61 = (void *)objc_opt_self(NSLayoutConstraint);
  v4 = sub_1000036E0(&qword_1000234B8);
  v5 = swift_allocObject(v4, 176, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100014840;
  v6 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview];
  v7 = objc_msgSend(v6, "topAnchor");
  v8 = objc_msgSend(v3, "topAnchor");
  v9 = objc_msgSend(v7, "constraintEqualToAnchor:", v8);

  *(_QWORD *)(v5 + 32) = v9;
  v10 = objc_msgSend(v6, "bottomAnchor");
  v11 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton];
  v12 = objc_msgSend(v11, "topAnchor");
  v13 = objc_msgSend(v10, "constraintEqualToAnchor:", v12);

  *(_QWORD *)(v5 + 40) = v13;
  v14 = objc_msgSend(v6, "leadingAnchor");
  v15 = objc_msgSend(v3, "leadingAnchor");
  v16 = objc_msgSend(v14, "constraintEqualToAnchor:", v15);

  *(_QWORD *)(v5 + 48) = v16;
  v17 = objc_msgSend(v6, "trailingAnchor");
  v18 = objc_msgSend(v3, "trailingAnchor");
  v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);

  *(_QWORD *)(v5 + 56) = v19;
  v20 = objc_msgSend(v6, "heightAnchor");
  v21 = objc_msgSend(v20, "constraintEqualToConstant:", 300.0);

  *(_QWORD *)(v5 + 64) = v21;
  v22 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView];
  v23 = objc_msgSend(v22, "topAnchor");
  v24 = objc_msgSend(v6, "topAnchor");
  v25 = objc_msgSend(v23, "constraintEqualToAnchor:", v24);

  *(_QWORD *)(v5 + 72) = v25;
  v26 = objc_msgSend(v22, "bottomAnchor");
  v27 = objc_msgSend(v6, "bottomAnchor");
  v28 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -15.0);

  *(_QWORD *)(v5 + 80) = v28;
  v29 = objc_msgSend(v22, "leadingAnchor");
  v30 = objc_msgSend(v6, "leadingAnchor");
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 15.0);

  *(_QWORD *)(v5 + 88) = v31;
  v32 = objc_msgSend(v22, "trailingAnchor");
  v33 = objc_msgSend(v6, "trailingAnchor");
  v34 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -15.0);

  *(_QWORD *)(v5 + 96) = v34;
  v35 = objc_msgSend(v22, "widthAnchor");
  v36 = objc_msgSend(v6, "widthAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -30.0);

  *(_QWORD *)(v5 + 104) = v37;
  v38 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton];
  v39 = objc_msgSend(v38, "bottomAnchor");
  v40 = objc_msgSend(v11, "bottomAnchor");
  v41 = objc_msgSend(v39, "constraintEqualToAnchor:", v40);

  *(_QWORD *)(v5 + 112) = v41;
  v42 = objc_msgSend(v38, "topAnchor");
  v43 = objc_msgSend(v11, "topAnchor");
  v44 = objc_msgSend(v42, "constraintEqualToAnchor:", v43);

  *(_QWORD *)(v5 + 120) = v44;
  v45 = objc_msgSend(v38, "leadingAnchor");
  v46 = objc_msgSend(v6, "leadingAnchor");
  v47 = objc_msgSend(v45, "constraintEqualToAnchor:", v46);

  *(_QWORD *)(v5 + 128) = v47;
  v48 = objc_msgSend(v38, "widthAnchor");
  v49 = objc_msgSend(v48, "constraintGreaterThanOrEqualToConstant:", 44.0);

  *(_QWORD *)(v5 + 136) = v49;
  v50 = objc_msgSend(v11, "bottomAnchor");
  v51 = objc_msgSend(v3, "bottomAnchor");
  v52 = objc_msgSend(v50, "constraintEqualToAnchor:", v51);

  *(_QWORD *)(v5 + 144) = v52;
  v53 = objc_msgSend(v11, "topAnchor");
  v54 = objc_msgSend(v6, "bottomAnchor");
  v55 = objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v54, 15.0);

  *(_QWORD *)(v5 + 152) = v55;
  v56 = objc_msgSend(v11, "trailingAnchor");
  v57 = objc_msgSend(v6, "trailingAnchor");
  v58 = objc_msgSend(v56, "constraintEqualToAnchor:", v57);

  *(_QWORD *)(v5 + 160) = v58;
  v59 = objc_msgSend(v11, "widthAnchor");
  v60 = objc_msgSend(v59, "constraintGreaterThanOrEqualToConstant:", 44.0);

  *(_QWORD *)(v5 + 168) = v60;
  specialized Array._endMutation()();
  sub_100003720(0, &qword_100023A70, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  objc_msgSend(v61, "activateConstraints:", isa);

}

void sub_1000079AC()
{
  char *v0;
  void *v1;
  NSString v2;
  void *v3;
  NSString v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  _BYTE *v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  id v14;
  Swift::String v15;

  v1 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton];
  v2 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "setTitle:forState:", v2, 0);

  v3 = *(void **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton];
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setTitle:forState:", v4, 0);

  objc_msgSend(v1, "setEnabled:", 0);
  objc_msgSend(v3, "setEnabled:", 0);
  v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._object = (void *)0xED00002E2E2E676ELL;
  v6._object = (void *)0x80000001000159A0;
  v6._countAndFlagsBits = 0xD000000000000017;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0x697463656E6E6F43;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v15)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v0, "showActivityIndicatorWithStatus:", v9);

  v10 = *(_BYTE **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_remoteSetupManager];
  if (v10)
  {
    v11 = *(void **)&v10[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
    if (v11 && v10[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState])
    {
      v10[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 2;
      objc_msgSend(v11, "activate");
    }
    else
    {
      sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v12 = v10;
      v14 = (id)static OS_os_log.default.getter(v12);
      v13 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("startSetup called while not in a ready state. setRemoteDevice may not have been called", 86, 2, &_mh_execute_header, v14, v13, &_swiftEmptyArrayStorage);

    }
  }
}

id sub_100007C40()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TermsAndConditionsCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TermsAndConditionsCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController);
}

uint64_t sub_100007CF8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t KeyPath;
  void *v12;

  v6 = type metadata accessor for AttributeContainer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1, v6);
  KeyPath = swift_getKeyPath(&unk_100014878);
  v7 = swift_getKeyPath(&unk_1000148A8);
  v12 = a2;
  v8 = sub_100008250();
  v9 = a2;
  return AttributeContainer.subscript.setter(&v12, v7, v8);
}

uint64_t sub_100007D94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v4 = *a1;
  v5 = v2;
  sub_1000036E0(&qword_100023830);
  return dispatch thunk of static Equatable.== infix(_:_:)(&v5, &v4) & 1;
}

id sub_100007DEC(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  objc_class *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  Swift::String v32;
  Swift::String v33;
  void *object;
  NSString v35;
  objc_super v37;
  Swift::String v38;

  sub_1000036E0(&qword_100023818);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UIButton.Configuration(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v37 - v10;
  v12 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_remoteSetupManager;
  v13 = qword_100023440;
  v14 = v1;
  if (v13 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v15 = (void *)qword_100024770;
  *(_QWORD *)&v14[v12] = qword_100024770;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_fontSizeTitle] = 0x403C000000000000;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_fontSizeBody] = 0x4034000000000000;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_buttonMinimumWidth] = 0x4046000000000000;
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_legalTextPadding] = 0x402E000000000000;
  v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_textSized] = 0;
  v16 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsSubview;
  v17 = objc_allocWithZone((Class)UIScrollView);
  v18 = v15;
  *(_QWORD *)&v14[v16] = objc_msgSend(v17, "init");
  v19 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_termsAndConditionsTextView;
  *(_QWORD *)&v14[v19] = objc_msgSend(objc_allocWithZone((Class)UITextView), "init");
  v20 = objc_msgSend((id)objc_opt_self(UIFontMetrics), "defaultMetrics");
  v21 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 20.0);
  v22 = objc_msgSend(v20, "scaledFontForFont:", v21);

  static UIButton.Configuration.plain()();
  v23 = swift_allocObject(&unk_10001CCD8, 24, 7);
  *(_QWORD *)(v23 + 16) = v22;
  v24 = v22;
  UIConfigurationTextAttributesTransformer.init(_:)(sub_10000822C, v23);
  v25 = type metadata accessor for UIConfigurationTextAttributesTransformer(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v4, 0, 1, v25);
  UIButton.Configuration.titleTextAttributesTransformer.setter(v4);
  sub_100003720(0, &qword_100023820, UIButton_ptr);
  v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v26(v9, v11, v5);
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_disagreeButton] = UIButton.init(configuration:primaryAction:)(v9, 0);
  v26(v9, v11, v5);
  *(_QWORD *)&v14[OBJC_IVAR____TtC23CheckerBoardRemoteSetup36TermsAndConditionsCardViewController_agreeButton] = UIButton.init(configuration:primaryAction:)(v9, 0);

  v27 = (objc_class *)type metadata accessor for TermsAndConditionsCardViewController();
  v37.receiver = v14;
  v37.super_class = v27;
  v28 = objc_msgSendSuper2(&v37, "initWithContentView:", a1);
  objc_msgSend(v28, "setDismissalType:", 0);
  v29 = (void *)objc_opt_self(NSBundle);
  v30 = v28;
  v31 = objc_msgSend(v29, "mainBundle");
  v38._object = (void *)0xEA0000000000656CLL;
  v32._object = (void *)0x8000000100015AD0;
  v32._countAndFlagsBits = 0xD00000000000001BLL;
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  v38._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v31, v33, v38)._object;

  v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v30, "setTitle:", v35);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v30;
}

uint64_t sub_100008208()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000822C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100007CF8(a1, *(void **)(v2 + 16), a2);
}

void sub_100008234()
{
  AttributeScopes.UIKitAttributes.font.getter();
  __break(1u);
}

unint64_t sub_100008250()
{
  unint64_t result;

  result = qword_100023828;
  if (!qword_100023828)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AttributeScopes.UIKitAttributes.FontAttribute, &type metadata for AttributeScopes.UIKitAttributes.FontAttribute);
    atomic_store(result, (unint64_t *)&qword_100023828);
  }
  return result;
}

void sub_100008294(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a2;
  v3 = sub_100008250();
  AttributeDynamicLookup.subscript.getter(v2, v3);
  __break(1u);
}

uint64_t sub_1000082B8()
{
  return 8;
}

uint64_t sub_1000082C4(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t sub_1000082CC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_1000082DC()
{
  uint64_t v0;

  v0 = sub_1000036E0(&qword_100023830);
  return dispatch thunk of Hashable.hashValue.getter(v0, &protocol witness table for AnyKeyPath);
}

_QWORD *sub_100008320(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_10000832C()
{
  id v0;
  NSString v1;

  v0 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "addSuiteNamed:", v1);

  qword_100023838 = (uint64_t)v0;
}

void sub_1000083A8()
{
  void *v0;
  NSString v1;

  if (qword_100023400 != -1)
    swift_once(&qword_100023400, sub_10000832C);
  v0 = (void *)qword_100023838;
  v1 = String._bridgeToObjectiveC()();
  LOBYTE(v0) = objc_msgSend(v0, "BOOLForKey:", v1);

  byte_100024740 = (char)v0;
}

uint64_t sub_100008434()
{
  uint64_t result;

  result = sub_100008450();
  byte_100024741 = result;
  return result;
}

uint64_t sub_100008450()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  unsigned __int8 v9;
  _OWORD v10[2];
  _OWORD v11[2];

  if (qword_100023400 != -1)
    swift_once(&qword_100023400, sub_10000832C);
  v0 = (void *)qword_100023838;
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (!v2)
    return 2;
  _bridgeAnyObjectToAny(_:)(v10, v2);
  swift_unknownObjectRelease(v2);
  sub_100008850(v10, v11);
  sub_100005ECC((uint64_t)v11, (uint64_t)v10);
  if ((swift_dynamicCast(&v9, v10, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) == 0)
  {
    sub_100008860(v11);
    return 2;
  }
  v3 = v9;
  v4 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v5 + 56) = &type metadata for Bool;
  *(_QWORD *)(v5 + 64) = &protocol witness table for Bool;
  *(_BYTE *)(v5 + 32) = v3;
  sub_100006808();
  v6 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Prefer client side auth key found in defaults with value %d", v8);
  swift_bridgeObjectRelease(v5);

  sub_100008860(v11);
  return v3;
}

unint64_t sub_1000085EC()
{
  unint64_t result;

  result = sub_100008614();
  dword_100024744 = result;
  byte_100024748 = BYTE4(result) & 1;
  return result;
}

unint64_t sub_100008614()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  unsigned int v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  if (qword_100023400 != -1)
    swift_once(&qword_100023400, sub_10000832C);
  v0 = (void *)qword_100023838;
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v11, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_100005FF8((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_100005D74((uint64_t)v12);
    goto LABEL_10;
  }
  if ((swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, &type metadata for Int32, 6) & 1) == 0)
  {
LABEL_10:
    v3 = 0;
    v7 = 1;
    return v3 | ((unint64_t)v7 << 32);
  }
  v3 = v10;
  v4 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v5 + 56) = &type metadata for Int32;
  *(_QWORD *)(v5 + 64) = &protocol witness table for Int32;
  *(_DWORD *)(v5 + 32) = v3;
  sub_100006808();
  v6 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Prefer client side auth type key found in defaults with value %d", v9);
  swift_bridgeObjectRelease(v5);

  v7 = 0;
  return v3 | ((unint64_t)v7 << 32);
}

id sub_1000087FC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteSetupUserDefaults();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteSetupUserDefaults()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup23RemoteSetupUserDefaults);
}

_OWORD *sub_100008850(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008860(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

char *sub_100008880(void *a1)
{
  void *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for SetupFailedCardViewController();
  v3 = (char *)objc_msgSendSuper2(&v16, "initWithContentView:", a1);
  v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  *(_QWORD *)v4 = 0xD000000000000011;
  *((_QWORD *)v4 + 1) = 0x8000000100015C80;
  v6 = v3;
  swift_bridgeObjectRelease(v5);
  v7 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase + 8];
  *(_QWORD *)v7 = 0xD000000000000014;
  *((_QWORD *)v7 + 1) = 0x8000000100015CA0;
  swift_bridgeObjectRelease(v8);
  v9 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  v10 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  *(_QWORD *)v9 = 0xD000000000000017;
  *((_QWORD *)v9 + 1) = 0x8000000100015CC0;
  swift_bridgeObjectRelease(v10);
  v11 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName + 8];
  *(_QWORD *)v11 = 0xD000000000000016;
  *((_QWORD *)v11 + 1) = 0x8000000100015CE0;
  swift_bridgeObjectRelease(v12);
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
  v14 = *(void **)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v13;

  return v6;
}

id sub_100008A08()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupFailedCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupFailedCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup29SetupFailedCardViewController);
}

char *sub_100008A58(void *a1)
{
  void *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for SetupCancelledCardViewController();
  v3 = (char *)objc_msgSendSuper2(&v16, "initWithContentView:", a1);
  v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  *(_QWORD *)v4 = 0xD000000000000014;
  *((_QWORD *)v4 + 1) = 0x8000000100015D50;
  v6 = v3;
  swift_bridgeObjectRelease(v5);
  v7 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase + 8];
  *(_QWORD *)v7 = 0xD000000000000017;
  *((_QWORD *)v7 + 1) = 0x8000000100015D70;
  swift_bridgeObjectRelease(v8);
  v9 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  v10 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  *(_QWORD *)v9 = 0xD00000000000001ALL;
  *((_QWORD *)v9 + 1) = 0x8000000100015D90;
  swift_bridgeObjectRelease(v10);
  v11 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName + 8];
  *(_QWORD *)v11 = 0xD000000000000020;
  *((_QWORD *)v11 + 1) = 0x8000000100015DB0;
  swift_bridgeObjectRelease(v12);
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "systemOrangeColor");
  v14 = *(void **)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v13;

  return v6;
}

id sub_100008BE0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupCancelledCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupCancelledCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup32SetupCancelledCardViewController);
}

uint64_t sub_100008C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_remoteSetupManager);
  if (!v2)
  {
    v5 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v5);
    v7 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Using generic subtitle for symbol card", 66, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);
LABEL_12:

    v12 = v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase;
    v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain(*(_QWORD *)(v12 + 8));
    return v9;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 11)
  {
    v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase
                                       + 8));
    v4 = 0x4E4F495349565FLL;
    goto LABEL_8;
  }
  if (v3 == 3)
  {
    v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
    swift_bridgeObjectRetain(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase
                                       + 8));
    v4 = 0x444150495FLL;
    v8 = 0xE500000000000000;
    goto LABEL_10;
  }
  if (v3 != 1)
  {
    v10 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v10);
    v11 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unsupported device class. Using generic subtitle for symbol card", 64, 2, &_mh_execute_header, v6, v11, &_swiftEmptyArrayStorage);
    goto LABEL_12;
  }
  v14 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase);
  swift_bridgeObjectRetain(*(_QWORD *)(v0
                                     + OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase
                                     + 8));
  v4 = 0x454E4F4850495FLL;
LABEL_8:
  v8 = 0xE700000000000000;
LABEL_10:
  String.append(_:)(*(Swift::String *)&v4);
  return v14;
}

id sub_100008DEC(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  objc_super v16;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_remoteSetupManager;
  v4 = qword_100023440;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v6 = (void *)qword_100024770;
  *(_QWORD *)&v5[v3] = qword_100024770;
  v7 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  *(_QWORD *)v7 = 0xD000000000000016;
  *((_QWORD *)v7 + 1) = 0x8000000100015EA0;
  v8 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  *(_QWORD *)v8 = 0xD000000000000019;
  *((_QWORD *)v8 + 1) = 0x8000000100015EC0;
  v9 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  *(_QWORD *)v9 = 0xD00000000000001CLL;
  *((_QWORD *)v9 + 1) = 0x8000000100015EE0;
  v10 = &v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  strcpy(&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName], "ladybug.circle");
  v10[15] = -18;
  v11 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor;
  v12 = (void *)objc_opt_self(UIColor);
  v13 = v6;
  *(_QWORD *)&v5[v11] = objc_msgSend(v12, "systemPurpleColor");
  *(_QWORD *)&v5[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolSize] = 0x4052000000000000;

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  v14 = objc_msgSendSuper2(&v16, "initWithContentView:", a1);
  objc_msgSend(v14, "setDismissalType:", 1);

  return v14;
}

void sub_100008FC4(char a1)
{
  char *v1;
  char *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  NSString v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  void *v18;
  NSString v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSString v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  Class isa;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  Swift::String v38;
  Swift::String v39;
  void *v40;
  NSString v41;
  id v42;
  _QWORD aBlock[5];
  uint64_t v44;
  objc_super v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;

  v2 = v1;
  v45.receiver = v2;
  v45.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  objc_msgSendSuper2(&v45, "viewWillAppear:", a1 & 1);
  v5 = *(_QWORD *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  v4 = *(void **)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  v6 = (void *)objc_opt_self(NSBundle);
  swift_bridgeObjectRetain(v4);
  v7 = objc_msgSend(v6, "mainBundle");
  v46._object = (void *)0xEA0000000000656CLL;
  v8._countAndFlagsBits = v5;
  v8._object = v4;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v46._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v7, v9, v46)._object;
  swift_bridgeObjectRelease(v4);

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v2, "setTitle:", v11);

  v12 = swift_allocObject(&unk_10001CD30, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v2);
  v14 = *(_QWORD *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  v13 = *(void **)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  swift_bridgeObjectRetain(v13);
  v15 = objc_msgSend(v6, "mainBundle");
  v47._object = (void *)0xEB000000006E6F74;
  v16._countAndFlagsBits = v14;
  v16._object = v13;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v47._countAndFlagsBits = 0x74756220656E6F44;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v47)._object;
  swift_bridgeObjectRelease(v13);

  swift_retain(v12);
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  aBlock[4] = sub_1000096CC;
  v44 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CA38;
  aBlock[3] = &unk_10001CD48;
  v20 = _Block_copy(aBlock);
  v21 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v19, 0, v20);

  _Block_release(v20);
  swift_release(v44);

  v22 = *(_QWORD *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName + 8];
  swift_bridgeObjectRetain(v22);
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  v24 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v23);

  v25 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v24);
  objc_msgSend(v25, "setTintColor:", *(_QWORD *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor]);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithPointSize:", *(double *)&v2[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolSize]);
  objc_msgSend(v25, "setPreferredSymbolConfiguration:", v26);

  objc_msgSend(v25, "setContentMode:", 1);
  v27 = objc_msgSend(v2, "contentView");
  v28 = sub_1000036E0(&qword_1000234B8);
  v29 = swift_allocObject(v28, 40, 7);
  *(_OWORD *)(v29 + 16) = xmmword_100014960;
  *(_QWORD *)(v29 + 32) = v25;
  aBlock[0] = v29;
  specialized Array._endMutation()();
  v30 = aBlock[0];
  sub_100003720(0, &qword_100023918, UIImageView_ptr);
  v31 = v25;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v30);
  objc_msgSend(v27, "setImageViews:", isa);

  v33 = objc_msgSend(objc_allocWithZone((Class)PRXLabel), "initWithStyle:", 1);
  v34 = sub_100008C30();
  v36 = v35;
  v37 = objc_msgSend(v6, "mainBundle");
  v48._object = (void *)0xED0000656C746974;
  v38._countAndFlagsBits = v34;
  v38._object = v36;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  v48._countAndFlagsBits = 0x6275732064726143;
  v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v48)._object;
  swift_bridgeObjectRelease(v36);

  v41 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v40);
  objc_msgSend(v33, "setText:", v41);

  v42 = objc_msgSend(v2, "contentView");
  objc_msgSend(v42, "setBodyLabel:", v33);
  swift_release(v12);

}

void sub_100009530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

id sub_1000095D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SFSymbolCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SFSymbolCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController);
}

uint64_t sub_1000096A8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000096CC(uint64_t a1)
{
  uint64_t v1;

  sub_100009530(a1, v1);
}

uint64_t sub_1000096D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000096E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000096EC(uint64_t a1)
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

id sub_100009718(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  NSString v15;
  id v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  void *v20;
  uint64_t v21;
  NSString v22;
  void *v23;
  id v24;
  uint64_t v25;
  Swift::String v26;
  Class isa;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  Class v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  Swift::String v40;
  Swift::String v41;
  void *v42;
  NSString v43;
  id v44;
  id v45;
  void *v47;
  _QWORD aBlock[5];
  uint64_t v49;
  objc_super v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup25WelcomeCardViewController_remoteSetupManager;
  v4 = qword_100023440;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v6 = (void *)qword_100024770;
  *(_QWORD *)&v5[v3] = qword_100024770;
  v7 = v6;

  v50.receiver = v5;
  v50.super_class = (Class)type metadata accessor for WelcomeCardViewController();
  v8 = objc_msgSendSuper2(&v50, "initWithContentView:", a1);
  objc_msgSend(v8, "setDismissalType:", 1);
  v47 = a1;
  v9 = (void *)objc_opt_self(NSBundle);
  v10 = v8;
  v11 = objc_msgSend(v9, "mainBundle");
  v51._object = (void *)0xEA0000000000656CLL;
  v12._object = (void *)0x80000001000162E0;
  v12._countAndFlagsBits = 0xD000000000000012;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v51._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v51)._object;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v10, "setTitle:", v15);

  v16 = v10;
  v17 = objc_msgSend(v9, "mainBundle");
  v52._countAndFlagsBits = 0xD000000000000018;
  v18._countAndFlagsBits = 0xD000000000000019;
  v52._object = (void *)0x8000000100016320;
  v18._object = (void *)0x8000000100016300;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v18, (Swift::String_optional)0, (NSBundle)v17, v19, v52)._object;

  v21 = swift_allocObject(&unk_10001CD80, 24, 7);
  swift_unknownObjectWeakInit(v21 + 16, v16);
  swift_retain(v21);
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  aBlock[4] = sub_10000A9C4;
  v49 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CA38;
  aBlock[3] = &unk_10001CD98;
  v23 = _Block_copy(aBlock);
  v24 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v22, 0, v23);

  _Block_release(v23);
  v25 = v49;
  swift_release(v21);
  swift_release(v25);

  sub_100003720(0, &qword_100023950, UIImage_ptr);
  v26._countAndFlagsBits = 0x74736F6E67616944;
  v26._object = (void *)0xEB00000000736369;
  isa = UIImage.init(imageLiteralResourceName:)(v26).super.isa;
  v28 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", isa);
  v29 = objc_msgSend(v16, "contentView");
  v30 = sub_1000036E0(&qword_1000234B8);
  v31 = swift_allocObject(v30, 40, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100014960;
  *(_QWORD *)(v31 + 32) = v28;
  aBlock[0] = v31;
  specialized Array._endMutation()();
  v32 = aBlock[0];
  sub_100003720(0, &qword_100023918, UIImageView_ptr);
  v33 = v28;
  v34 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  objc_msgSend(v29, "setImageViews:", v34);

  v35 = objc_msgSend(objc_allocWithZone((Class)PRXLabel), "initWithStyle:", 1);
  v36 = sub_10000A274();
  v38 = v37;
  v39 = objc_msgSend(v9, "mainBundle");
  v53._countAndFlagsBits = 0xD000000000000015;
  v53._object = (void *)0x8000000100016340;
  v40._countAndFlagsBits = v36;
  v40._object = v38;
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  v42 = NSLocalizedString(_:tableName:bundle:value:comment:)(v40, (Swift::String_optional)0, (NSBundle)v39, v41, v53)._object;
  swift_bridgeObjectRelease(v38);

  v43 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v42);
  objc_msgSend(v35, "setText:", v43);

  v44 = objc_msgSend(v16, "contentView");
  v45 = v35;
  objc_msgSend(v44, "setBodyLabel:", v45);

  return v16;
}

void sub_100009C48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD aBlock[5];
  uint64_t v16;
  char v17[24];
  Swift::String v18;

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v17, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v18._object = (void *)0xED00002E2E2E676ELL;
    v6._object = (void *)0x80000001000159A0;
    v6._countAndFlagsBits = 0xD000000000000017;
    v7._countAndFlagsBits = 0;
    v7._object = (void *)0xE000000000000000;
    v18._countAndFlagsBits = 0x697463656E6E6F43;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v18)._object;

    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    objc_msgSend(v4, "showActivityIndicatorWithStatus:", v9);

    v10 = (void *)objc_opt_self(ASTLocalization);
    v11 = swift_allocObject(&unk_10001CDD0, 24, 7);
    *(_QWORD *)(v11 + 16) = v4;
    aBlock[4] = sub_10000AA08;
    v16 = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000A0A8;
    aBlock[3] = &unk_10001CDE8;
    v12 = _Block_copy(aBlock);
    v13 = v16;
    v14 = v4;
    swift_release(v13);
    objc_msgSend(v10, "prepareLocalizedStringsWithCompletionHandler:", v12);
    _Block_release(v12);

  }
}

uint64_t sub_100009DEC(char a1, uint64_t a2, void *a3)
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD aBlock[5];
  uint64_t v28;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    v14 = static os_log_type_t.error.getter(v11);
    v15 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v16 = (void *)static OS_os_log.default.getter(v15);
    os_log(_:dso:log:type:_:)("Unable to get localized strings from AST 2. Bundled text will be used from here", 79, 2, &_mh_execute_header, v16, v14, &_swiftEmptyArrayStorage);

  }
  sub_100003720(0, &qword_100023958, OS_dispatch_queue_ptr);
  v17 = (void *)static OS_dispatch_queue.main.getter();
  v18 = swift_allocObject(&unk_10001CE20, 24, 7);
  *(_QWORD *)(v18 + 16) = a3;
  aBlock[4] = sub_10000AA10;
  v28 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000096EC;
  aBlock[3] = &unk_10001CE38;
  v19 = _Block_copy(aBlock);
  v20 = v28;
  v21 = a3;
  v22 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v22);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v23 = sub_10000AA18();
  v24 = sub_1000036E0(&qword_100023968);
  v25 = sub_10000AA60();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v5, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v8, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

void sub_10000A028(void *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = type metadata accessor for TermsAndConditionsCardViewController();
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)), "init");
  v3 = objc_msgSend(a1, "navigationController");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "pushViewController:animated:", v5, 1);

  }
}

void sub_10000A0A8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

unint64_t sub_10000A134()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = 0xD000000000000015;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup25WelcomeCardViewController_remoteSetupManager);
  if (!v2)
  {
    v4 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter(v4);
    v6 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Using generic subtitle for welcome card", 67, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);
LABEL_10:

    return v1;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1)
    return 0xD00000000000001CLL;
  if (v3 == 11)
    return 0xD00000000000001CLL;
  if (v3 != 3)
  {
    v7 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter(v7);
    v8 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unsupported device class. Using generic title subtitle for welcome card", 71, 2, &_mh_execute_header, v5, v8, &_swiftEmptyArrayStorage);
    goto LABEL_10;
  }
  return 0xD00000000000001ALL;
}

uint64_t sub_10000A274()
{
  unint64_t v0;
  void *v1;
  void *v2;
  id v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *object;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  void *v22;
  uint64_t v23;
  Swift::String v25;

  v0 = sub_10000A134();
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v25._object = (void *)0x8000000100015FE0;
  v4._countAndFlagsBits = v0;
  v4._object = v2;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v25._countAndFlagsBits = 0xD00000000000001ALL;
  v6 = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v3, v5, v25);
  swift_bridgeObjectRelease(v2);

  v7 = sub_10000A498();
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    v11 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v12 = swift_allocObject(v11, 72, 7);
    *(_OWORD *)(v12 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v12 + 56) = &type metadata for String;
    *(_QWORD *)(v12 + 64) = sub_100005FB4();
    *(_QWORD *)(v12 + 32) = v9;
    *(_QWORD *)(v12 + 40) = v10;
    v13._countAndFlagsBits = String.init(format:_:)(4203786, 0xE300000000000000, v12);
    object = v13._object;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(object);
  }
  v15 = sub_10000A6C8();
  if (v16)
  {
    v17 = v15;
    v18 = v16;
    v19 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v20 = swift_allocObject(v19, 72, 7);
    *(_OWORD *)(v20 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    *(_QWORD *)(v20 + 64) = sub_100005FB4();
    *(_QWORD *)(v20 + 32) = v17;
    *(_QWORD *)(v20 + 40) = v18;
    v21._countAndFlagsBits = String.init(format:_:)(4203786, 0xE300000000000000, v20);
    v22 = v21._object;
    String.append(_:)(v21);
    swift_bridgeObjectRelease(v22);
  }
  v23 = String.init(format:_:)(v6._countAndFlagsBits, v6._object, &_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v6._object);
  return v23;
}

id sub_10000A438()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WelcomeCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WelcomeCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup25WelcomeCardViewController);
}

uint64_t sub_10000A498()
{
  void *v0;
  id v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  Swift::String v18;

  if (qword_100023428 != -1)
    swift_once(&qword_100023428, sub_10000C4C8);
  if (byte_100024749)
    v0 = (void *)0x8000000100016190;
  else
    v0 = (void *)0x8000000100016100;
  v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v18._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0xD000000000000026;
  v2._object = v0;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v18._countAndFlagsBits = 0x6B726F7774654ELL;
  v4 = NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)v1, v3, v18);

  swift_bridgeObjectRelease(v0);
  if (qword_100023420 != -1)
    swift_once(&qword_100023420, sub_10000C480);
  v5 = objc_msgSend((id)qword_100023A90, "networkName");
  v6 = v5;
  if (v5)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v9 = v8;

    v10 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v11 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v11 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v11 + 56) = &type metadata for String;
    *(_QWORD *)(v11 + 64) = sub_100005FB4();
    *(_QWORD *)(v11 + 32) = v7;
    *(_QWORD *)(v11 + 40) = v9;
    v12 = String.init(format:_:)(v4._countAndFlagsBits, v4._object, v11);
    swift_bridgeObjectRelease(v4._object);
  }
  else
  {
    v13 = swift_bridgeObjectRelease(v4._object);
    v14 = static os_log_type_t.error.getter(v13);
    v15 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v16 = (void *)static OS_os_log.default.getter(v15);
    os_log(_:dso:log:type:_:)("Failed to get device network. Welcome card will present without transferred network", 83, 2, &_mh_execute_header, v16, v14, &_swiftEmptyArrayStorage);

    return 0;
  }
  return v12;
}

uint64_t sub_10000A6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  Swift::String v15;
  Swift::String_optional v16;
  uint64_t countAndFlagsBits;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  Swift::String v30;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self(NSBundle);
  v5 = objc_msgSend(v4, "mainBundle");
  v30._object = (void *)0xE800000000000000;
  v6._object = (void *)0x8000000100016000;
  v6._countAndFlagsBits = 0xD00000000000002ALL;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v30._countAndFlagsBits = 0x65676175676E614CLL;
  v8 = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v30);

  v9 = objc_msgSend(v4, "mainBundle");
  v10 = objc_msgSend(v9, "preferredLocalizations");

  v11 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, &type metadata for String);
  if (v11[2])
  {
    v12 = v11[4];
    v13 = (void *)v11[5];
    swift_bridgeObjectRetain(v13);
    v14 = swift_bridgeObjectRelease(v11);
    static Locale.current.getter(v14);
    v15._countAndFlagsBits = v12;
    v15._object = v13;
    v16 = Locale.localizedString(forLanguageCode:)(v15);
    countAndFlagsBits = v16.value._countAndFlagsBits;
    swift_bridgeObjectRelease(v13);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (v16.value._object)
    {
      v18 = sub_1000036E0((uint64_t *)&unk_1000235F0);
      v19 = swift_allocObject(v18, 72, 7);
      *(_OWORD *)(v19 + 16) = xmmword_1000147B0;
      *(_QWORD *)(v19 + 56) = &type metadata for String;
      *(_QWORD *)(v19 + 64) = sub_100005FB4();
      *(Swift::String_optional *)(v19 + 32) = v16;
      countAndFlagsBits = String.init(format:_:)(v8._countAndFlagsBits, v8._object, v19);
      swift_bridgeObjectRelease(v8._object);
    }
    else
    {
      v24 = swift_bridgeObjectRelease(v8._object);
      v25 = static os_log_type_t.error.getter(v24);
      v26 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v27 = (void *)static OS_os_log.default.getter(v26);
      os_log(_:dso:log:type:_:)("Failed to get localized language for the current locale. Welcome card will display without Language setting", 107, 2, &_mh_execute_header, v27, v25, &_swiftEmptyArrayStorage);

    }
  }
  else
  {
    swift_bridgeObjectRelease(v8._object);
    v20 = swift_bridgeObjectRelease(v11);
    v21 = static os_log_type_t.error.getter(v20);
    v22 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v23 = (void *)static OS_os_log.default.getter(v22);
    os_log(_:dso:log:type:_:)("Failed to get language code from bundle. Welcome card will display without Language setting", 91, 2, &_mh_execute_header, v23, v21, &_swiftEmptyArrayStorage);

    return 0;
  }
  return countAndFlagsBits;
}

uint64_t sub_10000A9A0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000A9C4(uint64_t a1)
{
  uint64_t v1;

  sub_100009C48(a1, v1);
}

uint64_t sub_10000A9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A9DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A9E4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AA08(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100009DEC(a1, a2, *(void **)(v2 + 16));
}

void sub_10000AA10()
{
  uint64_t v0;

  sub_10000A028(*(void **)(v0 + 16));
}

unint64_t sub_10000AA18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100023960;
  if (!qword_100023960)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100023960);
  }
  return result;
}

unint64_t sub_10000AA60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100023970;
  if (!qword_100023970)
  {
    v1 = sub_10000AAAC(&qword_100023968);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100023970);
  }
  return result;
}

uint64_t sub_10000AAAC(uint64_t *a1)
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

id sub_10000AB04(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  void *object;
  NSString v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  void *v23;
  NSString v24;
  objc_super v26;
  Swift::String v27;
  Swift::String v28;

  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewOffsetFromLabel] = 0x4039000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewAspectRatioHeightMultiplier] = 0x3FE5555555555555;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession] = 0;
  v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] = 0;
  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager;
  v4 = qword_100023440;
  v5 = v1;
  if (v4 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v6 = (void *)qword_100024770;
  *(_QWORD *)&v5[v3] = qword_100024770;
  v7 = v6;

  v26.receiver = v5;
  v26.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  v8 = objc_msgSendSuper2(&v26, "initWithContentView:", a1);
  objc_msgSend(v8, "setDismissalType:", 1);
  v9 = (void *)objc_opt_self(NSBundle);
  v10 = v8;
  v11 = objc_msgSend(v9, "mainBundle");
  v27._object = (void *)0xEA0000000000656CLL;
  v12._object = (void *)0x8000000100016790;
  v12._countAndFlagsBits = 0xD000000000000015;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  v27._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v27)._object;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v10, "setTitle:", v15);

  v16 = v10;
  v17 = sub_10000BDC0();
  v19 = v18;
  v20 = objc_msgSend(v9, "mainBundle");
  v28._object = (void *)0xEF736E6F69746365;
  v21._countAndFlagsBits = v17;
  v21._object = v19;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v28._countAndFlagsBits = 0x726964206E616353;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v28)._object;
  swift_bridgeObjectRelease(v19);

  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v16, "setSubtitle:", v24);

  return v16;
}

void sub_10000AEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer;
  v4 = *(void **)(a2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer);
  if (v4)
  {
    v5 = objc_msgSend(v4, "connection");
    if (v5)
    {
      v6 = v5;
      sub_10000BB04();
      objc_msgSend(v6, "setVideoOrientation:", v7);

    }
  }
  v8 = *(void **)(a2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView);
  if (v8)
  {
    v9 = *(void **)(a2 + v3);
    if (v9)
    {
      v11 = v8;
      v10 = v9;
      objc_msgSend(v11, "bounds");
      objc_msgSend(v10, "setFrame:");

    }
  }
}

uint64_t sub_10000AFBC(uint64_t a1, uint64_t a2)
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

void sub_10000B118()
{
  char *v0;
  _BYTE *v1;
  void *v2;
  _BYTE *v3;
  id v4;
  id v5;

  objc_msgSend(v0, "dismissViewControllerAnimated:completion:", 1, 0);
  v1 = *(_BYTE **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager];
  if (v1)
  {
    v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
    v2 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
    v3 = v1;
    if (v2)
      objc_msgSend(v2, "invalidate");
    v4 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    v5 = v4;
    if (qword_100023470 != -1)
    {
      swift_once(&qword_100023470, sub_1000127DC);
      v4 = v5;
    }
    objc_msgSend(v4, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0);

  }
}

void sub_10000B224()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  double Width;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  Class isa;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  id v62;
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
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  _QWORD v82[3];
  char v83[16];
  id v84;
  CGRect v85;

  v1 = v0;
  v80 = objc_msgSend(objc_allocWithZone((Class)AVCaptureSession), "init");
  v2 = objc_msgSend((id)objc_opt_self(AVCaptureDevice), "defaultDeviceWithDeviceType:mediaType:position:", AVCaptureDeviceTypeBuiltInWideAngleCamera, AVMediaTypeVideo, 1);
  if (v2)
  {
    v3 = v2;
    v4 = objc_allocWithZone((Class)AVCaptureDeviceInput);
    v84 = 0;
    v5 = v3;
    v6 = objc_msgSend(v4, "initWithDevice:error:", v5, &v84);
    v7 = v84;
    if (v6)
    {
      v8 = v6;
      v9 = v84;

      if ((objc_msgSend(v80, "canAddInput:", v8) & 1) != 0)
        objc_msgSend(v80, "addInput:", v8);

      objc_msgSend(v80, "commitConfiguration");
      v10 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession];
      *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession] = v80;
      v11 = v80;

      v12 = objc_msgSend(v1, "contentView");
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v21 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", v14, v16, v18, v20);
      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v22 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
      objc_msgSend(v21, "setBackgroundColor:", v22);

      v23 = objc_msgSend(v1, "contentView");
      objc_msgSend(v23, "addSubview:", v21);

      v24 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView];
      *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_previewView] = v21;
      v25 = v21;

      v26 = objc_msgSend(v1, "contentView");
      v27 = objc_msgSend(v26, "mainContentGuide");

      objc_msgSend(v27, "layoutFrame");
      Width = CGRectGetWidth(v85);
      v29 = objc_msgSend(v1, "contentView");
      v30 = objc_msgSend(v29, "subtitleLabel");

      if (v30)
      {
        v81 = (id)objc_opt_self(NSLayoutConstraint);
        v32 = sub_1000036E0(&qword_1000234B8);
        v33 = swift_allocObject(v32, 80, 7);
        *(_OWORD *)(v33 + 16) = xmmword_1000149B0;
        v34 = objc_msgSend(v25, "topAnchor");
        v79 = v30;
        v35 = objc_msgSend(v30, "bottomAnchor");
        v36 = objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:constant:", v35, *(double *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_cameraPreviewOffsetFromLabel]);

        *(_QWORD *)(v33 + 32) = v36;
        v37 = objc_msgSend(v25, "bottomAnchor");
        v38 = objc_msgSend(v1, "contentView");
        v39 = objc_msgSend(v38, "bottomAnchor");

        v40 = objc_msgSend(v37, "constraintEqualToAnchor:", v39);
        *(_QWORD *)(v33 + 40) = v40;
        v41 = objc_msgSend(v25, "centerXAnchor");
        v42 = objc_msgSend(v27, "centerXAnchor");
        v43 = objc_msgSend(v41, "constraintEqualToAnchor:", v42);

        *(_QWORD *)(v33 + 48) = v43;
        v44 = objc_msgSend(v25, "centerYAnchor");
        v45 = objc_msgSend(v27, "centerYAnchor");
        v46 = objc_msgSend(v44, "constraintEqualToAnchor:", v45);

        *(_QWORD *)(v33 + 56) = v46;
        v47 = objc_msgSend(v25, "widthAnchor");
        v48 = objc_msgSend(v47, "constraintEqualToConstant:", Width);

        *(_QWORD *)(v33 + 64) = v48;
        v49 = objc_msgSend(v25, "heightAnchor");
        v50 = objc_msgSend(v49, "constraintEqualToConstant:", Width * 0.666666667);

        *(_QWORD *)(v33 + 72) = v50;
        v84 = (id)v33;
        specialized Array._endMutation()();
        v51 = v84;
        sub_100003720(0, &qword_100023A70, NSLayoutConstraint_ptr);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v51);
        objc_msgSend(v81, "activateConstraints:", isa);

        v53 = objc_msgSend(v1, "view");
        if (v53)
        {
          v54 = v53;
          objc_msgSend(v53, "layoutIfNeeded");

          v55 = objc_msgSend(objc_allocWithZone((Class)AVCaptureVideoPreviewLayer), "initWithSession:", v11);
          objc_msgSend(v55, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
          v56 = objc_msgSend(v55, "connection");
          if (v56)
          {
            v57 = v56;
            sub_10000BB04();
            objc_msgSend(v57, "setVideoOrientation:", v58);

          }
          v59 = v55;
          objc_msgSend(v25, "bounds");
          objc_msgSend(v59, "setFrame:");

          v60 = objc_msgSend(v25, "layer");
          objc_msgSend(v60, "addSublayer:", v59);

          v61 = *(void **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer];
          *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_capturePreviewLayer] = v59;

        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        v76 = static os_log_type_t.error.getter(v31);
        v77 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
        v78 = (void *)static OS_os_log.default.getter(v77);
        os_log(_:dso:log:type:_:)("QR code scanner card has no subtitle label, which preview constraints depend on", 79, 2, &_mh_execute_header, v78, v76, &_swiftEmptyArrayStorage);

        sub_10000B118();
      }
    }
    else
    {
      v62 = v84;
      v63 = _convertNSErrorToError(_:)(v7);

      swift_willThrow();
      v65 = static os_log_type_t.error.getter(v64);
      v66 = sub_1000036E0((uint64_t *)&unk_1000235F0);
      v67 = swift_allocObject(v66, 72, 7);
      *(_OWORD *)(v67 + 16) = xmmword_1000147B0;
      swift_getErrorValue(v63, v83, v82);
      v68 = Error.localizedDescription.getter(v82[1], v82[2]);
      v70 = v69;
      v71 = String.debugDescription.getter(v68);
      v73 = v72;
      swift_bridgeObjectRelease(v70);
      *(_QWORD *)(v67 + 56) = &type metadata for String;
      *(_QWORD *)(v67 + 64) = sub_100005FB4();
      *(_QWORD *)(v67 + 32) = v71;
      *(_QWORD *)(v67 + 40) = v73;
      v74 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v75 = (void *)static OS_os_log.default.getter(v74);
      os_log(_:dso:log:type:_:)("Setting up viewfinder for QR code scanner card failed with error %@", 67, 2, &_mh_execute_header, v75, v65, v67);
      swift_bridgeObjectRelease(v67);

      sub_10000B118();
      swift_errorRelease(v63);

    }
  }
  else
  {
    sub_10000B118();

  }
}

void sub_10000BB04()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  v1 = objc_msgSend(v0, "parentViewController");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "view");

    if (v3)
    {
      v4 = objc_msgSend(v3, "window");

      if (v4)
      {
        v5 = objc_msgSend(v4, "windowScene");

        if (v5)
        {
          objc_msgSend(v5, "interfaceOrientation");

        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000BBD4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  Class isa;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_captureSession);
  if (v2)
  {
    v3 = objc_allocWithZone((Class)AVCaptureMetadataOutput);
    v4 = v2;
    v5 = objc_msgSend(v3, "init");
    objc_msgSend(v4, "addOutput:", v5);
    sub_100003720(0, &qword_100023958, OS_dispatch_queue_ptr);
    v6 = (void *)static OS_dispatch_queue.main.getter();
    objc_msgSend(v5, "setMetadataObjectsDelegate:queue:", v1, v6);

    v7 = sub_1000036E0((uint64_t *)&unk_100023A50);
    v8 = swift_allocObject(v7, 40, 7);
    *(_OWORD *)(v8 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v8 + 32) = AVMetadataObjectTypeQRCode;
    type metadata accessor for ObjectType(0);
    v9 = AVMetadataObjectTypeQRCode;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v5, "setMetadataObjectTypes:", isa);

  }
  else
  {
    sub_10000B118();
  }
}

unint64_t sub_10000BDC0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = 0xD000000000000018;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager);
  if (!v2)
  {
    v4 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter(v4);
    v6 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Using generic subtitle for QR code scanner card", 75, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);
LABEL_10:

    return v1;
  }
  v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v3 == 1)
    return 0xD00000000000001FLL;
  if (v3 == 11)
    return 0xD00000000000001FLL;
  if (v3 != 3)
  {
    v7 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter(v7);
    v8 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unsupported device class. Using generic subtitle for in QR code scanner card", 76, 2, &_mh_execute_header, v5, v8, &_swiftEmptyArrayStorage);
    goto LABEL_10;
  }
  return 0xD00000000000001DLL;
}

id sub_10000BF00()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QRCodeScannerCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for QRCodeScannerCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController);
}

char *sub_10000BFA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000036E0((uint64_t *)&unk_100023A80);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C0B4(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C0B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000C1A4(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _UNKNOWN **v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _UNKNOWN **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  _BYTE *v33;
  unint64_t v34;
  char *v35;

  v2 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v26 = a1;
    else
      v26 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    result = _CocoaArrayWrapper.endIndex.getter(v26);
    v3 = result;
    v33 = v1;
    if (result)
      goto LABEL_3;
LABEL_22:
    v35 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_23;
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain(a1);
  v33 = v1;
  if (!v3)
    goto LABEL_22;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  v5 = 0;
  v6 = v2 & 0xC000000000000001;
  v34 = v2 & 0xC000000000000001;
  v35 = (char *)&_swiftEmptyArrayStorage;
  v7 = &_s10Foundation15AttributeScopesO5UIKitE0D10AttributesV04FontB0OAA19AttributedStringKeyADMc_ptr;
  do
  {
    if (v6)
      v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v2);
    else
      v9 = *(id *)(v2 + 8 * v5 + 32);
    v10 = v9;
    v11 = objc_opt_self(v7[155]);
    v12 = swift_dynamicCastObjCClass(v10, v11);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = v10;
      v15 = objc_msgSend(v13, "stringValue");
      if (v15)
      {
        v16 = v15;
        v17 = v2;
        v18 = v3;
        v19 = v7;
        v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        v22 = v21;

        if ((swift_isUniquelyReferenced_nonNull_native(v35) & 1) != 0)
          v23 = v35;
        else
          v23 = sub_10000BFA8(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
        v25 = *((_QWORD *)v23 + 2);
        v24 = *((_QWORD *)v23 + 3);
        if (v25 >= v24 >> 1)
          v23 = sub_10000BFA8((char *)(v24 > 1), v25 + 1, 1, v23);
        *((_QWORD *)v23 + 2) = v25 + 1;
        v35 = v23;
        v8 = &v23[16 * v25];
        *((_QWORD *)v8 + 4) = v20;
        *((_QWORD *)v8 + 5) = v22;
        v6 = v34;
        v7 = v19;
        v3 = v18;
        v2 = v17;
      }

    }
    ++v5;
  }
  while (v3 != v5);
LABEL_23:
  swift_bridgeObjectRelease(v2);
  if (*((_QWORD *)v35 + 2)
    && (v33[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] & 1) == 0)
  {
    v29 = *((_QWORD *)v35 + 4);
    v28 = *((_QWORD *)v35 + 5);
    v33[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_codeCaptured] = 1;
    swift_bridgeObjectRetain(v28);
    v30 = objc_msgSend(v33, "navigationController");

    v31 = *(void **)&v33[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeScannerCardViewController_remoteSetupManager];
    if (v31)
    {
      v32 = v31;
      sub_100010B20(v29, v28);
      swift_bridgeObjectRelease(v35);

    }
    else
    {
      swift_bridgeObjectRelease(v35);
    }
    v27 = (char *)v28;
  }
  else
  {
    v27 = v35;
  }
  return swift_bridgeObjectRelease(v27);
}

uint64_t sub_10000C43C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000C460(uint64_t a1)
{
  uint64_t v1;

  sub_10000AEE4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000C468(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C478(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10000C480()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone((Class)CWFInterface), "init");
  result = objc_msgSend(v0, "activate");
  qword_100023A90 = (uint64_t)v0;
  return result;
}

void sub_10000C4C8()
{
  id v0;
  void *v1;
  char wapiCapability;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    wapiCapability = MobileGestalt_get_wapiCapability();

    byte_100024749 = wapiCapability;
  }
  else
  {
    __break(1u);
  }
}

id sub_10000C548()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WifiUtilities();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WifiUtilities()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup13WifiUtilities);
}

uint64_t sub_10000C59C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_100023420 != -1)
    swift_once(&qword_100023420, sub_10000C480);
  v0 = (void *)qword_100023A90;
  v1 = objc_msgSend((id)qword_100023A90, "currentKnownNetworkProfile");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v0, "networkName");
  if (!v3
    || (v3,
        (v4 = objc_msgSend((id)qword_100023A90, "networkName")) == 0))
  {
    v16 = sub_100006808();
    v17 = (void *)static OS_os_log.default.getter(v16);
    v18 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Not connected to wifi, so we aren't connected to a captive portal network.", 74, 2, &_mh_execute_header, v17, v18, &_swiftEmptyArrayStorage);

    return 0;
  }
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v8 = v7;

  v9 = objc_msgSend(v2, "isCaptive");
  v10 = objc_msgSend(v2, "wasCaptive");
  v11 = v9 | v10;
  sub_100006808();
  v12 = swift_bridgeObjectRetain(v8);
  v13 = static OS_os_log.default.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc(24, -1);
    v20 = swift_slowAlloc(32, -1);
    v22 = v20;
    *(_DWORD *)v15 = 136315650;
    swift_bridgeObjectRetain(v8);
    v21 = sub_10000E504(v6, v8, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease_n(v8, 3);
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v21) = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, (char *)&v21 + 4, v15 + 14, v15 + 18);
    *(_WORD *)(v15 + 18) = 1024;
    LODWORD(v21) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, (char *)&v21 + 4, v15 + 20, v15 + 24);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Captive portal network check - current network: %s, Is currently captive: %{BOOL}d, was previously captive: %{BOOL}d", (uint8_t *)v15, 0x18u);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v8, 2);
  }

  return v11;
}

char *sub_10000C85C(void *a1)
{
  void *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  v16.receiver = v1;
  v16.super_class = (Class)type metadata accessor for SetupCompleteCardViewController();
  v3 = (char *)objc_msgSendSuper2(&v16, "initWithContentView:", a1);
  v4 = &v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle];
  v5 = *(_QWORD *)&v3[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardTitle + 8];
  *(_QWORD *)v4 = 0xD000000000000013;
  *((_QWORD *)v4 + 1) = 0x8000000100016870;
  v6 = v3;
  swift_bridgeObjectRelease(v5);
  v7 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase];
  v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_cardSubtitleBase + 8];
  *(_QWORD *)v7 = 0xD000000000000016;
  *((_QWORD *)v7 + 1) = 0x8000000100016890;
  swift_bridgeObjectRelease(v8);
  v9 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText];
  v10 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_buttonText + 8];
  *(_QWORD *)v9 = 0xD000000000000019;
  *((_QWORD *)v9 + 1) = 0x80000001000168B0;
  swift_bridgeObjectRelease(v10);
  v11 = &v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName];
  v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolName + 8];
  *(_QWORD *)v11 = 0xD000000000000010;
  *((_QWORD *)v11 + 1) = 0x80000001000168D0;
  swift_bridgeObjectRelease(v12);
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
  v14 = *(void **)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor];
  *(_QWORD *)&v6[OBJC_IVAR____TtC23CheckerBoardRemoteSetup26SFSymbolCardViewController_symbolColor] = v13;

  return v6;
}

id sub_10000C9E8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetupCompleteCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SetupCompleteCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup31SetupCompleteCardViewController);
}

void sub_10000CA38(uint64_t a1, void *a2)
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

BOOL sub_10000CA88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000CAA0()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000CAE4()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000CB0C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_10000CB4C(void *a1)
{
  _BYTE *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  Swift::String v13;
  Swift::String v14;
  void *object;
  NSString v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  Swift::String v22;
  Swift::String v23;
  void *v24;
  NSString v25;
  id v26;
  id v27;
  Swift::String v28;
  Swift::String v29;
  void *v30;
  uint64_t v31;
  NSString v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v38;
  objc_super v39;
  Swift::String v40;
  Swift::String v41;
  Swift::String v42;

  v3 = &v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password];
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize] = 0x4069000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_qrCodeTransformScale] = 0x4016000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_maxAppClipCodePasswordLength] = 6;
  v4 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager;
  v5 = qword_100023440;
  v6 = v1;
  if (v5 != -1)
    swift_once(&qword_100023440, sub_1000101E8);
  v7 = (void *)qword_100024770;
  *(_QWORD *)&v1[v4] = qword_100024770;
  v8 = v7;

  v39.receiver = v6;
  v39.super_class = (Class)type metadata accessor for QRCodeDisplayCardViewController();
  v9 = objc_msgSendSuper2(&v39, "initWithContentView:", a1);
  objc_msgSend(v9, "setDismissalType:", 1);
  v10 = (void *)objc_opt_self(NSBundle);
  v11 = v9;
  v12 = objc_msgSend(v10, "mainBundle");
  v13._countAndFlagsBits = 0xD00000000000001ALL;
  v40._object = (void *)0xEA0000000000656CLL;
  v13._object = (void *)0x8000000100017090;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v40._countAndFlagsBits = 0x7469742064726143;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v40)._object;

  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v11, "setTitle:", v16);

  v17 = v11;
  v18 = sub_10000DFD4();
  v20 = v19;
  v21 = objc_msgSend(v10, "mainBundle");
  v41._object = (void *)0xEF736E6F69746365;
  v22._countAndFlagsBits = v18;
  v22._object = v20;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v41._countAndFlagsBits = 0x726964206E616353;
  v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v41)._object;
  swift_bridgeObjectRelease(v20);

  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  objc_msgSend(v17, "setSubtitle:", v25);

  if ((sub_10000E12C() & 1) != 0)
  {
    v26 = v17;
    v27 = objc_msgSend(v10, "mainBundle");
    v42._object = (void *)0x80000001000170E0;
    v28._object = (void *)0x80000001000170B0;
    v28._countAndFlagsBits = 0xD000000000000027;
    v29._countAndFlagsBits = 0;
    v29._object = (void *)0xE000000000000000;
    v42._countAndFlagsBits = 0xD000000000000027;
    v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, (Swift::String_optional)0, (NSBundle)v27, v29, v42)._object;

    v31 = swift_allocObject(&unk_10001CF50, 24, 7);
    swift_unknownObjectWeakInit(v31 + 16, v26);
    swift_retain(v31);
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v30);
    aBlock[4] = sub_10000FF08;
    v38 = v31;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CA38;
    aBlock[3] = &unk_10001CF68;
    v33 = _Block_copy(aBlock);
    v34 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v32, 0, v33);

    _Block_release(v33);
    v35 = v38;
    swift_release(v31);
    swift_release(v35);

  }
  return v17;
}

void sub_10000CF60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *Strong;
  char *v4;
  void *v5;
  id v6;
  char v7[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 1, 0);
    v5 = *(void **)&v4[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
    if (v5)
    {
      v6 = v5;
      sub_10001222C();

    }
  }
}

id sub_10000D040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSString v11;
  id v12;
  id v13;
  Class isa;
  NSString v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _BYTE *v20;
  void *v21;
  _BYTE *v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGAffineTransform v28;

  v1 = type metadata accessor for String.Encoding(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password + 8);
  v7 = swift_bridgeObjectRetain(v6);
  static String.Encoding.ascii.getter(v7);
  v8 = String.data(using:allowLossyConversion:)(v4, 0, v5, v6);
  v10 = v9;
  swift_bridgeObjectRelease(v6);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend((id)objc_opt_self(CIFilter), "filterWithName:", v11);

  if (v12)
  {
    v13 = v12;
    if (v10 >> 60 == 15)
    {
      isa = 0;
    }
    else
    {
      sub_10000F8F8(v8, v10);
      isa = Data._bridgeToObjectiveC()().super.isa;
      sub_10000F8E4(v8, v10);
    }
    v15 = String._bridgeToObjectiveC()();
    objc_msgSend(v13, "setValue:forKey:", isa, v15);

    swift_unknownObjectRelease(isa);
  }
  CGAffineTransformMakeScale(&v28, 5.5, 5.5);
  if (!v12)
    goto LABEL_10;
  v26 = *(_OWORD *)&v28.c;
  v27 = *(_OWORD *)&v28.a;
  v25 = *(_OWORD *)&v28.tx;
  v16 = objc_msgSend(v12, "outputImage");
  if (!v16)
    goto LABEL_10;
  v17 = v16;
  *(_OWORD *)&v28.a = v27;
  *(_OWORD *)&v28.c = v26;
  *(_OWORD *)&v28.tx = v25;
  v18 = objc_msgSend(v16, "imageByApplyingTransform:", &v28);

  if (v18)
  {
    v19 = objc_msgSend(objc_allocWithZone((Class)UIImage), "initWithCIImage:", v18);

    sub_10000F8E4(v8, v10);
  }
  else
  {
LABEL_10:
    v20 = *(_BYTE **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
    if (v20)
    {
      v20[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
      v21 = *(void **)&v20[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
      v22 = v20;
      if (v21)
        objc_msgSend(v21, "invalidate");
      v23 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      if (qword_100023470 != -1)
        swift_once(&qword_100023470, sub_1000127DC);
      objc_msgSend(v23, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0);

      sub_10000F8E4(v8, v10);
    }
    else
    {

      sub_10000F8E4(v8, v10);
    }
    return 0;
  }
  return v19;
}

BOOL sub_10000D388(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id sub_10000D3AC()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t ObjectType;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  Class isa;
  void *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(char *, _QWORD *);
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  id result;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v2 = v1;
  v3 = v0;
  ObjectType = swift_getObjectType(v0);
  v5 = (_QWORD *)type metadata accessor for URL(0);
  v6 = *(v5 - 1);
  v7 = __chkstk_darwin(v5);
  v73 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v66 - v9;
  v74 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v11 = static OS_os_log.default.getter(v74);
  v12 = static os_log_type_t.default.getter();
  v13 = v12;
  v14 = os_log_type_enabled(v11, v12);
  v71 = ObjectType;
  if (v14)
  {
    v69 = v5;
    v15 = swift_slowAlloc(12, -1);
    v72 = v3;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    v70 = v6;
    v18 = v17;
    v77 = v17;
    *(_DWORD *)v16 = 136446210;
    v68 = v1;
    v19 = _typeName(_:qualified:)(ObjectType, 0);
    v21 = v20;
    v75 = sub_10000E504(v19, v20, &v77);
    v2 = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v16 + 4, v16 + 12);
    v22 = v21;
    v5 = v69;
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v11, (os_log_type_t)v13, "%{public}s generating App Clip Code.", v16, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    v23 = v18;
    v6 = v70;
    swift_slowDealloc(v23, -1, -1);
    v24 = v16;
    v3 = v72;
    swift_slowDealloc(v24, -1, -1);
  }

  v26 = sub_10000D9B0(v25);
  if (v2)
    return (id)v13;
  v28 = v27;
  sub_10000DDD0((uint64_t)v26, v27, (uint64_t)v10);
  swift_bridgeObjectRelease(v28);
  v29 = sub_10000F3D8();
  v31 = v30;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v33 = (void *)CGSVGDocumentCreateFromData(isa, 0);

  if (!v33)
  {
    v13 = static os_log_type_t.error.getter(v34);
    v54 = (void *)static OS_os_log.default.getter(v13);
    os_log(_:dso:log:type:_:)("Failed to create CGSVGDocument from Data.", 41, 2, &_mh_execute_header, v54, v13, &_swiftEmptyArrayStorage);

    v55 = sub_10000E4C0();
    v56 = swift_allocError(&type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError, v55, 0, 0);
    *v57 = 3;
    swift_willThrow(v56, v57);
    (*(void (**)(char *, _QWORD *))(v6 + 8))(v10, v5);
    v58 = (uint64_t)v29;
LABEL_10:
    sub_10000F860(v58, v31);
    return (id)v13;
  }
  v70 = (uint64_t)v29;
  v35 = v33;
  v69 = objc_msgSend((id)objc_opt_self(UIImage), "_imageWithCGSVGDocument:scale:orientation:", v33, 0, 1.0);
  if (!v69)
  {
    v13 = static os_log_type_t.error.getter(0);
    v59 = (void *)static OS_os_log.default.getter(v13);
    os_log(_:dso:log:type:_:)("Failed to create UIImage from CGSVGDocument.", 44, 2, &_mh_execute_header, v59, v13, &_swiftEmptyArrayStorage);

    v60 = sub_10000E4C0();
    v61 = swift_allocError(&type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError, v60, 0, 0);
    *v62 = 4;
    swift_willThrow(v61, v62);
    (*(void (**)(char *, _QWORD *))(v6 + 8))(v10, v5);

    v58 = v70;
    goto LABEL_10;
  }
  v68 = v33;
  v36 = v73;
  v37 = (*(uint64_t (**)(char *, char *, _QWORD *))(v6 + 16))(v73, v10, v5);
  v38 = static OS_os_log.default.getter(v37);
  v39 = static os_log_type_t.default.getter();
  v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    v41 = swift_slowAlloc(22, -1);
    v74 = v31;
    v42 = v41;
    v67 = swift_slowAlloc(64, -1);
    v77 = v67;
    *(_DWORD *)v42 = 136446466;
    v43 = _typeName(_:qualified:)(v71, 0);
    LODWORD(v71) = v40;
    v45 = v44;
    v75 = sub_10000E504(v43, v44, &v77);
    v72 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease(v45);
    *(_WORD *)(v42 + 12) = 2082;
    v66 = v42 + 14;
    v46 = sub_10000F8A4(&qword_100023B60, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v47 = v73;
    v48 = dispatch thunk of CustomStringConvertible.description.getter(v5, v46);
    v50 = v49;
    v75 = sub_10000E504(v48, v49, &v77);
    v3 = v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v66, v42 + 22);
    swift_bridgeObjectRelease(v50);
    v51 = *(void (**)(char *, _QWORD *))(v6 + 8);
    v51(v47, v5);
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v71, "%{public}s successfully generated VisualPairingAppClipCode with URL: %{public}s.", (uint8_t *)v42, 0x16u);
    v52 = v67;
    swift_arrayDestroy(v67, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v52, -1, -1);
    v53 = v42;
    v31 = v74;
    swift_slowDealloc(v53, -1, -1);

  }
  else
  {

    v51 = *(void (**)(char *, _QWORD *))(v6 + 8);
    v51(v36, v5);
  }
  v64 = v70;
  nullsub_1(*(double *)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize), *(double *)(v3 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_appClipCodeSize));
  v65 = v69;
  result = objc_msgSend(v69, "sbf_resizeImageToSize:");
  if (result)
  {
    v13 = (uint64_t)result;
    v51(v10, v5);

    sub_10000F860(v64, v31);
    return (id)v13;
  }
  __break(1u);
  return result;
}

unsigned __int8 *sub_10000D9B0(unsigned __int8 *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;
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
  void *v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  unsigned __int8 *v33;
  unsigned int v34;
  uint64_t v35;
  char v36;
  _QWORD v37[2];

  v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password + 8);
  v5 = HIBYTE(v4) & 0xF;
  v6 = v3 & 0xFFFFFFFFFFFFLL;
  if ((v4 & 0x2000000000000000) != 0)
    v7 = HIBYTE(v4) & 0xF;
  else
    v7 = v3 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
LABEL_47:
    v23 = static os_log_type_t.error.getter(result);
    v24 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v25 = swift_allocObject(v24, 72, 7);
    *(_OWORD *)(v25 + 16) = xmmword_1000147B0;
    v27 = *v2;
    v26 = v2[1];
    *(_QWORD *)(v25 + 56) = &type metadata for String;
    *(_QWORD *)(v25 + 64) = sub_100005FB4();
    *(_QWORD *)(v25 + 32) = v27;
    *(_QWORD *)(v25 + 40) = v26;
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v28 = swift_bridgeObjectRetain(v26);
    v29 = (void *)static OS_os_log.default.getter(v28);
    os_log(_:dso:log:type:_:)("Received invalid PIN: %@.", 25, 2, &_mh_execute_header, v29, v23, v25);
    swift_bridgeObjectRelease(v25);

    v30 = sub_10000E4C0();
    v31 = swift_allocError(&type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError, v30, 0, 0);
    *v32 = 0;
    return (unsigned __int8 *)swift_willThrow(v31, v32);
  }
  if ((v4 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v1
                                       + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password
                                       + 8));
    v9 = (uint64_t)sub_10000EBBC(v3, v4, 10);
    v11 = v36;
    result = (unsigned __int8 *)swift_bridgeObjectRelease(v4);
    goto LABEL_44;
  }
  if ((v4 & 0x2000000000000000) == 0)
  {
    if ((v3 & 0x1000000000000000) != 0)
      v8 = (unsigned __int8 *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(*(_QWORD *)(v1+ OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password), *(_QWORD *)(v1+ OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password+ 8));
    result = sub_10000ECA0(v8, v6, 10);
    v9 = (uint64_t)result;
    v11 = v10 & 1;
LABEL_44:
    if ((v11 & 1) == 0 && v9 <= 999999)
    {
      v21 = sub_1000036E0((uint64_t *)&unk_1000235F0);
      v22 = swift_allocObject(v21, 72, 7);
      *(_OWORD *)(v22 + 16) = xmmword_1000147B0;
      *(_QWORD *)(v22 + 56) = &type metadata for Int;
      *(_QWORD *)(v22 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v22 + 32) = v9;
      return (unsigned __int8 *)String.init(format:_:)(2016751653, 0xE400000000000000, v22);
    }
    goto LABEL_47;
  }
  v37[0] = *(_QWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password);
  v37[1] = v4 & 0xFFFFFFFFFFFFFFLL;
  if (v3 == 43)
  {
    if (!v5)
      goto LABEL_57;
    if (v5 == 1 || (BYTE1(v3) - 48) > 9u)
      goto LABEL_31;
    v9 = (BYTE1(v3) - 48);
    if (v5 != 2)
    {
      if ((BYTE2(v3) - 48) > 9u)
        goto LABEL_31;
      v9 = 10 * (BYTE1(v3) - 48) + (BYTE2(v3) - 48);
      v12 = v5 - 3;
      if (v12)
      {
        v13 = (unsigned __int8 *)v37 + 3;
        while (1)
        {
          v14 = *v13 - 48;
          if (v14 > 9)
            goto LABEL_31;
          v15 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            goto LABEL_31;
          v9 = v15 + v14;
          if (__OFADD__(v15, v14))
            goto LABEL_31;
          v11 = 0;
          ++v13;
          if (!--v12)
            goto LABEL_44;
        }
      }
    }
LABEL_43:
    v11 = 0;
    goto LABEL_44;
  }
  if (v3 != 45)
  {
    if (!v5 || (v3 - 48) > 9u)
      goto LABEL_31;
    v9 = (v3 - 48);
    if (v5 != 1)
    {
      if ((BYTE1(v3) - 48) > 9u)
        goto LABEL_31;
      v9 = 10 * (v3 - 48) + (BYTE1(v3) - 48);
      v16 = v5 - 2;
      if (v16)
      {
        v17 = (unsigned __int8 *)v37 + 2;
        while (1)
        {
          v18 = *v17 - 48;
          if (v18 > 9)
            goto LABEL_31;
          v19 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            goto LABEL_31;
          v9 = v19 + v18;
          if (__OFADD__(v19, v18))
            goto LABEL_31;
          v11 = 0;
          ++v17;
          if (!--v16)
            goto LABEL_44;
        }
      }
    }
    goto LABEL_43;
  }
  if (v5)
  {
    if (v5 != 1 && (BYTE1(v3) - 48) <= 9u)
    {
      if (v5 == 2)
      {
        v11 = 0;
        v9 = -(uint64_t)(BYTE1(v3) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v3) - 48) <= 9u)
      {
        v9 = -10 * (BYTE1(v3) - 48) - (BYTE2(v3) - 48);
        v20 = v5 - 3;
        if (!v20)
          goto LABEL_43;
        v33 = (unsigned __int8 *)v37 + 3;
        while (1)
        {
          v34 = *v33 - 48;
          if (v34 > 9)
            break;
          v35 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            break;
          v9 = v35 - v34;
          if (__OFSUB__(v35, v34))
            break;
          v11 = 0;
          ++v33;
          if (!--v20)
            goto LABEL_44;
        }
      }
    }
LABEL_31:
    v9 = 0;
    v11 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_10000DDD0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::String v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unint64_t v23;
  unint64_t v24;

  v6 = sub_1000036E0(&qword_100023B48);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = 0;
  v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease(v24);
  v23 = 0xD000000000000021;
  v24 = 0x8000000100016B60;
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  v10 = v24;
  URL.init(string:)(v23, v24);
  swift_bridgeObjectRelease(v10);
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a3, v8, v11);
  v13 = sub_10000E480((uint64_t)v8);
  v14 = static os_log_type_t.error.getter(v13);
  v15 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v16 = swift_allocObject(v15, 72, 7);
  *(_OWORD *)(v16 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v16 + 56) = &type metadata for String;
  *(_QWORD *)(v16 + 64) = sub_100005FB4();
  *(_QWORD *)(v16 + 32) = a1;
  *(_QWORD *)(v16 + 40) = a2;
  sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v17 = swift_bridgeObjectRetain(a2);
  v18 = (void *)static OS_os_log.default.getter(v17);
  os_log(_:dso:log:type:_:)("Failed to create URL for payload: %@.", 37, 2, &_mh_execute_header, v18, v14, v16);
  swift_bridgeObjectRelease(v16);

  v19 = sub_10000E4C0();
  v20 = swift_allocError(&type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError, v19, 0, 0);
  *v21 = 1;
  return swift_willThrow(v20, v21);
}

unint64_t sub_10000DFD4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v1 = 0xD000000000000018;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
  if (v2)
  {
    v3 = *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
    switch(v3)
    {
      case 1:
        return 0xD00000000000001FLL;
      case 11:
        return 0xD000000000000020;
      case 3:
        return 0xD00000000000001DLL;
      default:
        v7 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
        v8 = (void *)static OS_os_log.default.getter(v7);
        v9 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("Unsupported device class. Using generic subtitle for in QR code display card", 76, 2, &_mh_execute_header, v8, v9, &_swiftEmptyArrayStorage);

        break;
    }
  }
  else
  {
    v4 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v5 = (void *)static OS_os_log.default.getter(v4);
    v6 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Using generic subtitle for QR code display card", 75, 2, &_mh_execute_header, v5, v6, &_swiftEmptyArrayStorage);

  }
  return v1;
}

uint64_t sub_10000E12C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager);
  if (!v1)
  {
    v5 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v5);
    v7 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unable to get device class. Not supporting fallback auth.", 57, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);
LABEL_11:

    return 0;
  }
  v2 = *(_DWORD *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass);
  if (v2 == 1 || v2 == 3)
    return 1;
  if (v2 != 11)
  {
    v8 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v6 = (void *)static OS_os_log.default.getter(v8);
    v9 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Unsupported device class. Not supporting fallback auth.", 55, 2, &_mh_execute_header, v6, v9, &_swiftEmptyArrayStorage);
    goto LABEL_11;
  }
  return 0;
}

id sub_10000E228()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QRCodeDisplayCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for QRCodeDisplayCardViewController()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController);
}

_BYTE *initializeBufferWithCopyOfBuffer for RemoteSetupState(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeDisplayType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CodeDisplayType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000E3A0 + 4 * byte_100014A55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000E3D4 + 4 * byte_100014A50[v4]))();
}

uint64_t sub_10000E3D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E3DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E3E4);
  return result;
}

uint64_t sub_10000E3F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E3F8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000E3FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E404(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E410(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000E41C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CodeDisplayType()
{
  return &type metadata for CodeDisplayType;
}

unint64_t sub_10000E43C()
{
  unint64_t result;

  result = qword_100023B40;
  if (!qword_100023B40)
  {
    result = swift_getWitnessTable(&unk_100014AE0, &type metadata for CodeDisplayType);
    atomic_store(result, (unint64_t *)&qword_100023B40);
  }
  return result;
}

uint64_t sub_10000E480(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000036E0(&qword_100023B48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E4C0()
{
  unint64_t result;

  result = qword_100023B50;
  if (!qword_100023B50)
  {
    result = swift_getWitnessTable(&unk_100014BA0, &type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError);
    atomic_store(result, (unint64_t *)&qword_100023B50);
  }
  return result;
}

uint64_t sub_10000E504(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000E5D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100005ECC((uint64_t)v12, *a3);
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
      sub_100005ECC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008860(v12);
  return v7;
}

uint64_t sub_10000E5D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000E78C(a5, a6);
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

uint64_t sub_10000E78C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000E820(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10000EA70(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000EA70(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000E820(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000E994(v4, 0);
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

_QWORD *sub_10000E994(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000036E0(&qword_100023B58);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000E9F8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_10000EA70(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000036E0(&qword_100023B58);
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

unsigned __int8 *sub_10000EBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_10000EF1C(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_10000ECA0(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *sub_10000ECA0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000EF1C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_10000EF98(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10000EF98(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_10000F0DC(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_10000E994(v12, 0);
      v5 = sub_10000F1C8((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_10000F0DC(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_10000E9F8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_10000E9F8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_10000F1C8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_10000E9F8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_10000E9F8(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_10000F3D8()
{
  id v0;
  id v1;
  uint64_t v2;
  void *v3;
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _BYTE *v32;

  v0 = objc_msgSend((id)objc_opt_self(UITraitCollection), "currentTraitCollection");
  v1 = objc_msgSend(v0, "userInterfaceStyle");

  if (v1)
  {
    if (v1 == (id)1)
    {
      v8 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v3 = (void *)static OS_os_log.default.getter(v8);
      v9 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Using black strokes on white background for ACC in light mode UI style.", 71, 2, &_mh_execute_header, v3, v9, &_swiftEmptyArrayStorage);
    }
    else
    {
      if (v1 == (id)2)
      {
        v2 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
        v3 = (void *)static OS_os_log.default.getter(v2);
        v4 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("Using white strokes on black background for ACC in dark mode UI style.", 70, 2, &_mh_execute_header, v3, v4, &_swiftEmptyArrayStorage);
        v5 = 0;
        goto LABEL_9;
      }
      v10 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v3 = (void *)static OS_os_log.default.getter(v10);
      v11 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Using black strokes on white background for ACC in unknown UI style.", 68, 2, &_mh_execute_header, v3, v11, &_swiftEmptyArrayStorage);
    }
  }
  else
  {
    v6 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v3 = (void *)static OS_os_log.default.getter(v6);
    v7 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Using black strokes on white background for ACC in unspecified UI style.", 72, 2, &_mh_execute_header, v3, v7, &_swiftEmptyArrayStorage);
  }
  v5 = 1;
LABEL_9:

  v12 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v13 = swift_allocObject(v12, 112, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100014A30;
  v14 = URL.absoluteString.getter();
  v16 = v15;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  v17 = sub_100005FB4();
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = v16;
  *(_QWORD *)(v13 + 96) = &type metadata for Int;
  *(_QWORD *)(v13 + 104) = &protocol witness table for Int;
  *(_QWORD *)(v13 + 64) = v17;
  *(_QWORD *)(v13 + 72) = v5;
  v18 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v19 = (void *)static OS_os_log.default.getter(v18);
  v20 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Encoding URL: %@ with preset color: %d.", 39, 2, &_mh_execute_header, v19, v20, v13);
  swift_bridgeObjectRelease(v13);

  URL._bridgeToObjectiveC()((NSURL *)ACCBakerDataVersion2);
  v22 = v21;
  v23 = (void *)ACCBakerCreate();

  if (v23)
  {
    v24 = v23;
    v25 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);

  }
  else
  {
    v26 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v26 + 16) = xmmword_1000147B0;
    v27 = URL.absoluteString.getter();
    *(_QWORD *)(v26 + 56) = &type metadata for String;
    *(_QWORD *)(v26 + 64) = v17;
    *(_QWORD *)(v26 + 32) = v27;
    *(_QWORD *)(v26 + 40) = v28;
    v25 = (void *)static OS_os_log.default.getter(v27);
    v29 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Failed to create SVG Data from URL %@.", 38, 2, &_mh_execute_header, v25, v29, v26);
    swift_bridgeObjectRelease(v26);

    v30 = sub_10000E4C0();
    v31 = swift_allocError(&type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError, v30, 0, 0);
    *v32 = 2;
    swift_willThrow(v31, v32);
  }
  return v25;
}

uint64_t sub_10000F860(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000F8A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000F8E4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000F860(result, a2);
  return result;
}

uint64_t sub_10000F8F8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000F90C(result, a2);
  return result;
}

uint64_t sub_10000F90C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_10000F950()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  _BYTE *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  Class isa;
  _BYTE *v32;
  id v33;
  id v34;

  v1 = v0;
  if ((v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_codeDisplayType] & 1) != 0)
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password];
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password + 8];
    swift_bridgeObjectRetain(*(_QWORD *)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_password
                                          + 8]);
    v4 = String.count.getter(v2, v3);
    swift_bridgeObjectRelease(v3);
    if (v4 > 6)
    {
      v5 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v6 = (void *)static OS_os_log.default.getter(v5);
      v7 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Password to display is too large to use an AppClip code as requested", 68, 2, &_mh_execute_header, v6, v7, &_swiftEmptyArrayStorage);

      v8 = *(_BYTE **)&v1[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
      if (v8)
      {
        v8[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
        v9 = *(void **)&v8[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
        if (v9)
        {
LABEL_5:
          v10 = v8;
          objc_msgSend(v9, "invalidate");
LABEL_15:
          v33 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
          v34 = v33;
          if (qword_100023470 != -1)
          {
            swift_once(&qword_100023470, sub_1000127DC);
            v33 = v34;
          }
          objc_msgSend(v33, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0);
          goto LABEL_18;
        }
LABEL_14:
        v32 = v8;
        goto LABEL_15;
      }
      return;
    }
    v11 = sub_10000D3AC();
LABEL_12:
    v8 = v11;
    v15 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v8);
    objc_msgSend(v15, "setUserInteractionEnabled:", 0);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setContentMode:", 1);
    v16 = objc_msgSend(v1, "contentView");
    objc_msgSend(v16, "addSubview:", v15);

    v17 = objc_msgSend(v1, "contentView");
    v18 = objc_msgSend(v17, "mainContentGuide");

    v19 = (void *)objc_opt_self(NSLayoutConstraint);
    v20 = sub_1000036E0(&qword_1000234B8);
    v21 = swift_allocObject(v20, 56, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100014A40;
    v22 = objc_msgSend(v15, "topAnchor");
    v23 = objc_msgSend(v18, "topAnchor");
    v24 = objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23);

    *(_QWORD *)(v21 + 32) = v24;
    v25 = objc_msgSend(v15, "bottomAnchor");
    v26 = objc_msgSend(v18, "bottomAnchor");
    v27 = objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v26);

    *(_QWORD *)(v21 + 40) = v27;
    v28 = objc_msgSend(v15, "centerXAnchor");
    v29 = objc_msgSend(v18, "centerXAnchor");
    v30 = objc_msgSend(v28, "constraintEqualToAnchor:", v29);

    *(_QWORD *)(v21 + 48) = v30;
    specialized Array._endMutation()();
    sub_100003720(0, &qword_100023A70, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v19, "activateConstraints:", isa);

    v34 = v8;
LABEL_18:

    return;
  }
  v11 = sub_10000D040();
  if (v11)
    goto LABEL_12;
  v12 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v13 = (void *)static OS_os_log.default.getter(v12);
  v14 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Failed to generate image for code to display", 44, 2, &_mh_execute_header, v13, v14, &_swiftEmptyArrayStorage);

  v8 = *(_BYTE **)&v0[OBJC_IVAR____TtC23CheckerBoardRemoteSetup31QRCodeDisplayCardViewController_remoteSetupManager];
  if (v8)
  {
    v8[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState] = 1;
    v9 = *(void **)&v8[OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient];
    if (v9)
      goto LABEL_5;
    goto LABEL_14;
  }
}

uint64_t sub_10000FEE4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000FF08(uint64_t a1)
{
  uint64_t v1;

  sub_10000CF60(a1, v1);
}

uint64_t sub_10000FF10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FF20(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t getEnumTagSinglePayload for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100010004 + 4 * byte_100014A5F[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100010038 + 4 * byte_100014A5A[v4]))();
}

uint64_t sub_100010038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100010048);
  return result;
}

uint64_t sub_100010054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001005CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100010060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100010074(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError()
{
  return &type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError;
}

unint64_t sub_100010090()
{
  unint64_t result;

  result = qword_100023B70;
  if (!qword_100023B70)
  {
    result = swift_getWitnessTable(&unk_100014B78, &type metadata for QRCodeDisplayCardViewController.VisualPairingAppClipCodeGenerationError);
    atomic_store(result, (unint64_t *)&qword_100023B70);
  }
  return result;
}

uint64_t sub_1000100D4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_DWORD *)(a2 + 32) == (_DWORD)result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 9; ; ++i)
  {
    v4 = i - 7;
    if (__OFADD__(i - 8, 1))
      break;
    v6 = *(_DWORD *)(a2 + 4 * i) == (_DWORD)result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

void sub_100010138()
{
  strcpy((char *)&qword_100024750, "SetupPassword");
  *(_WORD *)&algn_100024758[6] = -4864;
}

void sub_100010168()
{
  strcpy((char *)&qword_100024760, "CancelReason");
  algn_100024768[5] = 0;
  *(_WORD *)&algn_100024768[6] = -5120;
}

unint64_t sub_100010194@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000136D0(*a1);
  *a2 = result;
  return result;
}

void sub_1000101BC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

_QWORD *sub_1000101C8@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

id sub_1000101E8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for RemoteSetupClientManager()), "init");
  qword_100024770 = (uint64_t)result;
  return result;
}

void sub_100010214(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char **v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  __int128 v71;
  _QWORD aBlock[5];
  uint64_t v73;
  char v74[24];

  v2 = v1;
  if (!a1)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 0;
    v12 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient;
    v13 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v13)
    {
      objc_msgSend(v13, "invalidate");
      v14 = *(void **)(v2 + v12);
    }
    else
    {
      v14 = 0;
    }
    *(_QWORD *)(v2 + v12) = 0;

    v70 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice) = 0;

    return;
  }
  v4 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v5 = swift_allocObject(v4, 72, 7);
  *((_QWORD *)&v71 + 1) = 2;
  *(_OWORD *)(v5 + 16) = xmmword_1000147B0;
  v6 = a1;
  v7 = objc_msgSend(v6, "identifier");
  if (v7)
  {
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 64) = sub_100005FB4();
  v15 = 0x29656E6F6E28;
  if (v11)
    v15 = v9;
  v16 = 0xE600000000000000;
  if (v11)
    v16 = v11;
  *(_QWORD *)(v5 + 32) = v15;
  *(_QWORD *)(v5 + 40) = v16;
  v17 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v18 = (void *)static OS_os_log.default.getter(v17);
  v19 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Remote device set to %@", 23, 2, &_mh_execute_header, v18, v19, v5);
  swift_bridgeObjectRelease(v5);

  v20 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice) = a1;
  v21 = v6;

  v22 = objc_msgSend(v21, "nearbyActionDeviceClass");
  v23 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDeviceClass) = v22;
  if (qword_100023410 != -1)
    swift_once(&qword_100023410, sub_100008434);
  LOBYTE(v24) = byte_100024741;
  if (byte_100024741 == 2)
  {
    v25 = *(_DWORD *)(v2 + v23);
    if (v25 > 0xB)
    {
      v26 = 0;
      goto LABEL_18;
    }
    v24 = 0x80Au >> v25;
  }
  v26 = v24 & 1;
LABEL_18:
  v27 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) = v26;
  v28 = swift_allocObject(v4, 72, 7);
  v29 = *(_DWORD *)(v2 + v23);
  *(_OWORD *)(v28 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v28 + 56) = &type metadata for Int32;
  *(_QWORD *)(v28 + 64) = &protocol witness table for Int32;
  *(_DWORD *)(v28 + 32) = v29;
  v30 = (void *)static OS_os_log.default.getter(v28);
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Remote device class is %d", 1);
  swift_bridgeObjectRelease(v28);

  v31 = (uint64_t *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices);
  swift_beginAccess(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices, v74, 0, 0);
  v32 = *v31;
  swift_bridgeObjectRetain(v32);
  v33 = objc_msgSend(v21, "identifier");
  if (v33)
  {
    v34 = v33;
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    v37 = v36;

  }
  else
  {
    v35 = 0;
    v37 = 0xE000000000000000;
  }
  v38 = sub_100010994(v35, v37, v32);
  swift_bridgeObjectRelease(v37);
  v39 = swift_bridgeObjectRelease(v32);
  if ((v38 & 1) != 0)
  {
    v40 = (void *)static OS_os_log.default.getter(v39);
    v41 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Remote device is marked for reverse flow", 40, 2, &_mh_execute_header, v40, v41, &_swiftEmptyArrayStorage);

    *(_BYTE *)(v2 + v27) = (*(_BYTE *)(v2 + v27) & 1) == 0;
  }
  v42 = &off_100021000;
  v43 = objc_msgSend(objc_allocWithZone((Class)SKSetupFieldDiagnosticsClient), "init");
  v44 = OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient;
  v45 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient) = v43;

  v47 = *(void **)(v2 + v44);
  if (v47)
  {
    if (*(_BYTE *)(v2 + v27) == 1)
    {
      v48 = qword_100023418;
      v49 = v47;
      if (v48 != -1)
        swift_once(&qword_100023418, sub_1000085EC);
      if ((byte_100024748 & 1) != 0
        || (v50 = dword_100024744,
            (sub_1000100D4(dword_100024744, (uint64_t)&off_10001C8A0) & 1) == 0))
      {
        if (*(_DWORD *)(v2 + v23) == 11)
          v57 = 2;
        else
          v57 = 8;
        objc_msgSend(v49, "setPasswordType:", v57);
        v58 = swift_allocObject(v4, 72, 7);
        *(_OWORD *)(v58 + 16) = v71;
        v59 = objc_msgSend(v49, "passwordType");
        *(_QWORD *)(v58 + 56) = &type metadata for Int32;
        *(_QWORD *)(v58 + 64) = &protocol witness table for Int32;
        *(_DWORD *)(v58 + 32) = (_DWORD)v59;
        v60 = (void *)static OS_os_log.default.getter(v59);
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("Using device class specific auth type of %d", (_DWORD)v71);
        swift_bridgeObjectRelease(v58);

      }
      else
      {
        v51 = swift_allocObject(v4, 72, 7);
        *(_OWORD *)(v51 + 16) = v71;
        *(_QWORD *)(v51 + 56) = &type metadata for Int32;
        *(_QWORD *)(v51 + 64) = &protocol witness table for Int32;
        *(_DWORD *)(v51 + 32) = v50;
        v52 = (void *)static OS_os_log.default.getter(v51);
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("Overriding client side auth type to %d", (_DWORD)v71);
        v53 = v51;
        v42 = &off_100021000;
        swift_bridgeObjectRelease(v53);

        objc_msgSend(v49, "setPasswordType:", v50);
      }
    }
    else
    {
      v56 = v47;
    }
    objc_msgSend(v47, "setReversePairing:", *(unsigned __int8 *)(v2 + v27));
    v61 = objc_msgSend(objc_allocWithZone((Class)SKDevice), v42[332]);
    v62 = objc_msgSend(v21, "identifier");
    objc_msgSend(v61, "setIdentifier:", v62);

    objc_msgSend(v47, "setPeerDevice:", v61);
    *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    v63 = swift_allocObject(v4, 72, 7);
    *(_OWORD *)(v63 + 16) = v71;
    v64 = objc_msgSend(v47, "reversePairing");
    *(_QWORD *)(v63 + 56) = &type metadata for Bool;
    *(_QWORD *)(v63 + 64) = &protocol witness table for Bool;
    *(_BYTE *)(v63 + 32) = (_BYTE)v64;
    v65 = (void *)static OS_os_log.default.getter(v64);
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Reverse paring is %d", (_DWORD)v71);
    swift_bridgeObjectRelease(v63);

    v66 = swift_allocObject(&unk_10001D120, 24, 7);
    swift_unknownObjectWeakInit(v66 + 16, v2);
    aBlock[4] = sub_1000137E0;
    v73 = v66;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CA38;
    aBlock[3] = &unk_10001D138;
    v67 = _Block_copy(aBlock);
    v68 = v73;
    v69 = v47;
    swift_release(v68);
    objc_msgSend(v69, "setEventHandler:", v67);
    _Block_release(v67);

  }
  else
  {
    v54 = (void *)static OS_os_log.default.getter(v46);
    v55 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Failed to get FieldDiagnostics SetupKit client!", 47, 2, &_mh_execute_header, v54, v55, &_swiftEmptyArrayStorage);

  }
}

uint64_t sub_100010994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = v11[1];
      v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0) & 1) != 0)
        return 1;
      v15 = ~v7;
      v16 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
      {
        while (1)
        {
          v17 = (_QWORD *)(v10 + 16 * v16);
          v18 = v17[1];
          v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
            break;
          result = 0;
          v16 = (v16 + 1) & v15;
          if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_100010AC8(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_100010CF0(a1);

  }
}

void sub_100010B20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSString v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v3)
  {
    v4 = v2;
    v7 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v8 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v8 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v8 + 56) = &type metadata for String;
    *(_QWORD *)(v8 + 64) = sub_100005FB4();
    *(_QWORD *)(v8 + 32) = a1;
    *(_QWORD *)(v8 + 40) = a2;
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v9 = v3;
    v10 = swift_bridgeObjectRetain(a2);
    v11 = (void *)static OS_os_log.default.getter(v10);
    v12 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Sending password %@ to SetupKit", 31, 2, &_mh_execute_header, v11, v12, v8);
    swift_bridgeObjectRelease(v8);

    *(_BYTE *)(v4 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 2;
    v13 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
    swift_bridgeObjectRetain(a2);
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    v17 = objc_msgSend(v13, "initWithPassword:", v14);

    objc_msgSend(v9, "postEvent:", v17);
  }
  else
  {
    v15 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v17 = (id)static OS_os_log.default.getter(v15);
    v16 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Attempted to send password to SetupKit when setup client is not running!", 72, 2, &_mh_execute_header, v17, v16, &_swiftEmptyArrayStorage);
  }

}

void sub_100010CF0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v2 = v1;
  v4 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v5 + 56) = sub_100003720(0, &qword_100023BF8, SKEvent_ptr);
  *(_QWORD *)(v5 + 64) = sub_100013764();
  *(_QWORD *)(v5 + 32) = a1;
  sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v6 = a1;
  v7 = (void *)static OS_os_log.default.getter(v6);
  v8 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("SetupKit In event: %@", 21, 2, &_mh_execute_header, v7, v8, v5);
  swift_bridgeObjectRelease(v5);

  v9 = objc_msgSend(v6, "eventType");
  if ((int)v9 <= 99)
  {
    switch((int)v9)
    {
      case 10:
        v12 = (void *)static OS_os_log.default.getter(v9);
        v13 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SetupKit client started", 23, 2, &_mh_execute_header, v12, v13, &_swiftEmptyArrayStorage);

        *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 2;
        return;
      case 20:
LABEL_11:
        sub_100011DA8();
        return;
      case 30:
        v25 = (void *)static OS_os_log.default.getter(v9);
        v26 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SetupKit invalidated", 20, 2, &_mh_execute_header, v25, v26, &_swiftEmptyArrayStorage);

        if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) & 0xFE) != 2)
          return;
        *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        v27 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v27)
          objc_msgSend(v27, "invalidate");
        goto LABEL_35;
      case 40:
        v38 = (void *)static OS_os_log.default.getter(v9);
        v28 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SetupKit connection started", 27, 2, &_mh_execute_header, v38, v28, &_swiftEmptyArrayStorage);
        break;
      case 41:
        v29 = (void *)static OS_os_log.default.getter(v9);
        v30 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SetupKit connection ended", 25, 2, &_mh_execute_header, v29, v30, &_swiftEmptyArrayStorage);

        v31 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState);
        if (v31 == 1)
          return;
        if (v31 == 3)
        {
          sub_100012088(0);
          return;
        }
        *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        v37 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v37)
          objc_msgSend(v37, "invalidate");
LABEL_35:
        v23 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
        v39 = v23;
        if (qword_100023470 != -1)
        {
          swift_once(&qword_100023470, sub_1000127DC);
          v23 = v39;
        }
        v24 = qword_1000247A0;
LABEL_38:
        objc_msgSend(v23, "postNotificationName:object:userInfo:", v24, 0, 0, v39);
        break;
      default:
LABEL_30:
        v32 = swift_allocObject(v4, 72, 7);
        *(_OWORD *)(v32 + 16) = xmmword_1000147B0;
        v33 = objc_msgSend(v6, "eventType");
        *(_QWORD *)(v32 + 56) = &type metadata for Int32;
        *(_QWORD *)(v32 + 64) = &protocol witness table for Int32;
        *(_DWORD *)(v32 + 32) = (_DWORD)v33;
        v34 = (void *)static OS_os_log.default.getter(v33);
        v35 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient event type %@ is unrecognized", 43, 2, &_mh_execute_header, v34, v35, v32);
        swift_bridgeObjectRelease(v32);

        *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
        v36 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
        if (v36)
          objc_msgSend(v36, "invalidate");
        goto LABEL_35;
    }
  }
  else
  {
    switch((int)v9)
    {
      case 100:
        v10 = (void *)static OS_os_log.default.getter(v9);
        v11 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient authentication type changed.", 42, 2, &_mh_execute_header, v10, v11, &_swiftEmptyArrayStorage);

        if (*(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) == 3)
          goto LABEL_11;
        return;
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
        goto LABEL_30;
      case 110:
        v18 = (void *)static OS_os_log.default.getter(v9);
        v19 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient authentication present.", 37, 2, &_mh_execute_header, v18, v19, &_swiftEmptyArrayStorage);

        sub_1000119DC(v6);
        return;
      case 120:
        sub_1000114EC(v6);
        return;
      case 130:
        v38 = (void *)static OS_os_log.default.getter(v9);
        v20 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient authentication response", 37, 2, &_mh_execute_header, v38, v20, &_swiftEmptyArrayStorage);
        break;
      case 140:
        v21 = (void *)static OS_os_log.default.getter(v9);
        v22 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient authentication completed", 38, 2, &_mh_execute_header, v21, v22, &_swiftEmptyArrayStorage);

        v23 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
        v39 = v23;
        if (qword_100023458 != -1)
        {
          swift_once(&qword_100023458, sub_100012740);
          v23 = v39;
        }
        v24 = qword_100024788;
        goto LABEL_38;
      default:
        if (((_DWORD)v9 - 200) < 3)
        {
          v14 = (void *)static OS_os_log.default.getter(v9);
          v15 = static os_log_type_t.default.getter();
          os_log(_:dso:log:type:_:)("SKSetupClient captive network event", 35, 2, &_mh_execute_header, v14, v15, &_swiftEmptyArrayStorage);

          *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
          v16 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
          if (v16)
            objc_msgSend(v16, "invalidate");
          goto LABEL_35;
        }
        if ((_DWORD)v9 != 300)
          goto LABEL_30;
        v38 = (void *)static OS_os_log.default.getter(v9);
        v17 = static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)("SKSetupClient basicConfigUpdated", 32, 2, &_mh_execute_header, v38, v17, &_swiftEmptyArrayStorage);
        break;
    }
  }

}

void sub_1000114EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  Class isa;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27[3];
  id v28;
  id v29;
  _QWORD v30[2];
  _BYTE v31[104];

  v2 = v1;
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) & 1) != 0
    || (v4 = objc_opt_self(SKAuthenticationRequestEvent), (v5 = swift_dynamicCastObjCClass(a1, v4)) == 0))
  {
    v21 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v22 = swift_allocObject(v21, 72, 7);
    *(_OWORD *)(v22 + 16) = xmmword_1000147B0;
    *(_QWORD *)(v22 + 56) = sub_100003720(0, &qword_100023BF8, SKEvent_ptr);
    *(_QWORD *)(v22 + 64) = sub_100013764();
    *(_QWORD *)(v22 + 32) = a1;
    sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v23 = (void *)static OS_os_log.default.getter(a1);
    v24 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("_handleAuthenticationRequestEvent called with invalid event %@", 62, 2, &_mh_execute_header, v23, v24, v22);
    swift_bridgeObjectRelease(v22);

    *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
    v25 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
    if (v25)
      objc_msgSend(v25, "invalidate");
    v26 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    v28 = v26;
    if (qword_100023470 != -1)
    {
      swift_once(&qword_100023470, sub_1000127DC);
      v26 = v28;
    }
    objc_msgSend(v26, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0, v28);

  }
  else
  {
    v6 = (void *)v5;
    v7 = sub_1000036E0((uint64_t *)&unk_1000235F0);
    v8 = swift_allocObject(v7, 72, 7);
    v27[1] = (id)2;
    *(_OWORD *)(v8 + 16) = xmmword_1000147B0;
    v9 = a1;
    v10 = objc_msgSend(v6, "passwordType");
    *(_QWORD *)(v8 + 56) = &type metadata for Int32;
    *(_QWORD *)(v8 + 64) = &protocol witness table for Int32;
    *(_DWORD *)(v8 + 32) = v10;
    v11 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
    v12 = (void *)static OS_os_log.default.getter(v11);
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("Authentication request with password type %d", 1);
    swift_bridgeObjectRelease(v8);

    *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 3;
    v13 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    if (qword_100023448 != -1)
      swift_once(&qword_100023448, sub_1000126D8);
    v14 = qword_100024778;
    v15 = sub_1000036E0(&qword_100023BE0);
    inited = swift_initStackObject(v15, v31);
    *(_OWORD *)(inited + 16) = *(_OWORD *)v27;
    v30[0] = 0xD000000000000011;
    v30[1] = 0x8000000100015280;
    AnyHashable.init<A>(_:)(v30, &type metadata for String, &protocol witness table for String);
    v17 = objc_msgSend(v6, "passwordType");
    type metadata accessor for CUPasswordType(0);
    *(_QWORD *)(inited + 96) = v18;
    *(_DWORD *)(inited + 72) = v17;
    v19 = sub_1000118B0(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v19);
    objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, 0, isa);

  }
}

unint64_t sub_1000118B0(uint64_t a1)
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
  sub_1000036E0(&qword_100023BE8);
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
    sub_1000136E0(v7, (uint64_t)v16);
    result = sub_100012810((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100008850(&v18, (_OWORD *)(v4[7] + 32 * result));
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

void sub_1000119DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  Class isa;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  _BYTE v31[184];

  v2 = v1;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_clientSideAuth) == 1)
  {
    v4 = objc_opt_self(SKAuthenticationPresentEvent);
    v5 = swift_dynamicCastObjCClass(a1, v4);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = a1;
      v8 = objc_msgSend(v6, "password");
      if (v8)
      {
        v9 = v8;
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        v12 = v11;

        *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 3;
        v13 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
        if (qword_100023450 != -1)
          swift_once(&qword_100023450, sub_10001270C);
        v14 = qword_100024780;
        v15 = sub_1000036E0(&qword_100023BE0);
        inited = swift_initStackObject(v15, v31);
        *(_OWORD *)(inited + 16) = xmmword_100014A30;
        if (qword_100023430 != -1)
          swift_once(&qword_100023430, sub_100010138);
        v29 = qword_100024750;
        v30 = *(_QWORD *)algn_100024758;
        swift_bridgeObjectRetain(*(_QWORD *)algn_100024758);
        AnyHashable.init<A>(_:)(&v29, &type metadata for String, &protocol witness table for String);
        *(_QWORD *)(inited + 96) = &type metadata for String;
        *(_QWORD *)(inited + 72) = v10;
        *(_QWORD *)(inited + 80) = v12;
        v29 = 0xD000000000000011;
        v30 = 0x8000000100015280;
        AnyHashable.init<A>(_:)(&v29, &type metadata for String, &protocol witness table for String);
        v17 = objc_msgSend(v6, "passwordType");
        type metadata accessor for CUPasswordType(0);
        *(_QWORD *)(inited + 168) = v18;
        *(_DWORD *)(inited + 144) = v17;
        v19 = sub_1000118B0(inited);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v19);
        objc_msgSend(v13, "postNotificationName:object:userInfo:", v14, 0, isa);

        return;
      }

    }
  }
  v21 = sub_1000036E0((uint64_t *)&unk_1000235F0);
  v22 = swift_allocObject(v21, 72, 7);
  *(_OWORD *)(v22 + 16) = xmmword_1000147B0;
  *(_QWORD *)(v22 + 56) = sub_100003720(0, &qword_100023BF8, SKEvent_ptr);
  *(_QWORD *)(v22 + 64) = sub_100013764();
  *(_QWORD *)(v22 + 32) = a1;
  sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v23 = (void *)static OS_os_log.default.getter(a1);
  v24 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("_handleAuthenticationPresentEvent called with invalid event %@", 62, 2, &_mh_execute_header, v23, v24, v22);
  swift_bridgeObjectRelease(v22);

  *(_BYTE *)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  v25 = *(void **)(v2 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v25)
    objc_msgSend(v25, "invalidate");
  v26 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v27 = v26;
  if (qword_100023470 != -1)
  {
    swift_once(&qword_100023470, sub_1000127DC);
    v26 = v27;
  }
  objc_msgSend(v26, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0, v27);

}

void sub_100011DA8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  _BYTE v33[24];
  char v34[24];

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  if (v2)
  {
    v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices);
    swift_beginAccess(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices, v34, 0, 0);
    v4 = *v3;
    swift_bridgeObjectRetain(*v3);
    v5 = v2;
    v6 = objc_msgSend(v5, "identifier");
    if (v6)
    {
      v7 = v6;
      v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      v10 = v9;

    }
    else
    {
      v8 = 0;
      v10 = 0xE000000000000000;
    }
    v11 = sub_100010994(v8, v10, v4);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v4);
    if ((v11 & 1) != 0)
    {
      v12 = sub_1000036E0((uint64_t *)&unk_1000235F0);
      v13 = swift_allocObject(v12, 72, 7);
      *(_OWORD *)(v13 + 16) = xmmword_1000147B0;
      v14 = objc_msgSend(v5, "identifier");
      if (v14)
      {
        v15 = v14;
        v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
        v18 = v17;

      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
      *(_QWORD *)(v13 + 56) = &type metadata for String;
      *(_QWORD *)(v13 + 64) = sub_100005FB4();
      if (v18)
        v19 = v16;
      else
        v19 = 0;
      v20 = 0xE000000000000000;
      if (v18)
        v21 = v18;
      else
        v21 = 0xE000000000000000;
      *(_QWORD *)(v13 + 32) = v19;
      *(_QWORD *)(v13 + 40) = v21;
      v22 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
      v23 = (void *)static OS_os_log.default.getter(v22);
      v24 = static os_log_type_t.default.getter();
      os_log(_:dso:log:type:_:)("Clearing reverse flow for device %@", 35, 2, &_mh_execute_header, v23, v24, v13);
      swift_bridgeObjectRelease(v13);

      v25 = objc_msgSend(v5, "identifier");
      if (v25)
      {
        v26 = v25;
        v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
        v20 = v28;

      }
      else
      {
        v27 = 0;
      }
      swift_beginAccess(v3, v33, 33, 0);
      sub_100012904(v27, v20);
      v30 = v29;
      swift_endAccess(v33);

      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v30);
    }
    else
    {

    }
  }
  *(_BYTE *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  v31 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v31)
    objc_msgSend(v31, "invalidate");
  v32 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_100023468 != -1)
    swift_once(&qword_100023468, sub_1000127A8);
  objc_msgSend(v32, "postNotificationName:object:userInfo:", qword_100024798, 0, 0);

}

void sub_100012088(char a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  unint64_t v8;
  Class isa;
  _QWORD v10[2];
  _BYTE v11[104];

  *(_BYTE *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v3)
    objc_msgSend(v3, "invalidate");
  v4 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  if (qword_100023460 != -1)
    swift_once(&qword_100023460, sub_100012774);
  v5 = qword_100024790;
  v6 = sub_1000036E0(&qword_100023BE0);
  inited = swift_initStackObject(v6, v11);
  *(_OWORD *)(inited + 16) = xmmword_1000147B0;
  if (qword_100023438 != -1)
    swift_once(&qword_100023438, sub_100010168);
  v10[0] = qword_100024760;
  v10[1] = *(_QWORD *)algn_100024768;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100024768);
  AnyHashable.init<A>(_:)(v10, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 96) = &type metadata for RemoteSetupCancelReason;
  *(_BYTE *)(inited + 72) = a1 & 1;
  v8 = sub_1000118B0(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, 0, isa);

}

void sub_10001222C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _BYTE v17[24];
  uint64_t v18[2];

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_remoteDevice);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, "identifier");
    if (v4)
    {
      v5 = v4;
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
      v8 = v7;

      swift_beginAccess(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_reverseFlowForDevices, v17, 33, 0);
      sub_10001338C(v18, v6, v8);
      v9 = v18[1];
      swift_endAccess(v17);
      swift_bridgeObjectRelease(v9);
      sub_100012088(1);

      return;
    }

  }
  v10 = sub_100003720(0, (unint64_t *)&qword_100023A40, OS_os_log_ptr);
  v11 = (void *)static OS_os_log.default.getter(v10);
  v12 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("Unable to reference remote device identifier for tracking reverse authentication", 80, 2, &_mh_execute_header, v11, v12, &_swiftEmptyArrayStorage);

  *(_BYTE *)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupState) = 1;
  v13 = *(void **)(v1 + OBJC_IVAR____TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager_setupClient);
  if (v13)
    objc_msgSend(v13, "invalidate");
  v14 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v15 = v14;
  if (qword_100023470 != -1)
  {
    swift_once(&qword_100023470, sub_1000127DC);
    v14 = v15;
  }
  objc_msgSend(v14, "postNotificationName:object:userInfo:", qword_1000247A0, 0, 0, v15);

}

id sub_10001249C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteSetupClientManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteSetupClientManager()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetup24RemoteSetupClientManager);
}

uint64_t getEnumTagSinglePayload for RemoteSetupState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteSetupState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100012610 + 4 * byte_100014BE5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100012644 + 4 * byte_100014BE0[v4]))();
}

uint64_t sub_100012644(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001264C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100012654);
  return result;
}

uint64_t sub_100012660(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100012668);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10001266C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012674(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteSetupState()
{
  return &type metadata for RemoteSetupState;
}

unint64_t sub_100012694()
{
  unint64_t result;

  result = qword_100023BD0;
  if (!qword_100023BD0)
  {
    result = swift_getWitnessTable(&unk_100014CAC, &type metadata for RemoteSetupState);
    atomic_store(result, (unint64_t *)&qword_100023BD0);
  }
  return result;
}

NSString sub_1000126D8()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_100024778 = (uint64_t)result;
  return result;
}

NSString sub_10001270C()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_100024780 = (uint64_t)result;
  return result;
}

NSString sub_100012740()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_100024788 = (uint64_t)result;
  return result;
}

NSString sub_100012774()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_100024790 = (uint64_t)result;
  return result;
}

NSString sub_1000127A8()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_100024798 = (uint64_t)result;
  return result;
}

NSString sub_1000127DC()
{
  NSString result;

  result = String._bridgeToObjectiveC()();
  qword_1000247A0 = (uint64_t)result;
  return result;
}

unint64_t sub_100012810(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100012840(a1, v4);
}

unint64_t sub_100012840(uint64_t a1, uint64_t a2)
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
      sub_100013728(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100005E98((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100012904(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  _QWORD v22[9];

  v5 = *v2;
  Hasher.init(_seed:)(v22, *(_QWORD *)(*v2 + 40));
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v22, a1, a2);
  v6 = Hasher._finalize()();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = v10[1];
  v12 = *v10 == a1 && v11 == a2;
  if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
  {
    v17 = ~v7;
    do
    {
      v8 = (v8 + 1) & v17;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v18 = (_QWORD *)(v9 + 16 * v8);
      v19 = v18[1];
      v20 = *v18 == a1 && v19 == a2;
    }
    while (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v18, v19, a1, a2, 0) & 1) == 0);
  }
  swift_bridgeObjectRelease(v5);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v14 = *v2;
  v22[0] = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100012A90();
    v14 = v22[0];
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v8);
  sub_1000131C8(v8);
  v16 = *v2;
  *v2 = v22[0];
  swift_bridgeObjectRelease(v16);
  return v15;
}

void *sub_100012A90()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_1000036E0(&qword_100023BD8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100012C40(uint64_t a1)
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
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000036E0(&qword_100023BD8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_100012EEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000036E0(&qword_100023BD8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_1000131C8(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD v21[9];

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v6);
        v11 = *v10;
        v12 = v10[1];
        Hasher.init(_seed:)(v21, *(_QWORD *)(v3 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v21, v11, v12);
        v13 = Hasher._finalize()();
        swift_bridgeObjectRelease(v12);
        v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9)
            goto LABEL_5;
        }
        else if (v14 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v14)
        {
LABEL_11:
          v15 = *(_QWORD *)(v3 + 48);
          v16 = (_OWORD *)(v15 + 16 * v2);
          v17 = (_OWORD *)(v15 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
          {
            *v16 = *v17;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10001338C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_100013538(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100013538(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100012EEC(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100012A90();
      goto LABEL_22;
    }
    sub_100012C40(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

unint64_t sub_1000136D0(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_1000136E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000036E0(&qword_100023BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013728(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

unint64_t sub_100013764()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100023C00;
  if (!qword_100023C00)
  {
    v1 = sub_100003720(255, &qword_100023BF8, SKEvent_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100023C00);
  }
  return result;
}

uint64_t sub_1000137BC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000137E0(void *a1)
{
  uint64_t v1;

  sub_100010AC8(a1, v1);
}

uint64_t sub_1000137E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000137F8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t storeEnumTagSinglePayload for RemoteSetupCancelReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001384C + 4 * byte_100014BEF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100013880 + 4 * byte_100014BEA[v4]))();
}

uint64_t sub_100013880(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013888(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013890);
  return result;
}

uint64_t sub_10001389C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000138A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1000138A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000138B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteSetupCancelReason()
{
  return &type metadata for RemoteSetupCancelReason;
}

unint64_t sub_1000138D0()
{
  unint64_t result;

  result = qword_100023C08;
  if (!qword_100023C08)
  {
    result = swift_getWitnessTable(&unk_100014D70, &type metadata for RemoteSetupCancelReason);
    atomic_store(result, (unint64_t *)&qword_100023C08);
  }
  return result;
}

uint64_t sub_100013914()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC23CheckerBoardRemoteSetupP33_21C8998AE5271E4C0A0D97531B9888DD19ResourceBundleClass);
}
