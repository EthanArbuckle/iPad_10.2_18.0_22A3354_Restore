@implementation _NSInflectionRuleAutomatic

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSInflectionRuleAutomatic)initWithCoder:(id)a3
{

  return (_NSInflectionRuleAutomatic *)+[NSInflectionRule automaticRule](NSInflectionRule, "automaticRule");
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSInflectionRuleAutomatic;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (automatic inflection rule)"), -[_NSInflectionRuleAutomatic description](&v3, sel_description));
}

@end
