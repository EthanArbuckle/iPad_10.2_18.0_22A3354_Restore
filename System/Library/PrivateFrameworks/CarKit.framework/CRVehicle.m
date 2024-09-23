@implementation CRVehicle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRVehicle)init
{
  return -[CRVehicle initWithIdentifier:certificateSerial:](self, "initWithIdentifier:certificateSerial:", 0, 0);
}

- (CRVehicle)initWithIdentifier:(id)a3 certificateSerial:(id)a4
{
  id v6;
  id v7;
  CRVehicle *v8;
  CRVehicle *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRVehicle;
  v8 = -[CRVehicle init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      -[CRVehicle setIdentifier:](v8, "setIdentifier:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRVehicle setIdentifier:](v9, "setIdentifier:", v10);

    }
    -[CRVehicle setCertificateSerialNumber:](v9, "setCertificateSerialNumber:", v7);
    -[CRVehicle setPairingStatus:](v9, "setPairingStatus:", 0);
    -[CRVehicle setEnhancedIntegrationStatus:](v9, "setEnhancedIntegrationStatus:", 0);
    -[CRVehicle setAlbumArtUserPreference:](v9, "setAlbumArtUserPreference:", 0);
    -[CRVehicle setAppearanceModePreference:](v9, "setAppearanceModePreference:", -1);
    -[CRVehicle setMapsAppearancePreference:](v9, "setMapsAppearancePreference:", -1);
    -[CRVehicle setColorFilterPreference:](v9, "setColorFilterPreference:", 0);
    -[CRVehicle setBoldTextPreference:](v9, "setBoldTextPreference:", 0);
    -[CRVehicle setSoundRecognitionPreference:](v9, "setSoundRecognitionPreference:", 0);
    -[CRVehicle setVoiceControlPreference:](v9, "setVoiceControlPreference:", 0);
  }

  return v9;
}

- (CRVehicle)initWithCoder:(id)a3
{
  id v4;
  CRVehicle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  CRVehicle *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRVehicle;
  v5 = -[CRVehicle init](&v49, sel_init);

  if (!v5)
    goto LABEL_92;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("identifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setIdentifier:](v5, "setIdentifier:", v6);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("vehicleName")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setVehicleName:](v5, "setVehicleName:", v7);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("certificateSerialNumber")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificateSerialNumber"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setCertificateSerialNumber:](v5, "setCertificateSerialNumber:", v8);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pairingStatus")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPairingStatus:](v5, "setPairingStatus:", objc_msgSend(v9, "integerValue"));

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("enhancedIntegration")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enhancedIntegration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setEnhancedIntegrationStatus:](v5, "setEnhancedIntegrationStatus:", objc_msgSend(v10, "integerValue"));

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsEnhancedIntegration")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsEnhancedIntegration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsEnhancedIntegration:](v5, "setSupportsEnhancedIntegration:", objc_msgSend(v11, "BOOLValue"));

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsStartSessionRequest")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsStartSessionRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsStartSessionRequest:](v5, "setSupportsStartSessionRequest:", v12);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bluetoothAddress")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothAddress"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setBluetoothAddress:](v5, "setBluetoothAddress:", v13);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("carplayWiFiUUID")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carplayWiFiUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setCarplayWiFiUUID:](v5, "setCarplayWiFiUUID:", v14);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("carplayProtocols")))
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("carplayProtocols"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setAccessoryProtocols:](v5, "setAccessoryProtocols:", v18);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lastConnectionTime")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastConnectionTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setLastConnectedDate:](v5, "setLastConnectedDate:", v19);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("vehicleModelName")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleModelName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setVehicleModelName:](v5, "setVehicleModelName:", v20);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ppid")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ppid"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPPID:](v5, "setPPID:", v21);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("albumArtUserPreference")))
    -[CRVehicle setAlbumArtUserPreference:](v5, "setAlbumArtUserPreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("albumArtUserPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsUSBCarPlay")))
  {
    v22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsUSBCarPlay"));
  }
  else
  {
    -[CRVehicle bluetoothAddress](v5, "bluetoothAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      goto LABEL_35;
    v22 = 1;
  }
  -[CRVehicle setSupportsUSBCarPlay:](v5, "setSupportsUSBCarPlay:", v22);
LABEL_35:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsWirelessCarPlay")))
  {
    v24 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsWirelessCarPlay"));
LABEL_39:
    -[CRVehicle setSupportsWirelessCarPlay:](v5, "setSupportsWirelessCarPlay:", v24);
    goto LABEL_40;
  }
  -[CRVehicle bluetoothAddress](v5, "bluetoothAddress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v24 = 1;
    goto LABEL_39;
  }
LABEL_40:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("wallpaperIdentifierUserPreference")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpaperIdentifierUserPreference"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setWallpaperIdentifier:](v5, "setWallpaperIdentifier:", v26);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("previousWallpaperIdentifierUserPreference")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousWallpaperIdentifierUserPreference"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPreviousWallpaperIdentifier:](v5, "setPreviousWallpaperIdentifier:", v27);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appearanceModeUserPreference")))
    -[CRVehicle setAppearanceModePreference:](v5, "setAppearanceModePreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appearanceModeUserPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("mapsAppearancePreference")))
    -[CRVehicle setMapsAppearancePreference:](v5, "setMapsAppearancePreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapsAppearancePreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("colorFilterPreference")))
    -[CRVehicle setColorFilterPreference:](v5, "setColorFilterPreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("colorFilterPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("colorFilterIntensityPreference")))
  {
    v28 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v28, objc_opt_class(), CFSTR("colorFilterIntensityPreference"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setColorFilterIntensityPreference:](v5, "setColorFilterIntensityPreference:", v29);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("boldTextPreference")))
    -[CRVehicle setBoldTextPreference:](v5, "setBoldTextPreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("boldTextPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("soundRecognitionPreference")))
    -[CRVehicle setSoundRecognitionPreference:](v5, "setSoundRecognitionPreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("soundRecognitionPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("voiceControlPreference")))
    -[CRVehicle setVoiceControlPreference:](v5, "setVoiceControlPreference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("voiceControlPreference")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("disabledFeaturesPreference")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disabledFeaturesPreference"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setDisabledFeaturesPreference:](v5, "setDisabledFeaturesPreference:", v30);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsBluetoothLE")))
    -[CRVehicle setSupportsBluetoothLE:](v5, "setSupportsBluetoothLE:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBluetoothLE")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsThemeAssets")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsThemeAssets"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsThemeAssets:](v5, "setSupportsThemeAssets:", v31);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("clusterAssetIdentifier")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterAssetIdentifier"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetIdentifier:](v5, "setClusterAssetIdentifier:", v32);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("clusterAssetiOSContentVersion")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterAssetiOSContentVersion"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetiOSContentVersion:](v5, "setClusterAssetiOSContentVersion:", v33);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("clusterAssetVersion")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterAssetVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetVersion:](v5, "setClusterAssetVersion:", v34);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SDKVersion")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SDKVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSDKVersion:](v5, "setSDKVersion:", v35);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("clusterAssetURL")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterAssetURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetURL:](v5, "setClusterAssetURL:", v36);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stagedClusterAssetiOSContentVersion")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedClusterAssetiOSContentVersion"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetiOSContentVersion:](v5, "setStagedClusterAssetiOSContentVersion:", v37);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stagedClusterAssetVersion")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedClusterAssetVersion"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetVersion:](v5, "setStagedClusterAssetVersion:", v38);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stagedClusterAssetURL")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedClusterAssetURL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetURL:](v5, "setStagedClusterAssetURL:", v39);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("displayThemeData")))
  {
    v40 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v40, objc_opt_class(), CFSTR("displayThemeData"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setDisplayThemeData:](v5, "setDisplayThemeData:", v41);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("hasGaugeClusterScreen")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasGaugeClusterScreen"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setHasGaugeClusterScreen:](v5, "setHasGaugeClusterScreen:", v42);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("finishedWelcome")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("finishedWelcome"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setFinishedWelcome:](v5, "setFinishedWelcome:", v43);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("internalNotes")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internalNotes"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setInternalNotes:](v5, "setInternalNotes:", v44);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("isSiriBargeInDisabled")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isSiriBargeInDisabled"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSiriBargeInDisabled:](v5, "setSiriBargeInDisabled:", objc_msgSend(v45, "BOOLValue"));

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("supportsMixableAudio")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsMixableAudio"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsMixableAudio:](v5, "setSupportsMixableAudio:", objc_msgSend(v46, "BOOLValue"));

  }
