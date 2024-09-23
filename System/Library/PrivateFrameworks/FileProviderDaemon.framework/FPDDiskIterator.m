@implementation FPDDiskIterator

- (FPDDiskIterator)initWithURL:(id)a3 isDirectory:(BOOL)a4
{
  _BOOL4 v4;
  id v8;
  FPDDiskIterator *v9;
  FPDDiskIterator *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  NSError *error;
  void *v24;
  uint64_t v25;
  NSString *basePath;
  int v27;
  char v28;
  id v29;
  FTS *v30;
  uint64_t v31;
  NSError *v32;
  NSObject *v33;
  void *v35;
  id v36;
  FPDDiskIterator *v37;
  objc_super v38;
  char *v39[3];

  v4 = a4;
  v39[2] = *(char **)MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDDiskIterator.m"), 44, CFSTR("FPDDiskIterator: trying to create iterator with nil url"));

  }
  v38.receiver = self;
  v38.super_class = (Class)FPDDiskIterator;
  v9 = -[FPDDiskIterator init](&v38, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootURL, a3);
    v10->_stopAccessingRoot = -[NSURL startAccessingSecurityScopedResource](v10->_rootURL, "startAccessingSecurityScopedResource");
    if (!v4)
    {
      v27 = 0;
      v28 = 1;
LABEL_16:
      v10->_isFile = v28;
      v10->_state = v27;
      goto LABEL_17;
    }
    objc_msgSend(v8, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = access((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0);

    if (v12)
    {
      if (*__error() == 63 && fpfs_supports_long_paths())
      {
        objc_msgSend(v8, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByDeletingLastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_retainAutorelease(v14);
        objc_msgSend(v17, "fileSystemRepresentation");
        v18 = fpfs_open_longpath();
        if (v18 < 0)
          goto LABEL_10;
        v19 = v18;
        v36 = v16;
        v37 = v10;
        v20 = fpfs_fchdir();
        v21 = *__error();
        close(v19);
        *__error() = v21;

        if (v20 < 0)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
          v22 = objc_claimAutoreleasedReturnValue();
          error = v10->_error;
          v10->_error = (NSError *)v22;

        }
        objc_msgSend(v8, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringByDeletingLastPathComponent");
        v25 = objc_claimAutoreleasedReturnValue();
        basePath = v10->_basePath;
        v10->_basePath = (NSString *)v25;

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v8, "path");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39[0] = (char *)objc_msgSend(v29, "fileSystemRepresentation");
      v39[1] = 0;

      v30 = fts_open(v39, 16, 0);
      v10->_fts = ($428F41B0DE264A9B1D1CAA2437CD518D *)v30;
      if (v30)
      {
LABEL_15:
        v28 = 0;
        v27 = 1;
        goto LABEL_16;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v10->_error;
    v10->_error = (NSError *)v31;

    goto LABEL_15;
  }
LABEL_17:
  fp_current_or_default_log();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[FPDDiskIterator initWithURL:isDirectory:].cold.1((uint64_t)v10, v33);

  return v10;
}

BOOL __43__FPDDiskIterator_initWithURL_isDirectory___block_invoke(uint64_t a1)
{
  char *v3[3];

  v3[2] = *(char **)MEMORY[0x1E0C80C00];
  v3[0] = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v3[1] = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = fts_open(v3, 16, 0);
  return *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) != 0;
}

- (id)nextWithError:(id *)a3
{
  int state;
  NSError **p_error;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  int *v17;
  uint64_t v18;
  FTSENT *v19;
  uint64_t v20;
  int fts_info;
  NSString *basePath;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  uint64_t fts_errno;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSError *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSError **v46;

  self->_numFoldersPopped = 0;
  if (self->_isFile)
  {
    state = self->_state;
    switch(state)
    {
      case 2:
        return 0;
      case 1:
        self->_state = 2;
        return 0;
      case 0:
        self->_state = 1;
        objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", self->_rootURL);
        return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  p_error = &self->_error;
  if (self->_error)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FPDDiskIterator nextWithError:].cold.2((uint64_t)p_error, v8, v9, v10, v11, v12, v13, v14);

    if (a3)
    {
      *a3 = objc_retainAutorelease(*p_error);
      return 0;
    }
    return 0;
  }
  v46 = &self->_error;
  v15 = 0;
  v16 = &OBJC_IVAR___FPDExtension__extensionRecord;
  v17 = &OBJC_IVAR___FPDExtension__extensionRecord;
  do
  {

    v18 = v16[428];
    v19 = fts_read(*(FTS **)((char *)&self->super.super.isa + v18));
    v20 = v17[434];
    *(Class *)((char *)&self->super.super.isa + v20) = (Class)v19;
    if (v19)
    {
      v15 = 0;
      fts_info = v19->fts_info;
      switch(v19->fts_info)
      {
        case 1u:
        case 3u:
        case 8u:
        case 0xBu:
        case 0xCu:
        case 0xDu:
          self->_lastItemWasPackage = 0;
          if (!v19->fts_level)
          {
            objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", self->_rootURL);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = 0;
            goto LABEL_48;
          }
          basePath = self->_basePath;
          if (basePath)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19->fts_path);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString stringByAppendingPathComponent:](basePath, "stringByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0C99E98];
            v26 = (*(unsigned __int16 **)((char *)&self->super.super.isa + v20))[44] == 1;
          }
          else
          {
            v30 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19->fts_path);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (*(unsigned __int16 **)((char *)&self->super.super.isa + v20))[44] == 1;
            v25 = v30;
          }
          objc_msgSend(v25, "fileURLWithPath:isDirectory:", v24, v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "fp_isPackage"))
          {
            objc_msgSend(v15, "path");
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v31, "fileSystemRepresentation");
            fpfs_pkg_is_demoted_at();

            self->_lastItemWasPackage = 1;
            fts_set(*(FTS **)((char *)&self->super.super.isa + v18), *(FTSENT **)((char *)&self->super.super.isa + v20), 4);
            v16 = &OBJC_IVAR___FPDExtension__extensionRecord;
            p_error = v46;
          }
          v17 = &OBJC_IVAR___FPDExtension__extensionRecord;
          break;
        case 2u:
          v29 = (void *)MEMORY[0x1E0CB35C8];
          fts_errno = 62;
          goto LABEL_26;
        case 4u:
        case 7u:
        case 0xAu:
          fts_errno = v19->fts_errno;
          v29 = (void *)MEMORY[0x1E0CB35C8];
          goto LABEL_26;
        case 6u:
          v15 = 0;
          if (!self->_lastItemWasPackage)
            ++self->_numFoldersPopped;
          break;
        default:
          continue;
      }
    }
    else
    {
      if (*__error())
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        fts_errno = *__error();
        v29 = v27;
LABEL_26:
        objc_msgSend(v29, "fp_errorWithPOSIXCode:", fts_errno);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = *p_error;
        *p_error = (NSError *)v32;

      }
      fts_close(*(FTS **)((char *)&self->super.super.isa + v18));
      v15 = 0;
      *(Class *)((char *)&self->super.super.isa + v18) = 0;
      self->_state = 2;
    }
    v34 = *(uint64_t *)((char *)&self->super.super.isa + v20);
    if (!v34)
      break;
    fts_info = *(unsigned __int16 *)(v34 + 88);
  }
  while (fts_info == 6);
  if (*p_error)
  {
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[FPDDiskIterator nextWithError:].cold.1((uint64_t)p_error, v35, v36, v37, v38, v39, v40, v41);

    if (a3)
    {
      v42 = 0;
      *a3 = objc_retainAutorelease(*p_error);
      goto LABEL_48;
    }
LABEL_43:
    v42 = 0;
  }
  else
  {
    if (!v15 && self->_state == 2)
    {
      v15 = 0;
      goto LABEL_43;
    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPDDiskIterator.m"), 182, CFSTR("FPDDiskIterator succeeds without providing an URL"));

    }
    objc_msgSend(v15, "fp_attachSecurityScopeFromURL:", self->_rootURL);
    objc_msgSend(MEMORY[0x1E0CAABF0], "locatorForURL:", v15);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_48:

  return v42;
}

