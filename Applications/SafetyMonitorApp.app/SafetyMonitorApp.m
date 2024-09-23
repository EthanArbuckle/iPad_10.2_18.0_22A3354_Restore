id sub_100004154()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC16SafetyMonitorApp12SecureWindow);
}

uint64_t sub_1000041A8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000041E8()
{
  return 1;
}

uint64_t sub_1000041F0(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_100004474(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v2 + qword_10001A320) - 8) + 8))(a1);
  return v5;
}

void *sub_100004250(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_100004290(a1, a2);
}

void *sub_100004290(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  uint64_t v13;

  v5 = *(_QWORD *)((swift_isaMask & *v2) + qword_10001A320);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v13 - v7);
  v9 = (void *)UIHostingController.init(coder:rootView:)(a1, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11 = v9;
  v10(a2, v5);
  if (v9)

  return v9;
}

id sub_100004350(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for SecureUIHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_10001A320), *(_QWORD *)((swift_isaMask & *v4) + qword_10001A320 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1000043C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_100004350(v3, v4, v5, v6);
}

id sub_1000043E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for SecureUIHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_10001A320), *(_QWORD *)((swift_isaMask & *v4) + qword_10001A320 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t type metadata accessor for SecureUIHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000044F0(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureUIHostingController);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_100004530(a1, &qword_100019BC8, (uint64_t)&unk_100014B60);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_100004530(a1, &qword_100019BD0, (uint64_t)&unk_100014B80);
}

uint64_t sub_100004474(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  __chkstk_darwin(a1, a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return UIHostingController.init(rootView:)(v2);
}

uint64_t sub_1000044F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void type metadata accessor for SMSessionStartEntryType(uint64_t a1)
{
  sub_100004530(a1, &qword_100019C38, (uint64_t)&unk_100014BA0);
}

void sub_100004530(uint64_t a1, unint64_t *a2, uint64_t a3)
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

id sub_10000463C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v3 = a1 + *a3;
  v4 = *(_QWORD *)(v3 + 8);
  if (v4)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v3 + 8));
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t sub_1000046A0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v8 = (uint64_t *)(a1 + *a4);
  v9 = v8[1];
  *v8 = v6;
  v8[1] = v7;
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_1000047B0@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v2 = (void *)SessionViewModel.sessionState.getter();
  if (!v2)
  {
    v9 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  v3 = v2;
  v4 = objc_msgSend(v2, "configuration");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "conversation");

    v7 = objc_msgSend(v6, "receiverPrimaryHandles");
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);

  }
  else
  {
    v8 = 0;
  }
  v11 = objc_msgSend(v3, "configuration");
  v12 = v11;
  if (!v11)
    goto LABEL_10;
  v13 = objc_msgSend(v11, "conversation");

  v14 = objc_msgSend(v13, "identifier");
  if (!v14)
  {
    v12 = 0;
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v12 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

LABEL_11:
  type metadata accessor for SMInitiatorAlertUtilities(0);
  static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)(v8, v12, v16, objc_msgSend(v3, "isActiveState"));

  swift_bridgeObjectRelease(v16);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100004990()
{
  void *v0;
  void *v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  void *v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t aBlock[5];
  uint64_t v62;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v58 = *(_QWORD *)(v2 - 8);
  v59 = v2;
  __chkstk_darwin(v2, v3);
  v57 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  __chkstk_darwin(v5, v6);
  v54 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v53 - 8);
  v10 = __chkstk_darwin(v53, v9);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  v52 = (char *)&v49 - v14;
  v15 = type metadata accessor for Logger(0);
  v16 = *(_QWORD *)(v15 - 8);
  v18 = __chkstk_darwin(v15, v17);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = Logger.initiator.unsafeMutableAddressor(v18);
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v20, v21, v15);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc(12, -1);
    v51 = v1;
    v26 = (uint8_t *)v25;
    v27 = swift_slowAlloc(32, -1);
    v50 = v8;
    v28 = v27;
    aBlock[0] = v27;
    *(_DWORD *)v26 = 136315138;
    v60 = sub_10000E258(0xD000000000000014, 0x8000000100010E20, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, aBlock, v26 + 4, v26 + 12);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "#Initiator,LiveActivity,%s", v26, 0xCu);
    swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
    v29 = v28;
    v8 = v50;
    swift_slowDealloc(v29, -1, -1);
    v30 = v26;
    v1 = v51;
    swift_slowDealloc(v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  sub_10000A7C4(0, (unint64_t *)&unk_10001A170, OS_dispatch_queue_ptr);
  v31 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  v32 = v52;
  + infix(_:_:)(v12, 0.1);
  v33 = *(void (**)(char *, uint64_t))(v8 + 8);
  v34 = v12;
  v35 = v53;
  v33(v34, v53);
  v36 = swift_allocObject(&unk_100014CA8, 24, 7);
  *(_QWORD *)(v36 + 16) = v1;
  aBlock[4] = (uint64_t)sub_10000A828;
  v62 = v36;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000D43C;
  aBlock[3] = (uint64_t)&unk_100014CC0;
  v37 = _Block_copy(aBlock);
  v38 = v62;
  v39 = v1;
  v40 = swift_release(v38);
  v41 = v54;
  static DispatchQoS.unspecified.getter(v40);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v42 = sub_1000098E4((unint64_t *)&unk_100019F90, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v43 = sub_100009788((uint64_t *)&unk_10001A180);
  v44 = sub_10000A840(&qword_100019FA0, (uint64_t *)&unk_10001A180, (uint64_t)&protocol conformance descriptor for [A]);
  v45 = v57;
  v46 = v43;
  v47 = v59;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v46, v44, v59, v42);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v32, v41, v45, v37);
  _Block_release(v37);

  (*(void (**)(char *, uint64_t))(v58 + 8))(v45, v47);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
  return ((uint64_t (*)(char *, uint64_t))v33)(v32, v35);
}

uint64_t sub_100004DB0(void *a1)
{
  id v1;
  void *v2;
  _QWORD v4[6];

  v1 = objc_msgSend(a1, "systemApertureElementContext");
  v4[4] = sub_100004E50;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_10000D43C;
  v4[3] = &unk_100014CE8;
  v2 = _Block_copy(v4);
  objc_msgSend(v1, "setElementNeedsUpdateWithCoordinatedAnimations:", v2);
  _Block_release(v2);
  return swift_unknownObjectRelease(v1);
}

uint64_t sub_100004E50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v3 = __chkstk_darwin(v0, v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = Logger.initiator.unsafeMutableAddressor(v3);
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v5, v6, v0);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v14 = v11;
    *(_DWORD *)v10 = 136315138;
    v13 = sub_10000E258(0xD000000000000014, 0x8000000100010E20, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10 + 4, v10 + 12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#Initiator,LiveActivity,%s, update animation called", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v5, v0);
}

void sub_100004FE8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  objc_class *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BYTE v26[24];
  objc_super v27;

  v1 = v0;
  v2 = sub_100009788(&qword_100019FD8);
  v25 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v3);
  v5 = &v26[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_100009788(&qword_100019FE0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = (objc_class *)type metadata accessor for LiveActivityElementViewController();
  v27.receiver = v0;
  v27.super_class = v11;
  objc_msgSendSuper2(&v27, "viewDidLoad");
  v12 = objc_msgSend(v0, "view");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    sub_100005424();
    SessionViewModel.$sessionState.getter();
    v14 = swift_allocObject(&unk_100014BE0, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, v1);
    v15 = sub_10000A840(&qword_100019FE8, &qword_100019FE0, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
    v16 = Publisher<>.sink(receiveValue:)(sub_10000A830, v14, v6, v15);
    swift_release(v14);
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
    v17 = &v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet];
    swift_beginAccess(&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet], v26, 33, 0);
    AnyCancellable.store(in:)(v17);
    swift_endAccess(v26);
    v18 = swift_release(v16);
    SessionViewModel.$localSessionState.getter(v18);
    v19 = swift_allocObject(&unk_100014BE0, 24, 7);
    swift_unknownObjectWeakInit(v19 + 16, v1);
    v20 = sub_10000A840(&qword_100019FF0, &qword_100019FD8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
    v21 = Publisher<>.sink(receiveValue:)(sub_10000A838, v19, v2, v20);
    swift_release(v19);
    (*(void (**)(_BYTE *, uint64_t))(v25 + 8))(v5, v2);
    swift_beginAccess(v17, v26, 33, 0);
    AnyCancellable.store(in:)(v17);
    swift_endAccess(v26);
    v22 = swift_release(v21);
    v23 = (void *)SessionViewModel.sessionState.getter(v22);
    v24 = (void *)SessionViewModel.localSessionState.getter();
    sub_100006584(v23, v24);

  }
  else
  {
    __break(1u);
  }
}

void sub_1000052A8(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  void *v7;
  _BYTE v8[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = (void *)SessionViewModel.localSessionState.getter();
    sub_100006584(v2, v6);

    v7 = (void *)SessionViewModel.localSessionState.getter();
    sub_100007E54(v2, v7);

  }
}

void sub_100005350(void **a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  void *v7;
  _BYTE v8[24];

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = (void *)SessionViewModel.sessionState.getter();
    sub_100006584(v6, v2);

    v7 = (void *)SessionViewModel.sessionState.getter();
    sub_100007E54(v7, v2);

  }
}

void sub_100005424()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  double *v22;
  double v23;
  double *v24;
  double v25;
  double *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  id v46;
  Class isa;
  uint64_t v48;
  uint64_t v49;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v4 = __chkstk_darwin(v1, v3);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView];
  if (v7)
  {
    v8 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView];
    if (v8)
    {
      v9 = *(void **)&v0[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView];
      if (v9)
      {
        v10 = v7;
        v11 = v8;
        v12 = v9;
        v13 = objc_msgSend(v0, "view");
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "addSubview:", v10);

          v15 = objc_msgSend(v0, "view");
          if (v15)
          {
            v16 = v15;
            objc_msgSend(v15, "addSubview:", v11);

            v17 = objc_msgSend(v0, "view");
            if (v17)
            {
              v18 = v17;
              objc_msgSend(v17, "addSubview:", v12);

              objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              v46 = (id)objc_opt_self(NSLayoutConstraint);
              v19 = sub_100009788((uint64_t *)&unk_10001A1C0);
              v20 = swift_allocObject(v19, 80, 7);
              *(_OWORD *)(v20 + 16) = xmmword_100012230;
              v21 = objc_msgSend(v10, "widthAnchor");
              v22 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.unsafeMutableAddressor();
              v23 = *v22;
              v24 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandOuterEdgePadding.unsafeMutableAddressor();
              v25 = v23 + *v24;
              v26 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.unsafeMutableAddressor();
              v27 = objc_msgSend(v21, "constraintEqualToConstant:", v25 + *v26);

              *(_QWORD *)(v20 + 32) = v27;
              v28 = objc_msgSend(v10, "heightAnchor");
              v29 = objc_msgSend(v28, "constraintEqualToConstant:", *v22);

              *(_QWORD *)(v20 + 40) = v29;
              v30 = objc_msgSend(v11, "widthAnchor");
              v31 = objc_msgSend(v30, "constraintEqualToConstant:", *v22 + *v24 + *v26);

              *(_QWORD *)(v20 + 48) = v31;
              v32 = objc_msgSend(v11, "heightAnchor");
              v33 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.unsafeMutableAddressor();
              v34 = objc_msgSend(v32, "constraintEqualToConstant:", *v33);

              *(_QWORD *)(v20 + 56) = v34;
              v35 = objc_msgSend(v12, "widthAnchor");
              v36 = objc_msgSend(v35, "constraintEqualToConstant:", *v33);

              *(_QWORD *)(v20 + 64) = v36;
              v37 = objc_msgSend(v12, "heightAnchor");
              v38 = objc_msgSend(v37, "constraintEqualToConstant:", *v33);

              *(_QWORD *)(v20 + 72) = v38;
              v49 = v20;
              specialized Array._endMutation()();
              v39 = v49;
              sub_10000A7C4(0, (unint64_t *)&unk_100019F80, NSLayoutConstraint_ptr);
              isa = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v39);
              objc_msgSend(v46, "activateConstraints:", isa);

              return;
            }
            goto LABEL_13;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_13:
        __break(1u);
        return;
      }
    }
  }
  v40 = Logger.initiator.unsafeMutableAddressor(v4);
  v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v40, v1);
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(12, -1);
    v45 = swift_slowAlloc(32, -1);
    v49 = v45;
    *(_DWORD *)v44 = 136315138;
    v48 = sub_10000E258(0xD00000000000001ALL, 0x8000000100010E00, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v44 + 4, v44 + 12);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "#Initiator, LiveActivity, %s, Dynamic island views nil - unable to setup", v44, 0xCu);
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v44, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v1);
}

void sub_100005948(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t aBlock[5];
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = Logger.initiator.unsafeMutableAddressor(v7);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v10, v4);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(12, -1);
    v22 = a1;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v23 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, aBlock, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: Layout subviews", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    v17 = v15;
    a1 = v22;
    swift_slowDealloc(v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  v18 = swift_allocObject(&unk_100014C58, 24, 7);
  *(_QWORD *)(v18 + 16) = v2;
  aBlock[4] = (uint64_t)sub_10000A7FC;
  v25 = v18;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000064E0;
  aBlock[3] = (uint64_t)&unk_100014C70;
  v19 = _Block_copy(aBlock);
  v20 = v25;
  v21 = v2;
  swift_release(v20);
  objc_msgSend(a1, "animateAlongsideTransition:completion:", v19, 0);
  _Block_release(v19);
}

