@implementation PKPaletteMoreOptionsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
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
  double v19;
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
  objc_super v43;
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)PKPaletteMoreOptionsViewController;
  -[PKPaletteMoreOptionsViewController viewDidLoad](&v43, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PKPaletteMoreOptionsViewController setStackView:](self, "setStackView:", v6);

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDistribution:", 0);

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignment:", 0);

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAxis:", 1);

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PKPaletteMoreOptionsViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v19) = 1144750080;
  v20 = v18;
  v35 = v18;
  objc_msgSend(v18, "setPriority:", v19);
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "safeAreaLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "safeAreaLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v22;
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v28;
  v44[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteMoreOptionsViewController setStackViewPositioningConstraints:](self, "setStackViewPositioningConstraints:", v29);

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[PKPaletteMoreOptionsViewController stackViewPositioningConstraints](self, "stackViewPositioningConstraints");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v31);

  -[PKPaletteMoreOptionsViewController _reloadItems](self, "_reloadItems");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setShouldShowFingerDrawsOption:(BOOL)a3
{
  if (self->_shouldShowFingerDrawsOption != a3)
  {
    self->_shouldShowFingerDrawsOption = a3;
    -[PKPaletteMoreOptionsViewController _reloadItems](self, "_reloadItems");
  }
}

- (void)setIsFingerDrawsOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_isFingerDrawsOn != a3)
  {
    v3 = a3;
    self->_isFingerDrawsOn = a3;
    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switchButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOn:", v3);

  }
}

- (void)setExternalTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *v6;

  v5 = (UITraitCollection *)a3;
  if (self->_externalTraitCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_externalTraitCollection, a3);
    -[PKPaletteMoreOptionsViewController _updateContentSize](self, "_updateContentSize");
    v5 = v6;
  }

}

- (void)setAutoHideOn:(BOOL)a3
{
  if (self->_autoHideOn != a3)
  {
    self->_autoHideOn = a3;
    -[PKPaletteMoreOptionsViewController _updateAutoMinimizeCell](self, "_updateAutoMinimizeCell");
  }
}

- (id)_makeAutoMinimizeCell
{
  PKPaletteOptionSwitchCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PKPaletteOptionSwitchCell);
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Auto-minimize"), CFSTR("Auto-minimize"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteOptionSwitchCell textLabel](v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[PKPaletteOptionSwitchCell switchButton](v3, "switchButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("Auto-minimize-Switch"));

  -[PKPaletteOptionSwitchCell switchButton](v3, "switchButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__autoMinimizeCellDidChangeValue_, 4096);

  return v3;
}

- (void)_updateAutoMinimizeCell
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PKPaletteMoreOptionsViewController isAutoHideOn](self, "isAutoHideOn");
  -[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switchButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (void)_updateFingerDrawsCell
{
  void *v3;
  PKPaletteOptionSwitchCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PKPaletteOptionSwitchCell);
    -[PKPaletteMoreOptionsViewController setFingerDrawsCell:](self, "setFingerDrawsCell:", v4);

    _PencilKitBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Draw with Finger"), CFSTR("Draw with Finger"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v6);

    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Draw-with-Finger-Switch"));

    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "switchButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__fingerDrawsCellDidChangeValue_, 4096);

  }
  v13 = -[PKPaletteMoreOptionsViewController isFingerDrawsOn](self, "isFingerDrawsOn");
  -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "switchButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOn:", v13);

}

- (void)_updateAutoRefineCell
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PKPaletteMoreOptionsViewController isAutoRefineOn](self, "isAutoRefineOn");
    -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "switchButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOn:", v4);

  }
}

- (void)_autoMinimizeCellDidChangeValue:(id)a3
{
  id v4;

  self->_autoHideOn = objc_msgSend(a3, "isOn");
  -[PKPaletteMoreOptionsViewController _updateAutoMinimizeCell](self, "_updateAutoMinimizeCell");
  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moreOptionsViewControllerDidToggleAutoHide:", self);

}

