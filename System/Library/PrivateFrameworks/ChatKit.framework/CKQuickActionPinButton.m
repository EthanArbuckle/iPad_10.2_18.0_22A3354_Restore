@implementation CKQuickActionPinButton

- (double)animationDurationForState:(unint64_t)a3
{
  double result;

  result = 0.05;
  if (a3 != 2)
    result = 0.0;
  if (a3 == 3)
    return 0.15;
  return result;
}

- (id)buttonImageForState:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 < 3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickPinButtonImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    return v4;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("pin"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 16.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithSymbolConfiguration:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v4 = 0;
  return v4;
}

- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3
{
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

  if (a3 > 2)
  {
    v5 = *MEMORY[0x1E0CEB4B0];
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v9 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickActionPinButtonImageInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
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

@end
