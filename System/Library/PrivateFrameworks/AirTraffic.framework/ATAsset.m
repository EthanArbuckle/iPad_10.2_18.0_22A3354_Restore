@implementation ATAsset

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  NSString *identifier;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  const __CFString *v16;
  objc_super v17;
  objc_super v18;

  if (MSVDeviceIsWatch() && (MSVDeviceOSIsInternalInstall() & 1) == 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)ATAsset;
    -[ATAsset description](&v18, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ATAsset;
    -[ATAsset description](&v17, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isRestore)
      v4 = CFSTR("Restore ");
    else
      v4 = CFSTR("Sync ");
    v16 = v4;
    if (self->_isDownload)
      v5 = CFSTR("Download");
    else
      v5 = CFSTR("Upload");
    v15 = *(_OWORD *)&self->_dataclass;
    identifier = self->_identifier;
    -[ATStoreInfo syncID](self->_storeInfo, "syncID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreInfo adamID](self->_storeInfo, "adamID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreInfo sagaID](self->_storeInfo, "sagaID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSNumber longLongValue](self->_downloadSourceContainerId, "longLongValue");
    -[ATStoreInfo endpointType](self->_storeInfo, "endpointType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATAsset _variantDescription](self, "_variantDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("[%@%@, %@, %@, id=%@, syncid=%@, adamID=%@, sagaID=%@, downloadSourceContainerId=%lld, endpointType=%@, var=%@, path=%@, pid=%lld, bypassStore=%d, prioritized=%d, foreground=%d, installOnly=%d, allowDownloadOnConstrainedNetwork=%d, downloadPauseReason=%d, \"%@\"]"), v16, v5, v15, identifier, v7, v8, v9, v10, v11, v12, self->_localPath, self->_storePID, self->_bypassStore, self->_isPrioritized, self->_isForeground, self->_installOnly,
      self->_allowDownloadOnConstrainedNetwork,
      self->_downloadPauseReason,
      self->_prettyName);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  if (MSVDeviceIsWatch() && (MSVDeviceOSIsInternalInstall() & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)ATAsset;
    -[ATAsset description](&v10, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ATAsset;
    -[ATAsset description](&v9, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (self->_isRestore)
      v5 = CFSTR("Restore ");
    else
      v5 = CFSTR("Sync ");
    v6 = CFSTR("Download");
    if (!self->_isDownload)
      v6 = CFSTR("Upload");
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("[%@%@, %@, id=%@, \"%@\"]"), v5, v6, self->_dataclass, self->_identifier, self->_prettyName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (ATAsset)init
{
  char *v2;
  ATAsset *v3;
  void *v4;
  NSString *assetType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATAsset;
  v2 = -[ATAsset init](&v7, sel_init);
  v3 = (ATAsset *)v2;
  if (v2)
  {
    v2[64] = 1;
    v2[221] = 0;
    *(_WORD *)(v2 + 69) = 0;
    v2[216] = 0;
    *((_QWORD *)v2 + 28) = 0;
    v2[71] = 0;
    *((_WORD *)v2 + 46) = 256;
    *((_DWORD *)v2 + 24) = 0;
    *((_QWORD *)v2 + 23) = 0;
    v2[192] = 0;
    v4 = (void *)*((_QWORD *)v2 + 26);
    *((_QWORD *)v2 + 25) = 0;
    *((_QWORD *)v2 + 26) = &unk_24C4D1DC0;

    assetType = v3->_assetType;
    v3->_assetType = (NSString *)CFSTR("Unknown");

  }
  return v3;
}

- (ATAsset)initWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATAsset *v12;
  ATAsset *v13;
  uint64_t v14;
  NSString *assetType;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[ATAsset init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_dataclass, a4);
    objc_storeStrong((id *)&v13->_prettyName, a5);
    v13->_downloadPauseReason = 0;
    -[ATAsset _ATAssetTypeFromDataClass:](v13, "_ATAssetTypeFromDataClass:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    assetType = v13->_assetType;
    v13->_assetType = (NSString *)v14;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ATAsset *v4;
  ATAsset *v5;
  NSString *dataclass;
  void *v7;
  NSString *identifier;
  void *v9;
  unint64_t v10;
  BOOL v11;

  v4 = (ATAsset *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      dataclass = self->_dataclass;
      -[ATAsset dataclass](v5, "dataclass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](dataclass, "isEqualToString:", v7))
      {
        identifier = self->_identifier;
        -[ATAsset identifier](v5, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](identifier, "isEqualToString:", v9))
        {
          v10 = -[ATAsset assetParts](self, "assetParts");
          v11 = v10 == -[ATAsset assetParts](v5, "assetParts");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_dataclass, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  return v4 ^ -[ATAsset assetParts](self, "assetParts");
}

- (id)serializedAsset
{
  void *v3;
  NSString *identifier;
  void *v5;
  NSString *dataclass;
  void *v7;
  NSString *assetType;
  void *v9;
  NSDictionary *variantOptions;
  void *v11;
  NSString *localPath;
  void *v13;
  NSString *prettyName;
  void *v15;
  NSDictionary *clientParams;
  void *v17;
  NSNumber *downloadSourceContainerId;
  void *v19;
  NSError *error;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    v5 = (void *)-[NSString copy](identifier, "copy");
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  dataclass = self->_dataclass;
  if (dataclass)
  {
    v7 = (void *)-[NSString copy](dataclass, "copy");
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dataclass"));

  }
  assetType = self->_assetType;
  if (assetType)
  {
    v9 = (void *)-[NSString copy](assetType, "copy");
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("assetType"));

  }
  variantOptions = self->_variantOptions;
  if (variantOptions)
  {
    v11 = (void *)-[NSDictionary copy](variantOptions, "copy");
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("variantOptions"));

  }
  localPath = self->_localPath;
  if (localPath)
  {
    v13 = (void *)-[NSString copy](localPath, "copy");
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("path"));

  }
  prettyName = self->_prettyName;
  if (prettyName)
  {
    v15 = (void *)-[NSString copy](prettyName, "copy");
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("prettyName"));

  }
  clientParams = self->_clientParams;
  if (clientParams)
  {
    v17 = (void *)-[NSDictionary copy](clientParams, "copy");
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("clientParams"));

  }
  downloadSourceContainerId = self->_downloadSourceContainerId;
  if (downloadSourceContainerId)
  {
    v19 = (void *)-[NSNumber copy](downloadSourceContainerId, "copy");
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("downloadSourceContainerId"));

  }
  error = self->_error;
  if (error)
  {
    v21 = (void *)-[NSError copy](error, "copy");
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("error"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDownload);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isDownload"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isRestore);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("isRestore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_bypassStore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("bypassStore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPrioritized);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("prioritize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isForeground);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("isForeground"));

  *(float *)&v27 = self->_downloadProgress;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("downloadProgress"));

  *(float *)&v29 = self->_installProgress;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("installProgress"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_assetState);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("assetState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_downloadOnly);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("downloadOnly"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_lyricsEmbeddedInAsset);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("lyricsEmbeddedInAsset"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_powerRequired);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("powerRequired"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canUseCellularData);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("canUseCellularData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_protectionType);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("protectionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_enqueueSource);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("enqueueSource"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowDownloadOnConstrainedNetwork);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("allowDownloadOnConstrainedNetwork"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_downloadPauseReason);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("downloadPausedReason"));

  return v3;
}

- (unint64_t)assetParts
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ATAsset variantOptions](self, "variantOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AssetParts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  identifier = self->_identifier;
  v5 = a3;
  v6 = (void *)-[NSString copy](identifier, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("identifier"));

  v7 = (void *)-[NSString copy](self->_dataclass, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("dataclass"));

  v8 = (void *)-[NSString copy](self->_assetType, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("assetType"));

  v9 = (void *)-[NSDictionary copy](self->_variantOptions, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("variantOptions"));

  v10 = (void *)-[NSString copy](self->_localPath, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("path"));

  v11 = (void *)-[NSString copy](self->_prettyName, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("prettyName"));

  objc_msgSend(v5, "encodeBool:forKey:", self->_isDownload, CFSTR("isDownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_downloadOnly, CFSTR("downloadOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRestore, CFSTR("isRestore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_bypassStore, CFSTR("bypassStore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrioritized, CFSTR("prioritize"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isForeground, CFSTR("isForeground"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_lyricsEmbeddedInAsset, CFSTR("lyricsEmbeddedInAsset"));
  *(float *)&v12 = self->_downloadProgress;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("downloadProgress"), v12);
  *(float *)&v13 = self->_installProgress;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("installProgress"), v13);
  -[NSURL path](self->_icon, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("icon"));

  v16 = (void *)-[ATStoreInfo copy](self->_storeInfo, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("storeInfo"));

  v17 = (void *)-[NSDictionary copy](self->_clientParams, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("clientParams"));

  objc_msgSend(v5, "encodeInteger:forKey:", self->_assetState, CFSTR("assetState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_powerRequired, CFSTR("powerRequired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canUseCellularData, CFSTR("canUseCellularData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_protectionType, CFSTR("protectionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_enqueueSource, CFSTR("enqueueSource"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowDownloadOnConstrainedNetwork, CFSTR("allowDownloadOnConstrainedNetwork"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_downloadPauseReason);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("downloadPausedReason"));

  v19 = (void *)-[NSNumber copy](self->_downloadSourceContainerId, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("downloadSourceContainerId"));

  v21 = (id)-[NSError copy](self->_error, "copy");
  objc_msgSend(v21, "msv_errorByRemovingUnsafeUserInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("error"));

}

- (ATAsset)initWithCoder:(id)a3
{
  id v4;
  ATAsset *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *dataclass;
  uint64_t v10;
  NSString *assetType;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDictionary *variantOptions;
  uint64_t v19;
  NSString *localPath;
  uint64_t v21;
  NSString *prettyName;
  float v23;
  float v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURL *icon;
  uint64_t v29;
  ATStoreInfo *storeInfo;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSDictionary *clientParams;
  void *v38;
  uint64_t v39;
  NSNumber *downloadSourceContainerId;
  uint64_t v41;
  NSError *error;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ATAsset;
  v5 = -[ATAsset init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataclass"));
    v8 = objc_claimAutoreleasedReturnValue();
    dataclass = v5->_dataclass;
    v5->_dataclass = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("variantOptions"));
    v17 = objc_claimAutoreleasedReturnValue();
    variantOptions = v5->_variantOptions;
    v5->_variantOptions = (NSDictionary *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v19 = objc_claimAutoreleasedReturnValue();
    localPath = v5->_localPath;
    v5->_localPath = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prettyName"));
    v21 = objc_claimAutoreleasedReturnValue();
    prettyName = v5->_prettyName;
    v5->_prettyName = (NSString *)v21;

    v5->_isDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDownload"));
    v5->_downloadOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadOnly"));
    v5->_isRestore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestore"));
    v5->_bypassStore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bypassStore"));
    v5->_isPrioritized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prioritize"));
    v5->_isForeground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isForeground"));
    v5->_lyricsEmbeddedInAsset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lyricsEmbeddedInAsset"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("downloadProgress"));
    v5->_downloadProgress = v23;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("installProgress"));
    v5->_installProgress = v24;
    v25 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (NSURL *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeInfo"));
    v29 = objc_claimAutoreleasedReturnValue();
    storeInfo = v5->_storeInfo;
    v5->_storeInfo = (ATStoreInfo *)v29;

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("clientParams"));
    v36 = objc_claimAutoreleasedReturnValue();
    clientParams = v5->_clientParams;
    v5->_clientParams = (NSDictionary *)v36;

    v5->_assetState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("assetState"));
    v5->_powerRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("powerRequired"));
    v5->_canUseCellularData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canUseCellularData"));
    v5->_protectionType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("protectionType"));
    v5->_enqueueSource = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("enqueueSource"));
    v5->_allowDownloadOnConstrainedNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowDownloadOnConstrainedNetwork"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadPausedReason"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downloadPauseReason = objc_msgSend(v38, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadSourceContainerId"));
    v39 = objc_claimAutoreleasedReturnValue();
    downloadSourceContainerId = v5->_downloadSourceContainerId;
    v5->_downloadSourceContainerId = (NSNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v41 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v41;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATAsset storeInfo](self, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStoreInfo:", v6);

  -[ATAsset identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v7);

  -[ATAsset dataclass](self, "dataclass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataclass:", v8);

  -[ATAsset assetType](self, "assetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetType:", v9);

  -[ATAsset variantOptions](self, "variantOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVariantOptions:", v10);

  -[ATAsset path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v11);

  -[ATAsset icon](self, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIcon:", v12);

  -[ATAsset prettyName](self, "prettyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrettyName:", v13);

  objc_msgSend(v4, "setIsDownload:", -[ATAsset isDownload](self, "isDownload"));
  objc_msgSend(v4, "setIsRestore:", -[ATAsset isRestore](self, "isRestore"));
  objc_msgSend(v4, "setBypassStore:", -[ATAsset bypassStore](self, "bypassStore"));
  objc_msgSend(v4, "setInstallOnly:", -[ATAsset installOnly](self, "installOnly"));
  objc_msgSend(v4, "setReadyForStore:", -[ATAsset readyForStore](self, "readyForStore"));
  objc_msgSend(v4, "setIsPrioritized:", -[ATAsset isPrioritized](self, "isPrioritized"));
  objc_msgSend(v4, "setIsForeground:", -[ATAsset isForeground](self, "isForeground"));
  objc_msgSend(v4, "setLyricsEmbeddedInAsset:", -[ATAsset lyricsEmbeddedInAsset](self, "lyricsEmbeddedInAsset"));
  objc_msgSend(v4, "setStorePID:", -[ATAsset storePID](self, "storePID"));
  objc_msgSend(v4, "setPriority:", -[ATAsset priority](self, "priority"));
  -[ATAsset downloadProgress](self, "downloadProgress");
  objc_msgSend(v4, "setDownloadProgress:");
  -[ATAsset installProgress](self, "installProgress");
  objc_msgSend(v4, "setInstallProgress:");
  -[ATAsset storePlist](self, "storePlist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStorePlist:", v14);

  -[ATAsset infoPlist](self, "infoPlist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInfoPlist:", v15);

  -[ATAsset error](self, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v16);

  -[ATAsset clientParams](self, "clientParams");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientParams:", v17);

  -[ATAsset transferStartTime](self, "transferStartTime");
  objc_msgSend(v4, "setTransferStartTime:");
  -[ATAsset transferDuration](self, "transferDuration");
  objc_msgSend(v4, "setTransferDuration:");
  -[ATAsset queueStartTime](self, "queueStartTime");
  objc_msgSend(v4, "setQueueStartTime:");
  -[ATAsset queueDuration](self, "queueDuration");
  objc_msgSend(v4, "setQueueDuration:");
  objc_msgSend(v4, "setLegacy:", -[ATAsset isLegacy](self, "isLegacy"));
  objc_msgSend(v4, "setCompletedAssetParts:", -[ATAsset completedAssetParts](self, "completedAssetParts"));
  objc_msgSend(v4, "setInstalled:", -[ATAsset isInstalled](self, "isInstalled"));
  objc_msgSend(v4, "setPowerRequired:", -[ATAsset powerRequired](self, "powerRequired"));
  objc_msgSend(v4, "setCanUseCellularData:", -[ATAsset canUseCellularData](self, "canUseCellularData"));
  objc_msgSend(v4, "setProtectionType:", -[ATAsset protectionType](self, "protectionType"));
  objc_msgSend(v4, "setEnqueueSource:", -[ATAsset enqueueSource](self, "enqueueSource"));
  objc_msgSend(v4, "setAllowDownloadOnConstrainedNetwork:", -[ATAsset allowDownloadOnConstrainedNetwork](self, "allowDownloadOnConstrainedNetwork"));
  objc_msgSend(v4, "setDownloadPauseReason:", -[ATAsset downloadPauseReason](self, "downloadPauseReason"));
  -[ATAsset downloadSourceContainerId](self, "downloadSourceContainerId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDownloadSourceContainerId:", v18);

  return v4;
}

- (id)_variantDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_variantOptions)
  {
    objc_msgSend(v3, "appendString:", CFSTR("{"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSDictionary allKeys](self->_variantOptions, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
          if ((unint64_t)objc_msgSend(v4, "length") >= 2)
            objc_msgSend(v4, "appendString:", CFSTR(", "));
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Dimensions"));
          -[NSDictionary valueForKey:](self->_variantOptions, "valueForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v10)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendFormat:", CFSTR("%@=[%@x%@]"), v9, v13, v14);

          }
          else
          {
            objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@"), v9, v11);
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v15 = CFSTR("}");
  }
  else
  {
    v15 = CFSTR("(null)");
  }
  objc_msgSend(v4, "appendString:", v15);
  return v4;
}

- (id)_ATAssetTypeFromDataClass:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  if (_ATAssetTypeFromDataClass__onceToken != -1)
    dispatch_once(&_ATAssetTypeFromDataClass__onceToken, &__block_literal_global_599);
  objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("Unknown");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
  objc_storeStrong((id *)&self->_dataclass, a3);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_assetType, a3);
}

- (NSDictionary)variantOptions
{
  return self->_variantOptions;
}

- (void)setVariantOptions:(id)a3
{
  objc_storeStrong((id *)&self->_variantOptions, a3);
}

- (NSString)path
{
  return self->_localPath;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_localPath, a3);
}

- (NSString)prettyName
{
  return self->_prettyName;
}

- (void)setPrettyName:(id)a3
{
  objc_storeStrong((id *)&self->_prettyName, a3);
}

- (BOOL)isDownload
{
  return self->_isDownload;
}

- (void)setIsDownload:(BOOL)a3
{
  self->_isDownload = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)bypassStore
{
  return self->_bypassStore;
}

- (void)setBypassStore:(BOOL)a3
{
  self->_bypassStore = a3;
}

- (BOOL)installOnly
{
  return self->_installOnly;
}

- (void)setInstallOnly:(BOOL)a3
{
  self->_installOnly = a3;
}

- (BOOL)readyForStore
{
  return self->_readyForStore;
}

- (void)setReadyForStore:(BOOL)a3
{
  self->_readyForStore = a3;
}

- (BOOL)isPrioritized
{
  return self->_isPrioritized;
}

- (void)setIsPrioritized:(BOOL)a3
{
  self->_isPrioritized = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

- (int64_t)storePID
{
  return self->_storePID;
}

- (void)setStorePID:(int64_t)a3
{
  self->_storePID = a3;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (float)installProgress
{
  return self->_installProgress;
}

- (void)setInstallProgress:(float)a3
{
  self->_installProgress = a3;
}

- (NSURL)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (ATStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void)setStoreInfo:(id)a3
{
  objc_storeStrong((id *)&self->_storeInfo, a3);
}

- (NSString)storePlist
{
  return self->_storePlist;
}

- (void)setStorePlist:(id)a3
{
  objc_storeStrong((id *)&self->_storePlist, a3);
}

- (NSString)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
  objc_storeStrong((id *)&self->_infoPlist, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSDictionary)clientParams
{
  return self->_clientParams;
}

- (void)setClientParams:(id)a3
{
  objc_storeStrong((id *)&self->_clientParams, a3);
}

- (int64_t)assetState
{
  return self->_assetState;
}

- (void)setAssetState:(int64_t)a3
{
  self->_assetState = a3;
}

- (double)transferStartTime
{
  return self->_transferStartTime;
}

- (void)setTransferStartTime:(double)a3
{
  self->_transferStartTime = a3;
}

- (double)transferDuration
{
  return self->_transferDuration;
}

- (void)setTransferDuration:(double)a3
{
  self->_transferDuration = a3;
}

- (double)queueStartTime
{
  return self->_queueStartTime;
}

- (void)setQueueStartTime:(double)a3
{
  self->_queueStartTime = a3;
}

- (double)queueDuration
{
  return self->_queueDuration;
}

- (void)setQueueDuration:(double)a3
{
  self->_queueDuration = a3;
}

- (BOOL)lyricsEmbeddedInAsset
{
  return self->_lyricsEmbeddedInAsset;
}

- (void)setLyricsEmbeddedInAsset:(BOOL)a3
{
  self->_lyricsEmbeddedInAsset = a3;
}

- (BOOL)powerRequired
{
  return self->_powerRequired;
}

- (void)setPowerRequired:(BOOL)a3
{
  self->_powerRequired = a3;
}

- (BOOL)canUseCellularData
{
  return self->_canUseCellularData;
}

- (void)setCanUseCellularData:(BOOL)a3
{
  self->_canUseCellularData = a3;
}

- (int)protectionType
{
  return self->_protectionType;
}

- (void)setProtectionType:(int)a3
{
  self->_protectionType = a3;
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setResumeData:(id)a3
{
  objc_storeStrong((id *)&self->_resumeData, a3);
}

- (int64_t)enqueueSource
{
  return self->_enqueueSource;
}

- (void)setEnqueueSource:(int64_t)a3
{
  self->_enqueueSource = a3;
}

- (BOOL)allowDownloadOnConstrainedNetwork
{
  return self->_allowDownloadOnConstrainedNetwork;
}

- (void)setAllowDownloadOnConstrainedNetwork:(BOOL)a3
{
  self->_allowDownloadOnConstrainedNetwork = a3;
}

- (unint64_t)downloadPauseReason
{
  return self->_downloadPauseReason;
}

- (void)setDownloadPauseReason:(unint64_t)a3
{
  self->_downloadPauseReason = a3;
}

- (NSNumber)downloadSourceContainerId
{
  return self->_downloadSourceContainerId;
}

- (void)setDownloadSourceContainerId:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSourceContainerId, a3);
}

- (BOOL)downloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_downloadOnly = a3;
}

- (BOOL)installStarted
{
  return self->_installStarted;
}

- (void)setInstallStarted:(BOOL)a3
{
  self->_installStarted = a3;
}

- (NMSDownloadableItem)mediaItemDownloadInfo
{
  return self->_mediaItemDownloadInfo;
}

- (void)setMediaItemDownloadInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemDownloadInfo, a3);
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (void)setIsRetry:(BOOL)a3
{
  self->_isRetry = a3;
}

- (BOOL)canProxyUseCellularData
{
  return self->_canProxyUseCellularData;
}

- (void)setCanProxyUseCellularData:(BOOL)a3
{
  self->_canProxyUseCellularData = a3;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_totalBytes = a3;
}

- (unint64_t)bytesRemaining
{
  return self->_bytesRemaining;
}

- (void)setBytesRemaining:(unint64_t)a3
{
  self->_bytesRemaining = a3;
}

- (BOOL)deviceWasChargingWhenEnqueued
{
  return self->_deviceWasChargingWhenEnqueued;
}

- (void)setDeviceWasChargingWhenEnqueued:(BOOL)a3
{
  self->_deviceWasChargingWhenEnqueued = a3;
}

- (unint64_t)completedAssetParts
{
  return self->_completedAssetParts;
}

- (void)setCompletedAssetParts:(unint64_t)a3
{
  self->_completedAssetParts = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
}

- (BOOL)isInstalled
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_mediaItemDownloadInfo, 0);
  objc_storeStrong((id *)&self->_downloadSourceContainerId, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_clientParams, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
  objc_storeStrong((id *)&self->_storePlist, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_prettyName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
  objc_storeStrong((id *)&self->_variantOptions, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __37__ATAsset__ATAssetTypeFromDataClass___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_ATAssetTypeFromDataClass__dataClassByKind;
  _ATAssetTypeFromDataClass__dataClassByKind = (uint64_t)v0;

  objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Application"), CFSTR("Application"));
  objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("EBook"), CFSTR("Book"));
  objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Media"), CFSTR("Media"));
  objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Photo"), CFSTR("Photo"));
  return objc_msgSend((id)_ATAssetTypeFromDataClass__dataClassByKind, "setObject:forKeyedSubscript:", CFSTR("Podcast"), CFSTR("Podcasts"));
}

+ (id)downloadAssetWithIdentifier:(id)a3 dataclass:(id)a4 prettyName:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATAsset *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[ATAsset initWithIdentifier:dataclass:prettyName:]([ATAsset alloc], "initWithIdentifier:dataclass:prettyName:", v9, v8, v7);

  v10->_legacy = 1;
  return v10;
}

+ (id)uploadAssetWithIdentifier:(id)a3 dataclass:(id)a4 sourcePath:(id)a5 prettyName:(id)a6
{
  NSString *v9;
  id v10;
  id v11;
  id v12;
  ATAsset *v13;
  NSString *localPath;

  v9 = (NSString *)a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[ATAsset initWithIdentifier:dataclass:prettyName:]([ATAsset alloc], "initWithIdentifier:dataclass:prettyName:", v12, v11, v10);

  localPath = v13->_localPath;
  v13->_localPath = v9;

  v13->_isDownload = 0;
  v13->_legacy = 1;
  return v13;
}

+ (id)iCloudRestoreAssetWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 restorePath:(id)a6 displayName:(id)a7
{
  NSString *v11;
  NSString *v12;
  id v13;
  id v14;
  id v15;
  ATAsset *v16;
  NSString *assetType;
  NSString *v18;
  NSString *localPath;

  v11 = (NSString *)a5;
  v12 = (NSString *)a6;
  v13 = a7;
  v14 = a4;
  v15 = a3;
  v16 = -[ATAsset initWithIdentifier:dataclass:prettyName:]([ATAsset alloc], "initWithIdentifier:dataclass:prettyName:", v15, v14, v13);

  assetType = v16->_assetType;
  v16->_assetType = v11;
  v18 = v11;

  localPath = v16->_localPath;
  v16->_localPath = v12;

  *(_WORD *)&v16->_isRestore = 257;
  v16->_legacy = 1;
  return v16;
}

+ (id)assetWithSerializedAsset:(id)a3
{
  id v3;
  ATAsset *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *dataclass;
  uint64_t v9;
  NSString *assetType;
  uint64_t v11;
  NSDictionary *variantOptions;
  uint64_t v13;
  NSString *localPath;
  uint64_t v15;
  NSString *prettyName;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  float v25;
  uint64_t v26;
  NSDictionary *clientParams;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSNumber *downloadSourceContainerId;
  uint64_t v39;
  NSError *error;

  v3 = a3;
  v4 = objc_alloc_init(ATAsset);
  objc_msgSend(v3, "objectForKey:", CFSTR("identifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  objc_msgSend(v3, "objectForKey:", CFSTR("dataclass"));
  v7 = objc_claimAutoreleasedReturnValue();
  dataclass = v4->_dataclass;
  v4->_dataclass = (NSString *)v7;

  objc_msgSend(v3, "objectForKey:", CFSTR("assetType"));
  v9 = objc_claimAutoreleasedReturnValue();
  assetType = v4->_assetType;
  v4->_assetType = (NSString *)v9;

  objc_msgSend(v3, "objectForKey:", CFSTR("variantOptions"));
  v11 = objc_claimAutoreleasedReturnValue();
  variantOptions = v4->_variantOptions;
  v4->_variantOptions = (NSDictionary *)v11;

  objc_msgSend(v3, "objectForKey:", CFSTR("path"));
  v13 = objc_claimAutoreleasedReturnValue();
  localPath = v4->_localPath;
  v4->_localPath = (NSString *)v13;

  objc_msgSend(v3, "objectForKey:", CFSTR("prettyName"));
  v15 = objc_claimAutoreleasedReturnValue();
  prettyName = v4->_prettyName;
  v4->_prettyName = (NSString *)v15;

  objc_msgSend(v3, "objectForKey:", CFSTR("isDownload"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isDownload = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("isRestore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isRestore = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("bypassStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_bypassStore = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("prioritize"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isPrioritized = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("isForeground"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_isForeground = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("downloadProgress"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v4->_downloadProgress = v23;

  objc_msgSend(v3, "objectForKey:", CFSTR("installProgress"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v4->_installProgress = v25;

  objc_msgSend(v3, "objectForKey:", CFSTR("clientParams"));
  v26 = objc_claimAutoreleasedReturnValue();
  clientParams = v4->_clientParams;
  v4->_clientParams = (NSDictionary *)v26;

  objc_msgSend(v3, "objectForKey:", CFSTR("assetState"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_assetState = objc_msgSend(v28, "integerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("downloadOnly"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_downloadOnly = objc_msgSend(v29, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("lyricsEmbeddedInAsset"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_lyricsEmbeddedInAsset = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("powerRequired"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_powerRequired = objc_msgSend(v31, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("canUseCellularData"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_canUseCellularData = objc_msgSend(v32, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("protectionType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_protectionType = objc_msgSend(v33, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("enqueueSource"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_enqueueSource = (int)objc_msgSend(v34, "intValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("allowDownloadOnConstrainedNetwork"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_allowDownloadOnConstrainedNetwork = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("downloadPausedReason"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v4->_downloadPauseReason = objc_msgSend(v36, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("downloadSourceContainerId"));
  v37 = objc_claimAutoreleasedReturnValue();
  downloadSourceContainerId = v4->_downloadSourceContainerId;
  v4->_downloadSourceContainerId = (NSNumber *)v37;

  objc_msgSend(v3, "objectForKey:", CFSTR("error"));
  v39 = objc_claimAutoreleasedReturnValue();

  error = v4->_error;
  v4->_error = (NSError *)v39;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
