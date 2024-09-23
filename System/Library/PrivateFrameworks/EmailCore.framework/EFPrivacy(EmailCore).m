@implementation EFPrivacy(EmailCore)

+ (id)ec_redactedStringForMailboxURL:()EmailCore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_redactedMailboxPathForMailboxPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v9, "setScheme:", v5);
  objc_msgSend(v9, "setHost:", v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", v10);

  objc_msgSend(v4, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "partiallyRedactedStringForString:maximumUnredactedLength:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v9, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@%@"), v14, v12);

  return v15;
}

+ (id)_redactedMailboxPathForMailboxPath:()EmailCore
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "_isWellKnownMailboxName:", v4))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (uint64_t)_isWellKnownMailboxName:()EmailCore
{
  return objc_msgSend(a3, "ef_caseInsensitiveIsEqualToString:", CFSTR("INBOX"));
}

+ (id)ec_partiallyRedactedStringForSubjectOrSummary:()EmailCore
{
  objc_msgSend(a1, "partiallyRedactedStringForString:maximumUnredactedLength:", a3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)ec_partiallyRedactedStringForAddress:()EmailCore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v4 = a3;
  objc_msgSend(v4, "emailAddressValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localPart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ec_partiallyRedactedStringForAddress:localPart:domain:", v6, v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "partiallyRedactedStringForString:", v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("NULL");
    }
  }

  return v9;
}

+ (id)ec_partiallyRedactedStringForAddress:()EmailCore localPart:domain:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length"))
  {
    v10 = objc_msgSend(v7, "length");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F088]), "initWithString:", v7);
    if (objc_msgSend(v8, "length"))
    {
      v12 = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", 0);
      objc_msgSend(v8, "substringToIndex:", v12 + v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = &stru_1E7123500;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    objc_msgSend(v9, "substringToIndex:", v17 + v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "redactedStringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("\"%@...@%@...\"<%lu chars, hash=%@>"), v14, v19, v10, v20);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v7;
  }

  return v15;
}

@end
