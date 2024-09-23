@implementation FCANEFFileDataProvider

- (FCANEFFileDataProvider)initWithFilePath:(id)a3 wrappingKey:(id)a4 options:(int64_t)a5 holdToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  FCANEFFileDataProvider *v13;
  uint64_t v14;
  NSString *filePath;
  uint64_t v16;
  NSData *wrappingKey;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FCANEFFileDataProvider;
  v13 = -[FCANEFFileDataProvider init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    filePath = v13->_filePath;
    v13->_filePath = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    wrappingKey = v13->_wrappingKey;
    v13->_wrappingKey = (NSData *)v16;

    v13->_options = a5;
    objc_storeStrong((id *)&v13->_holdToken, a6);
  }

  return v13;
}

- (NSData)data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  _QWORD *v8;
  void *v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  void *v16;
  void (**v17)(void);
  id v18;
  void *v19;
  void (**v20)(void);
  _BOOL4 IsGZip;
  void *v23;
  void *v24;
  _QWORD aBlock[5];

  v3 = (void *)MEMORY[0x1A8580B64](self, a2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__FCANEFFileDataProvider_data__block_invoke;
  aBlock[3] = &unk_1E4647190;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", self->_filePath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = -[FCANEFHeader initWithFileHandle:]([FCANEFHeader alloc], v7);
    v9 = v8;
    if (!v8)
    {
      v10 = v4;
      ((void (*)(void))v10[2])();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    v10 = v8;
    v23 = v3;
    objc_msgSend(v7, "seekToFileOffset:", objc_msgSend(v10[4], "length"));
    objc_msgSend(v7, "readDataToEndOfFile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10[2];
    -[FCANEFFileDataProvider wrappingKey](self, "wrappingKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_anefDecryptWithKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = v4;
      v14[2]();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      v3 = v23;
      goto LABEL_16;
    }
    v14 = v13;
    objc_msgSend(v24, "fc_anefDecryptWithKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      if ((-[FCANEFFileDataProvider options](self, "options") & 1) != 0)
      {
        v18 = v10[3];
        IsGZip = FCMIMETypeIsGZip(v18);

        if (IsGZip)
        {
          objc_msgSend(v17, "fc_gzipInflate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            goto LABEL_14;
        }
      }
      v20 = v17;
      v17 = v20;
    }
    else
    {
      v17 = v4;
      v17[2]();
      v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    }
    v19 = v20;
LABEL_14:

    goto LABEL_15;
  }
  v7 = v4;
  v7[2]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  objc_autoreleasePoolPop(v3);
  return (NSData *)v19;
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSString)filePath
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("the file path for an encrypted asset should not be accessed directly"));
    v5 = 136315906;
    v6 = "-[FCANEFFileDataProvider filePath]";
    v7 = 2080;
    v8 = "FCANEFFileDataProvider.m";
    v9 = 1024;
    v10 = 100;
    v11 = 2114;
    v12 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);

  }
  return self->_filePath;
}

- (BOOL)isRawFileConsumable
{
  return 0;
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (int64_t)options
{
  return self->_options;
}

- (FCInterestToken)holdToken
{
  return self->_holdToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
