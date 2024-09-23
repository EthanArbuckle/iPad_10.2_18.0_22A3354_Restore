@implementation HUGridServiceCell

- (unint64_t)backgroundDisplayStyle
{
  return 1;
}

- (id)prefixString
{
  HUGridServiceCell *v2;
  void *object;
  void *v4;

  v2 = self;
  object = HUGridServiceCell.prefixString()().value._object;

  if (object)
  {
    v4 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)primaryString
{
  HUGridServiceCell *v2;
  HUGridServiceCellTextView *v3;
  HFServiceNameComponents *v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = -[HUGridServiceCell serviceTextView](v2, sel_serviceTextView);
  v4 = -[HUGridServiceCellTextView serviceNameComponents](v3, sel_serviceNameComponents);

  if (v4)
  {
    v5 = -[HFServiceNameComponents serviceName](v4, sel_serviceName);

    sub_1B93EDDB4();
    v6 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return v6;
}

- (id)secondaryString
{
  return 0;
}

- (id)secondaryAttributedString
{
  return 0;
}

- (CGRect)iconViewTileFrame
{
  HUGridServiceCell *v2;
  HUIconView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = self;
  v3 = -[HUGridServiceCell iconView](v2, sel_iconView);
  -[HUIconView frame](v3, sel_frame);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)prefixLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1B8F6CEC0(self, (uint64_t)a2, (double (*)(void))HUGridServiceCell.prefixLabelTileFrame());
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)primaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1B8F6CEC0(self, (uint64_t)a2, (double (*)(void))HUGridServiceCell.primaryLabelTileFrame());
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)secondaryLabelTileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)prefixLabelShouldFeather
{
  return 0;
}

- (BOOL)primaryLabelShouldFeather
{
  return 0;
}

- (BOOL)secondaryLabelShouldFeather
{
  return 0;
}

- (id)prefixLabelFont
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)primaryLabelFont
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)secondaryLabelFont
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (id)prefixLabelTextColor
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (id)primaryLabelTextColor
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (id)secondaryLabelTextColor
{
  return sub_1B8F6D058(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (CGRect)tileFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[HUGridServiceCell frame](self, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  HUGridServiceCell *v2;
  HUGridCellLayoutOptions *v3;
  HUGridServiceCell *v4;
  double v5;
  double v6;

  v2 = self;
  v3 = -[HUGridCell layoutOptions](v2, sel_layoutOptions);
  if (v3)
  {
    v4 = (HUGridServiceCell *)v3;
    -[HUGridCellLayoutOptions cellCornerRadius](v3, sel_cellCornerRadius);
    v6 = v5;

    v2 = v4;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)createBackgroundBlurView
{
  return 0;
}

- (BOOL)recognizeDoubleClickGesture
{
  return 0;
}

- (id)baseIconViewConfiguration
{
  HUGridServiceCell *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v2 = self;
  HUGridServiceCell.baseIconViewConfiguration()((uint64_t)v10);

  v3 = v11;
  if (!v11)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v10, v11);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  v8 = (void *)sub_1B93EEAF8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

- (id)prefixLabelOnTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)primaryLabelOnTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)secondaryLabelOnTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_blackColor);
}

- (id)prefixLabelOffTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (id)primaryLabelOffTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (id)secondaryLabelOffTextColor
{
  return sub_1B8F6D524((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_whiteColor);
}

- (HUGridServiceCell)initWithCoder:(id)a3
{
  HUGridServiceCell *v3;
  HUGridServiceCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  v3 = -[HUGridCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUGridServiceCell _setupServiceCell](v3, "_setupServiceCell");
  return v4;
}

- (HUGridServiceCell)initWithFrame:(CGRect)a3
{
  HUGridServiceCell *v3;
  HUGridServiceCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUGridServiceCell _setupServiceCell](v3, "_setupServiceCell");
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUGridServiceCell;
  -[HUGridCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUGridServiceCell setServiceItem:](self, "setServiceItem:", 0);
  -[HUGridServiceCell setShowProgressIndicatorAfterDelay:](self, "setShowProgressIndicatorAfterDelay:", 0);
  -[HUGridServiceCell setShowUpdatingStateAfterDelay:](self, "setShowUpdatingStateAfterDelay:", 0);
  -[HUGridServiceCell iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithIconDescriptor:displayStyle:animated:", 0, -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle"), 0);

  -[HUGridServiceCell setAccessoryView:](self, "setAccessoryView:", 0);
  -[HUGridServiceCell setShouldColorDescription:](self, "setShouldColorDescription:", 1);
  -[HUGridServiceCell setHasUpdatedUISinceLastReuse:](self, "setHasUpdatedUISinceLastReuse:", 0);
  self->_shouldShowRoomName = 1;
}

