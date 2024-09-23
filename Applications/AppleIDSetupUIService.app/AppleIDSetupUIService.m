uint64_t sub_100003F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100005D24(v0, qword_100016A48);
  v1 = sub_100005D0C(v0, (uint64_t)qword_100016A48);
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v2 = sub_100005D0C(v0, (uint64_t)static AISLogger.uiService);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1000040BC(NSObject *a1, void (*a2)(_QWORD), NSObject *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  os_log_type_t v29;
  NSObject **v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  NSObject **v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _BYTE *v49;
  int v50;
  void (*v51)(_QWORD);
  NSObject *v52;
  uint64_t v53;
  _BYTE v54[16];
  uint64_t v55;
  uint64_t v56;

  v7 = sub_100005BFC((uint64_t *)&unk_100017070);
  __chkstk_darwin(v7);
  v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PresentationRequest(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_23;
  }
  v14 = -[NSObject userInfo](a1, "userInfo");
  if (v14)
  {
    v15 = v14;
    v52 = a3;
    v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v14, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    sub_100006F4C(v16, (uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_100006014((uint64_t)v9, (uint64_t *)&unk_100017070);
      if (qword_100016A80 != -1)
        swift_once(&qword_100016A80, sub_1000099D8);
      v17 = type metadata accessor for Logger(0);
      sub_100005D0C(v17, (uint64_t)static AISLogger.uiService);
      v18 = swift_bridgeObjectRetain(v16);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(12, -1);
        v22 = swift_slowAlloc(32, -1);
        v53 = v22;
        *(_DWORD *)v21 = 136315138;
        v23 = swift_bridgeObjectRetain(v16);
        v24 = Dictionary.description.getter(v23, &type metadata for AnyHashable);
        v26 = v25;
        swift_bridgeObjectRelease(v16);
        v55 = sub_100009F50(v24, v26, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56);
        swift_bridgeObjectRelease_n(v16, 2);
        swift_bridgeObjectRelease(v26);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Unable to build presentation request with user info: %s", v21, 0xCu);
        swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
        v27 = (_QWORD *)v22;
LABEL_12:
        swift_slowDealloc(v27, -1, -1);
        swift_slowDealloc(v21, -1, -1);

        return;
      }

      swift_bridgeObjectRelease_n(v16, 2);
      return;
    }
    swift_bridgeObjectRelease(v16);
    sub_100006050((uint64_t)v9, (uint64_t)v13);
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v33 = type metadata accessor for Logger(0);
    sub_100005D0C(v33, (uint64_t)static AISLogger.uiService);
    v34 = v3;
    v35 = a1;
    v36 = v34;
    v37 = v35;
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    v40 = v39;
    if (os_log_type_enabled(v38, v39))
    {
      v41 = swift_slowAlloc(22, -1);
      v42 = (NSObject **)swift_slowAlloc(16, -1);
      *(_DWORD *)v41 = 138412546;
      v51 = a2;
      v50 = v40;
      v53 = (uint64_t)v36;
      v48[1] = v41 + 12;
      v49 = v54;
      v43 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
      *v42 = v36;

      *(_WORD *)(v41 + 12) = 2112;
      v53 = (uint64_t)v37;
      v44 = v37;
      a2 = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v49);
      v42[1] = a1;

      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v50, "Configuring remote alert (%@) with context: %@", (uint8_t *)v41, 0x16u);
      v45 = sub_100005BFC(&qword_100016B78);
      swift_arrayDestroy(v42, 2, v45);
      swift_slowDealloc(v42, -1, -1);
      swift_slowDealloc(v41, -1, -1);
    }
    else
    {

      v38 = v36;
    }

    v46 = (uint64_t)v36 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest;
    swift_beginAccess((char *)v36 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest, &v53, 33, 0);
    sub_100006094((uint64_t)v13, v46);
    v47 = swift_endAccess(&v53);
    if (a2)
    {
      a2(v47);
      sub_100005C4C((uint64_t)v13);
      return;
    }
LABEL_23:
    __break(1u);
    return;
  }
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v28 = type metadata accessor for Logger(0);
  sub_100005D0C(v28, (uint64_t)static AISLogger.uiService);
  v52 = a1;
  v19 = Logger.logObject.getter(v52);
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v29))
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v30 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v21 = 138412290;
    v53 = (uint64_t)v52;
    v31 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54);
    *v30 = a1;

    _os_log_impl((void *)&_mh_execute_header, v19, v29, "Could not find configuration context on remote alert: %@", v21, 0xCu);
    v32 = sub_100005BFC(&qword_100016B78);
    swift_arrayDestroy(v30, 1, v32);
    v27 = v30;
    goto LABEL_12;
  }

}

void sub_1000047E0(char a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;
  objc_super v17;

  v17.receiver = v2;
  v17.super_class = (Class)swift_getObjectType(v2, a2);
  objc_msgSendSuper2(&v17, "viewWillAppear:", a1 & 1);
  v4 = OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController;
  if (!*(_QWORD *)&v2[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController])
  {
    v5 = swift_allocObject(&unk_100010770, 24, 7);
    swift_unknownObjectWeakInit(v5 + 16, v2);
    v6 = (objc_class *)type metadata accessor for RemoteAlertRootViewController();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = swift_unknownObjectWeakInit(&v7[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_scene], 0);
    v9 = (uint64_t *)&v7[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler];
    *v9 = 0;
    v9[1] = 0;
    swift_unknownObjectWeakAssign(v8, 0);
    v10 = *v9;
    v11 = v9[1];
    *v9 = (uint64_t)sub_10000600C;
    v9[1] = v5;
    swift_retain_n(v5, 2);
    sub_100005F24(v10, v11);
    v16.receiver = v7;
    v16.super_class = v6;
    v12 = objc_msgSendSuper2(&v16, "initWithNibName:bundle:", 0, 0);
    swift_release_n(v5, 2);
    v13 = *(void **)&v2[v4];
    *(_QWORD *)&v2[v4] = v12;
    v14 = v12;

    v15 = *(void **)&v2[v4];
    if (v15)
      objc_msgSend(v15, "setModalPresentationStyle:", 0);
    objc_msgSend(v2, "presentViewController:animated:completion:", v14, 0, 0);

  }
}

void sub_100004958(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  void *v4;
  _BYTE v5[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_100005D6C(0, v3);

  }
}

