@implementation HUGridHomeCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridHomeCell)initWithFrame:(CGRect)a3
{
  HUGridHomeCell *v3;
  HUGridHomeCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridHomeCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shouldShowHomeName = 0;
    v3->_shouldShowAsEmptyHome = 0;
    -[HUGridHomeCell _setupCell](v3, "_setupCell");
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUGridHomeCell;
  -[HUGridCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUGridHomeCell setShouldShowHomeName:](self, "setShouldShowHomeName:", 0);
  -[HUGridHomeCell setShouldShowAsEmptyHome:](self, "setShouldShowAsEmptyHome:", 0);
  -[HUGridHomeCell setItem:](self, "setItem:", 0);
  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E6F60E80);

  -[HUGridHomeCell infoView](self, "infoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetView");

}

- (void)setShouldShowAsEmptyHome:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  self->_shouldShowAsEmptyHome = a3;
  v4 = -[HUGridHomeCell shouldShowAsEmptyHome](self, "shouldShowAsEmptyHome");
  -[HUGridHomeCell infoView](self, "infoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[HUGridHomeCell iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[HUGridHomeCell iconView](self, "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 0);

    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 0);

    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = 0;
  }
  objc_msgSend(v9, "setHidden:", v10);

}

- (void)_setupCell
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HUCCInfoMosaicGridView *v43;
  HUCCInfoMosaicGridView *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  -[HUGridHomeCell setIconView:](self, "setIconView:", v3);

  -[HUGridHomeCell iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridHomeCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 38.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v11);

  -[HUGridHomeCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell iconView](self, "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  v15 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUGridHomeCell setPrimaryLabel:](self, "setPrimaryLabel:", v15);

  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);

  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 2);

  v21 = objc_alloc(MEMORY[0x1E0CEABE8]);
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "secondaryVibrancyEffect");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "initWithEffect:", v23);
  -[HUGridHomeCell setSecondaryLabelEffectView:](self, "setSecondaryLabelEffectView:", v24);

  -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUGridHomeCell setSecondaryLabel:](self, "setSecondaryLabel:", v26);

  -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v28);

  -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAdjustsFontForContentSizeCategory:", 1);

  -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  v34 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v35;
  -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v34, "initWithArrangedSubviews:", v37);
  -[HUGridHomeCell setVerticalStackView:](self, "setVerticalStackView:", v38);

  -[HUGridHomeCell verticalStackView](self, "verticalStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridHomeCell verticalStackView](self, "verticalStackView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAxis:", 1);

  -[HUGridHomeCell contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell verticalStackView](self, "verticalStackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v42);

  v43 = [HUCCInfoMosaicGridView alloc];
  v44 = -[HUCCInfoMosaicGridView initWithFrame:](v43, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUGridHomeCell setInfoView:](self, "setInfoView:", v44);

  -[HUGridHomeCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell infoView](self, "infoView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", v46);

  -[HUGridHomeCell infoView](self, "infoView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setHidden:", 1);

}

- (id)cellLayoutOptions
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend((id)objc_opt_class(), "layoutOptionsClass");
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  return v6;
}

- (void)setShouldShowHomeName:(BOOL)a3
{
  if (self->_shouldShowHomeName != a3)
  {
    self->_shouldShowHomeName = a3;
    -[HUGridHomeCell _updatePrimaryLabel](self, "_updatePrimaryLabel");
  }
}

- (void)_updatePrimaryLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  if (-[HUGridHomeCell shouldShowHomeName](self, "shouldShowHomeName"))
  {
    -[HUGridHomeCell item](self, "item");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "latestResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterHomeTileTitle"), CFSTR("HUControlCenterHomeTileTitle"), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    -[HUGridHomeCell primaryLabel](self, "primaryLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v10);

    -[HUGridHomeCell primaryLabel](self, "primaryLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeToFit");

  }
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  return -[HUCCInfoMosaicGridView mosaicLayoutGeometry](self->_infoView, "mosaicLayoutGeometry");
}

- (void)setMosaicLayoutGeometry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUGridHomeCell infoView](self, "infoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMosaicLayoutGeometry:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (-[HUGridHomeCell shouldShowAsEmptyHome](self, "shouldShowAsEmptyHome"))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUGridHomeCell;
    -[HUGridCell updateUIWithAnimation:](&v14, sel_updateUIWithAnimation_, v3);
LABEL_8:
    -[HUGridHomeCell primaryLabel](self, "primaryLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", &stru_1E6F60E80);

    goto LABEL_9;
  }
  -[HUGridHomeCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "resultsContainRequiredProperties:", v6);

  -[HUGridHomeCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v7 & 1) == 0)
  {
    -[HUGridHomeCell item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Item (%@) is missing required properties"), v9);

  }
  v14.receiver = self;
  v14.super_class = (Class)HUGridHomeCell;
  -[HUGridCell updateUIWithAnimation:](&v14, sel_updateUIWithAnimation_, v3);
  if ((v7 & 1) == 0)
    goto LABEL_8;
  -[HUGridHomeCell _updatePrimaryLabel](self, "_updatePrimaryLabel");
LABEL_9:
  -[HUGridHomeCell infoView](self, "infoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterEmptyHomeWarning"), CFSTR("HUControlCenterEmptyHomeWarning"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUControlCenterEmptyHomeAction"), CFSTR("HUControlCenterEmptyHomeAction"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateUIWithInfoText:andActionText:", v12, v13);

}

