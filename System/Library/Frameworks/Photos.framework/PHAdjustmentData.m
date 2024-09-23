@implementation PHAdjustmentData

- (BOOL)_hasAdjustments
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PHAdjustmentData data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (PHAdjustmentData)initWithFormatIdentifier:(NSString *)formatIdentifier formatVersion:(NSString *)formatVersion data:(NSData *)data
{
  return -[PHAdjustmentData initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:](self, "initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:", formatIdentifier, formatVersion, &unk_1E3655A08, data);
}

- (PHAdjustmentData)initWithFormatIdentifier:(id)a3 formatVersion:(id)a4 adjustmentRenderType:(id)a5 data:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PHAdjustmentData *v14;
  uint64_t v15;
  NSString *formatIdentifier;
  uint64_t v17;
  NSString *formatVersion;
  unsigned int v19;
  uint64_t v20;
  NSDate *adjustmentTimestamp;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PHAdjustmentData;
  v14 = -[PHAdjustmentData init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    formatIdentifier = v14->_formatIdentifier;
    v14->_formatIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    formatVersion = v14->_formatVersion;
    v14->_formatVersion = (NSString *)v17;

    objc_storeStrong((id *)&v14->_data, a6);
    v14->_baseVersion = 0;
    if (v12)
      v19 = objc_msgSend(v12, "unsignedIntegerValue");
    else
      v19 = 0;
    v14->_adjustmentRenderTypes = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    adjustmentTimestamp = v14->_adjustmentTimestamp;
    v14->_adjustmentTimestamp = (NSDate *)v20;

  }
  return v14;
}

- (BOOL)isOpaque
{
  void *v2;
  char v3;

  -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", PHAdjustmentDataOpaqueFormatIdentifier);

  return v3;
}

- (PHAdjustmentData)initWithCoder:(id)a3
{
  id v4;
  PHAdjustmentData *v5;
  uint64_t v6;
  NSString *formatIdentifier;
  uint64_t v8;
  NSString *formatVersion;
  uint64_t v10;
  NSData *data;
  uint64_t v12;
  NSString *editorBundleID;
  uint64_t v14;
  NSDate *adjustmentTimestamp;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHAdjustmentData;
  v5 = -[PHAdjustmentData init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    formatIdentifier = v5->_formatIdentifier;
    v5->_formatIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    formatVersion = v5->_formatVersion;
    v5->_formatVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v5->_baseVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("baseVersion"));
    v5->_adjustmentRenderTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adjustmentRenderTypes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("editorBundleID"));
    v12 = objc_claimAutoreleasedReturnValue();
    editorBundleID = v5->_editorBundleID;
    v5->_editorBundleID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustmentTimestamp"));
    v14 = objc_claimAutoreleasedReturnValue();
    adjustmentTimestamp = v5->_adjustmentTimestamp;
    v5->_adjustmentTimestamp = (NSDate *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *formatIdentifier;
  id v5;

  formatIdentifier = self->_formatIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", formatIdentifier, CFSTR("formatIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatVersion, CFSTR("formatVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_baseVersion, CFSTR("baseVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_adjustmentRenderTypes, CFSTR("adjustmentRenderTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_editorBundleID, CFSTR("editorBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adjustmentTimestamp, CFSTR("adjustmentTimestamp"));

}

- (PHAdjustmentData)initWithDataUsingAssetResourceEncoding:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  PHAdjustmentData *v9;
  void *v10;
  void *v11;
  void *v12;
  PHAdjustmentData *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73380]);
    v9 = (PHAdjustmentData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73388]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73390]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73370]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:](self, "initWithFormatIdentifier:formatVersion:adjustmentRenderType:data:", v9, v10, v11, v12);

    if (v13)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73378]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAdjustmentData setEditorBundleID:](v13, "setEditorBundleID:", v14);

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73368]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAdjustmentData setBaseVersion:](v13, "setBaseVersion:", objc_msgSend(v15, "integerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D73398]);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PHAdjustmentData setAdjustmentTimestamp:](v13, "setAdjustmentTimestamp:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v17;
      if (a4)
      {
        v16 = objc_retainAutorelease(v17);
        *a4 = v16;
      }
    }

    self = v9;
  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v13;
}

