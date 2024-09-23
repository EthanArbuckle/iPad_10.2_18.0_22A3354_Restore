@implementation INFile

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  -[INFile fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)INFile;
    v9 = -[NSObject _intents_enumerateObjectsOfClass:withBlock:](&v11, sel__intents_enumerateObjectsOfClass_withBlock_, a3, v6);
  }

  return v9;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INFile _isFileURLBased](self, "_isFileURLBased"))
  {
    -[INFile fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("fileURL");
  }
  else
  {
    -[INFile _bookmarkData](self, "_bookmarkData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[INFile _bookmarkData](self, "_bookmarkData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("_bookmarkData");
    }
    else
    {
      -[INFile data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("data");
    }
  }
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, v9);

  -[INFile filename](self, "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, CFSTR("filename"));

  -[INFile typeIdentifier](self, "typeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, CFSTR("typeIdentifier"));

  -[INFile _removedOnCompletionValue](self, "_removedOnCompletionValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v16, CFSTR("removedOnCompletion"));

  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  INFile *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v28 = 0;
    goto LABEL_9;
  }
  v10 = objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("filename"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("removedOnCompletion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fileURL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fileURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = [INFile alloc];
    v24 = 0;
    v25 = v12;
    v26 = v22;
LABEL_5:
    v27 = -[INFile _initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:](v23, "_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", v24, v25, v26, v15, v18);
    goto LABEL_6;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("filename"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decodeObjectOfClass:from:", v33, v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = [INFile alloc];
      v24 = v22;
      v25 = v12;
      v26 = 0;
      goto LABEL_5;
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_bookmarkData"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    v28 = 0;
    goto LABEL_7;
  }
  v36 = objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_bookmarkData"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClass:from:", v36, v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[INFile _initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:]([INFile alloc], "_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v22, v12, v15, v18);
LABEL_6:
  v28 = v27;

LABEL_7:
LABEL_9:

  return v28;
}

- (NSData)data
{
  NSData *data;
  NSURL *fileURL;
  NSData *v5;
  NSData *memoryMappedFileData;

  data = self->_data;
  if (!data)
  {
    data = self->_memoryMappedFileData;
    if (!data)
    {
      fileURL = self->_fileURL;
      if (fileURL)
      {
        -[NSURL startAccessingSecurityScopedResource](fileURL, "startAccessingSecurityScopedResource");
        v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", self->_fileURL, 8, 0);
        memoryMappedFileData = self->_memoryMappedFileData;
        self->_memoryMappedFileData = v5;

        -[NSURL stopAccessingSecurityScopedResource](self->_fileURL, "stopAccessingSecurityScopedResource");
        data = self->_memoryMappedFileData;
      }
      else
      {
        data = 0;
      }
    }
  }
  return data;
}

- (NSString)filename
{
  NSString *filename;

  filename = self->_filename;
  if (filename)
    return filename;
  -[NSURL lastPathComponent](self->_fileURL, "lastPathComponent");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)fileURL
{
  NSURL *fileURL;
  id *p_bookmarkData;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  fileURL = self->_fileURL;
  if (fileURL)
    return fileURL;
  p_bookmarkData = (id *)&self->_bookmarkData;
  if (self->_bookmarkData)
  {
    _INVCVoiceShortcutClient();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *p_bookmarkData;
    v12 = 0;
    v13 = 0;
    objc_msgSend(v5, "resolveBookmarkData:updatedData:error:", v6, &v13, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = v13;
    v10 = v12;
    objc_msgSend(v7, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_storeStrong(p_bookmarkData, v8);

  }
  else
  {
    v11 = 0;
  }
  return (NSURL *)v11;
}

- (BOOL)removedOnCompletion
{
  void *v2;
  char v3;

  -[INFile _removedOnCompletionValue](self, "_removedOnCompletionValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", removedOnCompletion);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[INFile _setRemovedOnCompletionValue:](self, "_setRemovedOnCompletionValue:", v4);

}

- (id)_initWithData:(id)a3 filename:(id)a4 fileURL:(id)a5 typeIdentifier:(id)a6 removedOnCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INFile *v17;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  NSString *filename;
  uint64_t v22;
  NSString *typeIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)INFile;
  v17 = -[INFile init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    data = v17->_data;
    v17->_data = (NSData *)v18;

    v20 = objc_msgSend(v13, "copy");
    filename = v17->_filename;
    v17->_filename = (NSString *)v20;

    objc_storeStrong((id *)&v17->_fileURL, a5);
    v22 = objc_msgSend(v15, "copy");
    typeIdentifier = v17->_typeIdentifier;
    v17->_typeIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v17->_removedOnCompletionValue, a7);
  }

  return v17;
}

- (id)_initWithBookmarkData:(id)a3 filename:(id)a4 typeIdentifier:(id)a5 removedOnCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  INFile *v14;
  uint64_t v15;
  NSData *bookmarkData;
  uint64_t v17;
  NSString *filename;
  uint64_t v19;
  NSString *typeIdentifier;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INFile;
  v14 = -[INFile init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    bookmarkData = v14->_bookmarkData;
    v14->_bookmarkData = (NSData *)v15;

    v17 = objc_msgSend(v11, "copy");
    filename = v14->_filename;
    v14->_filename = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    typeIdentifier = v14->_typeIdentifier;
    v14->_typeIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_removedOnCompletionValue, a6);
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  NSURL *v8;
  id v9;
  NSObject *v10;
  NSURL *fileURL;
  NSObject *v12;
  NSURL *v13;
  NSURL *v14;
  objc_super v15;
  id v16;
  _OWORD v17[2];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSURL *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_fileURL
    && -[INFile _isMarkedForDeletionOnDeallocation](self, "_isMarkedForDeletionOnDeallocation")
    && -[INFile _hasAssociatedAuditToken](self, "_hasAssociatedAuditToken"))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "if_auditToken");
    else
      memset(v17, 0, sizeof(v17));
    v5 = -[INFile _associatedAuditTokenIsEqualToAuditToken:](self, "_associatedAuditTokenIsEqualToAuditToken:", v17);

    if (v5)
    {
      v6 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        fileURL = self->_fileURL;
        v12 = v6;
        -[NSURL absoluteString](fileURL, "absoluteString");
        v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v19 = "-[INFile dealloc]";
        v20 = 2112;
        v21 = v13;
        _os_log_debug_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_DEBUG, "%s Deleting file on deallocation: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self->_fileURL;
      v16 = 0;
      objc_msgSend(v7, "removeItemAtURL:error:", v8, &v16);
      v9 = v16;

      if (v9)
      {
        v10 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_fileURL;
          *(_DWORD *)buf = 136315650;
          v19 = "-[INFile dealloc]";
          v20 = 2112;
          v21 = v14;
          v22 = 2112;
          v23 = v9;
          _os_log_error_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_ERROR, "%s Error deleting file at URL: %@. Error: %@", buf, 0x20u);
        }
      }

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)INFile;
  -[INFile dealloc](&v15, sel_dealloc);
}

