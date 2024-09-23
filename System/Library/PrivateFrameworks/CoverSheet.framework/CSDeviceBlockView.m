@implementation CSDeviceBlockView

- (void)addDeviceUnblockButtons
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *v6;
  UIButton *unblockDeviceButton;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *emergencyButton;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_ERASE_ACTION"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CSModalView setSecondaryActionButtonText:](self, "setSecondaryActionButtonText:", 0);
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v16);
  objc_msgSend(v4, "setTitleLineBreakMode:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseForegroundColor:", v5);

  -[UIButton removeFromSuperview](self->_unblockDeviceButton, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
  unblockDeviceButton = self->_unblockDeviceButton;
  self->_unblockDeviceButton = v6;

  -[UIButton setConfiguration:](self->_unblockDeviceButton, "setConfiguration:", v4);
  v8 = self->_unblockDeviceButton;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v8, "setTitleColor:forState:", v9, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_unblockDeviceButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](self->_unblockDeviceButton, "addTarget:action:forControlEvents:", self, sel__handleUnblockButtonAction, 64);
  -[CSDeviceBlockView addSubview:](self, "addSubview:", self->_unblockDeviceButton);
  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_EMERGENCY_BUTTON"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v11);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBaseForegroundColor:", v13);

    -[UIButton removeFromSuperview](self->_emergencyButton, "removeFromSuperview");
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v14 = (UIButton *)objc_claimAutoreleasedReturnValue();
    emergencyButton = self->_emergencyButton;
    self->_emergencyButton = v14;

    -[UIButton setConfiguration:](self->_emergencyButton, "setConfiguration:", v12);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_emergencyButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](self->_emergencyButton, "addTarget:action:forControlEvents:", self, sel__handleEmergencyButtonAction, 64);
    -[CSDeviceBlockView addSubview:](self, "addSubview:", self->_emergencyButton);

  }
  -[CSDeviceBlockView updateConstraints](self, "updateConstraints");

}

- (void)updateConstraints
{
  UIButton *unblockDeviceButton;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)CSDeviceBlockView;
  -[CSModalView updateConstraints](&v12, sel_updateConstraints);
  -[CSDeviceBlockView removeConstraints:](self, "removeConstraints:", self->_buttonConstraints);
  -[CSDeviceBlockView _activateConstraintsForSideBySide:](self, "_activateConstraintsForSideBySide:", 1);
  unblockDeviceButton = self->_unblockDeviceButton;
  if (unblockDeviceButton && self->_emergencyButton)
  {
    -[UIButton titleLabel](unblockDeviceButton, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0CEB980];
    v6 = *(double *)(MEMORY[0x1E0CEB980] + 8);
    objc_msgSend(v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], v6);
    v8 = v7;

    -[UIButton titleLabel](self->_emergencyButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemLayoutSizeFittingSize:", v5, v6);
    v11 = v10;

    -[CSDeviceBlockView bounds](self, "bounds");
    if (v8 + v11 + 84.0 + 36.0 > CGRectGetWidth(v13))
    {
      -[CSDeviceBlockView removeConstraints:](self, "removeConstraints:", self->_buttonConstraints);
      -[CSDeviceBlockView _activateConstraintsForSideBySide:](self, "_activateConstraintsForSideBySide:", 0);
    }
  }
}

- (void)removeDeviceUnblockButtons
{
  UIButton *unblockDeviceButton;
  UIButton *emergencyButton;
  void *v5;
  id v6;

  -[UIButton removeFromSuperview](self->_unblockDeviceButton, "removeFromSuperview");
  -[UIButton removeFromSuperview](self->_emergencyButton, "removeFromSuperview");
  unblockDeviceButton = self->_unblockDeviceButton;
  self->_unblockDeviceButton = 0;

  emergencyButton = self->_emergencyButton;
  self->_emergencyButton = 0;

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_EMERGENCY_BUTTON"), &stru_1E8E30B28, CFSTR("CoverSheet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSModalView setSecondaryActionButtonText:](self, "setSecondaryActionButtonText:", v5);

  }
}

