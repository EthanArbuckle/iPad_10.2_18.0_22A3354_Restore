@implementation HDHRConditionRule

- (HDHRConditionRule)initWithDefinition:(id)a3 error:(id *)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_224F67B80();
  return (HDHRConditionRule *)ConditionRule.init(definition:)(v4, v5);
}

- (BOOL)evaluateWith:(id)a3
{
  id v4;
  HDHRConditionRule *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_224E525B8(v4);

  return self & 1;
}

- (HDHRConditionRule)init
{
  HDHRConditionRule *result;

  result = (HDHRConditionRule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
