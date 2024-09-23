@implementation EnvironmentMonitor

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  sub_24147A63C(self, (uint64_t)a2, a3, (uint64_t)&unk_251179FB8, (uint64_t)&unk_25712A078);
}

- (_TtC11MediaCoreUI18EnvironmentMonitor)init
{
  return (_TtC11MediaCoreUI18EnvironmentMonitor *)sub_2412D28FC();
}

- (void)dealloc
{
  void *v3;
  _TtC11MediaCoreUI18EnvironmentMonitor *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedMonitor);
  objc_msgSend(v5, sel_unregisterObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for EnvironmentMonitor();
  -[EnvironmentMonitor dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI18EnvironmentMonitor__isNetworkConstrained;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254384338);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI18EnvironmentMonitor__thermalLevel;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254384340);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  sub_24147A63C(self, (uint64_t)a2, a3, (uint64_t)&unk_251179F90, (uint64_t)&unk_25712A068);
}

@end
