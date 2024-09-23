@implementation FBSMutableSceneSettings(ExtensionKitAdditions)

- (void)ex_setRole:()ExtensionKitAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 20211529);

}

@end
