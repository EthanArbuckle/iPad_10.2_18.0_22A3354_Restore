@implementation CPLMasterChange

- (CPLMasterChange)init
{
  CPLMasterChange *v2;
  CPLMasterChange *v3;
  NSArray *resources;
  uint64_t v5;
  NSString *itemType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLMasterChange;
  v2 = -[CPLItemChange init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    resources = v2->_resources;
    v2->_resources = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    itemType = v3->_itemType;
    v3->_itemType = (NSString *)v5;

  }
  return v3;
}

- (id)fingerprintScheme
{
  CPLFingerprintScheme *fingerprintScheme;
  void *v4;
  void *v5;
  CPLFingerprintScheme *v6;
  CPLFingerprintScheme *v7;

  fingerprintScheme = self->_fingerprintScheme;
  if (!fingerprintScheme)
  {
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLFingerprintScheme fingerprintSchemeForMasterIdentifier:](CPLFingerprintScheme, "fingerprintSchemeForMasterIdentifier:", v5);
    v6 = (CPLFingerprintScheme *)objc_claimAutoreleasedReturnValue();
    v7 = self->_fingerprintScheme;
    self->_fingerprintScheme = v6;

    fingerprintScheme = self->_fingerprintScheme;
  }
  return fingerprintScheme;
}

- (BOOL)isImage
{
  NSUInteger v3;
  void *v4;
  char v5;

  v3 = -[NSString length](self->_itemType, "length");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", self->_itemType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC520]);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isVideo
{
  NSUInteger v3;
  void *v4;
  char v5;

  v3 = -[NSString length](self->_itemType, "length");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", self->_itemType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC568]);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)dequeueOrder
{
  void *v3;
  void *v4;
  double v5;
  int64_t v6;
  objc_super v8;

  -[CPLMasterChange creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLMasterChange;
    v5 = (double)-[CPLRecordChange dequeueOrder](&v8, sel_dequeueOrder);
  }
  v6 = (uint64_t)v5;

  return v6;
}

- (id)propertiesDescription
{
  unint64_t v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *filename;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = -[CPLRecordChange changeType](self, "changeType");
  v4 = v3;
  if (!v3 || (v3 & 2) != 0)
  {
    filename = (__CFString *)self->_filename;
    if (!filename)
      filename = CFSTR("no filename");
    v5 = filename;
    if (!v4 || (v4 & 8) != 0)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CPLRecordChange resourcesDescription](self, "resourcesDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@ / %@"), v5, v8);

      v5 = (__CFString *)v9;
    }
  }
  else if ((v3 & 8) != 0)
  {
    -[CPLRecordChange resourcesDescription](self, "resourcesDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E60DF6B8;
  }
  return v5;
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  id v3;
  objc_super v5;

  if (a3 == 8)
  {
    if (propertiesForChangeType__onceToken != -1)
      dispatch_once(&propertiesForChangeType__onceToken, &__block_literal_global_2274);
    v3 = (id)propertiesForChangeType__properties;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMasterChange;
    -[CPLItemChange propertiesForChangeType:](&v5, sel_propertiesForChangeType_);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  if (sel_fullSizeJPEGSource == a3)
    return &__block_literal_global_20;
  if (sel_originatingFingerprint == a3)
    return &__block_literal_global_23;
  if (sel_importedBy == a3)
    return &__block_literal_global_26;
  if (sel_importedByBundleIdentifier == a3)
    return &__block_literal_global_29;
  if (sel_importedByDisplayName == a3)
    return &__block_literal_global_32;
  if (sel_videoFrameRate == a3)
    return &__block_literal_global_35;
  if (sel_codec == a3)
    return &__block_literal_global_38;
  if (sel_expungeableResourceStates == a3)
  {
    v3 = &__block_literal_global_41;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLMasterChange;
    -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setResources:(id)a3
{
  id v5;
  NSArray *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *resources;
  NSArray *v17;
  NSDictionary *resourcePerResourceType;
  NSDictionary *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v5 = a3;
  +[CPLResource normalizedResourcesFromResources:resourcePerResourceType:](CPLResource, "normalizedResourcesFromResources:resourcePerResourceType:", v5, &v20);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = (NSDictionary *)v20;
  v8 = -[NSArray count](v6, "count");
  v9 = objc_msgSend(v5, "count");

  if (v8 != v9 && _CPLSilentLogging == 0)
  {
    __CPLGenericOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v12;
      v23 = 2112;
      v24 = v14;
      v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", buf, 0x20u);

    }
  }
  resources = self->_resources;
  self->_resources = v6;
  v17 = v6;

  resourcePerResourceType = self->_resourcePerResourceType;
  self->_resourcePerResourceType = v7;
  v19 = v7;

}

- (void)setExpungeableResourceStates:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSArray *expungeableResourceStates;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CPLExpungeableResourceState normalizedExpungeableResourceStatesFromExpungeableResourceStates:](CPLExpungeableResourceState, "normalizedExpungeableResourceStatesFromExpungeableResourceStates:", v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSArray count](v6, "count");
  v8 = objc_msgSend(v5, "count");

  if (v7 != v8 && _CPLSilentLogging == 0)
  {
    __CPLGenericOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v11;
      v18 = 2112;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "<%@ %@> %{public}@ got duplicate or incorrect resource types", (uint8_t *)&v16, 0x20u);

    }
  }
  expungeableResourceStates = self->_expungeableResourceStates;
  self->_expungeableResourceStates = v6;

}

