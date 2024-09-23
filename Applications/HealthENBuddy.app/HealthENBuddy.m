id sub_100004EF0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ViewController()
{
  return objc_opt_self(_TtC13HealthENBuddy14ViewController);
}

id sub_100005068()
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
  return objc_opt_self(_TtC13HealthENBuddy11AppDelegate);
}

id sub_1000051CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC13HealthENBuddy13SceneDelegate);
}

void sub_1000052F4(int a1)
{
  char *v1;
  char *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t (*v22)(char *);
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  char *v27;
  uint64_t (*v28)(char *);
  char *v29;
  char *v30;
  uint64_t v31;
  uint8_t *v32;
  uint8_t *v33;
  void (*v34)(char *, uint64_t);
  objc_class *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  _QWORD **v46;
  _QWORD *v47;
  uint64_t v48;
  void (*v49)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t);
  _QWORD *v50;
  char *v51;
  void *v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  _QWORD aBlock[5];
  uint64_t v84;
  char v85[24];
  objc_super v86;

  v2 = v1;
  LODWORD(v82) = a1;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v80 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v79 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v77 = *(_QWORD *)(v5 - 8);
  v78 = v5;
  __chkstk_darwin(v5);
  v76 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for DispatchTime(0);
  v73 = *(_QWORD *)(v75 - 8);
  v7 = __chkstk_darwin(v75);
  v72 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v74 = (char *)&v71 - v9;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v71 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v71 - v19;
  v21 = Logger.buddy.unsafeMutableAddressor(v18);
  v22 = *(uint64_t (**)(char *))(v11 + 16);
  v81 = v21;
  v23 = v22(v20);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    v71 = v10;
    v27 = v2;
    v28 = v22;
    v29 = v14;
    v30 = v17;
    v31 = v3;
    v32 = v26;
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "HealthENBuddyContainer viewDidAppear", v26, 2u);
    v33 = v32;
    v3 = v31;
    v17 = v30;
    v14 = v29;
    v22 = v28;
    v2 = v27;
    v10 = v71;
    swift_slowDealloc(v33, -1, -1);
  }

  v34 = *(void (**)(char *, uint64_t))(v11 + 8);
  v34(v20, v10);
  v35 = (objc_class *)type metadata accessor for HealthENBuddyContainer();
  v86.receiver = v2;
  v86.super_class = v35;
  objc_msgSendSuper2(&v86, "viewDidAppear:", v82 & 1);
  v2[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
  v36 = objc_msgSend(v2, "view");
  if (!v36)
  {
    __break(1u);
    goto LABEL_16;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, "window");

  if (!v38)
    goto LABEL_7;
  v39 = objc_msgSend(v38, "_rootSheetPresentationController");

  if (!v39)
  {
LABEL_16:
    __break(1u);
    return;
  }
  objc_msgSend(v39, "_setShouldScaleDownBehindDescendantSheets:", 0);

LABEL_7:
  v40 = *(void **)&v2[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region];
  if (v40)
  {
    ((void (*)(char *, uint64_t, uint64_t))v22)(v17, v81, v10);
    v41 = v40;
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Fetch all entities", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }

    v45 = ((uint64_t (*)(char *, uint64_t))v34)(v17, v10);
    v46 = (_QWORD **)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor(v45);
    swift_beginAccess(v46, v85, 0, 0);
    v47 = *v46;
    v48 = swift_allocObject(&unk_10000C5E8, 32, 7);
    *(_QWORD *)(v48 + 16) = v2;
    *(_QWORD *)(v48 + 24) = v41;
    v49 = *(void (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))((swift_isaMask & *v47) + 0x180);
    v82 = v41;
    v50 = v47;
    v51 = v2;
    v49(sub_100008950, v48);

    swift_release(v48);
    sub_100008958(0, &qword_1000120E8, OS_dispatch_queue_ptr);
    v52 = (void *)static OS_dispatch_queue.main.getter();
    v53 = v72;
    static DispatchTime.now()();
    v54 = v74;
    + infix(_:_:)(v53, 5.0);
    v55 = *(void (**)(char *, uint64_t))(v73 + 8);
    v56 = v75;
    v55(v53, v75);
    v57 = swift_allocObject(&unk_10000C610, 24, 7);
    *(_QWORD *)(v57 + 16) = v51;
    aBlock[4] = sub_1000089B4;
    v84 = v57;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006B90;
    aBlock[3] = &unk_10000C628;
    v58 = _Block_copy(aBlock);
    v59 = v84;
    v60 = v51;
    v61 = swift_release(v59);
    v62 = v76;
    static DispatchQoS.unspecified.getter(v61);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v63 = sub_1000089D4();
    v64 = sub_100008748(&qword_1000120F8);
    v65 = sub_100008A1C();
    v66 = v79;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v64, v65, v3, v63);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v54, v62, v66, v58);
    _Block_release(v58);

    (*(void (**)(char *, uint64_t))(v80 + 8))(v66, v3);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v62, v78);
    v55(v54, v56);
  }
  else
  {
    v67 = ((uint64_t (*)(char *, uint64_t, uint64_t))v22)(v14, v81, v10);
    v68 = Logger.logObject.getter(v67);
    v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, (os_log_type_t)v69))
    {
      v70 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v70 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v69, "Cannot create onboarding stack without region.", v70, 2u);
      swift_slowDealloc(v70, -1, -1);
    }

    v34(v14, v10);
  }
}

