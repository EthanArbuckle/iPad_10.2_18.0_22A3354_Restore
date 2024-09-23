@implementation HFAccessorySettingSiriHistoryAdapter

- (HFAccessorySettingSiriHistoryAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v7;
  void *v8;
  HFAccessorySettingSiriHistoryAdapter *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingSiriHistoryAdapter.m"), 23, CFSTR("The Siri History Adapter is only used on the Controller"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingSiriHistoryAdapter;
  v9 = -[HFAccessorySettingAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:](&v12, sel_initWithHomeKitSettingsVendor_keyPaths_mode_updateHandler_, v7, v8, a4, 0);

  return v9;
}

- (HFAccessorySettingSiriHistoryAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingSiriHistoryAdapter.m"), 37, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessorySettingSiriHistoryAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  int v6;

  -[HFAccessorySettingAdapter homeKitSettingsVendor](self, "homeKitSettingsVendor", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F0449888))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "isContainedWithinItemGroup") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

@end
