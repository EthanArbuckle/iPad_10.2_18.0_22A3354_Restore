@implementation RootNavigationController

- (_TtC13FTMInternal_424RootNavigationController)initWithCoder:(id)a3
{
  _TtC13FTMInternal_424RootNavigationController *result;

  result = (_TtC13FTMInternal_424RootNavigationController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/RootNavigationController.swift", 44, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC13FTMInternal_424RootNavigationController *v2;

  v2 = self;
  sub_100191CB8();

}

- (void)firstTimerMetricRefresh
{
  _TtC13FTMInternal_424RootNavigationController *v2;

  v2 = self;
  sub_100192148();

}

- (void)dealloc
{
  uint64_t v2;
  _TtC13FTMInternal_424RootNavigationController *v3;
  _TtC13FTMInternal_424RootNavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v2 = qword_1002B39E0;
  v3 = self;
  v4 = v3;
  if (v2 != -1)
    v3 = (_TtC13FTMInternal_424RootNavigationController *)swift_once(&qword_1002B39E0, sub_100174664);
  v5 = qword_1002BEFD0;
  v6 = static os_log_type_t.error.getter(v3);
  os_log(_:dso:log:type:_:)("root navigation vc deinit called", 32, 2, &_mh_execute_header, v5, v6, _swiftEmptyArrayStorage);
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for RootNavigationController();
  -[RootNavigationController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_424RootNavigationController_persistanceStore));
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RootNavigationController();
  -[RootNavigationController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (_TtC13FTMInternal_424RootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC13FTMInternal_424RootNavigationController *result;

  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.RootNavigationController", 38, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_424RootNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC13FTMInternal_424RootNavigationController *result;

  v3 = a3;
  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.RootNavigationController", 38, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC13FTMInternal_424RootNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13FTMInternal_424RootNavigationController *result;

  v4 = a4;
  result = (_TtC13FTMInternal_424RootNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.RootNavigationController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
