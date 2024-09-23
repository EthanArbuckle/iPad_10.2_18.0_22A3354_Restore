@implementation HUHomePodDetailView

- (HUHomePodDetailView)initWithRole:(unint64_t)a3 variant:(unint64_t)a4
{
  HUHomePodDetailView *v6;
  HUHomePodDetailView *v7;
  uint64_t v8;
  UILabel *unitNameLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  UIView *unitImageView;
  uint64_t v24;
  UIImageView *unitBadgeLabel;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _QWORD v41[3];
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)HUHomePodDetailView;
  v6 = -[HUHomePodDetailView init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mediaSystemRole = a3;
    v8 = objc_opt_new();
    unitNameLabel = v7->_unitNameLabel;
    v7->_unitNameLabel = (UILabel *)v8;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_unitNameLabel, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](v7->_unitNameLabel, "setNumberOfLines:", 0);
    v11 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_configurationWithHierarchicalColors:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0CEB5B0], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationWithFont:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "configurationByApplyingConfiguration:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0CEA658]);
    if (a4 == 2)
      v20 = CFSTR("homepodmini.fill");
    else
      v20 = CFSTR("homepod.fill");
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v20, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "initWithImage:", v21);
    unitImageView = v7->_unitImageView;
    v7->_unitImageView = (UIView *)v22;

    -[UIView setContentMode:](v7->_unitImageView, "setContentMode:", 2);
    -[UIView setUserInteractionEnabled:](v7->_unitImageView, "setUserInteractionEnabled:", 1);
    v24 = objc_opt_new();
    unitBadgeLabel = v7->_unitBadgeLabel;
    v7->_unitBadgeLabel = (UIImageView *)v24;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7->_unitBadgeLabel, "setTintColor:", v26);

    -[HUHomePodDetailView _updateImagesForRole](v7, "_updateImagesForRole");
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v41[0] = v7->_unitNameLabel;
    v41[1] = v7->_unitImageView;
    v41[2] = v7->_unitBadgeLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[HUHomePodDetailView addSubview:](v7, "addSubview:", v32);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v29);
    }

    -[HUHomePodDetailView _setupConstraints](v7, "_setupConstraints");
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v7, sel__speakerTapped);
    -[HUHomePodDetailView addGestureRecognizer:](v7, "addGestureRecognizer:", v33);
    objc_msgSend(MEMORY[0x1E0CEA630], "automaticStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomePodDetailView setHoverStyle:](v7, "setHoverStyle:", v34);

  }
  return v7;
}

- (void)_setupConstraints
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
  _QWORD v68[18];

  v68[16] = *MEMORY[0x1E0C80C00];
  -[HUHomePodDetailView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, -14.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -8.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -11.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastBaselineAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView bottomAnchor](self, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -17.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView centerXAnchor](self, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView centerXAnchor](self, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView leadingAnchor](self, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v29);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView leadingAnchor](self, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:", v32);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView trailingAnchor](self, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView trailingAnchor](self, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v38);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitImageView](self, "unitImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToConstant:", 72.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView centerYAnchor](self, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:", v43);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToConstant:", 140.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "widthAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToConstant:", 19.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintGreaterThanOrEqualToConstant:", 19.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0CB3718];
  v68[0] = v64;
  v68[1] = v67;
  v68[2] = v66;
  v68[3] = v65;
  v68[4] = v63;
  v68[5] = v61;
  v68[6] = v62;
  v68[7] = v60;
  v68[8] = v59;
  v68[9] = v55;
  v68[10] = v58;
  v68[11] = v57;
  v68[12] = v46;
  v68[13] = v49;
  v68[14] = v52;
  v68[15] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 16);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "activateConstraints:", v54);

}

