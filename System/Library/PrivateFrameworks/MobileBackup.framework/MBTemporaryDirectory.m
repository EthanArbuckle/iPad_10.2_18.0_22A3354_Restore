@implementation MBTemporaryDirectory

+ (id)sharedTemporaryDirectoryForTest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    +[MBTemporaryDirectory sharedTemporaryDirectoryForTest:].cold.1();
  if (_testingOnlySharedVolumeTmpDirRoot_onceToken != -1)
    dispatch_once(&_testingOnlySharedVolumeTmpDirRoot_onceToken, &__block_literal_global_0);
  v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]([MBTemporaryDirectory alloc], "_initWithExistingFsRepPath:identifier:", _mkdtemp((const char *)_testingOnlySharedVolumeTmpDirRoot__path, v3), v3);

  return v4;
}

+ (id)userTemporaryDirectoryForTest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    +[MBTemporaryDirectory userTemporaryDirectoryForTest:].cold.1();
  if (_testingOnlyUserVolumeTmpDirRoot_onceToken != -1)
    dispatch_once(&_testingOnlyUserVolumeTmpDirRoot_onceToken, &__block_literal_global_67);
  v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]([MBTemporaryDirectory alloc], "_initWithExistingFsRepPath:identifier:", _mkdtemp((const char *)_testingOnlyUserVolumeTmpDirRoot__path, v3), v3);

  return v4;
}

+ (id)sharedTemporaryDirectoryIdentifiedBy:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    +[MBTemporaryDirectory sharedTemporaryDirectoryIdentifiedBy:].cold.1();
  if (_sharedVolumeTmpDirRoot_onceToken != -1)
    dispatch_once(&_sharedVolumeTmpDirRoot_onceToken, &__block_literal_global_69);
  v4 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]([MBTemporaryDirectory alloc], "_initWithExistingFsRepPath:identifier:", _mkdtemp((const char *)_sharedVolumeTmpDirRoot__path, v3), v3);

  return v4;
}

+ (id)userTemporaryDirectoryForPersona:(id)a3 identifiedBy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if (!v5)
    +[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:].cold.1();
  v7 = v6;
  if (!objc_msgSend(v6, "length"))
    +[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:].cold.2();
  objc_msgSend(v5, "volumeMountPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("tmp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("com.apple.backup"));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

  _mkpath_if_necessary(v11);
  v12 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]([MBTemporaryDirectory alloc], "_initWithExistingFsRepPath:identifier:", _mkdtemp(v11, v7), v7);

  return v12;
}

+ (id)temporaryDirectoryOnSameVolumeAsPath:(id)a3 identifiedBy:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:].cold.1();
  v9 = v8;
  if (!objc_msgSend(v8, "length"))
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:].cold.2();
  if (!a5)
    +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:].cold.3();
  +[MBFileSystemManager volumeMountPointForFile:error:](MBFileSystemManager, "volumeMountPointForFile:error:", v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("tmp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("com.apple.backup"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");

    _mkpath_if_necessary(v14);
    v15 = -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]([MBTemporaryDirectory alloc], "_initWithExistingFsRepPath:identifier:", _mkdtemp(v14, v9), v9);
  }
  else
  {
    MBGetDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *a5;
      *(_DWORD *)buf = 138412546;
      v26 = v7;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1D5213000, v16, OS_LOG_TYPE_ERROR, "=tmpdir= could not find mount point for %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=tmpdir= could not find mount point for %@: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
    }

    v15 = 0;
  }

  return v15;
}

- (id)_initWithExistingFsRepPath:(char *)a3 identifier:(id)a4
{
  id v7;
  void *v8;
  MBTemporaryDirectory *v9;
  uint64_t v10;
  NSString *path;
  objc_super v13;

  v7 = a4;
  if (!a3)
    -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:].cold.1();
  v8 = v7;
  if (!v7)
    -[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:].cold.2();
  v13.receiver = self;
  v13.super_class = (Class)MBTemporaryDirectory;
  v9 = -[MBTemporaryDirectory init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "mb_stringWithFileSystemRepresentation:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    path = v9->_path;
    v9->_path = (NSString *)v10;

    v9->_fsRepPath = a3;
    objc_storeStrong((id *)&v9->_identifier, a4);
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (id)makeTemporaryFilePath
{
  return _mktemp(self->_fsRepPath);
}

- (BOOL)purgeContentsWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  uint8_t buf[4];
  MBTemporaryDirectory *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[MBTemporaryDirectory path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  _mktemp((const char *)objc_msgSend(v7, "fileSystemRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBTemporaryDirectory path](self, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v11 = objc_msgSend(v9, "moveItemAtPath:toPath:error:", v10, v8, &v34);
  v12 = v34;

  if ((v11 & 1) != 0)
  {
    -[MBTemporaryDirectory path](self, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v12;
    v14 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 0, 0, &v33);
    v15 = v33;

    if ((v14 & 1) != 0)
    {
      v16 = -[MBTemporaryDirectory _purgeContentsAt:error:](self, "_purgeContentsAt:error:", v8, a3);
LABEL_15:
      v12 = v15;
      goto LABEL_16;
    }
    MBGetDefaultLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_1D5213000, v25, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to create new contents directory: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=tmpdir= %@ failed to create new contents directory: %@", v26, v27, v28, v29, v30, v31, (uint64_t)self);
    }

    if (!a3)
    {
      v16 = 0;
      goto LABEL_15;
    }
    v24 = v15;
  }
  else
  {
    MBGetDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_1D5213000, v17, OS_LOG_TYPE_ERROR, "=tmpdir= %@ failed to move contents aside to purge: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=tmpdir= %@ failed to move contents aside to purge: %@", v18, v19, v20, v21, v22, v23, (uint64_t)self);
    }

    if (!a3)
    {
      v16 = 0;
      goto LABEL_16;
    }
    v24 = v12;
  }
  v12 = objc_retainAutorelease(v24);
  v16 = 0;
  *a3 = v12;
LABEL_16:

  return v16;
}

