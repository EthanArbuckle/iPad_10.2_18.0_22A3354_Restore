@implementation QLDetailItemViewController

- (QLDetailItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  QLDetailItemViewController *v6;
  objc_super v8;

  QLFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)QLDetailItemViewController;
  v6 = -[QLDetailItemViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, CFSTR("QLDetailItemViewController"), v5);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLDetailItemViewController;
  -[QLDetailItemViewController viewDidLoad](&v9, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetailItemViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetailItemViewController _scalableSystemFontOfSize:](self, "_scalableSystemFontOfSize:", 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[UIButton titleLabel](self->_actionButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

  -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", &stru_24C72A1F8, 0);
  -[QLFileIconImageView superview](self->_filePreviewImageView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", self->_filePreviewImageView);

}

- (void)setState:(id)a3
{
  -[QLDetailItemViewController setState:animated:](self, "setState:animated:", a3, 0);
}

- (void)setState:(id)a3 animated:(BOOL)a4
{
  QLDetailItemViewControllerState *v6;
  QLDetailItemViewControllerState *v7;

  v6 = (QLDetailItemViewControllerState *)a3;
  if (self->_state != v6)
  {
    -[QLDetailItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    objc_storeStrong((id *)&self->_state, a3);
    v7 = v6;
    QLRunInMainThread();

  }
}

void __48__QLDetailItemViewController_setState_animated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "actionButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "actionButtonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setActionButtonView:animated:actionButtonLabel:informationVisible:", v5, v3, v4, objc_msgSend(*(id *)(a1 + 40), "isInformationVisible"));

}

- (void)setInformation:(id)a3
{
  objc_storeStrong((id *)&self->_information, a3);
  -[QLDetailItemViewController _updateInformation](self, "_updateInformation");
}

- (void)_updateInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSString *previewTitle;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[QLDetailItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UIStackView arrangedSubviews](self->_informationStackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }
  if (self->_previewTitle)
  {
    previewTitle = self->_previewTitle;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &previewTitle, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", self->_information);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self->_information;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__QLDetailItemViewController__updateInformation__block_invoke;
  v10[3] = &unk_24C726648;
  v10[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v10);

}

void __48__QLDetailItemViewController__updateInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = (id)objc_opt_new();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v6);

    objc_msgSend(v9, "setLineBreakMode:", 5);
    objc_msgSend(v9, "setText:", v5);

    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_scalableSystemFontOfSize:", 17.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v7);

    objc_msgSend(v9, "setLineBreakMode:", 5);
    objc_msgSend(v9, "setText:", v5);

    objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "addArrangedSubview:", v9);
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *previewTitle;
  void *v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD))a5;
  v8 = a4;
  -[QLDetailItemViewController setInformation:](self, "setInformation:", MEMORY[0x24BDBD1A8]);
  QLCGSizeFromQLItemThumbnailSize();
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "thumbnailGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "genericIconWithSize:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLFileIconImageView setImage:](self->_filePreviewImageView, "setImage:", v14);
  objc_msgSend(v8, "thumbnailGenerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v22[3] = &unk_24C725678;
  v22[4] = self;
  objc_msgSend(v15, "generateThumbnailWithSize:completionBlock:", v22, v10, v12);

  objc_msgSend(v8, "previewTitle");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  previewTitle = self->_previewTitle;
  self->_previewTitle = v16;

  objc_msgSend(v8, "itemSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v18, "longLongValue"), 0);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = &stru_24C72A1F8;
  if (v19 && objc_msgSend(v18, "integerValue") > 0)
    v20 = v19;
  v23[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetailItemViewController setInformation:](self, "setInformation:", v21);

  if (v7)
    v7[2](v7, 0);

}

void __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a2;
  v5 = v4;
  if (a3)
  {
    v6 = v4;
    QLRunInMainThread();

  }
}

