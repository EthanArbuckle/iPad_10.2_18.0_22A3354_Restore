@implementation NSPersonNameComponents(BRAdditions)

- (uint64_t)br_formattedName
{
  return objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a1, 0, 0);
}

- (id)br_formattedNameWithNonBreakingSpaces
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a1, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)br_shouldOverwriteExistingName
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "givenName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("n/a")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "familyName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("n/a"));

  }
  return v3;
}

@end