uint64_t sub_100005B7C(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v3, v5);
  v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v6, v9);
  v12 = (char *)&v80 - v11;
  v14 = __chkstk_darwin(v10, v13);
  v16 = (char *)&v80 - v15;
  v18 = __chkstk_darwin(v14, v17);
  v20 = (char *)&v80 - v19;
  v22 = __chkstk_darwin(v18, v21);
  v24 = (char *)&v80 - v23;
  v26 = __chkstk_darwin(v22, v25);
  v28 = (char *)&v80 - v27;
  v30 = __chkstk_darwin(v26, v29);
  v32 = (char *)&v80 - v31;
  switch(*(_QWORD *)(a2 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode))
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      v33 = Logger.initiator.unsafeMutableAddressor(v30);
      v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v33, v3);
      v35 = Logger.logObject.getter(v34);
      v36 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc(12, -1);
        v38 = swift_slowAlloc(32, -1);
        v81 = v38;
        *(_DWORD *)v37 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v37 + 4, v37 + 12);
        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s: Removed Active Layout", v37, 0xCu);
        swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v38, -1, -1);
        swift_slowDealloc(v37, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v12, v3);
      break;
    case 0:
      v40 = Logger.initiator.unsafeMutableAddressor(v30);
      v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v32, v40, v3);
      v42 = Logger.logObject.getter(v41);
      v43 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc(12, -1);
        v45 = swift_slowAlloc(32, -1);
        v81 = v45;
        *(_DWORD *)v44 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v44 + 4, v44 + 12);
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s: Initial Active Layout", v44, 0xCu);
        swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v45, -1, -1);
        swift_slowDealloc(v44, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v32, v3);
      break;
    case 1:
      sub_100008EA4();
      v47 = Logger.initiator.unsafeMutableAddressor(v46);
      v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v28, v47, v3);
      v49 = Logger.logObject.getter(v48);
      v50 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc(12, -1);
        v52 = swift_slowAlloc(32, -1);
        v81 = v52;
        *(_DWORD *)v51 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v51 + 4, v51 + 12);
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "%s: Inactive Active Layout", v51, 0xCu);
        swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v52, -1, -1);
        swift_slowDealloc(v51, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v28, v3);
      break;
    case 2:
      sub_100008EA4();
      sub_100007DCC(0);
      v53 = sub_100004990();
      v54 = Logger.initiator.unsafeMutableAddressor(v53);
      v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v24, v54, v3);
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v81 = v59;
        *(_DWORD *)v58 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v58 + 4, v58 + 12);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "%s: Minimal Active Layout", v58, 0xCu);
        swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v59, -1, -1);
        swift_slowDealloc(v58, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v24, v3);
      break;
    case 3:
      sub_100008EA4();
      sub_100007DCC(0);
      v60 = sub_100004990();
      v61 = Logger.initiator.unsafeMutableAddressor(v60);
      v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v20, v61, v3);
      v63 = Logger.logObject.getter(v62);
      v64 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc(12, -1);
        v66 = swift_slowAlloc(32, -1);
        v81 = v66;
        *(_DWORD *)v65 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v65 + 4, v65 + 12);
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "%s: Compact Active Layout", v65, 0xCu);
        swift_arrayDestroy(v66, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v66, -1, -1);
        swift_slowDealloc(v65, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v20, v3);
      break;
    case 4:
      sub_1000083DC();
      v67 = sub_100004990();
      v68 = Logger.initiator.unsafeMutableAddressor(v67);
      v69 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v16, v68, v3);
      v70 = Logger.logObject.getter(v69);
      v71 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc(12, -1);
        v73 = swift_slowAlloc(32, -1);
        v81 = v73;
        *(_DWORD *)v72 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v72 + 4, v72 + 12);
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "%s: Custom Active Layout", v72, 0xCu);
        swift_arrayDestroy(v73, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v73, -1, -1);
        swift_slowDealloc(v72, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v16, v3);
      break;
    default:
      v74 = Logger.initiator.unsafeMutableAddressor(v30);
      v75 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v8, v74, v3);
      v76 = Logger.logObject.getter(v75);
      v77 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v76, v77))
      {
        v78 = (uint8_t *)swift_slowAlloc(12, -1);
        v79 = swift_slowAlloc(32, -1);
        v81 = v79;
        *(_DWORD *)v78 = 136315138;
        v80 = sub_10000E258(0xD00000000000001DLL, 0x8000000100010DE0, &v81);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v78 + 4, v78 + 12);
        _os_log_impl((void *)&_mh_execute_header, v76, v77, "%s: Other Active Layout", v78, 0xCu);
        swift_arrayDestroy(v79, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v79, -1, -1);
        swift_slowDealloc(v78, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v8, v3);
      break;
  }
  return result;
}

uint64_t sub_1000064E0(uint64_t a1, uint64_t a2)
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

void sub_100006584(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  objc_class *v35;
  Class v36;
  Class isa;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(_QWORD);
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint8_t *v48;
  uint8_t *v49;
  _QWORD *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  _BOOL4 v88;
  uint8_t *v89;
  void *v90;
  char **v91;
  char **v92;
  char **v93;
  char **v94;
  Class v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  Class v99;
  objc_class *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  _QWORD *v112;
  uint64_t v113;
  NSObject *v114;
  os_log_type_t v115;
  char *v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  _QWORD *v121;
  uint64_t v122;
  unint64_t v123;
  id v124;
  uint64_t v125;
  id v126;
  Class v127;
  Class v128;
  id v129;
  id v130;
  void *v131;
  id v132;
  id v133;
  uint64_t v134;
  id v135;
  id v136;
  uint64_t v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  double *v143;
  id v144;
  id v145;
  id v146;
  uint64_t v147;
  id v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  _QWORD *v152;
  NSString v153;
  id v154;
  id v155;
  uint64_t v156;
  void *v157;
  void *v158;
  id v159;
  uint64_t v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  double *v172;
  double v173;
  double *v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  Class v179;
  NSString v180;
  id v181;
  id v182;
  uint64_t v183;
  void *v184;
  void *v185;
  _QWORD *v186;
  id v187;
  void *v188;
  id v189;
  uint64_t v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  double *v198;
  id v199;
  id v200;
  id v201;
  uint64_t v202;
  Class v203;
  char *v204;
  id v205;
  void (*v206)(char *, _QWORD *);
  uint64_t v207;
  void (*v208)(uint64_t, uint64_t, _QWORD *);
  uint64_t v209;
  double *v210;
  uint64_t v211;
  __int128 v212;
  uint64_t v213;
  id v214;
  objc_class *v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  _QWORD *v221;
  id v222;
  uint64_t v223;
  uint64_t v224[2];

  v3 = v2;
  v220 = a1;
  v221 = (_QWORD *)type metadata accessor for Logger(0);
  v5 = *(v221 - 1);
  v7 = __chkstk_darwin(v221, v6);
  v9 = (char *)&v204 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v7, v10);
  v13 = __chkstk_darwin(v11, v12);
  v15 = __chkstk_darwin(v13, v14);
  v19 = (char *)&v204 - v18;
  v20 = *(void **)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView);
  if (v20)
  {
    v21 = *(void **)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView);
    if (v21)
    {
      v22 = *(void **)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView);
      if (v22)
      {
        v211 = v17;
        v204 = v16;
        v23 = objc_allocWithZone((Class)SMContactsManager);
        v218 = v20;
        v216 = v21;
        v24 = v22;
        v219 = objc_msgSend(v23, "init");
        v217 = v24;
        if (v220 && (v25 = objc_msgSend(v220, "configuration")) != 0)
        {
          v26 = v25;
          v27 = objc_msgSend(v25, "conversation");

        }
        else
        {
          v27 = 0;
        }
        v35 = (objc_class *)objc_msgSend(v219, "activeSessionRecipientContactsFor:", v27);

        v36 = v35;
        isa = v35;
        if (!v35)
        {
          v38 = sub_10000A7C4(0, &qword_100019FB0, CNContact_ptr);
          v39 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0, v38);
          isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v39);
          v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0, v38);
          v36 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v40);
        }
        v215 = v36;
        *(_QWORD *)&v212 = sub_10000A7C4(0, &qword_100019FB0, CNContact_ptr);
        v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v35, v212);
        v42 = Logger.initiator.unsafeMutableAddressor(v35);
        v43 = *(uint64_t (**)(_QWORD))(v5 + 16);
        v207 = v42;
        v208 = (void (*)(uint64_t, uint64_t, _QWORD *))v43;
        v44 = v43(v19);
        v45 = Logger.logObject.getter(v44);
        v46 = static os_log_type_t.default.getter();
        v47 = os_log_type_enabled(v45, v46);
        v222 = (id)v41;
        if (v47)
        {
          v48 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, v46, "#Initiator, LiveActivity, Resolved contact and using contact avatar", v48, 2u);
          v49 = v48;
          v41 = (uint64_t)v222;
          swift_slowDealloc(v49, -1, -1);
        }

        v50 = v221;
        v206 = *(void (**)(char *, _QWORD *))(v5 + 8);
        v206(v19, v221);
        v51 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView;
        v52 = *(void **)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView);
        v213 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView;
        v214 = a2;
        if (!v52)
        {
          swift_bridgeObjectRelease(v41);
LABEL_55:
          v91 = &off_100019000;
          v92 = &off_100019000;
          v93 = &off_100019000;
          v94 = &off_100019000;
          if (*(_QWORD *)(v3 + v51))
          {
            v95 = v215;
          }
          else
          {
            v96 = objc_msgSend(objc_allocWithZone((Class)CNAvatarView), "init");
            v222 = (id)sub_100009788((uint64_t *)&unk_10001A1C0);
            v97 = swift_allocObject(v222, 40, 7);
            *(_OWORD *)(v97 + 16) = xmmword_100012240;
            *(_QWORD *)(v97 + 32) = objc_msgSend(v96, "descriptorForRequiredKeys");
            v224[0] = v97;
            specialized Array._endMutation()();
            v98 = v224[0];
            sub_100009788(&qword_100019FB8);
            v99 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v98);
            v100 = (objc_class *)objc_msgSend(v219, "fetchAdditionalInfoFor:keysToFetch:", isa, v99);

            if (v100)
            {

              objc_msgSend(v96, "setContacts:", v100);
            }
            else
            {
              v100 = v215;
              objc_msgSend(v96, "setContacts:", v215);
            }
            v101 = v218;

            if (v220)
            {
              v102 = objc_msgSend(v220, "configuration");
              if (v102)
              {
                v103 = v102;
                v104 = objc_msgSend(v102, "conversation");

                v105 = objc_msgSend(v104, "identifier");
                if (v105)
                {
                  v209 = v3;
                  v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v105);
                  v108 = v107;

                  type metadata accessor for SafetyMonitorUIUtilities(0);
                  v109 = static SafetyMonitorUIUtilities.fetchChatGroupPhoto(with:)(v106, v108);
                  if (v110 >> 60 == 15)
                  {
                    v111 = v204;
                    v112 = v221;
                    v208((uint64_t)v204, v207, v221);
                    v113 = swift_bridgeObjectRetain(v108);
                    v114 = Logger.logObject.getter(v113);
                    v115 = static os_log_type_t.info.getter();
                    if (os_log_type_enabled(v114, v115))
                    {
                      v116 = v111;
                      v117 = (uint8_t *)swift_slowAlloc(12, -1);
                      v118 = swift_slowAlloc(32, -1);
                      v224[0] = v118;
                      *(_DWORD *)v117 = 136315138;
                      v215 = (objc_class *)(v117 + 4);
                      swift_bridgeObjectRetain(v108);
                      v223 = sub_10000E258(v106, v108, v224);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v223, v224, v215, v117 + 12);
                      swift_bridgeObjectRelease_n(v108, 3);
                      _os_log_impl((void *)&_mh_execute_header, v114, v115, "No group photo found for groupID %s.", v117, 0xCu);
                      swift_arrayDestroy(v118, 1, (char *)&type metadata for Any + 8);
                      v119 = v118;
                      v93 = &off_100019000;
                      swift_slowDealloc(v119, -1, -1);
                      swift_slowDealloc(v117, -1, -1);

                      v120 = v116;
                      v121 = v221;
                    }
                    else
                    {

                      swift_bridgeObjectRelease_n(v108, 2);
                      v120 = v111;
                      v121 = v112;
                    }
                    v206(v120, v121);
                  }
                  else
                  {
                    v122 = v109;
                    v123 = v110;
                    swift_bridgeObjectRelease(v108);
                    sub_10000A724(v122, v123);
                    v124 = objc_msgSend(v96, "contacts");
                    v125 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v124, v212);

                    v126 = objc_allocWithZone((Class)CNGroupIdentity);
                    v127 = Data._bridgeToObjectiveC()().super.isa;
                    sub_10000A768(v122, v123);
                    v128 = Array._bridgeToObjectiveC()().super.isa;
                    swift_bridgeObjectRelease(v125);
                    v129 = objc_msgSend(v126, "initGroupWithName:photo:contacts:", 0, v127, v128);

                    v93 = &off_100019000;
                    v130 = objc_msgSend(v96, "updateViewWithGroupIdentity:", v129);

                    swift_unknownObjectRelease(v130);
                    sub_10000A768(v122, v123);
                  }
                  v3 = v209;
                  v101 = v218;
                  v94 = &off_100019000;
                }
              }
            }
            v131 = *(void **)(v3 + v213);
            *(_QWORD *)(v3 + v213) = v96;
            v132 = v96;

            v133 = v101;
            sub_100007CB8();

            objc_msgSend(v133, "addSubview:", v132);
            objc_msgSend(v132, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            v221 = (_QWORD *)objc_opt_self(NSLayoutConstraint);
            v134 = swift_allocObject(v222, 64, 7);
            *(_OWORD *)(v134 + 16) = xmmword_100012250;
            v135 = objc_msgSend(v132, "trailingAnchor");
            v136 = objc_msgSend(v133, "trailingAnchor");
            v137 = v3;
            v138 = objc_msgSend(v135, "constraintEqualToAnchor:constant:", v136, -*(double *)SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.unsafeMutableAddressor());

            *(_QWORD *)(v134 + 32) = v138;
            v3 = v137;
            isa = (Class)v132;
            v139 = objc_msgSend(v132, "centerYAnchor");
            v140 = objc_msgSend(v133, "centerYAnchor");
            v141 = objc_msgSend(v139, "constraintEqualToAnchor:", v140);

            *(_QWORD *)(v134 + 40) = v141;
            v142 = objc_msgSend(v132, "widthAnchor");
            v143 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandAvatarDiameter.unsafeMutableAddressor();
            v144 = objc_msgSend(v142, v93[121], *v143);

            *(_QWORD *)(v134 + 48) = v144;
            v91 = &off_100019000;
            v145 = objc_msgSend(v132, v94[141]);
            v146 = objc_msgSend(v145, v93[121], *v143);

            v92 = &off_100019000;
            *(_QWORD *)(v134 + 56) = v146;
            v224[0] = v134;
            specialized Array._endMutation()();
            v147 = v224[0];
            sub_10000A7C4(0, (unint64_t *)&unk_100019F80, NSLayoutConstraint_ptr);
            v95 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v147);
            objc_msgSend(v221, "activateConstraints:", v95);
            a2 = v214;
          }

          v148 = v220;
          v215 = (objc_class *)sub_10000A5B8(v220, a2);
          v149 = a2;
          v151 = v150;
          v152 = (_QWORD *)sub_10000A684(v148, v149);
          swift_bridgeObjectRetain(v151);
          v153 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v151);
          v214 = (id)objc_opt_self(UIImage);
          v154 = objc_msgSend(v214, "_systemImageNamed:", v153);

          v155 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v154);
          v156 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
          v157 = *(void **)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph);
          *(_QWORD *)(v3 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph) = v155;

          v158 = *(void **)(v3 + v156);
          v213 = sub_10000A7C4(0, &qword_100019FA8, UIColor_ptr);
          v159 = v158;
          v221 = v152;
          v160 = swift_retain(v152);
          v161 = (void *)UIColor.init(_:)(v160);
          objc_msgSend(v159, "setTintColor:", v161);

          v162 = v216;
          sub_100007CB8();

          objc_msgSend(v162, v91[116], *(_QWORD *)(v3 + v156));
          objc_msgSend(*(id *)(v3 + v156), v92[115], 0);
          v222 = (id)objc_opt_self(NSLayoutConstraint);
          v216 = (id)sub_100009788((uint64_t *)&unk_10001A1C0);
          v163 = swift_allocObject(v216, 64, 7);
          v212 = xmmword_100012250;
          *(_OWORD *)(v163 + 16) = xmmword_100012250;
          v164 = v3;
          v165 = objc_msgSend(*(id *)(v3 + v156), "leadingAnchor");
          v220 = v162;
          v166 = objc_msgSend(v162, "leadingAnchor");
          v167 = objc_msgSend(v165, "constraintEqualToAnchor:constant:", v166, *(double *)SafetyMonitorUIConstants.liveActivityDynamicIslandInnerEdgePadding.unsafeMutableAddressor());

          *(_QWORD *)(v163 + 32) = v167;
          v168 = objc_msgSend(*(id *)(v164 + v156), "centerYAnchor");
          v169 = objc_msgSend(v162, "centerYAnchor");
          v170 = objc_msgSend(v168, "constraintEqualToAnchor:", v169);

          *(_QWORD *)(v163 + 40) = v170;
          v171 = objc_msgSend(*(id *)(v164 + v156), "widthAnchor");
          v172 = (double *)SafetyMonitorUIConstants.liveActivityDynamicIslandBadgeDiameter.unsafeMutableAddressor();
          v173 = *v172;
          v174 = v172;
          v210 = v172;
          v175 = objc_msgSend(v171, "constraintEqualToConstant:", v173);

          *(_QWORD *)(v163 + 48) = v175;
          v176 = objc_msgSend(*(id *)(v164 + v156), "heightAnchor");
          v177 = objc_msgSend(v176, "constraintEqualToConstant:", *v174);

          *(_QWORD *)(v163 + 56) = v177;
          v224[0] = v163;
          specialized Array._endMutation()();
          v178 = v224[0];
          v211 = sub_10000A7C4(0, (unint64_t *)&unk_100019F80, NSLayoutConstraint_ptr);
          v179 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v178);
          objc_msgSend(v222, "activateConstraints:", v179);

          v180 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v151);
          v181 = objc_msgSend(v214, "_systemImageNamed:", v180);

          v182 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v181);
          v183 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
          v184 = *(void **)(v164 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph);
          *(_QWORD *)(v164 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph) = v182;

          v185 = *(void **)(v164 + v183);
          v186 = v221;
          swift_retain(v221);
          v187 = v185;
          v188 = (void *)UIColor.init(_:)(v186);
          objc_msgSend(v187, "setTintColor:", v188);

          v189 = v217;
          sub_100007CB8();

          objc_msgSend(v189, "addSubview:", *(_QWORD *)(v164 + v183));
          objc_msgSend(*(id *)(v164 + v183), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v190 = swift_allocObject(v216, 64, 7);
          *(_OWORD *)(v190 + 16) = v212;
          v191 = objc_msgSend(*(id *)(v164 + v183), "centerXAnchor");
          v192 = objc_msgSend(v189, "centerXAnchor");
          v193 = objc_msgSend(v191, "constraintEqualToAnchor:", v192);

          *(_QWORD *)(v190 + 32) = v193;
          v194 = objc_msgSend(*(id *)(v164 + v183), "centerYAnchor");
          v195 = objc_msgSend(v189, "centerYAnchor");
          v196 = objc_msgSend(v194, "constraintEqualToAnchor:", v195);

          *(_QWORD *)(v190 + 40) = v196;
          v197 = objc_msgSend(*(id *)(v164 + v183), "widthAnchor");
          v198 = v210;
          v199 = objc_msgSend(v197, "constraintEqualToConstant:", *v210);

          *(_QWORD *)(v190 + 48) = v199;
          v200 = objc_msgSend(*(id *)(v164 + v183), "heightAnchor");
          v201 = objc_msgSend(v200, "constraintEqualToConstant:", *v198);

          *(_QWORD *)(v190 + 56) = v201;
          v224[0] = v190;
          specialized Array._endMutation()();
          v202 = v224[0];
          v203 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v202);
          objc_msgSend(v222, "activateConstraints:", v203);

          swift_release(v221);
          return;
        }
        v205 = v52;
        v53 = objc_msgSend(v205, "contacts");
        v54 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v53, v212);

        v210 = (double *)isa;
        if ((unint64_t)v54 >> 62)
        {
          if (v54 < 0)
            v81 = v54;
          else
            v81 = v54 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v54);
          v55 = _CocoaArrayWrapper.endIndex.getter(v81);
          swift_bridgeObjectRelease(v54);
        }
        else
        {
          v55 = *(_QWORD *)((v54 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        v209 = v3;
        if (v55)
        {
          v224[0] = (uint64_t)&_swiftEmptyArrayStorage;
          sub_10000A3A0(0, v55 & ~(v55 >> 63), 0);
          if (v55 < 0)
          {
            __break(1u);
            goto LABEL_73;
          }
          v56 = 0;
          v57 = (_QWORD *)v224[0];
          do
          {
            if ((v54 & 0xC000000000000001) != 0)
              v58 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v56, v54);
            else
              v58 = *(id *)(v54 + 8 * v56 + 32);
            v59 = v58;
            v60 = objc_msgSend(v58, "identifier");
            v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
            v63 = v62;

            v224[0] = (uint64_t)v57;
            v65 = v57[2];
            v64 = v57[3];
            if (v65 >= v64 >> 1)
            {
              sub_10000A3A0(v64 > 1, v65 + 1, 1);
              v57 = (_QWORD *)v224[0];
            }
            ++v56;
            v57[2] = v65 + 1;
            v66 = (char *)&v57[2 * v65];
            *((_QWORD *)v66 + 4) = v61;
            *((_QWORD *)v66 + 5) = v63;
          }
          while (v55 != v56);
          swift_bridgeObjectRelease(v54);
          v3 = v209;
          v50 = v221;
          v41 = (uint64_t)v222;
        }
        else
        {
          swift_bridgeObjectRelease(v54);
          v57 = &_swiftEmptyArrayStorage;
        }
        v67 = sub_10000A524((uint64_t)v57);
        swift_bridgeObjectRelease(v57);
        if ((unint64_t)v41 >> 62)
        {
          if (v41 < 0)
            v82 = v41;
          else
            v82 = v41 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v41);
          v68 = _CocoaArrayWrapper.endIndex.getter(v82);
          swift_bridgeObjectRelease(v41);
          if (v68)
          {
LABEL_32:
            v224[0] = (uint64_t)&_swiftEmptyArrayStorage;
            sub_10000A3A0(0, v68 & ~(v68 >> 63), 0);
            if ((v68 & 0x8000000000000000) == 0)
            {
              v69 = 0;
              v70 = (_QWORD *)v224[0];
              v71 = v41 & 0xC000000000000001;
              do
              {
                if (v71)
                  v72 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v69, v41);
                else
                  v72 = *(id *)(v41 + 8 * v69 + 32);
                v73 = v72;
                v74 = objc_msgSend(v72, "identifier");
                v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
                v77 = v76;

                v224[0] = (uint64_t)v70;
                v79 = v70[2];
                v78 = v70[3];
                if (v79 >= v78 >> 1)
                {
                  sub_10000A3A0(v78 > 1, v79 + 1, 1);
                  v70 = (_QWORD *)v224[0];
                }
                ++v69;
                v70[2] = v79 + 1;
                v80 = (char *)&v70[2 * v79];
                *((_QWORD *)v80 + 4) = v75;
                *((_QWORD *)v80 + 5) = v77;
                v41 = (uint64_t)v222;
              }
              while (v68 != v69);
              swift_bridgeObjectRelease(v222);
              v3 = v209;
              v50 = v221;
              goto LABEL_50;
            }
LABEL_73:
            __break(1u);
            return;
          }
        }
        else
        {
          v68 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v68)
            goto LABEL_32;
        }
        swift_bridgeObjectRelease(v41);
        v70 = &_swiftEmptyArrayStorage;
