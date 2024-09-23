@implementation LNConnectionPolicyEffectiveBundleIdentifiers

uint64_t __LNConnectionPolicyEffectiveBundleIdentifiers_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferredBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "preferredBundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

BOOL __LNConnectionPolicyEffectiveBundleIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

BOOL __LNConnectionPolicyEffectiveBundleIdentifiers_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 3;
}

BOOL __LNConnectionPolicyEffectiveBundleIdentifiers_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

@end
