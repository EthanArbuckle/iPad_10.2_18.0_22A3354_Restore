@implementation LAKeyIdentifier

+ (id)defaultAccessKeyIdentifierForRightWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:akey"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_identifierWithSuffix:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Identifier cannot be empty"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.LocalAuthentication:Authorization:%@"), v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultSecretIdentifierForRightWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:genp"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)domainForRightWithIdentifier:(id)a3
{
  return +[LAKeyIdentifier _identifierWithSuffix:]((uint64_t)a1, a3);
}

+ (uint64_t)_identifierHasCorrectFormat:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3
      && (objc_msgSend(v6, "objectAtIndexedSubscript:", 0),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.LocalAuthentication")),
          v7,
          v8))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Authorization"));

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
