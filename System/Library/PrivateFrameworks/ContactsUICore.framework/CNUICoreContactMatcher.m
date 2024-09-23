@implementation CNUICoreContactMatcher

+ (id)nameFromFammilyMember:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C97360];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v4, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setFamilyName:", v7);
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)doesNameOfContact:(id)a3 matchNameOfContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", v8))
  {
    objc_msgSend(v5, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_cn_caseInsensitiveIsEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)doesContact:(id)a3 matchAnyParentOrGuardianInFamily:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_filter:", &__block_literal_global_11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke_2;
  v11[3] = &unk_1EA603830;
  v12 = v6;
  v13 = a1;
  v9 = v6;
  LOBYTE(v6) = objc_msgSend(v8, "_cn_any:", v11);

  return (char)v6;
}

uint64_t __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "familyMember");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isParent");

  return v3;
}

uint64_t __71__CNUICoreContactMatcher_doesContact_matchAnyParentOrGuardianInFamily___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(a2, "familyMember");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "doesNameOfContact:matchNameOfFamilyMember:", v3, v4);

  return v5;
}

+ (BOOL)doesNameOfContact:(id)a3 matchNameOfFamilyMember:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", v8))
  {
    objc_msgSend(v5, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_cn_caseInsensitiveIsEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