uint64_t sub_100005944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(char *, uint64_t))
{
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
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id *v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void (*v61)(uint64_t, uint64_t, _QWORD, void (*)(NSObject *, uint64_t), uint64_t);
  void (*v62)(char *, uint64_t);
  id v63;
  uint8_t *v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  void *v68;
  uint64_t aBlock[5];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v66 = a7;
  v68 = a6;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v67 = (char *)&v64 - v14;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v64 - v16;
  v18 = Logger.buddy.unsafeMutableAddressor(v15);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v20 = v19(v17, v18, v8);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Got entities", v23, 2u);
    swift_slowDealloc(v23, -1, -1);
  }

  v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v17, v8);
  if (a5)
  {
    v19(v12, v18, v8);
    swift_errorRetain(a5);
    swift_errorRetain(a5);
    v25 = swift_errorRetain(a5);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = swift_slowAlloc(32, -1);
      aBlock[0] = v29;
      v66 = v24;
      *(_DWORD *)v28 = 136315138;
      v71 = a5;
      swift_errorRetain(a5);
      v30 = sub_100008748(&qword_100012108);
      v31 = String.init<A>(describing:)(&v71, v30);
      v33 = v32;
      v71 = sub_100007A94(v31, v32, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v28 + 4, v28 + 12);
      swift_bridgeObjectRelease(v33);
      swift_errorRelease(a5);
      swift_errorRelease(a5);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Could not fetch entities: %s", v28, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);

      v66(v12, v8);
    }
    else
    {
      swift_errorRelease(a5);
      swift_errorRelease(a5);

      v24(v12, v8);
    }
    v46 = swift_allocObject(&unk_10000C6D8, 24, 7);
    v47 = v68;
    *(_QWORD *)(v46 + 16) = v68;
    aBlock[4] = (uint64_t)sub_100008B18;
    v70 = v46;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006B90;
    aBlock[3] = (uint64_t)&unk_10000C6F0;
    v48 = _Block_copy(aBlock);
    v49 = v70;
    v50 = v47;
    swift_release(v49);
    objc_msgSend(v50, "dismissViewControllerAnimated:completion:", 1, v48);
    _Block_release(v48);
    return swift_errorRelease(a5);
  }
  else
  {
    v34 = v67;
    v19(v67, v18, v8);
    v35 = v66;
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(12, -1);
      v65 = swift_slowAlloc(32, -1);
      aBlock[0] = v65;
      v66 = v24;
      *(_DWORD *)v38 = 136315138;
      v64 = v38 + 4;
      v39 = objc_msgSend(v35, "regionCode");
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39, v40);
      v43 = v42;

      v71 = sub_100007A94(v41, v43, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v64, v38 + 12);

      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Fetch agency model for region %s", v38, 0xCu);
      v44 = v65;
      swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v38, -1, -1);

      v45 = ((uint64_t (*)(char *, uint64_t))v66)(v67, v8);
    }
    else
    {

      v45 = ((uint64_t (*)(char *, uint64_t))v24)(v34, v8);
    }
    v52 = (id *)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor(v45);
    swift_beginAccess(v52, aBlock, 0, 0);
    v53 = *v52;
    v54 = objc_msgSend(v35, "regionCode");
    v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54, v55);
    v58 = v57;

    v59 = swift_allocObject(&unk_10000C6B0, 32, 7);
    v60 = v68;
    *(_QWORD *)(v59 + 16) = v35;
    *(_QWORD *)(v59 + 24) = v60;
    v61 = *(void (**)(uint64_t, uint64_t, _QWORD, void (*)(NSObject *, uint64_t), uint64_t))((swift_isaMask & *v53) + 0x178);
    v62 = v35;
    v63 = v60;
    v61(v56, v58, 0, sub_100008AB4, v59);

    swift_bridgeObjectRelease(v58);
    return swift_release(v59);
  }
}

