@implementation CalAccountStoreChangeFilterDelegateForLegacyICBURestore

- (BOOL)allowChangesToExistingTopLevelAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "accountTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F140]);

  if (v5)
  {
    objc_msgSend(v3, "accountPropertyForKey:", *MEMORY[0x1E0C8EF48]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)allowCreationOfTopLevelAccountWithTypeIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C8F140]);
}

@end
