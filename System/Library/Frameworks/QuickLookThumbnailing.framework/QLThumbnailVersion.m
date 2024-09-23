@implementation QLThumbnailVersion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameExtension, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_generatorVersion, 0);
  objc_storeStrong((id *)&self->_generatorID, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

- (QLThumbnailVersion)initWithFileURL:(id)a3 automaticallyGenerated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  QLThumbnailVersion *v9;
  id v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = 0;
    -[QLThumbnailVersion getGeneratorID:version:](self, "getGeneratorID:version:", &v12, &v11);
    v7 = v12;
    v8 = v11;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = -[QLThumbnailVersion initWithFileURL:generatorID:generatorVersion:](self, "initWithFileURL:generatorID:generatorVersion:", v6, v7, v8);

  return v9;
}

- (QLThumbnailVersion)initWithFPItem:(id)a3 automaticallyGenerated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  QLThumbnailVersion *v9;
  id v11;
  id v12;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = 0;
    -[QLThumbnailVersion getGeneratorID:version:](self, "getGeneratorID:version:", &v12, &v11);
    v7 = v12;
    v8 = v11;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = -[QLThumbnailVersion initWithFPItem:generatorID:generatorVersion:](self, "initWithFPItem:generatorID:generatorVersion:", v6, v7, v8);

  return v9;
}

- (void)getGeneratorID:(id *)a3 version:(id *)a4
{
  *a3 = CFSTR("com.apple.MobileQuickLook");
  *a4 = CFSTR("1");
}

- (QLThumbnailVersion)initWithFileURL:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  QLThumbnailVersion *v26;
  id v27;
  void *v28;
  uint64_t v29;
  QLThumbnailVersion *v30;
  QLThumbnailVersion *v31;
  stat v33;
  id v34[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (initWithFileURL_generatorID_generatorVersion__once != -1)
    dispatch_once(&initWithFileURL_generatorID_generatorVersion__once, &__block_literal_global_3);
  v11 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  v12 = _CFURLPromiseCopyPhysicalURL();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v8;
  v15 = v14;

  v34[0] = 0;
  objc_msgSend(v15, "resourceValuesForKeys:error:", initWithFileURL_generatorID_generatorVersion__propKeys, v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v34[0];
  memset(&v33, 0, sizeof(v33));
  v18 = objc_retainAutorelease(v15);
  if (stat((const char *)objc_msgSend(v18, "fileSystemRepresentation"), &v33))
  {
    _log_0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[QLThumbnailVersion initWithFileURL:generatorID:generatorVersion:].cold.2((uint64_t)v18, v19);

  }
  if (v11)
    objc_msgSend(v8, "stopAccessingSecurityScopedResource");
  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0C998D8]);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0C99998]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    v23 = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v8, "pathExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0C999A8]);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = self;
    v27 = v17;
    v28 = (void *)v25;
    v29 = v23;
    v9 = v22;
    v30 = -[QLThumbnailVersion initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:](v26, "initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:", v20, v29, v24, v25, v33.st_ino, v22, v10);

    v17 = v27;
    self = v30;

    v31 = v30;
  }
  else
  {
    _log_0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[QLThumbnailVersion initWithFileURL:generatorID:generatorVersion:].cold.1();
    v31 = 0;
  }

  return v31;
}

- (QLThumbnailVersion)initWithFPItem:(id)a3 generatorID:(id)a4 generatorVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  QLThumbnailVersion *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "contentModificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "documentSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  objc_msgSend(v10, "filename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "contentVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[QLThumbnailVersion initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:](self, "initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:", v11, v13, v15, v17, 0, v9, v8);

  return v18;
}