void __90__QLDetailItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.17);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v6, "CGColor");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLDetailItemViewController;
  v6 = a3;
  -[QLItemViewController setAppearance:animated:](&v8, sel_setAppearance_animated_, v6, v4);
  v7 = objc_msgSend(v6, "presentationMode", v8.receiver, v8.super_class);

  -[UIButton setHidden:](self->_actionButton, "setHidden:", v7 == 4);
}

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  UIView *v13;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  __int128 v17;
  double MidX;
  uint64_t v19;
  id v20;
  id v21;
  UIView *v22;
  void (**v23)(_QWORD);
  void (**v24)(void *, uint64_t);
  _QWORD v25[5];
  _QWORD aBlock[4];
  UIView *v27;
  id v28;
  QLDetailItemViewController *v29;
  id v30;
  CGAffineTransform v31;
  BOOL v32;
  _OWORD v33[3];
  CGAffineTransform v34;
  CGAffineTransform buf;
  CGRect v36;
  CGRect v37;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = self->_currentActionButtonView;
  objc_storeStrong((id *)&self->_currentActionButtonView, a3);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(v11, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllAnimations");

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if (self->_isSettingStateAnimated)
  {
    v15 = (NSObject **)MEMORY[0x24BE7BF48];
    v16 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v16 = *v15;
    }
    v8 = 0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_20D4F5000, v16, OS_LOG_TYPE_DEFAULT, "Updating view state in detail item view controller without animation, since state animation already in progress. #DetailItemViewController", (uint8_t *)&buf, 2u);
      v8 = 0;
    }
  }
  else
  {
    self->_isSettingStateAnimated = 1;
  }
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeScale(&buf, 0.1, 0.1);
  objc_msgSend(v11, "setAlpha:", 0.0);
  v34 = buf;
  objc_msgSend(v11, "setTransform:", &v34);
  -[UIView setAlpha:](v13, "setAlpha:", 1.0);
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v33[0] = *MEMORY[0x24BDBD8B8];
  v33[1] = v17;
  v33[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[UIView setTransform:](v13, "setTransform:", v33);
  objc_msgSend(v11, "removeFromSuperview");
  -[UIButton addSubview:](self->_actionIconButton, "addSubview:", v11);
  -[UIButton bounds](self->_actionIconButton, "bounds");
  MidX = CGRectGetMidX(v36);
  -[UIButton bounds](self->_actionIconButton, "bounds");
  objc_msgSend(v11, "setCenter:", MidX, CGRectGetMidY(v37));
  -[UIButton setEnabled:](self->_actionIconButton, "setEnabled:", v11 != 0);
  -[UIButton setUserInteractionEnabled:](self->_actionButton, "setUserInteractionEnabled:", 0);
  -[UIButton setUserInteractionEnabled:](self->_actionIconButton, "setUserInteractionEnabled:", 0);
  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke;
  aBlock[3] = &unk_24C726670;
  v27 = v13;
  v31 = buf;
  v20 = v11;
  v28 = v20;
  v29 = self;
  v32 = a6;
  v21 = v12;
  v30 = v21;
  v22 = v13;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke_2;
  v25[3] = &unk_24C724B28;
  v25[4] = self;
  v24 = (void (**)(void *, uint64_t))_Block_copy(v25);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v23, v24, 0.35);
  }
  else
  {
    v23[2](v23);
    v24[2](v24, 1);
  }

}

uint64_t __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(_OWORD *)(a1 + 80);
  v7[0] = *(_OWORD *)(a1 + 64);
  v7[1] = v2;
  v7[2] = *(_OWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v7);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v3 = *(void **)(a1 + 40);
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6[0] = *MEMORY[0x24BDBD8B8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1112), "setHidden:", *(_BYTE *)(a1 + 112) == 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1128), "setTitle:forState:", *(_QWORD *)(a1 + 56), 0);
}

uint64_t __97__QLDetailItemViewController__setActionButtonView_animated_actionButtonLabel_informationVisible___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setUserInteractionEnabled:", 1);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setUserInteractionEnabled:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1136) = 0;
  return result;
}

- (id)_scalableSystemFontOfSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (QLDetailItemViewControllerState)state
{
  return self->_state;
}

- (NSArray)information
{
  return self->_information;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_previewTitle, 0);
  objc_storeStrong((id *)&self->_currentActionButtonView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_actionIconButton, 0);
  objc_storeStrong((id *)&self->_informationStackView, 0);
  objc_storeStrong((id *)&self->_filePreviewImageView, 0);
}

@end
