@implementation IXGlobalConfiguration

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__IXGlobalConfiguration_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_shared;
}

void __39__IXGlobalConfiguration_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

- (IXGlobalConfiguration)init
{
  IXGlobalConfiguration *v2;
  IXGlobalConfiguration *v3;
  size_t v4;
  char *pw_dir;
  uint64_t v6;
  NSURL *daemonUserHome;
  uint64_t v8;
  NSURL *rootPath;
  uint64_t v11;
  passwd *v12;
  passwd v13;
  objc_super v14;
  _OWORD v15[5];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)IXGlobalConfiguration;
  v2 = -[IXGlobalConfiguration init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dynamicPropertyLock._os_unfair_lock_opaque = 0;
    v4 = sysconf(71);
    if (v4 == -1)
      -[IXGlobalConfiguration init].cold.1(&v13, v15);
    memset(&v13, 0, sizeof(v13));
    v12 = 0;
    if (getpwnam_r("mobile", &v13, (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v4, &v12) || !v12)
      -[IXGlobalConfiguration init].cold.2(&v11, v15);
    pw_dir = v13.pw_dir;
    v3->_daemonUID = v13.pw_uid;
    v3->_daemonGID = v13.pw_gid;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", pw_dir, 1, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    daemonUserHome = v3->_daemonUserHome;
    v3->_daemonUserHome = (NSURL *)v6;

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/", 1, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    rootPath = v3->_rootPath;
    v3->_rootPath = (NSURL *)v8;

  }
  return v3;
}

- (void)createDirectories
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

- (id)_dataStorageHomeURLWithError:(id *)a3
{
  os_unfair_lock_s *p_dynamicPropertyLock;
  NSURL *dataStorageHome;
  void *v7;
  uint64_t v8;
  void *v9;
  NSURL *v10;
  NSURL *v11;
  NSObject *v12;
  uint64_t v13;
  NSURL *v14;
  uint64_t v16;

  p_dynamicPropertyLock = &self->_dynamicPropertyLock;
  os_unfair_lock_lock(&self->_dynamicPropertyLock);
  dataStorageHome = self->_dataStorageHome;
  if (dataStorageHome)
  {
    v7 = 0;
  }
  else
  {
    v16 = 0;
    v8 = container_system_group_path_for_identifier();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v8, 1, 0);
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v11 = self->_dataStorageHome;
      self->_dataStorageHome = v10;

      free(v9);
      v7 = 0;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[IXGlobalConfiguration _dataStorageHomeURLWithError:].cold.1(&v16, v12);

      _CreateError((uint64_t)"-[IXGlobalConfiguration _dataStorageHomeURLWithError:]", 223, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_group_path_for_identifier returned %llu"),
        v13,
        v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    dataStorageHome = self->_dataStorageHome;
  }
  v14 = dataStorageHome;
  os_unfair_lock_unlock(p_dynamicPropertyLock);
  if (a3 && !v14)
    *a3 = objc_retainAutorelease(v7);

  return v14;
}

- (id)dataDirectoryWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IXGlobalConfiguration _dataStorageHomeURLWithError:](self, "_dataStorageHomeURLWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "urlByAppendingPathComponents:lastIsDirectory:", &unk_1E4DD8700, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataDirectoryAbortingOnError
{
  void *v2;
  id v3;
  uint64_t v5;
  id v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
    -[IXGlobalConfiguration dataDirectoryAbortingOnError].cold.1(&v5, v7);

  return v2;
}

- (id)promiseStagingRootDirectoryWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("PromiseStaging"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)promiseStagingRootDirectoryAbortingOnError
{
  void *v2;
  id v3;
  uint64_t v5;
  id v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[IXGlobalConfiguration promiseStagingRootDirectoryWithError:](self, "promiseStagingRootDirectoryWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
    -[IXGlobalConfiguration promiseStagingRootDirectoryAbortingOnError].cold.1(&v5, v7);

  return v2;
}

- (id)removabilityDirectoryWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Removability"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)removabilityDirectoryAbortingOnError
{
  void *v2;
  id v3;
  uint64_t v5;
  id v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  -[IXGlobalConfiguration removabilityDirectoryWithError:](self, "removabilityDirectoryWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
    -[IXGlobalConfiguration createDirectories].cold.4(&v5, v7);

  return v2;
}

- (id)remoteInstallationStagingDirectory:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[IXGlobalConfiguration dataDirectoryWithError:](self, "dataDirectoryWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("RemoteInstallStaging"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_userTempDirURLWithError:(id *)a3
{
  void *v4;
  void *v5;
  int *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  char v11[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  bzero(v11, 0x400uLL);
  if (confstr(65537, v11, 0x400uLL))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v6 = __error();
    v7 = *v6;
    v8 = (void *)*MEMORY[0x1E0CB2FE0];
    strerror(*v6);
    _CreateError((uint64_t)"-[IXGlobalConfiguration _userTempDirURLWithError:]", 314, v8, v7, 0, 0, CFSTR("Failed to initialize temporary directory: error = %d (%s)"), v9, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v4)
    *a3 = objc_retainAutorelease(v5);
LABEL_7:

  return v4;
}

- (id)iconStagingDirectoryWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  -[IXGlobalConfiguration _userTempDirURLWithError:](self, "_userTempDirURLWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("TempIcons"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease(v5);
LABEL_7:

  return v6;
}

- (id)extractedInstallableStagingDirectory:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  -[IXGlobalConfiguration _userTempDirURLWithError:](self, "_userTempDirURLWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v4)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("ExtractedApps"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease(v5);
LABEL_7:

  return v6;
}

- (NSURL)frameworkURL
{
  void *v2;
  void *v3;

  -[IXGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlByAppendingPathComponents:lastIsDirectory:", &unk_1E4DD8718, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)userVolumeURL
{
  void *v2;
  void *v3;

  -[IXGlobalConfiguration rootPath](self, "rootPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlByAppendingPathComponents:lastIsDirectory:", &unk_1E4DD8730, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)dataStorageHome
{
  return self->_dataStorageHome;
}

- (unsigned)daemonUID
{
  return self->_daemonUID;
}

- (unsigned)daemonGID
{
  return self->_daemonGID;
}

- (NSURL)daemonUserHome
{
  return self->_daemonUserHome;
}

- (NSURL)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_daemonUserHome, 0);
  objc_storeStrong((id *)&self->_dataStorageHome, 0);
}

- (void)init
{
  int v4;

  v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_3_1();
  strerror(v4);
  OUTLINED_FUNCTION_2_1();
  _os_crash_msg();
  __break(1u);
}

- (void)_dataStorageHomeURLWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315650;
  v4 = "-[IXGlobalConfiguration _dataStorageHomeURLWithError:]";
  v5 = 2048;
  v6 = v2;
  v7 = 2112;
  v8 = 0;
  _os_log_error_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get group container path for group 'systemgroup.com.apple.installcoordinationd'; container_system_grou"
    "p_path_for_identifier returned %llu : %@",
    (uint8_t *)&v3,
    0x20u);
}

- (void)dataDirectoryAbortingOnError
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

- (void)promiseStagingRootDirectoryAbortingOnError
{
  OUTLINED_FUNCTION_1_2(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

@end
