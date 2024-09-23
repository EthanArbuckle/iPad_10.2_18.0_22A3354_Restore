@implementation NSURL(FamilyCircle)

- (id)fa_URLByAddingQueryParams:()FamilyCircle
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__NSURL_FamilyCircle__fa_URLByAddingQueryParams___block_invoke;
  v14[3] = &unk_1E8562218;
  v15 = v10;
  v11 = v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
  objc_msgSend(v5, "setQueryItems:", v11);
  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fa_URLByAddingAirdropInviteParams
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("familyInviteSource");
  v6[0] = CFSTR("airdrop");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fa_URLByAddingQueryParams:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
