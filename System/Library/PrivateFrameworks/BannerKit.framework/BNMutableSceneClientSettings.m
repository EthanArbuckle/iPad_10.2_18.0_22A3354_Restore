@implementation BNMutableSceneClientSettings

- (CGSize)preferredContentSize
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

- (void)setPreferredContentSize:(CGSize)a3
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

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 502);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setPreferredBackgroundActivitiesToSuppress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 502);

}

- (UIEdgeInsets)bannerContentOutsets
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
  objc_msgSend(v2, "objectForSetting:", 503);
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

- (void)setBannerContentOutsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  void *v7;
  void *v8;
  _QWORD v9[4];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[FBSSettings otherSettings](self, "otherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v9, "{UIEdgeInsets=dddd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 503);

}

- (BOOL)isDraggingDismissalEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 504);

  return v3;
}

- (void)setDraggingDismissalEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 504);

}

- (BOOL)isDraggingInteractionEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 505);

  return v3;
}

- (void)setDraggingInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 505);

}

- (BOOL)isTouchOutsideDismissalEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 506);

  return v3;
}

- (void)setTouchOutsideDismissalEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 506);

}

- (BOOL)isPanGestureProxySupported
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 507);

  return v3;
}

- (void)setPanGestureProxySupported:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 507);

}

- (BOOL)isClippingEnabled
{
  void *v2;
  char v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 508);

  return v3;
}

- (void)setClippingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlag:forSetting:", v3, 508);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([BNSceneClientSettings alloc], "initWithSettings:", self);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 500 > 7)
    return 0;
  else
    return off_1E7044398[a3 - 500];
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 - 504 >= 5)
  {
    if (a5 - 500 > 3)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v6, "description");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BSSettingFlagDescription();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_6:

  return v9;
}

@end
