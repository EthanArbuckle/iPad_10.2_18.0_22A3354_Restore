@implementation PHImportAsset

- (BOOL)shouldPreserveUUID
{
  return 0;
}

- (NSObject)redactedFileNameDescription
{
  NSString *createdFileName;
  NSString *v4;
  PHImportAssetNameDescription *v5;

  createdFileName = self->_createdFileName;
  if (!createdFileName)
    createdFileName = self->_fileName;
  v4 = createdFileName;
  v5 = -[PHImportAssetNameDescription initWithFileName:uuid:]([PHImportAssetNameDescription alloc], "initWithFileName:uuid:", v4, self->_uuid);

  return v5;
}

- (void)updateIsRAW:(BOOL)a3 contentType:(id)a4
{
  _BOOL4 v5;
  id v7;
  id v8;

  v5 = a3;
  v7 = a4;
  if (v5)
  {
    self->_resourceSubType |= 8uLL;
    v8 = v7;
    objc_storeStrong((id *)&self->_contentType, a4);
    v7 = v8;
  }

}

- (BOOL)configureWithContentType:(id)a3 supportedMediaType:(unsigned __int8)a4
{
  int v4;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[PHImportAsset setContentType:](self, "setContentType:", v6);
    if (v4 > 15)
    {
      if (v4 != 16 && v4 != 32)
      {
        if (v4 == 64)
        {
          -[NSString pathExtension](self->_fileName, "pathExtension");
          v8 = objc_claimAutoreleasedReturnValue();
          -[NSObject uppercaseString](v8, "uppercaseString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PHImportAsset configureSidecarTypeForExtension:](self, "configureSidecarTypeForExtension:", v9);
          goto LABEL_18;
        }
LABEL_16:
        PLImportGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_19:

          goto LABEL_39;
        }
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Expected the asset '%@' to be of type image, movie, audio or sidecar", (uint8_t *)&v18, 0xCu);
LABEL_18:

        goto LABEL_19;
      }
      *(_OWORD *)&self->_resourceType = xmmword_19944ACA0;
      if (-[PHImportAsset isRender](self, "isRender"))
      {
        v10 = 6;
      }
      else if (-[PHImportAsset isSpatialOverCapture](self, "isSpatialOverCapture"))
      {
        v10 = 14;
      }
      else
      {
        if (!-[PHImportAsset isBase](self, "isBase"))
          goto LABEL_39;
        v10 = 12;
      }
LABEL_38:
      self->_resourceType = v10;
      goto LABEL_39;
    }
    if (v4 != 2)
    {
      if (v4 == 4 || v4 == 8)
      {
        *(_OWORD *)&self->_resourceType = xmmword_19944AC90;
LABEL_39:
        v7 = self->_resourceType != 0;
        goto LABEL_40;
      }
      goto LABEL_16;
    }
    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC530]))
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "jpeg2000Type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "conformsToType:", v12);

      if (v13)
      {
        v11 = 2048;
      }
      else
      {
        if (!objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC698]))
        {
          if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC600]))
          {
            self->_resourceSubType = 16;
            -[PHImportAsset url](self, "url");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[PHImportAsset determineIfTIFFIsRAW:url:](PHImportAsset, "determineIfTIFFIsRAW:url:", self, v14);

          }
          else
          {
            if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC5B8]))
            {
              v11 = 8;
              goto LABEL_28;
            }
            if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC4F8]))
            {
              v11 = 4096;
              goto LABEL_28;
            }
            if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC580]))
            {
              v11 = 0x2000;
              goto LABEL_28;
            }
            if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC570]))
            {
              v11 = 0x4000;
              goto LABEL_28;
            }
            objc_msgSend(MEMORY[0x1E0D752F0], "adobePhotoshopType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v6, "conformsToType:", v16);

            if (v17)
            {
              v11 = 0x8000;
              goto LABEL_28;
            }
          }
LABEL_29:
          if (-[PHImportAsset isRender](self, "isRender"))
          {
            v10 = 5;
          }
          else if (-[PHImportAsset isSpatialOverCapture](self, "isSpatialOverCapture"))
          {
            v10 = 13;
          }
          else if (-[PHImportAsset isBase](self, "isBase"))
          {
            v10 = 8;
          }
          else
          {
            v10 = 1;
          }
          goto LABEL_38;
        }
        v11 = 2;
      }
    }
LABEL_28:
    self->_resourceSubType = v11;
    goto LABEL_29;
  }
  v7 = 0;
LABEL_40:

  return v7;
}

- (PHImportAsset)initWithSource:(id)a3
{
  id v4;
  PHImportAsset *v5;
  void *v6;
  uint64_t v7;
  NSString *uuid;
  uint64_t v9;
  NSMutableDictionary *duplicates;
  dispatch_queue_t v11;
  OS_dispatch_queue *loadSidecars;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHImportAsset;
  v5 = -[PHImportAsset init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v9 = objc_opt_new();
    duplicates = v5->_duplicates;
    v5->_duplicates = (NSMutableDictionary *)v9;

    v11 = dispatch_queue_create("load sidecars saynchronizer", 0);
    loadSidecars = v5->_loadSidecars;
    v5->_loadSidecars = (OS_dispatch_queue *)v11;

    v5->_sidecarsLoaded = 0;
    *(_QWORD *)&v5->_metadataLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_source, v4);
  }

  return v5;
}

- (NSURL)securityScopedURL
{
  return 0;
}

- (void)configureSidecarTypeForExtension:(id)a3
{
  id v4;
  _BOOL4 v5;
  int64_t v6;
  __int128 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AAE")))
  {
    v5 = -[PHImportAsset isOriginalAdjustmentData](self, "isOriginalAdjustmentData");
    v6 = 7;
    if (v5)
      v6 = 16;
    self->_resourceType = v6;
    self->_resourceSubType = 256;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SLM")))
  {
    v7 = xmmword_19944ACD0;
LABEL_11:
    *(_OWORD *)&self->_resourceType = v7;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("XMP")))
  {
    v7 = xmmword_19944ACC0;
    goto LABEL_11;
  }
  if (-[PHImportAsset isAdjustmentSecondaryData](self, "isAdjustmentSecondaryData"))
  {
    v7 = xmmword_19944ACB0;
    goto LABEL_11;
  }
  PLImportGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unknown sidecar type: %@", (uint8_t *)&v10, 0xCu);

  }
LABEL_12:

}

- (PHImportAsset)initWithSource:(id)a3 url:(id)a4 type:(id)a5 supportedMediaType:(unsigned __int8)a6 uuid:(id)a7
{
  unsigned int v8;
  id v13;
  id v14;
  id v15;
  PHImportAsset *v16;
  PHImportAsset *v17;
  uint64_t v18;
  NSString *uuid;
  NSString *v20;
  NSString *fileName;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSDate *fileCreationDate;
  uint64_t v31;
  NSObject *p_super;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  BOOL v38;
  unsigned int v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _QWORD v45[4];

  v8 = a6;
  v45[3] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = -[PHImportAsset initWithSource:](self, "initWithSource:", a3);
  v17 = v16;
  if (v16)
  {
    v39 = v8;
    objc_storeStrong((id *)&v16->_url, a4);
    if (v15)
    {
      v18 = objc_msgSend(v15, "copy");
      uuid = v17->_uuid;
      v17->_uuid = (NSString *)v18;

    }
    objc_msgSend(v13, "lastPathComponent");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    fileName = v17->_fileName;
    v17->_fileName = v20;

    objc_storeStrong((id *)&v17->_createdFileName, v20);
    v22 = *MEMORY[0x1E0C99998];
    v23 = *MEMORY[0x1E0C998E8];
    v45[0] = *MEMORY[0x1E0C99998];
    v45[1] = v23;
    v24 = *MEMORY[0x1E0C998C0];
    v45[2] = *MEMORY[0x1E0C998C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v13, "resourceValuesForKeys:error:", v25, &v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v40;

    if (v26)
    {
      objc_msgSend(v26, "objectForKeyedSubscript:", v22);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_fileSize = objc_msgSend(v28, "longLongValue");

      objc_msgSend(v26, "objectForKeyedSubscript:", v23);
      v29 = objc_claimAutoreleasedReturnValue();
      fileCreationDate = v17->_fileCreationDate;
      v17->_fileCreationDate = (NSDate *)v29;

      objc_msgSend(v26, "objectForKeyedSubscript:", v24);
      v31 = objc_claimAutoreleasedReturnValue();
      p_super = &v17->_fileModificationDate->super;
      v17->_fileModificationDate = (NSDate *)v31;
    }
    else
    {
      PLImportGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v13);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v33;
        v43 = 2112;
        v44 = v27;
        _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEFAULT, "failed to find resource attributes for %@: %@", buf, 0x16u);

      }
    }

    objc_msgSend(v13, "pathExtension");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isEqualToString:", &stru_1E35DFFF8))
      v35 = 0;
    else
      v35 = v34;
    objc_storeStrong((id *)&v17->_fileExtension, v35);
    v17->_canReference = -[PHImportAsset isValidForReference](v17, "isValidForReference");
    v17->_copyMethod = 0;
    if (v14)
    {
      if (-[PHImportAsset configureWithContentType:supportedMediaType:](v17, "configureWithContentType:supportedMediaType:", v14, v39))
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "typeForURL:error:", v13, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PHImportAsset configureWithContentType:supportedMediaType:](v17, "configureWithContentType:supportedMediaType:", v37, v39);

      if (v38)
        goto LABEL_14;
    }

    v17 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset fileName](self, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset createdFileName](self, "createdFileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset parentFolderPath](self, "parentFolderPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset descriptionWithPrefix:](self, "descriptionWithPrefix:", &stru_1E35DFFF8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@) [%@]%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)descriptionWithPrefix:(id)a3
{
  id v4;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@%@ <%p>"), v4, objc_opt_class(), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("\n\t%@uuid        : %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("\n\t%@device      : %@"), v4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset parentFolderPath](self, "parentFolderPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("\n\t%@folder      : %@"), v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset fileName](self, "fileName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset createdFileName](self, "createdFileName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("\n\t%@name        : %@ (%@)"), v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t%@fileSize    : %llu"), v4, -[PHImportAsset fileSize](self, "fileSize"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportAsset creationDate](self, "creationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset fileCreationDate](self, "fileCreationDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v4;
  objc_msgSend(v26, "stringWithFormat:", CFSTR("\n\t%@date        : %@ (%@)"), v4, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingString:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[PHImportAsset relatedAssets](self, "relatedAssets");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v43;
    do
    {
      v36 = 0;
      v37 = v31;
      do
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v36);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\t"), v29);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "descriptionWithPrefix:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringByAppendingString:", v40);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        ++v36;
        v37 = v31;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v34);
  }

  return v31;
}

