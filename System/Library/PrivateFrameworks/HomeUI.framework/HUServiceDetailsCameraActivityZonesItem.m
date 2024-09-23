@implementation HUServiceDetailsCameraActivityZonesItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
    v9 = CFSTR("HUServiceDetailsDisplayCameraActivityZonesEditorTitle");
  else
    v9 = CFSTR("HUServiceDetailsDisplayCameraActivityZonesEditorNonAdminTitle");
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  -[HUServiceDetailsAbstractItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hf_hasResidentDeviceCapableOfSupportingActivityZones") & 1) == 0)
  {

    goto LABEL_13;
  }
  objc_msgSend(v6, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hf_supportsRecordingEvents");

  if (!v13)
  {
LABEL_13:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30B78]);

  objc_msgSend(v6, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activityZones");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  -[HUServiceDetailsAbstractItem home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v20, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");

  objc_msgSend(v6, "profile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!(_DWORD)v15)
  {
    objc_msgSend(v21, "userSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "recordingEventTriggers") & 0xE;

    v24 = *MEMORY[0x1E0D30D70];
    if (!v27)
      goto LABEL_11;
LABEL_15:
    v25 = MEMORY[0x1E0C9AAA0];
    goto LABEL_16;
  }
  v23 = objc_msgSend(v21, "hf_cameraIsNotSetToRecord");

  v24 = *MEMORY[0x1E0D30D70];
  if ((v23 & 1) == 0)
    goto LABEL_15;
LABEL_11:
  v25 = MEMORY[0x1E0C9AAB0];
LABEL_16:
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v24);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v19);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_1E6F60E80;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30BF8]);

LABEL_20:
  v29 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "futureWithResult:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
