@implementation CPLRecordComputeState

- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 fileStorageIdentifier:(id)a4 version:(id)a5 fileURL:(id)a6 adjustmentFingerprint:(id)a7 lastUpdatedDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CPLRecordComputeState *v20;
  uint64_t v21;
  CPLScopedIdentifier *itemScopedIdentifier;
  uint64_t v23;
  NSString *fileStorageIdentifier;
  uint64_t v25;
  NSString *version;
  uint64_t v27;
  NSURL *fileURL;
  uint64_t v29;
  NSString *adjustmentFingerprint;
  uint64_t v31;
  NSDate *lastUpdatedDate;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CPLRecordComputeState;
  v20 = -[CPLRecordComputeState init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    itemScopedIdentifier = v20->_itemScopedIdentifier;
    v20->_itemScopedIdentifier = (CPLScopedIdentifier *)v21;

    v23 = objc_msgSend(v15, "copy");
    fileStorageIdentifier = v20->_fileStorageIdentifier;
    v20->_fileStorageIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    version = v20->_version;
    v20->_version = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v27;

    v29 = objc_msgSend(v18, "copy");
    adjustmentFingerprint = v20->_adjustmentFingerprint;
    v20->_adjustmentFingerprint = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    lastUpdatedDate = v20->_lastUpdatedDate;
    v20->_lastUpdatedDate = (NSDate *)v31;

  }
  return v20;
}

- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 version:(id)a4 fileURL:(id)a5 adjustmentFingerprint:(id)a6 lastUpdatedDate:(id)a7
{
  return -[CPLRecordComputeState initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:](self, "initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:", a3, 0, a4, a5, a6, a7);
}

- (id)copyAddingFileURL:(id)a3
{
  id v4;
  CPLRecordComputeState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CPLRecordComputeState *v11;

  v4 = a3;
  v5 = [CPLRecordComputeState alloc];
  -[CPLRecordComputeState itemScopedIdentifier](self, "itemScopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordComputeState fileStorageIdentifier](self, "fileStorageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordComputeState version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordComputeState adjustmentFingerprint](self, "adjustmentFingerprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordComputeState lastUpdatedDate](self, "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CPLRecordComputeState initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:](v5, "initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:", v6, v7, v8, v4, v9, v10);

  return v11;
}

- (CPLRecordComputeState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CPLRecordComputeState *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemScopedIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileStorageIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustmentFingerprint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CPLRecordComputeState initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:](self, "initWithItemScopedIdentifier:fileStorageIdentifier:version:fileURL:adjustmentFingerprint:lastUpdatedDate:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  CPLScopedIdentifier *itemScopedIdentifier;
  id v5;

  itemScopedIdentifier = self->_itemScopedIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemScopedIdentifier, CFSTR("itemScopedIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileStorageIdentifier, CFSTR("fileStorageIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileURL, CFSTR("fileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adjustmentFingerprint, CFSTR("adjustmentFingerprint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));

}

- (id)description
{
  id v3;
  uint64_t v4;
  CPLScopedIdentifier *itemScopedIdentifier;
  NSString *version;
  NSString *fileStorageIdentifier;
  NSDate *lastUpdatedDate;
  NSURL *fileURL;
  NSString *adjustmentFingerprint;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  itemScopedIdentifier = self->_itemScopedIdentifier;
  version = self->_version;
  lastUpdatedDate = self->_lastUpdatedDate;
  fileStorageIdentifier = self->_fileStorageIdentifier;
  fileURL = self->_fileURL;
  adjustmentFingerprint = self->_adjustmentFingerprint;
  if (fileURL)
  {
    -[NSURL path](fileURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@ %@ %@ %@ %@>"), v4, itemScopedIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate, v11);

  }
  else
  {
    v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@ %@ %@ %@ %@>"), v4, itemScopedIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, self->_lastUpdatedDate, CFSTR("no file"));
  }
  return v12;
}

- (id)redactedDescription
{
  id v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  if (self->_fileURL)
    v5 = CFSTR("has file");
  else
    v5 = CFSTR("no file");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ %@ %@ %@ %@ %@>"), v4, self->_itemScopedIdentifier, self->_fileStorageIdentifier, self->_version, self->_adjustmentFingerprint, self->_lastUpdatedDate, v5);
}

- (CPLScopedIdentifier)itemScopedIdentifier
{
  return self->_itemScopedIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)adjustmentFingerprint
{
  return self->_adjustmentFingerprint;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSString)fileStorageIdentifier
{
  return self->_fileStorageIdentifier;
}

- (void)setFileStorageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileStorageIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_adjustmentFingerprint, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_itemScopedIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