- (void)_setupServiceCell
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0D33720]);
  -[HUGridServiceCell setIconView:](self, "setIconView:", v3);

  objc_msgSend((id)objc_opt_class(), "_iconTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  -[HUGridServiceCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  -[HUGridServiceCell setSupplementaryImageView:](self, "setSupplementaryImageView:", v8);

  -[HUGridServiceCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  -[HUGridServiceCell _setupCommonServiceCell](self, "_setupCommonServiceCell");
}

- (void)_setupCommonServiceCell
{
  void *v3;
  HUGridServiceCellTextView *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[HUGridServiceCell setShouldColorDescription:](self, "setShouldColorDescription:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell setDefaultDescriptionColor:](self, "setDefaultDescriptionColor:", v3);

  -[HUGridServiceCell setShouldShowLoadingState:](self, "setShouldShowLoadingState:", 1);
  self->_shouldShowRoomName = 1;
  v4 = objc_alloc_init(HUGridServiceCellTextView);
  -[HUGridServiceCell setServiceTextView:](self, "setServiceTextView:", v4);

  -[HUGridCell gridForegroundContentView](self, "gridForegroundContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  -[HUGridServiceCell setColoredDescriptionLabel:](self, "setColoredDescriptionLabel:", v7);

  -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 1);

  v9 = objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") ^ 1;
  -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsDefaultTighteningForTruncation:", v9);

  v11 = objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") ^ 1;
  -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", v11);

  +[HUGridServiceCellTextView minimumDescriptionScaleFactor](HUGridServiceCellTextView, "minimumDescriptionScaleFactor");
  v14 = v13;
  -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinimumScaleFactor:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  -[HUGridServiceCell setDescriptionLabelEffectView:](self, "setDescriptionLabelEffectView:", v16);

  -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[HUGridServiceCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidden:", 1);

  v23 = objc_alloc(MEMORY[0x1E0CEA2C8]);
  if (objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard"))
    v24 = 8;
  else
    v24 = 100;
  v25 = (void *)objc_msgSend(v23, "initWithActivityIndicatorStyle:", v24);
  -[HUGridServiceCell setActivityIndicator:](self, "setActivityIndicator:", v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell activityIndicator](self, "activityIndicator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setColor:", v26);

  -[HUGridServiceCell activityIndicator](self, "activityIndicator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidesWhenStopped:", 1);

  -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
}

- (void)setAccessoryView:(id)a3
{
  -[HUGridServiceCell setOverrideAccessoryView:](self, "setOverrideAccessoryView:", a3);
  -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
}

- (BOOL)showUpdatingStateAfterDelay
{
  BOOL v3;
  void *v4;

  if (-[HUGridServiceCell showingUpdatingState](self, "showingUpdatingState"))
    return 1;
  -[HUGridServiceCell showUpdatingStateAfterDelayToken](self, "showUpdatingStateAfterDelayToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)setShowUpdatingStateAfterDelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = a3;
  -[HUGridServiceCell showUpdatingStateAfterDelayToken](self, "showUpdatingStateAfterDelayToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __52__HUGridServiceCell_setShowUpdatingStateAfterDelay___block_invoke;
      v12 = &unk_1E6F4DD08;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "afterDelay:performBlock:", &v9, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridServiceCell setShowUpdatingStateAfterDelayToken:](self, "setShowUpdatingStateAfterDelayToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v5, "cancel");

    -[HUGridServiceCell setShowUpdatingStateAfterDelayToken:](self, "setShowUpdatingStateAfterDelayToken:", 0);
    -[HUGridServiceCell setShowingUpdatingState:](self, "setShowingUpdatingState:", 0);
  }
}

void __52__HUGridServiceCell_setShowUpdatingStateAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowingUpdatingState:", 1);
  objc_msgSend(WeakRetained, "setShowUpdatingStateAfterDelayToken:", 0);

}

- (BOOL)showProgressIndicatorAfterDelay
{
  BOOL v3;
  void *v4;

  if (-[HUGridServiceCell showingProgressIndicator](self, "showingProgressIndicator"))
    return 1;
  -[HUGridServiceCell showProgressIndicatorAfterDelayToken](self, "showProgressIndicatorAfterDelayToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)setShowProgressIndicatorAfterDelay:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = a3;
  -[HUGridServiceCell showProgressIndicatorAfterDelayToken](self, "showProgressIndicatorAfterDelayToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __56__HUGridServiceCell_setShowProgressIndicatorAfterDelay___block_invoke;
      v12 = &unk_1E6F4DD08;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "afterDelay:performBlock:", &v9, 0.5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridServiceCell setShowProgressIndicatorAfterDelayToken:](self, "setShowProgressIndicatorAfterDelayToken:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v5, "cancel");

    -[HUGridServiceCell setShowProgressIndicatorAfterDelayToken:](self, "setShowProgressIndicatorAfterDelayToken:", 0);
    -[HUGridServiceCell setShowingProgressIndicator:](self, "setShowingProgressIndicator:", 0);
  }
}

void __56__HUGridServiceCell_setShowProgressIndicatorAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowingProgressIndicator:", 1);
  objc_msgSend(WeakRetained, "setShowProgressIndicatorAfterDelayToken:", 0);

}

- (void)setShowingUpdatingState:(BOOL)a3
{
  void *v4;

  self->_showingUpdatingState = a3;
  -[HUGridServiceCell _updateText](self, "_updateText");
  -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
  -[HUGridServiceCell showUpdatingStateAfterDelayToken](self, "showUpdatingStateAfterDelayToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[HUGridServiceCell setShowUpdatingStateAfterDelayToken:](self, "setShowUpdatingStateAfterDelayToken:", 0);
}

- (void)setShowingProgressIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  self->_showingProgressIndicator = a3;
  -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
  -[HUGridServiceCell activityIndicator](self, "activityIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "startAnimating");
  else
    objc_msgSend(v5, "stopAnimating");

  -[HUGridServiceCell showProgressIndicatorAfterDelayToken](self, "showProgressIndicatorAfterDelayToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[HUGridServiceCell setShowProgressIndicatorAfterDelayToken:](self, "setShowProgressIndicatorAfterDelayToken:", 0);
}

- (BOOL)disableContinuousIconAnimation
{
  void *v2;
  char v3;

  -[HUGridServiceCell iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableContinuousAnimation");

  return v3;
}

- (void)setDisableContinuousIconAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUGridServiceCell iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableContinuousAnimation:", v3);

}

- (void)setShouldColorDescription:(BOOL)a3
{
  void *v4;

  if (self->_shouldColorDescription != a3)
  {
    self->_shouldColorDescription = a3;
    -[HUGridServiceCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[HUGridServiceCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
  }
}

- (void)setShouldShowRoomName:(BOOL)a3
{
  void *v4;

  if (self->_shouldShowRoomName != a3)
  {
    self->_shouldShowRoomName = a3;
    -[HUGridServiceCell item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[HUGridServiceCell updateUIWithAnimation:](self, "updateUIWithAnimation:", 0);
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
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v17;
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  -[HUGridServiceCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = *MEMORY[0x1E0D30C60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "resultsContainRequiredProperties:", v6);

  if ((v7 & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)HUGridServiceCell;
    -[HUGridCell updateUIWithAnimation:](&v17, sel_updateUIWithAnimation_, v3);
    -[HUGridServiceCell _updateIconAnimated:](self, "_updateIconAnimated:", v3);
    if (-[HUGridServiceCell shouldShowLoadingState](self, "shouldShowLoadingState"))
    {
      -[HUGridServiceCell item](self, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = ((unint64_t)objc_msgSend(v8, "loadingState") >> 1) & 1;

    }
    else
    {
      v9 = 0;
    }
    if (-[HUGridServiceCell shouldShowLoadingState](self, "shouldShowLoadingState"))
    {
      -[HUGridServiceCell item](self, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "loadingState") & 1;

    }
    else
    {
      v12 = 0;
    }
    if (-[HUGridServiceCell hasUpdatedUISinceLastReuse](self, "hasUpdatedUISinceLastReuse"))
    {
      -[HUGridServiceCell setShowProgressIndicatorAfterDelay:](self, "setShowProgressIndicatorAfterDelay:", v9);
      -[HUGridServiceCell item](self, "item");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "latestResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F08]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (!v16)
      {
        -[HUGridServiceCell setShowUpdatingStateAfterDelay:](self, "setShowUpdatingStateAfterDelay:", v12);
LABEL_14:
        -[HUGridServiceCell _updateText](self, "_updateText");
        -[HUGridServiceCell _updateAccessoryView](self, "_updateAccessoryView");
        -[HUGridServiceCell setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_15;
      }
    }
    else
    {
      -[HUGridServiceCell setShowingProgressIndicator:](self, "setShowingProgressIndicator:", v9);
    }
    -[HUGridServiceCell setShowingUpdatingState:](self, "setShowingUpdatingState:", v12);
    goto LABEL_14;
  }
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceNameComponents:", 0);

  -[HUGridServiceCell _updateIconAnimated:](self, "_updateIconAnimated:", v3);
LABEL_15:
  -[HUGridServiceCell setHasUpdatedUISinceLastReuse:](self, "setHasUpdatedUISinceLastReuse:", 1);
}

- (void)renounceIcon
{
  id v2;

  -[HUGridServiceCell iconView](self, "iconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renounceIconIfPossible");

}

- (void)reclaimIconIfPossible
{
  id v2;

  -[HUGridServiceCell iconView](self, "iconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reclaimIconIfPossible");

}

- (void)_updateIconAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconContentMode");
  -[HUGridServiceCell iconView](self, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentMode:", v6);

  -[HUGridServiceCell iconView](self, "iconView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithIconDescriptor:displayStyle:animated:", v10, -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle"), v3);

}

- (void)layoutOptionsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUGridServiceCell;
  -[HUGridCell layoutOptionsDidChange](&v14, sel_layoutOptionsDidChange);
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineSpacing");
  v8 = v7;
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineHeight:", v8);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconVibrancyEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vibrancyEffect");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUGridServiceCell iconView](self, "iconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVibrancyEffect:", v12);

  if (!v11)
  {

  }
  -[HUGridServiceCell _updateText](self, "_updateText");
  -[HUGridServiceCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)displayStyleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUGridServiceCell;
  -[HUGridCell displayStyleDidChange](&v3, sel_displayStyleDidChange);
  -[HUGridServiceCell _updateSecondaryContentDisplayStyle](self, "_updateSecondaryContentDisplayStyle");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  double MaxY;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  double Height;
  void *v29;
  double v30;
  double v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  CGFloat v39;
  void *v40;
  CGFloat v41;
  double v42;
  void *v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CGFloat v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  CGFloat v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  char isKindOfClass;
  void *v76;
  CGFloat v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  uint64_t v103;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  double Width;
  void *v114;
  double v115;
  void *v116;
  uint64_t v117;
  double v121;
  void *v122;
  CGFloat v123;
  void *v124;
  objc_super v125;
  _QWORD v126[2];
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v126[1] = *MEMORY[0x1E0C80C00];
  v125.receiver = self;
  v125.super_class = (Class)HUGridServiceCell;
  -[HUGridCell layoutSubviews](&v125, sel_layoutSubviews);
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellInnerMargin");
  v5 = v4;

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowIconOnly");

  if (v7)
  {
    -[HUGridServiceCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    CGRectInset(v127, v5, v5);

    -[HUGridServiceCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    UIRectCenteredIntegralRect();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[HUGridServiceCell iconView](self, "iconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    -[HUGridServiceCell _updateSupplementaryImageViewIfNecessary](self, "_updateSupplementaryImageViewIfNecessary");
  }
  else
  {
    v19 = -[HUGridServiceCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "shouldShowDescription"))
      v21 = v5;
    else
      v21 = v5 * 0.8;

    -[HUGridServiceCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    MaxY = CGRectGetMaxY(v128);

    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeToFit");

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "shouldShowDescription");
    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    Height = CGRectGetHeight(v129);
    if ((v26 & 1) == 0)
    {
      -[HUGridServiceCell serviceTextView](self, "serviceTextView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lineHeight");
      Height = Height - v30;

    }
    v31 = MaxY - v21;

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "shouldShowDescription");
    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if ((v33 & 1) != 0)
      objc_msgSend(v34, "lastBaselineToBottomDistance");
    else
      objc_msgSend(v34, "lineHeight");
    v37 = v36;

    -[HUGridServiceCell contentView](self, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v39 = v5 + CGRectGetMinX(v130);
    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "frame");
    v41 = CGRectGetHeight(v131);
    v42 = HURoundToScreenScale(v37 + v31 - v41);
    -[HUGridServiceCell contentView](self, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v44 = CGRectGetWidth(v132) + v5 * -2.0;
    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v39, v42, v44, Height);

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = objc_msgSend(v46, "shouldShowDescription");

    if ((_DWORD)v40)
    {
      -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "sizeToFit");

      -[HUGridServiceCell contentView](self, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bounds");
      v49 = v5 + CGRectGetMinX(v133);
      -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "_lastLineBaseline");
      v52 = HURoundToScreenScale(v31 - v51);
      -[HUGridServiceCell contentView](self, "contentView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bounds");
      v54 = CGRectGetWidth(v134) + v5 * -2.0;
      -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "bounds");
      v56 = CGRectGetHeight(v135);
      -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setFrame:", v49, v52, v54, v56);

      -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "bounds");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;
      -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);

    }
    -[HUGridServiceCell item](self, "item");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = *MEMORY[0x1E0D30C60];
    v126[0] = *MEMORY[0x1E0D30C60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v68, "resultsContainRequiredProperties:", v70);

    if (v71)
    {
      -[HUGridServiceCell item](self, "item");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "latestResults");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectForKeyedSubscript:", v69);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }
    -[HUGridServiceCell serviceTextView](self, "serviceTextView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "frame");
    v77 = CGRectGetMinY(v136) - v5;
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "iconToTitleSpacing");
    v80 = v77 - v79;

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "iconSize");
    v83 = v82;

    if (v80 >= v83)
      v84 = v83;
    else
      v84 = v80;
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "iconToTitleSpacing");
    v87 = v5 + v84 + v86;

    -[HUGridServiceCell contentView](self, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "bounds");
    v90 = v89 + v5 * -2.0 - v84;

    if ((isKindOfClass & 1) != 0)
    {
      v91 = v87;
    }
    else
    {
      -[HUGridServiceCell iconView](self, "iconView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92;
      if (v84 >= v90)
        v94 = v90;
      else
        v94 = v84;
      if (v84 >= v87)
        v95 = v87;
      else
        v95 = v84;
      objc_msgSend(v92, "sizeThatFits:", v94, v95);
      v90 = v96;
      v91 = v97;

    }
    -[HUGridServiceCell contentView](self, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "bounds");
    v99 = v5 + CGRectGetMinY(v137);

    v100 = (v87 - v84) * 0.5;
    if ((isKindOfClass & 1) == 0)
      v100 = 0.0;
    v101 = v99 - v100;
    -[HUGridServiceCell contentView](self, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bounds");
    if (v19 == 1)
      v107 = CGRectGetMaxX(*(CGRect *)&v103) - v5 - v90;
    else
      v107 = v5 + CGRectGetMinX(*(CGRect *)&v103);
    -[HUGridServiceCell iconView](self, "iconView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setFrame:", v107, v101, v90, v91);

    -[HUGridServiceCell _updateSupplementaryImageViewIfNecessary](self, "_updateSupplementaryImageViewIfNecessary");
    -[HUGridServiceCell accessoryView](self, "accessoryView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "sizeToFit");

    -[HUGridServiceCell accessoryView](self, "accessoryView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "frame");
    v111 = CGRectGetHeight(v138);

    if (v111 >= v84)
      v111 = v84;
    -[HUGridServiceCell accessoryView](self, "accessoryView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "frame");
    Width = CGRectGetWidth(v139);
    -[HUGridServiceCell accessoryView](self, "accessoryView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "frame");
    v115 = Width * (v111 / CGRectGetHeight(v140));

    -[HUGridServiceCell contentView](self, "contentView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "bounds");
    if (v19 == 1)
      v121 = v5 + CGRectGetMinX(*(CGRect *)&v117);
    else
      v121 = CGRectGetMaxX(*(CGRect *)&v117) - v5 - v115;
    -[HUGridServiceCell contentView](self, "contentView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "bounds");
    v123 = v5 + CGRectGetMinY(v141);
    -[HUGridServiceCell accessoryView](self, "accessoryView");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "setFrame:", v121, v123, v115, v111);

  }
}

+ (id)_iconTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
}

- (void)_updateText
{
  void *v3;
  void *v4;
  _BOOL8 v5;
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
  id v26;

  -[HUGridServiceCell _textConfiguration](self, "_textConfiguration");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "nameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceNameComponents:", v3);

  v5 = -[HUGridServiceCell shouldShowRoomName](self, "shouldShowRoomName");
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldShowRoomName:", v5);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "shouldShowDescription");

  if ((_DWORD)v6)
  {
    objc_msgSend(v26, "descriptionTextEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEffect:", v8);

    objc_msgSend(v26, "descriptionTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(v26, "descriptionTextEffect");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setHidden:", 1);

        objc_msgSend(v26, "descriptionText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithAttributes:", MEMORY[0x1E0C9AA70]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "string");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridServiceCell serviceTextView](self, "serviceTextView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDescriptionText:", v24);

        goto LABEL_8;
      }
    }
    objc_msgSend(v26, "descriptionText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "descriptionTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCell _descriptionTextAttributesWithColor:](self, "_descriptionTextAttributesWithColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithAttributes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedText:", v17);

    -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 0);
  }
  else
  {
    -[HUGridServiceCell descriptionLabelEffectView](self, "descriptionLabelEffectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[HUGridServiceCell coloredDescriptionLabel](self, "coloredDescriptionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", 0);
  }

  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDescriptionText:", 0);
LABEL_8:

  objc_msgSend(v26, "nameTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v20);

}

- (id)_descriptionTextAttributesWithColor:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0CEA230];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineSpacing");
  objc_msgSend(v6, "setMinimumLineHeight:");

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineSpacing");
  objc_msgSend(v6, "setMaximumLineHeight:");

  objc_msgSend(v6, "setLineBreakMode:", 4);
  objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0CEA098]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0CEA0A0]);
  objc_msgSend(v9, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E0CEA0D0]);

  return v9;
}

- (id)_textConfiguration
{
  HUGridServiceCellTextConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;

  v3 = objc_alloc_init(HUGridServiceCellTextConfiguration);
  -[HUGridServiceCell item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellTextConfiguration setNameComponents:](v3, "setNameComponents:", v6);

  -[HUGridServiceCell item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCellTextConfiguration setDescriptionText:](v3, "setDescriptionText:", v9);

  -[HUGridServiceCell item](self, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = objc_msgSend(v12, "integerValue");
  else
    v13 = 0;
  -[HUGridServiceCell item](self, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = objc_msgSend(v16, "integerValue");
  else
    v17 = 0;
  v18 = -[HUGridCell backgroundState](self, "backgroundState");
  if (v18 == 1)
  {
    -[HUGridServiceCell defaultDescriptionColor](self, "defaultDescriptionColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCellTextConfiguration setDescriptionTextColor:](v3, "setDescriptionTextColor:", v19);

  }
  else
  {
    -[HUGridServiceCellTextConfiguration setDescriptionTextColor:](v3, "setDescriptionTextColor:", 0);
  }
  if (-[HUGridServiceCell showingUpdatingState](self, "showingUpdatingState"))
  {
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldSuppressAllErrorsForDemo") & 1) != 0)
      goto LABEL_21;
    _HULocalizedStringWithDefaultValue(CFSTR("HUGridServiceCellReadingDescription"), CFSTR("HUGridServiceCellReadingDescription"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridServiceCellTextConfiguration setDescriptionText:](v3, "setDescriptionText:", v20);
    goto LABEL_20;
  }
  if (-[HUGridServiceCell shouldColorDescription](self, "shouldColorDescription"))
  {
    if (v17 >= 2 && v18 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUGridServiceCell defaultNameTextColor](self, "defaultNameTextColor");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    -[HUGridServiceCellTextConfiguration setNameTextColor:](v3, "setNameTextColor:", v21);

    if (v13 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridServiceCellTextConfiguration setDescriptionTextColor:](v3, "setDescriptionTextColor:", v20);
LABEL_20:

    }
  }
LABEL_21:
  -[HUGridServiceCellTextConfiguration descriptionTextColor](v3, "descriptionTextColor");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    -[HUGridCell contentEffect](self, "contentEffect");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell secondaryContentEffect](self, "secondaryContentEffect");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
    v26 = v25;
    if (v23 == v26)
    {

    }
    else
    {
      v27 = v26;
      if (v23)
      {
        v28 = objc_msgSend(v23, "isEqual:", v26);

        if ((v28 & 1) != 0)
          goto LABEL_30;
      }
      else
      {

      }
      -[HUGridCell secondaryContentEffect](self, "secondaryContentEffect");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[HUGridServiceCellTextConfiguration setDescriptionTextEffect:](v3, "setDescriptionTextEffect:", v23);
    }
  }

LABEL_30:
  return v3;
}

- (void)_updateSecondaryContentDisplayStyle
{
  _BOOL8 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle") == 2;
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColorFollowsTintColor:", v3);

  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v6 = v5;
  -[HUGridServiceCell serviceTextView](self, "serviceTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDescriptionTextColorDimmingFactor:", v6);

  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v9 = v8;
  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "innerContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  -[HUGridCell secondaryContentEffect](self, "secondaryContentEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEffect:", v12);

  -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
  v15 = v14;
  -[HUGridServiceCell firmwareUpdateView](self, "firmwareUpdateView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "innerContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v15);

  -[HUGridCell secondaryContentEffect](self, "secondaryContentEffect");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell firmwareUpdateView](self, "firmwareUpdateView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEffect:", v19);

}

- (void)_updateAccessoryView
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIView *accessoryView;
  void *v17;
  id obj;

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowAccessoryView");

  if (!v4)
    return;
  -[HUGridServiceCell overrideAccessoryView](self, "overrideAccessoryView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (-[HUGridServiceCell showingProgressIndicator](self, "showingProgressIndicator"))
    {
      -[HUGridServiceCell activityIndicator](self, "activityIndicator");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUGridServiceCell item](self, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "latestResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D30BB8];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BB8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if (v11 == 8)
      {
        -[HUGridServiceCell _createFirmwareUpdateViewIfNecessary](self, "_createFirmwareUpdateViewIfNecessary");
        -[HUGridServiceCell firmwareUpdateView](self, "firmwareUpdateView");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[HUGridServiceCell showingUpdatingState](self, "showingUpdatingState"))
          goto LABEL_15;
        -[HUGridServiceCell item](self, "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "latestResults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v15 != 1)
        {
LABEL_15:
          v5 = 0;
          goto LABEL_12;
        }
        -[HUGridServiceCell _createExclamationViewIfNecessary](self, "_createExclamationViewIfNecessary");
        -[HUGridServiceCell exclamationView](self, "exclamationView");
        v6 = objc_claimAutoreleasedReturnValue();
      }
    }
    v5 = v6;
  }
LABEL_12:
  accessoryView = self->_accessoryView;
  obj = (id)v5;
  if ((UIView *)v5 != accessoryView)
  {
    -[UIView removeFromSuperview](accessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_accessoryView, obj);
    -[HUGridServiceCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_accessoryView);

    -[HUGridServiceCell setNeedsLayout](self, "setNeedsLayout");
  }
  -[HUGridServiceCell _updateExclamationViewColor](self, "_updateExclamationViewColor");

}

- (void)_createExclamationViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  HUVisualEffectContainerView *v7;
  void *v8;
  HUVisualEffectContainerView *v9;
  void *v10;
  id v11;

  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_exclamationMarkImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "initWithImage:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v6);

    v7 = [HUVisualEffectContainerView alloc];
    -[HUGridCell contentEffect](self, "contentEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HUVisualEffectContainerView initWithEffect:](v7, "initWithEffect:", v8);
    -[HUGridServiceCell setExclamationView:](self, "setExclamationView:", v9);

    -[HUGridServiceCell exclamationView](self, "exclamationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInnerContentView:", v11);

  }
}

