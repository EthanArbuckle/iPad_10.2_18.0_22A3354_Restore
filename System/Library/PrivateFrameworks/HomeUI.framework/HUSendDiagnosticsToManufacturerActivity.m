@implementation HUSendDiagnosticsToManufacturerActivity

- (HUSendDiagnosticsToManufacturerActivity)initWithDiagnosticItem:(id)a3
{
  id v5;
  HUSendDiagnosticsToManufacturerActivity *v6;
  HUSendDiagnosticsToManufacturerActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSendDiagnosticsToManufacturerActivity;
  v6 = -[UIActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_diagnosticItem, a3);

  return v7;
}

- (id)activityType
{
  return CFSTR("com.apple.Home.sendDiagnosticsToManufacturerActivity");
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  -[HUSendDiagnosticsToManufacturerActivity diagnosticItem](self, "diagnosticItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manufacturer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUSendDiagnosticsToManufacturerActivityTitle"), CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("apple.bubble.middle.bottom"));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Preparing with activity items :%@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)activityViewController
{
  HUAccessoryDiagnosticsConsentViewController *v3;
  void *v4;
  HUAccessoryDiagnosticsConsentViewController *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[5];

  v3 = [HUAccessoryDiagnosticsConsentViewController alloc];
  -[HUSendDiagnosticsToManufacturerActivity diagnosticItem](self, "diagnosticItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HUSendDiagnosticsToManufacturerActivity_activityViewController__block_invoke;
  v10[3] = &unk_1E6F4E300;
  v10[4] = self;
  v5 = -[HUAccessoryDiagnosticsConsentViewController initWithItem:completionHandler:](v3, "initWithItem:completionHandler:", v4, v10);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Returning activityViewController for HUSendDiagnosticsToManufacturerActivity", v9, 2u);
  }

  return v6;
}

uint64_t __65__HUSendDiagnosticsToManufacturerActivity_activityViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0D31088], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "diagnosticItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uploadDiagnosticLogUsingItem:", v5);

  }
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", a2);
}

- (HFAccessoryDiagnosticItem)diagnosticItem
{
  return self->_diagnosticItem;
}

- (void)setDiagnosticItem:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticItem, 0);
}

@end
