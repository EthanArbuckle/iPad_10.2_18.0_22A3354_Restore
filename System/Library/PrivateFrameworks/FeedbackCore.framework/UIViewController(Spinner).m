@implementation UIViewController(Spinner)

- (void)hideSpinner
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__UIViewController_Spinner__hideSpinner__block_invoke;
  aBlock[3] = &unk_24E156D78;
  aBlock[4] = a1;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(a1, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v2[2](v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperationWithBlock:", v2);

  }
}

- (void)resumeSpinnerWithStatus:()Spinner userInteractionEnabled:
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "Resuming toolbar activity indicator with status [%{public}@]", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(a1, "showSpinnerWithStatus:userInteractionEnabled:animated:", v6, a4, 0);
}

- (void)showSpinnerWithStatus:()Spinner userInteractionEnabled:
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "Showing toolbar activity indicator with status [%{public}@]", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(a1, "showSpinnerWithStatus:userInteractionEnabled:animated:", v6, a4, 1);
}

- (uint64_t)showToolbarWithStatus:()Spinner animated:
{
  return objc_msgSend(a1, "showToolbarWithSpinner:withStatusString:userInteractionEnabled:animated:", 0, a3, 1, a4);
}

- (uint64_t)showToolbarWithStatus:()Spinner subtitle:animated:
{
  return objc_msgSend(a1, "showToolbarWithSpinner:withStatusString:subtitleButtonString:userInteractionEnabled:animated:", 0, a3, a4, 1, a5);
}

- (uint64_t)showSpinnerWithStatus:()Spinner userInteractionEnabled:animated:
{
  return objc_msgSend(a1, "showToolbarWithSpinner:withStatusString:userInteractionEnabled:animated:", 1, a3, a4, a5);
}

- (uint64_t)showToolbarWithSpinner:()Spinner withStatusString:userInteractionEnabled:animated:
{
  return objc_msgSend(a1, "showToolbarWithSpinner:withStatusString:subtitleButtonString:userInteractionEnabled:animated:", a3, a4, 0, a5, a6);
}

- (void)showToolbarWithSpinner:()Spinner withStatusString:subtitleButtonString:userInteractionEnabled:animated:
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD);
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  unsigned int v41;
  id v42;
  _QWORD aBlock[5];
  char v44;
  _QWORD v45[2];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = v12;
    _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Showing toolbar activity indicator with status [%{public}@]", buf, 0xCu);
  }

  objc_msgSend(a1, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserInteractionEnabled:", a6);

  if (v12)
  {
    v41 = a7;
    v39 = a3;
    if (showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__onceToken != -1)
      dispatch_once(&showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__onceToken, &__block_literal_global_21);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BEBD708]);
    v18 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 0);
    objc_msgSend(v18, "setText:", v12);
    objc_msgSend(v18, "setFont:", v16);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

    v42 = v13;
    v40 = (void *)v16;
    if (v13)
    {
      v20 = objc_alloc_init(MEMORY[0x24BEBD708]);
      objc_msgSend(v20, "setAdjustsFontForContentSizeCategory:", 0);
      objc_msgSend(v20, "setText:", v13);
      objc_msgSend(v20, "setFont:", v16);
      objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextColor:", v21);

      v22 = objc_alloc(MEMORY[0x24BEBD978]);
      v45[0] = v18;
      v45[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v22, "initWithArrangedSubviews:", v23);

      objc_msgSend(v24, "setAxis:", 1);
      objc_msgSend(v24, "setAlignment:", 3);
      objc_msgSend(v24, "setDistribution:", 3);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", a1, sel_didTapSubtitleAction_);
      objc_msgSend(v24, "addGestureRecognizer:", v25);

      v26 = objc_msgSend(v24, "accessibilityTraits");
      objc_msgSend(v24, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00] | v26);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), v12, v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAccessibilityLabel:", v27);

      objc_msgSend(v24, "setIsAccessibilityElement:", 1);
    }
    else
    {
      v24 = v18;
    }
    if (v39)
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v28, "startAnimating");
      v29 = objc_alloc_init(MEMORY[0x24BEBD978]);
      objc_msgSend(v29, "setAxis:", 0);
      objc_msgSend(v29, "setSpacing:", 1.17549435e-38);
      objc_msgSend(v29, "setAlignment:", 3);
      objc_msgSend(v29, "addArrangedSubview:", v28);
      objc_msgSend(v29, "addArrangedSubview:", v24);
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v29);

    }
    else
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v24);
    }
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
    objc_msgSend(a1, "leftToolbarItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v31, "addObject:", v32);
    objc_msgSend(v31, "addObject:", showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__leftSpacing);
    objc_msgSend(v31, "addObject:", v30);
    objc_msgSend(v31, "addObject:", showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated__rightSpacing);
    objc_msgSend(a1, "composeFeedbackToolbarItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      objc_msgSend(v31, "addObject:", v33);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setToolbarItems:animated:", v34, v41);

    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __122__UIViewController_Spinner__showToolbarWithSpinner_withStatusString_subtitleButtonString_userInteractionEnabled_animated___block_invoke_2;
    aBlock[3] = &unk_24E158740;
    aBlock[4] = a1;
    v44 = v41;
    v35 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(a1, "viewIfLoaded");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "window");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v35[2](v35);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addOperationWithBlock:", v35);

    }
    v13 = v42;
  }

}

- (uint64_t)leftToolbarItem
{
  return 0;
}

- (void)updateNewFeedbackButtonState
{
  void *v2;
  id v3;

  objc_msgSend(a1, "toolbarItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((char *)objc_msgSend(v2, "action") == sel_createNewFeedback_)
  {
    objc_msgSend(v2, "setEnabled:", objc_msgSend(a1, "newFeedbackButtonState") == 2);
    objc_msgSend(a1, "setToolbarItems:animated:", v3, 0);
  }

}

- (uint64_t)newFeedbackButtonState
{
  return 0;
}

- (id)composeFeedbackToolbarItem
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = objc_msgSend(a1, "newFeedbackButtonState");
  if (!v2)
    return 0;
  v3 = v2;
  objc_msgSend(a1, "toolbarItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (char *)objc_msgSend(v5, "action") != sel_createNewFeedback_)
  {
    v7 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", CFSTR("bubble.and.pencil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithImage:style:target:action:", v8, 0, a1, sel_createNewFeedback_);

    v5 = (void *)v9;
  }
  objc_msgSend(v5, "setEnabled:", v3 == 2);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COMPOSE"), &stru_24E15EAF8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v11);

  return v5;
}

@end
