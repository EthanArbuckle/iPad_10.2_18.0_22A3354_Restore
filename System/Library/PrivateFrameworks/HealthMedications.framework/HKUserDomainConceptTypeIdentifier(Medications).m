@implementation HKUserDomainConceptTypeIdentifier(Medications)

+ (id)medicationUserDomainConceptTypeIdentifier
{
  return (id)objc_msgSend([a1 alloc], "initWithCode:schema:", 0, CFSTR("medication"));
}

- (uint64_t)isMedicationTypeIdentifier
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  if (objc_msgSend(a1, "code"))
    return 0;
  objc_msgSend(a1, "schema");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("medication"))
  {
    v2 = 1;
  }
  else if (CFSTR("medication"))
  {
    objc_msgSend(a1, "schema");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "isEqualToString:", CFSTR("medication"));

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