void sub_100005F08(NSObject *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  char *v50;
  _QWORD *v51;
  id *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t (*v55)(os_log_t, _QWORD *, uint64_t, _QWORD, _QWORD, void (*)(uint64_t), uint64_t);
  _QWORD *v56;
  void *v57;
  void (*v58)(uint64_t, uint64_t);
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  os_log_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  _BYTE v73[16];
  uint64_t aBlock[5];
  uint64_t v75;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v65 - v14;
  if (a1)
  {
    v69 = a1;
    v70 = (uint64_t)a3;
    v16 = a1;
    v17 = Logger.buddy.unsafeMutableAddressor(v16);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v17, v8);
    v18 = v16;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v68 = v8;
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v71 = a4;
      v23 = v22;
      aBlock[0] = v22;
      *(_DWORD *)v21 = 136315138;
      v66 = v21 + 4;
      v24 = objc_msgSend(*(id *)((char *)&v18->isa + direct field offset for ENUIPublicHealthAgencyModel.region), "regionCode");
      v67 = v9;
      v25 = v24;
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24, v26);
      v29 = v28;

      v72 = sub_100007A94(v27, v29, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, v73, v66, v21 + 12);

      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Got agency model for region %s", v21, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      v30 = v23;
      a4 = v71;
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v21, -1, -1);

      v31 = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v12, v68);
    }
    else
    {

      v31 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    v49 = *(void **)ViewControllerFactory.shared.unsafeMutableAddressor(v31);
    v50 = v18;
    v51 = v49;
    v52 = (id *)ENManagerAdapter.defaultAdapter.unsafeMutableAddressor();
    swift_beginAccess(v52, aBlock, 0, 0);
    v53 = *v52;
    v54 = swift_allocObject(&unk_10000C778, 24, 7);
    swift_unknownObjectWeakInit(v54 + 16, a4);
    v55 = *(uint64_t (**)(os_log_t, _QWORD *, uint64_t, _QWORD, _QWORD, void (*)(uint64_t), uint64_t))((swift_isaMask & *v51) + 0xB0);
    v56 = v53;
    swift_retain(v54);
    v57 = (void *)v55(v69, v56, 1, 0, 0, sub_100008AE0, v54);

    swift_release_n(v54, 2);
    objc_msgSend(v57, "setModalPresentationStyle:", 2);
    objc_msgSend(a4, "presentViewController:animated:completion:", v57, 1, 0);
    *((_BYTE *)a4 + OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent) = 1;
    swift_beginAccess(v52, &v72, 0, 0);
    v58 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & *(_QWORD *)*v52) + 0x140);
    v59 = *v52;
    v58(v70, 2);

  }
  else
  {
    v71 = a4;
    v32 = Logger.buddy.unsafeMutableAddressor(v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v32, v8);
    v33 = a3;
    swift_errorRetain(a2);
    v34 = v33;
    v35 = swift_errorRetain(a2);
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc(22, -1);
      v39 = swift_slowAlloc(8, -1);
      v69 = v36;
      v40 = (_QWORD *)v39;
      v70 = swift_slowAlloc(32, -1);
      aBlock[0] = v70;
      *(_DWORD *)v38 = 138412546;
      v67 = v9;
      v68 = v8;
      v72 = (uint64_t)v34;
      v41 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, v73, v38 + 4, v38 + 12);
      *v40 = v34;

      *(_WORD *)(v38 + 12) = 2080;
      v72 = a2;
      swift_errorRetain(a2);
      v42 = sub_100008748(&qword_100012110);
      v43 = String.init<A>(describing:)(&v72, v42);
      v45 = v44;
      v72 = sub_100007A94(v43, v44, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, v73, v38 + 14, v38 + 22);
      swift_bridgeObjectRelease(v45);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      v46 = v69;
      _os_log_impl((void *)&_mh_execute_header, v69, v37, "Did not get agency model for %@: %s", (uint8_t *)v38, 0x16u);
      v47 = sub_100008748(&qword_1000120E0);
      swift_arrayDestroy(v40, 1, v47);
      swift_slowDealloc(v40, -1, -1);
      v48 = v70;
      swift_arrayDestroy(v70, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v38, -1, -1);

      (*(void (**)(char *, uint64_t))(v67 + 8))(v15, v68);
    }
    else
    {

      swift_errorRelease(a2);
      swift_errorRelease(a2);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    }
    v60 = swift_allocObject(&unk_10000C728, 24, 7);
    v61 = v71;
    *(_QWORD *)(v60 + 16) = v71;
    aBlock[4] = (uint64_t)sub_100008B18;
    v75 = v60;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006B90;
    aBlock[3] = (uint64_t)&unk_10000C740;
    v62 = _Block_copy(aBlock);
    v63 = v75;
    v64 = v61;
    swift_release(v63);
    objc_msgSend(v64, "dismissViewControllerAnimated:completion:", 1, v62);
    _Block_release(v62);
  }
}