LABEL_92:
  v47 = v5;

  return v47;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v63 = a3;
  -[CRVehicle identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRVehicle identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v5, CFSTR("identifier"));

  }
  -[CRVehicle vehicleName](self, "vehicleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRVehicle vehicleName](self, "vehicleName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v7, CFSTR("vehicleName"));

  }
  -[CRVehicle certificateSerialNumber](self, "certificateSerialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRVehicle certificateSerialNumber](self, "certificateSerialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v9, CFSTR("certificateSerialNumber"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CRVehicle pairingStatus](self, "pairingStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "encodeObject:forKey:", v10, CFSTR("pairingStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CRVehicle enhancedIntegrationStatus](self, "enhancedIntegrationStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "encodeObject:forKey:", v11, CFSTR("enhancedIntegration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRVehicle supportsEnhancedIntegration](self, "supportsEnhancedIntegration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "encodeObject:forKey:", v12, CFSTR("supportsEnhancedIntegration"));

  -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v14, CFSTR("supportsStartSessionRequest"));

  }
  objc_msgSend(v63, "encodeInt:forKey:", -[CRVehicle albumArtUserPreference](self, "albumArtUserPreference"), CFSTR("albumArtUserPreference"));
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsUSBCarPlay](self, "supportsUSBCarPlay"), CFSTR("supportsUSBCarPlay"));
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsWirelessCarPlay](self, "supportsWirelessCarPlay"), CFSTR("supportsWirelessCarPlay"));
  -[CRVehicle bluetoothAddress](self, "bluetoothAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CRVehicle bluetoothAddress](self, "bluetoothAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v16, CFSTR("bluetoothAddress"));

  }
  -[CRVehicle carplayWiFiUUID](self, "carplayWiFiUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CRVehicle carplayWiFiUUID](self, "carplayWiFiUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v18, CFSTR("carplayWiFiUUID"));

  }
  -[CRVehicle accessoryProtocols](self, "accessoryProtocols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CRVehicle accessoryProtocols](self, "accessoryProtocols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v20, CFSTR("carplayProtocols"));

  }
  -[CRVehicle lastConnectedDate](self, "lastConnectedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CRVehicle lastConnectedDate](self, "lastConnectedDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v22, CFSTR("lastConnectionTime"));

  }
  -[CRVehicle vehicleModelName](self, "vehicleModelName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[CRVehicle vehicleModelName](self, "vehicleModelName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v24, CFSTR("vehicleModelName"));

  }
  -[CRVehicle PPID](self, "PPID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CRVehicle PPID](self, "PPID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v26, CFSTR("ppid"));

  }
  -[CRVehicle wallpaperIdentifier](self, "wallpaperIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CRVehicle wallpaperIdentifier](self, "wallpaperIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v28, CFSTR("wallpaperIdentifierUserPreference"));

  }
  -[CRVehicle previousWallpaperIdentifier](self, "previousWallpaperIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[CRVehicle previousWallpaperIdentifier](self, "previousWallpaperIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v30, CFSTR("previousWallpaperIdentifierUserPreference"));

  }
  -[CRVehicle colorFilterIntensityPreference](self, "colorFilterIntensityPreference");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[CRVehicle colorFilterIntensityPreference](self, "colorFilterIntensityPreference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v32, CFSTR("colorFilterIntensityPreference"));

  }
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle appearanceModePreference](self, "appearanceModePreference"), CFSTR("appearanceModeUserPreference"));
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle mapsAppearancePreference](self, "mapsAppearancePreference"), CFSTR("mapsAppearancePreference"));
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle colorFilterPreference](self, "colorFilterPreference"), CFSTR("colorFilterPreference"));
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle boldTextPreference](self, "boldTextPreference"), CFSTR("boldTextPreference"));
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle soundRecognitionPreference](self, "soundRecognitionPreference"), CFSTR("soundRecognitionPreference"));
  objc_msgSend(v63, "encodeInteger:forKey:", -[CRVehicle voiceControlPreference](self, "voiceControlPreference"), CFSTR("voiceControlPreference"));
  -[CRVehicle disabledFeaturesPreference](self, "disabledFeaturesPreference");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[CRVehicle disabledFeaturesPreference](self, "disabledFeaturesPreference");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v34, CFSTR("disabledFeaturesPreference"));

  }
  objc_msgSend(v63, "encodeBool:forKey:", -[CRVehicle supportsBluetoothLE](self, "supportsBluetoothLE"), CFSTR("supportsBluetoothLE"));
  -[CRVehicle supportsThemeAssets](self, "supportsThemeAssets");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[CRVehicle supportsThemeAssets](self, "supportsThemeAssets");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v36, CFSTR("supportsThemeAssets"));

  }
  -[CRVehicle clusterAssetIdentifier](self, "clusterAssetIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[CRVehicle clusterAssetIdentifier](self, "clusterAssetIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v38, CFSTR("clusterAssetIdentifier"));

  }
  -[CRVehicle clusterAssetiOSContentVersion](self, "clusterAssetiOSContentVersion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[CRVehicle clusterAssetiOSContentVersion](self, "clusterAssetiOSContentVersion");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v40, CFSTR("clusterAssetiOSContentVersion"));

  }
  -[CRVehicle clusterAssetVersion](self, "clusterAssetVersion");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[CRVehicle clusterAssetVersion](self, "clusterAssetVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v42, CFSTR("clusterAssetVersion"));

  }
  -[CRVehicle SDKVersion](self, "SDKVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[CRVehicle SDKVersion](self, "SDKVersion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v44, CFSTR("SDKVersion"));

  }
  -[CRVehicle clusterAssetURL](self, "clusterAssetURL");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[CRVehicle clusterAssetURL](self, "clusterAssetURL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v46, CFSTR("clusterAssetURL"));

  }
  -[CRVehicle stagedClusterAssetiOSContentVersion](self, "stagedClusterAssetiOSContentVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[CRVehicle stagedClusterAssetiOSContentVersion](self, "stagedClusterAssetiOSContentVersion");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v48, CFSTR("stagedClusterAssetiOSContentVersion"));

  }
  -[CRVehicle stagedClusterAssetVersion](self, "stagedClusterAssetVersion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[CRVehicle stagedClusterAssetVersion](self, "stagedClusterAssetVersion");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v50, CFSTR("stagedClusterAssetVersion"));

  }
  -[CRVehicle stagedClusterAssetURL](self, "stagedClusterAssetURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[CRVehicle stagedClusterAssetURL](self, "stagedClusterAssetURL");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v52, CFSTR("stagedClusterAssetURL"));

  }
  -[CRVehicle displayThemeData](self, "displayThemeData");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[CRVehicle displayThemeData](self, "displayThemeData");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v54, CFSTR("displayThemeData"));

  }
  -[CRVehicle hasGaugeClusterScreen](self, "hasGaugeClusterScreen");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[CRVehicle hasGaugeClusterScreen](self, "hasGaugeClusterScreen");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v56, CFSTR("hasGaugeClusterScreen"));

  }
  -[CRVehicle finishedWelcome](self, "finishedWelcome");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[CRVehicle finishedWelcome](self, "finishedWelcome");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v58, CFSTR("finishedWelcome"));

  }
  -[CRVehicle internalNotes](self, "internalNotes");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[CRVehicle internalNotes](self, "internalNotes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v60, CFSTR("internalNotes"));

  }
  if (-[CRVehicle isSiriBargeInDisabled](self, "isSiriBargeInDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRVehicle isSiriBargeInDisabled](self, "isSiriBargeInDisabled"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v61, CFSTR("isSiriBargeInDisabled"));

  }
  if (-[CRVehicle supportsMixableAudio](self, "supportsMixableAudio"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CRVehicle supportsMixableAudio](self, "supportsMixableAudio"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "encodeObject:forKey:", v62, CFSTR("supportsMixableAudio"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRVehicle *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;

  v5 = +[CRVehicle allocWithZone:](CRVehicle, "allocWithZone:");
  v6 = (void *)-[NSUUID copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)-[NSData copyWithZone:](self->_certificateSerialNumber, "copyWithZone:", a3);
  v8 = -[CRVehicle initWithIdentifier:certificateSerial:](v5, "initWithIdentifier:certificateSerial:", v6, v7);

  v9 = -[NSString copyWithZone:](self->_vehicleName, "copyWithZone:", a3);
  v10 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v9;

  *(_QWORD *)(v8 + 152) = self->_pairingStatus;
  *(_QWORD *)(v8 + 40) = self->_enhancedIntegrationStatus;
  *(_BYTE *)(v8 + 8) = self->_supportsEnhancedIntegration;
  v11 = -[NSNumber copyWithZone:](self->_supportsStartSessionRequest, "copyWithZone:", a3);
  v12 = *(void **)(v8 + 208);
  *(_QWORD *)(v8 + 208) = v11;

  *(_QWORD *)(v8 + 224) = self->_albumArtUserPreference;
  *(_BYTE *)(v8 + 9) = self->_supportsUSBCarPlay;
  *(_BYTE *)(v8 + 10) = self->_supportsWirelessCarPlay;
  v13 = -[NSString copyWithZone:](self->_bluetoothAddress, "copyWithZone:", a3);
  v14 = *(void **)(v8 + 160);
  *(_QWORD *)(v8 + 160) = v13;

  v15 = -[NSString copyWithZone:](self->_carplayWiFiUUID, "copyWithZone:", a3);
  v16 = *(void **)(v8 + 168);
  *(_QWORD *)(v8 + 168) = v15;

  v17 = -[NSSet copyWithZone:](self->_accessoryProtocols, "copyWithZone:", a3);
  v18 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v17;

  v19 = -[NSDate copyWithZone:](self->_lastConnectedDate, "copyWithZone:", a3);
  v20 = *(void **)(v8 + 176);
  *(_QWORD *)(v8 + 176) = v19;

  v21 = -[NSString copyWithZone:](self->_vehicleModelName, "copyWithZone:", a3);
  v22 = *(void **)(v8 + 184);
  *(_QWORD *)(v8 + 184) = v21;

  v23 = -[NSString copyWithZone:](self->_PPID, "copyWithZone:", a3);
  v24 = *(void **)(v8 + 192);
  *(_QWORD *)(v8 + 192) = v23;

  v25 = -[NSString copyWithZone:](self->_wallpaperIdentifier, "copyWithZone:", a3);
  v26 = *(void **)(v8 + 232);
  *(_QWORD *)(v8 + 232) = v25;

  v27 = -[NSString copyWithZone:](self->_previousWallpaperIdentifier, "copyWithZone:", a3);
  v28 = *(void **)(v8 + 240);
  *(_QWORD *)(v8 + 240) = v27;

  *(_QWORD *)(v8 + 248) = self->_appearanceModePreference;
  *(_QWORD *)(v8 + 256) = self->_mapsAppearancePreference;
  *(_QWORD *)(v8 + 264) = self->_colorFilterPreference;
  v29 = -[NSDictionary copyWithZone:](self->_colorFilterIntensityPreference, "copyWithZone:", a3);
  v30 = *(void **)(v8 + 272);
  *(_QWORD *)(v8 + 272) = v29;

  *(_QWORD *)(v8 + 280) = self->_boldTextPreference;
  *(_QWORD *)(v8 + 288) = self->_soundRecognitionPreference;
  *(_QWORD *)(v8 + 296) = self->_voiceControlPreference;
  v31 = -[NSNumber copyWithZone:](self->_disabledFeaturesPreference, "copyWithZone:", a3);
  v32 = *(void **)(v8 + 216);
  *(_QWORD *)(v8 + 216) = v31;

  *(_BYTE *)(v8 + 11) = self->_supportsBluetoothLE;
  v33 = -[NSNumber copyWithZone:](self->_supportsThemeAssets, "copyWithZone:", a3);
  v34 = *(void **)(v8 + 48);
  *(_QWORD *)(v8 + 48) = v33;

  v35 = -[NSString copyWithZone:](self->_clusterAssetiOSContentVersion, "copyWithZone:", a3);
  v36 = *(void **)(v8 + 64);
  *(_QWORD *)(v8 + 64) = v35;

  v37 = -[NSString copyWithZone:](self->_clusterAssetIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v37;

  v39 = -[NSNumber copyWithZone:](self->_clusterAssetVersion, "copyWithZone:", a3);
  v40 = *(void **)(v8 + 72);
  *(_QWORD *)(v8 + 72) = v39;

  v41 = -[NSString copyWithZone:](self->_SDKVersion, "copyWithZone:", a3);
  v42 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v41;

  v43 = -[NSURL copyWithZone:](self->_clusterAssetURL, "copyWithZone:", a3);
  v44 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = v43;

  v45 = -[NSString copyWithZone:](self->_stagedClusterAssetiOSContentVersion, "copyWithZone:", a3);
  v46 = *(void **)(v8 + 96);
  *(_QWORD *)(v8 + 96) = v45;

  v47 = -[NSNumber copyWithZone:](self->_stagedClusterAssetVersion, "copyWithZone:", a3);
  v48 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v47;

  v49 = -[NSURL copyWithZone:](self->_stagedClusterAssetURL, "copyWithZone:", a3);
  v50 = *(void **)(v8 + 112);
  *(_QWORD *)(v8 + 112) = v49;

  v51 = -[NSDictionary copyWithZone:](self->_displayThemeData, "copyWithZone:", a3);
  v52 = *(void **)(v8 + 120);
  *(_QWORD *)(v8 + 120) = v51;

  v53 = -[NSNumber copyWithZone:](self->_hasGaugeClusterScreen, "copyWithZone:", a3);
  v54 = *(void **)(v8 + 128);
  *(_QWORD *)(v8 + 128) = v53;

  v55 = -[NSNumber copyWithZone:](self->_finishedWelcome, "copyWithZone:", a3);
  v56 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v55;

  v57 = -[NSString copyWithZone:](self->_internalNotes, "copyWithZone:", a3);
  v58 = *(void **)(v8 + 200);
  *(_QWORD *)(v8 + 200) = v57;

  *(_BYTE *)(v8 + 12) = self->_siriBargeInDisabled;
  *(_BYTE *)(v8 + 13) = self->_supportsMixableAudio;
  return (id)v8;
}

+ (id)vehicleForMessagingVehicle:(id)a3
{
  id v3;
  void *v4;
  CRVehicle *v5;
  void *v6;
  CRVehicle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "certificateSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CRVehicle alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CRVehicle initWithIdentifier:certificateSerial:](v5, "initWithIdentifier:certificateSerial:", v6, v4);

    objc_msgSend(v3, "vehicleName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setVehicleName:](v7, "setVehicleName:", v8);

    objc_msgSend(v3, "bluetoothAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setBluetoothAddress:](v7, "setBluetoothAddress:", v9);

    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "accessoryProtocols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setAccessoryProtocols:](v7, "setAccessoryProtocols:", v12);

    -[CRVehicle setSupportsEnhancedIntegration:](v7, "setSupportsEnhancedIntegration:", objc_msgSend(v3, "supportsEnhancedIntegration"));
    if (objc_msgSend(v3, "transportType") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "supportsCarPlayConnectionRequest"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRVehicle setSupportsStartSessionRequest:](v7, "setSupportsStartSessionRequest:", v13);

    }
    -[CRVehicle setSupportsUSBCarPlay:](v7, "setSupportsUSBCarPlay:", objc_msgSend(v3, "supportsUSBCarPlay"));
    -[CRVehicle setSupportsWirelessCarPlay:](v7, "setSupportsWirelessCarPlay:", objc_msgSend(v3, "supportsWirelessCarPlay"));
    -[CRVehicle setSupportsBluetoothLE:](v7, "setSupportsBluetoothLE:", objc_msgSend(v3, "supportsBluetoothLE"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "supportsThemeAssets"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsThemeAssets:](v7, "setSupportsThemeAssets:", v14);

    objc_msgSend(v3, "PPID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPPID:](v7, "setPPID:", v15);

    if (CRIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRVehicle setLastConnectedDate:](v7, "setLastConnectedDate:", v16);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPaired
{
  return -[CRVehicle pairingStatus](self, "pairingStatus") == 2;
}

- (id)_pairingDebugDescription
{
  unint64_t v2;

  v2 = -[CRVehicle pairingStatus](self, "pairingStatus");
  if (v2 > 2)
    return 0;
  else
    return off_1E5428A50[v2];
}

- (BOOL)isEnhancedIntegrationEnabled
{
  return -[CRVehicle enhancedIntegrationStatus](self, "enhancedIntegrationStatus") == 2;
}

- (id)_enhancedIntegrationDebugDescription
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[CRVehicle enhancedIntegrationStatus](self, "enhancedIntegrationStatus");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("declined");
  if (v2 == 2)
    return CFSTR("accepted");
  else
    return (id)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRVehicle identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRVehicle identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v29 = (void *)MEMORY[0x1E0CB3940];
  -[CRVehicle vehicleName](self, "vehicleName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("<unnamed>");
  v33 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  v28 = v4;
  -[CRVehicle identifier](self, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CRVehicle PPID](self, "PPID");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CRVehicle _pairingDebugDescription](self, "_pairingDebugDescription");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "BOOLValue"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v26 = v7;
  }
  else
  {
    v26 = CFSTR("unset");
  }
  -[CRVehicle supportsThemeAssets](self, "supportsThemeAssets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v6;
  v36 = (void *)v5;
  if (v27)
  {
    -[CRVehicle supportsThemeAssets](self, "supportsThemeAssets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "BOOLValue"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v25 = v8;
  }
  else
  {
    v25 = CFSTR("unset");
  }
  -[CRVehicle clusterAssetIdentifier](self, "clusterAssetIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle clusterAssetiOSContentVersion](self, "clusterAssetiOSContentVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle clusterAssetVersion](self, "clusterAssetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle _enhancedIntegrationDebugDescription](self, "_enhancedIntegrationDebugDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle disabledFeaturesPreference](self, "disabledFeaturesPreference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRVehicle isSiriBargeInDisabled](self, "isSiriBargeInDisabled"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[CRVehicle supportsMixableAudio](self, "supportsMixableAudio"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CRVehicle albumArtUserPreference](self, "albumArtUserPreference"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle bluetoothAddress](self, "bluetoothAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle carplayWiFiUUID](self, "carplayWiFiUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle accessoryProtocols](self, "accessoryProtocols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle lastConnectedDate](self, "lastConnectedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle vehicleModelName](self, "vehicleModelName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ (identifier: %@, PPID: %@, pairing: %@, startSessionRequest: %@, cluster{supported: %@ id: %@ versions{ %@, %@}, enhancedIntegration: %@, disabledFeatures: %@, isSiriBargeInDisabled: %@, supportsMixableAudio: %@, albumArtUserPreference: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@)"), v28, v36, v35, v34, v26, v25, v24, v9, v10, v23, v22, v11, v12, v13, CFSTR("bluetoothAddress"), v14,
    CFSTR("carplayWiFiUUID"),
    v15,
    CFSTR("carplayProtocols"),
    v16,
    CFSTR("lastConnectionTime"),
    v17,
    CFSTR("vehicleModelName"),
    v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  if (v31)

  return v30;
}

- (void)mergeAttributesFromVehicle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v56 = a3;
  objc_msgSend(v56, "certificateSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v56, "certificateSerialNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setCertificateSerialNumber:](self, "setCertificateSerialNumber:", v5);

  }
  objc_msgSend(v56, "vehicleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v56, "vehicleName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setVehicleName:](self, "setVehicleName:", v7);

  }
  if (objc_msgSend(v56, "pairingStatus"))
    -[CRVehicle setPairingStatus:](self, "setPairingStatus:", objc_msgSend(v56, "pairingStatus"));
  if (objc_msgSend(v56, "enhancedIntegrationStatus"))
    -[CRVehicle setEnhancedIntegrationStatus:](self, "setEnhancedIntegrationStatus:", objc_msgSend(v56, "enhancedIntegrationStatus"));
  objc_msgSend(v56, "supportsStartSessionRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v56, "supportsStartSessionRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsStartSessionRequest:](self, "setSupportsStartSessionRequest:", v9);

  }
  -[CRVehicle setSupportsWirelessCarPlay:](self, "setSupportsWirelessCarPlay:", objc_msgSend(v56, "supportsWirelessCarPlay"));
  -[CRVehicle setSupportsUSBCarPlay:](self, "setSupportsUSBCarPlay:", objc_msgSend(v56, "supportsUSBCarPlay"));
  objc_msgSend(v56, "bluetoothAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v56, "bluetoothAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setBluetoothAddress:](self, "setBluetoothAddress:", v11);

  }
  objc_msgSend(v56, "carplayWiFiUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v56, "carplayWiFiUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setCarplayWiFiUUID:](self, "setCarplayWiFiUUID:", v13);

  }
  objc_msgSend(v56, "accessoryProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v56, "accessoryProtocols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setAccessoryProtocols:](self, "setAccessoryProtocols:", v15);

  }
  objc_msgSend(v56, "lastConnectedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v56, "lastConnectedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setLastConnectedDate:](self, "setLastConnectedDate:", v17);

  }
  objc_msgSend(v56, "vehicleModelName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v56, "vehicleModelName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setVehicleModelName:](self, "setVehicleModelName:", v19);

  }
  objc_msgSend(v56, "PPID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v56, "PPID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPPID:](self, "setPPID:", v21);

  }
  -[CRVehicle setAlbumArtUserPreference:](self, "setAlbumArtUserPreference:", objc_msgSend(v56, "albumArtUserPreference"));
  objc_msgSend(v56, "wallpaperIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v56, "wallpaperIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setWallpaperIdentifier:](self, "setWallpaperIdentifier:", v23);

  }
  objc_msgSend(v56, "previousWallpaperIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v56, "previousWallpaperIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setPreviousWallpaperIdentifier:](self, "setPreviousWallpaperIdentifier:", v25);

  }
  if (objc_msgSend(v56, "appearanceModePreference") != -1)
    -[CRVehicle setAppearanceModePreference:](self, "setAppearanceModePreference:", objc_msgSend(v56, "appearanceModePreference"));
  if (objc_msgSend(v56, "mapsAppearancePreference") != -1)
    -[CRVehicle setMapsAppearancePreference:](self, "setMapsAppearancePreference:", objc_msgSend(v56, "mapsAppearancePreference"));
  if (objc_msgSend(v56, "colorFilterPreference"))
    -[CRVehicle setColorFilterPreference:](self, "setColorFilterPreference:", objc_msgSend(v56, "colorFilterPreference"));
  objc_msgSend(v56, "colorFilterIntensityPreference");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v56, "colorFilterIntensityPreference");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setColorFilterIntensityPreference:](self, "setColorFilterIntensityPreference:", v27);

  }
  if (objc_msgSend(v56, "boldTextPreference"))
    -[CRVehicle setBoldTextPreference:](self, "setBoldTextPreference:", objc_msgSend(v56, "boldTextPreference"));
  -[CRVehicle setSoundRecognitionPreference:](self, "setSoundRecognitionPreference:", objc_msgSend(v56, "soundRecognitionPreference"));
  -[CRVehicle setVoiceControlPreference:](self, "setVoiceControlPreference:", objc_msgSend(v56, "voiceControlPreference"));
  objc_msgSend(v56, "disabledFeaturesPreference");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v56, "disabledFeaturesPreference");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setDisabledFeaturesPreference:](self, "setDisabledFeaturesPreference:", v29);

  }
  -[CRVehicle setSupportsBluetoothLE:](self, "setSupportsBluetoothLE:", objc_msgSend(v56, "supportsBluetoothLE"));
  objc_msgSend(v56, "supportsThemeAssets");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v56, "supportsThemeAssets");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSupportsThemeAssets:](self, "setSupportsThemeAssets:", v31);

  }
  objc_msgSend(v56, "clusterAssetIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v56, "clusterAssetIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetIdentifier:](self, "setClusterAssetIdentifier:", v33);

  }
  objc_msgSend(v56, "clusterAssetiOSContentVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v56, "clusterAssetiOSContentVersion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetiOSContentVersion:](self, "setClusterAssetiOSContentVersion:", v35);

  }
  objc_msgSend(v56, "clusterAssetVersion");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v56, "clusterAssetVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetVersion:](self, "setClusterAssetVersion:", v37);

  }
  objc_msgSend(v56, "SDKVersion");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v56, "SDKVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setSDKVersion:](self, "setSDKVersion:", v39);

  }
  objc_msgSend(v56, "clusterAssetURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v56, "clusterAssetURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setClusterAssetURL:](self, "setClusterAssetURL:", v41);

  }
  objc_msgSend(v56, "stagedClusterAssetiOSContentVersion");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v56, "stagedClusterAssetiOSContentVersion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetiOSContentVersion:](self, "setStagedClusterAssetiOSContentVersion:", v43);

  }
  objc_msgSend(v56, "stagedClusterAssetVersion");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v56, "stagedClusterAssetVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetVersion:](self, "setStagedClusterAssetVersion:", v45);

  }
  objc_msgSend(v56, "stagedClusterAssetURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v56, "stagedClusterAssetURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setStagedClusterAssetURL:](self, "setStagedClusterAssetURL:", v47);

  }
  objc_msgSend(v56, "displayThemeData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v56, "displayThemeData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setDisplayThemeData:](self, "setDisplayThemeData:", v49);

  }
  objc_msgSend(v56, "hasGaugeClusterScreen");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v56, "hasGaugeClusterScreen");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setHasGaugeClusterScreen:](self, "setHasGaugeClusterScreen:", v51);

  }
  objc_msgSend(v56, "finishedWelcome");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v56, "finishedWelcome");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setFinishedWelcome:](self, "setFinishedWelcome:", v53);

  }
  -[CRVehicle setSiriBargeInDisabled:](self, "setSiriBargeInDisabled:", objc_msgSend(v56, "isSiriBargeInDisabled"));
  -[CRVehicle setSupportsMixableAudio:](self, "setSupportsMixableAudio:", objc_msgSend(v56, "supportsMixableAudio"));
  objc_msgSend(v56, "internalNotes");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v56, "internalNotes");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVehicle setInternalNotes:](self, "setInternalNotes:", v55);

  }
}