- (BOOL)canPreserveFolderStructure
{
  return 1;
}

- (NSString)parentFolderPath
{
  void *v2;
  void *v3;

  -[NSURL path](self->_url, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canReference
{
  return self->_canReference && -[PHImportAsset hasOriginalResourceType](self, "hasOriginalResourceType");
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)isValidForReference
{
  void *v2;
  void *v3;
  int v4;

  -[PHImportAsset url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/var")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("/private/var")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("/tmp")) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("/private/tmp")) ^ 1;
  }

  return v4;
}

- (BOOL)isImage
{
  return PHIsImageAssetResourceType(self->_resourceType);
}

- (BOOL)isMovie
{
  return PHIsVideoAssetResourceType(self->_resourceType);
}

- (BOOL)isAudio
{
  return self->_resourceType == 3;
}

- (BOOL)isJPEG
{
  return self->_resourceSubType & 1;
}

- (BOOL)isJPEG2000
{
  return (BYTE1(self->_resourceSubType) >> 3) & 1;
}

- (BOOL)isRAW
{
  return (LOBYTE(self->_resourceSubType) >> 3) & 1;
}

- (BOOL)isTIFF
{
  return (LOBYTE(self->_resourceSubType) >> 4) & 1;
}

- (BOOL)isHEIF
{
  return (LOBYTE(self->_resourceSubType) >> 1) & 1;
}

- (BOOL)isGIF
{
  return (BYTE1(self->_resourceSubType) >> 4) & 1;
}

- (BOOL)isPDF
{
  return (BYTE1(self->_resourceSubType) >> 6) & 1;
}

- (BOOL)isPNG
{
  return (BYTE1(self->_resourceSubType) >> 5) & 1;
}

- (BOOL)isPSD
{
  return BYTE1(self->_resourceSubType) >> 7;
}

- (BOOL)isSidecar
{
  return (self->_resourceSubType & 0x20700) != 0;
}

- (BOOL)isSloMo
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[PHImportAsset isMovie](self, "isMovie"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__PHImportAsset_isSloMo__block_invoke;
    v5[3] = &unk_1E35DF920;
    v5[4] = self;
    v5[5] = &v6;
    -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAVCHD
{
  return 0;
}

- (BOOL)isTimelapse
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[PHImportAsset isMovie](self, "isMovie"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __28__PHImportAsset_isTimelapse__block_invoke;
    v5[3] = &unk_1E35DF920;
    v5[4] = self;
    v5[5] = &v6;
    -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isJpegPlusRAW
{
  void *v2;
  BOOL v3;

  -[PHImportAsset rawAsset](self, "rawAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isHDR
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_isHDR__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isSDOF
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[PHImportAsset isImage](self, "isImage"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __23__PHImportAsset_isSDOF__block_invoke;
    v5[3] = &unk_1E35DF920;
    v5[4] = self;
    v5[5] = &v6;
    -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBurst
{
  void *v2;
  BOOL v3;

  -[PHImportAsset burstUUID](self, "burstUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isLivePhoto
{
  void *v2;
  BOOL v3;

  -[PHImportAsset videoComplement](self, "videoComplement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasAudioAttachment
{
  void *v2;
  BOOL v3;

  -[PHImportAsset audioAsset](self, "audioAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isGrouped
{
  void *v2;
  BOOL v3;

  -[PHImportAsset groupingUUID](self, "groupingUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isRepresentation
{
  return (self->_resourceType < 0xFuLL) & (0x7160u >> self->_resourceType);
}

- (BOOL)isPrimary
{
  return (unint64_t)(self->_resourceType - 1) < 2;
}

- (BOOL)isRender
{
  void *v3;
  BOOL v4;

  if (isRender_onceToken != -1)
    dispatch_once(&isRender_onceToken, &__block_literal_global_6136);
  -[PHImportAsset fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)isRender_isRenderedRegex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (BOOL)isAdjustmentSecondaryData
{
  void *v3;
  BOOL v4;

  if (isAdjustmentSecondaryData_onceToken != -1)
    dispatch_once(&isAdjustmentSecondaryData_onceToken, &__block_literal_global_198);
  -[PHImportAsset fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)isAdjustmentSecondaryData_regex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (BOOL)isSpatialOverCapture
{
  void *v3;
  BOOL v4;

  if (isSpatialOverCapture_onceToken != -1)
    dispatch_once(&isSpatialOverCapture_onceToken, &__block_literal_global_201);
  -[PHImportAsset fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)isSpatialOverCapture_isSocRegex, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

- (BOOL)isBase
{
  void *v3;
  void *v4;
  void *v5;

  if (isBase_onceToken != -1)
    dispatch_once(&isBase_onceToken, &__block_literal_global_204);
  v3 = (void *)isBase_isBaseRegex;
  -[PHImportAsset fileName](self, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v5, "length")) != 0;

  return (char)v3;
}

- (BOOL)isOriginalAdjustmentData
{
  void *v2;
  BOOL v3;

  -[PHImportAsset fileName](self, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PHImportAsset isOriginalAdjustmentData:](PHImportAsset, "isOriginalAdjustmentData:", v2);

  return v3;
}

- (id)basenameForOriginalAdjustmentData
{
  NSString *basenameForOriginalAdjustment;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  basenameForOriginalAdjustment = self->_basenameForOriginalAdjustment;
  if (!basenameForOriginalAdjustment)
  {
    v4 = (void *)MEMORY[0x1E0CB37A0];
    -[PHImportAsset fileName](self, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "insertString:atIndex:", CFSTR("O"), 4);
    v7 = (NSString *)objc_msgSend(v6, "copy");
    v8 = self->_basenameForOriginalAdjustment;
    self->_basenameForOriginalAdjustment = v7;

    basenameForOriginalAdjustment = self->_basenameForOriginalAdjustment;
  }
  return basenameForOriginalAdjustment;
}

- (id)stripMarkerFromName:(id)a3 markerLocation:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Passed a nil 'name'", buf, 2u);
    }

    goto LABEL_9;
  }
  if (objc_msgSend(v5, "length") < a4)
  {
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v15 = a4;
      v16 = 2112;
      v17 = v6;
      v18 = 2048;
      v19 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Marker location (%lu) is beyond length of name '%@' (%lu)", buf, 0x20u);
    }

LABEL_9:
    v9 = 0;
    goto LABEL_14;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "substringToIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") <= a4)
  {
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, &stru_1E35DFFF8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "substringFromIndex:", a4 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v9;
}

- (id)makeImportIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PHImportAsset fileName](self, "fileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PHImportAsset isRepresentation](self, "isRepresentation")
    || -[PHImportAsset isOriginalAdjustmentData](self, "isOriginalAdjustmentData")
    || -[PHImportAsset isAdjustmentSecondaryData](self, "isAdjustmentSecondaryData"))
  {
    -[PHImportAsset stripMarkerFromName:markerLocation:](self, "stripMarkerFromName:markerLocation:", v4, 4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  -[PHImportAsset parentFolderPath](self, "parentFolderPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)importIdentifier
{
  NSString *importIdentifier;
  NSString *v4;
  NSString *v5;

  importIdentifier = self->_importIdentifier;
  if (!importIdentifier)
  {
    -[PHImportAsset makeImportIdentifier](self, "makeImportIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_importIdentifier;
    self->_importIdentifier = v4;

    importIdentifier = self->_importIdentifier;
  }
  return importIdentifier;
}

- (BOOL)performAdditionalLivePhotoChecksOnImageAsset:(id)a3
{
  return 0;
}

- (BOOL)isVideoComplementOf:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isJPEG") & 1) == 0 && !objc_msgSend(v4, "isHEIF"))
  {
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "livePhotoPairingIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PHImportAsset livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v4, "livePhotoPairingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PHImportAsset performAdditionalLivePhotoChecksOnImageAsset:](self, "performAdditionalLivePhotoChecksOnImageAsset:", v4))
    {
      v9 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v4, "loadMetadataSync");
    objc_msgSend(v4, "livePhotoPairingIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = 0;
      goto LABEL_11;
    }
    -[PHImportAsset loadMetadataSync](self, "loadMetadataSync");
  }
  -[PHImportAsset livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v10);

LABEL_11:
LABEL_12:
  PLImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "livePhotoPairingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset livePhotoPairingIdentifier](self, "livePhotoPairingIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "PAIRING: imageAsset.livePhotoPairingIdentifier == %@, videoAsset.livePhotoPairingIdentifier == %@", (uint8_t *)&v16, 0x16u);

  }
  if (!v9)
    goto LABEL_16;
  objc_msgSend(v4, "takeAsVideoComplement:", self);
  v14 = 1;
LABEL_17:

  return v14;
}

- (void)takeAsVideoComplement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
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
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PHImportAsset isImage](self, "isImage") || (objc_msgSend(v4, "isMovie") & 1) == 0)
  {
    PLImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "redactedFileNameDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEBUG, "Assigning %@ as video complement of %@ is not allowed", buf, 0x16u);

    }
    goto LABEL_12;
  }
  PLImportGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "redactedFileNameDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    v35 = 2112;
    v36 = v8;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a video complement of %@ (%@)", buf, 0x2Au);

  }
  -[PHImportAsset setVideoComplement:](self, "setVideoComplement:", v4);
  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v13 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v13, "count"))
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "sidecarAssetsByType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "sidecarAssetsByType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "valueForKeyPath:", CFSTR("fileName.pathExtension"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "redactedFileNameDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "PAIRING: moving sidecars (%@) from %@ to %@", buf, 0x20u);

    }
    objc_msgSend(v4, "sidecarAssetsByType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset setSidecarAssetsByType:](self, "setSidecarAssetsByType:", v23);

    objc_msgSend(v4, "setSidecarAssetsByType:", 0);
  }
LABEL_13:

}

- (BOOL)isTagged
{
  return 0;
}

- (BOOL)isViewable
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (-[PHImportAsset isImage](self, "isImage"))
    return 1;
  v4 = objc_alloc(MEMORY[0x1E0C8B3C0]);
  -[PHImportAsset url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:options:", v5, 0);

  objc_msgSend(MEMORY[0x1E0D75130], "mainVideoTrackForAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDecodable");

  return v8;
}

- (void)_accessMetadata:(id)a3
{
  os_unfair_lock_s *p_metadataLock;
  void (**v4)(_QWORD);

  p_metadataLock = &self->_metadataLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_metadataLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_metadataLock);
}

- (CGSize)cgImageSize
{
  double *v3;
  void *v4;
  void *v5;
  const __CFURL *v6;
  double Width;
  double Height;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  CGImageSource *v12;
  uint64_t v13;
  const __CFDictionary *v14;
  CGImage *ImageAtIndex;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];
  CGSize result;

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (double *)MEMORY[0x1E0C9D820];
  -[PHImportAsset largeRender](self, "largeRender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHImportAsset largeRender](self, "largeRender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PHImportAsset url](self, "url");
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  }
  Width = *v3;
  Height = v3[1];

  if (v6)
  {
    if (-[PHImportAsset isImage](self, "isImage"))
    {
      v9 = *MEMORY[0x1E0CBD288];
      v24 = *MEMORY[0x1E0CBD288];
      v10 = MEMORY[0x1E0C9AAB0];
      v25[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = CGImageSourceCreateWithURL(v6, v11);

      if (v12)
      {
        v13 = *MEMORY[0x1E0CBD190];
        v22[0] = v9;
        v22[1] = v13;
        v23[0] = v10;
        v23[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, v14);

        if (ImageAtIndex)
        {
          Width = (double)CGImageGetWidth(ImageAtIndex);
          Height = (double)CGImageGetHeight(ImageAtIndex);
          CGImageRelease(ImageAtIndex);
        }
        CFRelease(v12);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D75130], "mainVideoTrackForAsset:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "naturalSize");
      Width = v18;
      Height = v19;

    }
  }

  v20 = Width;
  v21 = Height;
  result.height = v21;
  result.width = v20;
  return result;
}

- (unsigned)orientation
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_orientation__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (CGSize)exifPixelSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGSize result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v11 = 0;
  v12 = 0;
  v10 = &unk_19949EB27;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PHImportAsset_exifPixelSize__block_invoke;
  v6[3] = &unk_1E35DF920;
  v6[4] = self;
  v6[5] = &v7;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v6);
  v2 = v8[4];
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)orientedPixelSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGSize result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v11 = 0;
  v12 = 0;
  v10 = &unk_19949EB27;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PHImportAsset_orientedPixelSize__block_invoke;
  v6[3] = &unk_1E35DF920;
  v6[4] = self;
  v6[5] = &v7;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v6);
  v2 = v8[4];
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)transformedPixelSize
{
  uint64_t v3;
  void *v4;
  PHImportAsset *v5;
  PHImportAsset *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PHImportAsset largeRender](self, "largeRender");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (PHImportAsset *)v3;
  else
    v5 = self;
  v6 = v5;

  -[PHImportAsset orientedPixelSize](v6, "orientedPixelSize");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)burstUUID
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6064;
  v10 = __Block_byref_object_dispose__6065;
  v11 = 0;
  if (-[PHImportAsset isImage](self, "isImage"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__PHImportAsset_burstUUID__block_invoke;
    v5[3] = &unk_1E35DF920;
    v5[4] = self;
    v5[5] = &v6;
    -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v5);
  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)groupingUUID
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6064;
  v10 = __Block_byref_object_dispose__6065;
  v11 = 0;
  if (-[PHImportAsset isImage](self, "isImage"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __29__PHImportAsset_groupingUUID__block_invoke;
    v5[3] = &unk_1E35DF920;
    v5[4] = self;
    v5[5] = &v6;
    -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v5);
  }
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int)burstPickType
{
  void *v2;
  int v3;

  -[PHImportAsset burstUUID](self, "burstUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 2 * (v2 != 0);

  return v3;
}

- (id)livePhotoPairingIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PHImportAsset_livePhotoPairingIdentifier__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)spatialOverCaptureIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PHImportAsset_spatialOverCaptureIdentifier__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSNumber)durationTimeInterval
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__PHImportAsset_durationTimeInterval__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSString)cameraMake
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_cameraMake__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)cameraModel
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_cameraModel__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)formattedCameraModel
{
  void *v3;
  void *v4;
  void *v5;

  -[PHImportAsset cameraModel](self, "cameraModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset cameraMake](self, "cameraMake");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75130], "formattedCameraModelFromCameraModel:cameraMake:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)lensModel
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__PHImportAsset_lensModel__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSNumber)flashFired
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_flashFired__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v6 + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);
  return (NSNumber *)v2;
}