void sub_100006554(uint64_t a1, uint64_t a2)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint64_t Strong;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  _QWORD aBlock[5];
  uint64_t v47;
  char v48[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&aBlock[-1] - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&aBlock[-1] - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&aBlock[-1] - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&aBlock[-1] - v19;
  v21 = a2 + 16;
  switch(a1)
  {
    case 0:
      v22 = Logger.buddy.unsafeMutableAddressor(v18);
      v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v20, v22, v4);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v24, v25))
        goto LABEL_13;
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "User cancelled", v26, 2u);
      goto LABEL_12;
    case 1:
      v36 = Logger.buddy.unsafeMutableAddressor(v18);
      v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v17, v36, v4);
      v24 = Logger.logObject.getter(v37);
      v38 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v24, v38))
      {
        v26 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v38, "User completed", v26, 2u);
        v20 = v17;
        goto LABEL_12;
      }
      v8 = v17;
      break;
    case 2:
      v30 = Logger.buddy.unsafeMutableAddressor(v18);
      v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v30, v4);
      v24 = Logger.logObject.getter(v31);
      v32 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v24, v32))
      {
        v26 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v32, "User opted out", v26, 2u);
        v20 = v14;
        goto LABEL_12;
      }
      v8 = v14;
      break;
    case 3:
      v33 = Logger.buddy.unsafeMutableAddressor(v18);
      v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v33, v4);
      v24 = Logger.logObject.getter(v34);
      v35 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v24, v35))
      {
        v26 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, v35, "Region unavailable", v26, 2u);
        v20 = v11;
LABEL_12:
        swift_slowDealloc(v26, -1, -1);
LABEL_13:
        v8 = v20;
      }
      else
      {
        v8 = v11;
      }
      break;
    case 4:
      v27 = Logger.buddy.unsafeMutableAddressor(v18);
      v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v27, v4);
      v24 = Logger.logObject.getter(v28);
      v29 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v24, v29))
        break;
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v29, "System Error", v26, 2u);
      v20 = v8;
      goto LABEL_12;
    default:
      aBlock[0] = a1;
      _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for FlowResult, aBlock, &type metadata for FlowResult, &type metadata for Int);
      __break(1u);
      return;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess(v21, v48, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v21);
  if (Strong)
  {
    v40 = (void *)Strong;
    v41 = swift_allocObject(&unk_10000C7A0, 24, 7);
    *(_QWORD *)(v41 + 16) = v40;
    aBlock[4] = sub_100008B18;
    v47 = v41;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006B90;
    aBlock[3] = &unk_10000C7B8;
    v42 = _Block_copy(aBlock);
    v43 = v47;
    v44 = v40;
    swift_release(v43);
    objc_msgSend(v44, "dismissViewControllerAnimated:completion:", 1, v42);
    _Block_release(v42);

  }
}

void sub_1000069E8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD aBlock[5];
  uint64_t v17;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*((_BYTE *)a1 + OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent) & 1) == 0)
  {
    v7 = Logger.buddy.unsafeMutableAddressor(v4);
    v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Did not hear back from EN within 5 seconds, so dismissing.", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v12 = swift_allocObject(&unk_10000C660, 24, 7);
    *(_QWORD *)(v12 + 16) = a1;
    aBlock[4] = sub_100008AAC;
    v17 = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006B90;
    aBlock[3] = &unk_10000C678;
    v13 = _Block_copy(aBlock);
    v14 = v17;
    v15 = a1;
    swift_release(v14);
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 0, v13);
    _Block_release(v13);
  }
}

uint64_t sub_100006B90(uint64_t a1)
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

