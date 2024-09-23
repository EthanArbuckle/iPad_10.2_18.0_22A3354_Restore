@implementation HMMediaProfile(AccessoryLikeObjectDataSource)

- (id)hf_rootAccessoryLikeHomeKitObject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_mediaSystemForAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "hf_rootAccessoryLikeHomeKitObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a1;
  }
  v7 = v6;

  return v7;
}

@end