- (QLThumbnailVersion)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  QLThumbnailVersion *v14;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("g"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("v"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("s"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("i"));
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("vi"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[QLThumbnailVersion initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:](self, "initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:", v5, v6, v7, v13, v8, v16, v4);
  return v14;
}

- (QLThumbnailVersion)initWithModificationDate:(id)a3 fileSize:(unint64_t)a4 filenameExtension:(id)a5 versionIdentifier:(id)a6 ino:(unint64_t)a7 generatorID:(id)a8 generatorVersion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  QLThumbnailVersion *v20;
  QLThumbnailVersion *v21;
  objc_super v23;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailVersion;
  v20 = -[QLThumbnailVersion init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[QLThumbnailVersion setModificationDate:](v20, "setModificationDate:", v15);
    -[QLThumbnailVersion setFileSize:](v21, "setFileSize:", a4);
    -[QLThumbnailVersion setFilenameExtension:](v21, "setFilenameExtension:", v16);
    -[QLThumbnailVersion setVersionIdentifier:](v21, "setVersionIdentifier:", v17);
    -[QLThumbnailVersion setGeneratorID:](v21, "setGeneratorID:", v18);
    -[QLThumbnailVersion setGeneratorVersion:](v21, "setGeneratorVersion:", v19);
    -[QLThumbnailVersion setIno:](v21, "setIno:", a7);
  }

  return v21;
}

- (void)setGeneratorVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setGeneratorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setVersionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setIno:(unint64_t)a3
{
  self->_ino = a3;
}

- (void)setFilenameExtension:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *generatorID;
  void *v5;
  id v6;

  generatorID = self->_generatorID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", generatorID, CFSTR("g"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_generatorVersion, CFSTR("v"));
  v5 = (void *)-[NSData copy](self->_versionIdentifier, "copy");
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("vi"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_modificationDate, CFSTR("m"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_fileSize, CFSTR("s"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_filenameExtension, CFSTR("e"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_ino, CFSTR("i"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  QLThumbnailVersion *v5;
  QLThumbnailVersion *v6;
  NSString *generatorID;
  NSString *v8;
  NSString *v9;
  void *v10;
  BOOL v11;
  NSString *generatorVersion;
  NSString *v13;
  NSString *v14;
  NSDate *modificationDate;
  NSDate *v16;
  NSDate *v17;
  NSData *versionIdentifier;
  NSData *v19;
  NSData *v20;
  unint64_t v21;
  unint64_t fileSize;
  NSString *filenameExtension;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t ino;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  NSData *v33;
  void *v34;
  void *v35;
  NSDate *v36;
  void *v37;

  v5 = (QLThumbnailVersion *)a3;
  if (v5 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      generatorID = self->_generatorID;
      -[QLThumbnailVersion generatorID](v6, "generatorID");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (generatorID != v8)
      {
        v9 = self->_generatorID;
        -[QLThumbnailVersion generatorID](v6, "generatorID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqual:](v9, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v37 = v10;
      }
      generatorVersion = self->_generatorVersion;
      -[QLThumbnailVersion generatorVersion](v6, "generatorVersion");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (generatorVersion != v13)
      {
        v14 = self->_generatorVersion;
        -[QLThumbnailVersion generatorVersion](v6, "generatorVersion");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqual:](v14, "isEqual:", v3))
        {
          v11 = 0;
LABEL_33:

LABEL_34:
          v10 = v37;
          if (generatorID == v8)
          {
LABEL_36:

            goto LABEL_37;
          }
LABEL_35:

          goto LABEL_36;
        }
      }
      modificationDate = self->_modificationDate;
      -[QLThumbnailVersion modificationDate](v6, "modificationDate");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v36 = modificationDate;
      if (modificationDate == v16)
      {
        v34 = v3;
      }
      else
      {
        v17 = self->_modificationDate;
        -[QLThumbnailVersion modificationDate](v6, "modificationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqual:](v17, "isEqual:"))
        {
          v11 = 0;
LABEL_31:

LABEL_32:
          if (generatorVersion == v13)
            goto LABEL_34;
          goto LABEL_33;
        }
        v34 = v3;
      }
      versionIdentifier = self->_versionIdentifier;
      -[QLThumbnailVersion versionIdentifier](v6, "versionIdentifier");
      v19 = (NSData *)objc_claimAutoreleasedReturnValue();
      v33 = versionIdentifier;
      if (versionIdentifier == v19)
      {
        fileSize = self->_fileSize;
        if (fileSize != -[QLThumbnailVersion fileSize](v6, "fileSize"))
        {
          v11 = 0;
          goto LABEL_30;
        }
      }
      else
      {
        v20 = self->_versionIdentifier;
        -[QLThumbnailVersion versionIdentifier](v6, "versionIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSData isEqual:](v20, "isEqual:") & 1) == 0
          || (v21 = self->_fileSize, v21 != -[QLThumbnailVersion fileSize](v6, "fileSize")))
        {
          v11 = 0;
          goto LABEL_29;
        }
      }
      filenameExtension = self->_filenameExtension;
      -[QLThumbnailVersion filenameExtension](v6, "filenameExtension");
      v24 = objc_claimAutoreleasedReturnValue();
      if (filenameExtension == (NSString *)v24)
      {
        ino = self->_ino;
        v11 = ino == -[QLThumbnailVersion ino](v6, "ino");

      }
      else
      {
        v29 = self->_filenameExtension;
        v31 = (void *)v24;
        -[QLThumbnailVersion filenameExtension](v6, "filenameExtension");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqual:](v29, "isEqual:", v25))
        {
          v30 = v25;
          v26 = self->_ino;
          v11 = v26 == -[QLThumbnailVersion ino](v6, "ino");

        }
        else
        {

          v11 = 0;
        }
      }
      if (v33 == v19)
      {
LABEL_30:

        v3 = v34;
        if (v36 == v16)
          goto LABEL_32;
        goto LABEL_31;
      }
LABEL_29:

      goto LABEL_30;
    }
    v11 = 0;
  }
LABEL_37:

  return v11;
}

- (NSString)generatorVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)versionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isDefaultVersion
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[QLThumbnailVersion generatorID](self, "generatorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileQuickLook"));
  -[QLThumbnailVersion generatorVersion](self, "generatorVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 & objc_msgSend(v5, "isEqualToString:", CFSTR("1"));

  return v6;
}

