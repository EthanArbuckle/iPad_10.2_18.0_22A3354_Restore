@implementation CSTemperatureWarningViewController

- (CSTemperatureWarningViewController)initWithThermalStatusProvider:(id)a3
{
  id v5;
  CSTemperatureWarningViewController *v6;
  CSTemperatureWarningViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSTemperatureWarningViewController;
  v6 = -[CSTemperatureWarningViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_thermalStatusProvider, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSModalViewControllerBase view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDateView:", 0);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IPHONE_TOO_HOT"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v5);

  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("THERMAL_ALERT_STRING"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v6, &stru_1E8E30B28, CFSTR("CoverSheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitleText:", v7);

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DASHBOARD_BLOCK_EMERGENCY_BUTTON"), &stru_1E8E30B28, CFSTR("CoverSheet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryActionButtonText:", v8);

  objc_msgSend((id)objc_opt_class(), "thermometerGlyphForThermalStatus:", (-[CSThermalStatusProviding thermalStatus](self->_thermalStatusProvider, "thermalStatus") >> 63) | 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v9);

  v10.receiver = self;
  v10.super_class = (Class)CSTemperatureWarningViewController;
  -[CSModalViewControllerBase viewDidLoad](&v10, sel_viewDidLoad);

}

- (void)aggregateAppearance:(id)a3
{
  id v4;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSTemperatureWarningViewController;
  v4 = a3;
  -[CSModalViewControllerBase aggregateAppearance:](&v19, sel_aggregateAppearance_, v4);
  +[CSComponent statusBar](CSComponent, "statusBar", v19.receiver, v19.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 80);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidden:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v7);

  +[CSComponent homeAffordance](CSComponent, "homeAffordance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "priority:", 80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase appearanceIdentifier](self, "appearanceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hidden:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v12);

  +[CSComponent proudLock](CSComponent, "proudLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "priority:", 80);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hidden:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v15);

  +[CSComponent whitePoint](CSComponent, "whitePoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "priority:", 80);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hidden:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addComponent:", v18);

}

- (void)aggregateBehavior:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSTemperatureWarningViewController;
  v3 = a3;
  -[CSModalViewControllerBase aggregateBehavior:](&v4, sel_aggregateBehavior_, v3);
  objc_msgSend(v3, "addRestrictedCapabilities:", 1048632, v4.receiver, v4.super_class);

}

- (int64_t)presentationPriority
{
  return 580;
}

- (void)handleSecondaryActionForView:(id)a3
{
  id v4;

  +[CSAction actionWithType:](CSAction, "actionWithType:", 2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerBase sendAction:](self, "sendAction:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalStatusProvider, 0);
}

@end
