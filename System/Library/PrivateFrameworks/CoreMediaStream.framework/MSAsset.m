@implementation MSAsset

- (MSAsset)initWithGUID:(id)a3
{
  id v5;
  MSAsset *v6;
  MSAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSAsset;
  v6 = -[MSAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_GUID, a3);
    v7->_mediaAssetType = 0;
    v7->_assetDataAvailableOnServer = 1;
  }

  return v7;
}

- (MSAsset)init
{
  void *v3;
  MSAsset *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MSAsset initWithGUID:](self, "initWithGUID:", v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSAsset;
  -[MSAsset description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_GUID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" GUID: %@ "), self->_GUID);
  if (self->_assetCollectionGUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("Asset collection GUID: %@ "), self->_assetCollectionGUID);
  v5 = self->_path;
  if (v5 && (os_trace_get_mode() & 0x1000000) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR("Path: %@ "), v5);
  if (_thePlatform && objc_msgSend((id)_thePlatform, "shouldLogAtLevel:", 7))
  {
    if (-[NSDictionary count](self->_metadata, "count"))
      objc_msgSend(v4, "appendFormat:", CFSTR("\nmetadata: %@"), self->_metadata);
    if (self->_type)
      objc_msgSend(v4, "appendFormat:", CFSTR("  type: %@\n"), self->_type);
    if (self->_masterAssetHash)
      objc_msgSend(v4, "appendFormat:", CFSTR("  master asset hash: %@\n"), self->_masterAssetHash);
    if (self->_fileHash)
      objc_msgSend(v4, "appendFormat:", CFSTR("  file hash: %@\n"), self->_fileHash);
    if (self->_MMCSAccessHeader)
      objc_msgSend(v4, "appendFormat:", CFSTR("  MMCS header:%@\n"), self->_MMCSAccessHeader);
    if (self->_MMCSAccessHeaderTimeStamp)
      objc_msgSend(v4, "appendFormat:", CFSTR("  MMCS Header set on: %@"), self->_MMCSAccessHeaderTimeStamp);
    if (self->_MMCSURL)
      objc_msgSend(v4, "appendFormat:", CFSTR("  MMCS URL: %@\n"), self->_MMCSURL);
    if (self->_MMCSReceipt)
      objc_msgSend(v4, "appendFormat:", CFSTR("  MMCS Receipt: %@\n"), self->_MMCSReceipt);
    if (self->_fileData)
      objc_msgSend(v4, "appendFormat:", CFSTR("  File data present.\n"));
    if (self->_batchCreationDate)
      objc_msgSend(v4, "appendFormat:", CFSTR("  Batch creation date: %@\n"), self->_batchCreationDate);
    if (self->_photoCreationDate)
      objc_msgSend(v4, "appendFormat:", CFSTR("  Asset creation date: %@\n"), self->_photoCreationDate);
    if (-[MSAsset isPhoto](self, "isPhoto"))
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("  Asset is photo\n"));
      objc_msgSend(v4, "appendFormat:", CFSTR("  Media Asset Type %ld\n"), -[MSAsset mediaAssetType](self, "mediaAssetType"));
    }
    if (-[MSAsset isVideo](self, "isVideo"))
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("  Asset is video\n"));
      objc_msgSend(v4, "appendFormat:", CFSTR("  Media Asset Type %ld\n"), -[MSAsset mediaAssetType](self, "mediaAssetType"));
    }
    if (self->_assetDataAvailableOnServer)
      v6 = &stru_1E95BDC28;
    else
      v6 = CFSTR("not");
    objc_msgSend(v4, "appendFormat:", CFSTR("  Asset data is %@ available on server\n"), v6);
    objc_msgSend(v4, "appendFormat:", CFSTR("  protocol file size:%lld\n"), self->_protocolFileSize);
  }

  return (NSString *)v4;
}

- (BOOL)isPhoto
{
  return self->_mediaAssetType - 1 < 3;
}