uint64_t sub_100006BFC(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t result;
  id v5;
  id v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = objc_msgSend(a1, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000882C((uint64_t)v7, (uint64_t)v8);
  if (!v9)
    return sub_100008874((uint64_t)v8);
  v3 = sub_100008748(&qword_1000120D0);
  result = swift_dynamicCast(&v6, v8, (char *)&type metadata for Any + 8, v3, 6);
  if ((result & 1) != 0)
  {
    v5 = v6;
    objc_msgSend(v6, "dismiss");
    objc_msgSend(v5, "invalidate");
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

void sub_100006CD0(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  uint64_t v20;
  void (*v21)(_QWORD);
  id v22;
  NSObject *v23;
  int v24;
  _BOOL4 v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void (*v33)(_BYTE *, uint64_t);
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  _BYTE *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint8_t *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char v63;
  _BYTE *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint8_t *v69;
  uint8_t *v70;
  _BYTE *v71;
  uint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint8_t *v78;
  uint8_t *v79;
  uint64_t v80;
  unint64_t v81;
  NSString v82;
  NSString v83;
  uint64_t v84;
  id v85;
  void *v86;
  _BYTE *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  uint8_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t (*v96)();
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  _BYTE v103[4];
  int v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(_QWORD);
  _BYTE *v108;
  uint64_t v109;
  _BYTE *v110;
  _BYTE *v111;
  id v112;
  uint64_t v113;
  uint64_t (*v114)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v115;
  char *v116;
  id v117;
  unint64_t v118;
  uint64_t v119;
  _QWORD v120[4];
  __int128 v121;
  __int128 v122;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v115 = &v103[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __chkstk_darwin(v8);
  v11 = __chkstk_darwin(v10);
  v12 = __chkstk_darwin(v11);
  v14 = &v103[-v13];
  __chkstk_darwin(v12);
  v18 = &v103[-v17];
  if (a1)
  {
    v110 = v16;
    v111 = v15;
    v19 = a1;
    v20 = Logger.buddy.unsafeMutableAddressor(v19);
    v21 = *(void (**)(_QWORD))(v7 + 16);
    v113 = v20;
    v114 = (uint64_t (*)(_BYTE *, uint64_t, uint64_t))v21;
    v21(v18);
    v22 = v19;
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.info.getter();
    v25 = os_log_type_enabled(v23, (os_log_type_t)v24);
    v108 = v14;
    if (v25)
    {
      v104 = v24;
      v109 = v6;
      v106 = a3;
      v107 = a2;
      v26 = swift_slowAlloc(22, -1);
      v27 = (_QWORD *)swift_slowAlloc(8, -1);
      v105 = swift_slowAlloc(32, -1);
      v119 = v105;
      *(_DWORD *)v26 = 138412546;
      *(_QWORD *)&v121 = v22;
      v112 = v22;
      v28 = v22;
      v29 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, (char *)&v121 + 8, v26 + 4, v26 + 12);
      *v27 = a1;

      *(_WORD *)(v26 + 12) = 2080;
      v30 = objc_msgSend(v28, "userInfo");
      if (v30)
      {
        v31 = v30;
        v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v30, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      }
      else
      {
        v32 = 0;
      }
      v34 = v104;
      *(_QWORD *)&v121 = v32;
      v35 = sub_100008748(&qword_1000120D8);
      v36 = String.init<A>(describing:)(&v121, v35);
      v38 = v37;
      *(_QWORD *)&v121 = sub_100007A94(v36, v37, &v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v121, (char *)&v121 + 8, v26 + 14, v26 + 22);

      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v23, v34, "Configure with context %@ userinfo %s", (uint8_t *)v26, 0x16u);
      v39 = sub_100008748(&qword_1000120E0);
      swift_arrayDestroy(v29, 1, v39);
      swift_slowDealloc(v29, -1, -1);
      v40 = v105;
      swift_arrayDestroy(v105, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      v33 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
      v6 = v109;
      v33(v18, v109);
      a2 = v107;
      a3 = v106;
      v22 = v112;
    }
    else
    {

      v33 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
      v33(v18, v6);
    }
    v41 = v116;
    v42 = objc_msgSend(v116, "_remoteViewControllerProxy");
    if (v42)
    {
      v43 = v42;
      _bridgeAnyObjectToAny(_:)(&v121);
      swift_unknownObjectRelease(v43);
    }
    else
    {
      v121 = 0u;
      v122 = 0u;
    }
    sub_10000882C((uint64_t)&v121, (uint64_t)&v119);
    if (v120[2])
    {
      v44 = sub_100008748(&qword_1000120D0);
      if ((swift_dynamicCast(&v117, &v119, (char *)&type metadata for Any + 8, v44, 6) & 1) != 0)
      {
        v45 = v22;
        v46 = v117;
        objc_msgSend(v117, "setDesiredHardwareButtonEvents:", 16);
        objc_msgSend(v46, "setAllowsMenuButtonDismissal:", 0);
        objc_msgSend(v46, "setAllowsAlertItems:", 0);
        v112 = v45;
        v47 = objc_msgSend(v45, "userInfo");
        if (!v47)
        {
          v64 = v110;
          v65 = v114(v110, v113, v6);
          v66 = Logger.logObject.getter(v65);
          v67 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v66, v67))
          {
            v68 = v6;
            v69 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v69 = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, v67, "Did not get user info, but we need it for the region.", v69, 2u);
            v70 = v69;
            v6 = v68;
            v64 = v110;
            swift_slowDealloc(v70, -1, -1);
          }

          v71 = v64;
          v72 = v6;
LABEL_52:
          v80 = ((uint64_t (*)(_BYTE *, uint64_t))v33)(v71, v72);
          if (!a2)
          {
LABEL_54:
            swift_unknownObjectRelease(v46);
            v22 = v112;
LABEL_55:

            return;
          }
LABEL_53:
          a2(v80);
          goto LABEL_54;
        }
        v48 = v47;
        v49 = a3;
        v50 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v47, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

        v117 = (id)0xD000000000000011;
        v118 = 0x8000000100009710;
        AnyHashable.init<A>(_:)(&v119, &v117, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(v50 + 16) && (v51 = sub_1000080D4((uint64_t)&v119), (v52 & 1) != 0))
        {
          sub_1000087EC(*(_QWORD *)(v50 + 56) + 32 * v51, (uint64_t)&v121);
        }
        else
        {
          v121 = 0u;
          v122 = 0u;
        }
        sub_1000088B4((uint64_t)&v119);
        if (*((_QWORD *)&v122 + 1))
        {
          if ((swift_dynamicCast(&v117, &v121, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
          {
            v109 = v6;
            v61 = v118;
            *(_QWORD *)&v121 = 0xD000000000000015;
            *((_QWORD *)&v121 + 1) = 0x8000000100009730;
            AnyHashable.init<A>(_:)(&v119, &v121, &type metadata for String, &protocol witness table for String);
            if (*(_QWORD *)(v50 + 16) && (v62 = sub_1000080D4((uint64_t)&v119), (v63 & 1) != 0))
            {
              sub_1000087EC(*(_QWORD *)(v50 + 56) + 32 * v62, (uint64_t)&v121);
            }
            else
            {
              v121 = 0u;
              v122 = 0u;
            }
            swift_bridgeObjectRelease(v50);
            sub_1000088B4((uint64_t)&v119);
            if (*((_QWORD *)&v122 + 1))
            {
              if (swift_dynamicCast(&v117, &v121, (char *)&type metadata for Any + 8, &type metadata for String, 6))
              {
                v81 = v118;
LABEL_43:
                v82 = String._bridgeToObjectiveC()();
                swift_bridgeObjectRelease(v61);
                if (v81)
                {
                  v83 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease(v81);
                }
                else
                {
                  v83 = 0;
                }
                v84 = v113;
                v85 = objc_msgSend(objc_allocWithZone((Class)ENRegion), "initWithCountryCode:subdivisionCode:", v82, v83);

                v86 = *(void **)&v41[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region];
                *(_QWORD *)&v41[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = v85;

                v87 = v108;
                v88 = v84;
                v89 = v109;
                v114(v108, v88, v109);
                sub_100008738((uint64_t)a2, v49);
                v90 = sub_100008738((uint64_t)a2, v49);
                v91 = Logger.logObject.getter(v90);
                v92 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v91, v92))
                {
                  v93 = (uint8_t *)swift_slowAlloc(12, -1);
                  v94 = swift_slowAlloc(32, -1);
                  *(_QWORD *)&v121 = v94;
                  *(_DWORD *)v93 = 136315138;
                  if (a2)
                  {
                    v95 = swift_allocObject(&unk_10000C5C0, 32, 7);
                    *(_QWORD *)(v95 + 16) = a2;
                    *(_QWORD *)(v95 + 24) = v49;
                    v96 = sub_100008B2C;
                  }
                  else
                  {
                    v96 = 0;
                    v95 = 0;
                  }
                  v119 = (uint64_t)v96;
                  v120[0] = v95;
                  sub_100008738((uint64_t)a2, v49);
                  v97 = sub_100008748(&qword_1000120B8);
                  v98 = String.init<A>(describing:)(&v119, v97);
                  v99 = (uint64_t)a2;
                  v101 = v100;
                  v119 = sub_100007A94(v98, v100, (uint64_t *)&v121);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, v120, v93 + 4, v93 + 12);
                  v102 = v101;
                  a2 = (void (*)(_QWORD))v99;
                  swift_bridgeObjectRelease(v102);
                  sub_1000086F8(v99, v49);
                  sub_1000086F8(v99, v49);
                  _os_log_impl((void *)&_mh_execute_header, v91, v92, "Calling completion: %s", v93, 0xCu);
                  swift_arrayDestroy(v94, 1, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v94, -1, -1);
                  swift_slowDealloc(v93, -1, -1);

                  v71 = v108;
                  v72 = v109;
                }
                else
                {
                  sub_1000086F8((uint64_t)a2, v49);
                  sub_1000086F8((uint64_t)a2, v49);

                  v71 = v87;
                  v72 = v89;
                }
                goto LABEL_52;
              }
            }
            else
            {
              sub_100008874((uint64_t)&v121);
            }
            v81 = 0;
            goto LABEL_43;
          }
          swift_bridgeObjectRelease(v50);
        }
        else
        {
          swift_bridgeObjectRelease(v50);
          sub_100008874((uint64_t)&v121);
        }
        v73 = v111;
        v74 = v114(v111, v113, v6);
        v75 = Logger.logObject.getter(v74);
        v76 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v75, v76))
        {
          v77 = v6;
          v78 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v78 = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, v76, "Did not get region country code, but we need it for the region.", v78, 2u);
          v79 = v78;
          v6 = v77;
          v73 = v111;
          swift_slowDealloc(v79, -1, -1);
        }

        v80 = ((uint64_t (*)(_BYTE *, uint64_t))v33)(v73, v6);
        if (!a2)
          goto LABEL_54;
        goto LABEL_53;
      }
    }
    else
    {
      sub_100008874((uint64_t)&v119);
    }
    v53 = v115;
    v54 = v114(v115, v113, v6);
    v55 = Logger.logObject.getter(v54);
    v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = v6;
      v58 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v58 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Could not get a SBUIRemoteAlertHostInterface", v58, 2u);
      v59 = v58;
      v6 = v57;
      swift_slowDealloc(v59, -1, -1);
    }

    v60 = ((uint64_t (*)(_BYTE *, uint64_t))v33)(v53, v6);
    if (a2)
      a2(v60);
    goto LABEL_55;
  }
}

