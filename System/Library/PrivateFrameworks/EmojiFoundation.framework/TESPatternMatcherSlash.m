@implementation TESPatternMatcherSlash

- (TESPatternMatcherSlash)init
{
  TESPatternMatcherSlash *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherSlash;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 11);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("/.+?/"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
