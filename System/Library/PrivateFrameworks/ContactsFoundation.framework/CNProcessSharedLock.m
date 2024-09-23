@implementation CNProcessSharedLock

+ (id)os_log
{
  if (os_log_cn_once_token_1_15 != -1)
    dispatch_once(&os_log_cn_once_token_1_15, &__block_literal_global_74);
  return (id)os_log_cn_once_object_1_15;
}

void __29__CNProcessSharedLock_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.locking", "process-shared-lock");
  v1 = (void *)os_log_cn_once_object_1_15;
  os_log_cn_once_object_1_15 = (uint64_t)v0;

}

+ (CNProcessSharedLock)sharedLockWithLockFilePath:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3740];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLockFilePath:localLock:", v5, v6);

  return (CNProcessSharedLock *)v7;
}

+ (id)recursiveSharedLockWithLockFilePath:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB38E0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLockFilePath:localLock:", v5, v6);

  return v7;
}

+ (id)semaphoreSharedLockWithLockFilePath:(id)a3
{
  id v4;
  CNBinarySemaphoreLock *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNBinarySemaphoreLock);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLockFilePath:localLock:", v4, v5);

  return v6;
}

- (CNProcessSharedLock)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithLockFilePath_localLock_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNProcessSharedLock *v9;

  v6 = a4;
  v7 = a3;
  +[CNFileServices sharedInstance](CNFileServices, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNProcessSharedLock initWithLockFilePath:localLock:fileServices:](self, "initWithLockFilePath:localLock:fileServices:", v7, v6, v8);

  return v9;
}

- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4 fileServices:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNProcessSharedLock *v11;
  uint64_t v12;
  NSString *lockFilePath;
  uint64_t v14;
  CNInhibitor *runningBoardInhibitor;
  CNProcessSharedLock *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNProcessSharedLock;
  v11 = -[CNProcessSharedLock init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    lockFilePath = v11->_lockFilePath;
    v11->_lockFilePath = (NSString *)v12;

    objc_storeStrong((id *)&v11->_localLock, a4);
    v11->_fileDescriptor = -1;
    objc_storeStrong((id *)&v11->_fileServices, a5);
    +[CNInhibitor runningboardInhibitorWithExplanation:](CNInhibitor, "runningboardInhibitorWithExplanation:", CFSTR("Contacts shared filesystem lock"));
    v14 = objc_claimAutoreleasedReturnValue();
    runningBoardInhibitor = v11->_runningBoardInhibitor;
    v11->_runningBoardInhibitor = (CNInhibitor *)v14;

    v16 = v11;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[CNProcessSharedLock invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CNProcessSharedLock;
  -[CNProcessSharedLock dealloc](&v3, sel_dealloc);
}

- (BOOL)open:(id *)a3
{
  void *v4;
  BOOL v5;

  CNMakeErrorHelper((uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNProcessSharedLock ensureFileDescriptorIsInvalid:](self, "ensureFileDescriptorIsInvalid:", v4)
    && -[CNProcessSharedLock openLockFile:](self, "openLockFile:", v4)
    && -[CNProcessSharedLock ensureFileIsLocal:](self, "ensureFileIsLocal:", v4);

  return v5;
}

- (BOOL)ensureFileDescriptorIsInvalid:(id)a3
{
  void (**v4)(id, _QWORD *);
  _BOOL4 v5;
  _QWORD v7[5];

  v4 = (void (**)(id, _QWORD *))a3;
  v5 = -[CNProcessSharedLock isValidFileDescriptor](self, "isValidFileDescriptor");
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__CNProcessSharedLock_ensureFileDescriptorIsInvalid___block_invoke;
    v7[3] = &unk_1E29BC230;
    v7[4] = self;
    v4[2](v4, v7);
  }

  return !v5;
}

id __53__CNProcessSharedLock_ensureFileDescriptorIsInvalid___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *MEMORY[0x1E0CB28A8];
  objc_msgSend(*(id *)(a1 + 32), "errorUserInfoWithDescription:", CFSTR("File lock already opened"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 255, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)openLockFile:(id)a3
{
  void (**v4)(id, _QWORD *);
  NSObject *v5;
  int v6;
  NSString *lockFilePath;
  int fileDescriptor;
  _QWORD v10[5];
  uint8_t buf[4];
  CNProcessSharedLock *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD *))a3;
  self->_fileDescriptor = -[CNFileServices open:::](self->_fileServices, "open:::", -[NSString fileSystemRepresentation](self->_lockFilePath, "fileSystemRepresentation"), 514, 384);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    lockFilePath = self->_lockFilePath;
    fileDescriptor = self->_fileDescriptor;
    *(_DWORD *)buf = 134218498;
    v12 = self;
    v13 = 2112;
    v14 = lockFilePath;
    v15 = 1024;
    v16 = fileDescriptor;
    _os_log_debug_impl(&dword_18F80C000, v5, OS_LOG_TYPE_DEBUG, "%p: lockFilePath: %@, file descriptor: %d", buf, 0x1Cu);
  }

  v6 = self->_fileDescriptor;
  if (v6 < 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__CNProcessSharedLock_openLockFile___block_invoke;
    v10[3] = &unk_1E29BC230;
    v10[4] = self;
    v4[2](v4, v10);
    self->_fileDescriptor = -1;
  }

  return v6 >= 0;
}