- (BOOL)_purgeContentsAt:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  uint8_t buf[4];
  MBTemporaryDirectory *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3620];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v7, &v19);

  v10 = v19;
  if ((v9 & 1) == 0)
  {
    MBGetDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_ERROR, "=tmpdir= failed to delete %@: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=tmpdir= failed to delete %@: %@", v12, v13, v14, v15, v16, v17, (uint64_t)self);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

- (void)disposeWithoutDeleting
{
  MBTemporaryDirectory *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_disposed = 1;
  objc_sync_exit(obj);

}

- (BOOL)disposeWithError:(id *)a3
{
  MBTemporaryDirectory *v5;
  void *v6;
  BOOL v7;
  void *v9;

  v5 = self;
  objc_sync_enter(v5);
  if (v5->_disposed)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MBTemporaryDirectory.m"), 226, CFSTR("TempDir: cannot be disposed multiple times %@"), v5);

  }
  v5->_disposed = 1;
  -[MBTemporaryDirectory path](v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MBTemporaryDirectory _purgeContentsAt:error:](v5, "_purgeContentsAt:error:", v6, a3);

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)dispose
{
  return -[MBTemporaryDirectory disposeWithError:](self, "disposeWithError:", 0);
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  MBTemporaryDirectory *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  free(self->_fsRepPath);
  self->_fsRepPath = 0;
  if (!self->_disposed)
  {
    MBGetDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_ERROR, "=tmpdir= %@ was not disposed before being dealloc'd", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=tmpdir= %@ was not disposed before being dealloc'd", v4, v5, v6, v7, v8, v9, (uint64_t)self);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)MBTemporaryDirectory;
  -[MBTemporaryDirectory dealloc](&v10, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, path: %s>"), v5, self->_identifier, self->_fsRepPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)sharedTemporaryDirectoryForTest:.cold.1()
{
  __assert_rtn("+[MBTemporaryDirectory sharedTemporaryDirectoryForTest:]", "MBTemporaryDirectory.m", 116, "testName.length");
}

+ (void)userTemporaryDirectoryForTest:.cold.1()
{
  __assert_rtn("+[MBTemporaryDirectory userTemporaryDirectoryForTest:]", "MBTemporaryDirectory.m", 123, "testName.length");
}

+ (void)sharedTemporaryDirectoryIdentifiedBy:.cold.1()
{
  __assert_rtn("+[MBTemporaryDirectory sharedTemporaryDirectoryIdentifiedBy:]", "MBTemporaryDirectory.m", 130, "identifier.length");
}

+ (void)userTemporaryDirectoryForPersona:identifiedBy:.cold.1()
{
  __assert_rtn("+[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:]", "MBTemporaryDirectory.m", 137, "persona");
}

+ (void)userTemporaryDirectoryForPersona:identifiedBy:.cold.2()
{
  __assert_rtn("+[MBTemporaryDirectory userTemporaryDirectoryForPersona:identifiedBy:]", "MBTemporaryDirectory.m", 138, "identifier.length");
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.1()
{
  __assert_rtn("+[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]", "MBTemporaryDirectory.m", 148, "path");
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.2()
{
  __assert_rtn("+[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]", "MBTemporaryDirectory.m", 149, "identifier.length");
}

+ (void)temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:.cold.3()
{
  __assert_rtn("+[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:]", "MBTemporaryDirectory.m", 150, "error");
}

- (void)_initWithExistingFsRepPath:identifier:.cold.1()
{
  __assert_rtn("-[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]", "MBTemporaryDirectory.m", 166, "fsRepPath");
}

- (void)_initWithExistingFsRepPath:identifier:.cold.2()
{
  __assert_rtn("-[MBTemporaryDirectory _initWithExistingFsRepPath:identifier:]", "MBTemporaryDirectory.m", 167, "identifier");
}

@end
