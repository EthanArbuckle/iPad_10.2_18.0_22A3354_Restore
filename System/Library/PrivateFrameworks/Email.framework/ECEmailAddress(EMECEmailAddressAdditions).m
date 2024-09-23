@implementation ECEmailAddress(EMECEmailAddressAdditions)

- (id)em_displayableString
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(a1, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(a1, "simpleAddress"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v2, "localizedCaseInsensitiveCompare:", v3),
        v3,
        !v4))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v2, "ea_personNameComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setNamePrefix:", 0);
      objc_msgSend(v6, "setNameSuffix:", 0);
      v7 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v7, "setStyle:", 3);
      objc_msgSend(v7, "stringFromPersonNameComponents:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v2, "length"))
    {
      v8 = v2;
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v8, "length"))
      v10 = v8;
    else
      v10 = 0;
    v9 = v10;

  }
  return v9;
}

- (id)em_displayableStringOrSimpleAddress
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "em_displayableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "simpleAddress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)em_person
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "simpleAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA6B10]);
    objc_msgSend(a1, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "simpleAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithDisplayName:handles:handleIdentifier:", v4, v6, *MEMORY[0x1E0C966A8]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)em_partiallyRedactedPeople:()EMECEmailAddressAdditions
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