- (void)updateViewForUnblockDeviceView
{
  -[CSDeviceBlockView _updateViewForUnblockDeviceViewAnimated:](self, "_updateViewForUnblockDeviceViewAnimated:", 0);
}

- (void)setUnblockDeviceView:(id)a3
{
  UIView *v5;
  UIView *unblockDeviceView;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->_unblockDeviceView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_unblockDeviceView, a3);
    unblockDeviceView = self->_unblockDeviceView;
    -[CSDeviceBlockView bounds](self, "bounds");
    -[UIView setFrame:](unblockDeviceView, "setFrame:");
    -[CSDeviceBlockView _updateViewForUnblockDeviceViewAnimated:](self, "_updateViewForUnblockDeviceViewAnimated:", 1);
    v5 = v7;
  }

}

- (void)setAuthenticationView:(id)a3
{
  UIView *v5;
  UIView **p_authenticationView;
  UIView *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  p_authenticationView = &self->_authenticationView;
  if (self->_authenticationView != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_authenticationView, a3);
    v7 = *p_authenticationView;
    -[CSDeviceBlockView bounds](self, "bounds");
    -[UIView setFrame:](v7, "setFrame:");
    -[UIView setHidden:](self->_unblockDeviceView, "setHidden:", *p_authenticationView != 0);
    v5 = v8;
  }

}

- (BOOL)isShowingAuthenticationView
{
  void *v2;
  BOOL v3;

  -[CSDeviceBlockView authenticationView](self, "authenticationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isShowingUnblockDeviceView
{
  void *v2;
  BOOL v3;

  -[CSDeviceBlockView unblockDeviceView](self, "unblockDeviceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updateViewForUnblockDeviceViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  UIView *unblockDeviceView;
  BOOL v6;
  double v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[5];
  BOOL v11;

  v3 = a3;
  unblockDeviceView = self->_unblockDeviceView;
  v6 = unblockDeviceView != 0;
  v7 = 1.0;
  if (unblockDeviceView)
    v7 = 0.0;
  -[UIView setAlpha:](unblockDeviceView, "setAlpha:", v7);
  v8 = 0.5;
  if (!v3)
    v8 = 0.0;
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke;
  v10[3] = &unk_1E8E2E190;
  v10[4] = self;
  v11 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke_2;
  v9[3] = &unk_1E8E2DDE0;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v10, v9, v8);
}

uint64_t __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "setShowsDateView:", *(_BYTE *)(a1 + 40) == 0);
  objc_msgSend(*(id *)(a1 + 32), "hideTitleLabel:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hideSubtitleLabel:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hideSecondarySubtitleLabel:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setHidden:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "setHidden:", *(unsigned __int8 *)(a1 + 40));
  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAlpha:", v2);
}

uint64_t __61__CSDeviceBlockView__updateViewForUnblockDeviceViewAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "setAlpha:", 1.0);
}

