@implementation NTKMonogram

+ (id)monogram
{
  void *v3;
  void *v4;

  +[NTKCustomMonogramStore sharedInstance](NTKCustomMonogramStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customMonogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1, "defaultMonogram");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)defaultMonogram
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "_initialsForPerson:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)alternateMonogram
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "_firstNameForPerson:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_currentUser
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (NTKDeviceIsGreenTea()
    && (objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isPaired"),
        v2,
        !v3))
  {
    v7 = 0;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    v5 = (void *)tcc_identity_create();
    objc_msgSend(v4, "setAssumedIdentity:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
    objc_msgSend(v6, "_ios_meContactWithKeysToFetch:error:", MEMORY[0x1E0C9AA60], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_firstNameForPerson:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C96898];
  v14[0] = *MEMORY[0x1E0C966D0];
  v14[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "areKeysAvailable:", v5) & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    v7 = (void *)tcc_identity_create();
    objc_msgSend(v6, "setAssumedIdentity:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v6);
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v5, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v10;
  }
  if (v3 && !objc_msgSend(v3, "contactType"))
  {
    objc_msgSend(v3, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (CNStringContainsNonLatinCharacters() & 1) == 0 && objc_msgSend(v12, "length"))
    {
      objc_msgSend(v12, "localizedCapitalizedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_initialsForPerson:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C966C0];
  v18[0] = *MEMORY[0x1E0C966D0];
  v18[1] = v4;
  v18[2] = *MEMORY[0x1E0C96898];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "areKeysAvailable:", v5) & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    v7 = (void *)tcc_identity_create();
    objc_msgSend(v6, "setAssumedIdentity:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v6);
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v5, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v10;
  }
  if (v3 && !objc_msgSend(v3, "contactType"))
  {
    objc_msgSend(v3, "givenName");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "familyName");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!(v12 | v13)
      || (CNStringContainsNonLatinCharacters() & 1) != 0
      || (CNStringContainsNonLatinCharacters() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setGivenName:", v12);
      objc_msgSend(v15, "setFamilyName:", v13);
      v16 = (void *)objc_opt_new();
      objc_msgSend(v16, "setStyle:", 4);
      objc_msgSend(v16, "set_ignoresFallbacks:", 1);
      objc_msgSend(v16, "stringFromPersonNameComponents:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(v17, "localizedUppercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