- (void)layoutOptionsDidChange
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUGridHomeCell;
  -[HUGridCell layoutOptionsDidChange](&v12, sel_layoutOptionsDidChange);
  -[HUGridHomeCell _invalidateConstraints](self, "_invalidateConstraints");
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell primaryLabel](self, "primaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryVibrancyEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEffect:", v10);

}

- (void)_invalidateConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[HUGridHomeCell cellConstraints](self, "cellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridHomeCell cellConstraints](self, "cellConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[HUGridHomeCell setCellConstraints:](self, "setCellConstraints:", 0);
  }
  -[HUGridHomeCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
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
  objc_super v110;
  _QWORD v111[21];

  v111[19] = *MEMORY[0x1E0C80C00];
  v110.receiver = self;
  v110.super_class = (Class)HUGridHomeCell;
  -[HUGridHomeCell updateConstraints](&v110, sel_updateConstraints);
  -[HUGridHomeCell cellConstraints](self, "cellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUGridHomeCell iconView](self, "iconView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "leadingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "leadingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "cellInnerMargin");
    objc_msgSend(v107, "constraintEqualToAnchor:constant:", v105, v4 * 1.5);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = v104;
    -[HUGridHomeCell iconView](self, "iconView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "iconInnerHorizontalMargin");
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v99, -v5);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v111[1] = v98;
    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "cellInnerMargin");
    objc_msgSend(v95, "constraintEqualToAnchor:constant:", v93, v6 * -1.5);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v111[2] = v92;
    -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v111[3] = v87;
    -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v111[4] = v82;
    -[HUGridHomeCell iconView](self, "iconView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "topAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "cellInnerMargin");
    objc_msgSend(v79, "constraintGreaterThanOrEqualToAnchor:constant:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v111[5] = v76;
    -[HUGridHomeCell iconView](self, "iconView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "cellInnerMargin");
    objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:constant:", v71, -v7);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v111[6] = v70;
    -[HUGridHomeCell iconView](self, "iconView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v111[7] = v65;
    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "cellInnerMargin");
    objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v111[8] = v59;
    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell cellLayoutOptions](self, "cellLayoutOptions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "cellInnerMargin");
    objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:constant:", v54, -v8);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v111[9] = v53;
    -[HUGridHomeCell verticalStackView](self, "verticalStackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerYAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v111[10] = v48;
    -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v111[11] = v43;
    -[HUGridHomeCell secondaryLabel](self, "secondaryLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell secondaryLabelEffectView](self, "secondaryLabelEffectView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v111[12] = v38;
    -[HUGridHomeCell iconView](self, "iconView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 38.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v111[13] = v35;
    -[HUGridHomeCell iconView](self, "iconView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToConstant:", 38.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v111[14] = v32;
    -[HUGridHomeCell infoView](self, "infoView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v111[15] = v27;
    -[HUGridHomeCell infoView](self, "infoView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v111[16] = v22;
    -[HUGridHomeCell infoView](self, "infoView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v111[17] = v11;
    -[HUGridHomeCell infoView](self, "infoView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v111[18] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridHomeCell setCellConstraints:](self, "setCellConstraints:", v17);

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridHomeCell cellConstraints](self, "cellConstraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v19);

  }
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
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

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (BOOL)shouldShowHomeName
{
  return self->_shouldShowHomeName;
}

- (BOOL)shouldShowAsEmptyHome
{
  return self->_shouldShowAsEmptyHome;
}

- (UIImage)homeImage
{
  return self->_homeImage;
}

- (void)setHomeImage:(id)a3
{
  objc_storeStrong((id *)&self->_homeImage, a3);
}

- (UIVisualEffectView)secondaryLabelEffectView
{
  return self->_secondaryLabelEffectView;
}

- (void)setSecondaryLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, a3);
}

- (NSArray)cellConstraints
{
  return self->_cellConstraints;
}

- (void)setCellConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_cellConstraints, a3);
}

- (HUCCInfoMosaicGridView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
  objc_storeStrong((id *)&self->_infoView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_cellConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryLabelEffectView, 0);
  objc_storeStrong((id *)&self->_homeImage, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