- (void)_activateConstraintsForSideBySide:(BOOL)a3
{
  NSArray *v5;
  UIButton *unblockDeviceButton;
  UIButton *emergencyButton;
  BOOL v8;
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
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  NSArray *buttonConstraints;
  NSArray *v43;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  unblockDeviceButton = self->_unblockDeviceButton;
  emergencyButton = self->_emergencyButton;
  if (unblockDeviceButton)
    v8 = emergencyButton == 0;
  else
    v8 = 1;
  if (!v8 && !a3)
  {
    -[UIButton centerXAnchor](self->_emergencyButton, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView centerXAnchor](self, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v11);

    -[UIButton centerXAnchor](self->_unblockDeviceButton, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView centerXAnchor](self, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v14);

    -[UIButton bottomAnchor](self->_unblockDeviceButton, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView bottomAnchor](self, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView _buttonsBottomSpacing](self, "_buttonsBottomSpacing");
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v16, -v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v18);

    -[UIButton bottomAnchor](self->_emergencyButton, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton topAnchor](self->_unblockDeviceButton, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -16.0;
LABEL_11:
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", v20, v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v41);

    goto LABEL_12;
  }
  if (unblockDeviceButton)
  {
    -[UIButton trailingAnchor](unblockDeviceButton, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView trailingAnchor](self, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -28.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v24);

    -[UIButton titleLabel](self->_unblockDeviceButton, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView trailingAnchor](self, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -42.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v28);

    -[UIButton bottomAnchor](self->_unblockDeviceButton, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView bottomAnchor](self, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView _buttonsBottomSpacing](self, "_buttonsBottomSpacing");
    objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:constant:", v30, -v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v32);

  }
  if (emergencyButton)
  {
    -[UIButton leadingAnchor](self->_emergencyButton, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView leadingAnchor](self, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 28.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v35);

    -[UIButton titleLabel](self->_emergencyButton, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView leadingAnchor](self, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 42.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v5, "addObject:", v39);

    -[UIButton bottomAnchor](self->_emergencyButton, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView bottomAnchor](self, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSDeviceBlockView _buttonsBottomSpacing](self, "_buttonsBottomSpacing");
    v21 = -v40;
    goto LABEL_11;
  }
LABEL_12:
  buttonConstraints = self->_buttonConstraints;
  self->_buttonConstraints = v5;
  v43 = v5;

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);
}

- (void)_handleUnblockButtonAction
{
  id v2;

  -[CSDeviceBlockView deviceBlockDelegate](self, "deviceBlockDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleUnblockButtonAction");

}

- (void)_handleEmergencyButtonAction
{
  id v2;

  -[CSDeviceBlockView deviceBlockDelegate](self, "deviceBlockDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleEmergencyButtonAction");

}

- (double)_buttonsBottomSpacing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  double v22;
  int v23;
  int v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v33;
  int v34;
  double v35;
  int v36;
  double v37;
  double v38;
  int v39;
  int v40;
  double v41;
  double v42;
  double v43;
  int v44;
  int v45;
  double v46;
  double v47;
  int v48;
  int v49;
  int v50;
  int v51;
  double v52;
  int v53;
  double v54;
  double v55;
  int v56;
  int v57;
  double v58;
  double v59;
  double v60;
  int v61;
  int v62;
  int v63;
  double v64;
  double v65;
  int v66;
  int v67;
  int v68;
  int v69;
  double v70;
  double v71;
  double v72;
  int v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  int v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  int v131;
  uint64_t v132;
  int v133;
  __int128 v134;
  _BYTE v135[12];
  _BYTE v136[40];
  _BYTE v137[12];
  __int128 v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v145;
  int v146;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") != 1)
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v138 = 0uLL;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v139 = 0;
    v140 = 0;
    v129 = 0;
    v141 = 0;
    v128 = 0;
    v142 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v143 = 0;
    v125 = 0;
    v144 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v145 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v146 = 0;
    v15 = 21.0;
    goto LABEL_69;
  }
  v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v7 = 0;
      v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v123, "userInterfaceIdiom") != 1)
    {
      v7 = 0;
      v8 = 1;
      goto LABEL_12;
    }
  }
  v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "_referenceBounds");
    }
    v7 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v145) = v2 ^ 1;
      v146 = v8;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v142 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v143 = 0;
      v125 = 0;
      v144 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      LODWORD(v145) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_12:
  v16 = __sb__runningInSpringBoard();
  HIDWORD(v145) = v7;
  v146 = v8;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v3 = 0;
      v17 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "userInterfaceIdiom") != 1)
    {
      v3 = 0;
      v17 = 1;
      goto LABEL_21;
    }
  }
  v17 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "_referenceBounds");
    }
    v3 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v144 = v2 ^ 1;
      LODWORD(v145) = v17;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v142 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v143 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_21:
  v18 = __sb__runningInSpringBoard();
  v144 = v3;
  LODWORD(v145) = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v4 = 0;
      v19 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "userInterfaceIdiom") != 1)
    {
      v4 = 0;
      v19 = 1;
      goto LABEL_30;
    }
  }
  v19 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "_referenceBounds");
    }
    v4 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v142 = v2 ^ 1;
      v143 = v19;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      v138 = 0uLL;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v139 = 0;
      v140 = 0;
      v129 = 0;
      v141 = 0;
      v128 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 90.0;
      goto LABEL_69;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_30:
  v20 = __sb__runningInSpringBoard();
  v142 = v4;
  v143 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v21 = 0;
      v5 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v21 = 0;
      v5 = 1;
      goto LABEL_39;
    }
  }
  v5 = v20 ^ 1u;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "_referenceBounds");
  }
  v21 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v22 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v140 = v2 ^ 1;
    v141 = v5;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v138 = 0uLL;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v139 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 90.0;
    goto LABEL_69;
  }
