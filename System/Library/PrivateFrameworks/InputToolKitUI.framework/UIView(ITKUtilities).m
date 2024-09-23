@implementation UIView(ITKUtilities)

- (void)setItk_backgroundColor:()ITKUtilities
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setBackgroundColor:", v4);

}

- (uint64_t)setItk_userInteractionEnabled:()ITKUtilities
{
  return objc_msgSend(a1, "setUserInteractionEnabled:", 1);
}

- (uint64_t)itk_isFlipped
{
  return 1;
}

- (double)itk_backingScaleFactor
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (uint64_t)setItk_transform:()ITKUtilities
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "setTransform:", v5);
}

- (double)itk_safeAreaBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  objc_msgSend(a1, "safeAreaInsets");
  v5 = v4;
  if (itk_isiOS())
  {
    objc_msgSend(a1, "itk_viewPointRatioFromWindow");
    if (v6 != 1.0 && fabs(v6 + -1.0) >= 0.000000999999997)
      v5 = 0.0;
  }
  v7 = v3 + v5;
  if ((objc_msgSend(a1, "itk_isFlipped") & 1) == 0)
  {
    ITKFlipRect();
    return v8;
  }
  return v7;
}

- (uint64_t)itk_viewPointRatioFromWindow
{
  return objc_msgSend(a1, "itk_viewLengthFromWindowLength:", 1.0);
}

- (uint64_t)itk_windowPointRatioFromView
{
  return objc_msgSend(a1, "itk_windowLengthFromViewLength:", 1.0);
}

- (uint64_t)itk_setHidden:()ITKUtilities animated:
{
  uint64_t result;
  int v8;
  double v9;
  void *v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  char v14;

  result = objc_msgSend(a1, "isHidden");
  if ((_DWORD)result != (_DWORD)a3)
  {
    if (a4)
    {
      v8 = objc_msgSend(a1, "isHidden");
      v9 = 1.0;
      if (v8)
        v9 = 0.0;
      objc_msgSend(a1, "setItk_alpha:", v9);
      if ((a3 & 1) == 0)
        objc_msgSend(a1, "setHidden:", 0);
      v10 = (void *)MEMORY[0x24BEBDB00];
      objc_msgSend(MEMORY[0x24BEBDB00], "inheritedAnimationDuration");
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke;
      v13[3] = &unk_250FA0FE0;
      v13[4] = a1;
      v14 = a3;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __47__UIView_ITKUtilities__itk_setHidden_animated___block_invoke_2;
      v11[3] = &unk_250FA1008;
      v11[4] = a1;
      v12 = a3;
      return objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11);
    }
    else
    {
      return objc_msgSend(a1, "setHidden:", a3);
    }
  }
  return result;
}

- (BOOL)itk_configureToFillSuperView
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    objc_msgSend(a1, "setAutoresizingMask:", 18);
    objc_msgSend(a1, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(a1, "setFrame:");

  }
  return v2 != 0;
}

- (double)itk_viewLengthFromWindowLength:()ITKUtilities
{
  double v2;

  ITKRectWithSize();
  objc_msgSend(a1, "convertRect:fromView:", 0);
  return v2;
}

- (double)itk_windowLengthFromViewLength:()ITKUtilities
{
  double v2;

  ITKRectWithSize();
  objc_msgSend(a1, "convertRect:toView:", 0);
  return v2;
}

- (id)itk_autoFadeOutShapeRectLayer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itk_autoFadeOutShapeRectLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)itk_autoFadeOutShapePointLayer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "itk_autoFadeOutShapePointLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)itk_autoFadeOutLayerWithPath:()ITKUtilities
{
  return objc_msgSend(a1, "itk_autoFadeOutLayerWithPath:fadeOutDelay:", 1.0);
}

- (uint64_t)itk_autoFadeOutLayerWithQuad:()ITKUtilities
{
  return objc_msgSend(a1, "itk_autoFadeOutLayerWithQuad:fadeOutDelay:", 1.0);
}

- (id)itk_autoFadeOutLayerWithQuad:()ITKUtilities fadeOutDelay:
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itk_autoFadeOutLayerWithPath:fadeOutDelay:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)itk_autoFadeOutLayerWithPath:()ITKUtilities fadeOutDelay:
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDE5758];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "bounds");
  objc_msgSend(v6, "setFrame:");
  v7 = objc_msgSend(v5, "itk_CGPath");

  objc_msgSend(v6, "setPath:", v7);
  objc_msgSend(MEMORY[0x24BEBD4B8], "itk_randomColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v8, "CGColor"));

  objc_msgSend(v6, "setFillColor:", 0);
  objc_msgSend(v6, "setLineWidth:", 2.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", v6);

  v12 = v6;
  itk_dispatchMainAfterDelay();

  return v12;
}

- (id)itk_constraintsToFillView:()ITKUtilities
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = a1;
  v7 = v4;
  if (v7)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v6, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(v6, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v6, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((v2) != nil)", "-[UIView(ITKUtilities) itk_constraintsToFillView:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "v2");
  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

- (id)itk_renderImageFromViewBackingStoreWithSubrect:()ITKUtilities
{
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  objc_msgSend(MEMORY[0x24BEBD620], "defaultFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:format:", v10, a4, a5);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__UIView_ITKUtilities__itk_renderImageFromViewBackingStoreWithSubrect___block_invoke;
  v14[3] = &unk_250FA1058;
  v14[4] = a1;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  *(double *)&v14[8] = a5;
  objc_msgSend(v11, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)itk_renderImageFromViewBackingStore
{
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "itk_renderImageFromViewBackingStoreWithSubrect:");
}

- (id)itk_constraintsToFillLayoutGuide:()ITKUtilities
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = a1;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v7, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(v7, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v7, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((layoutGuide) != nil)", "-[UIView(ITKUtilities) itk_constraintsToFillLayoutGuide:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "layoutGuide");
  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

- (double)itk_roundRectToViewScale:()ITKUtilities
{
  void *v3;

  objc_msgSend(a1, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  return a2;
}

+ (uint64_t)itk_animateWithDuration:()ITKUtilities animations:
{
  return objc_msgSend(a1, "itk_animateWithDuration:animations:completion:", a3, 0);
}

- (NSString)summaryDescription
{
  CGRect v2;

  objc_msgSend(a1, "frame");
  return NSStringFromCGRect(v2);
}

@end
