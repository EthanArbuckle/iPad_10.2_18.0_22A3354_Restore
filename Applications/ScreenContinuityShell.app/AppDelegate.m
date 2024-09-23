@implementation AppDelegate

- (_TtC21ScreenContinuityShell11AppDelegate)init
{
  return (_TtC21ScreenContinuityShell11AppDelegate *)sub_10000BE94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate_xpcEventQueue));
  if (*(_QWORD *)&self->$__lazy_storage_$_displayRegistrarVendor[OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor
                                                                + 8])
    sub_10000A27C((Class *)((char *)&self->super.super.isa
                          + OBJC_IVAR____TtC21ScreenContinuityShell11AppDelegate____lazy_storage___displayRegistrarVendor));
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC21ScreenContinuityShell11AppDelegate *v11;
  char v12;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100005394(&qword_10001E190, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012DDC);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v12 = sub_10000D8B0();

  swift_bridgeObjectRelease(v4);
  return v12 & 1;
}

+ (void)main
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
  char *v9;
  Swift::String v10;
  Swift::String v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  uint64_t v24;
  objc_class *ObjCClassFromMetadata;
  NSString *v26;
  NSString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  NSString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  char **v48;
  uint8_t *v49;
  uint64_t (*v50)(char *, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54[3];
  uint64_t v55;
  uint64_t v56;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v3 = __chkstk_darwin(v0, v2);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v3, v6);
  v9 = (char *)&v49 - v8;
  static Logger.angel.getter(v7);
  v10._object = (void *)0x8000000100015D80;
  v10._countAndFlagsBits = 0xD000000000000062;
  v11._countAndFlagsBits = 0x29286E69616DLL;
  v11._object = (void *)0xE600000000000000;
  Logger.debugMarker(_:line:function:message:)(v10, 51, v11, (Swift::String_optional)0);
  v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v9, v0);
  v13 = type metadata accessor for OnenessFeatureFlags(0);
  v55 = v13;
  v56 = sub_100005394(&qword_10001E198, (uint64_t (*)(uint64_t))&type metadata accessor for OnenessFeatureFlags, (uint64_t)&protocol conformance descriptor for OnenessFeatureFlags);
  v14 = sub_10000DA74(v54);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v14, enum case for OnenessFeatureFlags.Shell(_:), v13);
  LOBYTE(v13) = isFeatureEnabled(_:)(v54);
  sub_10000A27C(v54);
  v15 = 0;
  if ((v13 & 1) != 0)
  {
    type metadata accessor for AngelServer(0);
    v16 = (void *)static AngelServer.sharedInstance.getter();
    AngelServer.startUp()();

    v17 = type metadata accessor for LiveActivityDisplayingVendor();
    v18 = swift_allocObject(v17, 16, 7);
    v55 = v17;
    v56 = sub_100005394((unint64_t *)&unk_10001E250, (uint64_t (*)(uint64_t))type metadata accessor for LiveActivityDisplayingVendor, (uint64_t)&unk_100012F90);
    v54[0] = v18;
    v19 = (void *)static AngelServer.sharedInstance.getter();
    AngelServer.provideLiveActivityVendor(_:)(v54);

    v20 = (void *)objc_opt_self(BSServicesConfiguration);
    static RunningBoardServiceSpecification.serviceDomain.getter();
    v22 = v21;
    v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
    v15 = objc_msgSend(v20, "activateManualDomain:", v23);

    sub_10000A27C(v54);
  }
  v24 = type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v24);
  v26 = NSStringFromClass(ObjCClassFromMetadata);
  v27 = v26;
  if (!v26)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v29 = v28;
    v27 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v29);
  }
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  v32 = v31;
  v33 = type metadata accessor for Application();
  v34 = (objc_class *)swift_getObjCClassFromMetadata(v33);
  v35 = NSStringFromClass(v34);
  v36 = v35;
  if (!v35)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v38 = v37;
    v36 = (NSString *)String._bridgeToObjectiveC()();
    v35 = (NSString *)swift_bridgeObjectRelease(v38);
  }
  static Logger.angel.getter(v35);
  v39 = swift_bridgeObjectRetain(v32);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v52 = v0;
    v42 = swift_slowAlloc(12, -1);
    v51 = v5;
    v43 = (uint8_t *)v42;
    v44 = swift_slowAlloc(32, -1);
    v50 = (uint64_t (*)(char *, uint64_t))v12;
    v45 = v44;
    v54[0] = v44;
    *(_DWORD *)v43 = 136446210;
    v49 = v43 + 4;
    swift_bridgeObjectRetain(v32);
    v53 = sub_100009B68(v30, v32, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v49, v43 + 12);
    swift_bridgeObjectRelease_n(v32, 3);
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "appDelegateClassString: %{public}s", v43, 0xCu);
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v43, -1, -1);

    v46 = v50(v51, v52);
  }
  else
  {

    swift_bridgeObjectRelease_n(v32, 2);
    v46 = ((uint64_t (*)(char *, uint64_t))v12)(v5, v0);
  }
  v47 = static CommandLine.argc.getter(v46);
  v48 = (char **)static CommandLine.unsafeArgv.getter();
  UIApplicationMain(v47, v48, v36, v27);

  if (v15)
  {
    objc_msgSend(v15, "invalidate");
    swift_unknownObjectRelease(v15);
  }
}

@end
