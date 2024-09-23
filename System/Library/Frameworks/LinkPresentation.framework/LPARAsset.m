@implementation LPARAsset

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPARAsset;
  v5 = -[LPVisualMedia _initByReferencingFileURL:MIMEType:properties:](&v9, sel__initByReferencingFileURL_MIMEType_properties_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (LPARAsset)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  LPARAsset *v5;
  LPARAsset *v6;
  LPARAsset *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPARAsset;
  v5 = -[LPVisualMedia _initWithData:MIMEType:properties:](&v9, sel__initWithData_MIMEType_properties_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)_initWithARAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MIMEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)LPARAsset;
  v9 = -[LPVisualMedia _initWithData:fileURL:MIMEType:properties:](&v12, sel__initWithData_fileURL_MIMEType_properties_, v5, v6, v7, v8);

  if (v9)
    v10 = v9;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_createTemporaryFileAndWriteData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("usdz"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPVisualMedia data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "writeToURL:atomically:", v9, 1);

  objc_storeStrong((id *)&self->_temporaryFileURL, v9);
  return v9;
}

- (id)_ensureTemporaryAssetURL
{
  NSURL *v3;

  if (-[NSURL isFileURL](self->_temporaryFileURL, "isFileURL"))
  {
    v3 = self->_temporaryFileURL;
  }
  else
  {
    -[LPARAsset _createTemporaryFileAndWriteData](self, "_createTemporaryFileAndWriteData");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LPARAsset;
  -[LPVisualMedia encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (LPARAsset)initWithCoder:(id)a3
{
  id v4;
  LPARAssetProperties *v5;
  void *v6;
  LPARAsset *v7;
  LPARAsset *v8;
  LPARAsset *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(LPARAssetProperties);
  objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", CFSTR("accessibilityText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPVisualMediaProperties setAccessibilityText:](v5, "setAccessibilityText:", v6);

  v11.receiver = self;
  v11.super_class = (Class)LPARAsset;
  v7 = -[LPVisualMedia initWithCoder:properties:](&v11, sel_initWithCoder_properties_, v4, v5);
  v8 = v7;
  if (v7)
    v9 = v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LPARAsset;
  if (-[LPVisualMedia isEqual:](&v7, sel_isEqual_, v4))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

@end
