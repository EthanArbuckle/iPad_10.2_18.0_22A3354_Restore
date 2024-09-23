@implementation HMLocationEvent(HFAdditions)

+ (uint64_t)hf_locationEventTypeForRegion:()HFAdditions
{
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "notifyOnEntry"))
    return 1;
  return 2;
}

- (uint64_t)hf_eventType
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_locationEventTypeForRegion:", v3);

  return v4;
}

+ (void)hf_isRegion:()HFAdditions atHome:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      v10 = (void *)objc_msgSend(v9, "containsCoordinate:");

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_isRegionAtHome:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hf_isRegion:atHome:", v6, v4);

  return v7;
}

@end