LABEL_39:
  v23 = __sb__runningInSpringBoard();
  v140 = v21;
  v141 = v5;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v138) = 0;
      v24 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      HIDWORD(v138) = 0;
      v24 = 1;
      goto LABEL_49;
    }
  }
  v24 = v23 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "_referenceBounds");
  }
  HIDWORD(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    v139 = v24;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    *(_QWORD *)&v138 = 0;
    v134 = 0uLL;
    DWORD2(v138) = 0;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 90.0;
    goto LABEL_69;
  }
LABEL_49:
  v26 = __sb__runningInSpringBoard();
  v139 = v24;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v138 + 4) = 0;
      goto LABEL_180;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v138 + 4) = 0x100000000;
      goto LABEL_180;
    }
  }
  DWORD2(v138) = v26 ^ 1;
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "_referenceBounds");
  }
  DWORD1(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v33 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    LODWORD(v138) = 0;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 90.0;
    goto LABEL_69;
  }
LABEL_180:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_182;
LABEL_188:
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 90.0;
    LODWORD(v138) = v2 ^ 1;
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v116, "userInterfaceIdiom") == 1)
    goto LABEL_188;
LABEL_182:
  LODWORD(v138) = v2 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_186:
    *(_QWORD *)v137 = 0;
    goto LABEL_196;
  }
  v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_186;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v109, "userInterfaceIdiom"))
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)&v137[4] = 1;
      goto LABEL_196;
    }
  }
  *(_DWORD *)&v137[4] = v34 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "_referenceBounds");
    }
    *(_DWORD *)v137 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v136, 0, sizeof(v136));
      *(_DWORD *)&v137[8] = 0;
      memset(v135, 0, sizeof(v135));
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_196:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 0;
      goto LABEL_206;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v110, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_206;
    }
  }
  *(_DWORD *)&v137[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "_referenceBounds");
    }
    *(_DWORD *)&v136[36] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_210;
  }
  else
  {
    *(_DWORD *)&v136[36] = 0;
  }
LABEL_206:
  if (_SBF_Private_IsD94Like())
  {
    memset(v136, 0, 36);
    memset(v135, 0, sizeof(v135));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 48.7;
    goto LABEL_69;
  }
LABEL_210:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_214:
    *(_QWORD *)&v136[28] = 0;
    goto LABEL_224;
  }
  v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_214;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[28] = 0;
      *(_DWORD *)&v136[32] = 1;
      goto LABEL_224;
    }
  }
  *(_DWORD *)&v136[32] = v36 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "_referenceBounds");
    }
    *(_DWORD *)&v136[28] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v136, 0, 28);
      memset(v135, 0, sizeof(v135));
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[28] = 0;
  }
