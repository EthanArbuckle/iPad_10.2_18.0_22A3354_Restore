@implementation EFIsRunningUnitTests

void __EFIsRunningUnitTests_block_invoke()
{
  id v0;

  if (NSClassFromString(CFSTR("XCTestCase")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    EFIsRunningUnitTests_result = objc_msgSend(v0, "ef_any:", &__block_literal_global_3_2);

  }
}

uint64_t __EFIsRunningUnitTests_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CFBundlePackageType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("BNDL"));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_11_0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __EFIsRunningUnitTests_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSuffix:", CFSTR("Tests"));
}

@end