void sub_1000049EC(char a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  int EnumCaseMultiPayload;
  char v26[24];
  objc_super v27;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v3, a2);
  v6 = type metadata accessor for PresentationRequest(0);
  v7 = __chkstk_darwin(v6);
  v9 = &v26[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = __chkstk_darwin(v7);
  v12 = &v26[-v11 - 8];
  __chkstk_darwin(v10);
  v14 = &v26[-v13 - 8];
  v27.receiver = v3;
  v27.super_class = ObjectType;
  objc_msgSendSuper2(&v27, "viewDidAppear:", a1 & 1);
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100005D0C(v15, (uint64_t)static AISLogger.uiService);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "SetupAlertViewController: viewDidAppear", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  v20 = *(void **)&v3[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController];
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v21, "presentedViewController");

    if (v22
      || (v23 = (uint64_t)&v3[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest],
          swift_beginAccess(v23, v26, 0, 0),
          sub_100005FA4(v23, (uint64_t)v14),
          sub_100005FA4((uint64_t)v14, (uint64_t)v12),
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v12, v6),
          sub_100005C4C((uint64_t)v12),
          sub_100005C4C((uint64_t)v14),
          EnumCaseMultiPayload == 2))
    {

    }
    else
    {
      sub_100005FA4(v23, (uint64_t)v9);
      sub_100006308((uint64_t)v9);

      sub_100005C4C((uint64_t)v9);
    }
  }
}

id sub_100004C6C(char a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  objc_super v13;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2, a2);
  if (qword_100016A40 != -1)
    swift_once(&qword_100016A40, sub_100003F0C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100005D0C(v6, (uint64_t)qword_100016A48);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SetupAlertViewController viewDidDisappear", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = *(void **)&v3[OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController];
  if (v11)
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, 0);
  v13.receiver = v3;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, "viewDidDisappear:", a1 & 1);
}

void *sub_100004DD8()
{
  void *result;
  void *v1;

  result = (void *)sub_1000057A0();
  if (result)
  {
    v1 = result;
    objc_msgSend(result, "invalidate");
    return (void *)swift_unknownObjectRelease(v1);
  }
  return result;
}

void sub_100004EB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34[2];

  if (a1)
  {
    v2 = v1;
    v4 = swift_bridgeObjectRetain(a1);
    sub_100005284(v4);
    v6 = v5;
    swift_bridgeObjectRelease(a1);

    if (v6)
    {
      if (qword_100016A80 != -1)
        swift_once(&qword_100016A80, sub_1000099D8);
      v7 = type metadata accessor for Logger(0);
      v8 = sub_100005D0C(v7, (uint64_t)static AISLogger.uiService);
      v9 = Logger.logObject.getter(v8);
      v10 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Received home button press", v11, 2u);
        swift_slowDealloc(v11, -1, -1);
      }

      v12 = OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked;
      if ((*(_BYTE *)(v2
                     + OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController_homeButtonPressedWhileLocked) & 1) != 0
        || (v13 = sub_10000571C()) == 0
        || (v14 = v13, v15 = objc_msgSend(v13, "isUnlocked"), v14, (v15 & 1) != 0))
      {
        if (qword_100016A40 != -1)
          swift_once(&qword_100016A40, sub_100003F0C);
        v16 = sub_100005D0C(v7, (uint64_t)qword_100016A48);
        v17 = Logger.logObject.getter(v16);
        v18 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Ignoring first home button press to unlock", v19, 2u);
          swift_slowDealloc(v19, -1, -1);
        }

        *(_BYTE *)(v2 + v12) = 1;
      }
      else
      {
        v32 = *(void **)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_rootViewController);
        if (v32)
          objc_msgSend(v32, "dismissViewControllerAnimated:completion:", 1, 0);
      }
    }
    else
    {
      if (qword_100016A80 != -1)
        swift_once(&qword_100016A80, sub_1000099D8);
      v20 = type metadata accessor for Logger(0);
      sub_100005D0C(v20, (uint64_t)static AISLogger.uiService);
      v21 = swift_bridgeObjectRetain_n(a1, 2);
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = swift_slowAlloc(32, -1);
        v34[0] = v25;
        *(_DWORD *)v24 = 136315138;
        v26 = sub_100005C88();
        v27 = sub_100005CC4();
        v28 = swift_bridgeObjectRetain(a1);
        v29 = Set.description.getter(v28, v26, v27);
        v31 = v30;
        swift_bridgeObjectRelease(a1);
        v33 = sub_100009F50(v29, v31, v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34);
        swift_bridgeObjectRelease_n(a1, 2);
        swift_bridgeObjectRelease(v31);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Ignoring received button actions: %s", v24, 0xCu);
        swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a1, 2);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100005284(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id i;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  void *v29;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_100005C88();
    v5 = sub_100005CC4();
    v6 = Set.Iterator.init(_cocoa:)(v28, v3, v4, v5);
    v1 = v28[0];
    v26 = v28[1];
    v7 = v28[2];
    v8 = v28[3];
    v9 = v28[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v25 = v7;
  v13 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
LABEL_11:
  if (v9)
  {
    v14 = (v9 - 1) & v9;
    v15 = __clz(__rbit64(v9)) | (v8 << 6);
    v16 = v8;
    goto LABEL_32;
  }
  v22 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v22 < v13)
    {
      v23 = *(_QWORD *)(v26 + 8 * v22);
      v16 = v8 + 1;
      if (v23)
        goto LABEL_31;
      v16 = v8 + 2;
      if (v8 + 2 >= v13)
        goto LABEL_36;
      v23 = *(_QWORD *)(v26 + 8 * v16);
      if (v23)
        goto LABEL_31;
      v16 = v8 + 3;
      if (v8 + 3 >= v13)
        goto LABEL_36;
      v23 = *(_QWORD *)(v26 + 8 * v16);
      if (v23)
        goto LABEL_31;
      v16 = v8 + 4;
      if (v8 + 4 >= v13)
        goto LABEL_36;
      v23 = *(_QWORD *)(v26 + 8 * v16);
      if (v23)
      {
LABEL_31:
        v14 = (v23 - 1) & v23;
        v15 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_32:
        for (i = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v15); i; v14 = v9)
        {
          if (objc_msgSend(i, "events", v25) == (id)16)
            break;

          v8 = v16;
          v9 = v14;
          if ((v1 & 0x8000000000000000) == 0)
            goto LABEL_11;
LABEL_13:
          v17 = __CocoaSet.Iterator.next()(v6);
          if (!v17)
            break;
          v18 = v17;
          v27 = v17;
          v19 = sub_100005C88();
          swift_unknownObjectRetain(v18, v20);
          swift_dynamicCast(&v29, &v27, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
          i = v29;
          swift_unknownObjectRelease(v18);
          v16 = v8;
        }
        goto LABEL_36;
      }
      v16 = v8 + 5;
      if (v8 + 5 < v13)
      {
        v23 = *(_QWORD *)(v26 + 8 * v16);
        if (!v23)
        {
          v24 = v8 + 6;
          while (v13 != v24)
          {
            v23 = *(_QWORD *)(v26 + 8 * v24++);
            if (v23)
            {
              v16 = v24 - 1;
              goto LABEL_31;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
LABEL_36:
    sub_100005D64(v1);
    return;
  }
  __break(1u);
}

void sub_1000055CC()
{
  uint64_t v0;

  sub_100005C4C(v0 + OBJC_IVAR____TtC21AppleIDSetupUIService24SetupAlertViewController_presentationRequest);

}

id sub_1000055F8(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_100005664()
{
  return type metadata accessor for SetupAlertViewController(0);
}

uint64_t type metadata accessor for SetupAlertViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100016AD8;
  if (!qword_100016AD8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SetupAlertViewController);
  return result;
}

uint64_t sub_1000056A8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for PresentationRequest(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 160);
    if (!result)
      return 0;
  }
  return result;
}

id sub_10000571C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21AppleIDSetupUIService26BaseProxFlowViewController____lazy_storage___device);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = objc_msgSend((id)objc_opt_self(AKDevice), "currentDevice");
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_100005BA4(v4);
  }
  sub_100005C3C(v2);
  return v3;
}