- (void)_fingerDrawsCellDidChangeValue:(id)a3
{
  id v4;

  self->_isFingerDrawsOn = objc_msgSend(a3, "isOn");
  -[PKPaletteMoreOptionsViewController _updateFingerDrawsCell](self, "_updateFingerDrawsCell");
  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moreOptionsViewControllerDidToggleFingerDraws:", self);

}

- (void)_autoRefineCellDidChangeValue:(id)a3
{
  id v4;

  self->_isAutoRefineOn = objc_msgSend(a3, "isOn");
  -[PKPaletteMoreOptionsViewController _updateAutoRefineCell](self, "_updateAutoRefineCell");
  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moreOptionsViewControllerDidToggleAutoRefine:", self);

}

- (void)setShouldShowTapToRadarOption:(BOOL)a3
{
  if (self->_shouldShowTapToRadarOption != a3)
  {
    self->_shouldShowTapToRadarOption = a3;
    -[PKPaletteMoreOptionsViewController _reloadItems](self, "_reloadItems");
  }
}

- (id)_makeTapToRadarCell
{
  PKPaletteOptionButtonCell *v3;
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

  v3 = objc_alloc_init(PKPaletteOptionButtonCell);
  -[PKPaletteOptionButtonCell setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Report a Problem…"), CFSTR("Report a Problem…"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteOptionButtonCell button](v3, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteOptionButtonCell button](v3, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentHorizontalAlignment:", 4);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__handleTapToRadarCellTapped, 64);

  return v3;
}