LABEL_50:
        v83 = sub_10000A524((uint64_t)v70);
        swift_bridgeObjectRelease(v70);
        v84 = sub_100007A18(v67, v83);
        swift_bridgeObjectRelease(v67);
        swift_bridgeObjectRelease(v83);
        isa = (Class)v210;
        if ((v84 & 1) != 0)
        {

          v51 = v213;
          a2 = v214;
        }
        else
        {
          v85 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *))v208)(v211, v207, v50);
          v86 = Logger.logObject.getter(v85);
          v87 = static os_log_type_t.default.getter();
          v88 = os_log_type_enabled(v86, v87);
          a2 = v214;
          if (v88)
          {
            v89 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v89 = 0;
            _os_log_impl((void *)&_mh_execute_header, v86, v87, "#Initiator, LiveActivity, current contacts do not match active recipients, resetting avatar view.", v89, 2u);
            swift_slowDealloc(v89, -1, -1);
          }

          v206((char *)v211, v50);
          v51 = v213;
          v90 = *(void **)(v3 + v213);
          *(_QWORD *)(v3 + v213) = 0;

          isa = (Class)v210;
        }
        goto LABEL_55;
      }
    }
  }
  v28 = Logger.initiator.unsafeMutableAddressor(v15);
  v29 = v221;
  v30 = (*(uint64_t (**)(char *, uint64_t, _QWORD *))(v5 + 16))(v9, v28, v221);
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc(12, -1);
    v34 = swift_slowAlloc(32, -1);
    v224[0] = v34;
    *(_DWORD *)v33 = 136315138;
    v223 = sub_10000E258(0xD000000000000029, 0x8000000100010D10, v224);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v223, v224, v33 + 4, v33 + 12);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "#Initiator, LiveActivity, %s, Dynamic island views nil - unable to setup", v33, 0xCu);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);
  }

  (*(void (**)(char *, _QWORD *))(v5 + 8))(v9, v29);
}

uint64_t sub_100007A18(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  _QWORD v32[9];

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    Hasher.init(_seed:)(v32, *(_QWORD *)(a2 + 40));
    swift_bridgeObjectRetain(v16);
    String.hash(into:)(v32, v17, v16);
    v18 = Hasher._finalize()();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease(v16);
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease(v16);
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_100007CB8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;

  v1 = objc_msgSend(v0, "subviews");
  v2 = sub_10000A7C4(0, &qword_100019FD0, UIView_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (!((unint64_t)v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v3);
    if (v4)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n(v3, 2);
  }
  if (v3 < 0)
    v9 = v3;
  else
    v9 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v3);
  result = _CocoaArrayWrapper.endIndex.getter(v9);
  v4 = result;
  if (!result)
    return swift_bridgeObjectRelease_n(v3, 2);
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
      else
        v7 = *(id *)(v3 + 8 * i + 32);
      v8 = v7;
      objc_msgSend(v7, "removeFromSuperview");

    }
    return swift_bridgeObjectRelease_n(v3, 2);
  }
  __break(1u);
  return result;
}

id sub_100007DCC(char a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id result;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView);
  if (v3)
    objc_msgSend(v3, "setHidden:", a1 & 1);
  v4 = *(void **)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView);
  if (v4)
    objc_msgSend(v4, "setHidden:", a1 & 1);
  result = *(id *)(v1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView);
  if (result)
    return objc_msgSend(result, "setHidden:", a1 & 1);
  return result;
}

uint64_t sub_100007E54(void *a1, void *a2)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t aBlock[5];
  _QWORD *v53;

  v46 = a2;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v50 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v48 = *(_QWORD *)(v7 - 8);
  v49 = v7;
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  v14 = __chkstk_darwin(v11, v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = Logger.initiator.unsafeMutableAddressor(v14);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v17, v11);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(12, -1);
    v44 = v4;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc(32, -1);
    v45 = v3;
    v24 = v23;
    aBlock[0] = v23;
    v43 = v10;
    *(_DWORD *)v22 = 136315138;
    v51 = sub_10000E258(0xD000000000000026, 0x8000000100010CE0, aBlock);
    v10 = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, aBlock, v22 + 4, v22 + 12);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "#Initiator, LiveActivity,%s,Updating trailing view for session state", v22, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    v25 = v24;
    v3 = v45;
    swift_slowDealloc(v25, -1, -1);
    v26 = v22;
    v4 = v44;
    swift_slowDealloc(v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  sub_10000A7C4(0, (unint64_t *)&unk_10001A170, OS_dispatch_queue_ptr);
  v27 = (void *)static OS_dispatch_queue.main.getter();
  v28 = (_QWORD *)swift_allocObject(&unk_100014C08, 40, 7);
  v30 = v46;
  v29 = v47;
  v28[2] = v47;
  v28[3] = a1;
  v28[4] = v30;
  aBlock[4] = (uint64_t)sub_1000098C0;
  v53 = v28;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000D43C;
  aBlock[3] = (uint64_t)&unk_100014C20;
  v31 = _Block_copy(aBlock);
  v32 = v53;
  v33 = v30;
  v34 = v29;
  v35 = a1;
  v36 = swift_release(v32);
  static DispatchQoS.unspecified.getter(v36);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v37 = sub_1000098E4((unint64_t *)&unk_100019F90, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v38 = sub_100009788((uint64_t *)&unk_10001A180);
  v39 = sub_10000A840(&qword_100019FA0, (uint64_t *)&unk_10001A180, (uint64_t)&protocol conformance descriptor for [A]);
  v40 = v50;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v38, v39, v3, v37);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v40, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v40, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v10, v49);
}

