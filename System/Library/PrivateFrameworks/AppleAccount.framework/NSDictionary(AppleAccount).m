@implementation NSDictionary(AppleAccount)

- (id)aa_dictionaryByAddingEntriesFromDictionary:()AppleAccount
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+AppleAccount.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v6 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

@end
