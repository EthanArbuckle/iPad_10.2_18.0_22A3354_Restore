@implementation WFOverlayImageEditorOptionsView

- (WFOverlayImageEditorOptionsView)init
{
  WFOverlayImageEditorOptionsView *v2;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  WFOverlayImageEditorOptionsView *v42;
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
  objc_super v67;
  _QWORD v68[24];

  v68[22] = *MEMORY[0x24BDAC8D0];
  v67.receiver = self;
  v67.super_class = (Class)WFOverlayImageEditorOptionsView;
  v2 = -[WFOverlayImageEditorOptionsView init](&v67, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WFLocalizedString(CFSTR("Rotation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:forState:", v4, 0);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageRotationLockIcon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UIImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:forState:", v6, 4);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageRotationUnlockIcon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UIImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:forState:", v8, 0);

    objc_msgSend(v3, "addTarget:action:forControlEvents:", v2, sel_didTapRotationButton, 64);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v3);
    v9 = v3;
    objc_storeWeak((id *)&v2->_rotationButton, v3);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WFLocalizedString(CFSTR("Reset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v11, 0);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageResetIcon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UIImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:forState:", v13, 0);

    objc_msgSend(v10, "addTarget:action:forControlEvents:", v2, sel_didTapResetButton, 64);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v10);
    objc_storeWeak((id *)&v2->_resetButton, v10);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WFLocalizedString(CFSTR("Opacity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v15, 0);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageOpacityIcon"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UIImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:forState:", v17, 0);

    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("OverlayImageOpacityIconSelected"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UIImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:forState:", v19, 4);

    objc_msgSend(v14, "addTarget:action:forControlEvents:", v2, sel_didTapOpacityButton, 64);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v14);
    objc_storeWeak((id *)&v2->_opacityButton, v14);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Cancel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:forState:", v21, 0);

    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitleColor:forState:", v22, 0);

    objc_msgSend(v20, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v24);

    objc_msgSend(v20, "addTarget:action:forControlEvents:", v2, sel_didTapCancelButton, 64);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v20);
    objc_storeWeak((id *)&v2->_cancelButton, v20);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WFLocalizedString(CFSTR("Next"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:forState:", v26, 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.756862745, 0.0274509804, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitleColor:forState:", v27, 0);

    objc_msgSend(v25, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v29);

    objc_msgSend(v25, "addTarget:action:forControlEvents:", v2, sel_didTapNextButton, 64);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v25);
    objc_storeWeak((id *)&v2->_nextButton, v25);
    v30 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0705882353, 0.117647059, 0.141176471, 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFOverlayImageEditorOptionsView addSubview:](v2, "addSubview:", v30);
    objc_storeWeak((id *)&v2->_topBorder, v30);
    -[WFOverlayImageEditorOptionsView safeAreaLayoutGuide](v2, "safeAreaLayoutGuide");
    v32 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x24BDD1628];
    v62 = v30;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 3, 0, v2, 3, 1.0, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v65;
    v33 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "scale");
    objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 8, 0, 0, 0, 1.0, 1.0 / v34);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v63;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 1, 0, v2, 1, 1.0, 0.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v61;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 2, 0, v2, 2, 1.0, 0.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v60;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 3, 1, v2, 3, 1.0, 7.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v68[4] = v58;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v14, 3, 1.0, 0.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68[5] = v57;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, v14, 3, 1.0, 0.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v68[6] = v56;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, 0, 0, 1.0, 46.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v68[7] = v55;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 8, 0, v14, 8, 1.0, 0.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v68[8] = v54;
    v66 = v9;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, v14, 8, 1.0, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v68[9] = v53;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 0, v32, 4, 1.0, -7.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v68[10] = v52;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 4, 0, v14, 4, 1.0, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v68[11] = v51;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v14, 4, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v68[12] = v49;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 0, v2, 3, 1.0, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v68[13] = v48;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 3, 0, v2, 3, 1.0, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v68[14] = v46;
    v50 = v20;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 4, 0, v32, 4, 1.0, 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v68[15] = v44;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 4, 0, v32, 4, 1.0, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v68[16] = v35;
    v47 = (void *)v32;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 5, 0, v32, 5, 1.0, 12.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v68[17] = v36;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 6, 0, v32, 6, 1.0, -12.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68[18] = v37;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, v2, 9, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68[19] = v38;
    v45 = v10;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 2, 0, v10, 1, 1.0, -22.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68[20] = v39;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v66, 1, 0, v10, 2, 1.0, 22.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68[21] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v41);

    v42 = v2;
  }

  return v2;
}

- (void)didTapResetButton
{
  id v2;

  -[WFOverlayImageEditorOptionsView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetOverlayImageViewTransformations");

}

- (void)didTapRotationButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[WFOverlayImageEditorOptionsView rotationButton](self, "rotationButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected") ^ 1;
  -[WFOverlayImageEditorOptionsView rotationButton](self, "rotationButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v4);

  -[WFOverlayImageEditorOptionsView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorOptionsView rotationButton](self, "rotationButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRotationEnabled:", objc_msgSend(v6, "isSelected") ^ 1);

}

- (void)didTapOpacityButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[WFOverlayImageEditorOptionsView opacityButton](self, "opacityButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected") ^ 1;
  -[WFOverlayImageEditorOptionsView opacityButton](self, "opacityButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v4);

  -[WFOverlayImageEditorOptionsView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFOverlayImageEditorOptionsView opacityButton](self, "opacityButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOpacitySliderVisible:", objc_msgSend(v6, "isSelected"));

}

- (void)didTapCancelButton
{
  id v2;

  -[WFOverlayImageEditorOptionsView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelEditingImage");

}

- (void)didTapNextButton
{
  void *v3;
  id v4;

  -[WFOverlayImageEditorOptionsView nextButton](self, "nextButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[WFOverlayImageEditorOptionsView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishEditingImage");

}

- (UIButton)cancelButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_cancelButton);
}

- (UIButton)nextButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_nextButton);
}

- (WFOverlayImageEditorOptionsViewDelegate)delegate
{
  return (WFOverlayImageEditorOptionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFOverlayImageEditorOptionButton)rotationButton
{
  return (WFOverlayImageEditorOptionButton *)objc_loadWeakRetained((id *)&self->_rotationButton);
}

- (WFOverlayImageEditorOptionButton)resetButton
{
  return (WFOverlayImageEditorOptionButton *)objc_loadWeakRetained((id *)&self->_resetButton);
}

- (WFOverlayImageEditorOptionButton)opacityButton
{
  return (WFOverlayImageEditorOptionButton *)objc_loadWeakRetained((id *)&self->_opacityButton);
}

- (UIView)topBorder
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topBorder);
}

- (UILabel)nextLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_nextLabel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextLabel);
  objc_destroyWeak((id *)&self->_topBorder);
  objc_destroyWeak((id *)&self->_opacityButton);
  objc_destroyWeak((id *)&self->_resetButton);
  objc_destroyWeak((id *)&self->_rotationButton);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_nextButton);
  objc_destroyWeak((id *)&self->_cancelButton);
}

@end