- (NSNumber)whiteBalance
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_whiteBalance__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)meteringMode
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_meteringMode__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)iso
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__PHImportAsset_iso__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)focalLength
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_focalLength__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)focalLengthIn35mm
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PHImportAsset_focalLengthIn35mm__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)digitalZoomRatio
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PHImportAsset_digitalZoomRatio__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)exposureBias
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_exposureBias__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)fNumber
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportAsset_fNumber__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)exposureTime
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_exposureTime__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSString)codec
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_codec__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSNumber)fps
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__PHImportAsset_fps__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)sampleRate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportAsset_sampleRate__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)bitrate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportAsset_bitrate__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (NSNumber)trackFormat
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PHImportAsset_trackFormat__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (unint64_t)assetSizeIncludingRelatedAssets
{
  unint64_t v3;

  v3 = -[PHImportAsset fileSize](self, "fileSize");
  return -[PHImportAsset relatedBytes](self, "relatedBytes") + v3;
}

- (unint64_t)approximateBytesRequiredToImport
{
  unint64_t v3;
  void *v4;

  v3 = -[PHImportAsset assetSizeIncludingRelatedAssets](self, "assetSizeIncludingRelatedAssets") + 225280;
  -[PHImportAsset largeRender](self, "largeRender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return (unint64_t)(fmin((double)-[PHImportAsset fileSize](self, "fileSize"), 1468006.4) + (double)v3);
  return v3;
}

- (id)relatedAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  -[PHImportAsset largeRender](self, "largeRender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PHImportAsset largeRender](self, "largeRender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[PHImportAsset largeMovieRender](self, "largeMovieRender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PHImportAsset largeMovieRender](self, "largeMovieRender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[PHImportAsset rawAsset](self, "rawAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PHImportAsset rawAsset](self, "rawAsset");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHImportAsset videoComplement](self, "videoComplement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_10;
    -[PHImportAsset videoComplement](self, "videoComplement");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  objc_msgSend(v3, "addObject:", v9);

LABEL_10:
  -[PHImportAsset audioAsset](self, "audioAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PHImportAsset audioAsset](self, "audioAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[PHImportAsset base](self, "base");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PHImportAsset base](self, "base");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  -[PHImportAsset sidecarAssets](self, "sidecarAssets");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v18);

  return v3;
}

- (unint64_t)relatedBytes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PHImportAsset relatedAssets](self, "relatedAssets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "fileSize");
        v5 += v9 + objc_msgSend(v8, "relatedBytes");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)checkForSidecarWithExtension:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;

  v4 = a3;
  -[PHImportAsset url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((_DWORD)v7)
  {
    -[PHImportAsset source](self, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHImportAsset assetFileForURL:source:](PHImportAsset, "assetFileForURL:source:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v8, "URLByDeletingPathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathExtension:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      -[PHImportAsset source](self, "source");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PHImportAsset assetFileForURL:source:](PHImportAsset, "assetFileForURL:source:", v15, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)loadSidecarFiles
{
  NSObject *loadSidecars;
  _QWORD block[5];

  loadSidecars = self->_loadSidecars;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PHImportAsset_loadSidecarFiles__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  dispatch_sync(loadSidecars, block);
}

- (void)_loadSidecarFiles
{
  void *v3;
  id v4;

  if (!-[NSMutableDictionary count](self->_sidecarAssetsByType, "count"))
  {
    if (!-[PHImportAsset isImage](self, "isImage")
      && -[PHImportAsset isMovie](self, "isMovie")
      && !-[PHImportAsset isAVCHD](self, "isAVCHD"))
    {
      -[PHImportAsset checkForSidecarWithExtension:](self, "checkForSidecarWithExtension:", CFSTR("SLM"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset addSidecarAsset:](self, "addSidecarAsset:", v3);

    }
    -[PHImportAsset checkForSidecarWithExtension:](self, "checkForSidecarWithExtension:", CFSTR("AAE"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PHImportAsset addSidecarAsset:](self, "addSidecarAsset:", v4);

  }
}

- (NSArray)sidecarAssets
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)sidecarAssetBytes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "fileSize");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addSidecarAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *sidecarAssetsByType;
  void *v18;
  PHImportAssetFilePresenter *v19;
  void *v20;
  void *v21;
  PHImportAssetFilePresenter *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PHImportAsset source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPairedSidecar:", v4);

    if ((v6 & 1) == 0)
    {
      PLImportGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "redactedFileNameDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v30 = v8;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a sidecar of %@ (%@) ", buf, 0x2Au);

      }
      -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v16 = (void *)objc_opt_new();
        -[PHImportAsset setSidecarAssetsByType:](self, "setSidecarAssetsByType:", v16);

      }
      sidecarAssetsByType = self->_sidecarAssetsByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](sidecarAssetsByType, "setObject:forKeyedSubscript:", v4, v18);

      v19 = [PHImportAssetFilePresenter alloc];
      -[PHImportAsset url](self, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "url");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PHImportAssetFilePresenter initWithPrimaryURL:presentedURL:](v19, "initWithPrimaryURL:presentedURL:", v20, v21);
      objc_msgSend(v4, "setFilePresenter:", v22);

      -[PHImportAsset source](self, "source");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addPairedSidecar:", v4);

    }
  }

}

- (void)removeSidecarAsset:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *sidecarAssetsByType;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sidecarAssetsByType = self->_sidecarAssetsByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](sidecarAssetsByType, "removeObjectForKey:", v7);

    objc_msgSend(v5, "setFilePresenter:", 0);
  }
  else
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "sidecarAsset was nil", v9, 2u);
    }

  }
}

- (id)slmSidecar
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E3654F70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)adjustmentSidecar
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E3654F88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)adjustmentSecondarySidecar
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E3654FA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)originalAdjustmentSidecar
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E3654FB8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)xmpSidecar
{
  void *v2;
  void *v3;

  -[PHImportAsset sidecarAssetsByType](self, "sidecarAssetsByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1E3654FD0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasAdjustments
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PHImportAsset adjustmentSidecar](self, "adjustmentSidecar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PHImportAsset originalAdjustmentSidecar](self, "originalAdjustmentSidecar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)isAppropriateForUI
{
  return (unint64_t)(self->_resourceType - 1) < 2;
}

- (void)setRawAsset:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  if ((objc_msgSend(v5, "isRAW") & 1) != 0)
  {
    if (-[PHImportAsset isJPEG](self, "isJPEG"))
    {
      objc_msgSend(v6, "setResourceType:", 4);
LABEL_5:
      objc_storeStrong((id *)&self->_rawAsset, a3);
      goto LABEL_12;
    }
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[PHImportAsset fileName](self, "fileName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "Expected primary asset to be a JPEG (%@)", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "Expected rawAsset to be a RAW (%@)", (uint8_t *)&v13, 0xCu);

    }
  }
LABEL_12:

}

