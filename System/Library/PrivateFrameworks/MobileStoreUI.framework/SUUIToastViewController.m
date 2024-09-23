@implementation SUUIToastViewController

- (SUUIToastViewController)initWithTitle:(id)a3 description:(id)a4 image:(id)a5
{
  id v9;
  id v10;
  id v11;
  SUUIToastViewController *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  UILabel *primaryLabel;
  uint64_t v20;
  UILabel *secondaryLabel;
  uint64_t v22;
  UIImageView *imageView;
  void *v24;
  UIVisualEffectView *v25;
  UIVisualEffectView *toastView;
  UIVisualEffectView *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SUUIToastViewController;
  v12 = -[SUUIToastViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x24BEBD708]);
    v14 = *MEMORY[0x24BDBF090];
    v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], v15, v16, v17);
    primaryLabel = v12->_primaryLabel;
    v12->_primaryLabel = (UILabel *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v14, v15, v16, v17);
    secondaryLabel = v12->_secondaryLabel;
    v12->_secondaryLabel = (UILabel *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v14, v15, v16, v17);
    imageView = v12->_imageView;
    v12->_imageView = (UIImageView *)v22;

    -[UIImageView setImage:](v12->_imageView, "setImage:", v11);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v24);
    -[UIVisualEffectView setClipsToBounds:](v25, "setClipsToBounds:", 1);
    -[UIVisualEffectView _setContinuousCornerRadius:](v25, "_setContinuousCornerRadius:", 9.0);
    toastView = v12->_toastView;
    v12->_toastView = v25;
    v27 = v25;

    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v12->_descriptionText, a4);

    -[SUUIToastViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 6);
  }

  return v12;
}

