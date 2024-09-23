@implementation CNPropertyGroupInstantMessageItem

- (CNInstantMessageAddress)imAddress
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNInstantMessageAddress *)v3;
}

- (id)defaultActionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "compare:options:", *MEMORY[0x1E0C96910], 1))
  {
    if (objc_msgSend(v4, "compare:options:", *MEMORY[0x1E0C96930], 1))
    {
      v9 = 0;
LABEL_13:
      v10 = 0;
      goto LABEL_14;
    }
    v11 = objc_msgSend(v6, "length");
    if (v11 <= objc_msgSend(CFSTR("chat.facebook.com"), "length"))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - objc_msgSend(CFSTR("chat.facebook.com"), "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && objc_msgSend(v12, "isEqualToString:", CFSTR("chat.facebook.com")))
      {
        objc_msgSend(v8, "substringToIndex:", objc_msgSend(CFSTR("chat.facebook.com"), "length") - objc_msgSend(CFSTR("%40"), "length"));
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://m.facebook.com/compose_message?uid=%@"), v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)v14;
        goto LABEL_12;
      }
    }
    v9 = 0;
LABEL_12:

    if (!v9)
      goto LABEL_13;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://m.facebook.com/compose_message?uid=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_13;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v15 = v10;

  return v15;
}

- (id)displayLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = *MEMORY[0x1E0D13848];
  -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C97200];
    -[CNPropertyGroupItem property](self, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ IM_SERVICE_NAME"), v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v7, v14, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)displayStringForValue:(id)a3
{
  return (id)objc_msgSend(a3, "username");
}

- (id)valueForDisplayString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setUsername:", v4);
  return v6;
}

- (id)editingStringValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4;
  char v5;
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
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNPropertyGroupInstantMessageItem;
  if (-[CNPropertyGroupItem isEquivalentToItem:](&v17, sel_isEquivalentToItem_, v4))
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
      -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "imAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      if (v9 && v11)
      {
        if (objc_msgSend(v9, "isEqualToString:", v11))
        {
          -[CNPropertyGroupInstantMessageItem imAddress](self, "imAddress");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "username");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "imAddress");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = objc_msgSend(v13, "isEqualToString:", v15);
        }
        else
        {
          v5 = 0;
        }
      }

    }
  }

  return v5;
}

+ (id)emptyValueForLabel:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C97330];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUsername:service:", &stru_1E20507A8, v4);

  return v5;
}

@end