id __36__CNProcessSharedLock_openLockFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "errnoValue");
  objc_msgSend(*(id *)(a1 + 32), "errorUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFoundationError errorWithErrno:userInfo:](CNFoundationError, "errorWithErrno:userInfo:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)ensureFileIsLocal:(id)a3
{
  void (**v4)(_QWORD);
  id (*v5)(uint64_t);
  uint64_t *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (-[CNFileServices fstatfs::](self->_fileServices, "fstatfs::", self->_fileDescriptor, v11) < 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    v5 = __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke;
    v6 = &v10;
  }
  else
  {
    if ((BYTE1(v12) & 0x10) != 0)
    {
      v7 = 1;
      goto LABEL_7;
    }
    v9 = MEMORY[0x1E0C809B0];
    v5 = __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke_2;
    v6 = &v9;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_1E29BC230;
  v6[4] = (uint64_t)self;
  v4[2](v4);
  close(self->_fileDescriptor);
  v7 = 0;
  self->_fileDescriptor = -1;
LABEL_7:

  return v7;
}

id __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "errnoValue");
  objc_msgSend(*(id *)(a1 + 32), "errorUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFoundationError errorWithErrno:userInfo:](CNFoundationError, "errorWithErrno:userInfo:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = *MEMORY[0x1E0CB28A8];
  objc_msgSend(*(id *)(a1 + 32), "errorUserInfoWithDescription:", CFSTR("Not a local file"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 258, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)invalidate
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_18F80C000, v1, OS_LOG_TYPE_DEBUG, "%p: closing fd: %d", v2, 0x12u);
  OUTLINED_FUNCTION_10();
}

- (void)lock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18F80C000, v0, v1, "%p: Locked locks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)unlock
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18F80C000, v0, v1, "%p: Trying to unlock file lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)lockRetryOnEDEADLK
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_2_6(&dword_18F80C000, a2, a3, "Couldn't lock process shared lock %p: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_10();
}

- (BOOL)isValidFileDescriptor
{
  return self->_fileDescriptor >= 0;
}

- (id)exceptionWithName:(id)a3 reason:(id)a4
{
  CNFileServices *fileServices;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  fileServices = self->_fileServices;
  v7 = a4;
  v8 = a3;
  v9 = -[CNFileServices errnoValue](fileServices, "errnoValue");
  -[CNProcessSharedLock errorUserInfo](self, "errorUserInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNFoundationError errorWithErrno:userInfo:](CNFoundationError, "errorWithErrno:userInfo:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v7, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E0CB3388], 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)errorUserInfo
{
  return -[CNProcessSharedLock errorUserInfoWithDescription:](self, "errorUserInfoWithDescription:", 0);
}

- (id)errorUserInfoWithDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_name, CFSTR("CNLockName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_fileDescriptor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("CNFileDescriptor"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_lockFilePath, *MEMORY[0x1E0CB2AA0]);
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("name"), self->_name, CFSTR("lockFilePath"), self->_lockFilePath, CFSTR("localLock"), self->_localLock, 0);
  v5 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("fileDescriptor"), self->_fileDescriptor);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)lockFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CNInhibitor)runningBoardInhibitor
{
  return (CNInhibitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRunningBoardInhibitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBoardInhibitor, 0);
  objc_storeStrong((id *)&self->_fileServices, 0);
  objc_storeStrong((id *)&self->_localLock, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lockFilePath, 0);
}

@end
