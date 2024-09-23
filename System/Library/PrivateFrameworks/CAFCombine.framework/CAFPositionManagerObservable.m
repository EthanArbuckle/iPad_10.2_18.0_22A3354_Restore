@implementation CAFPositionManagerObservable

- (void)dealloc
{
  _TtC10CAFCombine28CAFPositionManagerObservable *v2;

  v2 = self;
  CAFPositionManagerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10CAFCombine28CAFPositionManagerObservable__state;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCharacteristicState>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC10CAFCombine28CAFPositionManagerObservable)init
{
  CAFPositionManagerObservable.init()();
}

- (void)positionManager:(id)a3 didUpdateState:(unint64_t)a4
{
  id v5;
  _TtC10CAFCombine28CAFPositionManagerObservable *v6;

  v5 = a3;
  v6 = self;
  CAFPositionManagerObservable.positionManager(_:didUpdate:)(v5);

}

@end
