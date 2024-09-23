@implementation NUDeepLinkURLModifier

- (id)modifyURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    v3 = (void *)objc_msgSend(a3, "copy");
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLOverrideForURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationsAvailableForOpeningURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = objc_msgSend(v5, "copy");

      v3 = (void *)v9;
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
