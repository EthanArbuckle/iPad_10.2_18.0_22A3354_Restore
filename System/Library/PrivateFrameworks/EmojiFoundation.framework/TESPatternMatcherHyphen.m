@implementation TESPatternMatcherHyphen

- (TESPatternMatcherHyphen)init
{
  TESPatternMatcherHyphen *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherHyphen;
  v3 = -[TESPatternMatcherBase init](&v5, sel_init);
  if (v3 == self)
  {
    -[TESPatternMatcherBase setEffectType:](self, "setEffectType:", 12);
    -[TESPatternMatcherBase setPattern:](self, "setPattern:", CFSTR("-[\\w\\s]+?-"));
    -[TESPatternMatcherBase configurePrecompiledRegularExpression](self, "configurePrecompiledRegularExpression");
  }
  return v3;
}

@end