- (void)skipDescendants
{
  fts_set((FTS *)self->_fts, self->_entry, 4);
}

- (id)error
{
  return self->_error;
}

- (BOOL)done
{
  return self->_state == 2;
}

- (unint64_t)numFoldersPopped
{
  return self->_numFoldersPopped;
}

- (void)dealloc
{
  $428F41B0DE264A9B1D1CAA2437CD518D *fts;
  objc_super v4;

  if (self->_stopAccessingRoot)
    -[NSURL stopAccessingSecurityScopedResource](self->_rootURL, "stopAccessingSecurityScopedResource");
  fts = self->_fts;
  if (fts)
  {
    fts_close((FTS *)fts);
    self->_fts = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FPDDiskIterator;
  -[FPDDiskIterator dealloc](&v4, sel_dealloc);
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (void)initWithURL:(uint64_t)a1 isDirectory:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = CFSTR("yes");
  v4 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 42))
    v3 = CFSTR("no");
  v5 = 138412802;
  v6 = v2;
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDDiskIterator: creating iterator for url %@ isFile %@ error %@", (uint8_t *)&v5, 0x20u);
}

- (void)nextWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] FPDDiskIterator: post-read error %@", a5, a6, a7, a8, 2u);
}

- (void)nextWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, a2, a3, "[DEBUG] FPDDiskIterator: pre-read error %@", a5, a6, a7, a8, 2u);
}

@end