- (BOOL)_isFileURLBased
{
  return self->_fileURL != 0;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_data, "hash");
  v4 = -[NSData hash](self->_bookmarkData, "hash") ^ v3;
  v5 = -[NSString hash](self->_filename, "hash");
  v6 = v4 ^ v5 ^ -[NSURL hash](self->_fileURL, "hash");
  return v6 ^ -[NSString hash](self->_typeIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *data;
  NSString *filename;
  NSURL *fileURL;
  NSString *typeIdentifier;
  NSData *bookmarkData;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    data = self->_data;
    v11 = 0;
    if (data == (NSData *)v5[2] || -[NSData isEqual:](data, "isEqual:"))
    {
      filename = self->_filename;
      if (filename == (NSString *)v5[3] || -[NSString isEqual:](filename, "isEqual:"))
      {
        fileURL = self->_fileURL;
        if (fileURL == (NSURL *)v5[4] || -[NSURL isEqual:](fileURL, "isEqual:"))
        {
          typeIdentifier = self->_typeIdentifier;
          if (typeIdentifier == (NSString *)v5[9] || -[NSString isEqual:](typeIdentifier, "isEqual:"))
          {
            bookmarkData = self->_bookmarkData;
            if (bookmarkData == (NSData *)v5[5] || -[NSData isEqual:](bookmarkData, "isEqual:"))
              v11 = 1;
          }
        }
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (INFile)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  INFile *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bookmarkData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityScope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemProviderRequestMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && v8)
    MEMORY[0x18D780D9C](v7, v8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("removedOnCompletion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithBookmarkData:filename:typeIdentifier:removedOnCompletion:", v5, v6, v10, v11);
  }
  else
  {
    if (!(v15 | v7))
    {
      v13 = 0;
      goto LABEL_10;
    }
    v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", v15, v6, v7, v10, v11);
  }
  v13 = (INFile *)v12;
LABEL_10:
  -[INFile _setItemProviderRequestMetadata:](v13, "_setItemProviderRequestMetadata:", v9);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmarkData, CFSTR("_bookmarkData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filename, CFSTR("filename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileURL, CFSTR("fileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("typeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedOnCompletionValue, CFSTR("removedOnCompletion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemProviderRequestMetadata, CFSTR("_itemProviderRequestMetadata"));
  if (self->_fileURL)
  {
    v4 = (void *)MEMORY[0x18D780DA8]();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("securityScope"));

  }
}

- (id)_dictionaryRepresentation
{
  void *v3;
  uint64_t data;
  NSData *bookmarkData;
  uint64_t v6;
  NSString *filename;
  void *v8;
  NSURL *fileURL;
  void *v10;
  NSString *typeIdentifier;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  data = (uint64_t)self->_data;
  v19 = data;
  v20[0] = CFSTR("data");
  if (!data)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    data = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)data;
  v21[0] = data;
  v20[1] = CFSTR("bookmarkData");
  bookmarkData = self->_bookmarkData;
  v6 = (uint64_t)bookmarkData;
  if (!bookmarkData)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v6;
  v21[1] = v6;
  v20[2] = CFSTR("filename");
  filename = self->_filename;
  v8 = filename;
  if (!filename)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v6, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v8;
  v20[3] = CFSTR("fileURL");
  fileURL = self->_fileURL;
  v10 = fileURL;
  if (!fileURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[3] = v10;
  v20[4] = CFSTR("typeIdentifier");
  typeIdentifier = self->_typeIdentifier;
  v12 = typeIdentifier;
  if (!typeIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (typeIdentifier)
  {
    if (fileURL)
      goto LABEL_13;
  }
  else
  {

    if (fileURL)
    {
LABEL_13:
      if (filename)
        goto LABEL_14;
LABEL_20:

      if (bookmarkData)
        goto LABEL_15;
      goto LABEL_21;
    }
  }

  if (!filename)
    goto LABEL_20;
LABEL_14:
  if (bookmarkData)
    goto LABEL_15;
LABEL_21:

LABEL_15:
  if (!v19)

  objc_msgSend(v14, "if_setObjectIfNonNil:forKey:", self->_removedOnCompletionValue, CFSTR("removedOnCompletion"));
  return v14;
}

- (BOOL)_hasAssociatedAuditToken
{
  return INFileURLHasAssociatedAuditToken(self->_fileURL);
}

- (BOOL)_isMarkedForDeletionOnDeallocation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "if_BOOLForExtendedAttributeName:ofItemAtURL:", CFSTR("INFileURLIsMarkedForDeletionOnDeallocation"), self->_fileURL);

  return (char)self;
}

- (void)_setMarkedForDeletionOnDeallocation:(BOOL)a3
{
  INFileURLSetMarkedForDeletionOnDeallocation(self->_fileURL, a3);
}

- (BOOL)_associatedAuditTokenIsEqualToAuditToken:(id *)a3
{
  NSURL *fileURL;
  $115C4C562B26FF47E01F9F4EA65B5887 v8;
  __int128 v9;
  __int128 v10;

  fileURL = self->_fileURL;
  v8 = *a3;
  v9 = 0u;
  v10 = 0u;
  INFileURLGetAssociatedAuditToken(fileURL, &v9);
  return (_QWORD)v9 == *(_QWORD *)v8.var0
      && *((_QWORD *)&v9 + 1) == *(_QWORD *)&v8.var0[2]
      && (_QWORD)v10 == *(_QWORD *)&v8.var0[4]
      && *((_QWORD *)&v10 + 1) == *(_QWORD *)&v8.var0[6];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_associatedAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  INFileURLGetAssociatedAuditToken(self->_fileURL, retstr);
  return result;
}

- (void)_setAssociatedAuditToken:(id *)a3
{
  NSURL *fileURL;
  __int128 v4;
  _OWORD v5[2];

  fileURL = self->_fileURL;
  v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  INFileURLSetAssociatedAuditToken(fileURL, v5);
}

- (void)loadFileRepresentationWithType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _INVCVoiceShortcutClient();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[INFile _itemProviderRequestMetadata](self, "_itemProviderRequestMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _INItemProviderMetadataFromData(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__INFile_loadFileRepresentationWithType_completion___block_invoke;
    v13[3] = &unk_1E2293D08;
    v14 = v7;
    objc_msgSend(v8, "loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:", v11, v6, 1, v13);

  }
  else
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[INFile loadFileRepresentationWithType:completion:]";
      _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
  }

}

