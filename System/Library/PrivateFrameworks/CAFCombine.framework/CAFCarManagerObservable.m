@implementation CAFCarManagerObservable

- (void)dealloc
{
  _TtC10CAFCombine23CAFCarManagerObservable *v2;

  v2 = self;
  CAFCarManagerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10CAFCombine23CAFCarManagerObservable__currentCar;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<CAFCar?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC10CAFCombine23CAFCarManagerObservable)init
{
  CAFCarManagerObservable.init()();
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine23CAFCarManagerObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFCarManagerObservable.carManager(_:didUpdateCurrentCar:)((uint64_t)v8, a4);

}

@end