uint64_t sub_1000057A0()
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
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100005BB4((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_100005BFC(&qword_100016B60);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100006014((uint64_t)v7, &qword_100016AF8);
    return 0;
  }
}

void *sub_100005860(char a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *result;
  void *v8;
  objc_super v9;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  objc_msgSendSuper2(&v9, "viewDidAppear:", a1 & 1);
  v3 = (void *)sub_1000057A0();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setStatusBarHidden:withDuration:", 1, 0.3);
    swift_unknownObjectRelease(v4);
  }
  v5 = (void *)sub_1000057A0();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setAllowsBanners:", 1);
    swift_unknownObjectRelease(v6);
  }
  result = (void *)sub_1000057A0();
  if (result)
  {
    v8 = result;
    objc_msgSend(result, "setDesiredHardwareButtonEvents:", 16 * (SFDeviceHomeButtonType() != 3));
    return (void *)swift_unknownObjectRelease(v8);
  }
  return result;
}

id sub_100005B30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseProxFlowViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BaseProxFlowViewController()
{
  return objc_opt_self(_TtC21AppleIDSetupUIService26BaseProxFlowViewController);
}

void sub_100005B90(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_100005B98@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100005BA4(id a1)
{
  if (a1 != (id)1)

}

uint64_t sub_100005BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005BFC(&qword_100016AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005BFC(uint64_t *a1)
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

id sub_100005C3C(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_100005C4C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PresentationRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100005C88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100016B68;
  if (!qword_100016B68)
  {
    v1 = objc_opt_self(SBUIRemoteAlertButtonAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100016B68);
  }
  return result;
}

unint64_t sub_100005CC4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_100016B70;
  if (!qword_100016B70)
  {
    v1 = sub_100005C88();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100016B70);
  }
  return result;
}