- (void)loadDataRepresentationWithType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _INVCVoiceShortcutClient();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[INFile _itemProviderRequestMetadata](self, "_itemProviderRequestMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _INItemProviderMetadataFromData(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__INFile_loadDataRepresentationWithType_completion___block_invoke;
    v13[3] = &unk_1E2293D30;
    v14 = v7;
    objc_msgSend(v8, "loadDataWithItemProviderRequestMetadata:type:completion:", v11, v6, v13);

  }
  else
  {
    v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[INFile loadDataRepresentationWithType:completion:]";
      _os_log_error_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
  }

}

- (NSItemProvider)_itemProvider
{
  NSItemProvider *itemProvider;
  NSItemProvider *v4;
  NSItemProvider *v5;

  itemProvider = self->_itemProvider;
  if (!itemProvider)
  {
    -[INFile itemProvider](self, "itemProvider");
    v4 = (NSItemProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_itemProvider;
    self->_itemProvider = v4;

    itemProvider = self->_itemProvider;
  }
  return itemProvider;
}

- (id)itemProvider
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[INFile _itemProviderRequestMetadata](self, "_itemProviderRequestMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedContentTypes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  if (objc_msgSend(v21, "count"))
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[INFile itemProvider]";
      v38 = 2112;
      v39 = v21;
      _os_log_debug_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_DEBUG, "%s Registering type identifiers: %@ for item provider with itemProviderRequestMetadata", buf, 0x16u);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v21;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10);
          v24[0] = v8;
          v24[1] = 3221225472;
          v24[2] = __22__INFile_itemProvider__block_invoke_46;
          v24[3] = &unk_1E2293DA8;
          objc_copyWeak(&v25, &location);
          v24[4] = v11;
          objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v11, 1, 0, v24);
          objc_destroyWeak(&v25);
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v7);
    }

    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __22__INFile_itemProvider__block_invoke_2_47;
    v22[3] = &unk_1E2293D80;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.lplinkmetadata"), 0, v22);
    objc_destroyWeak(&v23);
  }
  else
  {
    -[INFile typeIdentifier](self, "typeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    v14 = INSiriLogContextIntents;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[INFile itemProvider]";
        _os_log_debug_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_DEBUG, "%s Did not find a typeIdentifier returning an empty item provider!", buf, 0xCu);
      }
    }
    else
    {
      v15 = (id)INSiriLogContextIntents;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[INFile typeIdentifier](self, "typeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v37 = "-[INFile itemProvider]";
        v38 = 2112;
        v39 = v20;
        _os_log_debug_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_DEBUG, "%s Using natural type: %@ because no item provider metadata was found", buf, 0x16u);

      }
      -[INFile fileURL](self, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[INFile typeIdentifier](self, "typeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __22__INFile_itemProvider__block_invoke;
        v32[3] = &unk_1E2293D58;
        v18 = &v33;
        objc_copyWeak(&v33, &location);
        objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v17, 1, 0, v32);
      }
      else
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __22__INFile_itemProvider__block_invoke_2;
        v30[3] = &unk_1E2293D80;
        v18 = &v31;
        objc_copyWeak(&v31, &location);
        objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v17, 0, v30);
      }

      objc_destroyWeak(v18);
    }
  }
  objc_destroyWeak(&location);

  return v3;
}

