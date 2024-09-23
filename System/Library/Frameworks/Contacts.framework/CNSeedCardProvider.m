@implementation CNSeedCardProvider

+ (id)nearestAvailableDataForCountryCode:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))()
    && (objc_msgSend(a1, "dataForCountryCode:", v4), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;

  }
  else
  {
    objc_msgSend(a1, "dataForCountryCode:", CFSTR("us"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)dataForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(CFSTR("AppleSeedCard-"), "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleWithSeedCards");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", v5, CFSTR("vcf"), CFSTR("AppleSeedCards"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dataForEveryCountry
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  objc_msgSend(a1, "bundleWithSeedCards");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForResourcesWithExtension:subdirectory:", CFSTR("vcf"), CFSTR("AppleSeedCards"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_cn_lazy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compactMap");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v5)[2](v5, &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __41__CNSeedCardProvider_dataForEveryCountry__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a2);
}

+ (id)bundleWithSeedCards
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
}

@end