- (void)setVideoComplement:(id)a3
{
  PHImportAsset *v4;
  PHImportAsset *v5;
  PHImportAsset *v6;
  uint64_t v7;
  int64_t resourceType;
  PHImportAsset *videoComplement;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (PHImportAsset *)a3;
  v5 = v4;
  if (v4)
  {
    -[PHImportAsset isMovie](v4, "isMovie");
    if (-[PHImportAsset resourceType](self, "resourceType") == 1)
    {
      v6 = v5;
      v7 = 9;
LABEL_10:
      -[PHImportAsset setResourceType:](v6, "setResourceType:", v7);
      goto LABEL_11;
    }
    if (-[PHImportAsset resourceType](self, "resourceType") == 5)
    {
      v6 = v5;
      v7 = 10;
      goto LABEL_10;
    }
    resourceType = self->_resourceType;
    if (resourceType == 13)
    {
      v6 = v5;
      v7 = 15;
      goto LABEL_10;
    }
    if (resourceType == 8)
    {
      v6 = v5;
      v7 = 11;
      goto LABEL_10;
    }
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](v5, "redactedFileNameDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "Trying to set a video complement file (%@) on an unexpected primary asset (%@ - %@)", buf, 0x20u);

    }
  }
LABEL_11:
  videoComplement = self->_videoComplement;
  self->_videoComplement = v5;

}

- (void)setLargeRender:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *p_super;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PHImportAsset *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v17 = v5;
    p_super = &self->_largeRender->super;
    self->_largeRender = v17;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "isImage");
  PLImportGetLog();
  p_super = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v5, "redactedFileNameDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "resourceType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a large render of %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(v5, "setResourceType:", 5);
    objc_msgSend(v5, "videoComplement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setResourceType:", 10);

    goto LABEL_6;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "resourceType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v21;
    _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "Expected largeRender to be an image (%@)", buf, 0xCu);

  }
LABEL_7:

}

- (void)setLargeMovieRender:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *p_super;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PHImportAsset *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v16 = v5;
    p_super = &self->_largeMovieRender->super;
    self->_largeMovieRender = v16;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "isMovie");
  PLImportGetLog();
  p_super = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v5, "redactedFileNameDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "resourceType"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v27 = v9;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as a large movie render of %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(v5, "setResourceType:", 6);
    goto LABEL_6;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "resourceType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v20;
    _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "Expected largeRender to be a movie (%@)", buf, 0xCu);

  }
LABEL_7:

}

- (void)setSpatialOverCapture:(id)a3
{
  id v4;
  char v5;
  NSObject *p_super;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  _BOOL4 v17;
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
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PHImportAsset *v35;
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
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_17;
  if (!-[PHImportAsset isImage](self, "isImage"))
  {
    if (!-[PHImportAsset isMovie](self, "isMovie"))
    {
      PLImportGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v30;
        v50 = 2112;
        v51 = v34;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "Trying to set a SOC file on an unexpected primary asset (%@ - %@)", buf, 0x16u);

      }
      goto LABEL_16;
    }
    v16 = objc_msgSend(v4, "isMovie");
    PLImportGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if ((v16 & 1) != 0)
    {
      if (v17)
      {
        objc_msgSend(v4, "redactedFileNameDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v39);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v49 = v18;
        v50 = 2112;
        v51 = v19;
        v52 = 2112;
        v53 = v20;
        v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an SOC movie of %@ (%@)", buf, 0x2Au);

      }
      objc_msgSend(v4, "setResourceType:", 14);
      goto LABEL_17;
    }
    if (!v17)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v28;
    v29 = "Expected soc to be a movie (%@)";
LABEL_21:
    _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, v29, buf, 0xCu);

    goto LABEL_18;
  }
  v5 = objc_msgSend(v4, "isImage");
  PLImportGetLog();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v4, "redactedFileNameDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v38);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v49 = v8;
      v50 = 2112;
      v51 = v9;
      v52 = 2112;
      v53 = v10;
      v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an SOC image of %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(v4, "setResourceType:", 13);
    objc_msgSend(v4, "videoComplement");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject setResourceType:](v15, "setResourceType:", 15);
LABEL_16:

LABEL_17:
    v35 = (PHImportAsset *)v4;
    p_super = &self->_spatialOverCapture->super;
    self->_spatialOverCapture = v35;
    goto LABEL_18;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v28;
    v29 = "Expected soc to be an image (%@)";
    goto LABEL_21;
  }
LABEL_18:

}

- (void)setBase:(id)a3
{
  id v4;
  char v5;
  NSObject *p_super;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  _BOOL4 v17;
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
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PHImportAsset *v35;
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
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_17;
  if (!-[PHImportAsset isImage](self, "isImage"))
  {
    if (!-[PHImportAsset isMovie](self, "isMovie"))
    {
      PLImportGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v30;
        v50 = 2112;
        v51 = v34;
        _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_DEBUG, "Trying to set a SOC file on an unexpected primary asset (%@ - %@)", buf, 0x16u);

      }
      goto LABEL_16;
    }
    v16 = objc_msgSend(v4, "isMovie");
    PLImportGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
    if ((v16 & 1) != 0)
    {
      if (v17)
      {
        objc_msgSend(v4, "redactedFileNameDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v39);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PHDescriptionsForResourceTypes(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v49 = v18;
        v50 = 2112;
        v51 = v19;
        v52 = 2112;
        v53 = v20;
        v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base movie of %@ (%@)", buf, 0x2Au);

      }
      objc_msgSend(v4, "setResourceType:", 12);
      goto LABEL_17;
    }
    if (!v17)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v28;
    v29 = "Expected soc to be a movie (%@)";
LABEL_21:
    _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, v29, buf, 0xCu);

    goto LABEL_18;
  }
  v5 = objc_msgSend(v4, "isImage");
  PLImportGetLog();
  p_super = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v4, "redactedFileNameDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v38);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v49 = v8;
      v50 = 2112;
      v51 = v9;
      v52 = 2112;
      v53 = v10;
      v54 = 2112;
      v55 = v14;
      _os_log_impl(&dword_1991EC000, p_super, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base image of %@ (%@)", buf, 0x2Au);

    }
    objc_msgSend(v4, "setResourceType:", 8);
    objc_msgSend(v4, "videoComplement");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject setResourceType:](v15, "setResourceType:", 11);
LABEL_16:

LABEL_17:
    v35 = (PHImportAsset *)v4;
    p_super = &self->_base->super;
    self->_base = v35;
    goto LABEL_18;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "resourceType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "componentsJoinedByString:", CFSTR(","));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v28;
    v29 = "Expected soc to be an image (%@)";
    goto LABEL_21;
  }
LABEL_18:

}

- (void)setAudioAsset:(id)a3
{
  PHImportAsset *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHImportAsset *audioAsset;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (PHImportAsset *)a3;
  if (v4)
  {
    PLImportGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[PHImportAsset redactedFileNameDescription](v4, "redactedFileNameDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](v4, "resourceType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PHDescriptionsForResourceTypes(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ (%@) as an base image of %@ (%@)", buf, 0x2Au);

    }
    -[PHImportAsset setResourceType:](v4, "setResourceType:", 3);
  }
  audioAsset = self->_audioAsset;
  self->_audioAsset = v4;

}

- (void)addBurstAsset:(id)a3
{
  id v5;
  NSMutableArray *relatedBurstAssets;
  NSMutableArray *v7;
  NSMutableArray *v8;
  PHImportAsset **p_burstPick;
  PHImportAsset *burstPick;
  id v11;

  v5 = a3;
  relatedBurstAssets = self->_relatedBurstAssets;
  v11 = v5;
  if (!relatedBurstAssets)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_relatedBurstAssets;
    self->_relatedBurstAssets = v7;

    v5 = v11;
    relatedBurstAssets = self->_relatedBurstAssets;
  }
  -[NSMutableArray addObject:](relatedBurstAssets, "addObject:", v5);
  burstPick = self->_burstPick;
  p_burstPick = &self->_burstPick;
  if (!burstPick && (objc_msgSend(v11, "burstPickType") & 4) != 0)
    objc_storeStrong((id *)p_burstPick, a3);

}

- (void)loadMetadataSync
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__PHImportAsset_loadMetadataSync__block_invoke;
  v2[3] = &unk_1E35DF110;
  v2[4] = self;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v2);
}

- (void)loadMetadataAsync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PHImportAsset source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PHImportAsset_loadMetadataAsync___block_invoke;
  v7[3] = &unk_1E35DF368;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchAssetDataRequestAsyncUsingBlock:", v7);

}

- (PFMetadata)metadata
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportAsset_metadata__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PFMetadata *)v2;
}

- (void)setMetadata:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__PHImportAsset_setMetadata___block_invoke;
  v6[3] = &unk_1E35DF9E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v6);

}

- (void)_setMetadata:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_assert_owner(&self->_metadataLock);
  objc_storeStrong((id *)&self->_metadata, a3);
  if (!-[PHImportAsset fileSize](self, "fileSize"))
    -[PHImportAsset setFileSize:](self, "setFileSize:", objc_msgSend(v9, "fileSize"));
  objc_msgSend(v9, "fileCreationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset fileCreationDate](self, "fileCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5)
    -[PHImportAsset setFileCreationDate:](self, "setFileCreationDate:", v5);
  objc_msgSend(v9, "fileModificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset fileModificationDate](self, "fileModificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && v7)
    -[PHImportAsset setFileModificationDate:](self, "setFileModificationDate:", v7);

}

- (id)thumbnailForSize:(unint64_t)a3 atEnd:(id)a4
{
  return -[PHImportAsset thumbnailForSize:priority:atEnd:](self, "thumbnailForSize:priority:atEnd:", a3, 0, a4);
}

- (id)thumbnailForSize:(unint64_t)a3 priority:(unsigned __int8)a4 atEnd:(id)a5
{
  uint64_t v5;
  id v8;
  PHImportAssetThumbnailDataRequest *v9;

  v5 = a4;
  v8 = a5;
  if (-[PHImportAsset isSidecar](self, "isSidecar"))
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
    v9 = 0;
  }
  else
  {
    v9 = -[PHImportAssetThumbnailDataRequest initWithAsset:longestSide:priority:]([PHImportAssetThumbnailDataRequest alloc], "initWithAsset:longestSide:priority:", self, a3, v5);
    -[PHImportAsset thumbnailUsingRequest:atEnd:](self, "thumbnailUsingRequest:atEnd:", v9, v8);
  }

  return v9;
}

