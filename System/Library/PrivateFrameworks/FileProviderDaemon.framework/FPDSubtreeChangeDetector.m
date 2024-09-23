@implementation FPDSubtreeChangeDetector

- (unint64_t)retrieveFileIDWithError:(id *)a3
{
  NSObject *v5;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  if ((fstat(self->_fd, &v6) & 0x80000000) == 0)
    return v6.st_ino;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FPDSubtreeChangeDetector retrieveFileIDWithError:].cold.1();

  return 0;
}

- (BOOL)maintainDirstatWithError:(id *)a3
{
  int v4;
  NSObject *v5;
  uint64_t v7;

  v7 = 0;
  v4 = ffsctl(self->_fd, 0x80084A02uLL, &v7, 0);
  if (v4 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FPDSubtreeChangeDetector maintainDirstatWithError:].cold.1();

  }
  return v4 >= 0;
}

- (unint64_t)retrieveDirstatGenCountWithError:(id *)a3
{
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  v6 = 1;
  if ((ffsctl(self->_fd, 0xC0284A20uLL, &v6, 0) & 0x80000000) == 0)
    return *((_QWORD *)&v8 + 1);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[FPDSubtreeChangeDetector retrieveDirstatGenCountWithError:].cold.1();

  return 0;
}

- (id)initAtPath:(id)a3 error:(id *)a4
{
  id v7;
  FPDSubtreeChangeDetector *v8;
  FPDSubtreeChangeDetector *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  FPDSubtreeChangeDetector *v13;
  void *v14;
  NSObject *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FPDSubtreeChangeDetector;
  v8 = -[FPDSubtreeChangeDetector init](&v17, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  objc_storeStrong((id *)&v8->_path, a3);
  objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
  v10 = fpfs_lp_openat();
  v9->_fd = v10;
  if (v10 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FPDSubtreeChangeDetector initAtPath:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v14);

    goto LABEL_13;
  }
  v11 = -[FPDSubtreeChangeDetector retrieveFileIDWithError:](v9, "retrieveFileIDWithError:", a4);
  v9->_fileID = v11;
  if (!v11
    || !-[FPDSubtreeChangeDetector maintainDirstatWithError:](v9, "maintainDirstatWithError:", a4)
    || (v12 = -[FPDSubtreeChangeDetector retrieveDirstatGenCountWithError:](v9, "retrieveDirstatGenCountWithError:", a4),
        (v9->_genCount = v12) == 0))
  {
    close(v9->_fd);
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
LABEL_6:
  v13 = v9;
LABEL_14:

  return v13;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)FPDSubtreeChangeDetector;
  -[FPDSubtreeChangeDetector dealloc](&v4, sel_dealloc);
}

- (id)verifyTreeIdentityWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  v5 = -[FPDSubtreeChangeDetector retrieveFileIDWithError:](self, "retrieveFileIDWithError:");
  if (v5)
  {
    v6 = v5;
    v5 = -[FPDSubtreeChangeDetector retrieveDirstatGenCountWithError:](self, "retrieveDirstatGenCountWithError:", a3);
    if (v5)
    {
      if (v6 == (void *)self->_fileID && v5 == (void *)self->_genCount)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (a3)
      {
        FPSubtreeChangedError();
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        *a3 = v7;
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p - '%@' %llu@%llu>"), objc_opt_class(), self, self->_path, self->_fileID, self->_genCount);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)retrieveFileIDWithError:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] Unable to stat directory at '%@': %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)maintainDirstatWithError:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] Unable to maintain dirstats at '%@': %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)retrieveDirstatGenCountWithError:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] Unable to retrieve dirstats at '%@': %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)initAtPath:error:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_4_0(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_0(&dword_1CF55F000, v1, v2, "[ERROR] Unable to open directory at '%@': %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_0();
}

@end