- (BOOL)isVideo
{
  return (self->_mediaAssetType & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (unint64_t)_fileSize
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (unsigned)MMCSItemFlags
{
  return 1;
}

- (void)setMMCSItemFlags:(unsigned int)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Ignoring attempt to set MMCS Item Flags on an MSAsset.", v3, 2u);
  }
}

- (unint64_t)MMCSItemID
{
  void *v2;
  unint64_t v3;

  -[MSAsset metadataValueForKey:](self, "metadataValueForKey:", CFSTR("MSAssetMetadataItemID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (void)setMMCSItemID:(unint64_t)a3
{
  void *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  MSAsset *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218242;
    v7 = a3;
    v8 = 2114;
    v9 = self;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Setting MMCS Item ID to %lld for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSAsset addMetadataValue:forKey:](self, "addMetadataValue:forKey:", v5, CFSTR("MSAssetMetadataItemID"));

}

- (int)MMCSOpenNewFileDescriptor
{
  void *v3;
  id v4;
  int v5;

  -[MSAsset path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -1;
  -[MSAsset path](self, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0);

  return v5;
}

- (id)MMCSItemType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[MSAsset path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || !objc_msgSend(v4, "length"))
  {
    -[MSAsset MMCSUTI](self, "MMCSUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "preferredFilenameExtension");
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v8;
      }
    }

  }
  return v4;
}

- (void)setMMCSAccessHeader:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MSAsset setMMCSAccessHeader:andTimeStamp:](self, "setMMCSAccessHeader:andTimeStamp:", v5, v6);

}

- (void)setMMCSAccessHeader:(id)a3 andTimeStamp:(id)a4
{
  NSString *v6;
  NSDate *v7;
  NSString *MMCSAccessHeader;
  NSDate *MMCSAccessHeaderTimeStamp;
  NSString *v10;

  v6 = (NSString *)a3;
  v7 = (NSDate *)a4;
  MMCSAccessHeader = self->_MMCSAccessHeader;
  self->_MMCSAccessHeader = v6;
  v10 = v6;

  MMCSAccessHeaderTimeStamp = self->_MMCSAccessHeaderTimeStamp;
  self->_MMCSAccessHeaderTimeStamp = v7;

}

