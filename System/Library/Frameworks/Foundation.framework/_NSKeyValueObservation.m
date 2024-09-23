@implementation _NSKeyValueObservation

- (void)dealloc
{
  void *v3;
  _NSKeyValueObservation *v4;
  objc_super v5;

  v3 = (void *)MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();

  }
  swift_unknownObjectWeakAssign();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for NSKeyValueObservation();
  -[_NSKeyValueObservation dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (void)invalidate
{
  void *v3;
  _NSKeyValueObservation *v4;

  v3 = (void *)MEMORY[0x186DA9F5C]((char *)self + OBJC_IVAR____NSKeyValueObservation_helper, a2);
  v4 = self;
  if (v3)
  {
    NSKeyValueObservation.Helper.invalidate()();

  }
  swift_unknownObjectWeakAssign();

}

- (_NSKeyValueObservation)init
{
  _NSKeyValueObservation *result;

  result = (_NSKeyValueObservation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
