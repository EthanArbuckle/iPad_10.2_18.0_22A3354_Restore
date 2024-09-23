@implementation BRCDesiredVersion

- (BOOL)isFault
{
  return self->_flags.value & 1;
}

- (BOOL)wantsContent
{
  return (LOBYTE(self->_flags.value) >> 1) & 1;
}

- (BOOL)wantsThumbnail
{
  return (LOBYTE(self->_flags.value) >> 2) & 1;
}

- (BOOL)userInitiated
{
  return (LOBYTE(self->_flags.value) >> 3) & 1;
}

- (BOOL)wantsContentForThumbnail
{
  void *v4;
  NSObject *v5;

  if ((self->_flags.value & 0x10) != 0 && !-[BRCDesiredVersion wantsContent](self, "wantsContent"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDesiredVersion wantsContentForThumbnail].cold.1();

  }
  return (LOBYTE(self->_flags.value) >> 4) & 1;
}

- (unsigned)options
{
  return self->_flags.value & 0x1F;
}

- (void)setOptions:(unsigned int)a3
{
  char value;
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;

  value = self->_flags.value & 0xE0 | a3 & 0x1F;
  LOBYTE(self->_flags.value) = value;
  if ((a3 & 0x12) == 0x10)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCDesiredVersion setOptions:].cold.2();

    value = self->_flags.value;
  }
  if ((value & 3) == 0)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCDesiredVersion setOptions:].cold.1();

  }
}

- (void)markLiveAsFault
{
  void *v3;
  NSObject *v4;

  if (!-[BRCDesiredVersion isFault](self, "isFault"))
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCRelativePath logicalName].cold.2();

  }
  if (-[BRCDesiredVersion isFault](self, "isFault"))
  {
    if (-[BRCDesiredVersion wantsContent](self, "wantsContent"))
      -[BRCDesiredVersion setOptions:](self, "setOptions:", -[BRCDesiredVersion options](self, "options") & 0xFFFFFFFELL);
  }
}

- (BRCDesiredVersion)initWithDesiredVersion:(id)a3
{
  id v4;
  BRCDesiredVersion *v5;
  BRCDesiredVersion *v6;

  v4 = a3;
  v5 = -[BRCVersion initWithVersion:](self, "initWithVersion:", v4);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_downloadError, *((id *)v4 + 16));
    objc_storeStrong((id *)&v6->_serverName, *((id *)v4 + 17));
    v6->_flags.value = *((_DWORD *)v4 + 30);
  }

  return v6;
}

- (BRCDesiredVersion)initWithServerVersion:(id)a3 serverName:(id)a4
{
  id v7;
  BRCDesiredVersion *v8;
  BRCDesiredVersion *v9;

  v7 = a4;
  v8 = -[BRCVersion initWithVersion:](self, "initWithVersion:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_serverName, a4);

  return v9;
}

- (id)descriptionWithContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *downloadError;
  void *v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[BRCDesiredVersion isFault](self, "isFault"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("fault "), 1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v6);

  }
  if (-[BRCDesiredVersion wantsContent](self, "wantsContent"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("contents "), 1, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v7);

  }
  if (-[BRCDesiredVersion wantsContentForThumbnail](self, "wantsContentForThumbnail"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("for-thumb "), 1, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v8);

  }
  if (-[BRCDesiredVersion wantsThumbnail](self, "wantsThumbnail"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("thumbnail "), 1, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v9);

  }
  if (-[BRCDesiredVersion userInitiated](self, "userInitiated"))
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", CFSTR("user-qos "), 1, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v10);

  }
  v15.receiver = self;
  v15.super_class = (Class)BRCDesiredVersion;
  -[BRCVersion descriptionWithContext:](&v15, sel_descriptionWithContext_, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v11);

  downloadError = self->_downloadError;
  if (downloadError)
  {
    +[BRCDumpContext stringFromError:context:](BRCDumpContext, "stringFromError:context:", downloadError, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" error:%@"), v13);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCDesiredVersion)initWithCoder:(id)a3
{
  id v4;
  BRCDesiredVersion *v5;
  id v6;
  uint64_t v7;
  NSError *downloadError;
  uint64_t v9;
  NSString *serverName;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDesiredVersion;
  v5 = -[BRCVersion initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    if (_allowedClassesForErrors_once_0 != -1)
      dispatch_once(&_allowedClassesForErrors_once_0, &__block_literal_global_56);
    v6 = (id)_allowedClassesForErrors_allowedClasses_0;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("downError"));
    v7 = objc_claimAutoreleasedReturnValue();
    downloadError = v5->_downloadError;
    v5->_downloadError = (NSError *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverName"));
    v9 = objc_claimAutoreleasedReturnValue();
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v9;

    v5->_flags.value = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flags"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *downloadError;
  id v5;
  objc_super v6;

  downloadError = self->_downloadError;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", downloadError, CFSTR("downError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverName, CFSTR("serverName"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags.value, CFSTR("flags"));
  v6.receiver = self;
  v6.super_class = (Class)BRCDesiredVersion;
  -[BRCVersion encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDesiredVersion:", self);
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v11;
  NSObject *v12;

  if (sqlite3_value_type(a3) == 4)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x1E0C99D50];
    v7 = sqlite3_value_blob(a3);
    objc_msgSend(v6, "dataWithBytes:length:", v7, sqlite3_value_bytes(a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:].cold.1();

    }
    return 0;
  }
  return v9;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v13;
  NSObject *v14;

  if (sqlite3_column_type(a3, a4) == 4)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = sqlite3_column_blob(a3, a4);
    objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_column_type(a3, a4) != 5)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:].cold.1();

    }
    return 0;
  }
  return v11;
}

- (BOOL)isStillValidForEtag:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BRCDesiredVersion downloadError](self, "downloadError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[BRCVersion ckInfo](self, "ckInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "etag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqualToString:", v4);

  }
  return v6;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->_downloadError, a3);
}

- (NSString)serverName
{
  return self->_serverName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
}

- (void)wantsContentForThumbnail
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.wantsContent%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _flags.isFault || _flags.startDownload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setOptions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _flags.startDownload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
