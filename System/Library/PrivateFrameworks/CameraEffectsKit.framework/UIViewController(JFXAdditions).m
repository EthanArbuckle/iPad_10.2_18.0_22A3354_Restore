@implementation UIViewController(JFXAdditions)

- (double)jfxDisplayScale
{
  void *v1;
  double v2;
  double v3;
  void *v4;
  double v5;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = v2;

  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v3 = v5;

  }
  return v3;
}

- (void)jfxAddChildViewController:()JFXAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "jfxAddChildViewController:containerView:", v4, v5);

}

- (uint64_t)jfxAddChildViewController:()JFXAdditions containerView:
{
  return objc_msgSend(a1, "jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:", a3, a4, 0, 0);
}

- (void)jfxAddChildViewController:()JFXAdditions constrainRelativeToSafeAreas:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:", v6, v7, 1, a4);

}

- (id)jfxAddChildViewControllerFromStoryboard:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 1)
  {
    v14 = (void *)MEMORY[0x24BDF6E00];
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("-ipad"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storyboardWithName:bundle:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDF6E00], "storyboardWithName:bundle:", v10, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
LABEL_4:
    objc_msgSend(v16, "instantiateInitialViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "jfxAddChildViewController:containerView:constrainToContainer:relativeToSafeArea:", v17, v11, a5, a6);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)jfxAddChildViewController:()JFXAdditions containerView:constrainToContainer:relativeToSafeArea:
{
  void *v6;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[16];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (v11 && v12)
  {
    objc_msgSend(v11, "view");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addChildViewController:", v11);
    objc_msgSend(v13, "addSubview:", v14);
    if (a5)
    {
      -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v15 = (void *)MEMORY[0x24BDD1628];
      -[NSObject leftAnchor](v14, "leftAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v15;
      if (a6)
      {
        objc_msgSend(v13, "safeAreaLayoutGuide");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "leftAnchor");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "leftAnchor");
        v18 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v18;
      }
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v40 = objc_claimAutoreleasedReturnValue();
      v49[0] = v40;
      -[NSObject rightAnchor](v14, "rightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        objc_msgSend(v13, "safeAreaLayoutGuide");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rightAnchor");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "rightAnchor");
        v20 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v20;
      }
      v36 = (void *)v20;
      v37 = v6;
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v38 = objc_claimAutoreleasedReturnValue();
      v49[1] = v38;
      -[NSObject topAnchor](v14, "topAnchor");
      v45 = (void *)v18;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v19;
      if (a6)
      {
        objc_msgSend(v13, "safeAreaLayoutGuide");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "topAnchor");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "topAnchor");
        v21 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v21;
      }
      v35 = (void *)v21;
      objc_msgSend(v46, "constraintEqualToAnchor:", v21);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2] = v39;
      -[NSObject bottomAnchor](v14, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = a1;
      v43 = v17;
      v44 = v16;
      if (a6)
      {
        objc_msgSend(v13, "safeAreaLayoutGuide");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bottomAnchor");
      }
      else
      {
        objc_msgSend(v13, "bottomAnchor");
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v49[3] = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "activateConstraints:", v25);

      if (a6)
      {

        v27 = v46;
        v26 = v19;
        v28 = v37;
        v29 = (void *)v38;
        a1 = v41;
        v47 = (void *)v40;
        v22 = v32;
        v30 = v35;
        v31 = v36;
      }
      else
      {
        v30 = v23;
        v31 = v46;
        v28 = (void *)v38;
        v27 = v39;
        a1 = v41;
        v45 = (void *)v40;
        v29 = v33;
        v26 = v34;
      }

    }
    objc_msgSend(v11, "didMoveToParentViewController:", a1);
  }
  else
  {
    JFXLog_viewerUI();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2269A9000, v14, OS_LOG_TYPE_DEFAULT, "Error trying to add a View Controller into a container view", buf, 2u);
    }
  }

}

- (uint64_t)jfxRemoveFromParentViewController
{
  void *v2;

  objc_msgSend(a1, "willMoveToParentViewController:", 0);
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(a1, "removeFromParentViewController");
}

- (double)jfxCenterAdjustedForOrientationForPortraitFrame:()JFXAdditions relativeToParentFrame:withOrientation:
{
  double v19;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if ((unint64_t)(a11 - 3) > 1)
  {
    v19 = a1 + CGRectGetWidth(*(CGRect *)&a1) * 0.5;
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    CGRectGetHeight(v24);
  }
  else
  {
    v19 = a2 + CGRectGetHeight(*(CGRect *)&a1) * 0.5;
    if (a11 == 4)
    {
      v22.origin.x = a5;
      v22.origin.y = a6;
      v22.size.width = a7;
      v22.size.height = a8;
      v19 = CGRectGetWidth(v22) - v19;
    }
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetWidth(v23);
  }
  return v19;
}

+ (id)jfxTopmostPresentedController
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

@end
