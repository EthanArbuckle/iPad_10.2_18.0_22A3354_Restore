@implementation HDHRExtractionRulesKeyPathComponent

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_224F67B5C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)parenthesisContent
{
  void *v2;

  if (*(_QWORD *)&self->name[OBJC_IVAR___HDHRExtractionRulesKeyPathComponent_parenthesisContent])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_224F67B5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (HDHRExtractionRulesKeyPathComponent)init
{
  HDHRExtractionRulesKeyPathComponent *result;

  result = (HDHRExtractionRulesKeyPathComponent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