- (void)thumbnailUsingRequest:(id)a3 atEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PHImportAsset *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PHImportAsset source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__PHImportAsset_thumbnailUsingRequest_atEnd___block_invoke;
  v11[3] = &unk_1E35DF3B8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "dispatchAssetDataRequestAsyncUsingBlock:", v11);

}

- (CGSize)cropEXIFThumbSize:(CGSize)result originalSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  BOOL v11;
  double width;
  double v14;
  double v15;
  double v16;

  v4 = result.width / result.height;
  v5 = a4.width / a4.height;
  v6 = vabdd_f64(v5, result.width / result.height);
  if (result.width / result.height > 1.0 && v5 > 1.0)
  {
    if (v6 <= 0.000001)
    {
LABEL_39:
      width = result.width;
      goto LABEL_40;
    }
    v14 = result.width / v5;
LABEL_31:
    result.height = floor(v14);
    goto LABEL_39;
  }
  if (v4 < 1.0 && v5 < 1.0)
  {
    if (v6 <= 0.000001)
      goto LABEL_39;
    v15 = result.height * v5;
LABEL_36:
    width = floor(v15);
    goto LABEL_40;
  }
  if (v4 < 1.0 && v5 > 1.0)
  {
    if (v6 <= 0.000001)
      goto LABEL_39;
    v15 = result.height / v5;
    goto LABEL_36;
  }
  if (v4 > 1.0 && v5 < 1.0)
  {
    if (v6 <= 0.000001)
      goto LABEL_39;
    v14 = result.width * v5;
    goto LABEL_31;
  }
  v11 = v4 > 1.0 && v5 == 1.0;
  width = result.height;
  if (!v11)
  {
    if (v5 == 1.0 && v4 <= 1.0)
      result.height = result.width;
    goto LABEL_39;
  }
LABEL_40:
  if (((int)result.height & 1) != 0)
    result.height = result.height + -1.0;
  v16 = width + -1.0;
  if (((int)width & 1) == 0)
    v16 = width;
  result.width = v16;
  return result;
}

- (CGImage)removeBlackBarsFromExifThumbnail:(CGImage *)a3 fullSize:(CGSize)a4
{
  double height;
  double width;
  CGImage *v6;
  double v8;
  double v9;
  double v10;
  double v11;
  CGImageRef v13;
  CGRect v15;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v8 = (double)CGImageGetWidth(a3);
  v9 = (double)CGImageGetHeight(v6);
  -[PHImportAsset cropEXIFThumbSize:originalSize:](self, "cropEXIFThumbSize:originalSize:", v8, v9, width, height);
  if (v10 != v8 || v11 != v9)
  {
    v15.size.width = floor(v10);
    v15.size.height = floor(v11);
    v15.origin.x = round((v8 - v10) * 0.5);
    v15.origin.y = round((v9 - v11) * 0.5);
    v13 = CGImageCreateWithImageInRect(v6, v15);
    if (v13)
      return (CGImage *)CFAutorelease(v13);
    return 0;
  }
  return v6;
}

- (CGImage)imageThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5
{
  const __CFURL *v7;
  CGImageSource *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFDictionary *v18;
  CGImageRef ThumbnailAtIndex;
  CGImage *v20;
  const __CFDictionary *v21;
  CGImage *ImageAtIndex;
  double Width;
  double Height;
  CGImage *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a4, "isCanceled") & 1) != 0)
    return 0;
  -[PHImportAsset url](self, "url");
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v8 = CGImageSourceCreateWithURL(v7, 0);

  if (!v8)
  {
    PLImportGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v27;
      _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Unable to get an image source for %@", (uint8_t *)&v33, 0xCu);

    }
    return 0;
  }
  v9 = *MEMORY[0x1E0CBD288];
  v10 = MEMORY[0x1E0C9AAB0];
  v11 = *MEMORY[0x1E0CBD190];
  v37[0] = *MEMORY[0x1E0CBD288];
  v37[1] = v11;
  v38[0] = MEMORY[0x1E0C9AAB0];
  v38[1] = MEMORY[0x1E0C9AAB0];
  v12 = *MEMORY[0x1E0CBD178];
  v37[2] = *MEMORY[0x1E0CBD180];
  v37[3] = v12;
  v13 = MEMORY[0x1E0C9AAA0];
  if (a3 <= 0xA0)
    v14 = MEMORY[0x1E0C9AAA0];
  else
    v14 = MEMORY[0x1E0C9AAB0];
  v38[2] = MEMORY[0x1E0C9AAB0];
  v38[3] = v14;
  v15 = *MEMORY[0x1E0CBD240];
  v38[4] = MEMORY[0x1E0C9AAA0];
  v16 = *MEMORY[0x1E0CBD2A0];
  v37[4] = v15;
  v37[5] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v8, 0, v18);

  if (ThumbnailAtIndex)
  {
    v20 = (CGImage *)CFAutorelease(ThumbnailAtIndex);
    v35[0] = v9;
    v35[1] = v11;
    v36[0] = v10;
    v36[1] = v10;
    v35[2] = v15;
    v36[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v21);

    if (ImageAtIndex)
    {
      Width = (double)CGImageGetWidth(ImageAtIndex);
      Height = (double)CGImageGetHeight(ImageAtIndex);
      CGImageRelease(ImageAtIndex);
      v25 = -[PHImportAsset removeBlackBarsFromExifThumbnail:fullSize:](self, "removeBlackBarsFromExifThumbnail:fullSize:", v20, Width, Height);
      if (v25)
        v20 = v25;
    }
    else
    {
      PLImportGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138412290;
        v34 = v31;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "Unable to make a full size image for %@", (uint8_t *)&v33, 0xCu);

      }
    }
  }
  else
  {
    PLImportGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v29;
      _os_log_impl(&dword_1991EC000, v28, OS_LOG_TYPE_ERROR, "Unable to make an exif size image for %@", (uint8_t *)&v33, 0xCu);

    }
    v20 = 0;
  }
  CFRelease(v8);
  return v20;
}

- (CGImage)avThumbnailOfSize:(unint64_t)a3 canceler:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGDataProvider *v15;
  CGImageRef v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  id v34;
  char v35;
  id v36;
  void *v37;
  CGImage *v38;
  NSObject *log;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  _BYTE buf[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((objc_msgSend(v7, "isCanceled") & 1) != 0 || -[PHImportAsset isAudio](self, "isAudio"))
    goto LABEL_25;
  v8 = (void *)MEMORY[0x1E0C8B3C0];
  -[PHImportAsset url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLAssetWithURL:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v10, "commonMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadataItemsFromArray:withKey:keySpace:", v12, *MEMORY[0x1E0C8A888], *MEMORY[0x1E0C8A9D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    if ((objc_msgSend(v7, "isCanceled") & 1) == 0)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CGDataProviderCreateWithCFData((CFDataRef)objc_msgSend(v14, "dataValue"));

      v16 = CGImageCreateWithJPEGDataProvider(v15, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v15);
      goto LABEL_23;
    }
LABEL_22:

LABEL_25:
    v38 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);
  objc_msgSend(v17, "setAppliesPreferredTrackTransform:", 1);
  objc_msgSend(MEMORY[0x1E0D75130], "mainVideoTrackForAsset:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "naturalSize");
  v20 = v19;
  v22 = v21;
  if (v18)
  {
    objc_msgSend(v18, "preferredTransform");
    v23 = *((double *)&v45 + 1);
    v24 = *(double *)&v45;
    v25 = *((double *)&v46 + 1);
    v26 = *(double *)&v46;
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v45 = 0u;
    v25 = 0.0;
    v23 = 0.0;
    v26 = 0.0;
    v24 = 0.0;
  }
  v27 = v22 * v26 + v24 * v20;
  v28 = v22 * v25 + v23 * v20;
  v29 = (double)a3;
  v30 = v27 <= v28;
  v31 = v27 * (double)a3 / v28;
  v32 = v28 * (double)a3 / v27;
  if (v30)
    v33 = v31;
  else
    v33 = (double)a3;
  if (!v30)
    v29 = v32;
  objc_msgSend(v17, "setMaximumSize:", v33, v29);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __50__PHImportAsset_avThumbnailOfSize_canceler_error___block_invoke;
  v42[3] = &unk_1E35D9850;
  v34 = v17;
  v43 = v34;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v7, "setCancelBlock:", v42);
  v35 = objc_msgSend(v7, "isCanceled");
  if ((v35 & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v41 = 0;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v16 = (CGImageRef)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v34, buf, 0, &v41);
    v36 = v41;
    if (v36)
    {
      PLImportGetLog();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        -[PHImportAsset redactedFileNameDescription](self, "redactedFileNameDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        _os_log_impl(&dword_1991EC000, log, OS_LOG_TYPE_ERROR, "Unable to make an image for %@ (%@)", buf, 0x16u);

      }
    }

  }
  objc_destroyWeak(&v44);

  objc_destroyWeak(&location);
  if ((v35 & 1) != 0)
    goto LABEL_22;
LABEL_23:

  if (!v16)
    goto LABEL_25;
  v38 = (CGImage *)CFAutorelease(v16);
LABEL_26:

  return v38;
}

- (BOOL)_loadMetadataIfNecessaryForURL:(id)a3 options:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  if (v6 && (-[PFMetadata isSameForURL:andOptions:](self->_metadata, "isSameForURL:andOptions:", v6, v4) & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0D75140]);
    -[PFMetadata timeZoneLookup](self->_metadata, "timeZoneLookup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMediaURL:options:timeZoneLookup:shouldCache:", v6, v4, v8, 0);

    if (v9)
      -[PHImportAsset _setMetadata:](self, "_setMetadata:", v9);

  }
  v10 = self->_metadata != 0;

  return v10;
}

- (id)validateMetadataForImportRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  if (-[PHImportAsset isSidecar](self, "isSidecar"))
  {
    v5 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6064;
    v22 = __Block_byref_object_dispose__6065;
    v23 = 0;
    -[PHImportAsset url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_4;
    objc_msgSend(v4, "downloadedPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_7;
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "downloadedPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURLWithPath:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_4:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __49__PHImportAsset_validateMetadataForImportRecord___block_invoke;
      v14[3] = &unk_1E35DEB38;
      v14[4] = self;
      v7 = v6;
      v15 = v7;
      v17 = &v18;
      v16 = v4;
      -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v14);

    }
    else
    {
LABEL_7:
      PLImportGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "self.url and record.downloadedPath are nil", v13, 2u);
      }

      v7 = 0;
    }
    v5 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

- (BOOL)hasOriginalResourceType
{
  unint64_t v2;

  v2 = -[PHImportAsset resourceType](self, "resourceType");
  return (v2 < 0x11) & (0x1E21Eu >> v2);
}