void sub_1000081F0(uint64_t a1, id a2, id a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  sub_10000A5B8(a2, a3);
  v7 = v6;
  v8 = sub_10000A684(a2, a3);
  v9 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  v10 = *(id *)(a1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph);
  swift_bridgeObjectRetain(v7);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v12 = (void *)objc_opt_self(UIImage);
  v13 = objc_msgSend(v12, "_systemImageNamed:", v11);

  objc_msgSend(v10, "setImage:", v13);
  v14 = *(void **)(a1 + v9);
  sub_10000A7C4(0, &qword_100019FA8, UIColor_ptr);
  v15 = v14;
  v16 = swift_retain(v8);
  v17 = (void *)UIColor.init(_:)(v16);
  objc_msgSend(v15, "setTintColor:", v17);

  v18 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  v19 = *(id *)(a1 + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v21 = objc_msgSend(v12, "_systemImageNamed:", v20);

  objc_msgSend(v19, "setImage:", v21);
  v22 = *(void **)(a1 + v18);
  swift_retain(v8);
  v23 = v22;
  v24 = (id)UIColor.init(_:)(v8);
  objc_msgSend(v23, "setTintColor:", v24);
  swift_release(v8);

}

void sub_1000083DC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint8_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double Width;
  double *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  double *v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  char *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  uint64_t v110;
  Class isa;
  void *v112;
  uint8_t *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  CGRect v121;

  v1 = v0;
  v2 = type metadata accessor for UIHostingControllerSizingOptions(0);
  v3 = *(_QWORD **)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LiveActivityView(0);
  v9 = __chkstk_darwin(v7, v8);
  v11 = (char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v14 = (char *)&v113 - v13;
  v15 = type metadata accessor for Logger(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  v19 = (char *)&v113 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(void **)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView];
  if (v20)
    objc_msgSend(v20, "setHidden:", 1);
  v21 = *(void **)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView];
  if (v21)
    objc_msgSend(v21, "setHidden:", 1);
  v22 = *(id *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView];
  if (v22)
    v22 = objc_msgSend(v22, "setHidden:", 1);
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController])
  {
    v117 = v6;
    v118 = v3;
    v116 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController;
    v23 = Logger.initiator.unsafeMutableAddressor(v22);
    v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v23, v15);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc(12, -1);
      v114 = v2;
      v28 = (uint8_t *)v27;
      v29 = swift_slowAlloc(32, -1);
      v120 = v29;
      v115 = v1;
      *(_DWORD *)v28 = 136315138;
      v113 = v28 + 4;
      v119 = sub_10000E258(0xD000000000000015, 0x8000000100010CC0, &v120);
      v1 = v115;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120, v113, v28 + 12);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "#Initiator, LiveActivity,%s, Setting up expanded controller", v28, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      v30 = v28;
      v2 = v114;
      swift_slowDealloc(v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    v31 = v118;
    v32 = *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel];
    v33 = swift_allocObject(&unk_100014BE0, 24, 7);
    swift_unknownObjectWeakInit(v33 + 16, v1);
    v34 = swift_retain(v32);
    LiveActivityView.init(with:onLockscreen:resizeHandler:)(v34, 0, sub_100009780, v33);
    v35 = objc_allocWithZone((Class)sub_100009788(&qword_100019F50));
    sub_1000097C8((uint64_t)v14, (uint64_t)v11);
    v36 = (void *)UIHostingController.init(rootView:)(v11);
    sub_10000980C((uint64_t)v14);
    objc_msgSend(v1, "addChildViewController:", v36);
    v37 = objc_msgSend(v36, "view");
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
      objc_msgSend(v38, "setBackgroundColor:", v39);

      v40 = objc_msgSend(v36, "view");
      if (v40)
      {
        v41 = v40;
        objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v42 = sub_100009788(&qword_100019F58);
        v43 = swift_allocObject(v42, ((*((unsigned __int8 *)v31 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v31 + 80)) + v31[9], *((unsigned __int8 *)v31 + 80) | 7);
        *(_OWORD *)(v43 + 16) = xmmword_100012260;
        v44 = v36;
        static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
        v120 = v43;
        v45 = sub_1000098E4(&qword_100019F60, (uint64_t (*)(uint64_t))&type metadata accessor for UIHostingControllerSizingOptions, (uint64_t)&protocol conformance descriptor for UIHostingControllerSizingOptions);
        v46 = sub_100009788(&qword_100019F68);
        v47 = sub_10000A840((unint64_t *)&unk_100019F70, &qword_100019F68, (uint64_t)&protocol conformance descriptor for [A]);
        v48 = v117;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v120, v46, v47, v2, v45);
        dispatch thunk of UIHostingController.sizingOptions.setter(v48);

        v49 = objc_msgSend(v1, "view");
        if (v49)
        {
          v50 = v49;
          v51 = objc_msgSend(v44, "view");
          if (v51)
          {
            v52 = v51;
            objc_msgSend(v50, "addSubview:", v51);

            v53 = objc_msgSend(v1, "view");
            if (v53)
            {
              v54 = v53;
              v55 = objc_msgSend(v53, "window");

              v56 = objc_msgSend(v44, "view");
              v57 = v56;
              if (v55)
              {
                if (!v56)
                {
LABEL_45:
                  __break(1u);
                  goto LABEL_46;
                }
                v58 = objc_msgSend(v56, "widthAnchor");

                v59 = objc_msgSend(v1, "view");
                if (!v59)
                {
LABEL_46:
                  __break(1u);
                  goto LABEL_47;
                }
                v60 = v59;
                v61 = objc_msgSend(v59, "window");

                if (!v61)
                {
LABEL_47:
                  __break(1u);
                  goto LABEL_48;
                }
                v62 = objc_msgSend(v61, "widthAnchor");

                v63 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v62, *(double *)SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.unsafeMutableAddressor()* -2.0);
              }
              else
              {
                if (!v56)
                {
LABEL_48:
                  __break(1u);
                  return;
                }
                v62 = objc_msgSend(v56, "widthAnchor");

                v64 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
                objc_msgSend(v64, "nativeBounds");
                v66 = v65;
                v68 = v67;
                v70 = v69;
                v72 = v71;

                v121.origin.x = v66;
                v121.origin.y = v68;
                v121.size.width = v70;
                v121.size.height = v72;
                Width = CGRectGetWidth(v121);
                v74 = (double *)SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.unsafeMutableAddressor();
                v63 = objc_msgSend(v62, "constraintEqualToConstant:", Width - (*v74 + *v74));
              }

              v75 = sub_100009788((uint64_t *)&unk_10001A1C0);
              v76 = swift_allocObject(v75, 72, 7);
              *(_OWORD *)(v76 + 16) = xmmword_100012270;
              *(_QWORD *)(v76 + 32) = v63;
              v77 = v63;
              v78 = objc_msgSend(v44, "view");
              if (v78)
              {
                v79 = v78;
                v80 = objc_msgSend(v78, "topAnchor");

                v81 = objc_msgSend(v1, "view");
                if (v81)
                {
                  v82 = v81;
                  v83 = objc_msgSend(v81, "SBUISA_systemApertureObstructedAreaLayoutGuide");

                  v84 = objc_msgSend(v83, "bottomAnchor");
                  v85 = objc_msgSend(v80, "constraintEqualToAnchor:constant:", v84, -*(double *)SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandTopShift.unsafeMutableAddressor());

                  *(_QWORD *)(v76 + 40) = v85;
                  v86 = objc_msgSend(v44, "view");
                  if (v86)
                  {
                    v87 = v86;
                    v88 = objc_msgSend(v86, "leadingAnchor");

                    v89 = objc_msgSend(v1, "view");
                    if (v89)
                    {
                      v90 = v89;
                      v91 = objc_msgSend(v89, "leadingAnchor");

                      v92 = (double *)SafetyMonitorUIConstants.liveActivityExpandedDynamicIslandSidePadding.unsafeMutableAddressor();
                      v93 = objc_msgSend(v88, "constraintEqualToAnchor:constant:", v91, *v92);

                      *(_QWORD *)(v76 + 48) = v93;
                      v94 = objc_msgSend(v44, "view");
                      if (v94)
                      {
                        v95 = v94;
                        v118 = v77;
                        v96 = objc_msgSend(v94, "trailingAnchor");

                        v97 = objc_msgSend(v1, "view");
                        if (v97)
                        {
                          v98 = v97;
                          v99 = objc_msgSend(v97, "trailingAnchor");

                          v100 = objc_msgSend(v96, "constraintEqualToAnchor:constant:", v99, -*v92);
                          *(_QWORD *)(v76 + 56) = v100;
                          v101 = objc_msgSend(v44, "view");
                          if (v101)
                          {
                            v102 = v101;
                            v103 = objc_msgSend(v101, "bottomAnchor");

                            v104 = objc_msgSend(v1, "view");
                            if (v104)
                            {
                              v105 = v1;
                              v106 = v104;
                              v107 = (void *)objc_opt_self(NSLayoutConstraint);
                              v108 = objc_msgSend(v106, "bottomAnchor");

                              v109 = objc_msgSend(v103, "constraintEqualToAnchor:constant:", v108, -*v92);
                              *(_QWORD *)(v76 + 64) = v109;
                              v120 = v76;
                              specialized Array._endMutation()();
                              v110 = v120;
                              sub_10000A7C4(0, (unint64_t *)&unk_100019F80, NSLayoutConstraint_ptr);
                              isa = Array._bridgeToObjectiveC()().super.isa;
                              swift_bridgeObjectRelease(v110);
                              objc_msgSend(v107, "activateConstraints:", isa);

                              objc_msgSend(v44, "didMoveToParentViewController:", v105);
                              v112 = *(void **)&v105[v116];
                              *(_QWORD *)&v105[v116] = v44;

                              return;
                            }
                            goto LABEL_44;
                          }
LABEL_43:
                          __break(1u);
LABEL_44:
                          __break(1u);
                          goto LABEL_45;
                        }
LABEL_42:
                        __break(1u);
                        goto LABEL_43;
                      }
LABEL_41:
                      __break(1u);
                      goto LABEL_42;
                    }
LABEL_40:
                    __break(1u);
                    goto LABEL_41;
                  }
LABEL_39:
                  __break(1u);
                  goto LABEL_40;
                }
LABEL_38:
                __break(1u);
                goto LABEL_39;
              }
LABEL_37:
              __break(1u);
              goto LABEL_38;
            }
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_34;
  }
}

void sub_100008E54(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_100004990();

  }
}

void sub_100008EA4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController;
  v8 = *(void **)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController];
  if (v8)
  {
    v9 = v8;
    v10 = Logger.initiator.unsafeMutableAddressor(v9);
    v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc(12, -1);
      v22 = v7;
      v15 = (uint8_t *)v14;
      v16 = swift_slowAlloc(32, -1);
      v24 = v16;
      *(_DWORD *)v15 = 136315138;
      v21 = v15 + 4;
      v23 = sub_10000E258(0xD00000000000001ALL, 0x8000000100010CA0, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v21, v15 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "#Initiator, LiveActivity,%s, Removing expanded controller", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      v17 = v15;
      v7 = v22;
      swift_slowDealloc(v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v18 = objc_msgSend(v9, "view");
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "removeFromSuperview");

      objc_msgSend(v9, "didMoveToParentViewController:", 0);
      objc_msgSend(v1, "removeChildViewController:", v9);
      v20 = *(void **)&v1[v7];
      *(_QWORD *)&v1[v7] = 0;

    }
    else
    {
      __break(1u);
    }
  }
}

id sub_1000090D0(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *ObjCClassFromMetadata;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSString v22;
  id v23;
  objc_super v25;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole] = 2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea] = 0x4061800000000000;
  v6 = &v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(SMMobileSMSBundleID);
  *((_QWORD *)v7 + 1) = v8;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView] = 0;
  v9 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView;
  v10 = type metadata accessor for LiveActivityAccessoryView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v10);
  v12 = objc_allocWithZone(ObjCClassFromMetadata);
  v13 = v3;
  *(_QWORD *)&v3[v9] = objc_msgSend(v12, "init");
  v14 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView;
  *(_QWORD *)&v13[v14] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v15 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView;
  *(_QWORD *)&v13[v15] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v16 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel;
  v17 = (uint64_t *)SessionViewModel.shared.unsafeMutableAddressor();
  v18 = *v17;
  *(_QWORD *)&v13[v16] = *v17;
  v19 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  v20 = objc_allocWithZone((Class)UIImageView);
  swift_retain(v18);
  *(_QWORD *)&v13[v19] = objc_msgSend(v20, "init");
  v21 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  *(_QWORD *)&v13[v21] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  *(_QWORD *)&v13[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet] = &_swiftEmptySetSingleton;

  if (a2)
  {
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v22 = 0;
  }
  v25.receiver = v13;
  v25.super_class = (Class)type metadata accessor for LiveActivityElementViewController();
  v23 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", v22, a3);

  return v23;
}

id sub_10000934C(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *ObjCClassFromMetadata;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole] = 2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea] = 0x4061800000000000;
  v3 = &v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(SMMobileSMSBundleID);
  *((_QWORD *)v4 + 1) = v5;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView] = 0;
  v6 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView;
  v7 = type metadata accessor for LiveActivityAccessoryView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v7);
  v9 = objc_allocWithZone(ObjCClassFromMetadata);
  v10 = v1;
  *(_QWORD *)&v1[v6] = objc_msgSend(v9, "init");
  v11 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView;
  *(_QWORD *)&v10[v11] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v12 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView;
  *(_QWORD *)&v10[v12] = objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), "init");
  v13 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_sessionViewModel;
  v14 = (uint64_t *)SessionViewModel.shared.unsafeMutableAddressor();
  v15 = *v14;
  *(_QWORD *)&v10[v13] = *v14;
  v16 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph;
  v17 = objc_allocWithZone((Class)UIImageView);
  swift_retain(v15);
  *(_QWORD *)&v10[v16] = objc_msgSend(v17, "init");
  v18 = OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph;
  *(_QWORD *)&v10[v18] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  *(_QWORD *)&v10[OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_cancellableSet] = &_swiftEmptySetSingleton;

  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for LiveActivityElementViewController();
  v19 = objc_msgSendSuper2(&v21, "initWithCoder:", a1);

  return v19;
}