- (unint64_t)_fileSizeOnDisk
{
  void *v3;
  void *v4;
  NSString *path;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSString *v12;
  id v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_path && objc_msgSend(v3, "fileExistsAtPath:"))
  {
    path = self->_path;
    v13 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", path, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = self->_path;
        *(_DWORD *)buf = 138412546;
        v15 = v12;
        v16 = 2114;
        v17 = v7;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can't query for file size at path %@. Error: %{public}@", buf, 0x16u);
      }
      -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedLongLongValue");

    }
    else
    {
      v9 = objc_msgSend(v6, "fileSize");
    }

  }
  else
  {
    -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "unsignedLongLongValue");

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MSAsset *v4;
  MSAsset *v5;
  NSString *GUID;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  NSData *fileHash;
  void *v16;
  objc_super v17;

  v4 = (MSAsset *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      GUID = self->_GUID;
      -[MSAsset GUID](v5, "GUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(GUID) = -[NSString isEqualToString:](GUID, "isEqualToString:", v7);

      if ((GUID & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        -[MSAsset assetCollectionGUID](self, "assetCollectionGUID");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v8 = 0;
        }
        else
        {
          -[MSAsset assetCollectionGUID](v5, "assetCollectionGUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v8 = 0;
            goto LABEL_12;
          }
          -[NSDictionary objectForKey:](self->_metadata, "objectForKey:", CFSTR("MSAssetMetadataAssetFileTransferUUID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSAsset metadataValueForKey:](v5, "metadataValueForKey:", CFSTR("MSAssetMetadataAssetFileTransferUUID"));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v10 && v13)
          {
            v8 = objc_msgSend(v10, "isEqualToString:", v13);
          }
          else
          {
            fileHash = self->_fileHash;
            -[MSAsset fileHash](v5, "fileHash");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[NSData isEqual:](fileHash, "isEqual:", v16);

          }
        }

      }
LABEL_12:

      goto LABEL_13;
    }
    v17.receiver = self;
    v17.super_class = (Class)MSAsset;
    v8 = -[MSAsset isEqual:](&v17, sel_isEqual_, v4);
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSString *GUID;
  objc_super v5;

  GUID = self->_GUID;
  if (GUID)
    return -[NSString hash](GUID, "hash");
  v5.receiver = self;
  v5.super_class = (Class)MSAsset;
  return -[MSAsset hash](&v5, sel_hash);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *masterAssetHash;
  MSAsset *v6;
  NSDictionary *metadata;
  NSData *fileHash;
  NSString *path;
  NSData *fileData;
  NSString *type;
  NSString *MMCSAccessHeader;
  NSDate *MMCSAccessHeaderTimeStamp;
  NSURL *MMCSURL;
  void *v15;
  NSString *MMCSReceipt;
  void *v17;
  NSString *GUID;
  NSString *assetCollectionGUID;
  NSDate *batchCreationDate;
  NSDate *photoCreationDate;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  masterAssetHash = self->_masterAssetHash;
  v24 = v4;
  if (masterAssetHash)
    objc_msgSend(v4, "encodeObject:forKey:", masterAssetHash, CFSTR("masterAssetHash"));
  v6 = self;
  objc_sync_enter(v6);
  metadata = v6->_metadata;
  if (metadata)
    objc_msgSend(v24, "encodeObject:forKey:", metadata, CFSTR("metadata"));
  objc_sync_exit(v6);

  fileHash = v6->_fileHash;
  if (fileHash)
    objc_msgSend(v24, "encodeObject:forKey:", fileHash, CFSTR("fileHash"));
  path = v6->_path;
  if (path)
    objc_msgSend(v24, "encodeObject:forKey:", path, CFSTR("path"));
  fileData = v6->_fileData;
  if (fileData)
    objc_msgSend(v24, "encodeObject:forKey:", fileData, CFSTR("fileData"));
  type = v6->_type;
  if (type)
    objc_msgSend(v24, "encodeObject:forKey:", type, CFSTR("type"));
  MMCSAccessHeader = v6->_MMCSAccessHeader;
  if (MMCSAccessHeader)
    objc_msgSend(v24, "encodeObject:forKey:", MMCSAccessHeader, CFSTR("MMCSAccessHeader"));
  MMCSAccessHeaderTimeStamp = v6->_MMCSAccessHeaderTimeStamp;
  if (MMCSAccessHeaderTimeStamp)
    objc_msgSend(v24, "encodeObject:forKey:", MMCSAccessHeaderTimeStamp, CFSTR("MMCSAccessHeaderTimeStamp"));
  MMCSURL = v6->_MMCSURL;
  if (MMCSURL)
  {
    -[NSURL absoluteString](MMCSURL, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v15, CFSTR("MMCSURL"));

  }
  MMCSReceipt = v6->_MMCSReceipt;
  v17 = v24;
  if (MMCSReceipt)
  {
    objc_msgSend(v24, "encodeObject:forKey:", MMCSReceipt, CFSTR("MMCSReceipt"));
    v17 = v24;
  }
  objc_msgSend(v17, "encodeInt64:forKey:", v6->_protocolFileSize, CFSTR("protocolFileSize"));
  GUID = v6->_GUID;
  if (GUID)
    objc_msgSend(v24, "encodeObject:forKey:", GUID, CFSTR("GUID"));
  assetCollectionGUID = v6->_assetCollectionGUID;
  if (assetCollectionGUID)
    objc_msgSend(v24, "encodeObject:forKey:", assetCollectionGUID, CFSTR("assetCollectionGUID"));
  batchCreationDate = v6->_batchCreationDate;
  if (batchCreationDate)
    objc_msgSend(v24, "encodeObject:forKey:", batchCreationDate, CFSTR("batchCreationDate"));
  photoCreationDate = v6->_photoCreationDate;
  if (photoCreationDate)
    objc_msgSend(v24, "encodeObject:forKey:", photoCreationDate, CFSTR("photoCreationDate"));
  -[MSAsset userInfo](v6, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[MSAsset userInfo](v6, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("userInfo"));

  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[MSAsset mediaAssetType](v6, "mediaAssetType"), CFSTR("mediaAssetType"));
  objc_msgSend(v24, "encodeBool:forKey:", -[MSAsset assetDataAvailableOnServer](v6, "assetDataAvailableOnServer"), CFSTR("assetDataAvailableOnServer"));

}

- (MSAsset)initWithCoder:(id)a3
{
  id v4;
  MSAsset *v5;
  uint64_t v6;
  NSData *masterAssetHash;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *metadata;
  uint64_t v18;
  NSData *fileHash;
  uint64_t v20;
  NSString *path;
  uint64_t v22;
  NSData *fileData;
  uint64_t v24;
  NSString *type;
  uint64_t v26;
  NSString *MMCSAccessHeader;
  uint64_t v28;
  NSDate *MMCSAccessHeaderTimeStamp;
  uint64_t v30;
  NSString *MMCSReceipt;
  void *v32;
  uint64_t v33;
  NSURL *MMCSURL;
  uint64_t v35;
  NSString *GUID;
  uint64_t v37;
  NSString *assetCollectionGUID;
  uint64_t v39;
  NSDate *batchCreationDate;
  uint64_t v41;
  NSDate *photoCreationDate;
  void *v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MSAsset;
  v5 = -[MSAsset init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("masterAssetHash"));
    v6 = objc_claimAutoreleasedReturnValue();
    masterAssetHash = v5->_masterAssetHash;
    v5->_masterAssetHash = (NSData *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("metadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileHash"));
    v18 = objc_claimAutoreleasedReturnValue();
    fileHash = v5->_fileHash;
    v5->_fileHash = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v20 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileData"));
    v22 = objc_claimAutoreleasedReturnValue();
    fileData = v5->_fileData;
    v5->_fileData = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v24 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MMCSAccessHeader"));
    v26 = objc_claimAutoreleasedReturnValue();
    MMCSAccessHeader = v5->_MMCSAccessHeader;
    v5->_MMCSAccessHeader = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MMCSAccessHeaderTimeStamp"));
    v28 = objc_claimAutoreleasedReturnValue();
    MMCSAccessHeaderTimeStamp = v5->_MMCSAccessHeaderTimeStamp;
    v5->_MMCSAccessHeaderTimeStamp = (NSDate *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MMCSReceipt"));
    v30 = objc_claimAutoreleasedReturnValue();
    MMCSReceipt = v5->_MMCSReceipt;
    v5->_MMCSReceipt = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MMCSURL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v32);
      MMCSURL = v5->_MMCSURL;
      v5->_MMCSURL = (NSURL *)v33;

    }
    v5->_protocolFileSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("protocolFileSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GUID"));
    v35 = objc_claimAutoreleasedReturnValue();
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetCollectionGUID"));
    v37 = objc_claimAutoreleasedReturnValue();
    assetCollectionGUID = v5->_assetCollectionGUID;
    v5->_assetCollectionGUID = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batchCreationDate"));
    v39 = objc_claimAutoreleasedReturnValue();
    batchCreationDate = v5->_batchCreationDate;
    v5->_batchCreationDate = (NSDate *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoCreationDate"));
    v41 = objc_claimAutoreleasedReturnValue();
    photoCreationDate = v5->_photoCreationDate;
    v5->_photoCreationDate = (NSDate *)v41;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("userInfo"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSAsset setUserInfo:](v5, "setUserInfo:", v43);

    v5->_mediaAssetType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mediaAssetType"));
    v5->_assetDataAvailableOnServer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetDataAvailableOnServer"));

  }
  return v5;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  MSAsset *v7;
  NSDictionary *metadata;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  metadata = v7->_metadata;
  if (metadata)
    v9 = (NSDictionary *)-[NSDictionary mutableCopy](metadata, "mutableCopy");
  else
    v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (v12)
    -[NSDictionary setObject:forKey:](v9, "setObject:forKey:", v12, v6);
  else
    -[NSDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);
  v11 = v7->_metadata;
  v7->_metadata = v10;

  objc_sync_exit(v7);
}