LABEL_224:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[24] = 0;
      *(_DWORD *)&v136[16] = 0;
      goto LABEL_234;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[16] = 0;
      *(_DWORD *)&v136[24] = 1;
      goto LABEL_234;
    }
  }
  *(_DWORD *)&v136[24] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "_referenceBounds");
    }
    *(_DWORD *)&v136[16] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_238;
  }
  else
  {
    *(_DWORD *)&v136[16] = 0;
  }
LABEL_234:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v136[20] = 0;
    *(_OWORD *)v136 = 0uLL;
    memset(v135, 0, sizeof(v135));
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 48.7;
    goto LABEL_69;
  }
LABEL_238:
  v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[20] = 0;
      *(_DWORD *)&v136[12] = 0;
      goto LABEL_248;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[12] = 0;
      *(_DWORD *)&v136[20] = 1;
      goto LABEL_248;
    }
  }
  *(_DWORD *)&v136[20] = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "_referenceBounds");
    }
    v2 = v40 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[12] = v2;
    if (v41 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v136 = 0;
      memset(v135, 0, sizeof(v135));
      *(_DWORD *)&v136[8] = 0;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[12] = 0;
  }
LABEL_248:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v136 = 0;
      *(_DWORD *)v135 = 0;
      goto LABEL_258;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)v135 = 0;
      *(_DWORD *)v136 = 1;
      goto LABEL_258;
    }
  }
  *(_DWORD *)v136 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    *(_DWORD *)v135 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_268;
  }
  else
  {
    *(_DWORD *)v135 = 0;
  }
LABEL_258:
  if (_SBF_Private_IsD54())
  {
    *(_QWORD *)&v136[4] = 0;
    *(_QWORD *)&v135[4] = 0;
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 48.7;
    goto LABEL_69;
  }
LABEL_268:
  v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v136[4] = 0;
      goto LABEL_278;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v103, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v136[4] = 0;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_278;
    }
  }
  *(_DWORD *)&v136[8] = v44 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_referenceBounds");
    }
    v2 = v45 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[4] = v2;
    if (v46 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(_QWORD *)&v135[4] = 0;
      v134 = 0uLL;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 58.5;
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[4] = 0;
  }
LABEL_278:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v135[4] = 0;
      goto LABEL_288;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v135[4] = 0;
      *(_DWORD *)&v135[8] = 1;
      goto LABEL_288;
    }
  }
  *(_DWORD *)&v135[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "_referenceBounds");
    }
    *(_DWORD *)&v135[4] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_297;
  }
  else
  {
    *(_DWORD *)&v135[4] = 0;
  }
LABEL_288:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    v134 = 0uLL;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 50.7;
    goto LABEL_69;
  }
LABEL_297:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_301:
    HIDWORD(v134) = 0;
    LODWORD(v134) = 0;
    goto LABEL_308;
  }
  v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_301;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v95, "userInterfaceIdiom"))
    {
      LODWORD(v134) = 0;
      HIDWORD(v134) = 1;
      goto LABEL_308;
    }
  }
  HIDWORD(v134) = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "_referenceBounds");
    }
    v2 = v49 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v134) = v2;
    if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      *(_QWORD *)((char *)&v134 + 4) = 0;
      v132 = 0;
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v134) = 0;
  }
LABEL_308:
  v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      DWORD2(v134) = 0;
      v2 = 0;
      goto LABEL_318;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v99, "userInterfaceIdiom"))
    {
      v2 = 0;
      DWORD2(v134) = 1;
      goto LABEL_318;
    }
  }
  DWORD2(v134) = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v51 = __sb__runningInSpringBoard();
    if (v51)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "_referenceBounds");
    }
    v2 = v51 ^ 1u;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_322;
  }
  else
  {
    v2 = 0;
  }
LABEL_318:
  if (_SBF_Private_IsD93Like())
  {
    DWORD1(v134) = v2;
    v132 = 0;
    v133 = 0;
    v131 = 0;
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 37.5;
    goto LABEL_69;
  }