uint64_t sub_100005D0C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005D24(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005D64(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_100005D6C(char a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  objc_super v15;
  _QWORD aBlock[5];
  uint64_t v17;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2, a2);
  if (qword_100016A40 != -1)
    swift_once(&qword_100016A40, sub_100003F0C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100005D0C(v6, (uint64_t)qword_100016A48);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 67109120;
    LODWORD(aBlock[0]) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(aBlock, (char *)aBlock + 4);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "SetupAlertViewController dismiss animated: %{BOOL}d", v10, 8u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = swift_allocObject(&unk_100010720, 24, 7);
  *(_QWORD *)(v11 + 16) = v3;
  aBlock[4] = sub_100005F84;
  v17 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000060E8;
  aBlock[3] = &unk_100010738;
  v12 = _Block_copy(aBlock);
  v13 = v17;
  v14 = v3;
  swift_release(v13);
  v15.receiver = v14;
  v15.super_class = ObjectType;
  objc_msgSendSuper2(&v15, "dismissViewControllerAnimated:completion:", a1 & 1, v12);
  _Block_release(v12);
}

uint64_t sub_100005F24(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100005F34()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005F58()
{
  uint64_t v0;

  return sub_1000060E0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100005F60()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void *sub_100005F84()
{
  return sub_100004DD8();
}

uint64_t sub_100005F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005F9C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005FE8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000600C()
{
  uint64_t v0;

  sub_100004958(v0);
}

uint64_t sub_100006014(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005BFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006094(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000060E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1000060E8(uint64_t a1)
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

void sub_1000061A4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v0, "setView:", v1);

  v2 = objc_msgSend(v0, "view");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v3, "setBackgroundColor:", v4);

    v5 = objc_msgSend(v0, "view");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setClipsToBounds:", 0);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100006308(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  os_log_type_t v31;
  char *v32;
  uint8_t *v33;
  uint8_t *v34;
  int EnumCaseMultiPayload;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __objc2_prot *v41;

  v2 = v1;
  v38 = type metadata accessor for PresentationRequest(0);
  v4 = __chkstk_darwin(v38);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v36 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v36 - v10;
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v12 = type metadata accessor for Logger(0);
  sub_100005D0C(v12, (uint64_t)static AISLogger.uiService);
  v13 = sub_100005FA4(a1, (uint64_t)v11);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v37 = a1;
    v16 = swift_slowAlloc(12, -1);
    v36 = v6;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc(32, -1);
    v40 = v18;
    *(_DWORD *)v17 = 136315138;
    sub_100005FA4((uint64_t)v11, (uint64_t)v9);
    v19 = String.init<A>(describing:)(v9, v38);
    v21 = v20;
    v39 = sub_100009F50(v19, v20, &v40);
    a1 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
    swift_bridgeObjectRelease(v21);
    sub_100005C4C((uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Presenting view controller in remote alert for request: %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    v22 = v17;
    v6 = v36;
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    sub_100005C4C((uint64_t)v11);
  }

  v23 = sub_100007104();
  v41 = &OBJC_PROTOCOL___PRXCardContentProviding;
  v24 = swift_dynamicCastObjCProtocolConditional(v23, 1, &v41);
  if (v24)
  {
    v25 = v24;
    v26 = v23;
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Using prox card flow for remote alert presentation", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

  }
  else
  {
    v30 = Logger.logObject.getter(0);
    v31 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = v6;
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Using modal UI flow for remote alert presentation", v33, 2u);
      v34 = v33;
      v6 = v32;
      swift_slowDealloc(v34, -1, -1);
    }

    v26 = sub_100007104();
    sub_100005FA4(a1, (uint64_t)v6);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v6, v38);
    if (EnumCaseMultiPayload != 2)
      sub_100005C4C((uint64_t)v6);
    objc_msgSend(v2, "presentViewController:animated:completion:", v26, EnumCaseMultiPayload != 2, 0);
  }

}

void sub_1000066E4(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  id Strong;

  if (a1)
    a1();
  v4 = *(void (**)(uint64_t))(a3
                                      + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler);
  if (v4)
  {
    v5 = *(_QWORD *)(a3 + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler + 8);
    v6 = swift_retain(v5);
    v4(v6);
    sub_100005F24((uint64_t)v4, v5);
  }
  Strong = (id)swift_unknownObjectWeakLoadStrong(a3 + OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_scene);
  objc_msgSend(Strong, "invalidate");

}

id sub_1000068D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteAlertRootViewController()
{
  return objc_opt_self(_TtC21AppleIDSetupUIService29RemoteAlertRootViewController);
}

uint64_t sub_10000697C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

void sub_1000069B0()
{
  uint64_t v0;

  sub_1000066E4(*(void (**)(void))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1000069BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000069CC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000069D4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_1000069E4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006A08()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t *sub_100006A14(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v10);
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v11 = type metadata accessor for BLEDevice(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = type metadata accessor for BLEDevice(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_100006B00(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if (result <= 1)
  {
    v4 = type metadata accessor for BLEDevice(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_100006B4C(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = type metadata accessor for BLEDevice(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = type metadata accessor for BLEDevice(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

void *sub_100006C10(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_100005C4C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for BLEDevice(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = type metadata accessor for BLEDevice(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t type metadata accessor for PresentationRequest(uint64_t a1)
{
  uint64_t result;

  result = qword_100016D80;
  if (!qword_100016D80)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PresentationRequest);
  return result;
}

void *sub_100006D20(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if (EnumCaseMultiPayload == 1)
  {
    v8 = type metadata accessor for BLEDevice(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = type metadata accessor for BLEDevice(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

void *sub_100006DE4(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_100005C4C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for BLEDevice(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = type metadata accessor for BLEDevice(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_100006EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100006EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100006ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100006EE8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for BLEDevice(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

uint64_t sub_100006F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14[2];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;

  v14[0] = 0x656369766564;
  v14[1] = 0xE600000000000000;
  AnyHashable.init<A>(_:)(v15, v14, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_100008910((uint64_t)v15), (v5 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v16);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_100008940((uint64_t)v15);
  if (*((_QWORD *)&v17 + 1))
  {
    v6 = sub_100005BFC(&qword_100016DB8);
    if ((swift_dynamicCast(v14, &v16, (char *)&type metadata for Any + 8, v6, 6) & 1) != 0)
    {
      v7 = v14[0];
      sub_1000073F8(v14[0], a2);
      return swift_bridgeObjectRelease(v7);
    }
  }
  else
  {
    sub_100008974((uint64_t)&v16);
  }
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100005D0C(v9, (uint64_t)static AISLogger.uiService);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Attmepting to create a new presentation request launched for sharing", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  return sub_10000773C(a1, a2);
}

id sub_100007104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int EnumCaseMultiPayload;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v28;

  v1 = v0;
  v2 = type metadata accessor for BLEDevice(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = __chkstk_darwin(v2);
  v6 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - v7;
  v9 = type metadata accessor for PresentationRequest(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005FA4(v1, (uint64_t)v11);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v11, v9);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
      return objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
    v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v8, v11, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    v14 = *(unsigned __int8 *)(v3 + 80);
    v15 = (v14 + 16) & ~v14;
    v16 = swift_allocObject(&unk_100010838, v15 + v4, v14 | 7);
    v13((char *)(v16 + v15), v6, v2);
    v17 = swift_allocObject(&unk_100010860, 32, 7);
    *(_QWORD *)(v17 + 16) = sub_100008AF4;
    *(_QWORD *)(v17 + 24) = v16;
    v18 = objc_allocWithZone((Class)type metadata accessor for RepairCardViewController(0));
    v19 = RepairCardViewController.init(contextBuilder:reportHandler:)(sub_100008B24, v17, sub_100008374, 0);
  }
  else
  {
    v20 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v20(v8, v11, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    v21 = *(unsigned __int8 *)(v3 + 80);
    v22 = (v21 + 16) & ~v21;
    v23 = swift_allocObject(&unk_100010888, v22 + v4, v21 | 7);
    v20((char *)(v23 + v22), v6, v2);
    v24 = swift_allocObject(&unk_1000108B0, 32, 7);
    *(_QWORD *)(v24 + 16) = sub_100008B94;
    *(_QWORD *)(v24 + 24) = v23;
    v25 = objc_allocWithZone((Class)type metadata accessor for SetupCardViewController(0));
    v19 = SetupCardViewController.init(contextBuilder:reportHandler:)(sub_100008BFC, v24, sub_1000082C8, 0);
  }
  v26 = v19;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return (id)v26;
}

void sub_100007388()
{
  qword_100016CE0 = 0x6F6973726556736FLL;
  *(_QWORD *)algn_100016CE8 = 0xE90000000000006ELL;
}

void sub_1000073B0()
{
  qword_100016CF0 = 1769173874;
  *(_QWORD *)algn_100016CF8 = 0xE400000000000000;
}

void sub_1000073CC()
{
  qword_100016D00 = 0x556E6F6973736573;
  *(_QWORD *)algn_100016D08 = 0xEB00000000444955;
}

uint64_t sub_1000073F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)CBDevice);
  v5 = swift_bridgeObjectRetain(a1);
  v6 = sub_100008798(v5);
  CBDevice.into()();

  v7 = type metadata accessor for PresentationRequest(0);
  swift_storeEnumTagMultiPayload(a2, v7, 0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a2, 0, 1, v7);
}

uint64_t sub_10000773C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  int v26;
  unint64_t v27;
  char v28;
  int v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  os_log_type_t v57;
  uint8_t *v58;
  int v59;
  int v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69[5];
  __int128 v70;
  __int128 v71;

  v4 = type metadata accessor for BLEDevice.NearbyActionPayload(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = 0xD000000000000010;
  v68 = 0x800000010000C2F0;
  AnyHashable.init<A>(_:)(v69, &v67, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_100008910((uint64_t)v69), (v8 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  sub_100008940((uint64_t)v69);
  if (!*((_QWORD *)&v71 + 1))
  {
    sub_100008974((uint64_t)&v70);
    goto LABEL_11;
  }
  if ((swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_11:
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v13 = type metadata accessor for Logger(0);
    sub_100005D0C(v13, (uint64_t)static AISLogger.uiService);
    v14 = swift_bridgeObjectRetain_n(a1, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v15, v16))
    {

      swift_bridgeObjectRelease_n(a1, 2);
      goto LABEL_18;
    }
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v69[0] = v18;
    v66 = a2;
    *(_DWORD *)v17 = 136315138;
    v19 = swift_bridgeObjectRetain(a1);
    v20 = Dictionary.description.getter(v19, &type metadata for AnyHashable);
    v22 = v21;
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)&v70 = sub_100009F50(v20, v22, v69);
    a2 = v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 8);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "No device identifier provided in user info: %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    v23 = v17;
    goto LABEL_15;
  }
  v9 = v67;
  v10 = v68;
  *(_QWORD *)&v70 = 0xD000000000000010;
  *((_QWORD *)&v70 + 1) = 0x800000010000C310;
  AnyHashable.init<A>(_:)(v69, &v70, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v11 = sub_100008910((uint64_t)v69), (v12 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  sub_100008940((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    if (swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6))
    {
      v26 = v67;
      goto LABEL_25;
    }
  }
  else
  {
    sub_100008974((uint64_t)&v70);
  }
  v26 = 0;
LABEL_25:
  if (qword_100016A60 != -1)
    swift_once(&qword_100016A60, sub_100007388);
  v70 = xmmword_100016CE0;
  swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100016CE0 + 1));
  AnyHashable.init<A>(_:)(v69, &v70, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v27 = sub_100008910((uint64_t)v69), (v28 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v27, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  sub_100008940((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    if (swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6))
    {
      v29 = v67;
      goto LABEL_36;
    }
  }
  else
  {
    sub_100008974((uint64_t)&v70);
  }
  v29 = 0;
LABEL_36:
  if (qword_100016A70 != -1)
    swift_once(&qword_100016A70, sub_1000073CC);
  v67 = qword_100016D00;
  v68 = *(_QWORD *)algn_100016D08;
  swift_bridgeObjectRetain(*(_QWORD *)algn_100016D08);
  AnyHashable.init<A>(_:)(v69, &v67, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v30 = sub_100008910((uint64_t)v69), (v31 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v30, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  sub_100008940((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    if (swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for String, 6))
    {
      v32 = v68;
      v63 = v67;
      goto LABEL_47;
    }
  }
  else
  {
    sub_100008974((uint64_t)&v70);
  }
  v63 = 0;
  v32 = 0xE000000000000000;
LABEL_47:
  if (qword_100016A68 != -1)
    swift_once(&qword_100016A68, sub_1000073B0);
  v70 = xmmword_100016CF0;
  swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100016CF0 + 1));
  AnyHashable.init<A>(_:)(v69, &v70, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v33 = sub_100008910((uint64_t)v69), (v34 & 1) != 0))
  {
    sub_1000089B4(*(_QWORD *)(a1 + 56) + 32 * v33, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  sub_100008940((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    if (swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for Int, 6))
    {
      v62 = v67;
      goto LABEL_58;
    }
  }
  else
  {
    sub_100008974((uint64_t)&v70);
  }
  v62 = 0;
LABEL_58:
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v35 = type metadata accessor for Logger(0);
  v36 = sub_100005D0C(v35, (uint64_t)static AISLogger.uiService);
  swift_bridgeObjectRetain_n(v10, 2);
  v37 = swift_bridgeObjectRetain(v32);
  v65 = v36;
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.debug.getter();
  v40 = v39;
  v41 = os_log_type_enabled(v38, v39);
  v64 = v9;
  if (v41)
  {
    v42 = swift_slowAlloc(38, -1);
    v59 = v29;
    v43 = v42;
    v61 = swift_slowAlloc(64, -1);
    v69[0] = v61;
    *(_DWORD *)v43 = 136316162;
    swift_bridgeObjectRetain(v10);
    *(_QWORD *)&v70 = sub_100009F50(v9, v10, v69);
    v60 = v40;
    v66 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 8);
    swift_bridgeObjectRelease_n(v10, 3);
    *(_WORD *)(v43 + 12) = 256;
    LOBYTE(v70) = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 1);
    *(_WORD *)(v43 + 15) = 256;
    LOBYTE(v70) = v59;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 1);
    *(_WORD *)(v43 + 18) = 2080;
    swift_bridgeObjectRetain(v32);
    *(_QWORD *)&v70 = sub_100009F50(v63, v32, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 8);
    swift_bridgeObjectRelease_n(v32, 3);
    *(_WORD *)(v43 + 28) = 2048;
    *(_QWORD *)&v70 = v62;
    a2 = v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, (char *)&v70 + 8);
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v60, "Discovered BLE peer device with info deviceId: %s nearbyActionType: %hhu osVersion: %hhu sessionId: %s rssi: %ld", (uint8_t *)v43, 0x26u);
    v44 = v61;
    swift_arrayDestroy(v61, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v43, -1, -1);

    if (v26 != 43)
      goto LABEL_62;
LABEL_67:
    v53 = Logger.logObject.getter(v45);
    v54 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Repairing device requesting authenticate accounts with V2", v55, 2u);
      swift_slowDealloc(v55, -1, -1);
    }

    BLEDevice.NearbyActionPayload.init(type:flags:deviceClass:problemFlags:)(43, 0, 0, 0);
    BLEDevice.init(identifier:proximityServicePSM:nearbyActionPayload:)(v64, v10, 0, v6);
    v49 = type metadata accessor for PresentationRequest(0);
    v50 = a2;
    v51 = v49;
    v52 = 1;
    goto LABEL_70;
  }

  swift_bridgeObjectRelease_n(v32, 2);
  v45 = swift_bridgeObjectRelease_n(v10, 2);
  if (v26 == 43)
    goto LABEL_67;
LABEL_62:
  if (v26 != 32)
  {
    v56 = swift_bridgeObjectRelease(v10);
    v15 = Logger.logObject.getter(v56);
    v57 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v15, v57))
      goto LABEL_16;
    v58 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v58 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v57, "Cannot service unknown nearby action type", v58, 2u);
    v23 = v58;
LABEL_15:
    swift_slowDealloc(v23, -1, -1);
LABEL_16:

LABEL_18:
    v24 = type metadata accessor for PresentationRequest(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a2, 1, 1, v24);
  }
  v46 = Logger.logObject.getter(v45);
  v47 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Setting up device requesting authenticate accounts with V1", v48, 2u);
    swift_slowDealloc(v48, -1, -1);
  }

  BLEDevice.NearbyActionPayload.init(type:flags:deviceClass:problemFlags:)(32, 0, 0, 0);
  BLEDevice.init(identifier:proximityServicePSM:nearbyActionPayload:)(v64, v10, 0, v6);
  v49 = type metadata accessor for PresentationRequest(0);
  v50 = a2;
  v51 = v49;
  v52 = 0;
LABEL_70:
  swift_storeEnumTagMultiPayload(v50, v51, v52);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(a2, 0, 1, v49);
}

uint64_t sub_100008194(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  type metadata accessor for SetupContext.Builder(0);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v8 = __chkstk_darwin(v7);
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t))(v9 + 16))(v6, a1);
  SetupContext.Builder.requireService(_:)(AIDAServiceTypeCloud);
  SetupContext.Builder.desireService(_:)(AIDAServiceTypeStore);
  SetupContext.Builder.desireService(_:)(AIDAServiceTypeGameCenter);
  return SetupContext.Builder._proximitySetupClient(for:)(a2);
}

void sub_1000082C8(uint64_t a1)
{
  sub_100008398(a1, (uint64_t (*)(_QWORD))&type metadata accessor for SetupReport, &qword_100016DC0, "Successfully setup apple ID with report: %s", "Failed to setup apple ID with error: %@");
}

uint64_t sub_1000082EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = type metadata accessor for RepairContext.Builder(0);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return RepairContext.Builder._proximityRepairClient(for:)(a2);
}

void sub_100008374(uint64_t a1)
{
  sub_100008398(a1, (uint64_t (*)(_QWORD))&type metadata accessor for RepairReport, &qword_100016DC8, "Successfully repaired apple ID with report: %s", "Failed to repair apple ID with error: %@");
}

void sub_100008398(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, const char *a4, const char *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint8_t *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v41 = a4;
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v40 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v40 - v16;
  v18 = sub_100005BFC(a3);
  __chkstk_darwin(v18);
  v20 = (uint64_t *)((char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100008C50(a1, (uint64_t)v20, a3);
  if (swift_getEnumCaseMultiPayload(v20, v18) == 1)
  {
    v21 = *v20;
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v22 = type metadata accessor for Logger(0);
    sub_100005D0C(v22, (uint64_t)static AISLogger.uiService);
    v23 = swift_errorRetain(v21);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v26 = 138412290;
      swift_errorRetain(v21);
      v28 = _swift_stdlib_bridgeErrorToNSError(v21);
      v43 = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
      *v27 = v28;
      swift_errorRelease(v21);
      swift_errorRelease(v21);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, a5, v26, 0xCu);
      v29 = sub_100005BFC(&qword_100016B78);
      swift_arrayDestroy(v27, 1, v29);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {
      swift_errorRelease(v21);
      swift_errorRelease(v21);
    }

    exit(1);
  }
  (*(void (**)(char *, uint64_t *, uint64_t))(v9 + 32))(v17, v20, v8);
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v30 = type metadata accessor for Logger(0);
  sub_100005D0C(v30, (uint64_t)static AISLogger.uiService);
  v31 = *(uint64_t (**)(char *, char *, uint64_t))(v9 + 16);
  v32 = v31(v15, v17, v8);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12, -1);
    v36 = swift_slowAlloc(32, -1);
    v43 = v36;
    *(_DWORD *)v35 = 136315138;
    v40 = v35 + 4;
    v31(v12, v15, v8);
    v37 = String.init<A>(describing:)(v12, v8);
    v39 = v38;
    v42 = sub_100009F50(v37, v38, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43);
    swift_bridgeObjectRelease(v39);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, v41, v35, 0xCu);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  }

  exit(1);
}

id sub_100008798(uint64_t a1)
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

void *sub_10000887C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

unint64_t sub_100008910(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000089F0(a1, v4);
}

uint64_t sub_100008940(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100008974(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005BFC(&qword_100016AF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000089B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000089F0(uint64_t a1, uint64_t a2)
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
      sub_100008AB4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008940((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100008AB4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008AF4(uint64_t a1)
{
  return sub_100008BA0(a1, sub_1000082EC);
}

uint64_t sub_100008B00()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008B24(uint64_t a1)
{
  return sub_100008C08(a1, (uint64_t (*)(_QWORD))&type metadata accessor for RepairContext.Builder);
}

uint64_t sub_100008B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for BLEDevice(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100008B94(uint64_t a1)
{
  return sub_100008BA0(a1, sub_100008194);
}

uint64_t sub_100008BA0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BLEDevice(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_100008BFC(uint64_t a1)
{
  return sub_100008C08(a1, (uint64_t (*)(_QWORD))&type metadata accessor for SetupContext.Builder);
}

uint64_t sub_100008C08(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v5;

  (*(void (**)(void))(v2 + 16))();
  v5 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
}

uint64_t sub_100008C50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005BFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100005D24(v0, qword_100016DD0);
  v1 = sub_100005D0C(v0, (uint64_t)qword_100016DD0);
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v2 = sub_100005D0C(v0, (uint64_t)static AISLogger.uiService);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100008E24(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_100016A78;
  v13 = a3;
  v7 = a1;
  if (v6 != -1)
    swift_once(&qword_100016A78, sub_100008C98);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100005D0C(v8, (uint64_t)qword_100016DD0);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a4, v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

}

id sub_100008F64()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DefaultSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DefaultSceneDelegate()
{
  return objc_opt_self(_TtC21AppleIDSetupUIService20DefaultSceneDelegate);
}

void sub_100008FC4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  char *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v1;
  v4 = sub_100005BFC(&qword_100016E18);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v40 - v9;
  if (qword_100016A78 != -1)
    swift_once(&qword_100016A78, sub_100008C98);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100005D0C(v11, (uint64_t)qword_100016DD0);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "DefaultSceneDelegate: sceneWillConnectTo", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = objc_opt_self(UIWindowScene);
  v17 = swift_dynamicCastObjCClass(a1, v16);
  if (v17)
  {
    v18 = (void *)v17;
    v45 = v10;
    v19 = a1;
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v44 = v4;
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v42 = swift_slowAlloc(32, -1);
      v47 = v42;
      v43 = v19;
      *(_DWORD *)v22 = 136315138;
      v41 = v22;
      v23 = objc_msgSend(v18, "description", v22 + 4);
      v24 = v8;
      v25 = v5;
      v26 = v2;
      v27 = v23;
      v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23, v28);
      v31 = v30;

      v2 = v26;
      v5 = v25;
      v8 = v24;
      v32 = v29;
      v4 = v44;
      v46 = sub_100009F50(v32, v31, &v47);
      v19 = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);

      swift_bridgeObjectRelease(v31);
      v33 = v41;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "DefaultSceneDelegate: Received windowScene: %s. Hosting debugging UI for AirDropUI Launch Angel.", v41, 0xCu);
      v34 = v42;
      swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);

    }
    else
    {

    }
    v35 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v18);
    v36 = v45;
    ProgressView<>.init<>()();
    v37 = objc_allocWithZone((Class)sub_100005BFC((uint64_t *)&unk_100016E20));
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v36, v4);
    v38 = (void *)UIHostingController.init(rootView:)(v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v36, v4);
    objc_msgSend(v35, "setRootViewController:", v38);
    objc_msgSend(v35, "makeKeyAndVisible");
    v39 = *(void **)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC21AppleIDSetupUIService20DefaultSceneDelegate_window) = v35;

  }
}

id sub_1000093A0()
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
  uint64_t v12;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
  v12 = v11;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v10, v12);
  swift_bridgeObjectRelease(v12);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC21AppleIDSetupUIService11AppDelegate);
}

uint64_t sub_10000947C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000094BC(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_1000098E8(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v2 + qword_100017198) - 8) + 8))(a1);
  return v5;
}

