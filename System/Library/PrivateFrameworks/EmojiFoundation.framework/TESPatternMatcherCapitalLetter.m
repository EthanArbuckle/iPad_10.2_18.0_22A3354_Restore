@implementation TESPatternMatcherCapitalLetter

- (TESPatternMatcherCapitalLetter)init
{
  TESPatternMatcherCapitalLetter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherCapitalLetter;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 1);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("[[:upper:]]{5,}"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
