@implementation HUCameraUsageOptionItem

- (HUCameraUsageOptionItem)initWithPresence:(unint64_t)a3 cameraUsage:(unint64_t)a4 cameraProfiles:(id)a5
{
  id v8;
  HUCameraUsageOptionItem *v9;
  HUCameraUsageOptionItem *v10;
  uint64_t v11;
  NSSet *cameraProfiles;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraUsageOptionItem;
  v9 = -[HUCameraUsageOptionItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_presence = a3;
    v9->_usage = a4;
    v9->_sortOrder = +[HUCameraUsageOptionItem sortOrderForUsage:](HUCameraUsageOptionItem, "sortOrderForUsage:", a4);
    v11 = objc_msgSend(v8, "copy");
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v11;

  }
  return v10;
}

- (NSString)privacyDescription
{
  __CFString *v2;
  NSString *result;

  switch(-[HUCameraUsageOptionItem usage](self, "usage"))
  {
    case 0uLL:
      v2 = CFSTR("HUCameraRecordingSettingsOffDescription");
      goto LABEL_7;
    case 1uLL:
      v2 = CFSTR("HUCameraRecordingSettingsStreamOnlyDescription");
      goto LABEL_7;
    case 2uLL:
      v2 = CFSTR("HUCameraRecordingSettingsStreamAndRecordDescription");
      goto LABEL_7;
    case 3uLL:
      v2 = CFSTR("HUCameraRecordingSettingsDetectActivityDescription");
LABEL_7:
      _HULocalizedStringWithDefaultValue(v2, v2, 1);
      result = (NSString *)(id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = &stru_1E6F60E80;
      break;
  }
  return result;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v23;
  _QWORD v25[8];
  _QWORD v26[9];

  v26[8] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CBA408];
  -[HUCameraUsageOptionItem cameraProfiles](self, "cameraProfiles", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hf_cameraAccessModeSelectedOptionForCameraProfiles:presenceType:", v5, -[HUCameraUsageOptionItem presence](self, "presence"));

  -[HUCameraUsageOptionItem cameraProfiles](self, "cameraProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator") ^ 1;

  v25[0] = *MEMORY[0x1E0D30D18];
  -[HUCameraUsageOptionItem usage](self, "usage");
  HFLocalizedStringFromHMCameraAccessMode();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v25[1] = *MEMORY[0x1E0D30BF8];
  -[HUCameraUsageOptionItem privacyDescription](self, "privacyDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  v25[2] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HUCameraUsageOptionItem usage](self, "usage") == v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v14;
  v25[3] = *MEMORY[0x1E0D30B80];
  -[HUCameraUsageOptionItem cameraProfiles](self, "cameraProfiles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v15;
  v25[4] = CFSTR("HUCameraSettingResultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraUsageOptionItem usage](self, "usage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v16;
  v25[5] = *MEMORY[0x1E0D30DA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUCameraUsageOptionItem sortOrder](self, "sortOrder"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v17;
  v25[6] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v18;
  v25[7] = *MEMORY[0x1E0D30EA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUCameraUsageOptionItem updateInProgress](self, "updateInProgress"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "futureWithResult:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (unint64_t)sortOrderForUsage:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1B9443050[a3 - 1];
}

- (unint64_t)presence
{
  return self->_presence;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
}

@end