LABEL_322:
  DWORD1(v134) = v2;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_326:
    v132 = 0;
    goto LABEL_336;
  }
  v53 = __sb__runningInSpringBoard();
  if (v53)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_326;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "userInterfaceIdiom"))
    {
      v132 = 0x100000000;
      goto LABEL_336;
    }
  }
  HIDWORD(v132) = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "_referenceBounds");
    }
    LODWORD(v132) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v133 = 0;
      v131 = 0;
      v128 = 0;
      v129 = 0;
      v127 = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v132) = 0;
  }
LABEL_336:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v133 = 0;
      v131 = 0;
      goto LABEL_346;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v94, "userInterfaceIdiom"))
    {
      v131 = 0;
      v133 = 1;
      goto LABEL_346;
    }
  }
  v133 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "_referenceBounds");
    }
    v131 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_350;
  }
  else
  {
    v131 = 0;
  }
LABEL_346:
  if (_SBF_Private_IsD63Like())
  {
    v128 = 0;
    v129 = 0;
    v127 = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 37.5;
    goto LABEL_69;
  }
LABEL_350:
  v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      HIDWORD(v127) = 0;
      goto LABEL_360;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v91, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      HIDWORD(v129) = 1;
      goto LABEL_360;
    }
  }
  HIDWORD(v129) = v56 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    v2 = v57 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v127) = v2;
    if (v58 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      LODWORD(v129) = 0;
      v128 = 0;
      LODWORD(v127) = 0;
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 59.0;
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_360:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v129) = 0;
      HIDWORD(v128) = 0;
      goto LABEL_370;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      HIDWORD(v128) = 0;
      LODWORD(v129) = 1;
      goto LABEL_370;
    }
  }
  LODWORD(v129) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    HIDWORD(v128) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_380;
  }
  else
  {
    HIDWORD(v128) = 0;
  }
LABEL_370:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    LODWORD(v127) = 0;
    v126 = 0;
    v130 = 0;
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 51.2;
    goto LABEL_69;
  }
LABEL_380:
  v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      LODWORD(v127) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "userInterfaceIdiom"))
    {
      LODWORD(v127) = 0;
      LODWORD(v128) = 1;
      goto LABEL_390;
    }
  }
  LODWORD(v128) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = __sb__runningInSpringBoard();
    if ((_DWORD)v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v127) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v126 = 0;
      v130 = 0;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v127) = 0;
  }
LABEL_390:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      v2 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v84, "userInterfaceIdiom"))
    {
      v2 = 0;
      v126 = 1;
      goto LABEL_400;
    }
  }
  v126 = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    v2 = 0;
    goto LABEL_400;
  }
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "_referenceBounds");
  }
  v2 = v63 ^ 1u;
  BSSizeRoundForScale();
  if (v65 < *(double *)(MEMORY[0x1E0DAB260] + 104))
  {
LABEL_400:
    if (_SBF_Private_IsD53())
    {
      v130 = v2;
      v125 = 0;
      v124 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 37.5;
      goto LABEL_69;
    }
  }
  v130 = v2;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
    goto LABEL_409;
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
    goto LABEL_412;
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
LABEL_409:
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 51.0;
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
LABEL_412:
    v125 = 0;
    v124 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 40.0;
    goto LABEL_69;
  }
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v125 = 0;
      v124 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v78, "userInterfaceIdiom"))
    {
      v124 = 0;
      v125 = 1;
      goto LABEL_425;
    }
  }
  v125 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v66 = __sb__runningInSpringBoard();
    if (v66)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_referenceBounds");
    }
    v124 = v66 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 51.0;
      goto LABEL_69;
    }
  }
  else
  {
    v124 = 0;
  }
