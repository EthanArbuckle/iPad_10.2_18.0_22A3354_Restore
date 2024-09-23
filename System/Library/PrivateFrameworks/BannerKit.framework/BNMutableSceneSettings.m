@implementation BNMutableSceneSettings

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

- (void)setContainerSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  void *v6;
  _QWORD v7[2];

  height = a3.height;
  width = a3.width;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v7 = width;
  *(CGFloat *)&v7[1] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{CGSize=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 501);

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

- (void)setPresentationSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v5;
  void *v6;
  _QWORD v7[2];

  height = a3.height;
  width = a3.width;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v7 = width;
  *(CGFloat *)&v7[1] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v7, "{CGSize=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 502);

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

- (void)setViewControllerAppearState:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 503);

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

- (void)setBannerAppearState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 504);

  if ((_DWORD)v3)
  {
    if ((_DWORD)v3 != 3)
      -[BNMutableSceneSettings setRevocationReason:](self, "setRevocationReason:", 0);
  }
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

- (void)setRevocationReason:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7
    && -[BNMutableSceneSettings bannerAppearState](self, "bannerAppearState") != 3
    && -[BNMutableSceneSettings bannerAppearState](self, "bannerAppearState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNSceneSettings.m"), 168, CFSTR("Attempting to set revocation reason when appearing or appeared."));

  }
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v7, 505);

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

- (void)setUserInteractionInProgress:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 506);

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

- (void)setClientContainerViewControllerClass:(Class)a3
{
  void *v4;
  id v5;

  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 507);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([BNSceneSettings alloc], "initWithSettings:", self);
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