uint64_t sub_10000951C()
{
  return 1;
}

uint64_t sub_100009524()
{
  return 1;
}

uint64_t sub_10000952C()
{
  return 1;
}

void *sub_100009534(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_100009574(a1, a2);
}

void *sub_100009574(uint64_t a1, uint64_t a2)
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

  v5 = *(_QWORD *)((swift_isaMask & *v2) + qword_100017198);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v13 - v7;
  (*(void (**)(char *))(v6 + 16))((char *)&v13 - v7);
  v9 = (void *)UIHostingController.init(coder:rootView:)(a1, v8);
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11 = v9;
  v10(a2, v5);
  if (v9)

  return v9;
}

id sub_100009634(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for SecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_100017198), *(_QWORD *)((swift_isaMask & *v4) + qword_100017198 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1000096A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_100009634(v3, v4, v5, v6);
}

id sub_1000096CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for SecureHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_100017198), *(_QWORD *)((swift_isaMask & *v4) + qword_100017198 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t type metadata accessor for SecureHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100009964(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureHostingController);
}

id sub_100009898()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC21AppleIDSetupUIService12SecureWindow);
}

uint64_t sub_1000098E8(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  __chkstk_darwin(a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return UIHostingController.init(rootView:)(v2);
}

uint64_t sub_100009964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t AISLogger.uiService.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v0 = type metadata accessor for Logger(0);
  return sub_100005D0C(v0, (uint64_t)static AISLogger.uiService);
}