- (id)resourceTypes
{
  void *v3;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHImportAsset resourceType](self, "resourceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PHImportAsset rawAsset](self, "rawAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset rawAsset](self, "rawAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "resourceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[PHImportAsset videoComplement](self, "videoComplement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset videoComplement](self, "videoComplement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "resourceType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[PHImportAsset largeRender](self, "largeRender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset largeRender](self, "largeRender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "resourceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

    -[PHImportAsset largeRender](self, "largeRender");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "videoComplement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[PHImportAsset largeRender](self, "largeRender");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "videoComplement");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v21, "resourceType"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

    }
  }
  -[PHImportAsset audioAsset](self, "audioAsset");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset audioAsset](self, "audioAsset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "resourceType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

  }
  -[PHImportAsset largeMovieRender](self, "largeMovieRender");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset largeMovieRender](self, "largeMovieRender");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "resourceType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "resourceType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

    -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "videoComplement");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = (void *)MEMORY[0x1E0CB37E8];
      -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "videoComplement");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "resourceType"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v40);

    }
  }
  -[PHImportAsset base](self, "base");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[PHImportAsset base](self, "base");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "resourceType"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v44);

    -[PHImportAsset base](self, "base");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "videoComplement");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = (void *)MEMORY[0x1E0CB37E8];
      -[PHImportAsset base](self, "base");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "videoComplement");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v49, "resourceType"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v50);

    }
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[PHImportAsset sidecarAssets](self, "sidecarAssets", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v59;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(v51);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v55), "resourceType"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v53);
  }

  return v3;
}

- (id)sidecarInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportAsset fileName](self, "fileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PHImportAsset fileName](self, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D72F80]);

  }
  -[PHImportAsset createdFileName](self, "createdFileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PHImportAsset createdFileName](self, "createdFileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D72F78]);

  }
  -[PHImportAsset creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PHImportAsset creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D72F70]);

  }
  -[PHImportAsset fileModificationDate](self, "fileModificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PHImportAsset fileModificationDate](self, "fileModificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D72F88]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PHImportAsset fileSize](self, "fileSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D72F90]);

  return v3;
}

- (id)sidecarInfoDictionaries
{
  void *v3;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PHImportAsset relatedAssets](self, "relatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportAsset largeRender](self, "largeRender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PHImportAsset largeRender](self, "largeRender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sidecarInfoDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    -[PHImportAsset largeRender](self, "largeRender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sidecarInfoDictionaries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  -[PHImportAsset rawAsset](self, "rawAsset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PHImportAsset rawAsset](self, "rawAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sidecarInfoDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    -[PHImportAsset rawAsset](self, "rawAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PHImportAsset videoComplement](self, "videoComplement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_8;
    -[PHImportAsset videoComplement](self, "videoComplement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sidecarInfoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    -[PHImportAsset videoComplement](self, "videoComplement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v14;
  objc_msgSend(v14, "sidecarInfoDictionaries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v19);

LABEL_8:
  -[PHImportAsset audioAsset](self, "audioAsset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PHImportAsset audioAsset](self, "audioAsset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sidecarInfoDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_opt_self();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sidecarAssets", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "sidecarInfoDictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v26);
  }

  return v5;
}

- (id)importRecordForPrimaryAsset
{
  PHImportRecord *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;

  v3 = -[PHImportRecord initWithImportAsset:]([PHImportRecord alloc], "initWithImportAsset:", self);
  -[PHImportAsset loadSidecarFiles](self, "loadSidecarFiles");
  -[PHImportAsset _addRelatedRecordsToRecord:primaryRecord:](self, "_addRelatedRecordsToRecord:primaryRecord:", v3, v3);
  -[PHImportRecord importAsset](v3, "importAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PHAssetCreationRequest supportsImportAssetResourceTypes:](PHAssetCreationRequest, "supportsImportAssetResourceTypes:", v5);

  if (v6)
  {
    if (!objc_msgSend(v4, "isDuplicate") || !objc_msgSend(v4, "isBurst"))
      goto LABEL_7;
    objc_msgSend(v4, "fileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](v3, "addExceptionWithType:path:underlyingError:file:line:", 4, v7, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m", 1737);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "resourceTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PHDescriptionsForResourceTypes(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unsupported resource set: %@"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](v3, "addExceptionWithType:path:underlyingError:file:line:", 0, v13, v7, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m", 1734);

  }
LABEL_7:
  -[PHImportAsset metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orientedPixelSize");
  v17 = v16;
  v19 = v18;

  if (v19 <= v17)
    v20 = 3;
  else
    v20 = 2;
  if (v17 > v19)
    v21 = 1;
  else
    v21 = v20;
  -[PHImportRecord timers](v3, "timers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAspectRatio:", v21);

  return v3;
}

- (void)_addRelatedRecordsToRecord:(id)a3 primaryRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHImportRecord *v9;
  void *v10;
  PHImportRecord *v11;
  void *v12;
  void *v13;
  PHImportRecord *v14;
  void *v15;
  PHImportRecord *v16;
  void *v17;
  void *v18;
  PHImportRecord *v19;
  void *v20;
  PHImportRecord *v21;
  void *v22;
  void *v23;
  PHImportRecord *v24;
  void *v25;
  PHImportRecord *v26;
  void *v27;
  void *v28;
  PHImportRecord *v29;
  void *v30;
  PHImportRecord *v31;
  void *v32;
  void *v33;
  PHImportRecord *v34;
  void *v35;
  PHImportRecord *v36;
  void *v37;
  void *v38;
  PHImportRecord *v39;
  void *v40;
  PHImportRecord *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  PHImportRecord *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PHImportAsset largeRender](self, "largeRender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [PHImportRecord alloc];
    -[PHImportAsset largeRender](self, "largeRender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHImportRecord initWithImportAsset:](v9, "initWithImportAsset:", v10);

    objc_msgSend(v6, "addRelatedRecord:", v11);
    -[PHImportAsset largeRender](self, "largeRender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_addRelatedRecordsToRecord:primaryRecord:", v11, v7);

  }
  -[PHImportAsset largeMovieRender](self, "largeMovieRender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [PHImportRecord alloc];
    -[PHImportAsset largeMovieRender](self, "largeMovieRender");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PHImportRecord initWithImportAsset:](v14, "initWithImportAsset:", v15);

    objc_msgSend(v6, "addRelatedRecord:", v16);
    -[PHImportAsset largeMovieRender](self, "largeMovieRender");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_addRelatedRecordsToRecord:primaryRecord:", v16, v7);

  }
  -[PHImportAsset rawAsset](self, "rawAsset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = [PHImportRecord alloc];
    -[PHImportAsset rawAsset](self, "rawAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PHImportRecord initWithImportAsset:](v19, "initWithImportAsset:", v20);

    objc_msgSend(v6, "addRelatedRecord:", v21);
    -[PHImportAsset rawAsset](self, "rawAsset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_addRelatedRecordsToRecord:primaryRecord:", v21, v7);

  }
  -[PHImportAsset videoComplement](self, "videoComplement");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [PHImportRecord alloc];
    -[PHImportAsset videoComplement](self, "videoComplement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PHImportRecord initWithImportAsset:](v24, "initWithImportAsset:", v25);

    objc_msgSend(v6, "addRelatedRecord:", v26);
    -[PHImportAsset videoComplement](self, "videoComplement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_addRelatedRecordsToRecord:primaryRecord:", v26, v7);

  }
  -[PHImportAsset audioAsset](self, "audioAsset");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = [PHImportRecord alloc];
    -[PHImportAsset audioAsset](self, "audioAsset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PHImportRecord initWithImportAsset:](v29, "initWithImportAsset:", v30);

    objc_msgSend(v6, "addRelatedRecord:", v31);
    -[PHImportAsset audioAsset](self, "audioAsset");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_addRelatedRecordsToRecord:primaryRecord:", v31, v7);

  }
  -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [PHImportRecord alloc];
    -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[PHImportRecord initWithImportAsset:](v34, "initWithImportAsset:", v35);

    objc_msgSend(v6, "addRelatedRecord:", v36);
    -[PHImportAsset spatialOverCapture](self, "spatialOverCapture");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_addRelatedRecordsToRecord:primaryRecord:", v36, v7);

  }
  -[PHImportAsset base](self, "base");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = [PHImportRecord alloc];
    -[PHImportAsset base](self, "base");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PHImportRecord initWithImportAsset:](v39, "initWithImportAsset:", v40);

    objc_msgSend(v6, "addRelatedRecord:", v41);
    -[PHImportAsset base](self, "base");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_addRelatedRecordsToRecord:primaryRecord:", v41, v7);

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PHImportAsset sidecarAssets](self, "sidecarAssets", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v50;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(v43);
        v48 = -[PHImportRecord initWithImportAsset:]([PHImportRecord alloc], "initWithImportAsset:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v47));
        objc_msgSend(v6, "addRelatedRecord:", v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v45);
  }

}

- (id)copyFromURL:(id)a3 toURL:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  PHImportException *v12;
  PHImportException *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v8, v7, &v17);

  v11 = v17;
  v12 = 0;
  if ((v10 & 1) == 0)
  {
    v13 = [PHImportException alloc];
    -[PHImportAsset url](self, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PHImportException initWithType:path:underlyingError:file:line:](v13, "initWithType:path:underlyingError:file:line:", 0, v15, v11, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m", 1792);

  }
  return v12;
}

- (void)copyToURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PHImportException *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[6];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  -[PHImportAsset filePresenter](self, "filePresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6064;
  v24 = __Block_byref_object_dispose__6065;
  v25 = 0;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v8);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", v8);
    -[PHImportAsset url](self, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__PHImportAsset_copyToURL_completionHandler___block_invoke;
    v18[3] = &unk_1E35D6FC8;
    v18[4] = self;
    v18[5] = &v20;
    objc_msgSend(v9, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v10, 1, v6, 0, &v19, v18);
    v11 = v19;

    if (v11)
    {
      v12 = [PHImportException alloc];
      -[PHImportAsset url](self, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PHImportException initWithType:path:underlyingError:file:line:](v12, "initWithType:path:underlyingError:file:line:", 0, v14, v11, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m", 1808);
      v16 = (void *)v21[5];
      v21[5] = v15;

    }
    objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", v8);
  }
  else
  {
    -[PHImportAsset url](self, "url");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v17 = -[PHImportAsset copyFromURL:toURL:](self, "copyFromURL:toURL:", v11, v6);
    v9 = (void *)v21[5];
    v21[5] = (uint64_t)v17;
  }

  v7[2](v7, v6, v21[5]);
  _Block_object_dispose(&v20, 8);

}

- (id)fingerprint
{
  return 0;
}

- (id)originatingAssetID
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__PHImportAsset_originatingAssetID__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSDate)creationDate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__PHImportAsset_creationDate__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