- (id)displayName
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  -[CRVehicle vehicleName](self, "vehicleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[CRVehicle bluetoothAddress](self, "bluetoothAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[CRVehicle bluetoothAddress](self, "bluetoothAddress");
      v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E542A520;
    }

    v3 = (void *)v6;
  }
  return v3;
}

- (BOOL)requiresBonjour
{
  void *v3;
  void *v4;
  int v5;

  -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CRVehicle supportsStartSessionRequest](self, "supportsStartSessionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)assetDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AlwaysUpdateAsset"), CRPreferencesNotMigratedDomain);
  v17 = (id)MEMORY[0x1E0CB3940];
  -[CRVehicle clusterAssetIdentifier](self, "clusterAssetIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle clusterAssetiOSContentVersion](self, "clusterAssetiOSContentVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle clusterAssetVersion](self, "clusterAssetVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle SDKVersion](self, "SDKVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle clusterAssetURL](self, "clusterAssetURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle stagedClusterAssetiOSContentVersion](self, "stagedClusterAssetiOSContentVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle stagedClusterAssetVersion](self, "stagedClusterAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle stagedClusterAssetURL](self, "stagedClusterAssetURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CRNullableDescriptionForString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = objc_msgSend(v3, "BOOLValue");
    v12 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
  }
  else
  {
    v12 = CFSTR("unset");
  }
  objc_msgSend(v17, "stringWithFormat:", CFSTR("Asset Identifier: %@\niOS Version: %@\nAccessory Version: %@\nSDK Version: %@\nAsset URL: %@\nStaged Asset iOS Version: %@\nStaged Asset Accessory Version: %@\nStaged Asset URL: %@\nAlways Update Asset preference: %@"), v23, v21, v20, v4, v5, v6, v7, v10, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)wallpaperDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CRVehicle wallpaperIdentifier](self, "wallpaperIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicle previousWallpaperIdentifier](self, "previousWallpaperIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Wallpaper identifier: %@\nPrevious wallpaper identifier: %@"), v4, v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[CRVehicle displayThemeData](self, "displayThemeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CRVehicle displayThemeData](self, "displayThemeData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v6 = CFSTR("wallpaper identifier: ");
      do
      {
        v12 = 0;
        v13 = v6;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          -[CRVehicle displayThemeData](self, "displayThemeData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR("\nDisplay: %@\n\t%@"), v14, v16);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v6;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    else
    {
      v6 = CFSTR("wallpaper identifier: ");
    }

  }
  return (NSString *)v6;
}

- (CRSystemWallpaperData)systemWallpaperData
{
  void *v3;
  CRSystemWallpaperData *v4;
  void *v5;
  CRSystemWallpaperData *v6;

  -[CRVehicle wallpaperIdentifier](self, "wallpaperIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [CRSystemWallpaperData alloc];
    -[CRVehicle wallpaperIdentifier](self, "wallpaperIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRSystemWallpaperData initWithIdentifier:](v4, "initWithIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setSystemWallpaperData:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRVehicle setWallpaperIdentifier:](self, "setWallpaperIdentifier:", v4);

}

- (CRSystemWallpaperData)previousSystemWallpaperData
{
  void *v3;
  CRSystemWallpaperData *v4;
  void *v5;
  CRSystemWallpaperData *v6;

  -[CRVehicle previousWallpaperIdentifier](self, "previousWallpaperIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [CRSystemWallpaperData alloc];
    -[CRVehicle previousWallpaperIdentifier](self, "previousWallpaperIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRSystemWallpaperData initWithIdentifier:](v4, "initWithIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setPreviousSystemWallpaperData:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRVehicle setPreviousWallpaperIdentifier:](self, "setPreviousWallpaperIdentifier:", v4);

}

- (id)wallpaperForDisplayWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  -[CRVehicle displayThemeData](self, "displayThemeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!v4
      || (-[CRVehicle displayThemeData](self, "displayThemeData"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "objectForKey:", v4),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      CarGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CRVehicle wallpaperForDisplayWithID:].cold.1((uint64_t)v4, v8);

      v7 = 0;
    }
    objc_msgSend(v7, "currentWallpaper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CRVehicle systemWallpaperData](self, "systemWallpaperData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)setWallpaper:(id)a3 forDisplayWithID:(id)a4 requiresDarkAppearance:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CRVehicle displayThemeData](self, "displayThemeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v9)
    {
      -[CRVehicle displayThemeData](self, "displayThemeData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "themeDataWithCurrentWallpaper:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[CRVehicle displayThemeData](self, "displayThemeData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v15, "setObject:forKey:", v13, v9);
        -[CRVehicle setDisplayThemeData:](self, "setDisplayThemeData:", v15);

        if (!v5)
          goto LABEL_11;
        goto LABEL_8;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CRVehicle systemWallpaperData](self, "systemWallpaperData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRVehicle setPreviousSystemWallpaperData:](self, "setPreviousSystemWallpaperData:", v16);

      -[CRVehicle setSystemWallpaperData:](self, "setSystemWallpaperData:", v8);
      if (!v5)
      {
LABEL_11:
        v19 = 1;
        goto LABEL_15;
      }
LABEL_8:
      CarGeneralLogging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v18;
        _os_log_impl(&dword_1A83A2000, v17, OS_LOG_TYPE_INFO, "Selected #wallpaper %{public}@ doesn't support dynamic appearance. Locking Appearance to Always Dark", (uint8_t *)&v22, 0xCu);

      }
      -[CRVehicle setAppearanceModePreference:](self, "setAppearanceModePreference:", 2);
      goto LABEL_11;
    }
  }
  CarGeneralLogging();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    -[CRVehicle setWallpaper:forDisplayWithID:requiresDarkAppearance:].cold.1((uint64_t)v9, (uint64_t)v8, v20);

  v19 = 0;
LABEL_15:

  return v19;
}

- (NSString)_axColorFiltersAnalyticsString
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  -[CRVehicle colorFilterIntensityPreference](self, "colorFilterIntensityPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRVehicle colorFilterPreference](self, "colorFilterPreference");
  v5 = CFSTR("Gray");
  v6 = CFSTR("CARColorFilterIntensityGrayscaleKey");
  v7 = CFSTR("Off");
  switch(v4)
  {
    case 1:
      break;
    case 2:
      goto LABEL_5;
    case 3:
      v5 = CFSTR("RedGreen");
      v6 = CFSTR("CARColorFilterIntensityRedGreenKey");
      goto LABEL_5;
    case 4:
      v5 = CFSTR("GreenRed");
      v6 = CFSTR("CARColorFilterIntensityGreenRedKey");
      goto LABEL_5;
    case 5:
      v5 = CFSTR("BlueYellow");
      v6 = CFSTR("CARColorFilterIntensityBlueYellowKey");
LABEL_5:
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRVehicle _axColorFiltersIntensityStringForNumber:](self, "_axColorFiltersIntensityStringForNumber:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v5, v9);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_7:
      v7 = CFSTR("Undefined");
      break;
  }

  return (NSString *)v7;
}

- (id)_axColorFiltersIntensityStringForNumber:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToNumber:", &unk_1E543F640) & 1) != 0)
  {
    v4 = CFSTR("Low");
  }
  else if ((objc_msgSend(v3, "isEqualToNumber:", &unk_1E543F658) & 1) != 0)
  {
    v4 = CFSTR("Medium");
  }
  else if (objc_msgSend(v3, "isEqualToNumber:", &unk_1E543F670))
  {
    v4 = CFSTR("High");
  }
  else
  {
    v4 = CFSTR("Undefined");
  }

  return (id)v4;
}

- (NSString)_axSoundRecognitionAnalyticsString
{
  void *v3;
  char v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRVehicle soundRecognitionPreference](self, "soundRecognitionPreference");
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Enabled"));
    if ((v4 & 2) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("CarHorns"));
    if ((v4 & 4) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("Siren"));
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Off");
  }

  return (NSString *)v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleName, a3);
}