uint64_t sub_1000099D8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for Logger(0);
  sub_100005D24(v0, static AISLogger.uiService);
  sub_100005D0C(v0, (uint64_t)static AISLogger.uiService);
  v1 = static AISLogger.subsystem.getter();
  return Logger.init(subsystem:category:)(v1);
}

uint64_t static AISLogger.uiService.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005D0C(v2, (uint64_t)static AISLogger.uiService);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_100009BEC(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_100016A80;
  v13 = a3;
  v7 = a1;
  if (v6 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100005D0C(v8, (uint64_t)static AISLogger.uiService);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a4, v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

}

id sub_100009D54()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100009DC0()
{
  return type metadata accessor for RemoteAlertSceneDelegate(0);
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_100017060;
  if (!qword_100017060)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RemoteAlertSceneDelegate);
  return result;
}

uint64_t sub_100009E04(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = "\b";
  result = type metadata accessor for PresentationRequest(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100009E7C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100009E8C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100009EC0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100009EE0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_100009F50(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100009F50(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_10000A020(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_1000089B4((uint64_t)v13, *a3);
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
      sub_1000089B4((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B284(v13);
  return v8;
}

uint64_t sub_10000A020(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000A1D8(a5, a6);
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

uint64_t sub_10000A1D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000A26C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000A444(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000A444(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000A26C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000A3E0(v4, 0);
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

_QWORD *sub_10000A3E0(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005BFC((uint64_t *)&unk_100017080);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000A444(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005BFC((uint64_t *)&unk_100017080);
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

_BYTE **sub_10000A590(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_10000A5A0(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

void sub_10000A650(void *a1)
{
  uint8_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ObjectType;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  int v56;
  _BOOL4 v57;
  uint64_t v58;
  _QWORD *v59;
  id v60;
  NSObject *v61;
  id v62;
  _QWORD *v63;
  uint64_t v64;
  id v65;
  objc_class *v66;
  char *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  uint8_t *v74;
  void *v75;
  id v76;
  uint64_t v77;
  _QWORD v78[3];
  _QWORD *v79;
  _BYTE *v80;
  int v81;
  uint8_t *v82;
  NSObject *v83;
  uint64_t v84;
  _BYTE v85[16];
  objc_super v86;
  uint64_t v87;
  uint64_t v88;

  v3 = sub_100005BFC((uint64_t *)&unk_100017070);
  __chkstk_darwin(v3);
  v5 = (char *)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PresentationRequest(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)v78 - v11;
  v13 = objc_opt_self(SBSUIRemoteAlertScene);
  v14 = swift_dynamicCastObjCClass(a1, v13);
  if (!v14)
  {
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v32 = type metadata accessor for Logger(0);
    sub_100005D0C(v32, (uint64_t)static AISLogger.uiService);
    v83 = a1;
    v33 = Logger.logObject.getter(v83);
    v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(12, -1);
      v36 = swift_slowAlloc(32, -1);
      v84 = v36;
      *(_DWORD *)v35 = 136315138;
      ObjectType = swift_getObjectType(v83, v37);
      v39 = _typeName(_:qualified:)(ObjectType, 0);
      v41 = v40;
      v87 = sub_100009F50(v39, v40, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88);

      swift_bridgeObjectRelease(v41);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Cannot configure scene, expected a remote alert scene but got a scene of type: %s", v35, 0xCu);
      swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v35, -1, -1);

      return;
    }

LABEL_20:
    return;
  }
  v15 = (void *)v14;
  v16 = a1;
  v17 = objc_msgSend(v15, "configurationContext");
  if (!v17)
  {
LABEL_15:
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v42 = type metadata accessor for Logger(0);
    sub_100005D0C(v42, (uint64_t)static AISLogger.uiService);
    v83 = v16;
    v43 = Logger.logObject.getter(v83);
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v45 = 138412290;
      v84 = (uint64_t)v15;
      v47 = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85);
      *v46 = v15;

      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not find configuration context on remote alert scene: %@", v45, 0xCu);
      v48 = sub_100005BFC(&qword_100016B78);
      swift_arrayDestroy(v46, 1, v48);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      return;
    }

    goto LABEL_20;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "userInfo");
  if (!v19)
  {

    goto LABEL_15;
  }
  v20 = v19;
  v82 = v1;
  v83 = v16;
  v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  sub_100006F4C(v21, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10000B200((uint64_t)v5);
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v22 = type metadata accessor for Logger(0);
    sub_100005D0C(v22, (uint64_t)static AISLogger.uiService);
    v23 = swift_bridgeObjectRetain(v21);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v84 = v27;
      *(_DWORD *)v26 = 136315138;
      v82 = v26 + 4;
      v28 = swift_bridgeObjectRetain(v21);
      v29 = Dictionary.description.getter(v28, &type metadata for AnyHashable);
      v31 = v30;
      swift_bridgeObjectRelease(v21);
      v87 = sub_100009F50(v29, v31, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88);
      swift_bridgeObjectRelease_n(v21, 2);
      swift_bridgeObjectRelease(v31);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Unable to build presentation request with user info: %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v21, 2);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v21);
    sub_100006050((uint64_t)v5, (uint64_t)v12);
    if (qword_100016A80 != -1)
      swift_once(&qword_100016A80, sub_1000099D8);
    v49 = type metadata accessor for Logger(0);
    sub_100005D0C(v49, (uint64_t)static AISLogger.uiService);
    v50 = v83;
    v51 = v18;
    v52 = v50;
    v53 = v51;
    v54 = Logger.logObject.getter(v53);
    v55 = static os_log_type_t.default.getter();
    v56 = v55;
    v57 = os_log_type_enabled(v54, v55);
    v83 = v52;
    if (v57)
    {
      v58 = swift_slowAlloc(22, -1);
      v59 = (_QWORD *)swift_slowAlloc(16, -1);
      v79 = v59;
      *(_DWORD *)v58 = 138412546;
      v81 = v56;
      v60 = v53;
      v78[1] = v58 + 12;
      v78[2] = v58 + 4;
      v84 = (uint64_t)v15;
      v80 = v85;
      v61 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85);
      *v59 = v15;

      *(_WORD *)(v58 + 12) = 2112;
      v84 = (uint64_t)v53;
      v62 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v80);
      v63 = v79;
      v79[1] = v18;

      v53 = v60;
      _os_log_impl((void *)&_mh_execute_header, v54, (os_log_type_t)v81, "Configuring remote alert scene: %@ with context: %@", (uint8_t *)v58, 0x16u);
      v64 = sub_100005BFC(&qword_100016B78);
      swift_arrayDestroy(v63, 2, v64);
      swift_slowDealloc(v63, -1, -1);
      swift_slowDealloc(v58, -1, -1);
    }
    else
    {

      v54 = v52;
    }

    v65 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithWindowScene:", v15);
    v66 = (objc_class *)type metadata accessor for RemoteAlertRootViewController();
    v67 = (char *)objc_allocWithZone(v66);
    v68 = swift_unknownObjectWeakInit(&v67[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_scene], 0);
    v69 = (uint64_t *)&v67[OBJC_IVAR____TtC21AppleIDSetupUIService29RemoteAlertRootViewController_dismissHandler];
    *v69 = 0;
    v69[1] = 0;
    swift_unknownObjectWeakAssign(v68, v15);
    v70 = *v69;
    v71 = v69[1];
    *v69 = 0;
    v69[1] = 0;
    v72 = v83;
    sub_100005F24(v70, v71);
    v86.receiver = v67;
    v86.super_class = v66;
    v73 = objc_msgSendSuper2(&v86, "initWithNibName:bundle:", 0, 0);

    objc_msgSend(v65, "setRootViewController:", v73);
    objc_msgSend(v65, "makeKeyAndVisible");
    v74 = v82;
    v75 = *(void **)&v82[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window];
    *(_QWORD *)&v82[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window] = v65;
    v76 = v65;

    sub_100005FA4((uint64_t)v12, (uint64_t)v10);
    v77 = (uint64_t)&v74[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest];
    swift_beginAccess(&v74[OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest], &v84, 33, 0);
    sub_10000B240((uint64_t)v10, v77);
    swift_endAccess(&v84);

    sub_100005C4C((uint64_t)v12);
  }
}

void sub_10000AF90()
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
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  int EnumCaseMultiPayload;
  id v23;
  _BYTE v24[24];

  v1 = v0;
  v2 = type metadata accessor for PresentationRequest(0);
  v3 = __chkstk_darwin(v2);
  v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = __chkstk_darwin(v3);
  v8 = &v24[-v7 - 8];
  __chkstk_darwin(v6);
  v10 = &v24[-v9 - 8];
  if (qword_100016A80 != -1)
    swift_once(&qword_100016A80, sub_1000099D8);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100005D0C(v11, (uint64_t)static AISLogger.uiService);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "RemoteAlertSceneDelegate: sceneDidBecomeActive", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = *(void **)(v1 + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_window);
  if (v16)
  {
    v17 = objc_msgSend(v16, "rootViewController");
    if (v17)
    {
      v23 = v17;
      v18 = type metadata accessor for RemoteAlertRootViewController();
      v19 = (void *)swift_dynamicCastClass(v23, v18);
      if (!v19)
        goto LABEL_11;
      v20 = objc_msgSend(v19, "presentedViewController");

      if (v20
        || (v21 = v1 + OBJC_IVAR____TtC21AppleIDSetupUIService24RemoteAlertSceneDelegate_presentationRequest,
            swift_beginAccess(v21, v24, 0, 0),
            sub_100005FA4(v21, (uint64_t)v10),
            sub_100005FA4((uint64_t)v10, (uint64_t)v8),
            EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v8, v2),
            sub_100005C4C((uint64_t)v8),
            sub_100005C4C((uint64_t)v10),
            EnumCaseMultiPayload == 2))
      {
LABEL_11:

      }
      else
      {
        sub_100005FA4(v21, (uint64_t)v5);
        sub_100006308((uint64_t)v5);

        sub_100005C4C((uint64_t)v5);
      }
    }
  }
}

uint64_t sub_10000B200(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005BFC((uint64_t *)&unk_100017070);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PresentationRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B284(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000B2A8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC21AppleIDSetupUIServiceP33_FEAF16EA34BF673F54888E13CC326C8C19ResourceBundleClass);
}