- (void)_updateImagesForRole
{
  unint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[HUHomePodDetailView mediaSystemRole](self, "mediaSystemRole");
  if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    v5 = CFSTR("r.circle.fill");
  }
  else
  {
    if (v3 != 1)
    {
      -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E0CEA638];
    v5 = CFSTR("l.circle.fill");
  }
  objc_msgSend(v4, "systemImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

LABEL_7:
  -[HUHomePodDetailView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setUnitName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(void);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  HUHomePodDetailView *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD aBlock[5];
  id v28;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HUHomePodDetailView_setUnitName___block_invoke;
  aBlock[3] = &unk_1E6F4C638;
  aBlock[4] = self;
  v28 = v4;
  v6 = v4;
  v7 = _Block_copy(aBlock);
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __35__HUHomePodDetailView_setUnitName___block_invoke_2;
  v26[3] = &unk_1E6F4D988;
  v26[4] = self;
  v8 = _Block_copy(v26);
  v19 = v5;
  v20 = 3221225472;
  v21 = __35__HUHomePodDetailView_setUnitName___block_invoke_4;
  v22 = &unk_1E6F52028;
  v23 = self;
  v9 = v7;
  v24 = v9;
  v25 = v8;
  v10 = v8;
  v11 = (void (**)(void))_Block_copy(&v19);
  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel", v19, v20, v21, v22, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedText");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

LABEL_5:
    v18 = (void (**)(void))v9;
    goto LABEL_6;
  }
  v14 = (void *)v13;
  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = v11;
  if (!v17)
    goto LABEL_5;
LABEL_6:
  v18[2]();

}

void __35__HUHomePodDetailView_setUnitName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB588], 66);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v12[0] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CEA0D0];
  v13[0] = v6;
  v13[1] = v3;
  v8 = *MEMORY[0x1E0CEA098];
  v12[1] = v7;
  v12[2] = v8;
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithAttributes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unitNameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
}

uint64_t __35__HUHomePodDetailView_setUnitName___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __35__HUHomePodDetailView_setUnitName___block_invoke_3;
  v2[3] = &unk_1E6F4D988;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.45);
}

void __35__HUHomePodDetailView_setUnitName___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "unitNameLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __35__HUHomePodDetailView_setUnitName___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HUHomePodDetailView_setUnitName___block_invoke_5;
  v7[3] = &unk_1E6F4D988;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__HUHomePodDetailView_setUnitName___block_invoke_6;
  v4[3] = &unk_1E6F52000;
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v7, v4, 0.45);

}

void __35__HUHomePodDetailView_setUnitName___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "unitNameLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __35__HUHomePodDetailView_setUnitName___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (HFStringGenerator)unitName
{
  void *v2;
  void *v3;

  -[HUHomePodDetailView unitNameLabel](self, "unitNameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFStringGenerator *)v3;
}

- (void)_speakerTapped
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (!-[HUHomePodDetailView isAnimatingPop](self, "isAnimatingPop"))
  {
    -[HUHomePodDetailView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HUHomePodDetailView setIsAnimatingPop:](self, "setIsAnimatingPop:", 1);
      -[HUHomePodDetailView unitImageView](self, "unitImageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__HUHomePodDetailView__speakerTapped__block_invoke;
      v10[3] = &unk_1E6F4D988;
      v10[4] = self;
      +[HUAnimationUtilities schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:](HUAnimationUtilities, "schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:", v4, v10, 0.8, 0.2, 0.4);

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFromValue:", &unk_1E70434B8);
      objc_msgSend(v5, "setToValue:", &unk_1E70434C8);
      objc_msgSend(v5, "setDamping:", 20.0);
      objc_msgSend(v5, "setStiffness:", 200.0);
      objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime() + 0.2);
      -[HUHomePodDetailView unitBadgeLabel](self, "unitBadgeLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layer");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "addAnimation:forKey:", v5, 0);

      -[HUHomePodDetailView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[HUHomePodDetailView delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didTapSpeaker:", self);

      }
    }
  }
}

uint64_t __37__HUHomePodDetailView__speakerTapped__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPop:", 0);
}

- (unint64_t)mediaSystemRole
{
  return self->_mediaSystemRole;
}

- (UILabel)unitNameLabel
{
  return self->_unitNameLabel;
}

- (UIView)unitImageView
{
  return self->_unitImageView;
}

- (HUHomePodDetailViewDelegate)delegate
{
  return (HUHomePodDetailViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAnimatingPop
{
  return self->_isAnimatingPop;
}

- (void)setIsAnimatingPop:(BOOL)a3
{
  self->_isAnimatingPop = a3;
}

- (UIImageView)unitBadgeLabel
{
  return self->_unitBadgeLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitBadgeLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unitImageView, 0);
  objc_storeStrong((id *)&self->_unitNameLabel, 0);
}

@end
