@implementation NSPersonNameComponents(IC)

- (uint64_t)ic_localizedNameWithDefaultFormattingStyle
{
  return objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a1, 0, 0);
}

- (id)ic_componentsForSearchHighlighting
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v3);

  objc_msgSend(a1, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v4);

  return v2;
}

@end
