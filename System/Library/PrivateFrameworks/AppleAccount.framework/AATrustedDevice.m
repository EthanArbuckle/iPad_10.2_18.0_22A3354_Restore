@implementation AATrustedDevice

- (AATrustedDevice)initWithDictionary:(id)a3
{
  id v4;
  AATrustedDevice *v5;
  uint64_t v6;
  NSString *deviceID;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *model;
  uint64_t v12;
  NSString *osVersion;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *modelDisplayName;
  uint64_t v21;
  uint64_t v22;
  NSString *modelSmallPhotoURL1x;
  uint64_t v24;
  NSString *modelSmallPhotoURL2x;
  uint64_t v26;
  NSString *modelSmallPhotoURL3x;
  uint64_t v28;
  NSString *modelLargePhotoURL1x;
  uint64_t v30;
  NSString *modelLargePhotoURL2x;
  uint64_t v32;
  NSString *modelLargePhotoURL3x;
  uint64_t v34;
  NSString *deviceDetailUri;
  uint64_t v36;
  NSString *deviceDetailHttpMethod;
  uint64_t v38;
  NSString *pushToken;

  v4 = a3;
  v5 = -[AATrustedDevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelName"));
    v10 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentDevice"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentDevice = objc_msgSend(v14, "BOOLValue");

    if (v5->_currentDevice)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("THIS_DEVICE"), &stru_1E41752F8, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelName"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      modelDisplayName = v5->_modelDisplayName;
      v5->_modelDisplayName = (NSString *)v19;

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelName"));
      v21 = objc_claimAutoreleasedReturnValue();
      v16 = v5->_modelDisplayName;
      v5->_modelDisplayName = (NSString *)v21;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listImageLocation"));
    v22 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL1x = v5->_modelSmallPhotoURL1x;
    v5->_modelSmallPhotoURL1x = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listImageLocation2x"));
    v24 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL2x = v5->_modelSmallPhotoURL2x;
    v5->_modelSmallPhotoURL2x = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("listImageLocation3x"));
    v26 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL3x = v5->_modelSmallPhotoURL3x;
    v5->_modelSmallPhotoURL3x = (NSString *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("infoboxImageLocation"));
    v28 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL1x = v5->_modelLargePhotoURL1x;
    v5->_modelLargePhotoURL1x = (NSString *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("infoboxImageLocation2x"));
    v30 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL2x = v5->_modelLargePhotoURL2x;
    v5->_modelLargePhotoURL2x = (NSString *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("infoboxImageLocation3x"));
    v32 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL3x = v5->_modelLargePhotoURL3x;
    v5->_modelLargePhotoURL3x = (NSString *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceDetailUri"));
    v34 = objc_claimAutoreleasedReturnValue();
    deviceDetailUri = v5->_deviceDetailUri;
    v5->_deviceDetailUri = (NSString *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceDetailHttpMethod"));
    v36 = objc_claimAutoreleasedReturnValue();
    deviceDetailHttpMethod = v5->_deviceDetailHttpMethod;
    v5->_deviceDetailHttpMethod = (NSString *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pushToken"));
    v38 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v38;

  }
  return v5;
}

- (void)updateWithRUIClientInfo:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *FMIPDeviceID;
  NSString *v8;
  NSString *detailDeviceName;
  NSString *v10;
  NSString *detailSubLabel;
  NSString *v12;
  NSString *rawLatestBackup;
  NSString *v14;
  NSString *backupUUID;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *deviceQualifiedClass;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showFMIPLink"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showFMIPLink = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceFmipDeviceId"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  FMIPDeviceID = self->_FMIPDeviceID;
  self->_FMIPDeviceID = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceName"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailDeviceName = self->_detailDeviceName;
  self->_detailDeviceName = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceSubLabel"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailSubLabel = self->_detailSubLabel;
  self->_detailSubLabel = v10;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawLatestBackup"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  rawLatestBackup = self->_rawLatestBackup;
  self->_rawLatestBackup = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backupUuid"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  backupUUID = self->_backupUUID;
  self->_backupUUID = v14;

  if (-[NSString isEqualToString:](self->_rawLatestBackup, "isEqualToString:", &stru_1E41752F8))
  {
    v16 = self->_rawLatestBackup;
    self->_rawLatestBackup = 0;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceFmipEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_fmipEnabled = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceQualifiedClass"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceQualifiedClass = self->_deviceQualifiedClass;
  self->_deviceQualifiedClass = v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showDeviceHeaderNatively"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_injectNativeHeader = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showFMIPRow"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v21;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "TrustedDevice server response: showFMIP %@", (uint8_t *)&v25, 0xCu);
  }

  if (v21)
    self->_showFMIPRow = objc_msgSend(v21, "BOOLValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showBackupRow"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v23;
    _os_log_impl(&dword_19EACA000, v24, OS_LOG_TYPE_DEFAULT, "TrustedDevice server response: showBackup %@", (uint8_t *)&v25, 0xCu);
  }

  if (v23)
    self->_showBackupRow = objc_msgSend(v23, "BOOLValue");

}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (NSString)modelSmallPhotoURL3x
{
  return self->_modelSmallPhotoURL3x;
}

- (NSString)modelSmallPhotoURL2x
{
  return self->_modelSmallPhotoURL2x;
}

- (NSString)modelSmallPhotoURL1x
{
  return self->_modelSmallPhotoURL1x;
}

- (NSString)modelLargePhotoURL3x
{
  return self->_modelLargePhotoURL3x;
}

- (NSString)modelLargePhotoURL2x
{
  return self->_modelLargePhotoURL2x;
}

- (NSString)modelLargePhotoURL1x
{
  return self->_modelLargePhotoURL1x;
}

- (NSString)deviceDetailUri
{
  return self->_deviceDetailUri;
}

- (NSString)deviceDetailHttpMethod
{
  return self->_deviceDetailHttpMethod;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (BOOL)fmipEnabled
{
  return self->_fmipEnabled;
}

- (BOOL)currentDevice
{
  return self->_currentDevice;
}

- (BOOL)showFMIPLink
{
  return self->_showFMIPLink;
}

- (BOOL)showBackupRow
{
  return self->_showBackupRow;
}

- (BOOL)showFMIPRow
{
  return self->_showFMIPRow;
}

- (BOOL)injectNativeHeader
{
  return self->_injectNativeHeader;
}

- (NSString)FMIPDeviceID
{
  return self->_FMIPDeviceID;
}

- (NSString)detailDeviceName
{
  return self->_detailDeviceName;
}

- (NSString)detailSubLabel
{
  return self->_detailSubLabel;
}

- (NSString)deviceQualifiedClass
{
  return self->_deviceQualifiedClass;
}

- (NSString)rawLatestBackup
{
  return self->_rawLatestBackup;
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_rawLatestBackup, 0);
  objc_storeStrong((id *)&self->_deviceQualifiedClass, 0);
  objc_storeStrong((id *)&self->_detailSubLabel, 0);
  objc_storeStrong((id *)&self->_detailDeviceName, 0);
  objc_storeStrong((id *)&self->_FMIPDeviceID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_deviceDetailHttpMethod, 0);
  objc_storeStrong((id *)&self->_deviceDetailUri, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
