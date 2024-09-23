@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC13FTMInternal_411AppDelegate *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100146004(&qword_1002B3BB0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10023FCE4);
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  v15 = sub_10018DBE0((uint64_t)v11, v12, v13, v14);

  swift_bridgeObjectRelease(v4);
  return v15 & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13FTMInternal_411AppDelegate *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _TtC13FTMInternal_411AppDelegate *v14;
  _TtC13FTMInternal_411AppDelegate *v15;

  v4 = qword_1002B39F8;
  v5 = a3;
  v6 = self;
  v15 = v6;
  if (v4 != -1)
    v6 = (_TtC13FTMInternal_411AppDelegate *)swift_once(&qword_1002B39F8, sub_100174778);
  v10 = qword_1002BEFE8;
  v11 = static os_log_type_t.default.getter(v6, v7, v8, v9);
  os_log(_:dso:log:type:_:)("Appdelegate - applicationWillTerminate", 38, 2, &_mh_execute_header, v10, v11, _swiftEmptyArrayStorage);
  v12 = objc_msgSend((id)objc_opt_self(ABMWrapper), "sharedInstance");
  if (v12)
  {
    v13 = v12;
    v14 = (_TtC13FTMInternal_411AppDelegate *)String._bridgeToObjectiveC()();
    objc_msgSend(v13, "removeAWDConfigForAppid:", v14);

    v5 = v13;
    v15 = v14;
  }

}

- (_TtC13FTMInternal_411AppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_abmManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return -[AppDelegate init](&v3, "init");
}

- (void).cxx_destruct
{

}

- (uint64_t)applicationDidEnterBackground:(uint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  char v27[24];

  if (qword_1002B39F8 != -1)
    a1 = swift_once(&qword_1002B39F8, sub_100174778);
  v4 = qword_1002BEFE8;
  v5 = static os_log_type_t.default.getter(a1, a2, a3, a4);
  os_log(_:dso:log:type:_:)("Appdelegate - applicationDidEnterBackground", 43, 2, &_mh_execute_header, v4, v5, _swiftEmptyArrayStorage);
  v6 = objc_msgSend((id)objc_opt_self(ABMWrapper), "sharedInstance");
  if (v6)
  {
    v10 = v6;
    v11 = String._bridgeToObjectiveC()();
    objc_msgSend(v10, "removeAWDConfigForAppid:", v11);

    if (qword_1002B3A80 != -1)
      swift_once(&qword_1002B3A80, sub_100184F00);
    v12 = qword_1002BEFE8;
    v13 = (char *)(id)qword_1002BF070;
    v17 = static os_log_type_t.default.getter(v13, v14, v15, v16);
    os_log(_:dso:log:type:_:)("All items cleared", 17, 2, &_mh_execute_header, v12, v17, _swiftEmptyArrayStorage);
    v18 = sub_1001BE42C((uint64_t)_swiftEmptyArrayStorage);
    v19 = (unint64_t *)&v13[OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricDetailsClassObject];
    swift_beginAccess(&v13[OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricDetailsClassObject], v27, 1, 0);
    v20 = *v19;
    *v19 = v18;

    swift_bridgeObjectRelease(v20);
    v21 = (uint64_t *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
    swift_beginAccess(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray, &v26, 1, 0);
    v22 = *v21;
    *v21 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v22);
    v23 = *(_QWORD *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsGraphArray);
    *(_QWORD *)(qword_1002BF070 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsGraphArray) = _swiftEmptyArrayStorage;

    return swift_bridgeObjectRelease(v23);
  }
  else
  {
    v25 = static os_log_type_t.default.getter(0, v7, v8, v9);
    return os_log(_:dso:log:type:_:)("Appdelegate - applicationDidEnterBackground ABMWrapper.sharedInstance  returned nil", 83, 2, &_mh_execute_header, v4, v25, _swiftEmptyArrayStorage);
  }
}

- (void)applicationDidBecomeActive:(uint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSString v12;
  NSString v13;
  id v14;
  uint64_t v15;
  NSString v16;
  unsigned int v17;
  NSString v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if (qword_1002B39F8 != -1)
    a1 = swift_once(&qword_1002B39F8, sub_100174778);
  v4 = qword_1002BEFE8;
  v5 = static os_log_type_t.default.getter(a1, a2, a3, a4);
  os_log(_:dso:log:type:_:)("Appdelegate - applicationDidBecomeActive", 40, 2, &_mh_execute_header, v4, v5, _swiftEmptyArrayStorage);
  v6 = objc_msgSend((id)objc_opt_self(ABMWrapper), "sharedInstance");
  if (v6)
  {
    v28 = v6;
    v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    if (qword_1002B3A78 != -1)
      swift_once(&qword_1002B3A78, sub_100183CA4);
    v11 = *(_QWORD *)(qword_1002BF068 + 176);
    swift_bridgeObjectRetain(v11);
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
    v13 = String._bridgeToObjectiveC()();
    v14 = objc_msgSend(v10, "pathForResource:ofType:", v12, v13);

    if (v14)
    {
      v16 = String._bridgeToObjectiveC()();
      v17 = objc_msgSend(v28, "addAWDConfigForAppId:andProtofFilePath:", v16, v14);

      if (v17)
      {
        objc_msgSend(v28, "listen");
        v18 = String._bridgeToObjectiveC()();
        objc_msgSend(v28, "querySpecificMetric:triggerRef:triggerType:triggerID:profileID:metricID:", v18, 9999, 0, *(unsigned int *)(qword_1002BF068 + 184), 0, 0);

        if (qword_1002B39E8 != -1)
          v19 = swift_once(&qword_1002B39E8, sub_100174680);
        v23 = qword_1002BEFD8;
        v24 = static os_log_type_t.default.getter(v19, v20, v21, v22);
        os_log(_:dso:log:type:_:)("successfully started listening ABM applicationDidBecomeActive", 61, 2, &_mh_execute_header, v23, v24, _swiftEmptyArrayStorage);
      }
    }
    else
    {
      if (qword_1002B39E8 != -1)
        v15 = swift_once(&qword_1002B39E8, sub_100174680);
      v26 = qword_1002BEFD8;
      v27 = static os_log_type_t.error.getter(v15);
      os_log(_:dso:log:type:_:)("Metric Log File path doesn't exist", 34, 2, &_mh_execute_header, v26, v27, _swiftEmptyArrayStorage);
    }

  }
  else
  {
    v25 = static os_log_type_t.default.getter(0, v7, v8, v9);
    os_log(_:dso:log:type:_:)("Appdelegate - applicationDidBecomeActive ABMWrapper.sharedInstance returned nil", 79, 2, &_mh_execute_header, v4, v25, _swiftEmptyArrayStorage);
  }
}

@end
