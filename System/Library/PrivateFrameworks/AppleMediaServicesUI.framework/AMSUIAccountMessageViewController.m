@implementation AMSUIAccountMessageViewController

- (AMSUIAccountMessageViewController)initWithRequest:(id)a3
{
  id v4;
  AMSUIAccountMessageViewController *v5;
  AMSUIAccountMessageViewController *v6;
  AMSUIAccountMessageAppearance *v7;
  AMSUIAccountMessageAppearance *preferredAppearance;
  AMSUIAccountMessageAppearance *v9;
  void *v10;
  uint64_t v11;
  AMSUIAccountMessageAppearance *requestAppearance;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSUIAccountMessageViewController;
  v5 = -[AMSUIBaseMessageViewController initWithRequest:](&v14, sel_initWithRequest_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_didAnimateFirstImpression = 0;
    v7 = objc_alloc_init(AMSUIAccountMessageAppearance);
    preferredAppearance = v6->_preferredAppearance;
    v6->_preferredAppearance = v7;

    v9 = [AMSUIAccountMessageAppearance alloc];
    objc_msgSend(v4, "appearanceInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSUIAccountMessageAppearance initWithDictionary:](v9, "initWithDictionary:", v10);
    requestAppearance = v6->_requestAppearance;
    v6->_requestAppearance = (AMSUIAccountMessageAppearance *)v11;

  }
  return v6;
}

- (AMSUIAccountMessageViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIAccountMessageViewController;
  return -[AMSUIBaseMessageViewController initWithRequest:bag:account:](&v6, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIAccountMessageViewController;
  -[AMSUIAccountMessageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!-[AMSUIAccountMessageViewController didAnimateFirstImpression](self, "didAnimateFirstImpression"))
    -[AMSUIAccountMessageViewController _prepareAnimationLaunch](self, "_prepareAnimationLaunch");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIAccountMessageViewController;
  -[AMSUIBaseMessageViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!-[AMSUIAccountMessageViewController didAnimateFirstImpression](self, "didAnimateFirstImpression"))
    -[AMSUIAccountMessageViewController _commitAnimationLaunch](self, "_commitAnimationLaunch");
}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AMSUIAccountMessageViewController;
  -[AMSUIBaseMessageViewController _setDialogRequest:](&v28, sel__setDialogRequest_, v4);
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "buttonActions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (!v8)
  {
    v9 = 0;
    goto LABEL_24;
  }
  v22 = v6;
  v23 = v5;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      if (v11 || objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "style") != 2)
      {
        if (v10)
        {
          if (v9)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v16, "OSLogObject", v22, v23);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v30 = v18;
              v19 = v18;
              _os_log_impl(&dword_211102000, v17, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);

            }
            goto LABEL_21;
          }
          v9 = v14;
        }
        else
        {
          v10 = v14;
        }
      }
      else
      {
        v11 = v14;
      }
      v15 = v14;
    }
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v8)
      continue;
    break;
  }
LABEL_21:

  if (v11)
  {
    v7 = v10;

    v8 = v11;
    v9 = v7;
    v6 = v22;
    v5 = v23;
LABEL_24:

    v10 = v8;
    goto LABEL_26;
  }
  v8 = 0;
  v6 = v22;
  v5 = v23;
LABEL_26:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v22, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v9)
    objc_msgSend(v20, "addObject:", v9);
  if (v6)
    objc_msgSend(v5, "setBodyDialogAction:target:action:", v6, self, sel__didTapActionButton_);
  if (v10)
    objc_msgSend(v5, "setAccessoryViewForDialogAction:target:action:", v10, self, sel__didTapActionButton_);
  if (objc_msgSend(v21, "count"))
    objc_msgSend(v5, "setFooterForDialogActions:target:action:", v21, self, sel__didTapActionButton_);

}

- (void)_prepareAnimationLaunch
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  if (-[AMSUIAccountMessageViewController _impressionAnimationStyle](self, "_impressionAnimationStyle") != -1)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = 0;
      objc_msgSend(v5, "setOpacity:", v6);

    }
    else
    {
      v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v15.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v15.c = v7;
      *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformScale(&v16, &v15, 0.25, 0.25);
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      objc_msgSend(v4, "setTransform:", &v14);
    }

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setOpacity:", v11);

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "footerButtonViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

  }
}

void __60__AMSUIAccountMessageViewController__prepareAnimationLaunch__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 0;
  objc_msgSend(v3, "setOpacity:", v2);

}