- (NSTimeZone)timeZone
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportAsset_timeZone__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSTimeZone *)v2;
}

- (NSString)title
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__PHImportAsset_title__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSSet)keywordTitles
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__PHImportAsset_keywordTitles__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

- (NSString)assetDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PHImportAsset_assetDescription__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSString)accessibilityDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6064;
  v9 = __Block_byref_object_dispose__6065;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PHImportAsset_accessibilityDescription__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHImportAsset _accessMetadata:](self, "_accessMetadata:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (NSDate)dateKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PHImportAsset creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PHImportAsset fileCreationDate](self, "fileCreationDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (id)sizeKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PHImportAsset fileSize](self, "fileSize"));
}

- (void)setDuplicates:(id)a3 forLibrary:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_duplicates, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)duplicateAssetsForLibrary:(id)a3
{
  NSMutableDictionary *duplicates;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  duplicates = self->_duplicates;
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](duplicates, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("objectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchPHObjectsForOIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (id)userMetadata
{
  return self->_userMetadata;
}

- (void)setUserMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_userMetadata, a3);
}

- (unint64_t)hash
{
  PLRunWithUnfairLock();
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  PHImportAsset *v4;
  PHImportAsset *v5;
  BOOL v6;

  v4 = (PHImportAsset *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PHImportAsset isEqualToImportAsset:](self, "isEqualToImportAsset:", v5);

  return v6;
}

- (BOOL)isEqualToImportAsset:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[PHImportAsset hash](self, "hash");
  if (v5 == objc_msgSend(v4, "hash"))
  {
    -[PHImportAsset relatedAssets](self, "relatedAssets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relatedAssets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    if (v8 == objc_msgSend(v7, "count") && objc_msgSend(v6, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
          break;
        ++v9;
      }
      while (v9 < objc_msgSend(v6, "count"));
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)duplicateStateConfidence
{
  return self->_duplicateStateConfidence;
}

- (void)setDuplicateStateConfidence:(unsigned __int8)a3
{
  self->_duplicateStateConfidence = a3;
}

- (NSMutableArray)relatedBurstAssets
{
  return self->_relatedBurstAssets;
}

- (void)setRelatedBurstAssets:(id)a3
{
  objc_storeStrong((id *)&self->_relatedBurstAssets, a3);
}

- (PHImportAsset)burstPick
{
  return self->_burstPick;
}

- (void)setBurstPick:(id)a3
{
  objc_storeStrong((id *)&self->_burstPick, a3);
}

- (id)avchdAssetId
{
  return objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (NSMutableDictionary)duplicates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDuplicates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)lastDuplicateCheck
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastDuplicateCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (UTType)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)createdFileName
{
  return self->_createdFileName;
}

- (void)setCreatedFileName:(id)a3
{
  objc_storeStrong((id *)&self->_createdFileName, a3);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
  objc_storeStrong((id *)&self->_fileExtension, a3);
}

- (NSSet)duplicateAssets
{
  return self->_duplicateAssets;
}

- (PHImportAsset)rawAsset
{
  return self->_rawAsset;
}

- (PHImportAsset)videoComplement
{
  return self->_videoComplement;
}

- (PHImportAsset)largeRender
{
  return self->_largeRender;
}

- (PHImportAsset)largeMovieRender
{
  return self->_largeMovieRender;
}

- (PHImportAsset)spatialOverCapture
{
  return self->_spatialOverCapture;
}

- (PHImportAsset)base
{
  return self->_base;
}

- (PHImportAsset)thumbnailRender
{
  return self->_thumbnailRender;
}

- (void)setThumbnailRender:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailRender, a3);
}

- (PHImportAsset)miniRender
{
  return self->_miniRender;
}

- (void)setMiniRender:(id)a3
{
  objc_storeStrong((id *)&self->_miniRender, a3);
}

- (PHImportAsset)audioAsset
{
  return self->_audioAsset;
}

- (NSDate)fileCreationDate
{
  return self->_fileCreationDate;
}

- (void)setFileCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_fileCreationDate, a3);
}

- (NSDate)fileModificationDate
{
  return self->_fileModificationDate;
}

- (void)setFileModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_fileModificationDate, a3);
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (BOOL)treatAsUnsupportedRAW
{
  return self->_treatAsUnsupportedRAW;
}

- (void)setTreatAsUnsupportedRAW:(BOOL)a3
{
  self->_treatAsUnsupportedRAW = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (AVAssetImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_imageGenerator, a3);
}

- (OS_dispatch_queue)loadSidecars
{
  return self->_loadSidecars;
}

- (void)setLoadSidecars:(id)a3
{
  objc_storeStrong((id *)&self->_loadSidecars, a3);
}

- (BOOL)sidecarsLoaded
{
  return self->_sidecarsLoaded;
}

- (void)setSidecarsLoaded:(BOOL)a3
{
  self->_sidecarsLoaded = a3;
}

- (void)setImportIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_importIdentifier, a3);
}

- (PHImportAssetFilePresenter)filePresenter
{
  return self->_filePresenter;
}

- (void)setFilePresenter:(id)a3
{
  objc_storeStrong((id *)&self->_filePresenter, a3);
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (unint64_t)copyMethod
{
  return self->_copyMethod;
}

- (void)setCopyMethod:(unint64_t)a3
{
  self->_copyMethod = a3;
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
  objc_storeStrong((id *)&self->_fileData, a3);
}

- (unsigned)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileLocation:(unsigned __int8)a3
{
  self->_fileLocation = a3;
}

- (PHImportSource)source
{
  return (PHImportSource *)objc_loadWeakRetained((id *)&self->_source);
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(int64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)resourceSubType
{
  return self->_resourceSubType;
}

- (void)setResourceSubType:(unint64_t)a3
{
  self->_resourceSubType = a3;
}

- (NSMutableDictionary)sidecarAssetsByType
{
  return self->_sidecarAssetsByType;
}

- (void)setSidecarAssetsByType:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarAssetsByType, a3);
}

- (NSDictionary)customAssetProperties
{
  return self->_customAssetProperties;
}

- (void)setCustomAssetProperties:(id)a3
{
  objc_storeStrong((id *)&self->_customAssetProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAssetProperties, 0);
  objc_storeStrong((id *)&self->_sidecarAssetsByType, 0);
  objc_storeStrong((id *)&self->_fileData, 0);
  objc_storeStrong((id *)&self->_filePresenter, 0);
  objc_storeStrong((id *)&self->_importIdentifier, 0);
  objc_storeStrong((id *)&self->_loadSidecars, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_fileCreationDate, 0);
  objc_storeStrong((id *)&self->_audioAsset, 0);
  objc_storeStrong((id *)&self->_miniRender, 0);
  objc_storeStrong((id *)&self->_thumbnailRender, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_spatialOverCapture, 0);
  objc_storeStrong((id *)&self->_largeMovieRender, 0);
  objc_storeStrong((id *)&self->_largeRender, 0);
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_duplicateAssets, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_createdFileName, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_lastDuplicateCheck, 0);
  objc_storeStrong((id *)&self->_duplicates, 0);
  objc_storeStrong(&self->_avchdAssetId, 0);
  objc_storeStrong((id *)&self->_burstPick, 0);
  objc_storeStrong((id *)&self->_relatedBurstAssets, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_basenameForOriginalAdjustment, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userMetadata, 0);
  objc_storeStrong((id *)&self->_strongSource, 0);
  objc_destroyWeak((id *)&self->_source);
}

void __21__PHImportAsset_hash__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[37])
  {
    objc_msgSend(v2, "fileName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "hash");
    v4 = objc_msgSend(*(id *)(a1 + 32), "fileSize") + v3;
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = v4 + objc_msgSend(v5, "hash");

  }
}

void __41__PHImportAsset_accessibilityDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "artworkContentDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__PHImportAsset_assetDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "captionAbstract");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __30__PHImportAsset_keywordTitles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "keywords");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __22__PHImportAsset_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __25__PHImportAsset_timeZone__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "timeZone");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_creationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "utcCreationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __35__PHImportAsset_originatingAssetID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "originatingAssetIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__PHImportAsset_copyToURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(*(id *)(a1 + 32), "copyFromURL:toURL:", a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __49__PHImportAsset_validateMetadataForImportRecord___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_loadMetadataIfNecessaryForURL:options:", *(_QWORD *)(a1 + 40), 22))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isImage") && (objc_msgSend(*(id *)(a1 + 32), "isRAW") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "exifPixelSize");
      if (v3 == *MEMORY[0x1E0C9D820] && v2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v5 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "path");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addExceptionWithType:path:underlyingError:file:line:", 2);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

      }
    }
  }
  else
  {
    PLImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "redactedFileNameDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Failed to get ImageIO metadata for file %@", buf, 0xCu);

    }
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addExceptionWithType:path:underlyingError:file:line:", 2, v12, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportAsset.m", 1611);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

void __50__PHImportAsset_avThumbnailOfSize_canceler_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "cancelAllCGImageGeneration");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCancelBlock:", 0);

}

void __45__PHImportAsset_thumbnailUsingRequest_atEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  CGImage *v16;
  double Width;
  double Height;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Request for thumbnail for %@ was canceled."), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImportErrorDomain"), -4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v2 + 16))(v2, 0, v3, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isImage");
    v12 = objc_msgSend(*(id *)(a1 + 32), "longestSide");
    v13 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v23 = 0;
      v14 = (id *)&v23;
      v15 = objc_msgSend(v6, "imageThumbnailOfSize:canceler:error:", v12, v13, &v23);
    }
    else
    {
      v22 = 0;
      v14 = (id *)&v22;
      v15 = objc_msgSend(v6, "avThumbnailOfSize:canceler:error:", v12, v13, &v22);
    }
    v16 = (CGImage *)v15;
    v7 = *v14;
    if (v16)
    {
      Width = (double)CGImageGetWidth(v16);
      Height = (double)CGImageGetHeight(v16);
      objc_msgSend(*(id *)(a1 + 40), "thumbnailSize");
      if (v20 != Width || v19 != Height)
        objc_msgSend(*(id *)(a1 + 40), "setThumbnailSize:", Width, Height);
      objc_msgSend(*(id *)(a1 + 40), "loadMetadataSync");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __29__PHImportAsset_setMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setMetadata:", *(_QWORD *)(a1 + 40));
}

void __25__PHImportAsset_metadata__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __35__PHImportAsset_loadMetadataAsync___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "loadMetadataSync");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __33__PHImportAsset_loadMetadataSync__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "url");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_loadMetadataIfNecessaryForURL:options:", v2, 29);

}

