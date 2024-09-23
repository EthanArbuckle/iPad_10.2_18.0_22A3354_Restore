@implementation CNPropertyGroupSocialProfileItem

- (CNSocialProfile)profile
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNSocialProfile *)v3;
}

- (id)defaultActionURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[CNPropertyGroupSocialProfileItem profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displayLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[CNPropertyGroupSocialProfileItem profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayLabelForSocialProfile:forPropertyKey:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayStringForValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "displayStringForSocialProfile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)valueForDisplayString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNPropertyGroupSocialProfileItem profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 64)
  {
    objc_msgSend(v4, "substringFromIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUsername:", v7);

  }
  else
  {
    objc_msgSend(v6, "setUsername:", v4);
  }

  return v6;
}

- (id)editingStringValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNPropertyGroupSocialProfileItem profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[CNPropertyGroupSocialProfileItem profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    -[CNPropertyGroupSocialProfileItem displayStringForValue:](self, "displayStringForValue:", v6);
  else
    objc_msgSend(v6, "userIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNPropertyGroupSocialProfileItem;
  if (-[CNPropertyGroupItem isEquivalentToItem:](&v29, sel_isEquivalentToItem_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[CNPropertyGroupItem contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v5 = 0;
    }
    else
    {
      -[CNPropertyGroupSocialProfileItem profile](self, "profile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "profile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9 || !v11 || !objc_msgSend(v9, "isEqualToString:", v11))
        goto LABEL_17;
      -[CNPropertyGroupSocialProfileItem profile](self, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "username");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "username");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_11;
      if (v15)
      {
        v16 = objc_msgSend(v13, "isEqualToString:", v15);
      }
      else
      {
LABEL_11:
        -[CNPropertyGroupSocialProfileItem profile](self, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNPropertyGroupSocialProfileItem profile](self, "profile");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "userIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = 0;
        if (v18 && v20)
          v16 = objc_msgSend(v18, "isEqualToString:", v20);

      }
      if (v16)
      {
        v21 = 1;
      }
      else
      {
LABEL_17:
        -[CNPropertyGroupSocialProfileItem profile](self, "profile");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "urlString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "profile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "urlString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0;
        if (v23 && v25)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v26, "isEqual:", v27);

        }
      }

      v5 = v21 != 0;
    }
  }

  return v5;
}

+ (id)emptyValueForLabel:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C973E8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUrlString:username:userIdentifier:service:", &stru_1E20507A8, &stru_1E20507A8, &stru_1E20507A8, v4);

  return v5;
}

+ (id)displayLabelForSocialProfile:(id)a3 forPropertyKey:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D13848];
  objc_msgSend(v5, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "localizedStringForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C973E8];
    objc_msgSend(v5, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForService:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v5, "service");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v14;

  }
  return v9;
}

+ (id)displayStringForSocialProfile:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v3 = a3;
  v4 = *MEMORY[0x1E0D13848];
  objc_msgSend(v3, "displayname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v3, "userIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v9);

      if ((v10 & 1) != 0)
      {
        objc_msgSend(v3, "urlString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v11);

        if ((v12 & 1) != 0)
        {
          v13 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v3, "urlString");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "userIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(v3, "username");
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v3, "displayname");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (__CFString *)v14;
LABEL_11:
  if (((*(uint64_t (**)(uint64_t, __CFString *))(v4 + 16))(v4, v13) & 1) != 0)
  {
    v15 = v13;
    v13 = &stru_1E20507A8;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v3, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v15) & 1) != 0)
    goto LABEL_20;
  objc_msgSend(v3, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v16) & 1) != 0)
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v3, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "compare:options:", *MEMORY[0x1E0C97118], 1))
  {

    goto LABEL_19;
  }
  v18 = -[__CFString characterAtIndex:](v13, "characterAtIndex:", 0);

  if (v18 != 64)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "username");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("@%@"), v15);
    v16 = v13;
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_21:

  return v13;
}

@end
