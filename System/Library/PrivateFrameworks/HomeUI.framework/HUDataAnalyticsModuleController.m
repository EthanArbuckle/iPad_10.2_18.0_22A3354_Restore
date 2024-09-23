@implementation HUDataAnalyticsModuleController

- (HUDataAnalyticsModuleController)initWithModule:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDataAnalyticsModuleController;
  return -[HUItemModuleController initWithModule:](&v4, sel_initWithModule_, a3);
}

- (id)module
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDataAnalyticsModuleController;
  -[HUItemModuleController module](&v3, sel_module);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v14, "setAccessoryType:", 1);
  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v14, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v12);

  if (v11)
}

- (BOOL)canSelectItem:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  -[HUDataAnalyticsModuleController dataAnalyticsModuleControllerDelegate](self, "dataAnalyticsModuleControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HUDataAnalyticsModuleController dataAnalyticsModuleControllerDelegate](self, "dataAnalyticsModuleControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataAnalyticsModuleController:didSelectItem:", self, v4);

  }
  return 0;
}

- (HUDataAnalyticsModuleControllerDelegate)dataAnalyticsModuleControllerDelegate
{
  return (HUDataAnalyticsModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_dataAnalyticsModuleControllerDelegate);
}

- (void)setDataAnalyticsModuleControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataAnalyticsModuleControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataAnalyticsModuleControllerDelegate);
}

@end
