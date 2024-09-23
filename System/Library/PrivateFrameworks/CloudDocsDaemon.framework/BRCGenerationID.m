@implementation BRCGenerationID

- (NSNumber)fsGenerationID
{
  void *v2;

  if (self->_generationID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

- (NSString)generationIDString
{
  __CFString *v3;
  NSData *signature;

  if (self->_generationID)
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), self->_generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "brc_hexadecimalStringWithBytes:length:", -[NSData bytes](signature, "bytes"), -[NSData length](self->_signature, "length"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("<undef>");
    }
  }
  return (NSString *)v3;
}

- (const)UTF8String
{
  id v2;
  const char *v3;

  -[BRCGenerationID generationIDString](self, "generationIDString");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "UTF8String");

  return v3;
}

- (BRCGenerationID)initWithSignature:(const void *)a3 length:(unint64_t)a4
{
  BRCGenerationID *v4;
  BRCGenerationID *v6;
  uint64_t v7;
  NSData *signature;
  objc_super v10;

  v4 = (BRCGenerationID *)a4;
  if (a4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BRCGenerationID;
    v6 = -[BRCGenerationID init](&v10, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, v4);
      signature = v6->_signature;
      v6->_signature = (NSData *)v7;

    }
    self = v6;
    v4 = self;
  }

  return v4;
}

- (BRCGenerationID)initWithFSGenerationID:(unsigned int)a3
{
  BRCGenerationID *v4;
  BRCGenerationID *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCGenerationID;
    v4 = -[BRCGenerationID init](&v7, sel_init);
    if (v4)
      v4->_generationID = a3;
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BRCGenerationID)initWithRelativePath:(id)a3
{
  id v4;
  uint64_t v5;
  BRCGenerationID *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "fsGenerationID");
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53;
  v23 = __Block_byref_object_dispose__53;
  v24 = 0;
  if ((_DWORD)v5)
  {
    self = -[BRCGenerationID initWithFSGenerationID:](self, "initWithFSGenerationID:", v5);
    v6 = self;
  }
  else if ((objc_msgSend(v4, "isSymLink") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCGenerationID initWithRelativePath:].cold.1((uint64_t)v4, (uint64_t)v7, v8);

    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __40__BRCGenerationID_initWithRelativePath___block_invoke;
    v16 = &unk_1E8767890;
    v18 = &v19;
    v17 = v4;
    objc_msgSend(v17, "performOnOpenFileDescriptor:error:", &v13, 0);
    v9 = (void *)v20[5];
    if (v9)
    {
      v10 = objc_retainAutorelease(v9);
      v11 = objc_msgSend(v10, "bytes", v13, v14, v15, v16);
      self = -[BRCGenerationID initWithSignature:length:](self, "initWithSignature:length:", v11, objc_msgSend((id)v20[5], "length"));
      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  _Block_object_dispose(&v19, 8);

  return v6;
}

uint64_t __40__BRCGenerationID_initWithRelativePath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C95138], "signatureWithFileDescriptor:error:", a2, &v12);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Checksumming failed at %@: %@%@", buf, 0x20u);
    }

    v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t generationID;
  id v5;

  generationID = self->_generationID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", generationID, CFSTR("g"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("s"));

}

- (BRCGenerationID)initWithCoder:(id)a3
{
  id v4;
  BRCGenerationID *v5;
  uint64_t v6;
  NSData *signature;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCGenerationID;
  v5 = -[BRCGenerationID init](&v9, sel_init);
  if (v5)
  {
    v5->_generationID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("g"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v6 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  int v5;
  id v6;
  const void *v7;

  v5 = sqlite3_value_type(a3);
  v6 = objc_alloc((Class)a1);
  if (v5 != 4)
    return (id)objc_msgSend(v6, "initWithFSGenerationID:", sqlite3_value_int64(a3));
  v7 = sqlite3_value_blob(a3);
  return (id)objc_msgSend(v6, "initWithSignature:length:", v7, sqlite3_value_bytes(a3));
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  int v7;
  id v8;
  const void *v9;

  v7 = sqlite3_column_type(a3, a4);
  v8 = objc_alloc((Class)a1);
  if (v7 != 4)
    return (id)objc_msgSend(v8, "initWithFSGenerationID:", sqlite3_column_int64(a3, a4));
  v9 = sqlite3_column_blob(a3, a4);
  return (id)objc_msgSend(v8, "initWithSignature:length:", v9, sqlite3_column_bytes(a3, a4));
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  sqlite3_int64 generationID;
  NSData *signature;

  generationID = self->_generationID;
  if ((_DWORD)generationID)
  {
    sqlite3_bind_int64(a3, a4, generationID);
  }
  else
  {
    signature = self->_signature;
    if (signature)
      sqlite3_bind_blob(a3, a4, -[NSData bytes](signature, "bytes"), -[NSData length](self->_signature, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    else
      sqlite3_bind_null(a3, a4);
  }
}

- (unint64_t)hash
{
  return self->_generationID;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[BRCGenerationID isEqualToGenerationID:orSignature:](self, "isEqualToGenerationID:orSignature:", v4, 0);

  return v5;
}

- (BOOL)isEqualToGenerationID:(id)a3 orSignature:(id)a4
{
  id *v6;
  id v7;
  unsigned int generationID;
  char v9;
  NSData *signature;

  v6 = (id *)a3;
  v7 = a4;
  generationID = self->_generationID;
  if (!generationID)
  {
    signature = self->_signature;
    if (signature)
    {
      if (v6)
      {
        if ((objc_msgSend(v6[2], "isEqualToData:") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        signature = self->_signature;
      }
      v9 = objc_msgSend(v7, "isEqualToData:", signature);
      goto LABEL_11;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_8;
  v9 = generationID == *((_DWORD *)v6 + 2);
LABEL_11:

  return v9;
}

- (BOOL)isEqualToFSGenerationID:(unsigned int)a3
{
  unsigned int generationID;

  generationID = self->_generationID;
  return generationID && generationID == a3;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
}

- (void)initWithRelativePath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Checksumming R/W mmaped file at %@%@", (uint8_t *)&v3, 0x16u);
}

@end
