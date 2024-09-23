@implementation FuzzyMatchAssessment

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBBF822;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBBF822 = a3;
}

- (_TtC13CoreIDVShared20FuzzyMatchAssessment)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared20FuzzyMatchAssessment *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared20FuzzyMatchAssessment *)sub_1CF98C93C();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared20FuzzyMatchAssessment *v5;

  v4 = a3;
  v5 = self;
  sub_1CF98A568(v4);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))sub_1CF98A984);
}

- (_TtC13CoreIDVShared20FuzzyMatchAssessment)init
{
  _TtC13CoreIDVShared20FuzzyMatchAssessment *result;

  result = (_TtC13CoreIDVShared20FuzzyMatchAssessment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