- (BOOL)_shouldInstallTapToRadarCell
{
  _BOOL4 v3;
  void *v5;

  if (os_variant_has_internal_diagnostics()
    && -[PKPaletteMoreOptionsViewController shouldShowTapToRadarOption](self, "shouldShowTapToRadarOption"))
  {
    -[PKPaletteMoreOptionsViewController tapToRadarCell](self, "tapToRadarCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = !-[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v5);

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_shouldRemoveTapToRadarCell
{
  void *v4;
  BOOL v5;

  if ((os_variant_has_internal_diagnostics() & 1) != 0
    || -[PKPaletteMoreOptionsViewController shouldShowTapToRadarOption](self, "shouldShowTapToRadarOption"))
  {
    return 0;
  }
  -[PKPaletteMoreOptionsViewController tapToRadarCell](self, "tapToRadarCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v4);

  return v5;
}

- (void)_handleTapToRadarCellTapped
{
  void *v3;
  char v4;
  id v5;

  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "moreOptionsViewControllerDidSelectTapToRadar:", self);

  }
}

- (void)setShouldShowResetHandwritingEducationPane:(BOOL)a3
{
  if (self->_shouldShowResetHandwritingEducationPane != a3)
  {
    self->_shouldShowResetHandwritingEducationPane = a3;
    -[PKPaletteMoreOptionsViewController _reloadItems](self, "_reloadItems");
  }
}

- (BOOL)_shouldInstallResetHandwritingEducationPanelCell
{
  void *v3;
  _BOOL4 v4;

  if (-[PKPaletteMoreOptionsViewController shouldShowResetHandwritingEducationPane](self, "shouldShowResetHandwritingEducationPane"))
  {
    -[PKPaletteMoreOptionsViewController resetHandwritingEducationPaneCell](self, "resetHandwritingEducationPaneCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = !-[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v3);

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_shouldRemoveResetHandwritingEducationPanelCell
{
  void *v4;
  BOOL v5;

  if (-[PKPaletteMoreOptionsViewController shouldShowResetHandwritingEducationPane](self, "shouldShowResetHandwritingEducationPane"))
  {
    return 0;
  }
  -[PKPaletteMoreOptionsViewController resetHandwritingEducationPaneCell](self, "resetHandwritingEducationPaneCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v4);

  return v5;
}

- (id)_makeResetHandwritingEducationPaneCell
{
  PKPaletteOptionButtonCell *v3;
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

  v3 = objc_alloc_init(PKPaletteOptionButtonCell);
  -[PKPaletteOptionButtonCell setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Reset Handwriting Education Pane"), CFSTR("Reset Handwriting Education Pane"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteOptionButtonCell button](v3, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteOptionButtonCell button](v3, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentHorizontalAlignment:", 4);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__handleResetHandwritingEducationPaneCellTapped, 64);

  return v3;
}

- (void)_handleResetHandwritingEducationPaneCellTapped
{
  void *v3;
  char v4;
  id v5;

  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "moreOptionsViewControllerDidSelectResetHandwritingEducationPane:", self);

  }
}

- (void)setShouldShowOpenPencilSettingsOption:(BOOL)a3
{
  if (self->_shouldShowOpenPencilSettingsOption != a3)
  {
    self->_shouldShowOpenPencilSettingsOption = a3;
    -[PKPaletteMoreOptionsViewController _reloadItems](self, "_reloadItems");
  }
}

- (id)_makeOpenPencilSettingsCell
{
  PKPaletteOptionButtonCell *v3;
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

  v3 = objc_alloc_init(PKPaletteOptionButtonCell);
  -[PKPaletteOptionButtonCell setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Pencil Settings…"), CFSTR("Pencil Settings…"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaletteOptionButtonCell button](v3, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteOptionButtonCell button](v3, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentHorizontalAlignment:", 4);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

  -[PKPaletteOptionButtonCell button](v3, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__handleOpenPencilSettingsCellTapped, 64);

  return v3;
}

- (BOOL)_shouldInstallOpenPencilSettingsCell
{
  void *v3;
  _BOOL4 v4;

  if (-[PKPaletteMoreOptionsViewController shouldShowOpenPencilSettingsOption](self, "shouldShowOpenPencilSettingsOption"))
  {
    -[PKPaletteMoreOptionsViewController openPencilSettingsCell](self, "openPencilSettingsCell");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = !-[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v3);

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_shouldRemoveOpenPencilSettingsCell
{
  void *v4;
  BOOL v5;

  if (-[PKPaletteMoreOptionsViewController shouldShowOpenPencilSettingsOption](self, "shouldShowOpenPencilSettingsOption"))
  {
    return 0;
  }
  -[PKPaletteMoreOptionsViewController openPencilSettingsCell](self, "openPencilSettingsCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v4);

  return v5;
}

- (void)_handleOpenPencilSettingsCellTapped
{
  void *v3;
  char v4;
  id v5;

  -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKPaletteMoreOptionsViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "moreOptionsViewControllerDidSelectOpenPencilSettings:", self);

  }
}

- (void)_reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  PKPaletteOptionSwitchCell *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  PKPaletteOptionInfoCell *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  _QWORD *v52;
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
  unint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  PKPaletteOptionCellDividerView *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v86 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeArrangedSubview:", v10);

        objc_msgSend(v10, "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    }
    while (v7);
  }

  if (-[PKPaletteMoreOptionsViewController shouldShowAutoMinimizeOption](self, "shouldShowAutoMinimizeOption")
    && (-[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v12),
        v12,
        !v13))
  {
    -[PKPaletteMoreOptionsViewController _makeAutoMinimizeCell](self, "_makeAutoMinimizeCell");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController setAutoMinimizeCell:](self, "setAutoMinimizeCell:", v17);

    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addArrangedSubview:", v19);

  }
  else if (!-[PKPaletteMoreOptionsViewController shouldShowAutoMinimizeOption](self, "shouldShowAutoMinimizeOption"))
  {
    -[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v14);

    if (v15)
    {
      -[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[PKPaletteMoreOptionsViewController setAutoMinimizeCell:](self, "setAutoMinimizeCell:", 0);
    }
  }
  -[PKPaletteMoreOptionsViewController autoMinimizeCell](self, "autoMinimizeCell");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v20);

  if (v21)
    -[PKPaletteMoreOptionsViewController _updateAutoMinimizeCell](self, "_updateAutoMinimizeCell");
  if (-[PKPaletteMoreOptionsViewController shouldShowFingerDrawsOption](self, "shouldShowFingerDrawsOption"))
  {
    -[PKPaletteMoreOptionsViewController _updateFingerDrawsCell](self, "_updateFingerDrawsCell");
    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController fingerDrawsCell](self, "fingerDrawsCell");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addArrangedSubview:", v23);

  }
  if (_os_feature_enabled_impl()
    && PKCurrentAppSupportsRefinement()
    && objc_msgSend((id)objc_opt_class(), "hasAutoRefineLocaleEnabled"))
  {
    if (PKIsPadDevice() && CHGetPersonalizedSynthesisSupportState() >= 2)
    {
      -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v24);

      if (v25)
      {
        -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeFromSuperview");

        -[PKPaletteMoreOptionsViewController setAutoRefineNotReadyCell:](self, "setAutoRefineNotReadyCell:", 0);
      }
      -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        v28 = objc_alloc_init(PKPaletteOptionSwitchCell);
        -[PKPaletteMoreOptionsViewController setAutoRefineCell:](self, "setAutoRefineCell:", v28);

        _PencilKitBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Auto-refine Handwriting"), CFSTR("Auto-refine Handwriting"), CFSTR("Localizable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "textLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", v30);

        -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("Auto-refine-Switch"));

        -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "switchButton");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addTarget:action:forControlEvents:", self, sel__autoRefineCellDidChangeValue_, 4096);

      }
      -[PKPaletteMoreOptionsViewController _updateAutoRefineCell](self, "_updateAutoRefineCell");
      -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!PKIsPadDevice() || CHGetPersonalizedSynthesisSupportState() != 1)
        goto LABEL_44;
      -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PKPaletteMoreOptionsViewController _isCellInstalled:](self, "_isCellInstalled:", v38);

      if (v39)
      {
        -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeFromSuperview");

        -[PKPaletteMoreOptionsViewController setAutoRefineCell:](self, "setAutoRefineCell:", 0);
      }
      -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v42 = objc_alloc_init(PKPaletteOptionInfoCell);
        -[PKPaletteMoreOptionsViewController setAutoRefineNotReadyCell:](self, "setAutoRefineNotReadyCell:", v42);

        _PencilKitBundle();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Auto-refine Handwriting"), CFSTR("Auto-refine Handwriting"), CFSTR("Localizable"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
        v45 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v45)
          v45 = (_QWORD *)v45[52];
        objc_msgSend(v45, "setText:", v44);

        v47 = MGGetBoolAnswer();
        _PencilKitBundle();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if ((v47 & 1) != 0)
          v50 = CFSTR("Support for improving handwriting legibility will download when connected to WLAN.");
        else
          v50 = CFSTR("Support for improving handwriting legibility will download when connected to Wi-Fi.");
        objc_msgSend(v48, "localizedStringForKey:value:table:", v50, v50, CFSTR("Localizable"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
        v52 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        if (v52)
          v52 = (_QWORD *)v52[53];
        objc_msgSend(v52, "setText:", v51);

        -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setAccessibilityIdentifier:", CFSTR("Auto-refine-Info"));

      }
      -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteMoreOptionsViewController autoRefineNotReadyCell](self, "autoRefineNotReadyCell");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v56 = (void *)v37;
    objc_msgSend(v36, "addArrangedSubview:", v37);

  }
