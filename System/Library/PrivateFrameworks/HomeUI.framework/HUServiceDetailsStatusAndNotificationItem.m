@implementation HUServiceDetailsStatusAndNotificationItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  const __CFString *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF329C38))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v9, "hf_supportsHomeStatus");
  v11 = (void *)MEMORY[0x1E0D31228];
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "cameraContainsMotionServiceItem:", v12);

  v14 = v7;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF347C70))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_opt_class();
  -[HUServiceDetailsAbstractItem sourceServiceItem](self, "sourceServiceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  v42 = objc_msgSend(v19, "mediaAccessoryItemType");
  if (v19)
  {
    objc_msgSend(v19, "accessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF347C70))
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    v16 = v23;
  }
  objc_msgSend(v16, "hf_userNotificationSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    v25 = v13;
  else
    v25 = 1;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "homeManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hasOptedToHH2");

  -[HUServiceDetailsAbstractItem home](self, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "residentDevices");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v25 & 1) != 0)
  {
    v31 = 0;
  }
  else if (v28 && objc_msgSend(v30, "count"))
  {
    v31 = 1;
  }
  else
  {
    v31 = v28 ^ 1;
  }
  HFLogForCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "-[HUServiceDetailsStatusAndNotificationItem _subclass_updateWithOptions:]";
    v45 = 1024;
    v46 = v28;
    v47 = 2048;
    v48 = objc_msgSend(v30, "count");
    _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d residents = %lu", buf, 0x1Cu);
  }

  if ((v10 & v31 & 1) != 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceDetailsStatusAndNotificationTitle"), CFSTR("HUServiceDetailsStatusAndNotificationTitle"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D30D18]);

    v34 = CFSTR("AccessoryDetails.Status");
    v35 = (_QWORD *)MEMORY[0x1E0D30BA0];
LABEL_36:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, *v35);
    goto LABEL_37;
  }
  if ((v31 & 1) == 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUStatusTitle"), CFSTR("HUStatusTitle"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AccessoryDetails.Status"), *MEMORY[0x1E0D30BA0]);
    if ((v10 & 1) != 0)
      goto LABEL_37;
    goto LABEL_35;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUNotificationsTitle"), CFSTR("HUNotificationsTitle"), 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AccessoryDetails.Status"), *MEMORY[0x1E0D30BA0]);
  if ((v10 & 1) == 0
    && !-[HUServiceDetailsAbstractItem isService](self, "isService")
    && !-[HUServiceDetailsAbstractItem isNotificationSupportedCamera](self, "isNotificationSupportedCamera")
    && !-[HUServiceDetailsAbstractItem isAudioAnalysisSupportedDevice](self, "isAudioAnalysisSupportedDevice"))
  {
LABEL_35:
    v34 = (const __CFString *)MEMORY[0x1E0C9AAB0];
    v35 = (_QWORD *)MEMORY[0x1E0D30D70];
    goto LABEL_36;
  }
LABEL_37:
  if (v42 == 3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  v38 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "futureWithResult:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

@end
