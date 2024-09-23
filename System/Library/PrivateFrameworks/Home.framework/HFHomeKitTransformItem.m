@implementation HFHomeKitTransformItem

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFHomeKitTransformItem sourceHomeKitItem](self, "sourceHomeKitItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  -[HFHomeKitTransformItem sourceHomeKitItem](self, "sourceHomeKitItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F0A28))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

@end