LABEL_44:
  if (-[PKPaletteMoreOptionsViewController _shouldInstallTapToRadarCell](self, "_shouldInstallTapToRadarCell"))
  {
    -[PKPaletteMoreOptionsViewController _makeTapToRadarCell](self, "_makeTapToRadarCell");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController setTapToRadarCell:](self, "setTapToRadarCell:", v57);

    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController tapToRadarCell](self, "tapToRadarCell");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addArrangedSubview:", v59);

  }
  else if (-[PKPaletteMoreOptionsViewController _shouldRemoveTapToRadarCell](self, "_shouldRemoveTapToRadarCell"))
  {
    -[PKPaletteMoreOptionsViewController tapToRadarCell](self, "tapToRadarCell");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "removeFromSuperview");

    -[PKPaletteMoreOptionsViewController setTapToRadarCell:](self, "setTapToRadarCell:", 0);
  }
  if (-[PKPaletteMoreOptionsViewController _shouldInstallResetHandwritingEducationPanelCell](self, "_shouldInstallResetHandwritingEducationPanelCell"))
  {
    -[PKPaletteMoreOptionsViewController _makeResetHandwritingEducationPaneCell](self, "_makeResetHandwritingEducationPaneCell");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController setResetHandwritingEducationPaneCell:](self, "setResetHandwritingEducationPaneCell:", v61);

    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController resetHandwritingEducationPaneCell](self, "resetHandwritingEducationPaneCell");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addArrangedSubview:", v63);

  }
  else if (-[PKPaletteMoreOptionsViewController _shouldRemoveResetHandwritingEducationPanelCell](self, "_shouldRemoveResetHandwritingEducationPanelCell"))
  {
    -[PKPaletteMoreOptionsViewController resetHandwritingEducationPaneCell](self, "resetHandwritingEducationPaneCell");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "removeFromSuperview");

    -[PKPaletteMoreOptionsViewController setResetHandwritingEducationPaneCell:](self, "setResetHandwritingEducationPaneCell:", 0);
  }
  if (-[PKPaletteMoreOptionsViewController _shouldInstallOpenPencilSettingsCell](self, "_shouldInstallOpenPencilSettingsCell"))
  {
    -[PKPaletteMoreOptionsViewController _makeOpenPencilSettingsCell](self, "_makeOpenPencilSettingsCell");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController setOpenPencilSettingsCell:](self, "setOpenPencilSettingsCell:", v65);

    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteMoreOptionsViewController openPencilSettingsCell](self, "openPencilSettingsCell");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addArrangedSubview:", v67);

  }
  else if (-[PKPaletteMoreOptionsViewController _shouldRemoveOpenPencilSettingsCell](self, "_shouldRemoveOpenPencilSettingsCell"))
  {
    -[PKPaletteMoreOptionsViewController openPencilSettingsCell](self, "openPencilSettingsCell");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "removeFromSuperview");

    -[PKPaletteMoreOptionsViewController setOpenPencilSettingsCell:](self, "setOpenPencilSettingsCell:", 0);
  }
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "arrangedSubviews");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "count");

  if (v71 >= 2)
  {
    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "arrangedSubviews");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "count");

    if (v74 != 1)
    {
      v75 = 0;
      do
      {
        v76 = objc_alloc_init(PKPaletteOptionCellDividerView);
        -[PKPaletteOptionCellDividerView setTranslatesAutoresizingMaskIntoConstraints:](v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "insertArrangedSubview:atIndex:", v76, v75 + 1);

        v78 = (void *)MEMORY[0x1E0CB3718];
        -[PKPaletteOptionCellDividerView heightAnchor](v76, "heightAnchor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "constraintEqualToConstant:", 0.5);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v80;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "activateConstraints:", v81);

        v75 += 2;
        -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "arrangedSubviews");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "count") - 1;

      }
      while (v75 < v84);
    }
  }
  -[PKPaletteMoreOptionsViewController _updateContentSize](self, "_updateContentSize");
}