- (void)_updateExclamationViewColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[HUGridServiceCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (-[HUGridCell iconDisplayStyle](self, "iconDisplayStyle") == 3)
  {
    objc_msgSend((id)objc_opt_class(), "_iconTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v11 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;
  -[HUGridServiceCell exclamationView](self, "exclamationView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v9);

}

- (void)_updateSupplementaryImageViewIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;

  -[HUGridServiceCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC470))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v44 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[HUGridServiceCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v44, "hf_siriEndpointProfile");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = (void *)v8, v10 = objc_msgSend(v44, "hf_needsOnboarding"), v9, (v10 & 1) == 0))
  {
    objc_opt_class();
    -[HUGridServiceCell item](self, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v44, "hf_siriEndpointProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "manuallyDisabled");

    if ((v19 & 1) == 0 && (objc_msgSend(v17, "shouldShowMutedMicIcon") & 1) == 0)
    {

LABEL_22:
      -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setHidden:", 1);
      goto LABEL_23;
    }

  }
  else
  {
    if (!objc_msgSend(v44, "hf_isHomePod"))
      goto LABEL_22;
    objc_opt_class();
    -[HUGridServiceCell item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "shouldShowMutedMicIcon");
    if (!v14)
      goto LABEL_22;
  }
  -[HUGridServiceCell _backgroundColorForSupplementaryIcon](self, "_backgroundColorForSupplementaryIcon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hu_mutedMicrophoneImageInCircleWithTintColor:backgroundColor:", v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setImage:", v23);

  -[HUGridServiceCell iconView](self, "iconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "image");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "size");
  v37 = v36;
  v39 = v38;

  v40 = 0.0;
  if (v7 != 1)
    v40 = v31;
  v41 = v27 + v40 + v37 * -0.5;
  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v41, v29 + v33 + v39 / -1.5, v37, v39);

  -[HUGridServiceCell supplementaryImageView](self, "supplementaryImageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setHidden:", 0);

LABEL_23:
}

- (id)_backgroundColorForSupplementaryIcon
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.85, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D313C8], "isSpringBoard") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService");
  -[HUGridServiceCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 == 2 || v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.3, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  if (-[HUGridCell backgroundState](self, "backgroundState") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v3;
  }
  v9 = v8;

  return v9;
}

