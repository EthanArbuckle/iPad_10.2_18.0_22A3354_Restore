@implementation HUServiceDetailsCameraDoorbellChimeMuteItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _DWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_doorbellChimeMuteCharacteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _HULocalizedStringWithDefaultValue(CFSTR("HUCameraDoorbellChimeMuteSwitchTitle"), CFSTR("HUCameraDoorbellChimeMuteSwitchTitle"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "hf_currentUserIsAdministrator"))
        v13 = MEMORY[0x1E0C9AAA0];
      else
        v13 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C80]);

      objc_opt_class();
      objc_msgSend(v8, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      v17 = objc_msgSend(v16, "BOOLValue");
      v18 = v17 ^ 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30E20]);

      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 67109120;
        v30[1] = v18;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "Displaying doorbell chime state - should play sound = %{BOOL}d.", (uint8_t *)v30, 8u);
      }

      v21 = (void *)MEMORY[0x1E0D519C0];
      v22 = (void *)MEMORY[0x1E0D314B8];
    }
    else
    {
      HFLogForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30[0]) = 0;
        _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "Hiding doorbell chime item for camera. Missing mute characteristic.", (uint8_t *)v30, 2u);
      }

      v21 = (void *)MEMORY[0x1E0D519C0];
      v27 = (void *)MEMORY[0x1E0D314B8];
      v31 = *MEMORY[0x1E0D30D70];
      v32 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v27;
    }
    objc_msgSend(v22, "outcomeWithResults:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithResult:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0D519C0];
    v24 = (void *)MEMORY[0x1E0D314B8];
    v33 = *MEMORY[0x1E0D30D70];
    v34[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "outcomeWithResults:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

@end
