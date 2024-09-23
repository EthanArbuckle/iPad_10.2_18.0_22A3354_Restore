@implementation HFItem(AXPriv)

- (id)_axLatestResultForKey:()AXPriv
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "resultsContainRequiredProperties:", v5))
  {
    objc_msgSend(a1, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_axBadgeType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_axLatestResultForKey:", *MEMORY[0x24BE4CF50]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_axStatusItemCategory
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_axLatestResultForKey:", *MEMORY[0x24BE4CF70]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 4;

  return v3;
}

@end
