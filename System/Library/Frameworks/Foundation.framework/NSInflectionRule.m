@implementation NSInflectionRule

- (id)_init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRule;
  return -[NSInflectionRule init](&v3, sel_init);
}

+ (NSInflectionRule)automaticRule
{
  if (qword_1ECD09118 != -1)
    dispatch_once(&qword_1ECD09118, &__block_literal_global_61);
  return (NSInflectionRule *)_MergedGlobals_3;
}

id __33__NSInflectionRule_automaticRule__block_invoke()
{
  id result;

  result = -[NSInflectionRule _init]([_NSInflectionRuleAutomatic alloc], "_init");
  _MergedGlobals_3 = (uint64_t)result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSInflectionRule)initWithCoder:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v4);
}

+ (BOOL)canInflectPreferredLocalization
{
  id v3;

  v3 = -[NSArray firstObject](-[NSBundle preferredLocalizations](+[NSBundle mainBundle](NSBundle, "mainBundle"), "preferredLocalizations"), "firstObject");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "canInflectLanguage:", v3);
  return (char)v3;
}

+ (BOOL)canInflectLanguage:(NSString *)language
{
  _BOOL4 v4;

  v4 = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  if (v4)
    LOBYTE(v4) = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  return v4;
}

@end
