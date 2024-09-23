@implementation HUHomePodStereoSwapperCell

- (HUHomePodStereoSwapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUHomePodStereoSwapperCell;
  return -[HUHomePodStereoSwapperCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (void)finishSetupWithDelegate:(id)a3 selectionStyle:(int64_t)a4 homePodVariant:(unint64_t)a5
{
  HUHomePodDetailView *v8;
  HUHomePodDetailView *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  HUHomePodDetailView *rightHomePod;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HUHomePodStereoSwapperCell setDelegate:](self, "setDelegate:", a3);
  -[HUHomePodStereoSwapperCell setSelectionStyle:](self, "setSelectionStyle:", a4);
  -[HUHomePodStereoSwapperCell setHomePodVariant:](self, "setHomePodVariant:", a5);
  v8 = -[HUHomePodDetailView initWithRole:variant:]([HUHomePodDetailView alloc], "initWithRole:variant:", 1, -[HUHomePodStereoSwapperCell homePodVariant](self, "homePodVariant"));
  -[HUHomePodStereoSwapperCell setLeftHomePod:](self, "setLeftHomePod:", v8);

  v9 = -[HUHomePodDetailView initWithRole:variant:]([HUHomePodDetailView alloc], "initWithRole:variant:", 2, -[HUHomePodStereoSwapperCell homePodVariant](self, "homePodVariant"));
  -[HUHomePodStereoSwapperCell setRightHomePod:](self, "setRightHomePod:", v9);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePodStereoSwapperCell setSwapButton:](self, "setSwapButton:", v10);

  -[HUHomePodStereoSwapperCell swapButton](self, "swapButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 0, v12);

  -[HUHomePodStereoSwapperCell swapButton](self, "swapButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HUNullableImageNamed(CFSTR("SpeakerFlipper"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:forState:", v14, 0);

  -[HUHomePodStereoSwapperCell swapButton](self, "swapButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__swap, 64);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  rightHomePod = self->_rightHomePod;
  v28[0] = self->_leftHomePod;
  v28[1] = rightHomePod;
  v28[2] = self->_swapButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HUHomePodStereoSwapperCell contentView](self, "contentView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  -[HUHomePodStereoSwapperCell _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = (void *)MEMORY[0x1E0CB3718];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke;
  v4[3] = &unk_1E6F5B4B8;
  v4[4] = self;
  __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke((uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConstraints:", v3);

}

id __47__HUHomePodStereoSwapperCell__setupConstraints__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v68;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  void *v74;
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
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[14];
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v92 = v2;
  v93 = objc_opt_new();
  v3 = (void *)v93;
  v4 = (void *)objc_opt_new();
  v94 = v4;
  v95 = objc_opt_new();
  v86 = (void *)v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v88;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v88 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "addLayoutGuide:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "swapButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "swapButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leftHomePod");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "heightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v22);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rightHomePod");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v27);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "leftHomePod");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "rightHomePod");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v37);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v4;
  objc_msgSend(v4, "widthAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:multiplier:", v44, 0.05);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v86, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:multiplier:", v47, 0.07);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "leftHomePod");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "leftHomePod");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v53);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "rightHomePod");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v56 = v2;
  v73 = v2;
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "rightHomePod");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "leadingAnchor");
  v61 = v3;
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = v85;
  v91[1] = v84;
  v91[2] = v83;
  v91[3] = v80;
  v91[4] = v82;
  v91[5] = v81;
  v91[6] = v79;
  v91[7] = v78;
  v91[8] = v76;
  v91[9] = v74;
  v91[10] = v77;
  v91[11] = v72;
  v91[12] = v58;
  v91[13] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 14);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leftHomePod");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rightHomePod");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "swapButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("leadingSwapButtonMargin, trailingSwapButtonMargin, leftSpeakerMargin, rightSpeakerMargin, leftHomePodDetailView, rightHomePodDetailView, swapButton"), v56, v61, v4, v86, v65, v66, v67, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[leftSpeakerMargin][leftHomePodDetailView][leadingSwapButtonMargin][swapButton][trailingSwapButtonMargin][rightHomePodDetailView][rightSpeakerMargin]|"), 0x10000, 0, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "arrayByAddingObjectsFromArray:", v64);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

- (void)_swap
{
  void *v3;
  void *v4;
  id WeakRetained;

  -[HUHomePodStereoSwapperCell swapButton](self, "swapButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAnimationUtilities schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:](HUAnimationUtilities, "schedulePopAnimation:scaleFactor:beginDuration:endDuration:completion:", v3, 0, 0.8, 0.2, 0.4);

  -[HUHomePodStereoSwapperCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didPressSwapButton:", self);

  }
}

- (UIButton)swapButton
{
  return self->_swapButton;
}

- (void)setSwapButton:(id)a3
{
  objc_storeStrong((id *)&self->_swapButton, a3);
}

- (unint64_t)homePodVariant
{
  return self->_homePodVariant;
}

- (void)setHomePodVariant:(unint64_t)a3
{
  self->_homePodVariant = a3;
}

- (HUHomePodDetailView)leftHomePod
{
  return self->_leftHomePod;
}

- (void)setLeftHomePod:(id)a3
{
  objc_storeStrong((id *)&self->_leftHomePod, a3);
}

- (HUHomePodDetailView)rightHomePod
{
  return self->_rightHomePod;
}

- (void)setRightHomePod:(id)a3
{
  objc_storeStrong((id *)&self->_rightHomePod, a3);
}

- (HUHomePodStereoSwapperCellDelegate)delegate
{
  return (HUHomePodStereoSwapperCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rightHomePod, 0);
  objc_storeStrong((id *)&self->_leftHomePod, 0);
  objc_storeStrong((id *)&self->_swapButton, 0);
}

@end