- (id)resourceForType:(unint64_t)a3
{
  NSDictionary *resourcePerResourceType;
  void *v4;
  void *v5;

  resourcePerResourceType = self->_resourcePerResourceType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](resourcePerResourceType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_copyDerivatives:(unint64_t *)a3 count:(int)a4 ifMatchingResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v9 = *(_QWORD *)&a4;
  v22 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_msgSend(v14, "sourceResourceType");
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v22, "resourceForType:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fingerPrint");
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fingerPrint");
      v21 = objc_claimAutoreleasedReturnValue();

      if (v19 && v21)
      {
        if ((objc_msgSend((id)v19, "isEqual:", v21) & 1) == 0)
          goto LABEL_9;
      }
      else if (v19 | v21)
      {
LABEL_9:

        goto LABEL_10;
      }
      -[CPLRecordChange copyDerivatives:count:avoidResourceType:fromRecord:inResourcePerType:](self, "copyDerivatives:count:avoidResourceType:fromRecord:inResourcePerType:", a3, v9, v16, v22, v12);
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  CPLMasterChange *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "supportsResources"))
  {
    if ((objc_msgSend(v4, "isMasterChange") & 1) != 0)
    {
      v5 = 18;
      goto LABEL_6;
    }
    if (objc_msgSend(v4, "isAssetChange"))
    {
      v5 = 19;
LABEL_6:
      v6 = (id)-[NSDictionary mutableCopy](self->_resourcePerResourceType, "mutableCopy");
      if (!v6)
        v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v4, "resourceForType:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[CPLMasterChange _copyDerivatives:count:ifMatchingResourceType:fromRecord:inResourcePerType:](self, "_copyDerivatives:count:ifMatchingResourceType:fromRecord:inResourcePerType:", &copyDerivativesFromRecordIfPossible__originalDerivativesImage, 4, 1, v4, v6);
        v9 = &copyDerivativesFromRecordIfPossible__originalDerivativesVideo;
        v10 = self;
        v11 = 5;
        v12 = 18;
      }
      else
      {
        v9 = &copyDerivativesFromRecordIfPossible__originalDerivativesImageAndVideo;
        v10 = self;
        v11 = 9;
        v12 = 1;
      }
      -[CPLMasterChange _copyDerivatives:count:ifMatchingResourceType:fromRecord:inResourcePerType:](v10, "_copyDerivatives:count:ifMatchingResourceType:fromRecord:inResourcePerType:", v9, v11, v12, v4, v6);
      if (v7 >= objc_msgSend(v6, "count"))
      {
        if (_CPLSilentLogging)
        {
LABEL_21:

          goto LABEL_22;
        }
        __CPLGenericOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_opt_class();
          v22 = v21;
          objc_msgSend(v4, "scopedIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_opt_class();
          v25 = v24;
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v29 = (unint64_t)v21;
          v30 = 2112;
          v31 = v23;
          v32 = 2112;
          v33 = v24;
          v34 = 2112;
          v35 = v26;
          _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_DEFAULT, "Found no derivatives to copy from <%@ %@> to <%@ %@>", buf, 0x2Au);

        }
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_msgSend(v6, "count") - v7;
            v15 = (void *)objc_opt_class();
            v27 = v15;
            objc_msgSend(v4, "scopedIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_opt_class();
            v18 = v17;
            -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219010;
            v29 = v14;
            v30 = 2112;
            v31 = v15;
            v32 = 2112;
            v33 = v16;
            v34 = 2112;
            v35 = v17;
            v36 = 2112;
            v37 = v19;
            _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Automatically copied %lu derivatives from <%@ %@> to <%@ %@>", buf, 0x34u);

          }
        }
        objc_msgSend(v6, "allValues");
        v20 = objc_claimAutoreleasedReturnValue();
        -[CPLMasterChange setResources:](self, "setResources:", v20);
      }

      goto LABEL_21;
    }
  }
LABEL_22:

}

- (id)name
{
  return 0;
}

