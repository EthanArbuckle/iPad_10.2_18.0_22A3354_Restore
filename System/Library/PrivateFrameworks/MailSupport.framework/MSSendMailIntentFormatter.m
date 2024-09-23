@implementation MSSendMailIntentFormatter

- (id)stringForObjectValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "to");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "to");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSSendMailIntentFormatter _stringForAddresses:](self, "_stringForAddresses:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "cc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        objc_msgSend(v5, "cc");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSSendMailIntentFormatter _stringForAddresses:](self, "_stringForAddresses:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "bcc");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
        {
          -[MSSendMailIntentFormatter _stringForAddresses:](self, "_stringForAddresses:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        objc_msgSend(v5, "bcc");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSSendMailIntentFormatter _stringForAddresses:](self, "_stringForAddresses:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
    v10 = (void *)v9;

LABEL_10:
    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)_stringForAddresses:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    _EFLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deferredLocalizedIntentsStringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    _EFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deferredLocalizedIntentsStringWithFormat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