- (void)_createFirmwareUpdateViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUVisualEffectContainerView *v8;
  void *v9;
  HUVisualEffectContainerView *v10;
  void *v11;
  id v12;

  -[HUGridServiceCell firmwareUpdateView](self, "firmwareUpdateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    HUImageNamed(CFSTR("firmwareupdate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "initWithImage:", v6);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v7);

    v8 = [HUVisualEffectContainerView alloc];
    -[HUGridCell contentEffect](self, "contentEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUVisualEffectContainerView initWithEffect:](v8, "initWithEffect:", v9);
    -[HUGridServiceCell setFirmwareUpdateView:](self, "setFirmwareUpdateView:", v10);

    -[HUGridServiceCell firmwareUpdateView](self, "firmwareUpdateView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInnerContentView:", v12);

  }
}

- (void)dragStateDidChange:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridServiceCell;
  -[HUGridServiceCell dragStateDidChange:](&v6, sel_dragStateDidChange_);
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridServiceCell setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (HFItem)serviceItem
{
  return self->_serviceItem;
}

- (void)setServiceItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceItem, a3);
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)shouldColorDescription
{
  return self->_shouldColorDescription;
}

- (UIColor)defaultNameTextColor
{
  return self->_defaultNameTextColor;
}

- (void)setDefaultNameTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNameTextColor, a3);
}

