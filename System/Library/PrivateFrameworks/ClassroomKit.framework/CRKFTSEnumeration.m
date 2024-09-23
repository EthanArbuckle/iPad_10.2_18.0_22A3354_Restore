@implementation CRKFTSEnumeration

+ (int)defaultOptions
{
  return 84;
}

- (CRKFTSEnumeration)init
{
  return -[CRKFTSEnumeration initWithDirectoryPath:](self, "initWithDirectoryPath:", CFSTR("/"));
}

- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3
{
  id v4;
  CRKFTSEnumeration *v5;

  v4 = a3;
  v5 = -[CRKFTSEnumeration initWithDirectoryPath:options:](self, "initWithDirectoryPath:options:", v4, objc_msgSend((id)objc_opt_class(), "defaultOptions"));

  return v5;
}

- (CRKFTSEnumeration)initWithDirectoryPath:(id)a3 options:(int)a4
{
  id v7;
  CRKFTSEnumeration *v8;
  uint64_t v9;
  NSString *mDirectoryPath;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFTSEnumeration.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryPath"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CRKFTSEnumeration;
  v8 = -[CRKFTSEnumeration init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    mDirectoryPath = v8->mDirectoryPath;
    v8->mDirectoryPath = (NSString *)v9;

    v8->mOptions = a4;
  }

  return v8;
}

- (id)entriesWithError:(id *)a3
{
  $98CAF2F0B70B328A8F9E27A0811D7A83 *v5;
  $98CAF2F0B70B328A8F9E27A0811D7A83 *v6;
  void *v7;

  v5 = -[CRKFTSEnumeration makeFTSWithError:](self, "makeFTSWithError:");
  if (v5)
  {
    v6 = v5;
    -[CRKFTSEnumeration readAllEntriesFromFTS:error:](self, "readAllEntriesFromFTS:error:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFTSEnumeration closeFTS:](self, "closeFTS:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- ($98CAF2F0B70B328A8F9E27A0811D7A83)makeFTSWithError:(id *)a3
{
  FTS *v5;
  $98CAF2F0B70B328A8F9E27A0811D7A83 *v6;
  char *v8[3];

  v8[2] = *(char **)MEMORY[0x24BDAC8D0];
  v8[0] = (char *)-[NSString fileSystemRepresentation](self->mDirectoryPath, "fileSystemRepresentation");
  v8[1] = 0;
  v5 = fts_open(v8, self->mOptions, 0);
  v6 = ($98CAF2F0B70B328A8F9E27A0811D7A83 *)v5;
  if (a3 && !v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)closeFTS:(id *)a3
{
  void *v3;
  void *v4;

  if (fts_close((FTS *)a3))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_CRKLogGeneral_onceToken_2 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_2, &__block_literal_global_16);
    v4 = (void *)_CRKLogGeneral_logObj_2;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_2, OS_LOG_TYPE_ERROR))
      -[CRKFTSEnumeration closeFTS:].cold.1(v4, v3);

  }
}

- (id)readAllEntriesFromFTS:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v15;

  v7 = (void *)objc_opt_new();
  v15 = 0;
  -[CRKFTSEnumeration readNextEntryFromFTS:error:](self, "readNextEntryFromFTS:error:", a3, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    do
    {
      objc_msgSend(v7, "addObject:", v8);
      v15 = v10;
      -[CRKFTSEnumeration readNextEntryFromFTS:error:](self, "readNextEntryFromFTS:error:", a3, &v15);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v15;

      v10 = v12;
      v8 = (void *)v11;
    }
    while (v11);
    if (a4)
      goto LABEL_4;
  }
  else
  {
    v12 = v9;
    if (a4)
LABEL_4:
      *a4 = objc_retainAutorelease(v12);
  }
  if (v12)
    v13 = 0;
  else
    v13 = (void *)objc_msgSend(v7, "copy");

  return v13;
}

- (id)readNextEntryFromFTS:(id *)a3 error:(id *)a4
{
  FTSENT *v7;
  FTSENT *v8;
  CRKFTSEntry *v9;
  int *v10;
  id v11;

  while (1)
  {
    v7 = fts_read((FTS *)a3);
    if (!v7)
      break;
    v8 = v7;
    if (!-[CRKFTSEnumeration shouldSkipEntry:](self, "shouldSkipEntry:", v7))
    {
      v9 = -[CRKFTSEntry initWithFTSEntry:error:]([CRKFTSEntry alloc], "initWithFTSEntry:error:", v8, a4);
      return v9;
    }
  }
  v10 = __error();
  v9 = 0;
  if (a4 && *v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    *a4 = v11;
  }
  return v9;
}

- (BOOL)shouldSkipEntry:(_ftsent *)a3
{
  return (a3->fts_info < 0xFu) & (0x4266u >> a3->fts_info);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDirectoryPath, 0);
}

- (void)closeFTS:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to close FTS: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
