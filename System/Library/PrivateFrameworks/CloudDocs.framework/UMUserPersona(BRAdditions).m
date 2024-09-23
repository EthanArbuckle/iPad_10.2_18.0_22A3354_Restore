@implementation UMUserPersona(BRAdditions)

- (__CFString)br_personaID
{
  __CFString *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  v2 = CFSTR("__defaultPersonaID__");
  if (objc_msgSend(a1, "isDataSeparatedPersona"))
  {
    objc_msgSend(a1, "userPersonaUniqueString");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (__CFString *)v3;
    else
      v5 = CFSTR("__defaultPersonaID__");
    v2 = v5;

  }
  return v2;
}

@end
