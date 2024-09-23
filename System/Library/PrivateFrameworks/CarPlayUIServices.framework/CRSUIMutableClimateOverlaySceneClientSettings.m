@implementation CRSUIMutableClimateOverlaySceneClientSettings

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CRSUIClimateOverlaySceneClientSettings alloc], "initWithSettings:", self);
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

- (void)setStepperInsets:(UIEdgeInsets)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 2075632724);

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

- (void)setPresentedPopoverFrames:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 2368053444);

}

@end