- (id)dataUsingAssetResourceEncoding:(id *)a3
{
  id v5;
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
  id v17;
  void *v18;
  id v20;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0D73380]);

  -[PHAdjustmentData formatVersion](self, "formatVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x1E0D73388]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHAdjustmentData baseVersion](self, "baseVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x1E0D73368]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PHAdjustmentData adjustmentRenderTypes](self, "adjustmentRenderTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, *MEMORY[0x1E0D73390]);

  -[PHAdjustmentData editorBundleID](self, "editorBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PHAdjustmentData editorBundleID](self, "editorBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, *MEMORY[0x1E0D73378]);

  }
  -[PHAdjustmentData adjustmentTimestamp](self, "adjustmentTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PHAdjustmentData adjustmentTimestamp](self, "adjustmentTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, *MEMORY[0x1E0D73398]);

  }
  -[PHAdjustmentData data](self, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PHAdjustmentData data](self, "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, *MEMORY[0x1E0D73370]);

  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  v18 = v17;
  if (!v16 && a3)
    *a3 = objc_retainAutorelease(v17);

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHAdjustmentData;
  -[PHAdjustmentData description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAdjustmentData formatVersion](self, "formatVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHAdjustmentData adjustmentRenderTypes](self, "adjustmentRenderTypes");
  -[PHAdjustmentData data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAdjustmentData data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" identifier=%@ version=%@ renderType=%u data=%p (%lu)"), v4, v5, v6, v7, objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (void)setFormatIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)adjustmentTimestamp
{
  return self->_adjustmentTimestamp;
}

- (void)setAdjustmentTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)editorBundleID
{
  return self->_editorBundleID;
}

- (void)setEditorBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (void)setBaseVersion:(int64_t)a3
{
  self->_baseVersion = a3;
}

- (unsigned)adjustmentRenderTypes
{
  return self->_adjustmentRenderTypes;
}

- (void)setAdjustmentRenderTypes:(unsigned int)a3
{
  self->_adjustmentRenderTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorBundleID, 0);
  objc_storeStrong((id *)&self->_adjustmentTimestamp, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_formatIdentifier, 0);
}

+ (id)opaqueAdjustmentData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  PHAdjustmentData *v6;
  PHAdjustmentData *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v4)
  {
    v6 = [PHAdjustmentData alloc];
    v7 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:data:](v6, "initWithFormatIdentifier:formatVersion:data:", PHAdjustmentDataOpaqueFormatIdentifier, CFSTR("1.0"), v4);
  }
  else
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive date (now), error: %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

+ (int64_t)imageRequestVersionFromAdjustmentBaseVersion:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 1;
  else
    return qword_19944AA50[a3];
}

+ (int64_t)adjustmentBaseVersionFromImageRequestVersion:(int64_t)a3
{
  if (a3)
    return a3 == 8;
  else
    return 2;
}

+ (int64_t)videoRequestVersionFromAdjustmentBaseVersion:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 1;
  else
    return qword_19944AA50[a3];
}

+ (int64_t)adjustmentBaseVersionFromVideoRequestVersion:(int64_t)a3
{
  if (a3)
    return a3 == 8;
  else
    return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_contentEditing_containsValidAdjustment
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PHAdjustmentData data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_contentEditing_readableByClientWithVerificationBlock:(id)a3
{
  uint64_t (**v4)(id, PHAdjustmentData *);
  NSObject *v5;
  const char *v6;
  int v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, PHAdjustmentData *))a3;
  if (-[PHAdjustmentData isOpaque](self, "isOpaque"))
  {
    PLImageManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      v6 = "[RM] Checking adjustment data - is opaque";
LABEL_11:
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v10, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v4)
  {
    PLImageManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      v6 = "[RM] Checking adjustment data - client did not provide verification block";
      goto LABEL_11;
    }
LABEL_12:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  v7 = v4[2](v4, self);
  PLImageManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("N");
    if (v7)
      v8 = CFSTR("Y");
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "[RM] Checking adjustment data - client can handle current adjustments: %@", (uint8_t *)&v10, 0xCu);
  }
LABEL_13:

  return v7;
}

- (int64_t)_contentEditing_requiredBaseVersionReadableByClient:(BOOL *)a3 verificationBlock:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PHAdjustmentData _contentEditing_containsValidAdjustment](self, "_contentEditing_containsValidAdjustment"))
  {
    v7 = -[PHAdjustmentData _contentEditing_readableByClientWithVerificationBlock:](self, "_contentEditing_readableByClientWithVerificationBlock:", v6);
    v8 = (void *)MEMORY[0x1E0D75308];
    -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAdjustmentData formatVersion](self, "formatVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isRecognizedSlowMotionFormatWithIdentifier:version:", v9, v10);

    if (v11)
      v12 = 0;
    else
      v12 = 2;
    if ((v11 & 1) == 0 && v7)
      v12 = -[PHAdjustmentData baseVersion](self, "baseVersion") != 0;
    if (a3)
      *a3 = v7;
  }
  else
  {
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PHAdjustmentData formatIdentifier](self, "formatIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAdjustmentData data](self, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v14;
      v19 = 2048;
      v20 = objc_msgSend(v15, "length");
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_ERROR, "[RM] Inavlid adjustment data, format ID: %@, data length :%lu", (uint8_t *)&v17, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

@end
