@implementation UIProgressFooterView

- (UIProgressFooterView)initWithSpecifier:(id)a3
{
  id v4;
  UIProgressFooterView *v5;
  UIProgressFooterView *v6;

  v4 = a3;
  v5 = -[UIProgressFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    -[UIProgressFooterView setupSubviewsAndConstraints](v5, "setupSubviewsAndConstraints");
    -[UIProgressFooterView refreshContentsWithSpecifier:](v6, "refreshContentsWithSpecifier:", v4);
  }

  return v6;
}

- (BOOL)progressIsComplete
{
  void *v2;
  float v3;
  BOOL v4;

  -[UIProgressFooterView progressView](self, "progressView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "progress");
  v4 = v3 == 1.0;

  return v4;
}

- (void)clearProgress
{
  void *v3;
  double v4;
  void *v5;
  id v6;

  -[UIProgressFooterView progressView](self, "progressView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setProgress:", v4);

  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_24DFF2410);

  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_24DFF2410);

}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  float v15;
  _BOOL4 v16;
  __CFString *v17;
  __CFString *v18;
  _BOOL4 v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  __CFString *v33;
  id v34;
  __CFString *v35;
  id v36;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("AUSettingsProgressKeyBytesSent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("AUSettingsProgressKeyBytesTotal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "longValue") >= 1
    && objc_msgSend(v6, "longValue") >= 1
    && (v7 = objc_msgSend(v5, "longValue"), v7 <= objc_msgSend(v6, "longValue")))
  {
    v14 = (float)objc_msgSend(v5, "longValue");
    v15 = v14 / (float)objc_msgSend(v6, "longValue");
    -[UIProgressFooterView progressView](self, "progressView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    *(float *)&v13 = v15;
  }
  else
  {
    -[UIProgressFooterView progressView](self, "progressView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "progress");
    v10 = v9;

    if (v10 != 0.0)
      goto LABEL_8;
    -[UIProgressFooterView progressView](self, "progressView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 1008981770;
  }
  objc_msgSend(v11, "setProgress:animated:", 0, v13);

LABEL_8:
  v16 = -[UIProgressFooterView progressIsComplete](self, "progressIsComplete");
  v17 = CFSTR("Staging");
  if (v16)
    v17 = CFSTR("Completed");
  v18 = v17;
  v19 = -[UIProgressFooterView progressIsComplete](self, "progressIsComplete");
  v20 = CFSTR("...");
  if (v19)
    v20 = &stru_24DFF2410;
  v21 = v20;
  objc_msgSend(v4, "propertyForKey:", CFSTR("kAUSettingsProgressActiveSerialNumber"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: (%@ / %@ bytes)"), v22, v5, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIProgressFooterView progressIsComplete](self, "progressIsComplete"))
  {
    v24 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__UIProgressFooterView_refreshContentsWithSpecifier___block_invoke;
    block[3] = &unk_24DFEFA58;
    block[4] = self;
    v33 = v18;
    v34 = v4;
    v35 = v21;
    v36 = v23;
    dispatch_after(v24, MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "propertyForKey:", CFSTR("AUSettingsProgressKeyBuild"));
    v31 = v5;
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ %@ %@"), v18, v27, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressFooterView assetLabel](self, "assetLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    v6 = v26;
    v5 = v31;
    -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v23);

  }
}

void __53__UIProgressFooterView_refreshContentsWithSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "propertyForKey:", CFSTR("AUSettingsProgressKeyBuild"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ %@ %@"), v3, v4, *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "detailProgressLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)setupSubviewsAndConstraints
{
  id v3;
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
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;

  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[UIProgressFooterView setAssetLabel:](self, "setAssetLabel:", v3);

  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  -[UIProgressFooterView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CF8]), "initWithProgressViewStyle:", 0);
  -[UIProgressFooterView setProgressView:](self, "setProgressView:", v11);

  -[UIProgressFooterView progressView](self, "progressView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIProgressFooterView progressView](self, "progressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "transform");
  else
    memset(&v71, 0, sizeof(v71));
  CGAffineTransformScale(&v72, &v71, 1.0, 2.0);
  -[UIProgressFooterView progressView](self, "progressView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v72;
  objc_msgSend(v15, "setTransform:", &v70);

  -[UIProgressFooterView progressView](self, "progressView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 0;
  objc_msgSend(v16, "setProgress:", v17);

  -[UIProgressFooterView contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView progressView](self, "progressView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[UIProgressFooterView setDetailProgressLabel:](self, "setDetailProgressLabel:", v20);

  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v22);

  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextColor:", v24);

  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "fontWithSize:", 14.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v28);

  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTextAlignment:", 1);

  -[UIProgressFooterView contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v32);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 3, 0, v36, 3, 1.0, 20.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v37);

  v38 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 5, 0, v40, 5, 1.0, 20.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v41);

  v42 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 6, 0, v44, 6, 1.0, -5.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v45);

  v46 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView progressView](self, "progressView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 3, 1, v48, 4, 1.0, 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v49);

  v50 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView progressView](self, "progressView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 5, 0, v52, 5, 1.0, 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v53);

  v54 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView progressView](self, "progressView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v55, 6, 0, v56, 6, 1.0, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v57);

  v58 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView progressView](self, "progressView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 3, 1, v60, 4, 1.0, 10.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v61);

  v62 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView progressView](self, "progressView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v63, 5, 0, v64, 5, 1.0, 0.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v65);

  v66 = (void *)MEMORY[0x24BDD1628];
  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressFooterView progressView](self, "progressView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 6, 0, v68, 6, 1.0, 0.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v69);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v33);
}

- (double)preferredHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[UIProgressFooterView layoutMargins](self, "layoutMargins");
  v6 = a3 - v5;
  -[UIProgressFooterView layoutMargins](self, "layoutMargins");
  v8 = v6 - v7;
  -[UIProgressFooterView assetLabel](self, "assetLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  v11 = v10;

  -[UIProgressFooterView progressView](self, "progressView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v8, 3.40282347e38);
  v14 = v13;

  -[UIProgressFooterView detailProgressLabel](self, "detailProgressLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v8, 3.40282347e38);
  v17 = v16;

  -[UIProgressFooterView layoutMargins](self, "layoutMargins");
  v19 = v11 + v14 + v17 + v18;
  -[UIProgressFooterView layoutMargins](self, "layoutMargins");
  return v19 + v20 + 20.0;
}

- (UILabel)assetLabel
{
  return self->_assetLabel;
}

- (void)setAssetLabel:(id)a3
{
  objc_storeStrong((id *)&self->_assetLabel, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UILabel)detailProgressLabel
{
  return self->_detailProgressLabel;
}

- (void)setDetailProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailProgressLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailProgressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_assetLabel, 0);
}

@end