- (BOOL)_isCellInstalled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (void)_updateContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteMoreOptionsViewController stackViewPositioningConstraints](self, "stackViewPositioningConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[PKPaletteMoreOptionsViewController stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v8 = v7;
    v10 = v9;

    -[PKPaletteMoreOptionsViewController _contentSizeMinWidth](self, "_contentSizeMinWidth");
    if (v11 < v8)
      v11 = v8;
    if (v11 > 500.0)
      v11 = 500.0;
    -[PKPaletteMoreOptionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v11, v10);
    v12 = (void *)MEMORY[0x1E0CB3718];
    -[PKPaletteMoreOptionsViewController stackViewPositioningConstraints](self, "stackViewPositioningConstraints");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v13);

  }
}

- (double)_contentSizeMinWidth
{
  void *v2;
  double v3;

  -[PKPaletteMoreOptionsViewController externalTraitCollection](self, "externalTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 1)
    v3 = 200.0;
  else
    v3 = 250.0;

  return v3;
}

- (void)setIsAutoRefineOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_isAutoRefineOn != a3)
  {
    v3 = a3;
    self->_isAutoRefineOn = a3;
    -[PKPaletteMoreOptionsViewController autoRefineCell](self, "autoRefineCell");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "switchButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOn:", v3);

  }
}

