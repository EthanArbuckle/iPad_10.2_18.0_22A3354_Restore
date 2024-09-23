@implementation HFServiceLikeTransformItem

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFServiceLikeTransformItem sourceServicePickerItem](self, "sourceServicePickerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFServiceLikeTransformItem sourceServicePickerItem](self, "sourceServicePickerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containsActions
{
  void *v2;
  char v3;

  -[HFServiceLikeTransformItem sourceServicePickerItem](self, "sourceServicePickerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsActions");

  return v3;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  void *v2;
  char v3;

  -[HFServiceLikeTransformItem sourceServicePickerItem](self, "sourceServicePickerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionsMayRequireDeviceUnlock");

  return v3;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFServiceLikeTransformItem sourceServicePickerItem](self, "sourceServicePickerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStateActionBuildersForHome:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
