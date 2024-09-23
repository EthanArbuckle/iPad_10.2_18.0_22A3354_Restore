@implementation CCUISensorAttributionEntity

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSystemService");
}

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executableDisplayName");
}

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
}

- (NSString)displayNameForCompactView
{
  void *v3;
  void *v4;

  if (-[NSString isEqualToString:](self->_bundleIdentifier, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("CCUISensorActivityDataProvider")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_SAFARI_WEBSITES"), &stru_1E8E21150, CFSTR("ControlCenterUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CCUISensorAttributionEntity executableDisplayName](self, "executableDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDisplayName, 0);
}

- (BOOL)isKeyboardCameraEntity
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.VisionKit.KeyboardCamera"));

  return v3;
}

- (BOOL)isSetupApp
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  return v3;
}

- (BOOL)isSiriAndDictationEntity
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.AssistantServices"));

  return v3;
}

- (BOOL)isWalletSpecialEntity
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PassKitCore"));

  return v3;
}

- (BOOL)isGenericLocationSystemServiceEntity
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.locationSystemServices"));

  return v3;
}

- (BOOL)isContinuityCaptureExtension
{
  void *v2;
  char v3;

  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CCUISensorAttributionEntity *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CCUISensorAttributionEntity *v8;
  id v9;
  void *v10;
  CCUISensorAttributionEntity *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  char v15;
  _QWORD v17[4];
  CCUISensorAttributionEntity *v18;
  _QWORD v19[4];
  CCUISensorAttributionEntity *v20;
  _QWORD v21[4];
  CCUISensorAttributionEntity *v22;

  v4 = (CCUISensorAttributionEntity *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke;
    v21[3] = &unk_1E8E20930;
    v8 = v4;
    v22 = v8;
    v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v21);

    -[CCUISensorAttributionEntity executableDisplayName](self, "executableDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke_2;
    v19[3] = &unk_1E8E20930;
    v11 = v8;
    v20 = v11;
    v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v19);

    v13 = -[CCUISensorAttributionEntity isSystemService](self, "isSystemService");
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke_3;
    v17[3] = &unk_1E8E20958;
    v18 = v11;
    v14 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v17);
    v15 = objc_msgSend(v5, "isEqual");

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[CCUISensorAttributionEntity executableDisplayName](self, "executableDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorAttributionEntity isSystemService](self, "isSystemService"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)executableDisplayName
{
  return self->_executableDisplayName;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

+ (id)attributionEntityFromSensorActivityData:(id)a3
{
  id v3;
  CCUISensorAttributionEntity *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "sensorType") == 2 && objc_msgSend(v3, "isSystemService"))
  {
    objc_msgSend((id)objc_opt_class(), "genericLocationSystemServiceEntity");
    v4 = (CCUISensorAttributionEntity *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(CCUISensorAttributionEntity);
    objc_msgSend(v3, "executableDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionEntity setExecutableDisplayName:](v4, "setExecutableDisplayName:", v5);

    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionEntity setBundleIdentifier:](v4, "setBundleIdentifier:", v6);

    -[CCUISensorAttributionEntity setIsSystemService:](v4, "setIsSystemService:", objc_msgSend(v3, "isSystemService"));
  }

  return v4;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (void)setExecutableDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CCUISensorAttributionEntity bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionEntity executableDisplayName](self, "executableDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("bundle:%@ executableDisplayName:%@ isSystemService:%d"), v4, v5, -[CCUISensorAttributionEntity isSystemService](self, "isSystemService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)genericLocationSystemServiceEntity
{
  void *v2;
  void *v3;
  CCUISensorAttributionEntity *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("CCUISensorActivityDataProvider")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONTROL_CENTER_SENSOR_LOCATION_SYSTEM_SERVICES"), &stru_1E8E21150, CFSTR("ControlCenterUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(CCUISensorAttributionEntity);
  -[CCUISensorAttributionEntity setExecutableDisplayName:](v4, "setExecutableDisplayName:", v3);
  -[CCUISensorAttributionEntity setBundleIdentifier:](v4, "setBundleIdentifier:", CFSTR("com.apple.locationSystemServices"));
  -[CCUISensorAttributionEntity setIsSystemService:](v4, "setIsSystemService:", 1);

  return v4;
}

@end
