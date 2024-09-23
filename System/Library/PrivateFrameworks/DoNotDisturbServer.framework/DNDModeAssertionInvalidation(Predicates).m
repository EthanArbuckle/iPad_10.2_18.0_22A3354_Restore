@implementation DNDModeAssertionInvalidation(Predicates)

+ (uint64_t)predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:()Predicates
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("assertion.source.clientIdentifier IN %@"), a3);
}

@end
