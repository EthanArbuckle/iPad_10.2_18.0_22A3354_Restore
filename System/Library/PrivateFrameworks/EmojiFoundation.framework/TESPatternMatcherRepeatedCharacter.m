@implementation TESPatternMatcherRepeatedCharacter

- (TESPatternMatcherRepeatedCharacter)init
{
  TESPatternMatcherRepeatedCharacter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherRepeatedCharacter;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 7);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("\\b(\\w*(\\w)\\2{2,}\\w*)\\b"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
