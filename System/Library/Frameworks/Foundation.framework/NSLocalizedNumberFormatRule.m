@implementation NSLocalizedNumberFormatRule

- (id)_init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSLocalizedNumberFormatRule;
  return -[NSLocalizedNumberFormatRule init](&v3, sel_init);
}

+ (id)automatic
{
  if (_MergedGlobals_134 != -1)
    dispatch_once(&_MergedGlobals_134, &__block_literal_global_60);
  return (id)qword_1ECD0A350;
}

id __40__NSLocalizedNumberFormatRule_automatic__block_invoke()
{
  id result;

  result = -[NSLocalizedNumberFormatRule _init]([_NSLocalizedNumberFormatRuleAutomatic alloc], "_init");
  qword_1ECD0A350 = (uint64_t)result;
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

- (NSLocalizedNumberFormatRule)initWithCoder:(id)a3
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

- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

@end