- (unint64_t)dataClassType
{
  void *v3;
  unint64_t v4;

  if (!-[NSString length](self->_itemType, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", self->_itemType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC450]))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 2)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CPLMasterChange;
  return -[CPLRecordChange isResourceTypeAGeneratedDerivative:](&v6, sel_isResourceTypeAGeneratedDerivative_);
}

- (BOOL)allowsToOnlyUploadNewResources
{
  return 1;
}

- (BOOL)isMasterChange
{
  return 1;
}

- (BOOL)inTrash
{
  return 0;
}

- (id)dateDeleted
{
  return 0;
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSArray)expungeableResourceStates
{
  return self->_expungeableResourceStates;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setItemType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)importDate
{
  return self->_importDate;
}

- (void)setImportDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)importGroupIdentifier
{
  return self->_importGroupIdentifier;
}

- (void)setImportGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)mediaMetaDataType
{
  return self->_mediaMetaDataType;
}

- (void)setMediaMetaDataType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSData)mediaMetaData
{
  return self->_mediaMetaData;
}

- (void)setMediaMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_mediaMetaData, a3);
}

- (int64_t)originalOrientation
{
  return self->_originalOrientation;
}

- (void)setOriginalOrientation:(int64_t)a3
{
  self->_originalOrientation = a3;
}

- (unint64_t)fullSizeJPEGSource
{
  return self->_fullSizeJPEGSource;
}

- (void)setFullSizeJPEGSource:(unint64_t)a3
{
  self->_fullSizeJPEGSource = a3;
}

- (NSString)originatingFingerprint
{
  return self->_originatingFingerprint;
}

- (void)setOriginatingFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (signed)importedBy
{
  return self->_importedBy;
}

- (void)setImportedBy:(signed __int16)a3
{
  self->_importedBy = a3;
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSString)importedByDisplayName
{
  return self->_importedByDisplayName;
}

- (void)setImportedByDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (signed)videoFrameRate
{
  return self->_videoFrameRate;
}

- (void)setVideoFrameRate:(signed __int16)a3
{
  self->_videoFrameRate = a3;
}

- (NSString)codec
{
  return self->_codec;
}

- (void)setCodec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_importedByDisplayName, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingFingerprint, 0);
  objc_storeStrong((id *)&self->_mediaMetaData, 0);
  objc_storeStrong((id *)&self->_mediaMetaDataType, 0);
  objc_storeStrong((id *)&self->_importGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_importDate, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_expungeableResourceStates, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_fingerprintScheme, 0);
  objc_storeStrong((id *)&self->_resourcePerResourceType, 0);
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "expungeableResourceStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "expungeableResourceStates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "codec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "videoFrameRate") == 0;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "importedByDisplayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "importedByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "importedBy") == 0;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "originatingFingerprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

BOOL __65__CPLMasterChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fullSizeJPEGSource") == 0;
}

void __43__CPLMasterChange_propertiesForChangeType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("resources"), CFSTR("resourceCopyFromScopedIdentifier"), 0);
  v1 = (void *)propertiesForChangeType__properties;
  propertiesForChangeType__properties = v0;

}

+ (BOOL)supportsSharing
{
  return 1;
}

+ (BOOL)supportsResources
{
  return 1;
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return a3 != 27;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CPLMasterChange;
  return objc_msgSendSuper2(&v6, sel_requiresStableHashForResourceType_);
}

+ (BOOL)supportsDeletion
{
  return 0;
}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  CPLMasterChange *v12;
  BOOL v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  CPLMasterChange *v19;
  __int16 v20;
  CPLMasterChange *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPLMasterChange;
  if (-[CPLRecordChange validateRecordForTracker:](&v17, sel_validateRecordForTracker_, v4))
  {
    if (__CPLCheckOriginalResourceInMaster && -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8))
    {
      -[CPLMasterChange resourceForType:](self, "resourceForType:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v19 = self;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Client pushed a master with a missing original: %@", buf, 0xCu);
          }
          goto LABEL_16;
        }
LABEL_17:
        objc_msgSend(v4, "pushChangeTasks");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addTask:forRecordWithScopedIdentifier:", 0, v15);

        v13 = 0;
LABEL_20:

        goto LABEL_21;
      }
      -[CPLRecordChange _unscopedIdentifier](self, "_unscopedIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fingerPrint");
      v8 = objc_claimAutoreleasedReturnValue();

      if (v6 && v8)
      {
        v9 = objc_msgSend((id)v6, "isEqual:", v8);

        if ((v9 & 1) == 0)
          goto LABEL_8;
      }
      else
      {

        if (v6 | v8)
        {
LABEL_8:
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v5, "identity");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "fingerPrint");
              v12 = (CPLMasterChange *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v19 = v12;
              v20 = 2112;
              v21 = self;
              _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Client pushed a master with a mismatched original finger print %@: %@", buf, 0x16u);

            }
LABEL_16:

            goto LABEL_17;
          }
          goto LABEL_17;
        }
      }
      v13 = 1;
      goto LABEL_20;
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
LABEL_21:

  return v13;
}

@end
