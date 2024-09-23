@implementation NSError(AXExtensions)

+ (id)ax_errorWithDomain:()AXExtensions description:
{
  objc_msgSend(a1, "ax_errorWithDomain:code:description:arguments:", a3, 0, a4, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ax_errorWithDomain:()AXExtensions code:description:
{
  objc_msgSend(a1, "ax_errorWithDomain:code:description:arguments:", a3, a4, a5, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ax_errorWithDomain:()AXExtensions code:description:arguments:
{
  id v10;
  objc_class *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a3;
  if (a5)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a5;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, a6);

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0C99D80]);
      a5 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB2D50], 0);
    }
    else
    {
      a5 = 0;
    }

  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, a4, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)ax_nonRedundantDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Domain:%@ Code:%@ Reason:%@"), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
