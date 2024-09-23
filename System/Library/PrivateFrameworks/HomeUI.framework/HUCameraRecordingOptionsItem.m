@implementation HUCameraRecordingOptionsItem

- (HUCameraRecordingOptionsItem)initWithCameraProfiles:(id)a3
{
  id v5;
  HUCameraRecordingOptionsItem *v6;
  HUCameraRecordingOptionsItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraRecordingOptionsItem;
  v6 = -[HFStaticItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cameraProfiles, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle"), CFSTR("HUServiceDetailsCameraStreamingAndRecordingItemDisplayTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsItem cameraProfiles](self, "cameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_212);

  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = *MEMORY[0x1E0D30D70];
  v17[0] = *MEMORY[0x1E0D30D18];
  v17[1] = v8;
  v9 = MEMORY[0x1E0C9AAB0];
  if (v6)
    v9 = MEMORY[0x1E0C9AAA0];
  v18[0] = v4;
  v18[1] = v9;
  v17[2] = *MEMORY[0x1E0D30B80];
  -[HUCameraRecordingOptionsItem cameraProfiles](self, "cameraProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __60__HUCameraRecordingOptionsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "userSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "accessModeForPresenceType:", 3) == 2)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "userSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "accessModeForPresenceType:", 4) == 2;

  }
  return v4;
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