- (void)setFilename:(NSString *)filename
{
  objc_setProperty_nonatomic_copy(self, a2, filename, 24);
}

- (NSData)_bookmarkData
{
  return self->_bookmarkData;
}

- (NSNumber)_removedOnCompletionValue
{
  return self->_removedOnCompletionValue;
}

- (void)_setRemovedOnCompletionValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (INItemProviderRequestMetadata)_itemProviderRequestMetadata
{
  return self->_itemProviderRequestMetadata;
}

- (void)_setItemProviderRequestMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_itemProviderRequestMetadata, 0);
  objc_storeStrong((id *)&self->_removedOnCompletionValue, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_memoryMappedFileData, 0);
}

uint64_t __22__INFile_itemProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, void *, uint64_t, _QWORD);
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5, 1, 0);

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, void *, _QWORD);
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5, 0);

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_46(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "loadFileRepresentationWithType:completion:", *(_QWORD *)(a1 + 32), v4);

  return 0;
}

uint64_t __22__INFile_itemProvider__block_invoke_2_47(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_itemProviderRequestMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _INItemProviderMetadataFromData(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __22__INFile_itemProvider__block_invoke_3;
  v10[3] = &unk_1E2293DD0;
  v11 = v3;
  v8 = v3;
  objc_msgSend(v7, "fetchLinkMetadataWithCompletion:", v10);

  return 0;
}

void __22__INFile_itemProvider__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __52__INFile_loadDataRepresentationWithType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    v8 = v7;
    v9 = 136315650;
    v10 = "-[INFile loadDataRepresentationWithType:completion:]_block_invoke";
    v11 = 2048;
    v12 = objc_msgSend(v5, "length");
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_DEBUG, "%s Loaded data: %lu with error: %@", (uint8_t *)&v9, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __52__INFile_loadFileRepresentationWithType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  _BYTE v16[22];
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_DEBUG))
  {
    v12 = v9;
    objc_msgSend(v7, "url");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("NO");
    *(_DWORD *)v16 = 136315906;
    *(_QWORD *)&v16[4] = "-[INFile loadFileRepresentationWithType:completion:]_block_invoke";
    if ((_DWORD)a3)
      v15 = CFSTR("YES");
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v13;
    v17 = 2112;
    v18 = v15;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_DEBUG, "%s Loaded file url: %@ with wasOpenedInPlace: %@ error: %@", v16, 0x2Au);

  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "url", *(_OWORD *)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, id))(v10 + 16))(v10, v11, a3, v8);

}

+ (INFile)fileWithData:(NSData *)data filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier
{
  NSString *v7;
  NSString *v8;
  NSData *v9;
  id v10;

  v7 = typeIdentifier;
  v8 = filename;
  v9 = data;
  v10 = -[INFile _initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:]([INFile alloc], "_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", v9, v8, 0, v7, 0);

  return (INFile *)v10;
}

+ (INFile)fileWithFileURL:(NSURL *)fileURL filename:(NSString *)filename typeIdentifier:(NSString *)typeIdentifier
{
  NSString *v7;
  NSString *v8;
  NSURL *v9;
  id v10;

  v7 = typeIdentifier;
  v8 = filename;
  v9 = fileURL;
  v10 = -[INFile _initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:]([INFile alloc], "_initWithData:filename:fileURL:typeIdentifier:removedOnCompletion:", 0, v8, v9, v7, 0);

  return (INFile *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
