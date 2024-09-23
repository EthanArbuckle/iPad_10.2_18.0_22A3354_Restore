@implementation HKSourceIngestSettingsViewController

- (HKSourceIngestSettingsViewController)initWithHealthStore:(id)a3 displayTypeController:(id)a4 source:(id)a5 useInsetStyling:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id *v12;
  HKSourceIngestSettingsViewController *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a6;
  v11 = a5;
  v12 = -[_HKIngestSettingsViewController _initWithHealthStore:displayTypeController:useInsetStyling:](self, "_initWithHealthStore:displayTypeController:useInsetStyling:", a3, a4, v6);
  v13 = (HKSourceIngestSettingsViewController *)v12;
  if (v12)
  {
    v14 = v12 + 134;
    objc_storeStrong(v12 + 134, a5);
    objc_msgSend(*v14, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSourceIngestSettingsViewController setTitle:](v13, "setTitle:", v15);

    v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(*v14, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
    -[_HKIngestSettingsViewController setDeviceIdentifier:](v13, "setDeviceIdentifier:", v18);

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSourceIngestSettingsViewController;
  -[_HKIngestSettingsViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsFromSource:", self->_source);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB7020]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E9C42888;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithPredicate:resultsHandler:", v3, v7);
  -[_HKIngestSettingsViewController healthStore](self, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:", v5);

}

void __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a4;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reloadData:", a3);
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

void __51__HKSourceIngestSettingsViewController_viewDidLoad__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Source sample types not returned: %@", a5, a6, a7, a8, 2u);
}

@end