id sub_100009554()
{
  return sub_10000970C(type metadata accessor for LiveActivityElementViewController);
}

uint64_t type metadata accessor for LiveActivityElementViewController()
{
  return objc_opt_self(_TtC16SafetyMonitorApp33LiveActivityElementViewController);
}

id sub_100009700()
{
  return sub_10000970C(type metadata accessor for LiveActivityAccessoryView);
}

id sub_10000970C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for LiveActivityAccessoryView()
{
  return objc_opt_self(_TtC16SafetyMonitorApp25LiveActivityAccessoryView);
}

uint64_t sub_10000975C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100009780()
{
  uint64_t v0;

  sub_100008E54(v0);
}

uint64_t sub_100009788(uint64_t *a1)
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

uint64_t sub_1000097C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LiveActivityView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000980C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LiveActivityView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100009848(uint64_t *a1)
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

uint64_t sub_10000988C()
{
  id *v0;

  return swift_deallocObject(v0, 40, 7);
}

void sub_1000098C0()
{
  uint64_t v0;

  sub_1000081F0(*(_QWORD *)(v0 + 16), *(id *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_1000098CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000098DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000098E4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100009924(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  _QWORD v22[9];

  v7 = *v3;
  Hasher.init(_seed:)(v22, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v22, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain(v15);
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v22[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_100009DAC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v21 = *v3;
  *v3 = v22[0];
  swift_bridgeObjectRelease(v21);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_100009AD0(uint64_t a1)
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
  sub_100009788(&qword_100019FC0);
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

uint64_t sub_100009DAC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100009AD0(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100009F44();
      goto LABEL_22;
    }
    sub_10000A0F4(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v26, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v26, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = *v16 == v8 && v16[1] == a2;
    if (v17 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v18 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v18;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v19 = (_QWORD *)(v15 + 16 * a3);
        if (*v19 != v8 || v19[1] != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v21 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v22 = (uint64_t *)(*(_QWORD *)(v21 + 48) + 16 * a3);
  *v22 = v8;
  v22[1] = a2;
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (v24)
    __break(1u);
  else
    *(_QWORD *)(v21 + 16) = v25;
  return result;
}

void *sub_100009F44()
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
  sub_100009788(&qword_100019FC0);
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

Swift::Int sub_10000A0F4(uint64_t a1)
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
  sub_100009788(&qword_100019FC0);
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

uint64_t sub_10000A3A0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000A3BC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000A3BC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100009788(&qword_100019FC8);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000A524(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_100009924(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000A5B8(id a1, id a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;

  if (a1 && objc_msgSend(a1, "sessionState") == (id)4)
    goto LABEL_5;
  if (a2)
  {
    if (objc_msgSend(a2, "unsupportedDeviceSeparationState"))
    {
LABEL_5:
      v4 = (uint64_t *)SafetyMonitorUIConstants.exclamationMarkCircleIconName.unsafeMutableAddressor();
LABEL_6:
      v5 = *v4;
      swift_bridgeObjectRetain(v4[1]);
      return v5;
    }
    if (objc_msgSend(a2, "userDisabledConnectivity"))
    {
      v4 = (uint64_t *)SafetyMonitorUIConstants.antennaRadiowavesLeftAndRightSlashFillIconName.unsafeMutableAddressor();
      goto LABEL_6;
    }
  }
  if (a1)
  {
    v6 = SMSessionState.badgeImageName.getter(objc_msgSend(a1, "sessionState"));
    if (v7)
      return v6;
  }
  v8 = (uint64_t *)SafetyMonitorUIConstants.checkMarkCircleIconName.unsafeMutableAddressor();
  v5 = *v8;
  swift_bridgeObjectRetain(v8[1]);
  swift_bridgeObjectRelease(0);
  return v5;
}

uint64_t sub_10000A684(id a1, id a2)
{
  _QWORD *v5;

  if (a1 && objc_msgSend(a1, "sessionState") == (id)4)
    return static Color.red.getter();
  if (a2)
  {
    if (objc_msgSend(a2, "unsupportedDeviceSeparationState"))
      return static Color.red.getter();
    if (objc_msgSend(a2, "userDisabledConnectivity"))
      goto LABEL_9;
  }
  if (a1)
    return SMSessionState.badgeImageColor.getter(objc_msgSend(a1, "sessionState"));
LABEL_9:
  v5 = (_QWORD *)Color.checkInYellow.unsafeMutableAddressor();
  return swift_retain(*v5);
}

uint64_t sub_10000A724(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A768(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000A77C(result, a2);
  return result;
}

uint64_t sub_10000A77C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A7C4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000A7FC(uint64_t a1)
{
  uint64_t v1;

  return sub_100005B7C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000A804()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A828()
{
  uint64_t v0;

  return sub_100004DB0(*(void **)(v0 + 16));
}

void sub_10000A830(void **a1)
{
  uint64_t v1;

  sub_1000052A8(a1, v1);
}

void sub_10000A838(void **a1)
{
  uint64_t v1;

  sub_100005350(a1, v1);
}

uint64_t sub_10000A840(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009848(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A8A0()
{
  unint64_t result;

  result = qword_10001A010;
  if (!qword_10001A010)
  {
    result = swift_getWitnessTable(&unk_1000123F0, &type metadata for SafetyMonitorIntent);
    atomic_store(result, (unint64_t *)&qword_10001A010);
  }
  return result;
}

unint64_t sub_10000A8E8()
{
  unint64_t result;

  result = qword_10001A018;
  if (!qword_10001A018)
  {
    result = swift_getWitnessTable(&unk_100012418, &type metadata for SafetyMonitorIntent);
    atomic_store(result, (unint64_t *)&qword_10001A018);
  }
  return result;
}

uint64_t sub_10000A92C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001287C, 1);
}

uint64_t sub_10000A93C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000A97C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

unint64_t sub_10000A97C()
{
  unint64_t result;

  result = qword_10001A020;
  if (!qword_10001A020)
  {
    result = swift_getWitnessTable(&unk_100012320, &type metadata for SafetyMonitorIntent);
    atomic_store(result, (unint64_t *)&qword_10001A020);
  }
  return result;
}

uint64_t sub_10000A9C0()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000D3FC(v0, qword_10001A330);
  sub_10000D354(v0, (uint64_t)qword_10001A330);
  return LocalizedStringResource.init(stringLiteral:)(0x1000000000000010, 0x8000000100010E60);
}

unint64_t sub_10000AA20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100009788(&qword_10001A098);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (!v7)
  {
    v9 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v9;
  }
  sub_100009788(&qword_10001A0B0);
  v8 = static _DictionaryStorage.allocate(capacity:)(v7);
  v9 = (_QWORD *)v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    goto LABEL_9;
  v11 = *(int *)(v2 + 48);
  v12 = v8 + 64;
  v13 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v14 = a1 + v13;
  v15 = *(_QWORD *)(v3 + 72);
  swift_retain(v8);
  while (1)
  {
    sub_10000D3A8(v14, (uint64_t)v6, &qword_10001A098);
    result = sub_10000C4D8((uint64_t)v6);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v12 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = v9[6];
    v20 = type metadata accessor for IntentSystemContext.Source(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v6, v20);
    *(_QWORD *)(v9[7] + 8 * v18) = *(_QWORD *)&v6[v11];
    v21 = v9[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v9[2] = v23;
    v14 += v15;
    if (!--v10)
    {
      swift_release(v9);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10000ABB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009788(&qword_10001A088);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_10000C544(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
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

unint64_t sub_10000ACCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100009788(&qword_10001A0B8);
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
    sub_10000D3A8(v7, (uint64_t)&v16, (uint64_t *)&unk_10001A0C0);
    v8 = v16;
    v9 = v17;
    result = sub_10000C544(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000D3EC(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

uint64_t sub_10000AE00(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1[30] = a1;
  v2 = sub_100009788(&qword_100019FF8);
  v1[31] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v1[32] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[33] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[34] = swift_task_alloc(v5);
  v1[35] = swift_task_alloc(v5);
  v1[36] = swift_task_alloc(v5);
  v6 = type metadata accessor for URLQueryItem(0);
  v1[37] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v1[38] = v7;
  v1[39] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v1[40] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v1[41] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[42] = swift_task_alloc(v10);
  v1[43] = swift_task_alloc(v10);
  v1[44] = swift_task_alloc(v10);
  v1[45] = swift_task_alloc(v10);
  v11 = type metadata accessor for String.Encoding(0);
  v1[46] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100009788(&qword_10001A060);
  v1[47] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for IntentSystemContext(0);
  v1[48] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v1[49] = v14;
  v1[50] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for IntentSystemContext.Source(0);
  v1[51] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v1[52] = v16;
  v1[53] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URLComponents(0);
  v1[54] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v1[55] = v18;
  v19 = (*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[56] = swift_task_alloc(v19);
  v1[57] = swift_task_alloc(v19);
  v20 = type metadata accessor for MainActor(0);
  v1[58] = static MainActor.shared.getter();
  v21 = dispatch thunk of Actor.unownedExecutor.getter(v20, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000B04C, v21, v22);
}

uint64_t sub_10000B04C()
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
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  id *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *started;
  uint64_t v24;
  uint64_t v25;
  Class isa;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  Class v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t *v83;
  void (*v84)(uint64_t, _QWORD);
  unint64_t *v85;
  unint64_t v86;
  char v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
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
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  _BOOL4 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  NSURL *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  Class v133;
  uint64_t v134;
  NSObject *v135;
  os_log_type_t v136;
  _BOOL4 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t type;
  os_log_type_t typea;
  uint64_t v163;
  uint64_t v164;
  os_log_type_t v165[8];
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t (*v170)(uint64_t, uint64_t, uint64_t);
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t *v179;
  void (*v180)(uint64_t, uint64_t);
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void (*v184)(uint64_t, uint64_t);
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  void (*v189)(uint64_t, uint64_t);
  uint64_t v190;
  void (*v191)(uint64_t, uint64_t, uint64_t);
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197[2];

  v1 = *(_QWORD *)(v0 + 400);
  v190 = *(_QWORD *)(v0 + 416);
  v194 = *(_QWORD *)(v0 + 408);
  v2 = *(_QWORD *)(v0 + 376);
  v182 = *(_QWORD *)(v0 + 392);
  v186 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = swift_release(*(_QWORD *)(v0 + 464));
  URLComponents.init()(v4);
  URLComponents.scheme.setter(0x766972702D736D73, 0xEB00000000657461);
  URLComponents.host.setter(1852141679, 0xE400000000000000);
  v5 = sub_100009788(&qword_10001A068);
  v6 = *(_QWORD *)(v3 + 72);
  v7 = *(unsigned __int8 *)(v3 + 80);
  v8 = (v7 + 32) & ~v7;
  v9 = swift_allocObject(v5, v8 + 3 * v6, v7 | 7);
  *(_OWORD *)(v9 + 16) = xmmword_1000122F0;
  v173 = v8;
  URLQueryItem.init(name:value:)(0x65636976726573, 0xE700000000000000, 0x6567617373654D69, 0xE800000000000000);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(SMMessagesBundleID);
  v12 = v11;
  URLQueryItem.init(name:value:)(0x6C646E7542707061, 0xEB00000000444965, v10, v11);
  swift_bridgeObjectRelease(v12);
  URLQueryItem.init(name:value:)(0x704168636E75616CLL, 0xE900000000000070, 7562617, 0xE300000000000000);
  URLComponents.queryItems.setter(v9);
  v13 = sub_100009788(&qword_10001A070);
  inited = swift_initStackObject(v13, v0 + 16);
  *(_OWORD *)(inited + 16) = xmmword_100012260;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(SMDeepLinkURLPayloadTypeKey);
  *(_QWORD *)(inited + 40) = v15;
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  *(_QWORD *)(v0 + 208) = sub_10000ABB4(inited);
  v179 = (uint64_t *)(v0 + 176);
  v16 = (id *)(v0 + 192);
  v17 = sub_10000A97C();
  v18 = AppIntent.systemContext.getter(&type metadata for SafetyMonitorIntent, v17);
  IntentSystemContext.source.getter(v18);
  (*(void (**)(uint64_t, uint64_t))(v182 + 8))(v1, v186);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v190 + 48))(v2, 1, v194) == 1)
  {
    sub_10000D36C(*(_QWORD *)(v0 + 376), &qword_10001A060);
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 416);
    v20 = *(_QWORD *)(v0 + 424);
    v21 = *(_QWORD *)(v0 + 408);
    v22 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v19 + 32))(v20, *(_QWORD *)(v0 + 376), v21);
    started = (uint64_t *)PayloadKeys.sessionStartEntryTypeKey.unsafeMutableAddressor(v22);
    v24 = *started;
    v25 = started[1];
    swift_bridgeObjectRetain(v25);
    sub_10000CDE0(v20);
    isa = UInt._bridgeToObjectiveC()().super.super.isa;
    v27 = *(_QWORD *)(v0 + 208);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v27);
    v197[0] = v27;
    sub_10000CAD4((uint64_t)isa, v24, v25, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v0 + 208) = v27;
    swift_bridgeObjectRelease(v25);
    swift_bridgeObjectRelease(0x8000000000000000);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  }
  v29 = (void *)objc_opt_self(NSJSONSerialization);
  v30 = *(_QWORD *)(v0 + 208);
  v31 = sub_10000D318();
  swift_bridgeObjectRetain(v30);
  v32 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v30);
  *v16 = 0;
  v33 = objc_msgSend(v29, "dataWithJSONObject:options:error:", v32, 0, v0 + 192);

  v34 = *v16;
  if (v33)
  {
    v35 = *(_QWORD *)(v0 + 368);
    v36 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v33);
    v38 = v37;

    static String.Encoding.utf8.getter();
    v39 = String.init(data:encoding:)(v36, v38, v35);
    if (v40)
    {
      v41 = v39;
      v42 = v40;
      v183 = v36;
      v187 = v38;
      v169 = v0 + 72;
      if (qword_100019AB8 != -1)
        swift_once(&qword_100019AB8, sub_10000F870);
      v43 = *(_QWORD *)(v0 + 360);
      v45 = *(_QWORD *)(v0 + 320);
      v44 = *(_QWORD *)(v0 + 328);
      v46 = sub_10000D354(v45, (uint64_t)static Logger.intents);
      v191 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
      v191(v43, v46, v45);
      v47 = swift_bridgeObjectRetain_n(v42, 2);
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.debug.getter();
      v50 = os_log_type_enabled(v48, v49);
      v51 = *(_QWORD *)(v0 + 360);
      v52 = *(_QWORD *)(v0 + 320);
      v53 = *(_QWORD *)(v0 + 328);
      if (v50)
      {
        v166 = *(_QWORD *)(v0 + 328);
        v54 = swift_slowAlloc(32, -1);
        type = swift_slowAlloc(96, -1);
        v197[0] = type;
        *(_DWORD *)v54 = 136315650;
        v55 = String.init<A>(describing:)();
        v163 = v52;
        v56 = v41;
        v58 = v57;
        *(_QWORD *)(v0 + 216) = sub_10000E258(v55, v57, v197);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v54 + 4, v54 + 12);
        swift_bridgeObjectRelease(v58);
        *(_WORD *)(v54 + 12) = 2080;
        *(_QWORD *)(v0 + 224) = sub_10000E258(0x286D726F66726570, 0xE900000000000029, v197);
        v41 = v56;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v54 + 14, v54 + 22);
        *(_WORD *)(v54 + 22) = 2080;
        swift_bridgeObjectRetain(v42);
        *(_QWORD *)(v0 + 232) = sub_10000E258(v56, v42, v197);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v54 + 24, v54 + 32);
        swift_bridgeObjectRelease_n(v42, 3);
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "%s, %s: AppIntent source, %s", (uint8_t *)v54, 0x20u);
        swift_arrayDestroy(type, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(type, -1, -1);
        swift_slowDealloc(v54, -1, -1);

        v59 = *(void (**)(uint64_t, uint64_t))(v166 + 8);
        v59(v51, v163);
      }
      else
      {

        swift_bridgeObjectRelease_n(v42, 2);
        v59 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
        v59(v51, v52);
      }
      v84 = (void (*)(uint64_t, _QWORD))URLComponents.queryItems.modify(v169);
      if (*v83)
      {
        v85 = v83;
        URLQueryItem.init(name:value:)(0x6F6C796150707061, 0xEA00000000006461, v41, v42);
        swift_bridgeObjectRelease(v42);
        v86 = *v85;
        v87 = swift_isUniquelyReferenced_nonNull_native(*v85);
        *v85 = v86;
        if ((v87 & 1) == 0)
        {
          v86 = sub_10000C2D0(0, *(_QWORD *)(v86 + 16) + 1, 1, v86);
          *v85 = v86;
        }
        v89 = *(_QWORD *)(v86 + 16);
        v88 = *(_QWORD *)(v86 + 24);
        if (v89 >= v88 >> 1)
        {
          v86 = sub_10000C2D0(v88 > 1, v89 + 1, 1, v86);
          *v85 = v86;
        }
        v91 = *(_QWORD *)(v0 + 304);
        v90 = *(_QWORD *)(v0 + 312);
        v92 = *(_QWORD *)(v0 + 296);
        *(_QWORD *)(v86 + 16) = v89 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v91 + 32))(v86 + v173 + v89 * v6, v90, v92);
      }
      else
      {
        swift_bridgeObjectRelease(v42);
      }
      v84(v169, 0);
      sub_10000A77C(v183, v187);
      goto LABEL_27;
    }
    sub_10000A77C(v36, v38);
  }
  else
  {
    v60 = v34;
    v61 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v61);
  }
  if (qword_100019AB8 != -1)
    swift_once(&qword_100019AB8, sub_10000F870);
  v62 = *(_QWORD *)(v0 + 352);
  v64 = *(_QWORD *)(v0 + 320);
  v63 = *(_QWORD *)(v0 + 328);
  v65 = sub_10000D354(v64, (uint64_t)static Logger.intents);
  v191 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16);
  v66 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v191)(v62, v65, v64);
  v67 = Logger.logObject.getter(v66);
  v68 = static os_log_type_t.debug.getter();
  v69 = os_log_type_enabled(v67, v68);
  v70 = *(_QWORD *)(v0 + 352);
  v71 = *(_QWORD *)(v0 + 320);
  v72 = *(_QWORD *)(v0 + 328);
  if (v69)
  {
    v188 = *(_QWORD *)(v0 + 328);
    v73 = swift_slowAlloc(32, -1);
    v167 = v31;
    v74 = swift_slowAlloc(96, -1);
    v197[0] = v74;
    *(_DWORD *)v73 = 136315650;
    v75 = String.init<A>(describing:)();
    v77 = v76;
    *v179 = sub_10000E258(v75, v76, v197);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v179, v0 + 184, v73 + 4, v73 + 12);
    swift_bridgeObjectRelease(v77);
    *(_WORD *)(v73 + 12) = 2080;
    *(_QWORD *)(v0 + 184) = sub_10000E258(0x286D726F66726570, 0xE900000000000029, v197);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v73 + 14, v73 + 22);
    *(_WORD *)(v73 + 22) = 2080;
    swift_beginAccess(v0 + 208, v0 + 104, 0, 0);
    v78 = *(_QWORD *)(v0 + 208);
    v79 = swift_bridgeObjectRetain(v78);
    v80 = Dictionary.description.getter(v79, &type metadata for String, v167, &protocol witness table for String);
    v82 = v81;
    swift_bridgeObjectRelease(v78);
    *(_QWORD *)(v0 + 200) = sub_10000E258(v80, v82, v197);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v73 + 24, v73 + 32);
    swift_bridgeObjectRelease(v82);
    _os_log_impl((void *)&_mh_execute_header, v67, v68, "%s, %s: Failed to decode %s", (uint8_t *)v73, 0x20u);
    swift_arrayDestroy(v74, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1, -1);
    swift_slowDealloc(v73, -1, -1);

    v59 = *(void (**)(uint64_t, uint64_t))(v188 + 8);
  }
  else
  {

    v59 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
  }
  v59(v70, v71);
