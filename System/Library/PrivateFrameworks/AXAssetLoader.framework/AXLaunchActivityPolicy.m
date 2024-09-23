@implementation AXLaunchActivityPolicy

- (AXLaunchActivityPolicy)initWithLaunchActivityIdentifier:(id)a3
{
  id v4;
  AXLaunchActivityPolicy *v5;
  AXLaunchActivityPolicy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXLaunchActivityPolicy;
  v5 = -[AXAssetPolicy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[AXAssetPolicy setLaunchActivityIdentifier:](v5, "setLaunchActivityIdentifier:", v4);

  return v6;
}

- (id)assetType
{
  return &stru_1E95D4460;
}

@end
