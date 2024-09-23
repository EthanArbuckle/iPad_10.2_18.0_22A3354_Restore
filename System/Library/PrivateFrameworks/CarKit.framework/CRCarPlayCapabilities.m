@implementation CRCarPlayCapabilities

- (CRCarPlayCapabilities)init
{
  CRCarPlayCapabilities *v2;
  uint64_t v3;
  NSString *version;
  uint64_t v5;
  NSValue *viewAreaInsets;
  uint64_t v7;
  NSValue *dashboardRoundedCorners;
  uint64_t v9;
  NSDictionary *userInfo;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRCarPlayCapabilities;
  v2 = -[CRCarPlayCapabilities init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v3 = objc_claimAutoreleasedReturnValue();
    version = v2->_version;
    v2->_version = (NSString *)v3;

    *(_OWORD *)&v2->_disabledFeature = xmmword_1A83E7C40;
    v2->_userInterfaceStyle = 2;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithEdgeInsets:", *MEMORY[0x1E0CB2990], *(double *)(MEMORY[0x1E0CB2990] + 8), *(double *)(MEMORY[0x1E0CB2990] + 16), *(double *)(MEMORY[0x1E0CB2990] + 24));
    v5 = objc_claimAutoreleasedReturnValue();
    viewAreaInsets = v2->_viewAreaInsets;
    v2->_viewAreaInsets = (NSValue *)v5;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithEdgeInsets:", 13.0, 0.0, 0.0, 0.0);
    v7 = objc_claimAutoreleasedReturnValue();
    dashboardRoundedCorners = v2->_dashboardRoundedCorners;
    v2->_dashboardRoundedCorners = (NSValue *)v7;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    userInfo = v2->_userInfo;
    v2->_userInfo = (NSDictionary *)v9;

  }
  return v2;
}

- (CRCarPlayCapabilities)initWithVersion:(id)a3
{
  id v4;
  CRCarPlayCapabilities *v5;
  uint64_t v6;
  NSString *version;

  v4 = a3;
  v5 = -[CRCarPlayCapabilities init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    version = v5->_version;
    v5->_version = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  int v3;
  void *v4;
  uint64_t v5;
  NSString *version;
  void *v7;
  int64_t nowPlayingAlbumArtMode;
  NSValue *viewAreaInsets;
  NSValue *dashboardRoundedCorners;
  int64_t userInterfaceStyle;
  NSDictionary *userInfo;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  void *v17;
  NSString *v19;
  void *v20;
  __int128 v21;

  v3 = CRIsTestContext();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  version = self->_version;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_disabledFeature);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = version;
    v20 = v4;
    nowPlayingAlbumArtMode = self->_nowPlayingAlbumArtMode;
    viewAreaInsets = self->_viewAreaInsets;
    dashboardRoundedCorners = self->_dashboardRoundedCorners;
    userInterfaceStyle = self->_userInterfaceStyle;
    userInfo = self->_userInfo;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_persisted);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p> version = %@, disabledFeature = %@, nowPlayingAlbumArtMode = %ld, userInterfaceStyle = %ld, viewAreaInset = %@, dashboardRoundedCorners = %@, userInfo = %@, persisted = %@"), v5, self, v19, v7, nowPlayingAlbumArtMode, userInterfaceStyle, viewAreaInsets, dashboardRoundedCorners, userInfo, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CARSessionConfiguration descriptionForCapability:](CARSessionConfiguration, "descriptionForCapability:", self->_nowPlayingAlbumArtMode);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", self->_userInterfaceStyle);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_OWORD *)&self->_viewAreaInsets;
    v16 = self->_userInfo;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_persisted);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> version = %@, disabledFeature = %@, nowPlayingAlbumArtMode = %@, userInterfaceStyle = %@, viewAreaInset = %@, dashboardRoundedCorners = %@, userInfo = %@, persisted = %@"), v5, self, version, v7, v13, v15, v21, v16, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)informativeText
{
  void *v3;
  void *v4;
  NSString *version;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *userInfo;
  void *v10;
  void *v11;
  __int128 v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "capabilitiesIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  version = self->_version;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_disabledFeature);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CARSessionConfiguration descriptionForCapability:](CARSessionConfiguration, "descriptionForCapability:", self->_nowPlayingAlbumArtMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CARSessionConfiguration descriptionForUserInterfaceStyle:](CARSessionConfiguration, "descriptionForUserInterfaceStyle:", self->_userInterfaceStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_viewAreaInsets;
  userInfo = self->_userInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_persisted);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("vehicle identifier = %@\nplist version = %@\ndisabledFeature mask = %@\nnowPlayingAlbumArtMode = %@\nuserInterfaceStyle = %@\nviewAreaInset = %@\ndashboardRoundedCorners = %@\nuserInfo = %@, persisted = %@"), v4, version, v6, v7, v8, v13, userInfo, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSString)capabilitiesIdentifier
{
  id v2;
  __CFString *v3;
  NSObject *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (sCRCarPlayCapabilitiesIdentifier)
    v3 = (__CFString *)objc_msgSend((id)sCRCarPlayCapabilitiesIdentifier, "copy");
  else
    v3 = CFSTR("CarCapabilitiesDefaultIdentifier");
  objc_sync_exit(v2);

  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CRCarPlayCapabilities capabilitiesIdentifier].cold.1();

  return (NSString *)v3;
}

