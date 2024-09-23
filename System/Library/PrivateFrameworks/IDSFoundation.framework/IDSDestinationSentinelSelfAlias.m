@implementation IDSDestinationSentinelSelfAlias

- (id)destinationURIs
{
  double v2;

  return (id)objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("____--SENTINEL--SELF--ALIAS--V0--____"), v2);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p>"), v6, v4, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
