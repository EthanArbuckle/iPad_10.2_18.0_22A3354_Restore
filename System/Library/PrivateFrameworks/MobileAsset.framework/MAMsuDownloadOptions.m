@implementation MAMsuDownloadOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_liveAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_prerequisiteReleaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_requestedProductVersion, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *prerequisiteReleaseType;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)MAMsuDownloadOptions;
  -[MADownloadOptions description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAMsuDownloadOptions requestedProductVersion](self, "requestedProductVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAMsuDownloadOptions delayPeriod](self, "delayPeriod");
  v6 = -[MAMsuDownloadOptions supervised](self, "supervised");
  v7 = -[MAMsuDownloadOptions allowSameVersion](self, "allowSameVersion");
  -[MAMsuDownloadOptions prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAMsuDownloadOptions prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_prerequisiteReleaseTypeIsOverridden)
    prerequisiteReleaseType = (const __CFString *)self->_prerequisiteReleaseType;
  else
    prerequisiteReleaseType = CFSTR("(default)");
  -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAMsuDownloadOptions purpose](self, "purpose");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@  + MAMsuDownloadOptions reqProdVersion: %@ delayPeriod: %ld managedDevice: %d allowSameVersion: %d prereqBuild: %@ prereqVersion: %@ prereqReleaseType: %@ liveAssetAudienceUUID: %@ purpose: %@"), v3, v4, v5, v6, v7, v8, v9, prerequisiteReleaseType, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (NSString)requestedProductVersion
{
  return self->_requestedProductVersion;
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (NSString)liveAssetAudienceUUID
{
  return self->_liveAssetAudienceUUID;
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (BOOL)allowSameVersion
{
  return self->_allowSameVersion;
}

- (MAMsuDownloadOptions)initWithPlist:(id)a3
{
  id v4;
  MAMsuDownloadOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAMsuDownloadOptions;
  v5 = -[MADownloadOptions initWithPlist:](&v15, sel_initWithPlist_, v4);
  if (v5)
  {
    getPlistString(v4, CFSTR("RequestedProductVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setRequestedProductVersion:](v5, "setRequestedProductVersion:", v6);

    getPlistNumber(v4, CFSTR("DelayPeriod"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_delayPeriod = objc_msgSend(v7, "longValue");

    v5->_supervised = getPlistNumberAsBool(v4, CFSTR("Supervised"));
    v5->_allowSameVersion = getPlistNumberAsBool(v4, CFSTR("AllowSameVersion"));
    getPlistString(v4, CFSTR("PrerequisiteBuildVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteBuildVersion:](v5, "setPrerequisiteBuildVersion:", v8);

    getPlistString(v4, CFSTR("PrerequisiteProductVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteProductVersion:](v5, "setPrerequisiteProductVersion:", v9);

    getPlistString(v4, CFSTR("PrerequisiteReleaseType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteReleaseType:](v5, "setPrerequisiteReleaseType:", v10);

    v5->_prerequisiteReleaseTypeIsOverridden = getPlistNumberAsBool(v4, CFSTR("PrerequisiteReleaseTypeIsOverridden"));
    getPlistString(v4, CFSTR("DownloadAuthorizationHeader"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADownloadOptions setDownloadAuthorizationHeader:](v5, "setDownloadAuthorizationHeader:", v11);

    getPlistString(v4, CFSTR("LiveAssetAudienceUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setLiveAssetAudienceUUID:](v5, "setLiveAssetAudienceUUID:", v12);

    getPlistString(v4, CFSTR("Purpose"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", v13);

  }
  return v5;
}

- (void)setRequestedProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestedProductVersion, a3);
}

- (void)setPurpose:(id)a3
{
  objc_storeStrong((id *)&self->_purpose, a3);
}

- (void)setPrerequisiteReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteReleaseType, a3);
  self->_prerequisiteReleaseTypeIsOverridden = 1;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, a3);
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, a3);
}

- (void)setLiveAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_liveAssetAudienceUUID, a3);
}

- (MAMsuDownloadOptions)init
{
  MAMsuDownloadOptions *v2;
  MAMsuDownloadOptions *v3;
  NSString *requestedProductVersion;
  NSString *prerequisiteBuildVersion;
  NSString *prerequisiteProductVersion;
  NSString *prerequisiteReleaseType;
  NSString *liveAssetAudienceUUID;
  NSString *purpose;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MAMsuDownloadOptions;
  v2 = -[MADownloadOptions init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    requestedProductVersion = v2->_requestedProductVersion;
    v2->_requestedProductVersion = 0;

    v3->_delayPeriod = 0;
    v3->_supervised = 0;
    v3->_allowSameVersion = 0;
    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0;

    prerequisiteReleaseType = v3->_prerequisiteReleaseType;
    v3->_prerequisiteReleaseType = 0;

    v3->_prerequisiteReleaseTypeIsOverridden = 0;
    liveAssetAudienceUUID = v3->_liveAssetAudienceUUID;
    v3->_liveAssetAudienceUUID = 0;

    purpose = v3->_purpose;
    v3->_purpose = 0;

  }
  return v3;
}

- (BOOL)prerequisiteReleaseTypeIsOverridden
{
  return self->_prerequisiteReleaseTypeIsOverridden;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAMsuDownloadOptions)initWithCoder:(id)a3
{
  id v4;
  MAMsuDownloadOptions *v5;
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
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAMsuDownloadOptions;
  v5 = -[MADownloadOptions initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequestedProductVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setRequestedProductVersion:](v5, "setRequestedProductVersion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DelayPeriod"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_delayPeriod = objc_msgSend(v7, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Supervised"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supervised = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllowSameVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowSameVersion = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteBuildVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteBuildVersion:](v5, "setPrerequisiteBuildVersion:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteProductVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteProductVersion:](v5, "setPrerequisiteProductVersion:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteReleaseType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPrerequisiteReleaseType:](v5, "setPrerequisiteReleaseType:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteReleaseTypeIsOverridden"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_prerequisiteReleaseTypeIsOverridden = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LiveAssetAudienceUUID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setLiveAssetAudienceUUID:](v5, "setLiveAssetAudienceUUID:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Purpose"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *requestedProductVersion;
  void *v6;
  void *v7;
  void *v8;
  NSString *prerequisiteBuildVersion;
  NSString *prerequisiteProductVersion;
  NSString *prerequisiteReleaseType;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAMsuDownloadOptions;
  -[MADownloadOptions encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion)
    objc_msgSend(v4, "encodeObject:forKey:", requestedProductVersion, CFSTR("RequestedProductVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_delayPeriod);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DelayPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supervised);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Supervised"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowSameVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("AllowSameVersion"));

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion)
    objc_msgSend(v4, "encodeObject:forKey:", prerequisiteBuildVersion, CFSTR("PrerequisiteBuildVersion"));
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion)
    objc_msgSend(v4, "encodeObject:forKey:", prerequisiteProductVersion, CFSTR("PrerequisiteProductVersion"));
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType)
    objc_msgSend(v4, "encodeObject:forKey:", prerequisiteReleaseType, CFSTR("PrerequisiteReleaseType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prerequisiteReleaseTypeIsOverridden);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("PrerequisiteReleaseTypeIsOverridden"));

  -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("LiveAssetAudienceUUID"));

  -[MAMsuDownloadOptions purpose](self, "purpose");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("Purpose"));

}

- (id)encodeAsPlist
{
  void *v3;
  void *v4;
  NSString *requestedProductVersion;
  void *v6;
  void *v7;
  void *v8;
  NSString *prerequisiteBuildVersion;
  NSString *prerequisiteProductVersion;
  NSString *prerequisiteReleaseType;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MAMsuDownloadOptions;
  -[MADownloadOptions encodeAsPlist](&v17, sel_encodeAsPlist);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion)
    objc_msgSend(v3, "setValue:forKey:", requestedProductVersion, CFSTR("RequestedProductVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_delayPeriod);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("DelayPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supervised);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("Supervised"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowSameVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("AllowSameVersion"));

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion)
    objc_msgSend(v4, "setValue:forKey:", prerequisiteBuildVersion, CFSTR("PrerequisiteBuildVersion"));
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion)
    objc_msgSend(v4, "setValue:forKey:", prerequisiteProductVersion, CFSTR("PrerequisiteProductVersion"));
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType)
    objc_msgSend(v4, "setValue:forKey:", prerequisiteReleaseType, CFSTR("PrerequisiteReleaseType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_prerequisiteReleaseTypeIsOverridden);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("PrerequisiteReleaseTypeIsOverridden"));

  -[MADownloadOptions downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("DownloadAuthorizationHeader"));

  -[MAMsuDownloadOptions liveAssetAudienceUUID](self, "liveAssetAudienceUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v14, CFSTR("LiveAssetAudienceUUID"));

  -[MAMsuDownloadOptions purpose](self, "purpose");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v15, CFSTR("Purpose"));

  return v4;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  self->_allowSameVersion = a3;
}

- (NSString)prerequisiteReleaseType
{
  return self->_prerequisiteReleaseType;
}

- (void)setPrerequisiteReleaseTypeIsOverridden:(BOOL)a3
{
  self->_prerequisiteReleaseTypeIsOverridden = a3;
}

@end