+ (void)setCapabilitiesIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)sCRCarPlayCapabilitiesIdentifier;
  if (v4)
  {
    if ((objc_msgSend((id)sCRCarPlayCapabilitiesIdentifier, "isEqualToString:", v4) & 1) == 0)
    {
      CarGeneralLogging();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[CRCarPlayCapabilities setCapabilitiesIdentifier:].cold.1();

      v8 = objc_msgSend(v4, "copy");
      v9 = (void *)sCRCarPlayCapabilitiesIdentifier;
      sCRCarPlayCapabilitiesIdentifier = v8;

    }
  }
  else
  {
    sCRCarPlayCapabilitiesIdentifier = (uint64_t)CFSTR("CarCapabilitiesDefaultIdentifier");

  }
  objc_sync_exit(v5);

}

+ (void)setCapabilitiesVersion:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *value;

  if (a3)
  {
    v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
    v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v6 = a3;
    v7 = (void *)CFPreferencesCopyValue(CFSTR("CarCapabilities"), v3, v4, v5);
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    value = v10;

    objc_msgSend(value, "setObject:forKey:", v6, CFSTR("CarCapabilitiesContentVersion"));
    CFPreferencesSetValue(CFSTR("CarCapabilities"), value, v3, v4, v5);
    CFPreferencesSynchronize(v3, v4, v5);

  }
}

+ (NSString)capabilitiesVersion
{
  if (capabilitiesVersion_onceToken != -1)
    dispatch_once(&capabilitiesVersion_onceToken, &__block_literal_global_24);
  return (NSString *)(id)capabilitiesVersion_sCapabilitiesVersion;
}

