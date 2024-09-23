@implementation NTPBPublisherPaidDescriptionStrings(FCAdditions)

+ (id)publisherPaidDescriptionStringsFromJSON:()FCAdditions
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    v1 = objc_alloc_init(MEMORY[0x1E0D627B0]);
    objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("paywallDescription"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("channelPaywall"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("promotionalPaywall"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("leakyPaywall"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("hardPaywall"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v4)
        v9 = 0;
      else
        v9 = v5 == 0;
      if (!v9 || v6 != 0 || v7 != 0)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0D62758]);
        objc_msgSend(v12, "setChannelPaywall:", v4);
        objc_msgSend(v12, "setPromotionalPaywall:", v5);
        objc_msgSend(v12, "setLeakyPaywall:", v6);
        objc_msgSend(v12, "setHardPaywall:", v8);
        objc_msgSend(v1, "setPaywallDescription:", v12);

      }
    }

  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