- (NSString)generatorID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)ino
{
  return self->_ino;
}

- (NSString)filenameExtension
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

void __67__QLThumbnailVersion_initWithFileURL_generatorID_generatorVersion___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C99998];
  v3[0] = *MEMORY[0x1E0C998D8];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0C999A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithFileURL_generatorID_generatorVersion__propKeys;
  initWithFileURL_generatorID_generatorVersion__propKeys = v1;

}

- (QLThumbnailVersion)init
{
  -[QLThumbnailVersion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *generatorID;
  NSString *generatorVersion;
  NSDate *modificationDate;
  NSData *versionIdentifier;
  void *v9;
  void *v10;
  NSString *filenameExtension;
  void *v12;
  uint64_t v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  generatorID = self->_generatorID;
  if (generatorID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", generatorID, CFSTR("g"));
  generatorVersion = self->_generatorVersion;
  if (generatorVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", generatorVersion, CFSTR("gV"));
  modificationDate = self->_modificationDate;
  if (modificationDate)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", modificationDate, CFSTR("mD"));
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", versionIdentifier, 1, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("vI"));

  }
  if (self->_fileSize)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("s"));

  }
  filenameExtension = self->_filenameExtension;
  if (filenameExtension)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", filenameExtension, CFSTR("e"));
  if (self->_ino)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("i"));

  }
  return v4;
}

