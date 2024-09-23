@implementation CRSUIClimateOverlaySceneClientSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CRSUIMutableClimateOverlaySceneClientSettings alloc], "initWithSettings:", self);
}

- (UIEdgeInsets)stepperInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2075632724);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "UIEdgeInsetsValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (NSArray)presentedPopoverFrames
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2368053444);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