LABEL_27:
  v93 = *(_QWORD *)(v0 + 448);
  v95 = *(_QWORD *)(v0 + 432);
  v94 = *(_QWORD *)(v0 + 440);
  v96 = *(_QWORD *)(v0 + 256);
  v97 = *(_QWORD *)(v0 + 264);
  v98 = *(_QWORD *)(v0 + 248);
  v99 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v94 + 16))(v93, *(_QWORD *)(v0 + 456), v95);
  URLComponents.url.getter(v99);
  v189 = *(void (**)(uint64_t, uint64_t))(v94 + 8);
  v189(v93, v95);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v98, 1, v96) == 1)
  {
    v100 = sub_10000D36C(*(_QWORD *)(v0 + 248), &qword_100019FF8);
  }
  else
  {
    v177 = (uint64_t *)(v0 + 152);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 264) + 32))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 256));
    if (qword_100019AB8 != -1)
      swift_once(&qword_100019AB8, sub_10000F870);
    v101 = *(_QWORD *)(v0 + 344);
    v103 = *(_QWORD *)(v0 + 280);
    v102 = *(_QWORD *)(v0 + 288);
    v105 = *(_QWORD *)(v0 + 256);
    v104 = *(_QWORD *)(v0 + 264);
    v174 = sub_10000D354(*(_QWORD *)(v0 + 320), (uint64_t)static Logger.intents);
    ((void (*)(uint64_t))v191)(v101);
    v170 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v104 + 16);
    v106 = v170(v103, v102, v105);
    v107 = Logger.logObject.getter(v106);
    v108 = static os_log_type_t.debug.getter();
    v109 = os_log_type_enabled(v107, v108);
    v110 = *(_QWORD *)(v0 + 344);
    v111 = *(_QWORD *)(v0 + 320);
    v112 = *(_QWORD *)(v0 + 280);
    v114 = *(_QWORD *)(v0 + 256);
    v113 = *(_QWORD *)(v0 + 264);
    v184 = v59;
    if (v109)
    {
      v168 = *(_QWORD *)(v0 + 344);
      v115 = swift_slowAlloc(32, -1);
      v164 = swift_slowAlloc(96, -1);
      v197[0] = v164;
      *(_DWORD *)v115 = 136315650;
      typea = v108;
      v116 = String.init<A>(describing:)();
      *(_QWORD *)v165 = v111;
      v118 = v117;
      *v177 = sub_10000E258(v116, v117, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v177, v0 + 160, v115 + 4, v115 + 12);
      swift_bridgeObjectRelease(v118);
      *(_WORD *)(v115 + 12) = 2080;
      *(_QWORD *)(v0 + 160) = sub_10000E258(0x286D726F66726570, 0xE900000000000029, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v115 + 14, v115 + 22);
      *(_WORD *)(v115 + 22) = 2080;
      v119 = sub_1000098E4(&qword_10001A080, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v120 = dispatch thunk of CustomStringConvertible.description.getter(v114, v119);
      v122 = v121;
      *(_QWORD *)(v0 + 168) = sub_10000E258(v120, v121, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v179, v115 + 24, v115 + 32);
      swift_bridgeObjectRelease(v122);
      v180 = *(void (**)(uint64_t, uint64_t))(v113 + 8);
      v180(v112, v114);
      _os_log_impl((void *)&_mh_execute_header, v107, typea, "%s, %s: About to open URL %s", (uint8_t *)v115, 0x20u);
      swift_arrayDestroy(v164, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v164, -1, -1);
      swift_slowDealloc(v115, -1, -1);

      v59(v168, *(_QWORD *)v165);
    }
    else
    {
      v180 = *(void (**)(uint64_t, uint64_t))(v113 + 8);
      v180(v112, v114);

      v59(v110, v111);
    }
    v123 = *(_QWORD *)(v0 + 336);
    v124 = *(_QWORD *)(v0 + 320);
    v125 = *(_QWORD *)(v0 + 288);
    v126 = *(_QWORD *)(v0 + 272);
    v127 = *(_QWORD *)(v0 + 256);
    v128 = objc_msgSend(objc_allocWithZone((Class)LSApplicationWorkspace), "init");
    URL._bridgeToObjectiveC()(v129);
    v131 = v130;
    v132 = sub_10000ACCC((uint64_t)&_swiftEmptyArrayStorage);
    v133 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v132);
    objc_msgSend(v128, "openSensitiveURL:withOptions:", v131, v133);

    v191(v123, v174, v124);
    v134 = v170(v126, v125, v127);
    v135 = Logger.logObject.getter(v134);
    v136 = static os_log_type_t.info.getter();
    v137 = os_log_type_enabled(v135, v136);
    v138 = *(_QWORD *)(v0 + 336);
    v139 = *(_QWORD *)(v0 + 320);
    v140 = *(_QWORD *)(v0 + 288);
    v141 = *(_QWORD *)(v0 + 272);
    v142 = *(_QWORD *)(v0 + 256);
    if (v137)
    {
      v192 = *(_QWORD *)(v0 + 320);
      v195 = *(_QWORD *)(v0 + 288);
      v143 = swift_slowAlloc(32, -1);
      v171 = swift_slowAlloc(96, -1);
      v197[0] = v171;
      *(_DWORD *)v143 = 136315650;
      v144 = String.init<A>(describing:)();
      v175 = v138;
      v146 = v145;
      *(_QWORD *)(v0 + 128) = sub_10000E258(v144, v145, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v143 + 4, v143 + 12);
      swift_bridgeObjectRelease(v146);
      *(_WORD *)(v143 + 12) = 2080;
      *(_QWORD *)(v0 + 136) = sub_10000E258(0x286D726F66726570, 0xE900000000000029, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v143 + 14, v143 + 22);
      *(_WORD *)(v143 + 22) = 2080;
      v147 = sub_1000098E4(&qword_10001A080, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v148 = dispatch thunk of CustomStringConvertible.description.getter(v142, v147);
      v150 = v149;
      *(_QWORD *)(v0 + 144) = sub_10000E258(v148, v149, v197);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v177, v143 + 24, v143 + 32);
      swift_bridgeObjectRelease(v150);
      v180(v141, v142);
      _os_log_impl((void *)&_mh_execute_header, v135, v136, "%s, %s: Did open URL %s", (uint8_t *)v143, 0x20u);
      swift_arrayDestroy(v171, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v171, -1, -1);
      swift_slowDealloc(v143, -1, -1);

      v184(v175, v192);
      v100 = ((uint64_t (*)(uint64_t, uint64_t))v180)(v195, v142);
    }
    else
    {

      v180(v141, v142);
      v184(v138, v139);
      v100 = ((uint64_t (*)(uint64_t, uint64_t))v180)(v140, v142);
    }
  }
  v152 = *(_QWORD *)(v0 + 448);
  v151 = *(_QWORD *)(v0 + 456);
  v154 = *(_QWORD *)(v0 + 424);
  v153 = *(_QWORD *)(v0 + 432);
  v155 = *(_QWORD *)(v0 + 400);
  v157 = *(_QWORD *)(v0 + 368);
  v156 = *(_QWORD *)(v0 + 376);
  v159 = *(_QWORD *)(v0 + 352);
  v158 = *(_QWORD *)(v0 + 360);
  v172 = *(_QWORD *)(v0 + 344);
  v176 = *(_QWORD *)(v0 + 336);
  v178 = *(_QWORD *)(v0 + 312);
  v181 = *(_QWORD *)(v0 + 288);
  v185 = *(_QWORD *)(v0 + 280);
  v193 = *(_QWORD *)(v0 + 272);
  v196 = *(_QWORD *)(v0 + 248);
  static IntentResult.result<>()(v100);
  v189(v151, v153);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 208));
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v172);
  swift_task_dealloc(v176);
  swift_task_dealloc(v178);
  swift_task_dealloc(v181);
  swift_task_dealloc(v185);
  swift_task_dealloc(v193);
  swift_task_dealloc(v196);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C0D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100019AB0 != -1)
    swift_once(&qword_100019AB0, sub_10000A9C0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000D354(v2, (uint64_t)qword_10001A330);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000C154(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10001A05C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000C1A4;
  return sub_10000AE00(a1);
}

uint64_t sub_10000C1A4()
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

uint64_t sub_10000C1F8()
{
  uint64_t v0;

  v0 = qword_10001A000;
  swift_bridgeObjectRetain(off_10001A008);
  return v0;
}

uint64_t sub_10000C230(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A97C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SafetyMonitorShortcutProvider()
{
  return &type metadata for SafetyMonitorShortcutProvider;
}

ValueMetadata *type metadata accessor for SafetyMonitorIntent()
{
  return &type metadata for SafetyMonitorIntent;
}

unint64_t sub_10000C284()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A030;
  if (!qword_10001A030)
  {
    v1 = sub_100009848(&qword_10001A038);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A030);
  }
  return result;
}