- (SUUIToastViewController)initWithDialogTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SUUIToastViewController *v16;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedStringWithDefaultFont:foregroundColor:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedStringWithDefaultFont:foregroundColor:", 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resourceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    SUUIImageWithResourceName(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = -[SUUIToastViewController initWithTitle:description:image:](self, "initWithTitle:description:image:", v8, v12, v15);

  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
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
  void *v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)SUUIToastViewController;
  -[SUUIToastViewController viewDidLoad](&v41, sel_viewDidLoad);
  -[SUUIToastViewController presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setContainerIgnoresDirectTouchEvents:", 1);

  -[SUUIToastViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[SUUIToastViewController imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.64);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[SUUIToastViewController titleText](self, "titleText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineBreakMode:", 4);

  -[SUUIToastViewController descriptionText](self, "descriptionText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BDD1688]);
    -[SUUIToastViewController descriptionText](self, "descriptionText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

    v19 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v19, "setLineSpacing:", 2.0);
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v19, 0, objc_msgSend(v18, "length"));
    -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v18);

  }
  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 1);

  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.64);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v23);

  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLineBreakMode:", 4);

  -[SUUIToastViewController toastView](self, "toastView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  -[SUUIToastViewController toastView](self, "toastView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[SUUIToastViewController toastView](self, "toastView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  CGAffineTransformMakeScale(&v40, 0.88, 0.88);
  -[SUUIToastViewController toastView](self, "toastView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v40;
  objc_msgSend(v35, "setTransform:", &v39);

  -[SUUIToastViewController toastView](self, "toastView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", 0.0);

  -[SUUIToastViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController toastView](self, "toastView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", v38);

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIToastViewController;
  -[SUUIToastViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  v4[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUUIToastViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_2511F47C0;
  v5[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIToastViewController_viewWillAppear___block_invoke_2;
  v4[3] = &unk_2511F4908;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 2, v5, v4, 0.2, 0.0);
}

void __42__SUUIToastViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "toastView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "toastView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

uint64_t __42__SUUIToastViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissWithDelay:", 1.5);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double *v23;
  void (**v24)(void *, void *, _QWORD, double);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  float v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  _QWORD aBlock[7];
  _QWORD v64[4];
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  const char *v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)SUUIToastViewController;
  -[SUUIToastViewController viewDidLayoutSubviews](&v75, sel_viewDidLayoutSubviews);
  -[SUUIToastViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  -[SUUIToastViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  -[SUUIToastViewController toastView](self, "toastView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, 250.0, 450.0);

  v69 = 0;
  v70 = (double *)&v69;
  v71 = 0x4010000000;
  v72 = "";
  v73 = 0u;
  v74 = 0u;
  -[SUUIToastViewController toastView](self, "toastView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  *(double *)&v73 = v9 + 25.0;
  *((double *)&v73 + 1) = v10 + 32.0;
  *(double *)&v74 = v11 + -50.0;
  *((double *)&v74 + 1) = v12 + -57.0;

  -[SUUIToastViewController toastView](self, "toastView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  UIRectCenteredXInRectScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[SUUIToastViewController imageView](self, "imageView", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = v70;
  v70[5] = v21 + v70[5];
  v23[7] = v23[7] - v21;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__SUUIToastViewController_viewDidLayoutSubviews__block_invoke;
  aBlock[3] = &unk_2511F61A8;
  aBlock[4] = &v69;
  aBlock[5] = v64;
  aBlock[6] = &v65;
  v24 = (void (**)(void *, void *, _QWORD, double))_Block_copy(aBlock);
  objc_msgSend((id)objc_opt_class(), "_primaryLabelFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v25);

  -[SUUIToastViewController primaryLabel](self, "primaryLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2](v24, v27, 0, 18.0);

  objc_msgSend((id)objc_opt_class(), "_secondaryLabelFont");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v28);

  -[SUUIToastViewController secondaryLabel](self, "secondaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2](v24, v30, 0, 25.0);

  -[SUUIToastViewController toastView](self, "toastView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v66[3];
  -[SUUIToastViewController toastView](self, "toastView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v41 = fmin(v38 + 25.0, 450.0);
  if (v41 < 250.0)
    v41 = 250.0;
  v42 = v41;
  objc_msgSend(v39, "setBounds:", v33, v35, v37, ceilf(v42));

  -[SUUIToastViewController toastView](self, "toastView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  UIRectCenteredXInRectScale();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[SUUIToastViewController toastView](self, "toastView", v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

  -[SUUIToastViewController toastView](self, "toastView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "frame");
  UIRectCenteredYInRectScale();
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v61 = v60;
  -[SUUIToastViewController toastView](self, "toastView", v6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
}

void __48__SUUIToastViewController_viewDidLayoutSubviews__block_invoke(_QWORD *a1, void *a2, double a3)
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double MinX;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double Height;
  double MaxY;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v21 = a2;
  objc_msgSend(v21, "frame");
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(double *)(v5 + 48);
  v7 = *(double *)(v5 + 56);
  objc_msgSend(v21, "sizeThatFits:", v6, v7);
  v9 = v8;
  MinX = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
  v11 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v11 <= 0.0)
  {
    v14 = CGRectGetMinY(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32)) + a3;
  }
  else
  {
    v12 = v11 + a3;
    objc_msgSend(v21, "_firstBaselineOffsetFromTop");
    *(float *)&v13 = v12 - v13;
    v14 = ceilf(*(float *)&v13);
  }
  if (v9 >= v7)
    v15 = v7;
  else
    v15 = v9;
  v16 = v15;
  v17 = ceilf(v16);
  objc_msgSend(v21, "setFrame:", MinX, v14, v6, v17);
  v22.origin.x = MinX;
  v22.origin.y = v14;
  v22.size.width = v6;
  v22.size.height = v17;
  *(double *)(*(_QWORD *)(a1[4] + 8) + 56) = *(double *)(*(_QWORD *)(a1[4] + 8) + 56) - CGRectGetHeight(v22);
  Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
  if (Height < 0.0)
    Height = 0.0;
  *(double *)(*(_QWORD *)(a1[4] + 8) + 56) = Height;
  v23.origin.x = MinX;
  v23.origin.y = v14;
  v23.size.width = v6;
  v23.size.height = v17;
  MaxY = CGRectGetMaxY(v23);
  objc_msgSend(v21, "_baselineOffsetFromBottom");
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = MaxY - v20;
  v24.origin.x = MinX;
  v24.origin.y = v14;
  v24.size.width = v6;
  v24.size.height = v17;
  *(CGFloat *)(*(_QWORD *)(a1[6] + 8) + 24) = CGRectGetMaxY(v24);

}

- (void)present
{
  SUUIToastPresentationWindow *v3;

  v3 = objc_alloc_init(SUUIToastPresentationWindow);
  -[SUUIToastViewController setPresentationWindow:](self, "setPresentationWindow:", v3);
  -[SUUIToastPresentationWindow setHidden:](v3, "setHidden:", 0);
  -[SUUIToastPresentationWindow setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  -[SUUIToastPresentationWindow presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", self, 1, 0);

}

- (void)presentFromViewController:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a3;
  -[SUUIToastViewController setCompletion:](self, "setCompletion:", a4);
  objc_msgSend(v6, "presentViewController:animated:completion:", self, 1, 0);

}

+ (id)_primaryLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_primaryLabelFont__primaryLabelFont;
  if (!_primaryLabelFont__primaryLabelFont)
  {
    objc_msgSend(a1, "_fontWithSize:textStyleAttribute:", *MEMORY[0x24BDC4CD0], 22.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_primaryLabelFont__primaryLabelFont;
    _primaryLabelFont__primaryLabelFont = v3;

    v2 = (void *)_primaryLabelFont__primaryLabelFont;
  }
  return v2;
}

+ (id)_secondaryLabelFont
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_secondaryLabelFont__secondaryLabelFont;
  if (!_secondaryLabelFont__secondaryLabelFont)
  {
    objc_msgSend(a1, "_fontWithSize:textStyleAttribute:", *MEMORY[0x24BDC4CC8], 16.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_secondaryLabelFont__secondaryLabelFont;
    _secondaryLabelFont__secondaryLabelFont = v3;

    v2 = (void *)_secondaryLabelFont__secondaryLabelFont;
  }
  return v2;
}

+ (id)_fontWithSize:(double)a3 textStyleAttribute:(__CFString *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBB588];
  v12[0] = a4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_dismissWithDelay:(double)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SUUIToastViewController__dismissWithDelay___block_invoke;
  v4[3] = &unk_2511F47C0;
  v4[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__SUUIToastViewController__dismissWithDelay___block_invoke_2;
  v3[3] = &unk_2511F4908;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 2, v4, v3, 0.2, a3);
}

void __45__SUUIToastViewController__dismissWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  objc_msgSend(*(id *)(a1 + 32), "toastView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "toastView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  CGAffineTransformMakeScale(&v9, 0.88, 0.88);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

uint64_t __45__SUUIToastViewController__dismissWithDelay___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  CGAffineTransform v6;
  CGAffineTransform v7;

  CGAffineTransformMakeScale(&v7, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v2, "setTransform:", &v6);

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUUIToastViewController__dismissWithDelay___block_invoke_3;
  v5[3] = &unk_2511F47C0;
  v5[4] = v3;
  return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v5);
}

void __45__SUUIToastViewController__dismissWithDelay___block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (SUUIToastPresentationWindow)presentationWindow
{
  return self->_presentationWindow;
}

- (void)setPresentationWindow:(id)a3
{
  objc_storeStrong((id *)&self->_presentationWindow, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIVisualEffectView)toastView
{
  return self->_toastView;
}

- (void)setToastView:(id)a3
{
  objc_storeStrong((id *)&self->_toastView, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_toastView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