- (id)metadataValueForKey:(id)a3
{
  id v4;
  MSAsset *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSDictionary objectForKey:](v5->_metadata, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed to archive an MSAsset object. Error: %@ Info: %@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3710], "MSSafeUnarchiveObjectWithData:outError:", v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)masterAssetHash
{
  return self->_masterAssetHash;
}

- (void)setMasterAssetHash:(id)a3
{
  objc_storeStrong((id *)&self->_masterAssetHash, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSURL)MMCSURL
{
  return self->_MMCSURL;
}

- (void)setMMCSURL:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSURL, a3);
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
  objc_storeStrong((id *)&self->_fileData, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)MMCSUTI
{
  return self->_type;
}

- (void)setMMCSUTI:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSData)MMCSHash
{
  return self->_fileHash;
}

- (void)setMMCSHash:(id)a3
{
  objc_storeStrong((id *)&self->_fileHash, a3);
}

- (unint64_t)MMCSItemSize
{
  return self->_protocolFileSize;
}

- (void)setMMCSItemSize:(unint64_t)a3
{
  self->_protocolFileSize = a3;
}

- (NSString)MMCSAccessHeader
{
  return self->_MMCSAccessHeader;
}

- (NSDate)MMCSAccessHeaderTimeStamp
{
  return self->_MMCSAccessHeaderTimeStamp;
}

- (void)setMMCSAccessHeaderTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSAccessHeaderTimeStamp, a3);
}

- (NSString)MMCSReceipt
{
  return self->_MMCSReceipt;
}

- (void)setMMCSReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSReceipt, a3);
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_storeStrong((id *)&self->_GUID, a3);
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setAssetCollectionGUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionGUID, a3);
}

- (NSDate)batchCreationDate
{
  return self->_batchCreationDate;
}

- (void)setBatchCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_batchCreationDate, a3);
}

- (NSDate)photoCreationDate
{
  return self->_photoCreationDate;
}

- (void)setPhotoCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_photoCreationDate, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (unint64_t)mediaAssetType
{
  return self->_mediaAssetType;
}

- (void)setMediaAssetType:(unint64_t)a3
{
  self->_mediaAssetType = a3;
}

- (BOOL)assetDataAvailableOnServer
{
  return self->_assetDataAvailableOnServer;
}

- (void)setAssetDataAvailableOnServer:(BOOL)a3
{
  self->_assetDataAvailableOnServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_photoCreationDate, 0);
  objc_storeStrong((id *)&self->_batchCreationDate, 0);
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_MMCSReceipt, 0);
  objc_storeStrong((id *)&self->_MMCSAccessHeaderTimeStamp, 0);
  objc_storeStrong((id *)&self->_MMCSAccessHeader, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_MMCSURL, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_masterAssetHash, 0);
}

+ (id)asset
{
  return objc_alloc_init((Class)a1);
}