- (UIColor)defaultDescriptionColor
{
  return self->_defaultDescriptionColor;
}

- (void)setDefaultDescriptionColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDescriptionColor, a3);
}

- (BOOL)shouldShowLoadingState
{
  return self->_shouldShowLoadingState;
}

- (void)setShouldShowLoadingState:(BOOL)a3
{
  self->_shouldShowLoadingState = a3;
}

- (BOOL)shouldShowRoomName
{
  return self->_shouldShowRoomName;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIImageView)supplementaryImageView
{
  return self->_supplementaryImageView;
}

- (void)setSupplementaryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryImageView, a3);
}

- (HUGridServiceCellTextView)serviceTextView
{
  return self->_serviceTextView;
}

- (void)setServiceTextView:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTextView, a3);
}

- (UILabel)coloredDescriptionLabel
{
  return self->_coloredDescriptionLabel;
}

- (void)setColoredDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, a3);
}

- (UIVisualEffectView)descriptionLabelEffectView
{
  return self->_descriptionLabelEffectView;
}

- (void)setDescriptionLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, a3);
}

- (BOOL)hasUpdatedUISinceLastReuse
{
  return self->_hasUpdatedUISinceLastReuse;
}

- (void)setHasUpdatedUISinceLastReuse:(BOOL)a3
{
  self->_hasUpdatedUISinceLastReuse = a3;
}

