@implementation ARKitRunner

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  _TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner *v7;

  v6 = a3;
  v7 = self;
  specialized ARKitRunner.session(_:didChange:)(a4);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized ARKitRunner.session(_:didUpdate:)();

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  specialized ARKitRunner.session(_:didFailWithError:)(v8);

}

- (_TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner)init
{
  uint64_t v3;
  objc_class *v4;
  char *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner_lock;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  v4 = (objc_class *)swift_allocObject();
  *((_DWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v3) = v4;
  v5 = (char *)self + OBJC_IVAR____TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner_continuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<related decl 'e' for ARErrorCode?, Never>);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ARKitRunner();
  return -[ARKitRunner init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?((uint64_t)self + OBJC_IVAR____TtC10RealityKitP33_98DEB876138878DC696D4005FE1B9B4811ARKitRunner_continuation, &demangling cache variable for type metadata for CheckedContinuation<related decl 'e' for ARErrorCode?, Never>?);
}

@end
