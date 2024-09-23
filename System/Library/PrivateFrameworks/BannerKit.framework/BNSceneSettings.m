@implementation BNSceneSettings

- (CGSize)containerSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 501);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)presentationSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 502);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int)viewControllerAppearState
{
  void *v2;
  void *v3;
  int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 503);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int)bannerAppearState
{
  void *v2;
  void *v3;
  int v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 504);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSString)revocationReason
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 505);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isUserInteractionInProgress
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 506);

  return v3;
}

- (Class)clientContainerViewControllerClass
{
  void *v2;
  NSString *v3;
  void *v4;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 507);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([BNMutableSceneSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 500 > 7)
    return 0;
  else
    return off_1E70441E0[a3 - 500];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  switch(a5)
  {
    case 0x1F4uLL:
    case 0x1F5uLL:
    case 0x1F6uLL:
      objc_msgSend(v6, "description");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0x1F7uLL:
    case 0x1F8uLL:
      BNStringForAppearState(objc_msgSend(v6, "integerValue"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0x1F9uLL:
    case 0x1FBuLL:
      v8 = v6;
      goto LABEL_7;
    case 0x1FAuLL:
      BSSettingFlagDescription();
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

@end
