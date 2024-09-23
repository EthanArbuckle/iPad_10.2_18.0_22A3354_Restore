@implementation HUGridActionSetCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUGridActionSetCell)initWithCoder:(id)a3
{
  HUGridActionSetCell *v3;
  HUGridActionSetCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetCell;
  v3 = -[HUGridCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUGridActionSetCell _setupActionSetCell](v3, "_setupActionSetCell");
  return v4;
}

- (HUGridActionSetCell)initWithFrame:(CGRect)a3
{
  HUGridActionSetCell *v3;
  HUGridActionSetCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridActionSetCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUGridActionSetCell _setupActionSetCell](v3, "_setupActionSetCell");
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[HUGridActionSetCell setItem:](self, "setItem:", 0);
  -[HUGridActionSetCell setInternalExecuteActionSetFuture:](self, "setInternalExecuteActionSetFuture:", 0);
  -[HUGridActionSetCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[HUGridActionSetCell setUseDefaultCellBackgroundColor:](self, "setUseDefaultCellBackgroundColor:", 0);
  -[HUGridActionSetCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithIconDescriptor:displayStyle:animated:", 0, 1, 0);

  v4.receiver = self;
  v4.super_class = (Class)HUGridActionSetCell;
  -[HUGridCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)_setupActionSetCell
{
  HUGridActionSetTitleAndDescriptionView *v3;
  void *v4;
  HUGridActionSetTitleAndDescriptionView *v5;
  void *v6;
  void *v7;
  void *v8;
  HUPieProgressView *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = [HUGridActionSetTitleAndDescriptionView alloc];
  -[HUGridCell gridForegroundContentView](self, "gridForegroundContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUGridActionSetTitleAndDescriptionView initWithFrame:titleLabelSuperview:](v3, "initWithFrame:titleLabelSuperview:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HUGridActionSetCell setTitleAndDescriptionView:](self, "setTitleAndDescriptionView:", v5);

  -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUGridActionSetCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v9 = -[HUPieProgressView initWithStyle:]([HUPieProgressView alloc], "initWithStyle:", 1);
  -[HUGridActionSetCell setProgressView:](self, "setProgressView:", v9);

  -[HUGridActionSetCell progressView](self, "progressView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesWhenStopped:", 1);

  -[HUGridCell gridForegroundContentView](self, "gridForegroundContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetCell progressView](self, "progressView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[HUGridActionSetCell progressView](self, "progressView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (HUIconView)iconView
{
  HUIconView *iconView;
  HUIconView *v4;
  HUIconView *v5;
  void *v6;
  void *v7;

  iconView = self->_iconView;
  if (!iconView)
  {
    v4 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
    v5 = self->_iconView;
    self->_iconView = v4;

    -[HUGridActionSetCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_iconView);

    -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIconView setContentMode:](self->_iconView, "setContentMode:", 1);
    -[HUGridCell contentEffect](self, "contentEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconView setVibrancyEffect:](self->_iconView, "setVibrancyEffect:", v7);

    iconView = self->_iconView;
  }
  return iconView;
}

- (void)setExecuteActionSetFuture:(id)a3
{
  NAFuture *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id location;

  v5 = (NAFuture *)a3;
  if (self->_executeActionSetFuture != v5)
  {
    objc_storeStrong((id *)&self->_executeActionSetFuture, a3);
    -[HUGridActionSetCell internalExecuteActionSetFuture](self, "internalExecuteActionSetFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithError:", v7);

    if (v5)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[HUGridActionSetCell setInternalExecuteActionSetFuture:](self, "setInternalExecuteActionSetFuture:", v8);

      objc_initWeak(&location, self);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __49__HUGridActionSetCell_setExecuteActionSetFuture___block_invoke;
      v15 = &unk_1E6F4E380;
      objc_copyWeak(&v16, &location);
      v9 = (id)-[NAFuture addCompletionBlock:](v5, "addCompletionBlock:", &v12);
      -[HUGridActionSetCell progressView](self, "progressView", v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell internalExecuteActionSetFuture](self, "internalExecuteActionSetFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startWithFuture:", v11);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      -[HUGridActionSetCell setInternalExecuteActionSetFuture:](self, "setInternalExecuteActionSetFuture:", 0);
    }
  }

}

void __49__HUGridActionSetCell_setExecuteActionSetFuture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "internalExecuteActionSetFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:error:", v6, v5);

}

- (void)setAccessoryView:(id)a3
{
  UIView **p_accessoryView;
  void *v6;
  id v7;

  p_accessoryView = &self->_accessoryView;
  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", *p_accessoryView) & 1) == 0)
  {
    -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUGridActionSetCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", *p_accessoryView);

    -[HUGridActionSetCell _invalidateConstraints](self, "_invalidateConstraints");
  }

}

- (HUGridSceneCellLayoutOptions)sceneCellLayoutOptions
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

  return (HUGridSceneCellLayoutOptions *)v6;
}

- (void)setUseDefaultCellBackgroundColor:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_useDefaultCellBackgroundColor != a3)
  {
    v3 = a3;
    self->_useDefaultCellBackgroundColor = a3;
    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUseDefaultCellBackgroundColor:", v3);

  }
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
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
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[2];

  v3 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[HUGridActionSetCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0D30D18];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "resultsContainRequiredProperties:", v6);

  -[HUGridActionSetCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v7 & 1) == 0)
  {
    -[HUGridActionSetCell item](self, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Item (%@) is missing required properties"), v9);

  }
  v18.receiver = self;
  v18.super_class = (Class)HUGridActionSetCell;
  -[HUGridCell updateUIWithAnimation:](&v18, sel_updateUIWithAnimation_, v3);
  if ((v7 & 1) != 0)
  {
    -[HUGridActionSetCell _updateLabels](self, "_updateLabels");
    -[HUGridActionSetCell item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0D31460]);
      v14 = (id)objc_msgSend(v15, "initWithImageIdentifier:", *MEMORY[0x1E0D307B0]);
    }
    v16 = v14;

    -[HUGridActionSetCell iconView](self, "iconView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithIconDescriptor:displayStyle:animated:", v16, -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle"), v3);

  }
  else
  {
    -[HUGridActionSetCell _updateLabelsWithTitle:description:](self, "_updateLabelsWithTitle:description:", &stru_1E6F60E80, &stru_1E6F60E80);
  }
}

