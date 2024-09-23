@implementation DNDSModeAssertionInvalidationPredicate

+ (id)predicateForAnyAssertion
{
  return objc_alloc_init(DNDSAnyModeAssertionInvalidationPredicate);
}

+ (id)predicateForAssertionsTakenBeforeDate:(id)a3
{
  id v3;
  DNDSModeAssertionDateInvalidationPredicate *v4;

  v3 = a3;
  v4 = -[DNDSModeAssertionDateInvalidationPredicate initWithDate:]([DNDSModeAssertionDateInvalidationPredicate alloc], "initWithDate:", v3);

  return v4;
}

+ (id)predicateForAssertionClientIdentifiers:(id)a3
{
  id v3;
  DNDSModeAssertionClientIdentifierInvalidationPredicate *v4;

  v3 = a3;
  v4 = -[DNDSModeAssertionClientIdentifierInvalidationPredicate initWithClientIdentifiers:]([DNDSModeAssertionClientIdentifierInvalidationPredicate alloc], "initWithClientIdentifiers:", v3);

  return v4;
}

+ (id)predicateForAssertionUUIDs:(id)a3
{
  id v3;
  DNDSModeAssertionUUIDInvalidationPredicate *v4;

  v3 = a3;
  v4 = -[DNDSModeAssertionUUIDInvalidationPredicate initWithUUIDs:]([DNDSModeAssertionUUIDInvalidationPredicate alloc], "initWithUUIDs:", v3);

  return v4;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DNDSModeAssertionInvalidationPredicate;
  return -[DNDSModeAssertionInvalidationPredicate init](&v3, sel_init);
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)predicateType
{
  return 0;
}

@end
