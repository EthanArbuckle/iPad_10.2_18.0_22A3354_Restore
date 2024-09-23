@implementation CSDashBoardQuickActionsButtonSettings

- (void)setDefaultValues
{
  -[CSDashBoardQuickActionsButtonSettings setShowsButtons:](self, "setShowsButtons:", 1);
  -[CSDashBoardQuickActionsButtonSettings setColorsBackground:](self, "setColorsBackground:", 0);
  -[CSDashBoardQuickActionsButtonSettings setTopOutset:](self, "setTopOutset:", 18.0);
  -[CSDashBoardQuickActionsButtonSettings setLeadingOutset:](self, "setLeadingOutset:", 18.0);
  -[CSDashBoardQuickActionsButtonSettings setTrailingOutset:](self, "setTrailingOutset:", 18.0);
  -[CSDashBoardQuickActionsButtonSettings setBottomOutset:](self, "setBottomOutset:", 18.0);
  -[CSDashBoardQuickActionsButtonSettings setUsesStrictTouchAllowance:](self, "setUsesStrictTouchAllowance:", 1);
  -[CSDashBoardQuickActionsButtonSettings setStrictTouchExtraRadius:](self, "setStrictTouchExtraRadius:", 8.0);
  -[CSDashBoardQuickActionsButtonSettings setMaximumTouchDuration:](self, "setMaximumTouchDuration:", 2.0);
  -[CSDashBoardQuickActionsButtonSettings setAllowsOnPad:](self, "setAllowsOnPad:", 0);
}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[4];
  _QWORD v33[3];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Shows Buttons"), CFSTR("showsButtons"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Colors Background"), CFSTR("colorsBackground"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Supports iPad"), CFSTR("allowsOnPad"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v34[0] = v30;
  v34[1] = v29;
  v34[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Touch Gating"), CFSTR("usesStrictTouchAllowance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Extra Touch Radius"), CFSTR("strictTouchExtraRadius"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 20.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Maximum Duration"), CFSTR("maximumTouchDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 12.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  v33[0] = v26;
  v33[1] = v25;
  v33[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Pocket Touch Protections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top"), CFSTR("topOutset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 64.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading"), CFSTR("leadingOutset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 64.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing"), CFSTR("trailingOutset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 64.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom"), CFSTR("bottomOutset"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 64.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v32[0] = v10;
  v32[1] = v12;
  v32[2] = v14;
  v32[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:title:", v18, CFSTR("Button Outsets"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v31[0] = v27;
  v31[1] = v8;
  v31[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Dismiss Gesture Settings"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_homeWidget
{
  return -[CSDashBoardQuickActionsButtonSettings _widgetForBundle:container:kind:](self, "_widgetForBundle:container:kind:", CFSTR("com.apple.Home.HomeWidget.Interactive"), CFSTR("com.apple.Home"), CFSTR("com.apple.Home.widget.controlcenter"));
}

- (id)_gasparAlarmWidget
{
  return -[CSDashBoardQuickActionsButtonSettings _widgetForBundle:container:kind:](self, "_widgetForBundle:container:kind:", CFSTR("com.apple.Gaspar.GasparWidget"), CFSTR("com.apple.Gaspar"), CFSTR("com.apple.gaspar.silentmode"));
}

- (id)_widgetForBundle:(id)a3 container:(id)a4 kind:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0D10038];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v10, v9, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10148]), "initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:", v11, v8, 14, 0, 0);
  return v12;
}

- (BOOL)showsButtons
{
  return self->_showsButtons;
}

- (void)setShowsButtons:(BOOL)a3
{
  self->_showsButtons = a3;
}

- (BOOL)colorsBackground
{
  return self->_colorsBackground;
}

- (void)setColorsBackground:(BOOL)a3
{
  self->_colorsBackground = a3;
}

- (double)topOutset
{
  return self->_topOutset;
}

- (void)setTopOutset:(double)a3
{
  self->_topOutset = a3;
}

- (double)leadingOutset
{
  return self->_leadingOutset;
}

- (void)setLeadingOutset:(double)a3
{
  self->_leadingOutset = a3;
}

- (double)trailingOutset
{
  return self->_trailingOutset;
}

- (void)setTrailingOutset:(double)a3
{
  self->_trailingOutset = a3;
}

- (double)bottomOutset
{
  return self->_bottomOutset;
}

- (void)setBottomOutset:(double)a3
{
  self->_bottomOutset = a3;
}

- (BOOL)usesStrictTouchAllowance
{
  return self->_usesStrictTouchAllowance;
}

- (void)setUsesStrictTouchAllowance:(BOOL)a3
{
  self->_usesStrictTouchAllowance = a3;
}

- (double)strictTouchExtraRadius
{
  return self->_strictTouchExtraRadius;
}

- (void)setStrictTouchExtraRadius:(double)a3
{
  self->_strictTouchExtraRadius = a3;
}

- (double)maximumTouchDuration
{
  return self->_maximumTouchDuration;
}

- (void)setMaximumTouchDuration:(double)a3
{
  self->_maximumTouchDuration = a3;
}

- (BOOL)allowsOnPad
{
  return self->_allowsOnPad;
}

- (void)setAllowsOnPad:(BOOL)a3
{
  self->_allowsOnPad = a3;
}

@end