- (void)layoutOptionsDidChange
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUGridActionSetCell;
  -[HUGridCell layoutOptionsDidChange](&v8, sel_layoutOptionsDidChange);
  -[HUGridActionSetCell _updateLabels](self, "_updateLabels");
  -[HUGridActionSetCell _invalidateConstraints](self, "_invalidateConstraints");
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconVibrancyEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "vibrancyEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUGridActionSetCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVibrancyEffect:", v6);

  if (!v5)
  {

  }
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUGridActionSetCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HUGridActionSetCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUGridActionSetCell _updateLabelsWithTitle:description:](self, "_updateLabelsWithTitle:description:", v8, v7);
}

- (void)_updateLabelsWithTitle:(id)a3 description:(id)a4
{
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  id v39;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = (__CFString *)a4;
  v8 = (__CFString *)a3;
  objc_msgSend(v6, "dictionary");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CEA098]);

  v12 = -[HUGridActionSetCell useDefaultCellBackgroundColor](self, "useDefaultCellBackgroundColor");
  v13 = (_QWORD *)MEMORY[0x1E0CEA0A0];
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v14, *v13);

  }
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleInterLineSpacing");
  objc_msgSend(v16, "setMinimumLineHeight:");

  -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleInterLineSpacing");
  objc_msgSend(v16, "setMaximumLineHeight:");

  objc_msgSend(v16, "setAlignment:", 4);
  objc_msgSend(v16, "setLineBreakMode:", 4);
  objc_msgSend(v16, "setAllowsDefaultTighteningForTruncation:", 1);
  LODWORD(v19) = 1053609165;
  objc_msgSend(v16, "setHyphenationFactor:", v19);
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CEA0D0]);
  v20 = (void *)objc_msgSend(v39, "mutableCopy");
  -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptionFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v11);

  if (-[HUGridCell backgroundState](self, "backgroundState") == 1)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, *v13);

  -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v25 = v8;
  else
    v25 = &stru_1E6F60E80;
  -[__CFString stringWithAttributes:](v25, "stringWithAttributes:", v39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v27 = v7;
  else
    v27 = &stru_1E6F60E80;
  -[__CFString stringWithAttributes:](v27, "stringWithAttributes:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "updateTitleText:descriptionText:", v26, v28);
  -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "numberOfTitleLines");
  -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setNumberOfLines:", v30);

  -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "titleDescriptionLineSpacing");
    v37 = v36;
    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTitleDescriptionLineSpacing:", v37);

  }
}