- (NSSet)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (void)setAccessoryProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryProtocols, a3);
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (void)setSupportsEnhancedIntegration:(BOOL)a3
{
  self->_supportsEnhancedIntegration = a3;
}

- (unint64_t)enhancedIntegrationStatus
{
  return self->_enhancedIntegrationStatus;
}

- (void)setEnhancedIntegrationStatus:(unint64_t)a3
{
  self->_enhancedIntegrationStatus = a3;
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (void)setSupportsUSBCarPlay:(BOOL)a3
{
  self->_supportsUSBCarPlay = a3;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (void)setSupportsWirelessCarPlay:(BOOL)a3
{
  self->_supportsWirelessCarPlay = a3;
}

- (NSNumber)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void)setSupportsThemeAssets:(id)a3
{
  objc_storeStrong((id *)&self->_supportsThemeAssets, a3);
}

- (NSString)clusterAssetIdentifier
{
  return self->_clusterAssetIdentifier;
}

- (void)setClusterAssetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clusterAssetiOSContentVersion
{
  return self->_clusterAssetiOSContentVersion;
}

- (void)setClusterAssetiOSContentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAssetiOSContentVersion, a3);
}

- (NSNumber)clusterAssetVersion
{
  return self->_clusterAssetVersion;
}

- (void)setClusterAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAssetVersion, a3);
}

