@implementation CSAudioPlayingApp

- (CSAudioPlayingApp)initWithPid:(int)a3
{
  uint64_t v3;
  CSAudioPlayingApp *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *bundleId;
  NSString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSString *v18;
  NSString *appName;
  void *v20;
  NSString *v21;
  NSString *version;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSString *v27;
  NSString *v28;
  NSObject *v30;
  __CFString *v31;
  const __CFString *v32;
  NSString *v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  NSString *v42;
  uint64_t v43;

  v3 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v36.receiver = self;
    v36.super_class = (Class)CSAudioPlayingApp;
    self = -[CSAudioPlayingApp init](&v36, sel_init);
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0D87D78], "identifierWithPid:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v23 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s Failed to fetch RBSProcessIdentifier", buf, 0xCu);
        }
        goto LABEL_2;
      }
      v7 = (void *)v6;
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0D87D60], "handleForIdentifier:error:", v6, &v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v35;
      if (!v8)
      {
        v24 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v30 = v24;
          objc_msgSend(v9, "localizedDescription");
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          v39 = 2114;
          v40 = v31;
          _os_log_error_impl(&dword_1B502E000, v30, OS_LOG_TYPE_ERROR, "%s Fail to create RBSProcessHandle : %{public}@", buf, 0x16u);

        }
        goto LABEL_2;
      }
      objc_msgSend(v8, "bundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (NSString *)objc_msgSend(v11, "copy");
      bundleId = self->_bundleId;
      self->_bundleId = v12;

      v14 = self->_bundleId;
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0CA58A0], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v14, 0, &v34);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (__CFString *)v34;
      if (v15)
      {
        objc_msgSend(v15, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (NSString *)objc_msgSend(v17, "copy");
        appName = self->_appName;
        self->_appName = v18;

        objc_msgSend(v15, "bundleVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (NSString *)objc_msgSend(v20, "copy");
        version = self->_version;
        self->_version = v21;

      }
      else
      {
        v25 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v32 = &stru_1E6885088;
          v33 = self->_bundleId;
          if (v16)
            v32 = v16;
          *(_DWORD *)buf = 136315650;
          v38 = "-[CSAudioPlayingApp initWithPid:]";
          v39 = 2112;
          v40 = v32;
          v41 = 2112;
          v42 = v33;
          _os_log_error_impl(&dword_1B502E000, v25, OS_LOG_TYPE_ERROR, "%s Failed to create application proxy %@ from bundleId %@", buf, 0x20u);
        }
        objc_storeStrong((id *)&self->_appName, self->_bundleId);
        v20 = self->_version;
        self->_version = (NSString *)CFSTR("unknown");
      }

      v26 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_appName;
        v28 = self->_version;
        *(_DWORD *)buf = 136315650;
        v38 = "-[CSAudioPlayingApp initWithPid:]";
        v39 = 2114;
        v40 = (const __CFString *)v27;
        v41 = 2114;
        v42 = v28;
        _os_log_impl(&dword_1B502E000, v26, OS_LOG_TYPE_DEFAULT, "%s Playing app: %{public}@, version: %{public}@", buf, 0x20u);
      }

    }
    self = self;
    v5 = self;
    goto LABEL_19;
  }
LABEL_2:
  v5 = 0;
LABEL_19:

  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