void __44__CRCarPlayCapabilities_capabilitiesVersion__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v1 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v2 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v7 = (id)CFPreferencesCopyValue(CFSTR("CarCapabilities"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  objc_msgSend(v7, "objectForKey:", CFSTR("CarCapabilitiesContentVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)capabilitiesVersion_sCapabilitiesVersion;
  capabilitiesVersion_sCapabilitiesVersion = (uint64_t)v5;

  CFPreferencesSynchronize(v0, v1, v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRCarPlayCapabilities)initWithCoder:(id)a3
{
  id v4;
  CRCarPlayCapabilities *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRCarPlayCapabilities;
  v5 = -[CRCarPlayCapabilities init](&v11, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CRCapabilitiesVersionKey")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CRCapabilitiesVersionKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCarPlayCapabilities setVersion:](v5, "setVersion:", v6);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CapabilitiesViewAreaInsetKey")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CapabilitiesViewAreaInsetKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCarPlayCapabilities setViewAreaInsets:](v5, "setViewAreaInsets:", v7);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CapabilitiesDashboardRoundedCornersKey")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CapabilitiesDashboardRoundedCornersKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCarPlayCapabilities setDashboardRoundedCorners:](v5, "setDashboardRoundedCorners:", v8);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CapabilitiesNowPlayingAlbumArtKey")))
      -[CRCarPlayCapabilities setNowPlayingAlbumArtMode:](v5, "setNowPlayingAlbumArtMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CapabilitiesNowPlayingAlbumArtKey")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CRCapabilitiesDisabledFeatureKey")))
      -[CRCarPlayCapabilities setDisabledFeature:](v5, "setDisabledFeature:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRCapabilitiesDisabledFeatureKey")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CRCapabilitiesUserInterfaceStyleKey")))
      -[CRCarPlayCapabilities setUserInterfaceStyle:](v5, "setUserInterfaceStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRCapabilitiesUserInterfaceStyleKey")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CRCapabilitiesUserInfoKey")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("CRCapabilitiesUserInfoKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRCarPlayCapabilities setUserInfo:](v5, "setUserInfo:", v9);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *version;
  NSValue *viewAreaInsets;
  NSValue *dashboardRoundedCorners;
  id v8;

  v4 = a3;
  version = self->_version;
  v8 = v4;
  if (version)
  {
    objc_msgSend(v4, "encodeObject:forKey:", version, CFSTR("CRCapabilitiesVersionKey"));
    v4 = v8;
  }
  viewAreaInsets = self->_viewAreaInsets;
  if (viewAreaInsets)
  {
    objc_msgSend(v8, "encodeObject:forKey:", viewAreaInsets, CFSTR("CapabilitiesViewAreaInsetKey"));
    v4 = v8;
  }
  dashboardRoundedCorners = self->_dashboardRoundedCorners;
  if (dashboardRoundedCorners)
  {
    objc_msgSend(v8, "encodeObject:forKey:", dashboardRoundedCorners, CFSTR("CapabilitiesDashboardRoundedCornersKey"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_nowPlayingAlbumArtMode, CFSTR("CapabilitiesNowPlayingAlbumArtKey"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_disabledFeature, CFSTR("CRCapabilitiesDisabledFeatureKey"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_userInterfaceStyle, CFSTR("CRCapabilitiesUserInterfaceStyleKey"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_userInfo, CFSTR("CRCapabilitiesUserInfoKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 64), self->_version);
    *(_QWORD *)(v5 + 16) = self->_disabledFeature;
    *(_QWORD *)(v5 + 24) = self->_nowPlayingAlbumArtMode;
    *(_QWORD *)(v5 + 48) = self->_userInterfaceStyle;
    objc_storeStrong((id *)(v5 + 32), self->_viewAreaInsets);
    objc_storeStrong((id *)(v5 + 40), self->_dashboardRoundedCorners);
    objc_storeStrong((id *)(v5 + 56), self->_userInfo);
    *(_BYTE *)(v5 + 8) = self->_persisted;
  }
  return (id)v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  int64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _BOOL4 v39;
  int64_t v40;
  void *v41;
  void *v42;
  char v43;
  NSEdgeInsets v45;
  NSEdgeInsets v46;
  NSEdgeInsets v47;
  NSEdgeInsets v48;

  v4 = a3;
  -[CRCarPlayCapabilities version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_8;
  v8 = -[CRCarPlayCapabilities disabledFeature](self, "disabledFeature");
  if (v8 != objc_msgSend(v4, "disabledFeature"))
    goto LABEL_8;
  v9 = -[CRCarPlayCapabilities nowPlayingAlbumArtMode](self, "nowPlayingAlbumArtMode");
  if (v9 != objc_msgSend(v4, "nowPlayingAlbumArtMode"))
    goto LABEL_8;
  -[CRCarPlayCapabilities viewAreaInsets](self, "viewAreaInsets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "edgeInsetsValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v4, "viewAreaInsets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "edgeInsetsValue");
  v47.top = v20;
  v47.left = v21;
  v47.bottom = v22;
  v47.right = v23;
  v45.top = v12;
  v45.left = v14;
  v45.bottom = v16;
  v45.right = v18;
  v24 = NSEdgeInsetsEqual(v45, v47);

  if (!v24)
    goto LABEL_8;
  -[CRCarPlayCapabilities dashboardRoundedCorners](self, "dashboardRoundedCorners");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "edgeInsetsValue");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v4, "dashboardRoundedCorners");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "edgeInsetsValue");
  v48.top = v35;
  v48.left = v36;
  v48.bottom = v37;
  v48.right = v38;
  v46.top = v27;
  v46.left = v29;
  v46.bottom = v31;
  v46.right = v33;
  v39 = NSEdgeInsetsEqual(v46, v48);

  if (!v39)
    goto LABEL_8;
  v40 = -[CRCarPlayCapabilities userInterfaceStyle](self, "userInterfaceStyle");
  if (v40 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    -[CRCarPlayCapabilities userInfo](self, "userInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToDictionary:", v42);

  }
  else
  {
LABEL_8:
    v43 = 0;
  }

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  CRCarPlayCapabilities *v4;
  BOOL v5;

  v4 = (CRCarPlayCapabilities *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CRCarPlayCapabilities isEqualToCapabilities:](self, "isEqualToCapabilities:", v4);
  }

  return v5;
}

- (CRCarPlayCapabilities)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  CRCarPlayCapabilities *v5;
  uint64_t v6;
  NSString *version;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSValue *viewAreaInsets;
  NSString *v14;
  void *v15;
  uint64_t v16;
  NSValue *dashboardRoundedCorners;
  void *v18;
  uint64_t v19;
  NSDictionary *userInfo;
  objc_super v22;
  NSRect v23;
  NSRect v24;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRCarPlayCapabilities;
  v5 = -[CRCarPlayCapabilities init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRCapabilitiesVersionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRCapabilitiesDisabledFeatureKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disabledFeature = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabilitiesNowPlayingAlbumArtKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_nowPlayingAlbumArtMode = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabilitiesViewAreaInsetKey"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3B18];
    v23 = NSRectFromString(v10);
    objc_msgSend(v11, "valueWithEdgeInsets:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    v12 = objc_claimAutoreleasedReturnValue();
    viewAreaInsets = v5->_viewAreaInsets;
    v5->_viewAreaInsets = (NSValue *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CapabilitiesDashboardRoundedCornersKey"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3B18];
    v24 = NSRectFromString(v14);
    objc_msgSend(v15, "valueWithEdgeInsets:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v16 = objc_claimAutoreleasedReturnValue();
    dashboardRoundedCorners = v5->_dashboardRoundedCorners;
    v5->_dashboardRoundedCorners = (NSValue *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRCapabilitiesUserInterfaceStyleKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userInterfaceStyle = objc_msgSend(v18, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRCapabilitiesUserInfoKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v19;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSRect v10;
  NSRect v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_version, CFSTR("CRCapabilitiesVersionKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_disabledFeature);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CRCapabilitiesDisabledFeatureKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_nowPlayingAlbumArtMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CapabilitiesNowPlayingAlbumArtKey"));

  -[NSValue edgeInsetsValue](self->_viewAreaInsets, "edgeInsetsValue");
  NSStringFromRect(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CapabilitiesViewAreaInsetKey"));

  -[NSValue edgeInsetsValue](self->_dashboardRoundedCorners, "edgeInsetsValue");
  NSStringFromRect(v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("CapabilitiesDashboardRoundedCornersKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_userInterfaceStyle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CRCapabilitiesUserInterfaceStyleKey"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_userInfo, CFSTR("CRCapabilitiesUserInfoKey"));
  return v3;
}

+ (id)fetchCarCapabilities
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v3 = (void *)objc_msgSend(a1, "newCapabilitiesFromGlobalDomain");
  if ((objc_msgSend(v3, "persisted") & 1) == 0)
  {
    objc_msgSend(a1, "carPlayCapabilitiesCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "carPlayCapabilitiesCache");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
  }
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[CRCarPlayCapabilities fetchCarCapabilities].cold.1((uint64_t)v3, v6);

  return v3;
}

+ (id)newCapabilitiesFromGlobalDomain
{
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  CRCarPlayCapabilities *v10;
  CRCarPlayCapabilities *v11;
  uint64_t v12;

  +[CRCarPlayCapabilities capabilitiesIdentifier](CRCarPlayCapabilities, "capabilitiesIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = (void *)CFPreferencesCopyValue(CFSTR("CarCapabilities"), v3, v4, v5);
  objc_msgSend(v6, "objectForKey:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      +[CRCarPlayCapabilities newCapabilitiesFromGlobalDomain].cold.2();

    v10 = -[CRCarPlayCapabilities initWithDictionaryRepresentation:]([CRCarPlayCapabilities alloc], "initWithDictionaryRepresentation:", v7);
    v11 = v10;
    v12 = 1;
  }
  else
  {
    if (v9)
      +[CRCarPlayCapabilities newCapabilitiesFromGlobalDomain].cold.1(v8);

    v10 = (CRCarPlayCapabilities *)objc_opt_new();
    v11 = v10;
    v12 = 0;
  }
  -[CRCarPlayCapabilities setPersisted:](v10, "setPersisted:", v12);

  return v11;
}

- (void)persistCapabilitiesToGlobalDomain
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A83A2000, v1, v2, "%s: persisting car capabilities to global domain for identifier %@: %@ (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_1();
}

+ (void)_resetCapabilitiesGlobalDomain
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[CRCarPlayCapabilities _resetCapabilitiesGlobalDomain]";
  _os_log_debug_impl(&dword_1A83A2000, log, OS_LOG_TYPE_DEBUG, "%s: resetting car capabilities to global domain", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)waitForCarCapabilitiesValuesWithReply:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void (**v28)(id, id, _QWORD);
  _BYTE *v29;
  id v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  const __CFString *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id, _QWORD))a3;
  +[CRCarPlayCapabilities capabilitiesIdentifier](CRCarPlayCapabilities, "capabilitiesIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CarCapabilitiesDefaultIdentifier")))
  {

    +[CRCarPlayCapabilities capabilitiesIdentifier](CRCarPlayCapabilities, "capabilitiesIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (v5 && (objc_msgSend(v5, "isEqualToString:", CFSTR("CarCapabilitiesDefaultIdentifier")) & 1) == 0)
  {
    objc_msgSend(a1, "invalidateCarPlayCapabilitiesCache");
    +[CRCarPlayCapabilities fetchCarCapabilities](CRCarPlayCapabilities, "fetchCarCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(v7, "version"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "integerValue"),
          v11 = objc_msgSend(CFSTR("5"), "integerValue"),
          v9,
          v8,
          v10 > v11))
    {
      CarGeneralLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "+[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_DEFAULT, "%s: CarCapabilities available for current session: %@", buf, 0x16u);
      }

      if (!v4)
        goto LABEL_13;
      objc_msgSend(v7, "dictionaryRepresentation");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC318);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v23 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, v23, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_requestCarCapabilitiesStatus_withReply_, 0, 1);

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.app.service"), 4096);
      objc_msgSend(v19, "setRemoteObjectInterface:", v14);
      objc_msgSend(v19, "resume");
      objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_104);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("CRCarPlayCapabilitiesIdentifierKey");
      v36[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__5;
      v33 = __Block_byref_object_dispose__5;
      v34 = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_105;
      v25[3] = &unk_1E5429630;
      v29 = buf;
      v30 = a1;
      v28 = v4;
      v13 = v24;
      v26 = v13;
      v22 = v19;
      v27 = v22;
      objc_msgSend(v20, "requestCarCapabilitiesStatus:withReply:", v21, v25);

      _Block_object_dispose(buf, 8);
    }

LABEL_13:
  }

}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_cold_1((uint64_t)v2, v3);

}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_105(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  double v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_105_cold_1();

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 64), "setCarPlayCapabilitiesCache:");
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      v9 = CFSTR("Found");
    else
      v9 = CFSTR("Did not find");
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12 = 136315906;
    v13 = "+[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = fabs(v10);
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ capabilities values after waiting %f s: %@", (uint8_t *)&v12, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