- (NSString)SDKVersion
{
  return self->_SDKVersion;
}

- (void)setSDKVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)clusterAssetURL
{
  return self->_clusterAssetURL;
}

- (void)setClusterAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAssetURL, a3);
}

- (NSString)stagedClusterAssetiOSContentVersion
{
  return self->_stagedClusterAssetiOSContentVersion;
}

- (void)setStagedClusterAssetiOSContentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedClusterAssetiOSContentVersion, a3);
}

- (NSNumber)stagedClusterAssetVersion
{
  return self->_stagedClusterAssetVersion;
}

- (void)setStagedClusterAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedClusterAssetVersion, a3);
}

- (NSURL)stagedClusterAssetURL
{
  return self->_stagedClusterAssetURL;
}

- (void)setStagedClusterAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_stagedClusterAssetURL, a3);
}

- (NSDictionary)displayThemeData
{
  return self->_displayThemeData;
}

- (void)setDisplayThemeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)hasGaugeClusterScreen
{
  return self->_hasGaugeClusterScreen;
}

- (void)setHasGaugeClusterScreen:(id)a3
{
  objc_storeStrong((id *)&self->_hasGaugeClusterScreen, a3);
}

- (NSNumber)finishedWelcome
{
  return self->_finishedWelcome;
}

- (void)setFinishedWelcome:(id)a3
{
  objc_storeStrong((id *)&self->_finishedWelcome, a3);
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (void)setCertificateSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_certificateSerialNumber, a3);
}