_BYTE *__33__PHImportAsset_loadSidecarFiles__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[60])
  {
    result = (_BYTE *)objc_msgSend(result, "_loadSidecarFiles");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 60) = 1;
  }
  return result;
}

void __28__PHImportAsset_trackFormat__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "audioTrackFormat");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __24__PHImportAsset_bitrate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "audioDataRate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __27__PHImportAsset_sampleRate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "audioSampleRate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __20__PHImportAsset_fps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "nominalFrameRate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __22__PHImportAsset_codec__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "videoCodecName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_exposureTime__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "exposureTime");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __24__PHImportAsset_fNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "fNumber");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_exposureBias__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "exposureBias");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__PHImportAsset_digitalZoomRatio__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "digitalZoomRatio");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __34__PHImportAsset_focalLengthIn35mm__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "focalLengthIn35mm");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__PHImportAsset_focalLength__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "focalLength");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __20__PHImportAsset_iso__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "iso");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_meteringMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "meteringMode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_whiteBalance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "whiteBalance");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __27__PHImportAsset_flashFired__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "flashFired");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __26__PHImportAsset_lensModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "lensModel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __28__PHImportAsset_cameraModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cameraModel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __27__PHImportAsset_cameraMake__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cameraMake");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__PHImportAsset_durationTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "durationTimeInterval");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__PHImportAsset_spatialOverCaptureIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "spatialOverCaptureIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__PHImportAsset_livePhotoPairingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "livePhotoPairingIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29__PHImportAsset_groupingUUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "groupingUuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __26__PHImportAsset_burstUUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "burstUuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __34__PHImportAsset_orientedPixelSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "orientedPixelSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

uint64_t __30__PHImportAsset_exifPixelSize__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "exifPixelSize");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

uint64_t __28__PHImportAsset_orientation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "orientation");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __23__PHImportAsset_isBase__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}B\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)isBase_isBaseRegex;
  isBase_isBaseRegex = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}B\\d{4}': %@", buf, 0xCu);
    }

  }
}

void __37__PHImportAsset_isSpatialOverCapture__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}S\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)isSpatialOverCapture_isSocRegex;
  isSpatialOverCapture_isSocRegex = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}S\\d{4}': %@", buf, 0xCu);
    }

  }
}

void __42__PHImportAsset_isAdjustmentSecondaryData__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}A\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)isAdjustmentSecondaryData_regex;
  isAdjustmentSecondaryData_regex = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}A\\d{4}': %@", buf, 0xCu);
    }

  }
}

void __25__PHImportAsset_isRender__block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}E\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)isRender_isRenderedRegex;
  isRender_isRenderedRegex = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}E\\d{4}': %@", buf, 0xCu);
    }

  }
}

uint64_t __23__PHImportAsset_isSDOF__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isSDOF");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __22__PHImportAsset_isHDR__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isHDR");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __28__PHImportAsset_isTimelapse__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isTimelapse");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __24__PHImportAsset_isSloMo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isSloMo");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)isValidAsSidecar:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (objc_msgSend(v4, "isEqualToString:", CFSTR("AAE")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("SLM")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("XMP")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("DAT"));

  return v5;
}

+ (id)assetFileForURL:(id)a3 source:(id)a4
{
  return (id)objc_msgSend(a1, "assetFileForURL:source:withUuid:", a3, a4, 0);
}

+ (id)assetFileForURL:(id)a3 source:(id)a4 withUuid:(id)a5
{
  id v8;
  id v9;
  NSObject *p_super;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  PHImportAssetBundleAsset *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __objc2_class **v30;
  uint64_t v31;
  uint64_t v32;
  PHImportAsset *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  PHImportAsset *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v43 = a5;
  p_super = 0;
  if (v8 && v9)
  {
    v11 = +[PHValidator mediaTypeForURL:](PHValidator, "mediaTypeForURL:", v8);
    if (!(_DWORD)v11)
    {
      objc_msgSend(v8, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(a1, "isValidAsSidecar:", v12);

      if (v13)
        v11 = 64;
      else
        v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D752F0], "typeForURL:error:", v8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 >= 2)
    {
      v15 = (PHImportAssetBundleAsset *)objc_msgSend(objc_alloc((Class)a1), "initWithSource:url:type:supportedMediaType:uuid:", v9, v8, v14, v11, v43);
      goto LABEL_9;
    }
    if (!PFIsLivePhotoBundleType())
    {
      objc_msgSend(MEMORY[0x1E0D750B8], "contentType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v14, "conformsToType:", v22);

      if (!v23)
      {
        PLImportGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v51 = v25;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "Unable to create a import asset for resource '%@'", buf, 0xCu);

        }
        p_super = 0;
        goto LABEL_36;
      }
      v15 = -[PHImportAssetBundleAsset initWithAssetBundleAtURL:withImportSource:]([PHImportAssetBundleAsset alloc], "initWithAssetBundleAtURL:withImportSource:", v8, v9);
LABEL_9:
      p_super = &v15->super.super;
LABEL_36:

      goto LABEL_37;
    }
    v16 = (void *)objc_opt_new();
    objc_msgSend(v8, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v17, &v48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v48;

    if (v19)
    {
      PLImportGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v51 = v21;
        v52 = 2112;
        v53 = v19;

      }
      p_super = 0;
LABEL_35:

      goto LABEL_36;
    }
    v40 = v18;
    v41 = v16;
    v42 = v14;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v18;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (!v27)
    {
      v20 = 0;
      p_super = 0;
      goto LABEL_34;
    }
    v28 = v27;
    v20 = 0;
    p_super = 0;
    v29 = *(_QWORD *)v45;
    v30 = off_1E35D3000;
LABEL_22:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v29)
        objc_enumerationMutation(v26);
      v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v31);
      if (-[__objc2_class isSupportedImageAtPath:](v30[65], "isSupportedImageAtPath:", v32))
        break;
      if (-[__objc2_class isSupportedMovieAtPath:](v30[65], "isSupportedMovieAtPath:", v32))
      {
        v37 = [PHImportAsset alloc];
        objc_msgSend(v8, "URLByAppendingPathComponent:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v37, "initWithSource:url:type:supportedMediaType:uuid:", v9, v34, 0, 16, v43);
        v36 = v20;
        v20 = v38;
        goto LABEL_29;
      }
LABEL_30:
      if (v28 == ++v31)
      {
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (!v28)
        {
LABEL_34:

          -[NSObject setVideoComplement:](p_super, "setVideoComplement:", v20);
          v16 = v41;
          v14 = v42;
          v19 = 0;
          v18 = v40;
          goto LABEL_35;
        }
        goto LABEL_22;
      }
    }
    v33 = [PHImportAsset alloc];
    objc_msgSend(v8, "URLByAppendingPathComponent:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PHImportAsset initWithSource:url:type:supportedMediaType:uuid:](v33, "initWithSource:url:type:supportedMediaType:uuid:", v9, v34, 0, 2, v43);
    v36 = p_super;
    p_super = v35;
LABEL_29:

    v30 = off_1E35D3000;
    goto LABEL_30;
  }
LABEL_37:

  return p_super;
}

+ (void)logImageDateFileDateDifferencesForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileCreationDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("!!!!!!!!!!");
  if (v4 && v5)
  {
    if (objc_msgSend(v4, "compare:", v5))
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (double)objc_msgSend(v8, "secondsFromGMTForDate:", v4);

      objc_msgSend(v4, "dateByAddingTimeInterval:", -v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "compare:", v6))
        v7 = CFSTR("----------");
      else
        v7 = CFSTR("<-<-<-<-<-");

    }
    else
    {
      v7 = CFSTR("++++++++++");
    }
  }
  PLImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "redactedFileNameDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = v7;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEBUG, "%@ CreateDate: %@, AlternateDate: %@, Name: %@", (uint8_t *)&v13, 0x2Au);

  }
}

+ (id)loadDatesForAssetSequence:(id)a3 atEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "loadDatesForAssets:atEnd:", v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)loadDatesForAssets:(id)a3 atEnd:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD block[4];
  id v16;
  id v17;
  void (**v18)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v5, "count")
    && (objc_msgSend(v5, "objectAtIndexedSubscript:", 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    v10 = (void *)objc_opt_new();
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke;
    block[3] = &unk_1E35DF3B8;
    v16 = v5;
    v12 = v10;
    v17 = v12;
    v18 = v6;
    dispatch_async(v11, block);

    v13 = v18;
    v9 = v12;

  }
  else
  {
    if (v6)
      v6[2](v6);
    v9 = 0;
  }

  return v9;
}

+ (void)determineIfTIFFIsRAW:(id)a3 url:(id)a4
{
  id v5;
  const __CFURL *v6;
  int v7;
  const __CFDictionary *v8;
  CGImageSource *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const __CFURL *)a4;
  v7 = objc_msgSend(v5, "isTIFF");
  if (v6)
  {
    if (v7)
    {
      v12 = *MEMORY[0x1E0CBD288];
      v13[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = CGImageSourceCreateWithURL(v6, v8);

      if (v9)
      {
        CGImageSourceGetType(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "updateIsRAW:contentType:", objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC5B8]), v11);

        }
        CFRelease(v9);

      }
    }
  }

}

+ (BOOL)isOriginalAdjustmentData:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = isOriginalAdjustmentData__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isOriginalAdjustmentData__onceToken, &__block_literal_global_210);
  v5 = objc_msgSend((id)isOriginalAdjustmentData__isAdjustmentBaseDataRegEx, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

+ (BOOL)fileExists:(id)a3
{
  stat v5;

  memset(&v5, 0, sizeof(v5));
  return !stat((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v5)
      && (v5.st_mode & 0x8000u) != 0;
}

+ (BOOL)directoryExists:(id)a3
{
  stat v4;

  memset(&v4, 0, sizeof(v4));
  return !stat((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v4)
      && (v4.st_mode & 0x4000) != 0;
}

void __42__PHImportAsset_isOriginalAdjustmentData___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}O\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)isOriginalAdjustmentData__isAdjustmentBaseDataRegEx;
  isOriginalAdjustmentData__isAdjustmentBaseDataRegEx = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}O\\d{4}': %@", buf, 0xCu);
    }

  }
}

void __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (PHImportConcurrencyLimit_onceToken != -1)
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4570);
  v3 = PHImportConcurrencyLimit_concurrencyLimit;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke_2;
  v6[3] = &unk_1E35D8CD0;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  +[PHImportController dispatchApply:withConcurrencyLimit:canceler:ofBlock:](PHImportController, "dispatchApply:withConcurrencyLimit:canceler:ofBlock:", v2, v3, v4, v6);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __42__PHImportAsset_loadDatesForAssets_atEnd___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadMetadataSync");

}

@end