LABEL_425:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "userInterfaceIdiom"))
    {
      v10 = 0;
      v9 = 1;
      goto LABEL_435;
    }
  }
  v9 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "_referenceBounds");
    }
    v10 = v68 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 40.0;
      goto LABEL_69;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_435:
  v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom"))
    {
      v12 = 0;
      v11 = 1;
      goto LABEL_445;
    }
  }
  v11 = v69 ^ 1;
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v12 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v13 = 0;
    v14 = 0;
    v15 = 50.0;
    goto LABEL_69;
  }
LABEL_445:
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v13 = 0;
      v14 = 0;
LABEL_462:
      v15 = 50.0;
      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v14 = 0;
      v13 = 1;
      goto LABEL_462;
    }
  }
  v13 = v3 ^ 1;
  v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "_referenceBounds");
  }
  v14 = v73 ^ 1;
  BSSizeRoundForScale();
  if (v74 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_462;
  v15 = 50.0;
LABEL_69:
  if (v14)

  if (v13)
  if (v12)

  if (v11)
  if (v10)

  if (v9)
  if (v124)

  if (v125)
  if (v130)

  if (v126)
  if ((_DWORD)v127)

  if ((_DWORD)v128)
  if (HIDWORD(v128))

  if ((_DWORD)v129)
  if (HIDWORD(v127))

  if (HIDWORD(v129))
  if (v131)

  if (v133)
  if ((_DWORD)v132)

  if (HIDWORD(v132))
  if (DWORD1(v134))

  if (DWORD2(v134))
  if ((_DWORD)v134)

  if (HIDWORD(v134))
  if (*(_DWORD *)&v135[4])

  if (*(_DWORD *)&v135[8])
  if (*(_DWORD *)&v136[4])

  if (*(_DWORD *)&v136[8])
  if (*(_DWORD *)v135)

  if (*(_DWORD *)v136)
  if (*(_DWORD *)&v136[12])

  if (*(_DWORD *)&v136[20])
  if (*(_DWORD *)&v136[16])

  if (*(_DWORD *)&v136[24])
  if (*(_DWORD *)&v136[28])

  if (*(_DWORD *)&v136[32])
  if (*(_DWORD *)&v136[36])

  if (*(_DWORD *)&v137[8])
  if (*(_DWORD *)v137)

  if (*(_DWORD *)&v137[4])
  if ((_DWORD)v138)

  if (DWORD1(v138))
  if (DWORD2(v138))

  if (HIDWORD(v138))
  {

    if (!v139)
      goto LABEL_157;
  }
  else if (!v139)
  {
LABEL_157:
    if (v140)
      goto LABEL_158;
    goto LABEL_168;
  }

  if (v140)
  {
LABEL_158:

    if (!v141)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v141)
  {
LABEL_159:
    if (v142)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v142)
  {
LABEL_160:

    if (!v143)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v143)
  {
LABEL_161:
    if (v144)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v144)
  {
LABEL_162:

    if (!(_DWORD)v145)
      goto LABEL_163;
    goto LABEL_173;
  }
LABEL_172:
  if (!(_DWORD)v145)
  {
LABEL_163:
    if (HIDWORD(v145))
      goto LABEL_164;
    goto LABEL_174;
  }
LABEL_173:

  if (HIDWORD(v145))
  {
LABEL_164:

    if (!v146)
      return v15;
    goto LABEL_175;
  }
LABEL_174:
  if (v146)
LABEL_175:

  return v15;
}

- (UIView)unblockDeviceView
{
  return self->_unblockDeviceView;
}

- (UIView)authenticationView
{
  return self->_authenticationView;
}

- (CSDeviceBlockViewDelegate)deviceBlockDelegate
{
  return (CSDeviceBlockViewDelegate *)objc_loadWeakRetained((id *)&self->_deviceBlockDelegate);
}

- (void)setDeviceBlockDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deviceBlockDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceBlockDelegate);
  objc_storeStrong((id *)&self->_authenticationView, 0);
  objc_storeStrong((id *)&self->_unblockDeviceView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_emergencyButton, 0);
  objc_storeStrong((id *)&self->_unblockDeviceButton, 0);
}

@end