uint64_t sub_10000C2D0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100009788(&qword_10001A068);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URLQueryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000CFC8(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

unint64_t sub_10000C4D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for IntentSystemContext.Source(0);
  v6 = sub_1000098E4(&qword_10001A0A0, (uint64_t (*)(uint64_t))&type metadata accessor for IntentSystemContext.Source, (uint64_t)&protocol conformance descriptor for IntentSystemContext.Source);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10000C5A8(a1, v7);
}

unint64_t sub_10000C544(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000C6E8(a1, a2, v5);
}

unint64_t sub_10000C5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v19 = a1;
  v5 = type metadata accessor for IntentSystemContext.Source(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = -1 << *(_BYTE *)(v3 + 32);
  v11 = a2 & ~v10;
  if (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v6 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v14(v9, *(_QWORD *)(v3 + 48) + v13 * v11, v5);
      v15 = sub_1000098E4(&qword_10001A0A8, (uint64_t (*)(uint64_t))&type metadata accessor for IntentSystemContext.Source, (uint64_t)&protocol conformance descriptor for IntentSystemContext.Source);
      v16 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v19, v5, v15);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      if ((v16 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  return v11;
}

unint64_t sub_10000C6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

Swift::Int sub_10000C7C8(uint64_t a1, uint64_t a2)
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
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100009788(&qword_10001A088);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
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
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
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
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

void sub_10000CAD4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_10000C544(a2, a3);
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
    sub_10000CC30();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }
    goto LABEL_14;
  }
  sub_10000C7C8(v15, a4 & 1);
  v20 = sub_10000C544(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_10000CC30()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_100009788(&qword_10001A088);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
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

uint64_t sub_10000CDE0(uint64_t a1)
{
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
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;

  v2 = sub_100009788(&qword_10001A090);
  v3 = sub_100009788(&qword_10001A098);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = swift_allocObject(v2, v7 + 6 * v5, v6 | 7);
  *(_OWORD *)(v8 + 16) = xmmword_100012300;
  v9 = v8 + v7;
  v10 = *(int *)(v3 + 48);
  v11 = enum case for IntentSystemContext.Source.shortcuts(_:);
  v12 = type metadata accessor for IntentSystemContext.Source(0);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
  v13(v9, v11, v12);
  *(_QWORD *)(v9 + v10) = 3;
  v14 = *(int *)(v3 + 48);
  v13(v9 + v5, enum case for IntentSystemContext.Source.spotlight(_:), v12);
  *(_QWORD *)(v9 + v5 + v14) = 4;
  v15 = *(int *)(v3 + 48);
  v13(v9 + 2 * v5, enum case for IntentSystemContext.Source.siri(_:), v12);
  *(_QWORD *)(v9 + 2 * v5 + v15) = 5;
  v16 = *(int *)(v3 + 48);
  v13(v9 + 3 * v5, enum case for IntentSystemContext.Source.actionButton(_:), v12);
  *(_QWORD *)(v9 + 3 * v5 + v16) = 11;
  v17 = *(int *)(v3 + 48);
  v13(v9 + 4 * v5, enum case for IntentSystemContext.Source.controlCenter(_:), v12);
  *(_QWORD *)(v9 + 4 * v5 + v17) = 12;
  v18 = v9 + 5 * v5;
  v19 = *(int *)(v3 + 48);
  v13(v18, enum case for IntentSystemContext.Source.widget(_:), v12);
  *(_QWORD *)(v18 + v19) = 13;
  v20 = sub_10000AA20(v8);
  if (*(_QWORD *)(v20 + 16) && (v21 = sub_10000C4D8(a1), (v22 & 1) != 0))
    v23 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
  else
    v23 = 0;
  swift_bridgeObjectRelease(v20);
  return v23;
}

uint64_t sub_10000CFC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000D0E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v0 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AppShortcut(0);
  v18 = *(_QWORD *)(v4 - 8);
  v19 = v4;
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009788(&qword_10001A040);
  v9 = *(_QWORD *)(sub_100009788(&qword_10001A048) - 8);
  v10 = swift_allocObject(v8, ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ 3 * *(_QWORD *)(v9 + 72), *(unsigned __int8 *)(v9 + 80) | 7);
  *(_OWORD *)(v10 + 16) = xmmword_1000122F0;
  v11 = sub_10000A97C();
  AppShortcutPhrase.init(stringLiteral:)(0x1000000000000010, 0x8000000100010E60, &type metadata for SafetyMonitorIntent, v11);
  AppShortcutPhrase.init(stringLiteral:)(0x1000000000000011, 0x8000000100010E80, &type metadata for SafetyMonitorIntent, v11);
  AppShortcutPhrase.init(stringLiteral:)(0x49A0C26B63656843, 0xA90000000000006ELL, &type metadata for SafetyMonitorIntent, v11);
  v12 = LocalizedStringResource.init(stringLiteral:)(0x1000000000000010, 0x8000000100010E60);
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v12, v10, v3, 0xD000000000000015, 0x8000000100010EA0, &type metadata for SafetyMonitorIntent, v11);
  v13 = static AppShortcutsBuilder.buildExpression(_:)(v7);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v19);
  v14 = sub_100009788(&qword_10001A050);
  v15 = swift_allocObject(v14, 40, 7);
  *(_OWORD *)(v15 + 16) = xmmword_100012260;
  *(_QWORD *)(v15 + 32) = v13;
  v16 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v15);
  return v16;
}

unint64_t sub_10000D318()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A078;
  if (!qword_10001A078)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A078);
  }
  return result;
}

uint64_t sub_10000D354(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000D36C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100009788(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D3A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100009788(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000D3EC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_10000D3FC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000D43C(uint64_t a1)
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

id sub_10000D4AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider);
  }
  else
  {
    v4 = type metadata accessor for LiveActivityElementViewController();
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

uint64_t sub_10000D64C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  NSObject *v25;
  NSObject **v26;
  uint64_t v27;
  uint8_t *v28;
  void *v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject **v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void **aBlock;
  _QWORD v59[4];
  uint64_t v60;

  v57 = type metadata accessor for DispatchWorkItemFlags(0);
  v52 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57, v1);
  v56 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchQoS(0);
  v54 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  __chkstk_darwin(v3, v4);
  v53 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for DispatchTime(0);
  v6 = *(_QWORD *)(v51 - 8);
  v8 = __chkstk_darwin(v51, v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  v50 = (char *)&v46 - v12;
  v13 = type metadata accessor for Logger(0);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = __chkstk_darwin(v13, v15);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = Logger.initiator.unsafeMutableAddressor(v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v19, v13);
  v20 = v0;
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v48 = v13;
    v23 = swift_slowAlloc(12, -1);
    v49 = v10;
    v47 = v6;
    v24 = (uint8_t *)v23;
    v46 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v24 = 138412290;
    aBlock = (void **)&v20->isa;
    v25 = v20;
    v13 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v59, v24 + 4, v24 + 12);
    v26 = v46;
    *v46 = v20;

    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@,refreshSize", v24, 0xCu);
    v27 = sub_100009788(&qword_10001A190);
    swift_arrayDestroy(v26, 1, v27);
    swift_slowDealloc(v26, -1, -1);
    v28 = v24;
    v6 = v47;
    v10 = v49;
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {

    v21 = v20;
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
  sub_10000A7C4(0, (unint64_t *)&unk_10001A170, OS_dispatch_queue_ptr);
  v29 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  v30 = v50;
  + infix(_:_:)(v10, 0.1);
  v31 = *(void (**)(char *, uint64_t))(v6 + 8);
  v32 = v51;
  v31(v10, v51);
  v33 = swift_allocObject(&unk_100014E38, 24, 7);
  *(_QWORD *)(v33 + 16) = v20;
  v59[3] = sub_10000E238;
  v60 = v33;
  aBlock = _NSConcreteStackBlock;
  v59[0] = 1107296256;
  v59[1] = sub_10000D43C;
  v59[2] = &unk_100014E50;
  v34 = _Block_copy(&aBlock);
  v35 = v60;
  v36 = v20;
  v37 = swift_release(v35);
  v38 = v53;
  static DispatchQoS.unspecified.getter(v37);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v39 = sub_1000098E4((unint64_t *)&unk_100019F90, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v40 = sub_100009788((uint64_t *)&unk_10001A180);
  v41 = sub_10000A840(&qword_100019FA0, (uint64_t *)&unk_10001A180, (uint64_t)&protocol conformance descriptor for [A]);
  v42 = v56;
  v43 = v40;
  v44 = v57;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v43, v41, v57, v39);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v30, v38, v42, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v52 + 8))(v42, v44);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v38, v55);
  return ((uint64_t (*)(char *, uint64_t))v31)(v30, v32);
}

void sub_10000DA9C(char *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  _QWORD *v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t v37;

  v2 = (_QWORD *)type metadata accessor for Logger(0);
  v3 = *(v2 - 1);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window;
  v8 = *(id *)&a1[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window];
  if (!v8 || (v8 = objc_msgSend(v8, "windowScene")) == 0)
  {
LABEL_11:
    v23 = Logger.initiator.unsafeMutableAddressor(v8);
    (*(void (**)(char *, uint64_t, _QWORD *))(v3 + 16))(v6, v23, v2);
    v24 = a1;
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(8, -1);
      v35 = v2;
      v36 = v24;
      v29 = (_QWORD *)v28;
      v34 = v3;
      *(_DWORD *)v27 = 138412290;
      v30 = v24;
      v3 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v27 + 4, v27 + 12);
      *v29 = v24;

      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@: Unable to resize - window scene is not an ActivityScene scene", v27, 0xCu);
      v31 = sub_100009788(&qword_10001A190);
      swift_arrayDestroy(v29, 1, v31);
      v32 = v29;
      v2 = v35;
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v27, -1, -1);
    }
    else
    {

      v25 = v24;
    }

    (*(void (**)(char *, _QWORD *))(v3 + 8))(v6, v2);
    return;
  }
  v35 = v8;
  v9 = type metadata accessor for ActivityScene(0);
  if (!swift_dynamicCastClass(v35, v9))
  {

    goto LABEL_11;
  }
  v10 = *(void **)&a1[v7];
  if (!v10)
    goto LABEL_9;
  v11 = objc_msgSend(v10, "rootViewController");
  if (!v11)
    goto LABEL_9;
  v12 = v11;
  v13 = objc_msgSend(v11, "view");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "sizeToFit");

    v15 = objc_msgSend(v12, "view");
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "bounds");
      v18 = v17;
      v20 = v19;

      v21 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
      v22 = ActivitySceneMetrics.init(size:cornerRadius:)(v18, v20, 0.0);
      dispatch thunk of ActivityScene.resolvedMetrics.setter(v22);

LABEL_9:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000DD90(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_10000D64C();

  }
}

uint64_t sub_10000DDE0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24, v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A7C4(0, (unint64_t *)&unk_10001A170, OS_dispatch_queue_ptr);
  v13 = (void *)static OS_dispatch_queue.main.getter();
  v14 = swift_allocObject(&unk_100014ED8, 32, 7);
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  aBlock[4] = sub_10000F7B8;
  v27 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000D43C;
  aBlock[3] = &unk_100014EF0;
  v15 = _Block_copy(aBlock);
  v16 = v27;
  v17 = a2;
  v18 = a3;
  v19 = swift_release(v16);
  static DispatchQoS.unspecified.getter(v19);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v20 = sub_1000098E4((unint64_t *)&unk_100019F90, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_100009788((uint64_t *)&unk_10001A180);
  v22 = sub_10000A840(&qword_100019FA0, (uint64_t *)&unk_10001A180, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v5, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v24);
}