- (unint64_t)pairingStatus
{
  return self->_pairingStatus;
}

- (void)setPairingStatus:(unint64_t)a3
{
  self->_pairingStatus = a3;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (NSString)carplayWiFiUUID
{
  return self->_carplayWiFiUUID;
}

- (void)setCarplayWiFiUUID:(id)a3
{
  objc_storeStrong((id *)&self->_carplayWiFiUUID, a3);
}

- (NSDate)lastConnectedDate
{
  return self->_lastConnectedDate;
}

- (void)setLastConnectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectedDate, a3);
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (void)setVehicleModelName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleModelName, a3);
}

- (NSString)PPID
{
  return self->_PPID;
}

- (void)setPPID:(id)a3
{
  objc_storeStrong((id *)&self->_PPID, a3);
}

- (NSString)internalNotes
{
  return self->_internalNotes;
}

- (void)setInternalNotes:(id)a3
{
  objc_storeStrong((id *)&self->_internalNotes, a3);
}

- (NSNumber)supportsStartSessionRequest
{
  return self->_supportsStartSessionRequest;
}

- (void)setSupportsStartSessionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_supportsStartSessionRequest, a3);
}

- (NSNumber)disabledFeaturesPreference
{
  return self->_disabledFeaturesPreference;
}

- (void)setDisabledFeaturesPreference:(id)a3
{
  objc_storeStrong((id *)&self->_disabledFeaturesPreference, a3);
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void)setSupportsBluetoothLE:(BOOL)a3
{
  self->_supportsBluetoothLE = a3;
}

