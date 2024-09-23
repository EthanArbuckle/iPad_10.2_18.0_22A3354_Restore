@implementation HUCameraStorageDurationHeaderItemProvider

- (HUCameraStorageDurationHeaderItemProvider)initWithCameraProfiles:(id)a3 displayStyle:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HUCameraStorageDurationHeaderItemProvider *v10;
  uint64_t v11;
  NSSet *cameraProfiles;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D31840]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__HUCameraStorageDurationHeaderItemProvider_initWithCameraProfiles_displayStyle___block_invoke;
  v15[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v16, &location);
  v8 = (void *)objc_msgSend(v7, "initWithResultsBlock:", v15);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStorageDurationHeaderItemProvider;
  v10 = -[HFStaticItemProvider initWithItems:](&v14, sel_initWithItems_, v9);

  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v11;

    v10->_displayStyle = a4;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

id __81__HUCameraStorageDurationHeaderItemProvider_initWithCameraProfiles_displayStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "displayStyle");

  if (v2 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Header"), CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Header"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Body"), CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Body"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
LABEL_7:
    HUCameraBuildHeaderAttributedString(v6, v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (v2 == 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleSetup_Header"), CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleSetup_Header"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleSetup_Body"), CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleSetup_Body"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 2;
    goto LABEL_7;
  }
  if (v2 != 3)
  {
    v4 = (void *)objc_opt_new();
    goto LABEL_10;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleServiceDetails"), CFSTR("HUCameraRecordingSettingsHeaderDisplayStyleServiceDetails"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HUCameraBuildHeaderAttributedString(3, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_10:
  v7 = *MEMORY[0x1E0D30BF8];
  v14[0] = v4;
  v8 = *MEMORY[0x1E0D30D70];
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2 == 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x1E0D30DA8];
  v14[1] = v9;
  v14[2] = &unk_1E70419E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HUCameraStorageDurationHeaderItemProvider)initWithItems:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithCameraProfiles_displayStyle_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraStorageDurationHeaderItemProvider.m"), 67, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraStorageDurationHeaderItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUCameraStorageDurationHeaderItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
}

@end
