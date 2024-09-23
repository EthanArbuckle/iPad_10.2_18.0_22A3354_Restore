@implementation TESPatternMatcherTilde

- (TESPatternMatcherTilde)init
{
  TESPatternMatcherTilde *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherTilde;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 8);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("\\b\\w+~+$"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