- (void)_commitAnimationLaunch
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];

  if (-[AMSUIAccountMessageViewController _impressionAnimationStyle](self, "_impressionAnimationStyle") != -1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD970]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 65.0, 12.0, 0.0, 0.0);
    objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("keyPath"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMass:", 1.0);
    objc_msgSend(v4, "setStiffness:", 65.0);
    objc_msgSend(v4, "setDamping:", 12.0);
    objc_msgSend(v4, "setInitialVelocity:", 0.0);
    v5 = objc_alloc(MEMORY[0x24BDE56F0]);
    LODWORD(v6) = 1036831949;
    LODWORD(v7) = 0;
    LODWORD(v8) = 1.0;
    LODWORD(v9) = 1.0;
    v10 = (void *)objc_msgSend(v5, "initWithControlPoints::::", v6, v7, v8, v9);
    objc_msgSend(v4, "setTimingFunction:", v10);

    objc_msgSend(v4, "settlingDuration");
    objc_msgSend(v4, "setDuration:");
    v11 = objc_alloc(MEMORY[0x24BEBDB20]);
    objc_msgSend(v4, "settlingDuration");
    v12 = (void *)objc_msgSend(v11, "initWithDuration:timingParameters:", v3);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke;
    v13[3] = &unk_24CB4F0E8;
    v13[4] = self;
    objc_msgSend(v12, "addAnimations:", v13);
    objc_msgSend(v12, "startAnimation");
    -[AMSUIAccountMessageViewController setDidAnimateFirstImpression:](self, "setDidAnimateFirstImpression:", 1);

  }
}

void __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke(uint64_t a1)
{
  _BOOL4 IsReduceMotionEnabled;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  _OWORD v15[3];

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsReduceMotionEnabled)
  {
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setOpacity:", v7);

  }
  else
  {
    v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v15[0] = *MEMORY[0x24BDBD8B8];
    v15[1] = v8;
    v15[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v4, "setTransform:", v15);
  }

  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1.0;
  objc_msgSend(v11, "setOpacity:", v12);

  objc_msgSend(*(id *)(a1 + 32), "_messageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footerButtonViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_18);

}

void __59__AMSUIAccountMessageViewController__commitAnimationLaunch__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  objc_msgSend(a2, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  objc_msgSend(v3, "setOpacity:", v2);

}

- (int64_t)_impressionAnimationStyle
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "impressionAnimationStyle"),
        v5,
        v4,
        v6 == -1))
  {
    v8 = -1;
  }
  else
  {
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "impressionAnimationStyle");

  }
  -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "impressionAnimationStyle");

  if (v10 != -1)
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "impressionAnimationStyle");

  }
  return v8;
}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_messageFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_messageFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "messageFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_messageTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_titleFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_titleFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_titleTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)_primaryImageRenderingMode
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryImageRenderingMode");

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryImageRenderingMode");

  if (v6)
  {
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "primaryImageRenderingMode");

  }
  return v4;
}

- (void)_commitAppearance
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)AMSUIAccountMessageViewController;
  -[AMSUIBaseMessageViewController _commitAppearance](&v57, sel__commitAppearance);
  -[AMSUIAccountMessageViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryButtonColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v7 && v11)
    objc_msgSend(v7, "setPreferredForegroundColor:", v11);
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessoryButtonFont");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;

  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_15;
  }
  objc_msgSend(v7, "setPreferredFont:", v14);

LABEL_15:
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageStyle");

  if (v16)
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  else
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageStyle:", objc_msgSend(v17, "imageStyle"));

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backgroundColor");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;

  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_22;
  }
  objc_msgSend(v5, "setBackgroundColor:", v20);

LABEL_22:
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "backgroundImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "backgroundImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v23);

  if (!v22)
  {

  }
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "footerButtonColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    v28 = v26;
  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "footerButtonColor");
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "footerButtonFont");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v52 = v7;
  if (v31)
  {
    v33 = v31;
  }
  else
  {
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "footerButtonFont");
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  v35 = v11;

  objc_msgSend(v5, "footerButtonViews");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v37 = v36;
  else
    v37 = 0;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = v37;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (v28)
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "setPreferredForegroundColor:", v28);
        if (v33)
          objc_msgSend(v43, "setPreferredFont:", v33);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v40);
  }

  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "imageTintColor");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;

LABEL_49:
    objc_msgSend(v5, "setIconColor:", v46);

    goto LABEL_50;
  }
  -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "imageTintColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    goto LABEL_49;
LABEL_50:
  -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "ams_imageWithRenderingMode:", -[AMSUIAccountMessageViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setImage:", v50);

  }
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  objc_msgSend(v52, "commitAppearance");

}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = 1;
  -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconAnimationPlayCount");

    if (v7 != -90)
    {
      -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "iconAnimationPlayCount");

    }
  }
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iconAnimationPlayCount");

    if (v12 != -90)
    {
      -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "iconAnimationPlayCount");

    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  -[AMSUIAccountMessageViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 5)
    v4 = 2;
  else
    v4 = 3;
  v5 = (_QWORD *)MEMORY[0x24BEBE250];
  if (v3 != 5)
    v5 = (_QWORD *)MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_effectiveImageSymbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AMSUIAccountMessageViewController _defaultPreferredImageSymbolConfiguration](self, "_defaultPreferredImageSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIAccountMessageViewController preferredAppearance](self, "preferredAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIAccountMessageViewController requestAppearance](self, "requestAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_messageStyle
{
  return 0;
}

- (AMSUIAccountMessageAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  -[AMSUIAccountMessageViewController _commitAppearance](self, "_commitAppearance");
}

- (BOOL)didAnimateFirstImpression
{
  return self->_didAnimateFirstImpression;
}

- (void)setDidAnimateFirstImpression:(BOOL)a3
{
  self->_didAnimateFirstImpression = a3;
}

- (AMSUIAccountMessageAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_requestAppearance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
}

@end
