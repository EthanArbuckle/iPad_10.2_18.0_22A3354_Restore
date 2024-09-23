@implementation TESPatternMatcherAsterisk

- (TESPatternMatcherAsterisk)init
{
  TESPatternMatcherAsterisk *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherAsterisk;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 9);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("\\*[\\w\\s]+\\*"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