- (int64_t)albumArtUserPreference
{
  return self->_albumArtUserPreference;
}

- (void)setAlbumArtUserPreference:(int64_t)a3
{
  self->_albumArtUserPreference = a3;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (void)setWallpaperIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperIdentifier, a3);
}

- (NSString)previousWallpaperIdentifier
{
  return self->_previousWallpaperIdentifier;
}

- (void)setPreviousWallpaperIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousWallpaperIdentifier, a3);
}

- (int64_t)appearanceModePreference
{
  return self->_appearanceModePreference;
}

- (void)setAppearanceModePreference:(int64_t)a3
{
  self->_appearanceModePreference = a3;
}

- (int64_t)mapsAppearancePreference
{
  return self->_mapsAppearancePreference;
}

- (void)setMapsAppearancePreference:(int64_t)a3
{
  self->_mapsAppearancePreference = a3;
}

- (int64_t)colorFilterPreference
{
  return self->_colorFilterPreference;
}

- (void)setColorFilterPreference:(int64_t)a3
{
  self->_colorFilterPreference = a3;
}

- (NSDictionary)colorFilterIntensityPreference
{
  return self->_colorFilterIntensityPreference;
}

- (void)setColorFilterIntensityPreference:(id)a3
{
  objc_storeStrong((id *)&self->_colorFilterIntensityPreference, a3);
}