id sub_100007A34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HealthENBuddyContainer()
{
  return objc_opt_self(_TtC13HealthENBuddy22HealthENBuddyContainer);
}

uint64_t sub_100007A94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100007B64(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000087EC((uint64_t)v12, *a3);
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
      sub_1000087EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000087CC(v12);
  return v7;
}

uint64_t sub_100007B64(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100007D1C(a5, a6);
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

uint64_t sub_100007D1C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100007DB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100007F88(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100007F88(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100007DB0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100007F24(v4, 0);
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

_QWORD *sub_100007F24(uint64_t a1, uint64_t a2)
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
  v4 = sub_100008748(&qword_1000120C0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100007F88(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100008748(&qword_1000120C0);
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

unint64_t sub_1000080D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100008104(a1, v4);
}

unint64_t sub_100008104(uint64_t a1, uint64_t a2)
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
      sub_1000088E8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000088B4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000081C8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = Logger.buddy.unsafeMutableAddressor(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, v4);
  sub_100008738((uint64_t)a1, a2);
  v10 = sub_100008738((uint64_t)a1, a2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = swift_slowAlloc(32, -1);
    v25 = v22;
    *(_DWORD *)v13 = 136315138;
    if (a1)
    {
      v14 = swift_allocObject(&unk_10000C570, 32, 7);
      *(_QWORD *)(v14 + 16) = a1;
      *(_QWORD *)(v14 + 24) = a2;
      v15 = sub_1000087AC;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    v23 = (uint64_t)v15;
    v24 = v14;
    sub_100008738((uint64_t)a1, a2);
    v16 = sub_100008748(&qword_1000120B8);
    v17 = String.init<A>(describing:)(&v23, v16);
    v19 = v18;
    v23 = sub_100007A94(v17, v18, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease(v19);
    sub_1000086F8((uint64_t)a1, a2);
    sub_1000086F8((uint64_t)a1, a2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "prepareForActivation with completion: %s", v13, 0xCu);
    v20 = v22;
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }
  else
  {
    sub_1000086F8((uint64_t)a1, a2);
    sub_1000086F8((uint64_t)a1, a2);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (a1)
    return a1(result);
  return result;
}

void sub_100008408(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  id v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];

  if (!a1)
    goto LABEL_36;
  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v2 = a1;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_100008958(0, &qword_1000120A8, SBUIRemoteAlertButtonAction_ptr);
    v5 = sub_100008698();
    v6 = Set.Iterator.init(_cocoa:)(v28, v3, v4, v5);
    v1 = v28[0];
    v25 = v28[1];
    v7 = v28[2];
    v8 = v28[3];
    v9 = v28[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
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
  v13 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_14;
  while (1)
  {
    if (v9)
    {
      v14 = (v9 - 1) & v9;
      v15 = __clz(__rbit64(v9)) | (v8 << 6);
      v16 = v8;
      goto LABEL_31;
    }
    v22 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v22 >= v13)
      goto LABEL_34;
    v23 = *(_QWORD *)(v25 + 8 * v22);
    v16 = v8 + 1;
    if (!v23)
    {
      v16 = v8 + 2;
      if (v8 + 2 >= v13)
        goto LABEL_34;
      v23 = *(_QWORD *)(v25 + 8 * v16);
      if (!v23)
      {
        v16 = v8 + 3;
        if (v8 + 3 >= v13)
          goto LABEL_34;
        v23 = *(_QWORD *)(v25 + 8 * v16);
        if (!v23)
        {
          v16 = v8 + 4;
          if (v8 + 4 >= v13)
            goto LABEL_34;
          v23 = *(_QWORD *)(v25 + 8 * v16);
          if (!v23)
          {
            v24 = v8 + 5;
            while (v13 != v24)
            {
              v23 = *(_QWORD *)(v25 + 8 * v24++);
              if (v23)
              {
                v16 = v24 - 1;
                goto LABEL_30;
              }
            }
LABEL_34:
            sub_1000086F0(v1);
            return;
          }
        }
      }
    }
LABEL_30:
    v14 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_31:
    v21 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v15);
    if (!v21)
      goto LABEL_34;
    while (1)
    {
      objc_msgSend(v21, "events");

      v8 = v16;
      v9 = v14;
      if ((v1 & 0x8000000000000000) == 0)
        break;
LABEL_14:
      v17 = __CocoaSet.Iterator.next()(v6);
      if (v17)
      {
        v18 = v17;
        v26 = v17;
        v19 = sub_100008958(0, &qword_1000120A8, SBUIRemoteAlertButtonAction_ptr);
        swift_unknownObjectRetain(v18, v20);
        swift_dynamicCast(&v27, &v26, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
        v21 = v27;
        swift_unknownObjectRelease(v18);
        v16 = v8;
        v14 = v9;
        if (v21)
          continue;
      }
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

unint64_t sub_100008698()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000120B0;
  if (!qword_1000120B0)
  {
    v1 = sub_100008958(255, &qword_1000120A8, SBUIRemoteAlertButtonAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000120B0);
  }
  return result;
}

uint64_t sub_1000086F0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000086F8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100008708()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000872C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100008738(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100008748(uint64_t *a1)
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

uint64_t sub_100008788()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000087AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000087CC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000087EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000882C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008748(&qword_1000120C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008874(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008748(&qword_1000120C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000088B4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000088E8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008924()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_100005944(a1, a2, a3, a4, a5, *(void **)(v5 + 16), *(void (**)(char *, uint64_t))(v5 + 24));
}

uint64_t sub_100008958(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100008990()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000089B4()
{
  uint64_t v0;

  sub_1000069E8(*(void **)(v0 + 16));
}

uint64_t sub_1000089BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000089CC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_1000089D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000120F0;
  if (!qword_1000120F0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000120F0);
  }
  return result;
}

unint64_t sub_100008A1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012100;
  if (!qword_100012100)
  {
    v1 = sub_100008A68(&qword_1000120F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100012100);
  }
  return result;
}

uint64_t sub_100008A68(uint64_t *a1)
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

uint64_t sub_100008AAC()
{
  uint64_t v0;

  return sub_100006BFC(*(void **)(v0 + 16));
}

void sub_100008AB4(NSObject *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100005F08(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100008ABC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100008AE0(uint64_t a1)
{
  uint64_t v1;

  sub_100006554(a1, v1);
}

uint64_t sub_100008B30()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13HealthENBuddyP33_EBBB3C4F4621A79950447D87FAC2989A19ResourceBundleClass);
}