- (void)_invalidateConstraints
{
  void *v3;
  void *v4;
  void *v5;

  -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[HUGridActionSetCell setActionSetCellConstraints:](self, "setActionSetCellConstraints:", 0);
  -[HUGridActionSetCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
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
  double v41;
  void *v42;
  double v43;
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
  double v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  void *v86;
  void *v87;
  objc_super v88;

  -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellInnerMargin");
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    -[HUGridActionSetCell iconView](self, "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

    -[HUGridActionSetCell iconView](self, "iconView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconSize");
    objc_msgSend(v17, "constraintEqualToConstant:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v19);

    -[HUGridActionSetCell iconView](self, "iconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "iconSize");
    objc_msgSend(v21, "constraintEqualToConstant:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "iconInnerHorizontalMargin");
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v29);

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v34);

    -[HUGridActionSetCell accessoryView](self, "accessoryView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUGridActionSetCell titleAndDescriptionView](self, "titleAndDescriptionView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "leadingAnchor");
    }
    else
    {
      -[HUGridActionSetCell contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "iconInnerHorizontalMargin");
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v43) = 1148829696;
    objc_msgSend(v42, "setPriority:", v43);
    objc_msgSend(v4, "addObject:", v42);
    -[HUGridActionSetCell progressView](self, "progressView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerXAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v48);

    -[HUGridActionSetCell progressView](self, "progressView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerYAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v53);

    -[HUGridActionSetCell progressView](self, "progressView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 16.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v58);

    -[HUGridActionSetCell progressView](self, "progressView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "heightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridActionSetCell iconView](self, "iconView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, 16.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v63);

    -[HUGridActionSetCell accessoryView](self, "accessoryView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "centerYAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell contentView](self, "contentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "centerYAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v69);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell contentView](self, "contentView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "iconInnerHorizontalMargin");
      objc_msgSend(v71, "constraintEqualToAnchor:constant:", v73, -v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v76);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "heightAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell contentView](self, "contentView");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "heightAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridActionSetCell sceneCellLayoutOptions](self, "sceneCellLayoutOptions");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "iconInnerHorizontalMargin");
      objc_msgSend(v78, "constraintLessThanOrEqualToAnchor:constant:", v80, v82 * -2.0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v83);

      -[HUGridActionSetCell accessoryView](self, "accessoryView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v85) = 1144750080;
      objc_msgSend(v84, "setContentHuggingPriority:forAxis:", 0, v85);

    }
    -[HUGridActionSetCell setActionSetCellConstraints:](self, "setActionSetCellConstraints:", v4);
    v86 = (void *)MEMORY[0x1E0CB3718];
    -[HUGridActionSetCell actionSetCellConstraints](self, "actionSetCellConstraints");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "activateConstraints:", v87);

  }
  v88.receiver = self;
  v88.super_class = (Class)HUGridActionSetCell;
  -[HUGridActionSetCell updateConstraints](&v88, sel_updateConstraints);
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NAFuture)executeActionSetFuture
{
  return self->_executeActionSetFuture;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (HUGridActionSetTitleAndDescriptionView)titleAndDescriptionView
{
  return self->_titleAndDescriptionView;
}

- (void)setTitleAndDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_titleAndDescriptionView, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void)setSceneCellLayoutOptions:(id)a3
{
  objc_storeWeak((id *)&self->_sceneCellLayoutOptions, a3);
}

- (BOOL)useDefaultCellBackgroundColor
{
  return self->_useDefaultCellBackgroundColor;
}

- (HUPieProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (NSArray)actionSetCellConstraints
{
  return self->_actionSetCellConstraints;
}

- (void)setActionSetCellConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetCellConstraints, a3);
}

- (NAFuture)internalExecuteActionSetFuture
{
  return self->_internalExecuteActionSetFuture;
}

- (void)setInternalExecuteActionSetFuture:(id)a3
{
  objc_storeStrong((id *)&self->_internalExecuteActionSetFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalExecuteActionSetFuture, 0);
  objc_storeStrong((id *)&self->_actionSetCellConstraints, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_destroyWeak((id *)&self->_sceneCellLayoutOptions);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleAndDescriptionView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_executeActionSetFuture, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