- (int64_t)boldTextPreference
{
  return self->_boldTextPreference;
}

- (void)setBoldTextPreference:(int64_t)a3
{
  self->_boldTextPreference = a3;
}

- (unint64_t)soundRecognitionPreference
{
  return self->_soundRecognitionPreference;
}

- (void)setSoundRecognitionPreference:(unint64_t)a3
{
  self->_soundRecognitionPreference = a3;
}

- (int64_t)voiceControlPreference
{
  return self->_voiceControlPreference;
}

- (void)setVoiceControlPreference:(int64_t)a3
{
  self->_voiceControlPreference = a3;
}

- (BOOL)isSiriBargeInDisabled
{
  return self->_siriBargeInDisabled;
}

- (void)setSiriBargeInDisabled:(BOOL)a3
{
  self->_siriBargeInDisabled = a3;
}

- (BOOL)supportsMixableAudio
{
  return self->_supportsMixableAudio;
}

- (void)setSupportsMixableAudio:(BOOL)a3
{
  self->_supportsMixableAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFilterIntensityPreference, 0);
  objc_storeStrong((id *)&self->_previousWallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_disabledFeaturesPreference, 0);
  objc_storeStrong((id *)&self->_supportsStartSessionRequest, 0);
  objc_storeStrong((id *)&self->_internalNotes, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_lastConnectedDate, 0);
  objc_storeStrong((id *)&self->_carplayWiFiUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_finishedWelcome, 0);
  objc_storeStrong((id *)&self->_hasGaugeClusterScreen, 0);
  objc_storeStrong((id *)&self->_displayThemeData, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetURL, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetVersion, 0);
  objc_storeStrong((id *)&self->_stagedClusterAssetiOSContentVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetURL, 0);
  objc_storeStrong((id *)&self->_SDKVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetiOSContentVersion, 0);
  objc_storeStrong((id *)&self->_clusterAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_supportsThemeAssets, 0);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)wallpaperForDisplayWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "Failed to get wallpaper, no display with id: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setWallpaper:(uint64_t)a1 forDisplayWithID:(uint64_t)a2 requiresDarkAppearance:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1A83A2000, log, OS_LOG_TYPE_FAULT, "Failed to set wallpaper on display %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
