@implementation NSURL(AppleAccount)

+ (id)aa_URLWithEndpoint:()AppleAccount
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+AppleAccount.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v13[0] = CFSTR("endpoint");
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v9, "setPath:", v8);
  objc_msgSend(v9, "setScheme:", CFSTR("x-appleaccount"));
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)aa_endpoint
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_2);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v3, "count") <= (unint64_t)(v4 + 1))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
