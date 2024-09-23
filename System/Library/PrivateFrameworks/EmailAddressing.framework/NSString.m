@implementation NSString

void __60__NSString_EmailAddressingAdditions__ea_isLegalEmailAddress__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ea_isLegalEmailAddress_validLocalPartSet;
  ea_isLegalEmailAddress_validLocalPartSet = v0;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-."));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)ea_isLegalEmailAddress_validDomainPartSet;
  ea_isLegalEmailAddress_validDomainPartSet = v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)ea_isLegalEmailAddress_invalidTLDPartSet;
  ea_isLegalEmailAddress_invalidTLDPartSet = v4;

}

@end