+ (id)assetWithAsset:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "GUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithGUID:", v6);

  objc_msgSend(v4, "masterAssetHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMasterAssetHash:", v8);

  objc_msgSend(v4, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMetadata:", v9);

  objc_msgSend(v4, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", v10);

  objc_msgSend(v4, "MMCSURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSURL:", v11);

  objc_msgSend(v4, "fileData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFileData:", v12);

  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setError:", v13);

  objc_msgSend(v4, "MMCSUTI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSUTI:", v14);

  objc_msgSend(v4, "MMCSHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSHash:", v15);

  objc_msgSend(v4, "MMCSURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSURL:", v16);

  objc_msgSend(v7, "setMMCSItemSize:", objc_msgSend(v4, "MMCSItemSize"));
  objc_msgSend(v4, "MMCSAccessHeader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MMCSAccessHeaderTimeStamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSAccessHeader:andTimeStamp:", v17, v18);

  objc_msgSend(v4, "MMCSReceipt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMMCSReceipt:", v19);

  objc_msgSend(v4, "assetCollectionGUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssetCollectionGUID:", v20);

  objc_msgSend(v4, "batchCreationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBatchCreationDate:", v21);

  objc_msgSend(v4, "photoCreationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhotoCreationDate:", v22);

  objc_msgSend(v4, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v7, "setUserInfo:", v24);

  objc_msgSend(v7, "setMediaAssetType:", objc_msgSend(v4, "mediaAssetType"));
  v25 = objc_msgSend(v4, "assetDataAvailableOnServer");

  objc_msgSend(v7, "setAssetDataAvailableOnServer:", v25);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)MSASPProtocolDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
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
  uint8_t buf[4];
  MSAsset *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSAsset metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[MSAsset type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSAsset type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("type"));

  }
  if (-[MSAsset isVideo](self, "isVideo"))
  {
    v8 = -[MSAsset mediaAssetType](self, "mediaAssetType") - 4;
    if (v8 >= 4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v23 = self;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found an unknown video asset type", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", off_1E95BCC48[v8], CFSTR("videoType"));
    }
  }
  -[MSAsset MMCSHash](self, "MMCSHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSAsset MMCSHash](self, "MMCSHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MSHexString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("checksum"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v12, "unsignedLongLongValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("size"));

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("MSAssetMetadataFileSize"));
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MSAssetMetadataPixelWidth"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v15, "unsignedLongValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("width"));

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("MSAssetMetadataPixelWidth"));
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("MSAssetMetadataPixelHeight"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v18, "unsignedLongValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("height"));

    objc_msgSend(v5, "removeObjectForKey:", CFSTR("MSAssetMetadataPixelHeight"));
  }
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("MSAssetMetadataItemID"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metadata"));

  return v3;
}

+ (id)MSASPAssetFromProtocolDictionary:(id)a3
{
  id v3;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MSAsset asset](MSAsset, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "objectForKey:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("metadata"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("height"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("height"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", strtoul((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0, 10));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("MSAssetMetadataPixelHeight"));

    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("width"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", strtoul((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), 0, 10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("MSAssetMetadataPixelWidth"));

    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("size"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("size"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), 0, 10));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("MSAssetMetadataFileSize"));

    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("checksum"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("checksum"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "MSHexData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMMCSHash:", v15);

    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("type"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setType:", v16);
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("videoType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("MSAssetMetadataAssetType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("thumbnail")))
      {
        v22 = v4;
        v23 = 2;
      }
      else
      {
        if (!objc_msgSend(v21, "isEqualToString:", CFSTR("derivative")))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v28 = a1;
            v29 = 2114;
            v30 = v21;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found an unsupported photoType %{public}@", buf, 0x16u);
          }
          goto LABEL_36;
        }
        v22 = v4;
        v23 = 3;
      }
      objc_msgSend(v22, "setMediaAssetType:", v23);
    }
LABEL_36:

    goto LABEL_37;
  }
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("videoType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("PosterFrame")))
  {
    v18 = v4;
    v19 = 5;
LABEL_33:
    objc_msgSend(v18, "setMediaAssetType:", v19);
    goto LABEL_37;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("360p")))
  {
    v18 = v4;
    v19 = 6;
    goto LABEL_33;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("720p")))
  {
    v18 = v4;
    v19 = 7;
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v28 = a1;
    v29 = 2114;
    v30 = v17;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found an unsupported videoType %{public}@", buf, 0x16u);
  }
LABEL_37:
  objc_msgSend(v5, "objectForKey:", CFSTR("uploadpending"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("uploadpending"));
    if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = a1;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Found uploadpending flag for non-video asset", buf, 0xCu);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v24, "isEqualToString:", CFSTR("1")))
      objc_msgSend(v4, "setAssetDataAvailableOnServer:", 0);
  }
  objc_msgSend(v4, "setMetadata:", v7);

  return v4;
}

@end