- (QLThumbnailVersion)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  QLThumbnailVersion *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  QLThumbnailVersion *v20;
  void *v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("g"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gV"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;

  if (!v10)
  {
    _log_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[QLThumbnailVersion initWithDictionaryRepresentation:].cold.1(v4, (uint64_t)v11, v12);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mD"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
  v22 = v11;
  v14 = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("e"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("i"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongLongValue");

  v20 = -[QLThumbnailVersion initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:](v14, "initWithModificationDate:fileSize:filenameExtension:versionIdentifier:ino:generatorID:generatorVersion:", v13, v16, v17, v10, v19, v5, v6);
  return v20;
}

- (BOOL)shouldBeInvalidatedByThumbnailWithVersion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  unint64_t v27;
  BOOL v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  __CFString *v37;
  __CFString *v38;

  v7 = a3;
  -[QLThumbnailVersion versionIdentifier](self, "versionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "versionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[QLThumbnailVersion versionIdentifier](self, "versionIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "versionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
      {

        goto LABEL_25;
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  -[QLThumbnailVersion versionIdentifier](self, "versionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "versionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (v10 != 0) ^ (v11 != 0);

  if (v9)
  {

  }
  if (v8)

  if ((v12 & 1) != 0)
    goto LABEL_25;
  v13 = -[QLThumbnailVersion ino](self, "ino");
  if (v13 != objc_msgSend(v7, "ino"))
    goto LABEL_25;
  -[QLThumbnailVersion modificationDate](self, "modificationDate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_21:
    -[QLThumbnailVersion modificationDate](self, "modificationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modificationDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 != 0;

    if ((v24 == 0) == v26)
      goto LABEL_25;
    v27 = -[QLThumbnailVersion fileSize](self, "fileSize");
    if (v27 != objc_msgSend(v7, "fileSize")
      && -[QLThumbnailVersion fileSize](self, "fileSize")
      && objc_msgSend(v7, "fileSize"))
    {
      goto LABEL_25;
    }
    -[QLThumbnailVersion generatorID](self, "generatorID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v7, "generatorID");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        -[QLThumbnailVersion generatorID](self, "generatorID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[QLThumbnailVersion generatorID](self, "generatorID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "generatorID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "isEqual:", v35);

          if (v36)
          {
            -[QLThumbnailVersion generatorVersion](self, "generatorVersion");
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "generatorVersion");
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v28 = QLCompareVersion(v37, v38) == -1;

            goto LABEL_26;
          }
        }
      }
    }
LABEL_32:
    v28 = 0;
    goto LABEL_26;
  }
  v15 = (void *)v14;
  objc_msgSend(v7, "modificationDate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_21;
  }
  v17 = (void *)v16;
  -[QLThumbnailVersion modificationDate](self, "modificationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modificationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) != 0)
    goto LABEL_21;
  -[QLThumbnailVersion modificationDate](self, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modificationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "compare:", v22);

  if (v23 != -1)
  {
    if (v23 == 1)
      goto LABEL_32;
    goto LABEL_21;
  }
LABEL_25:
  v28 = 1;
LABEL_26:

  return v28;
}

- (BOOL)isAutomaticallyGenerated
{
  void *v2;
  BOOL v3;

  -[QLThumbnailVersion generatorID](self, "generatorID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<QLThumbnailVersion m:%@ s:%lu vi:%@ ino:%llx g:%@-%@>"), self->_modificationDate, self->_fileSize, self->_versionIdentifier, self->_ino, self->_generatorID, self->_generatorVersion);
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = self->_fileSize ^ -[NSDate hash](self->_modificationDate, "hash");
  v4 = -[NSString hash](self->_filenameExtension, "hash");
  return v3 ^ v4 ^ -[NSData hash](self->_versionIdentifier, "hash");
}

- (void)initWithFileURL:generatorID:generatorVersion:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = v0;
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, v1, (uint64_t)v1, "No resource properties for %@ (error %@) -> returning nil version", v2);
}

- (void)initWithFileURL:(uint64_t)a1 generatorID:(NSObject *)a2 generatorVersion:.cold.2(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v7 = 138412546;
  v8 = a1;
  v9 = 2080;
  v10 = v5;
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, a2, v6, "stat on %@ failed: %s", (uint8_t *)&v7);
}

- (void)initWithDictionaryRepresentation:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("vI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v8 = a2;
  OUTLINED_FUNCTION_0_1(&dword_1AE3F5000, a3, v6, "could not unarchive version identifier %@: %@", v7);

}

@end
