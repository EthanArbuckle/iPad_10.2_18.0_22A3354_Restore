@implementation HUCameraEraseRecordingsItem

- (HUCameraEraseRecordingsItem)initWithCameraProfile:(id)a3
{
  id v5;
  HUCameraEraseRecordingsItem *v6;
  HUCameraEraseRecordingsItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraEraseRecordingsItem;
  v6 = -[HFStaticItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cameraProfile, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_initWeak(&location, self);
  -[HUCameraEraseRecordingsItem cameraProfile](self, "cameraProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clipManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUCameraEraseRecordingsItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6F5A010;
  objc_copyWeak(&v12, &location);
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "fetchCountOfAllClipsWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __59__HUCameraEraseRecordingsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = objc_msgSend(v3, "BOOLValue");
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Erase all camera recording control hidden:%{BOOL}d.", (uint8_t *)v6, 8u);
  }

  objc_msgSend(WeakRetained, "_updateResultsForFuture:withHiddenStatus:", *(_QWORD *)(a1 + 32), objc_msgSend(v3, "integerValue") < 1);
}

- (void)_updateResultsForFuture:(id)a3 withHiddenStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v4 = a4;
  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D30D18];
  v6 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraEraseAllRecordings"), CFSTR("HUCameraEraseAllRecordings"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = *MEMORY[0x1E0D30B80];
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraEraseRecordingsItem cameraProfile](self, "cameraProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v13);

}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
