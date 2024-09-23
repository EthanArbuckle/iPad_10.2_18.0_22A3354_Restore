@implementation FBSMutableSceneClientSettings(BacklightServices)

- (void)bls_setSupportsAlwaysOn:()BacklightServices
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 200001);

}

- (void)bls_setHasDelegate:()BacklightServices
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 200000);

}

- (void)bls_setOptsOutOfProcessAssertions:()BacklightServices
{
  id v1;

  objc_msgSend(a1, "otherSettings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFlag:forSetting:", BSSettingFlagForBool(), 200002);

}

@end