- (PKPaletteMoreOptionsViewControllerDelegate)delegate
{
  return (PKPaletteMoreOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldShowAutoMinimizeOption
{
  return self->_shouldShowAutoMinimizeOption;
}

- (void)setShouldShowAutoMinimizeOption:(BOOL)a3
{
  self->_shouldShowAutoMinimizeOption = a3;
}

- (BOOL)shouldShowFingerDrawsOption
{
  return self->_shouldShowFingerDrawsOption;
}

- (BOOL)isAutoHideOn
{
  return self->_autoHideOn;
}

- (BOOL)isFingerDrawsOn
{
  return self->_isFingerDrawsOn;
}

- (BOOL)shouldShowTapToRadarOption
{
  return self->_shouldShowTapToRadarOption;
}

- (BOOL)shouldShowResetHandwritingEducationPane
{
  return self->_shouldShowResetHandwritingEducationPane;
}

- (BOOL)shouldShowOpenPencilSettingsOption
{
  return self->_shouldShowOpenPencilSettingsOption;
}

- (BOOL)isAutoRefineOn
{
  return self->_isAutoRefineOn;
}

- (UITraitCollection)externalTraitCollection
{
  return self->_externalTraitCollection;
}

- (NSArray)stackViewPositioningConstraints
{
  return self->_stackViewPositioningConstraints;
}

- (void)setStackViewPositioningConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewPositioningConstraints, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (PKPaletteOptionSwitchCell)autoMinimizeCell
{
  return self->_autoMinimizeCell;
}

- (void)setAutoMinimizeCell:(id)a3
{
  objc_storeStrong((id *)&self->_autoMinimizeCell, a3);
}

- (PKPaletteOptionSwitchCell)shapesCell
{
  return self->_shapesCell;
}

- (void)setShapesCell:(id)a3
{
  objc_storeStrong((id *)&self->_shapesCell, a3);
}

- (PKPaletteOptionSwitchCell)fingerDrawsCell
{
  return self->_fingerDrawsCell;
}

- (void)setFingerDrawsCell:(id)a3
{
  objc_storeStrong((id *)&self->_fingerDrawsCell, a3);
}

- (PKPaletteOptionButtonCell)tapToRadarCell
{
  return self->_tapToRadarCell;
}

- (void)setTapToRadarCell:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarCell, a3);
}

- (PKPaletteOptionButtonCell)resetHandwritingEducationPaneCell
{
  return self->_resetHandwritingEducationPaneCell;
}

- (void)setResetHandwritingEducationPaneCell:(id)a3
{
  objc_storeStrong((id *)&self->_resetHandwritingEducationPaneCell, a3);
}

- (PKPaletteOptionButtonCell)openPencilSettingsCell
{
  return self->_openPencilSettingsCell;
}

- (void)setOpenPencilSettingsCell:(id)a3
{
  objc_storeStrong((id *)&self->_openPencilSettingsCell, a3);
}

- (PKPaletteOptionSwitchCell)autoRefineCell
{
  return self->_autoRefineCell;
}

- (void)setAutoRefineCell:(id)a3
{
  objc_storeStrong((id *)&self->_autoRefineCell, a3);
}

- (PKPaletteOptionInfoCell)autoRefineNotReadyCell
{
  return self->_autoRefineNotReadyCell;
}

- (void)setAutoRefineNotReadyCell:(id)a3
{
  objc_storeStrong((id *)&self->_autoRefineNotReadyCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoRefineNotReadyCell, 0);
  objc_storeStrong((id *)&self->_autoRefineCell, 0);
  objc_storeStrong((id *)&self->_openPencilSettingsCell, 0);
  objc_storeStrong((id *)&self->_resetHandwritingEducationPaneCell, 0);
  objc_storeStrong((id *)&self->_tapToRadarCell, 0);
  objc_storeStrong((id *)&self->_fingerDrawsCell, 0);
  objc_storeStrong((id *)&self->_shapesCell, 0);
  objc_storeStrong((id *)&self->_autoMinimizeCell, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_stackViewPositioningConstraints, 0);
  objc_storeStrong((id *)&self->_externalTraitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