id sub_10000DFFC(void *a1)
{
  id result;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;

  result = objc_msgSend(a1, "view");
  if (result)
  {
    v3 = result;
    objc_msgSend(result, "sizeToFit");

    result = objc_msgSend(a1, "view");
    if (result)
    {
      v4 = result;
      objc_msgSend(result, "bounds");
      v6 = v5;
      v8 = v7;

      v9 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
      v10 = ActivitySceneMetrics.init(size:cornerRadius:)(v6, v8, 0.0);
      return (id)dispatch thunk of ActivityScene.resolvedMetrics.setter(v10);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_10000E0BC()
{
  char *v0;
  char *v1;
  void *v2;
  objc_super v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate____lazy_storage___systemApertureElementProvider] = 0;
  v1 = v0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v2 = (void *)sub_10000F4C4((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v2 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v1[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_cancellableSet] = v2;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return objc_msgSendSuper2(&v4, "init");
}

id sub_10000E17C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveActivitySceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LiveActivitySceneDelegate()
{
  return objc_opt_self(_TtC16SafetyMonitorApp25LiveActivitySceneDelegate);
}

uint64_t sub_10000E214()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E238()
{
  uint64_t v0;

  sub_10000DA9C(*(char **)(v0 + 16));
}

uint64_t sub_10000E240(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E250(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000E258(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000E328(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000F7E0((uint64_t)v12, *a3);
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
      sub_10000F7E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000F7C0(v12);
  return v7;
}

uint64_t sub_10000E328(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000E4E0(a5, a6);
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

uint64_t sub_10000E4E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000E574(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000E74C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000E74C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000E574(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000E6E8(v4, 0);
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

_QWORD *sub_10000E6E8(uint64_t a1, uint64_t a2)
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
  v4 = sub_100009788((uint64_t *)&unk_10001A1F0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000E74C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009788((uint64_t *)&unk_10001A1F0);
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

void sub_10000E898(void *a1)
{
  char *v1;
  char *v2;
  Class isa;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  char *v31;
  id v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char **v39;
  char *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  uint64_t v46;
  char **v47;
  uint64_t v48;
  id v49;
  void *v50;
  NSObject *v51;
  char **v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  Class v90;
  id v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  id v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  char **v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  uint64_t v120[3];
  uint64_t v121;
  uint64_t v122;

  v2 = v1;
  v119 = type metadata accessor for Logger(0);
  isa = v119[-1].isa;
  __chkstk_darwin(v119, v5);
  v7 = (char *)&v114 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009788((uint64_t *)&unk_10001A1B0);
  v118 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UIHostingControllerSizingOptions(0);
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v114 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LiveActivityView(0);
  v18 = __chkstk_darwin(v16, v17);
  v20 = (char *)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v21);
  v23 = (char *)&v114 - v22;
  v24 = type metadata accessor for ActivityScene(0);
  v25 = swift_dynamicCastClass(a1, v24);
  if (v25)
  {
    v26 = (void *)v25;
    v27 = a1;
    if (objc_msgSend(v26, "SBUI_isHostedBySystemAperture"))
    {
      v119 = v27;
      v28 = sub_10000D4AC();
      objc_msgSend(v26, "setSystemApertureElementViewControllerProvider:", v28);

      return;
    }
    v116 = v27;
    v117 = v8;
    v49 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v26);
    v50 = *(void **)&v2[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window];
    *(_QWORD *)&v2[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_window] = v49;
    v51 = v49;

    v52 = (char **)SessionViewModel.shared.unsafeMutableAddressor();
    v53 = *v52;
    v54 = swift_allocObject(&unk_100014E88, 24, 7);
    swift_unknownObjectWeakInit(v54 + 16, v2);
    v55 = swift_retain(v53);
    LiveActivityView.init(with:onLockscreen:resizeHandler:)(v55, 1, sub_10000F77C, v54);
    v56 = objc_allocWithZone((Class)sub_100009788(&qword_100019F50));
    sub_1000097C8((uint64_t)v23, (uint64_t)v20);
    v57 = (void *)UIHostingController.init(rootView:)(v20);
    sub_10000980C((uint64_t)v23);
    v58 = v57;
    static UIHostingControllerSizingOptions.preferredContentSize.getter();
    dispatch thunk of UIHostingController.sizingOptions.setter(v15);

    v59 = objc_msgSend(v58, "view");
    if (v59)
    {
      v60 = v59;
      v61 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
      objc_msgSend(v60, "setBackgroundColor:", v61);

      -[NSObject setRootViewController:](v51, "setRootViewController:", v58);
      -[NSObject makeKeyAndVisible](v51, "makeKeyAndVisible");
      v62 = objc_msgSend(v58, "view");
      if (v62)
      {
        v63 = v62;
        objc_msgSend(v62, "sizeToFit");

        v64 = objc_msgSend(v58, "view");
        if (v64)
        {
          v65 = v64;
          v115 = v52;
          objc_msgSend(v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

          v66 = sub_100009788((uint64_t *)&unk_10001A1C0);
          v67 = swift_allocObject(v66, 64, 7);
          *(_OWORD *)(v67 + 16) = xmmword_100012250;
          v68 = objc_msgSend(v58, "view");
          if (v68)
          {
            v69 = v68;
            v70 = objc_msgSend(v68, "leftAnchor");

            v71 = -[NSObject leftAnchor](v51, "leftAnchor");
            v119 = v51;
            v72 = objc_msgSend(v70, "constraintEqualToAnchor:", v71);

            *(_QWORD *)(v67 + 32) = v72;
            v73 = objc_msgSend(v58, "view");
            if (v73)
            {
              v74 = v73;
              v75 = objc_msgSend(v73, "rightAnchor");

              v76 = -[NSObject rightAnchor](v119, "rightAnchor");
              v77 = objc_msgSend(v75, "constraintEqualToAnchor:", v76);

              *(_QWORD *)(v67 + 40) = v77;
              v78 = objc_msgSend(v58, "view");
              if (v78)
              {
                v79 = v78;
                v114 = v2;
                v80 = objc_msgSend(v78, "topAnchor");

                v81 = -[NSObject topAnchor](v119, "topAnchor");
                v82 = objc_msgSend(v80, "constraintEqualToAnchor:", v81);

                *(_QWORD *)(v67 + 48) = v82;
                v83 = objc_msgSend(v58, "view");
                if (v83)
                {
                  v84 = v83;
                  v85 = (void *)objc_opt_self(NSLayoutConstraint);
                  v86 = objc_msgSend(v84, "bottomAnchor");

                  v87 = -[NSObject bottomAnchor](v119, "bottomAnchor");
                  v88 = objc_msgSend(v86, "constraintEqualToAnchor:", v87);

                  *(_QWORD *)(v67 + 56) = v88;
                  v120[0] = v67;
                  specialized Array._endMutation()();
                  v89 = v120[0];
                  sub_10000A7C4(0, (unint64_t *)&unk_100019F80, NSLayoutConstraint_ptr);
                  v90 = Array._bridgeToObjectiveC()().super.isa;
                  swift_bridgeObjectRelease(v89);
                  objc_msgSend(v85, "activateConstraints:", v90);

                  v91 = objc_msgSend(v58, "view");
                  if (v91)
                  {
                    v92 = v91;
                    objc_msgSend(v91, "bounds");
                    v94 = v93;
                    v96 = v95;

                    v97 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
                    v98 = ActivitySceneMetrics.init(size:cornerRadius:)(v94, v96, 0.0);
                    dispatch thunk of ActivityScene.resolvedMetrics.setter(v98);
                    v99 = *v115;
                    v100 = type metadata accessor for SessionViewModel(0);
                    v101 = sub_1000098E4(&qword_10001A1D0, (uint64_t (*)(uint64_t))&type metadata accessor for SessionViewModel, (uint64_t)&protocol conformance descriptor for SessionViewModel);
                    swift_retain(v99);
                    v102 = ObservableObject<>.objectWillChange.getter(v100, v101);
                    swift_release(v99);
                    v120[0] = v102;
                    v103 = type metadata accessor for ObservableObjectPublisher(0);
                    Publisher<>.makeConnectable()(v103, &protocol witness table for ObservableObjectPublisher);
                    swift_release(v102);
                    v104 = sub_10000A840(&qword_10001A1D8, (uint64_t *)&unk_10001A1B0, (uint64_t)&protocol conformance descriptor for Publishers.MakeConnectable<A>);
                    v105 = v117;
                    v106 = ConnectablePublisher.autoconnect()(v117, v104);
                    (*(void (**)(char *, uint64_t))(v118 + 8))(v11, v105);
                    v120[0] = v106;
                    v107 = swift_allocObject(&unk_100014EB0, 32, 7);
                    *(_QWORD *)(v107 + 16) = v58;
                    *(_QWORD *)(v107 + 24) = v26;
                    v108 = v116;
                    v109 = v58;
                    v110 = sub_100009788(&qword_10001A1E0);
                    v111 = sub_10000A840(&qword_10001A1E8, &qword_10001A1E0, (uint64_t)&protocol conformance descriptor for Publishers.Autoconnect<A>);
                    v112 = Publisher<>.sink(receiveValue:)(sub_10000F7B0, v107, v110, v111);
                    swift_release(v107);
                    swift_release(v120[0]);
                    v113 = &v114[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_cancellableSet];
                    swift_beginAccess(&v114[OBJC_IVAR____TtC16SafetyMonitorApp25LiveActivitySceneDelegate_cancellableSet], v120, 33, 0);
                    AnyCancellable.store(in:)(v113);
                    swift_endAccess(v120);

                    swift_release(v112);
                    return;
                  }
                  goto LABEL_24;
                }
LABEL_23:
                __break(1u);
LABEL_24:
                __break(1u);
                return;
              }
LABEL_22:
              __break(1u);
              goto LABEL_23;
            }
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  v29 = Logger.initiator.unsafeMutableAddressor(0);
  (*((void (**)(char *, uint64_t, NSObject *))isa + 2))(v7, v29, v119);
  v30 = a1;
  v31 = v2;
  v32 = v30;
  v33 = v31;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.error.getter();
  v36 = v35;
  if (os_log_type_enabled(v34, v35))
  {
    v37 = swift_slowAlloc(22, -1);
    LODWORD(v117) = v36;
    v38 = v37;
    v115 = (char **)swift_slowAlloc(8, -1);
    v116 = v34;
    v39 = v115;
    v118 = swift_slowAlloc(32, -1);
    v120[0] = v118;
    *(_DWORD *)v38 = 138412546;
    v121 = (uint64_t)v33;
    v40 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, &v122, v38 + 4, v38 + 12);
    *v39 = v33;

    *(_WORD *)(v38 + 12) = 2080;
    v41 = objc_msgSend(v32, "description");
    v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
    v44 = v43;

    v121 = sub_10000E258(v42, v44, v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, &v122, v38 + 14, v38 + 22);

    swift_bridgeObjectRelease(v44);
    v45 = v116;
    _os_log_impl((void *)&_mh_execute_header, v116, (os_log_type_t)v117, "%@: Not a session scene: %s", (uint8_t *)v38, 0x16u);
    v46 = sub_100009788(&qword_10001A190);
    v47 = v115;
    swift_arrayDestroy(v115, 1, v46);
    swift_slowDealloc(v47, -1, -1);
    v48 = v118;
    swift_arrayDestroy(v118, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1, -1);
    swift_slowDealloc(v38, -1, -1);

  }
  else
  {

  }
  (*((void (**)(char *, NSObject *))isa + 1))(v7, v119);
}

uint64_t sub_10000F2F8(const char *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject **v16;
  uint64_t v17;
  NSObject **v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = __chkstk_darwin(v3, v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = Logger.initiator.unsafeMutableAddressor(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v8, v9, v3);
  v10 = v1;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v21 = v3;
    v13 = swift_slowAlloc(12, -1);
    v20 = a1;
    v14 = (uint8_t *)v13;
    v19 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    v22 = v10;
    v15 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v14 + 4, v14 + 12);
    v16 = v19;
    *v19 = v10;

    v3 = v21;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v20, v14, 0xCu);
    v17 = sub_100009788(&qword_10001A190);
    swift_arrayDestroy(v16, 1, v17);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  return sub_10000D64C();
}

uint64_t sub_10000F4C4(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100009788(&qword_10001A198);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      v24 = v1;
      if (!v2)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  v24 = v1;
  if (!v2)
  {
LABEL_4:
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      return (uint64_t)v4;
    goto LABEL_15;
  }
LABEL_11:
  if (v1 < 0)
    v7 = v1;
  else
    v7 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v7);
  result = swift_bridgeObjectRelease(v1);
  if (!v5)
    return (uint64_t)v4;
LABEL_15:
  v8 = 0;
  v9 = (char *)(v4 + 7);
  v23 = v5;
  while ((v24 & 0xC000000000000001) != 0)
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v24);
    v10 = __OFADD__(v8++, 1);
    if (v10)
      goto LABEL_32;
LABEL_24:
    v25 = result;
    v27 = result;
    v11 = v4[5];
    v12 = type metadata accessor for AnyCancellable(0);
    v13 = sub_1000098E4(&qword_10001A1A0, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v12, v13);
    v14 = -1 << *((_BYTE *)v4 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
    v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      v19 = ~v14;
      v20 = sub_1000098E4(&qword_10001A1A8, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
      do
      {
        v26 = *(_QWORD *)(v4[6] + 8 * v15);
        result = dispatch thunk of static Equatable.== infix(_:_:)(&v26, &v27, v12, v20);
        if ((result & 1) != 0)
        {
          result = swift_release(v25);
          v5 = v23;
          goto LABEL_17;
        }
        v15 = (v15 + 1) & v19;
        v16 = v15 >> 6;
        v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
        v18 = 1 << v15;
      }
      while ((v17 & (1 << v15)) != 0);
      v5 = v23;
    }
    *(_QWORD *)&v9[8 * v16] = v18 | v17;
    *(_QWORD *)(v4[6] + 8 * v15) = v25;
    v21 = v4[2];
    v10 = __OFADD__(v21, 1);
    v22 = v21 + 1;
    if (v10)
      goto LABEL_33;
    v4[2] = v22;
LABEL_17:
    if (v8 == v5)
      return (uint64_t)v4;
  }
  if (v8 >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_34;
  result = swift_retain(*(_QWORD *)(v24 + 32 + 8 * v8));
  v10 = __OFADD__(v8++, 1);
  if (!v10)
    goto LABEL_24;
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_10000F758()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000F77C()
{
  uint64_t v0;

  sub_10000DD90(v0);
}

uint64_t sub_10000F784()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F7B0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000DDE0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

id sub_10000F7B8()
{
  uint64_t v0;

  return sub_10000DFFC(*(void **)(v0 + 16));
}

uint64_t sub_10000F7C0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000F7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t Logger.intents.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_100019AB8 != -1)
    swift_once(&qword_100019AB8, sub_10000F870);
  v0 = type metadata accessor for Logger(0);
  return sub_10000D354(v0, (uint64_t)static Logger.intents);
}

uint64_t sub_10000F870()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_10000D3FC(v0, static Logger.intents);
  sub_10000D354(v0, (uint64_t)static Logger.intents);
  v2 = qword_10001A260;
  v1 = off_10001A268;
  swift_bridgeObjectRetain(off_10001A268);
  return Logger.init(subsystem:category:)(v2, v1, 0x73746E65746E49, 0xE700000000000000);
}

uint64_t static Logger.intents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100019AB8 != -1)
    swift_once(&qword_100019AB8, sub_10000F870);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000D354(v2, (uint64_t)static Logger.intents);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000F964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100009788(&qword_10001A278);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, nullsub_1, 0, &type metadata for EmptyView, &protocol witness table for EmptyView);
  v5 = sub_10000FACC();
  static SceneBuilder.buildBlock<A>(_:)(v4, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000FA68();
  static App.main()();
  return 0;
}

unint64_t sub_10000FA68()
{
  unint64_t result;

  result = qword_10001A270;
  if (!qword_10001A270)
  {
    result = swift_getWitnessTable("E*", &type metadata for SafetyMonitorApp);
    atomic_store(result, (unint64_t *)&qword_10001A270);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyMonitorApp()
{
  return &type metadata for SafetyMonitorApp;
}

uint64_t sub_10000FABC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100012964, 1);
}

unint64_t sub_10000FACC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A280;
  if (!qword_10001A280)
  {
    v1 = sub_100009848(&qword_10001A278);
    result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A280);
  }
  return result;
}

uint64_t sub_10000FB1C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC16SafetyMonitorAppP33_1675DBF7252032CF7509BED57C48919719ResourceBundleClass);
}
