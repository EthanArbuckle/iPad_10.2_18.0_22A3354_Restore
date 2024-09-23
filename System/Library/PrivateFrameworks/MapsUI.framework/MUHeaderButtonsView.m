@implementation MUHeaderButtonsView

- (MUHeaderButtonsView)initWithConfiguration:(id)a3
{
  id v5;
  MUHeaderButtonsView *v6;
  MUHeaderButtonsView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUHeaderButtonsView;
  v6 = -[MUHeaderButtonsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUHeaderButtonsView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("HeaderButtons"));
    -[MUHeaderButtonsView _setupSubviews](v7, "_setupSubviews");
  }

  return v7;
}

- (void)_didTapPrimaryAction
{
  void *v3;
  MUPresentationOptions *v4;

  v4 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setSourceView:](v4, "setSourceView:", self->_primaryButton);
  -[MUPlaceHeaderButton frame](self->_primaryButton, "frame");
  -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
  -[MUHeaderButtonsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerButtonsView:didSelectPrimaryType:withPresentationOptions:", self, self->_primaryButtonType, v4);

}

- (void)_didTapAlternatePrimaryAction
{
  void *v3;
  void (**v4)(id, MUPlaceHeaderButton *);

  -[_MKPlaceActionButtonController buttonSelectedBlock](self->_alternatePrimaryButtonController, "buttonSelectedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MKPlaceActionButtonController buttonSelectedBlock](self->_alternatePrimaryButtonController, "buttonSelectedBlock");
    v4 = (void (**)(id, MUPlaceHeaderButton *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self->_secondaryButton);

  }
}

- (void)_didTapSecondaryAction
{
  void *v3;
  void (**v4)(id, MUPlaceHeaderButton *);

  -[_MKPlaceActionButtonController buttonSelectedBlock](self->_secondaryButtonController, "buttonSelectedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MKPlaceActionButtonController buttonSelectedBlock](self->_secondaryButtonController, "buttonSelectedBlock");
    v4 = (void (**)(id, MUPlaceHeaderButton *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self->_secondaryButton);

  }
}

- (void)_didTapMoreButton
{
  void *v3;
  char v4;
  id v5;

  -[MUHeaderButtonsView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUHeaderButtonsView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerButtonsViewWillPresentMenu:", self);

  }
}

- (void)_setupSubviews
{
  MUPlaceHeaderButton *v3;
  MUPlaceHeaderButton *moreButton;
  double v5;
  double v6;
  double v7;
  double v8;
  MUPlaceHeaderButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (-[MUHeaderButtonsViewConfiguration showMoreButton](self->_configuration, "showMoreButton"))
  {
    +[MUPlaceHeaderButton buttonWithType:](MUPlaceHeaderButton, "buttonWithType:", 0);
    v3 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();
    moreButton = self->_moreButton;
    self->_moreButton = v3;

    -[MUPlaceHeaderButton setTranslatesAutoresizingMaskIntoConstraints:](self->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[MUPlaceHeaderButton setContentHuggingPriority:forAxis:](self->_moreButton, "setContentHuggingPriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    -[MUPlaceHeaderButton setContentHuggingPriority:forAxis:](self->_moreButton, "setContentHuggingPriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[MUPlaceHeaderButton setContentCompressionResistancePriority:forAxis:](self->_moreButton, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148846080;
    -[MUPlaceHeaderButton setContentCompressionResistancePriority:forAxis:](self->_moreButton, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_moreButton, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderMoreButton"));
    -[MUPlaceHeaderButton setShowsMenuAsPrimaryAction:](self->_moreButton, "setShowsMenuAsPrimaryAction:", 1);
    objc_initWeak(&location, self);
    v9 = self->_moreButton;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __37__MUHeaderButtonsView__setupSubviews__block_invoke;
    v20 = &unk_1E2E02358;
    objc_copyWeak(&v21, &location);
    -[MUPlaceHeaderButton _setMenuProvider:](v9, "_setMenuProvider:", &v17);
    objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_secondaryHeaderActionConfiguration", v17, v18, v19, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:", CFSTR("ellipsis"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    objc_msgSend(v10, "setContentInsets:", 0.0, 11.0, 0.0, 11.0);
    -[MUPlaceHeaderButton setConfiguration:](self->_moreButton, "setConfiguration:", v10);
    -[MUPlaceHeaderButton addTarget:action:forControlEvents:](self->_moreButton, "addTarget:action:forControlEvents:", self, sel__didTapMoreButton, 0x4000);
    -[MUHeaderButtonsView addSubview:](self, "addSubview:", self->_moreButton);
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)-[MUHeaderButtonsView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v15, sel__updateContent);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

id __37__MUHeaderButtonsView__setupSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  MUPresentationOptions *v2;
  void *v3;
  void *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MUPresentationOptions);
    -[MUPresentationOptions setSourceView:](v2, "setSourceView:", WeakRetained[55]);
    objc_msgSend(WeakRetained[55], "frame");
    -[MUPresentationOptions setSourceRect:](v2, "setSourceRect:");
    objc_msgSend(WeakRetained[58], "menuProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createHeaderButtonsMenuWithPresentationOptions:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_loadSecondaryButtonWithSecondaryActionController:(id)a3
{
  _MKPlaceActionButtonController *v5;
  id *p_secondaryButtonController;
  MUPlaceHeaderButton *secondaryButton;
  MUPlaceHeaderButton *v8;
  MUPlaceHeaderButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MUHeaderButtonsView *v15;
  id WeakRetained;
  _MKPlaceActionButtonController *v17;

  v5 = (_MKPlaceActionButtonController *)a3;
  p_secondaryButtonController = (id *)&self->_secondaryButtonController;
  if (self->_secondaryButtonController != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_secondaryButtonController, a3);
    if (!*p_secondaryButtonController)
    {
      -[MUPlaceHeaderButton removeFromSuperview](self->_secondaryButton, "removeFromSuperview");
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = 0;

    }
    if (!self->_secondaryButton)
    {
      +[MUPlaceHeaderButton buttonWithType:](MUPlaceHeaderButton, "buttonWithType:", 1);
      v8 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();
      v9 = self->_secondaryButton;
      self->_secondaryButton = v8;

      -[MUPlaceHeaderButton setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MUPlaceHeaderButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__didTapSecondaryAction, 0x2000);
    }
    objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_secondaryHeaderActionConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_secondaryButtonController, "buttonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v11);

    v12 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(*p_secondaryButtonController, "symbolName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_mapsui_systemImageNamed:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v14);

    -[MUPlaceHeaderButton setConfiguration:](self->_secondaryButton, "setConfiguration:", v10);
    -[MUPlaceHeaderButton superview](self->_secondaryButton, "superview");
    v15 = (MUHeaderButtonsView *)objc_claimAutoreleasedReturnValue();

    if (v15 != self)
    {
      -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_secondaryButton, "setAccessibilityIdentifier:", CFSTR("SecondaryButton"));
      -[MUHeaderButtonsView addSubview:](self, "addSubview:", self->_secondaryButton);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);
    -[MUHeaderButtonsView ETAProviderUpdated:](self, "ETAProviderUpdated:", WeakRetained);

    v5 = v17;
  }

}

- (void)_loadPrimaryButtonWithPrimaryType:(unint64_t)a3
{
  MUPlaceHeaderButton *primaryButton;
  MUPlaceHeaderButton *v5;
  MUPlaceHeaderButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MUPlaceHeaderButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MUHeaderButtonsView *v18;

  if (self->_primaryButtonType == a3)
    return;
  self->_primaryButtonType = a3;
  primaryButton = self->_primaryButton;
  if (!a3)
  {
    -[MUPlaceHeaderButton removeFromSuperview](primaryButton, "removeFromSuperview");
    v12 = self->_primaryButton;
    self->_primaryButton = 0;

    return;
  }
  if (primaryButton)
  {
LABEL_16:
    -[MUPlaceHeaderButton superview](primaryButton, "superview");
    v18 = (MUHeaderButtonsView *)objc_claimAutoreleasedReturnValue();

    if (v18 != self)
      -[MUHeaderButtonsView addSubview:](self, "addSubview:", self->_primaryButton);
    return;
  }
  +[MUPlaceHeaderButton buttonWithType:](MUPlaceHeaderButton, "buttonWithType:", 1);
  v5 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();
  v6 = self->_primaryButton;
  self->_primaryButton = v5;

  -[MUPlaceHeaderButton setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceHeaderButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__didTapPrimaryAction, 0x2000);
  objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_configurationForPrimaryType:", self->_primaryButtonType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_primaryButtonType)
  {
    case 1uLL:
      -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_primaryButton, "setAccessibilityIdentifier:", CFSTR("PrimaryButtonTypeDirections"));
      +[_MUETAConfiguration configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:](_MUETAConfiguration, "configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:", 0xFFFFFFFLL, self->_secondaryButtonController != 0, self->_isStackingButtons, 0.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v8, "symbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_mapsui_systemImageNamed:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v11);

      goto LABEL_11;
    case 2uLL:
      -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_primaryButton, "setAccessibilityIdentifier:", CFSTR("PrimaryButtonTypeReroute"));
      -[MUHeaderButtonsViewConfiguration detourTime](self->_configuration, "detourTime");
      +[_MUETAConfiguration rerouteConfigurationETAStringForTravelTime:](_MUETAConfiguration, "rerouteConfigurationETAStringForTravelTime:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v13;
      goto LABEL_12;
    case 3uLL:
      -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_primaryButton, "setAccessibilityIdentifier:", CFSTR("PrimaryButtonTypeShareCurrentLocation"));
      objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_secondaryHeaderActionConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:", CFSTR("square.and.arrow.up"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v15);

      _MULocalizedStringFromThisBundle(CFSTR("Share [Placecard]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v8);
      v7 = v14;
      goto LABEL_13;
    case 4uLL:
      -[MUPlaceHeaderButton setAccessibilityIdentifier:](self->_primaryButton, "setAccessibilityIdentifier:", CFSTR("PrimaryButtonTypeAddStop"));
      -[MUHeaderButtonsViewConfiguration detourTime](self->_configuration, "detourTime");
      +[_MUETAConfiguration addStopConfigurationETAStringForTravelTime:](_MUETAConfiguration, "addStopConfigurationETAStringForTravelTime:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:", CFSTR("plus.circle.fill"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v16);

LABEL_11:
      v13 = v8;
LABEL_12:
      objc_msgSend(v13, "etaString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:", v17);

LABEL_13:
      break;
    default:
      break;
  }
  -[MUPlaceHeaderButton setConfiguration:](self->_primaryButton, "setConfiguration:", v7);

  if (self->_primaryButtonType)
  {
    primaryButton = self->_primaryButton;
    goto LABEL_16;
  }
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  if (self->_primaryButtonType != a3)
  {
    -[MUHeaderButtonsView _loadPrimaryButtonWithPrimaryType:](self, "_loadPrimaryButtonWithPrimaryType:");
    -[MUHeaderButtonsView _updateContent](self, "_updateContent");
  }
}

- (void)setSecondaryButtonController:(id)a3
{
  if (self->_secondaryButtonController != a3)
  {
    -[MUHeaderButtonsView _loadSecondaryButtonWithSecondaryActionController:](self, "_loadSecondaryButtonWithSecondaryActionController:");
    -[MUHeaderButtonsView _updateContent](self, "_updateContent");
  }
}

- (void)_createLayout
{
  MUHeaderButtonsView *v3;
  id v4;
  MUPlaceHeaderButton *alternatePrimaryButton;
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
  MUPlaceHeaderButton *secondaryButton;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MUPlaceHeaderButton *primaryButton;
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
  MUPlaceHeaderButton *v57;
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
  MUPlaceHeaderButton *moreButton;
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
  MUPlaceHeaderButton *v96;
  id v97;
  MUHeaderButtonsView *v98;
  MUPlaceHeaderButton *v99;
  uint64_t v100;
  MUPlaceHeaderButton *v101;
  MUPlaceHeaderButton *v102;
  MUPlaceHeaderButton *v103;
  void *v104;
  void *v105;
  void *v106;
  MUPlaceHeaderButton *v107;
  void *v108;
  void *v109;
  void *v110;
  MUPlaceHeaderButton *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  MUPlaceHeaderButton *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  self->_isStackingButtons = -[MUHeaderButtonsView shouldStackForButtons](self, "shouldStackForButtons");
  v3 = self;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  alternatePrimaryButton = v3->_alternatePrimaryButton;
  if (v3->_primaryButton)
  {
    if (alternatePrimaryButton)
    {
      -[MUPlaceHeaderButton widthAnchor](v3->_primaryButton, "widthAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton widthAnchor](v3->_alternatePrimaryButton, "widthAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      -[MUPlaceHeaderButton heightAnchor](v3->_primaryButton, "heightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton heightAnchor](v3->_alternatePrimaryButton, "heightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

      -[MUPlaceHeaderButton leadingAnchor](v3->_primaryButton, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUHeaderButtonsView leadingAnchor](v3, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

      -[MUPlaceHeaderButton topAnchor](v3->_primaryButton, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUHeaderButtonsView topAnchor](v3, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

      -[MUPlaceHeaderButton trailingAnchor](v3->_primaryButton, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton leadingAnchor](v3->_alternatePrimaryButton, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -8.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

      -[MUPlaceHeaderButton topAnchor](v3->_alternatePrimaryButton, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton topAnchor](v3->_primaryButton, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

      -[MUPlaceHeaderButton trailingAnchor](v3->_alternatePrimaryButton, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

      secondaryButton = v3->_secondaryButton;
      if (secondaryButton)
      {
        -[MUPlaceHeaderButton leadingAnchor](secondaryButton, "leadingAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUHeaderButtonsView leadingAnchor](v3, "leadingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v30);

        -[MUPlaceHeaderButton trailingAnchor](v3->_secondaryButton, "trailingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v33);

        primaryButton = v3->_secondaryButton;
      }
      else
      {
        -[MUPlaceHeaderButton bottomAnchor](v3->_alternatePrimaryButton, "bottomAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUPlaceHeaderButton bottomAnchor](v3->_primaryButton, "bottomAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "constraintEqualToAnchor:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v134);

        primaryButton = v3->_primaryButton;
      }
      -[MUPlaceHeaderButton bottomAnchor](primaryButton, "bottomAnchor");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUHeaderButtonsView bottomAnchor](v3, "bottomAnchor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "constraintEqualToAnchor:", v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v137);

      v138 = (void *)objc_msgSend(v4, "copy");
      -[MUHeaderButtonsView _activateNewConstraints:](v3, "_activateNewConstraints:", v138);

      v53 = v4;
      goto LABEL_43;
    }
  }
  else if (alternatePrimaryButton && v3->_secondaryButton)
  {
    -[MUPlaceHeaderButton widthAnchor](alternatePrimaryButton, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderButton widthAnchor](v3->_secondaryButton, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v37);

    -[MUPlaceHeaderButton leadingAnchor](v3->_alternatePrimaryButton, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView leadingAnchor](v3, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v40);

    -[MUPlaceHeaderButton trailingAnchor](v3->_alternatePrimaryButton, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderButton leadingAnchor](v3->_secondaryButton, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, -8.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v43);

    -[MUPlaceHeaderButton trailingAnchor](v3->_secondaryButton, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v46);

    -[MUPlaceHeaderButton bottomAnchor](v3->_alternatePrimaryButton, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView bottomAnchor](v3, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v49);

    -[MUPlaceHeaderButton bottomAnchor](v3->_secondaryButton, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView bottomAnchor](v3, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v52);

    v53 = v4;
    v54 = (void *)objc_msgSend(v4, "copy");
    -[MUHeaderButtonsView _activateNewConstraints:](v3, "_activateNewConstraints:", v54);

    goto LABEL_43;
  }
  v55 = (void *)objc_opt_new();
  v56 = v55;
  if (v3->_primaryButton)
    objc_msgSend(v55, "addObject:");
  if (v3->_secondaryButton)
    objc_msgSend(v56, "addObject:");
  if (v3->_moreButton)
    objc_msgSend(v56, "addObject:");
  if (self->_isStackingButtons && v3->_secondaryButton && (v57 = v3->_primaryButton) != 0)
  {
    -[MUPlaceHeaderButton leadingAnchor](v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView leadingAnchor](v3, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v4;
    objc_msgSend(v4, "addObject:", v60);

    -[MUPlaceHeaderButton topAnchor](v3->_primaryButton, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView topAnchor](v3, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v64);

    -[MUPlaceHeaderButton trailingAnchor](v3->_primaryButton, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v67);

    -[MUPlaceHeaderButton heightAnchor](v3->_primaryButton, "heightAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderButton heightAnchor](v3->_secondaryButton, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v70);

    -[MUPlaceHeaderButton leadingAnchor](v3->_secondaryButton, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView leadingAnchor](v3, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v73);

    -[MUPlaceHeaderButton topAnchor](v3->_secondaryButton, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderButton bottomAnchor](v3->_primaryButton, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 8.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v76);

    -[MUPlaceHeaderButton bottomAnchor](v3->_secondaryButton, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUHeaderButtonsView bottomAnchor](v3, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v79);

    moreButton = v3->_moreButton;
    -[MUPlaceHeaderButton trailingAnchor](v3->_secondaryButton, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (moreButton)
    {
      -[MUPlaceHeaderButton leadingAnchor](v3->_moreButton, "leadingAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, -8.0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v83);

      -[MUPlaceHeaderButton heightAnchor](v3->_secondaryButton, "heightAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton heightAnchor](v3->_moreButton, "heightAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToAnchor:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v86);

      -[MUPlaceHeaderButton topAnchor](v3->_moreButton, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton topAnchor](v3->_secondaryButton, "topAnchor");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "constraintEqualToAnchor:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v89);

      -[MUPlaceHeaderButton trailingAnchor](v3->_moreButton, "trailingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "constraintEqualToAnchor:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v92);

      -[MUPlaceHeaderButton bottomAnchor](v3->_moreButton, "bottomAnchor");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHeaderButton bottomAnchor](v3->_secondaryButton, "bottomAnchor");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "constraintEqualToAnchor:", v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v95);

      v96 = v3->_moreButton;
    }
    else
    {
      -[MUHeaderButtonsView trailingAnchor](v3, "trailingAnchor");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "constraintEqualToAnchor:constant:", v139, -8.0);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v140);

      v96 = v3->_secondaryButton;
    }
    -[MUPlaceHeaderButton heightAnchor](v96, "heightAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "_scaledValueForValue:", 48.0);
    objc_msgSend(v141, "constraintEqualToConstant:");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v143);

    v144 = (void *)objc_msgSend(v61, "copy");
    -[MUHeaderButtonsView _activateNewConstraints:](v3, "_activateNewConstraints:", v144);

    v53 = v61;
  }
  else
  {
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v97 = v56;
    v53 = v4;
    v148 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
    if (v148)
    {
      v145 = v56;
      v98 = v3;
      v99 = 0;
      v147 = *(_QWORD *)v150;
      v146 = *MEMORY[0x1E0DC4AD0];
      do
      {
        v100 = 0;
        v101 = v99;
        do
        {
          if (*(_QWORD *)v150 != v147)
            objc_enumerationMutation(v97);
          v102 = *(MUPlaceHeaderButton **)(*((_QWORD *)&v149 + 1) + 8 * v100);
          objc_msgSend(v97, "firstObject");
          v103 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();

          if (v102 == v103)
          {
            -[MUPlaceHeaderButton leadingAnchor](v102, "leadingAnchor");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUHeaderButtonsView leadingAnchor](v98, "leadingAnchor");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "constraintEqualToAnchor:", v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v106);

          }
          if (v102 != v98->_moreButton)
          {
            objc_msgSend(v97, "firstObject");
            v107 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();

            if (v102 != v107)
            {
              -[MUPlaceHeaderButton widthAnchor](v102, "widthAnchor");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              -[MUPlaceHeaderButton widthAnchor](v101, "widthAnchor");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "constraintEqualToAnchor:", v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v110);

            }
          }
          objc_msgSend(v97, "firstObject");
          v111 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();

          if (v101 && v102 != v111)
          {
            -[MUPlaceHeaderButton trailingAnchor](v101, "trailingAnchor");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPlaceHeaderButton leadingAnchor](v102, "leadingAnchor");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "constraintEqualToAnchor:constant:", v113, -8.0);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v114);

            -[MUPlaceHeaderButton heightAnchor](v101, "heightAnchor");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUPlaceHeaderButton heightAnchor](v102, "heightAnchor");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "constraintEqualToAnchor:", v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v117);

          }
          objc_msgSend(v97, "lastObject");
          v118 = (MUPlaceHeaderButton *)objc_claimAutoreleasedReturnValue();

          if (v102 == v118)
          {
            -[MUPlaceHeaderButton trailingAnchor](v102, "trailingAnchor");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUHeaderButtonsView trailingAnchor](v98, "trailingAnchor");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "constraintEqualToAnchor:", v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v121);

            -[MUPlaceHeaderButton heightAnchor](v102, "heightAnchor");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v146);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "_scaledValueForValue:", 48.0);
            objc_msgSend(v122, "constraintEqualToConstant:");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v124);

          }
          -[MUPlaceHeaderButton topAnchor](v102, "topAnchor");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUHeaderButtonsView topAnchor](v98, "topAnchor");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "constraintEqualToAnchor:", v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v127);

          -[MUPlaceHeaderButton bottomAnchor](v102, "bottomAnchor");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v4;
          -[MUHeaderButtonsView bottomAnchor](v98, "bottomAnchor");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "constraintEqualToAnchor:", v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v130);

          v99 = v102;
          ++v100;
          v101 = v99;
        }
        while (v148 != v100);
        v148 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
      }
      while (v148);

      v3 = v98;
      v56 = v145;
    }

    v131 = (void *)objc_msgSend(v53, "copy");
    -[MUHeaderButtonsView _activateNewConstraints:](v3, "_activateNewConstraints:", v131);

  }
LABEL_43:

}

- (void)_activateNewConstraints:(id)a3
{
  NSArray *v4;
  NSArray *constraints;
  id v6;

  v6 = a3;
  if (-[NSArray count](self->_constraints, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  constraints = self->_constraints;
  self->_constraints = v4;

  if (-[NSArray count](self->_constraints, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);

}

- (void)ETAProviderUpdated:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  unint64_t primaryButtonType;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  MUPlaceHeaderButton *primaryButton;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  -[MUPlaceHeaderButton configuration](self->_primaryButton, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_etaProvider);

  if (WeakRetained != v4)
    objc_storeWeak((id *)&self->_etaProvider, v4);
  primaryButtonType = self->_primaryButtonType;
  if (primaryButtonType == 2)
  {
    -[MUHeaderButtonsViewConfiguration detourTime](self->_configuration, "detourTime");
    +[_MUETAConfiguration rerouteConfigurationETAStringForTravelTime:](_MUETAConfiguration, "rerouteConfigurationETAStringForTravelTime:");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (primaryButtonType == 1)
  {
    v8 = objc_msgSend(v4, "etaTransportType");
    objc_msgSend(v4, "etaTravelTime");
    +[_MUETAConfiguration configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:](_MUETAConfiguration, "configurationForEtaStringFor:travelTime:hasSecondaryController:isStackingButtons:", v8, self->_secondaryButtonController != 0, self->_isStackingButtons);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  objc_msgSend(v10, "symbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v10, "symbolName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_mapsui_systemImageNamed:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v15);

  }
  objc_msgSend(v10, "etaString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v16);

  objc_msgSend(v5, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x1E0DC3F10];
    primaryButton = self->_primaryButton;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __42__MUHeaderButtonsView_ETAProviderUpdated___block_invoke;
    v21[3] = &unk_1E2E01AB0;
    objc_copyWeak(&v23, &location);
    v22 = v5;
    objc_msgSend(v19, "transitionWithView:duration:options:animations:completion:", primaryButton, 5242880, v21, 0, 0.300000012);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

}

void __42__MUHeaderButtonsView_ETAProviderUpdated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[52], "setConfiguration:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)layoutSubviews
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUHeaderButtonsView;
  -[MUHeaderButtonsView layoutSubviews](&v4, sel_layoutSubviews);
  -[MUHeaderButtonsView _updateConstraintsIfNeeded](self, "_updateConstraintsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)MUHeaderButtonsView;
  -[MUHeaderButtonsView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_updateConstraintsIfNeeded
{
  if (self->_isStackingButtons != -[MUHeaderButtonsView shouldStackForButtons](self, "shouldStackForButtons"))
    -[MUHeaderButtonsView _createLayout](self, "_createLayout");
}

- (BOOL)shouldStackForButtons
{
  MUPlaceHeaderButton *primaryButton;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v19;

  if ((MapKitIdiomIsMacCatalyst() & 1) != 0)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 48.0);
  v6 = v5;

  v7 = 0.0;
  v8 = 0.0;
  if (-[MUHeaderButtonsViewConfiguration showMoreButton](self->_configuration, "showMoreButton"))
  {
    -[MUPlaceHeaderButton sizeThatFits:](self->_moreButton, "sizeThatFits:", *MEMORY[0x1E0DC4FF8], v6);
    v8 = v9;
  }
  if (self->_primaryButton)
    v10 = 8.0;
  else
    v10 = 0.0;
  if (self->_secondaryButton)
    v11 = 8.0;
  else
    v11 = -0.0;
  if (!self->_moreButton)
    v7 = 8.0;
  -[MUHeaderButtonsView bounds](self, "bounds");
  Width = CGRectGetWidth(v19);
  primaryButton = self->_primaryButton;
  if (primaryButton)
  {
    if (!self->_secondaryButton)
    {
LABEL_2:
      LOBYTE(primaryButton) = 0;
      return (char)primaryButton;
    }
    v13 = (Width - v8 - (v10 + v11 - v7)) * 0.5;
    v14 = *MEMORY[0x1E0DC5000];
    -[MUPlaceHeaderButton sizeThatFits:](primaryButton, "sizeThatFits:", *MEMORY[0x1E0DC5000], v6);
    v16 = v15;
    -[MUPlaceHeaderButton sizeThatFits:](self->_secondaryButton, "sizeThatFits:", v14, v6);
    LOBYTE(primaryButton) = v17 > v13 || v16 > v13;
  }
  return (char)primaryButton;
}

- (MUHeaderButtonsViewDelegate)delegate
{
  return (MUHeaderButtonsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)primaryButtonType
{
  return self->_primaryButtonType;
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  return self->_alternatePrimaryButtonController;
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  objc_storeStrong((id *)&self->_alternatePrimaryButtonController, a3);
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  return self->_secondaryButtonController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonController, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButtonController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_etaProvider);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_alternatePrimaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