+ (void)invalidateCarPlayCapabilitiesCache
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)sCRCarPlayCapabilitiesCache;
  sCRCarPlayCapabilitiesCache = 0;

  objc_sync_exit(obj);
}

+ (void)setCarPlayCapabilitiesCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v9, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 >= 1)
  {
    v7 = objc_msgSend(v9, "copy");
    v8 = (void *)sCRCarPlayCapabilitiesCache;
    sCRCarPlayCapabilitiesCache = v7;

  }
  objc_sync_exit(v4);

}

+ (id)carPlayCapabilitiesCache
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)sCRCarPlayCapabilitiesCache;
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)disabledFeature
{
  return self->_disabledFeature;
}

- (void)setDisabledFeature:(unint64_t)a3
{
  self->_disabledFeature = a3;
}

- (int64_t)nowPlayingAlbumArtMode
{
  return self->_nowPlayingAlbumArtMode;
}

- (void)setNowPlayingAlbumArtMode:(int64_t)a3
{
  self->_nowPlayingAlbumArtMode = a3;
}

- (NSValue)viewAreaInsets
{
  return self->_viewAreaInsets;
}

- (void)setViewAreaInsets:(id)a3
{
  objc_storeStrong((id *)&self->_viewAreaInsets, a3);
}

- (NSValue)dashboardRoundedCorners
{
  return self->_dashboardRoundedCorners;
}

- (void)setDashboardRoundedCorners:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardRoundedCorners, a3);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (void)setPersisted:(BOOL)a3
{
  self->_persisted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dashboardRoundedCorners, 0);
  objc_storeStrong((id *)&self->_viewAreaInsets, 0);
}

+ (void)capabilitiesIdentifier
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1A83A2000, v0, v1, "%s: returning capabilities identifier %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

+ (void)setCapabilitiesIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1A83A2000, v0, v1, "%s: setting capabilities identifier %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchCarCapabilities
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A83A2000, a2, v5, "CarCapabilities: fetched car capabilities for pid %@: %@", (uint8_t *)&v6);

}

+ (void)newCapabilitiesFromGlobalDomain
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A83A2000, v1, v2, "%s: retrieved car capabilities from global domain for identifier %@: %@ (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_1();
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "CRCarPlayAppService error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __63__CRCarPlayCapabilities_waitForCarCapabilitiesValuesWithReply___block_invoke_105_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_1A83A2000, v0, v1, "%s: requestCarCapabilitiesStatus service did reply. capabilities = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

@end