- (BOOL)showingUpdatingState
{
  return self->_showingUpdatingState;
}

- (NACancelable)showUpdatingStateAfterDelayToken
{
  return self->_showUpdatingStateAfterDelayToken;
}

- (void)setShowUpdatingStateAfterDelayToken:(id)a3
{
  objc_storeStrong((id *)&self->_showUpdatingStateAfterDelayToken, a3);
}

- (BOOL)showingProgressIndicator
{
  return self->_showingProgressIndicator;
}

- (NACancelable)showProgressIndicatorAfterDelayToken
{
  return self->_showProgressIndicatorAfterDelayToken;
}

- (void)setShowProgressIndicatorAfterDelayToken:(id)a3
{
  objc_storeStrong((id *)&self->_showProgressIndicatorAfterDelayToken, a3);
}

- (UIView)overrideAccessoryView
{
  return self->_overrideAccessoryView;
}

- (void)setOverrideAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAccessoryView, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (HUVisualEffectContainerView)exclamationView
{
  return self->_exclamationView;
}

- (void)setExclamationView:(id)a3
{
  objc_storeStrong((id *)&self->_exclamationView, a3);
}

- (HUVisualEffectContainerView)firmwareUpdateView
{
  return self->_firmwareUpdateView;
}

- (void)setFirmwareUpdateView:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateView, 0);
  objc_storeStrong((id *)&self->_exclamationView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_overrideAccessoryView, 0);
  objc_storeStrong((id *)&self->_showProgressIndicatorAfterDelayToken, 0);
  objc_storeStrong((id *)&self->_showUpdatingStateAfterDelayToken, 0);
  objc_storeStrong((id *)&self->_descriptionLabelEffectView, 0);
  objc_storeStrong((id *)&self->_coloredDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_serviceTextView, 0);
  objc_storeStrong((id *)&self->_supplementaryImageView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_defaultDescriptionColor, 0);
  objc_storeStrong((id *)&self->_defaultNameTextColor, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_serviceItem, 0);
}

@end
