@implementation LSOpenStagingDirectoryManager

- (optional<unsigned)bootstrapBaseStagingDirectoryNode:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  _QWORD *v9;
  char v10;
  char v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  $BEC950A715106DE229A2E4BA1089E24D v17;
  _BOOL8 v18;
  uint64_t v19;
  _BOOL8 v20;
  _BYTE buf[22];
  uint64_t v22;
  optional<unsigned long long> result;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  LOBYTE(v19) = 0;
  LOBYTE(v20) = 0;
  v19 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForNode:error:](self->_ioPersonality, "stagingDirectoryKeyForNode:error:", v6, a4);
  LOBYTE(v20) = v7;
  if (v7)
  {
    v8 = v6;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = v8;
    *(_DWORD *)&buf[16] = -1;
    v9 = std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,LaunchServices::OpenStaging::StagingDirectoryInfo>((uint64_t)&self->_stagingDirectoryInfoMap, (unint64_t *)&v19, &v19, (LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    v11 = v10;
    LaunchServices::OpenStaging::StagingDirectoryInfo::~StagingDirectoryInfo((LaunchServices::OpenStaging::StagingDirectoryInfo *)buf);
    if ((v11 & 1) != 0)
    {
      _LSDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), v19);
        objc_msgSend(v8, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Configured open staging directory for key %@ at %@", buf, 0x16u);

      }
    }
    else
    {
      _LSDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), v19);
        objc_msgSend((id)v9[4], "URL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Already have a staging directory for key %@ at %@", buf, 0x16u);

      }
    }

  }
  v17.__val_ = v19;
  v18 = v20;
  result.__engaged_ = v18;
  result.var0 = v17;
  return result;
}

- (LSOpenStagingDirectoryManager)initWithIOPersonality:(id)a3
{
  id v5;
  LSOpenStagingDirectoryManager *v6;
  LSOpenStagingDirectoryManager *v7;
  void **p_ioPersonality;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  char v26;
  id v27;
  NSObject *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)LSOpenStagingDirectoryManager;
  v6 = -[LSOpenStagingDirectoryManager init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    p_ioPersonality = (void **)&v6->_ioPersonality;
    objc_storeStrong((id *)&v6->_ioPersonality, a3);
    v7->_personaGeneration = 0;
    if (v7->_mainStagingDirectoryKey.__engaged_)
      v7->_mainStagingDirectoryKey.__engaged_ = 0;
    v9 = *p_ioPersonality;
    v33 = 0;
    v10 = v9;
    objc_msgSend(v10, "mainUserContainerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "makeStagingDirectoryNodeInContainer:error:", v11, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v33;
    v14 = v13;
    if (v12)
    {
      v32 = v13;
      v15 = -[LSOpenStagingDirectoryManager bootstrapBaseStagingDirectoryNode:error:](v7, "bootstrapBaseStagingDirectoryNode:error:", v12, &v32);
      v17 = v16;
      v18 = v32;

      v7->_mainStagingDirectoryKey.var0.__val_ = v15;
      v7->_mainStagingDirectoryKey.__engaged_ = v17;
      if (v17)
        goto LABEL_12;
      _LSDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.4();
    }
    else
    {
      _LSDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.3();
      v18 = v14;
    }

LABEL_12:
    v20 = *p_ioPersonality;
    v31 = v18;
    v21 = v20;
    objc_msgSend(v21, "mainSystemContainerURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "makeStagingDirectoryNodeInContainer:error:", v22, &v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v31;
    if (v23)
    {
      v30 = v24;
      -[LSOpenStagingDirectoryManager bootstrapBaseStagingDirectoryNode:error:](v7, "bootstrapBaseStagingDirectoryNode:error:", v23, &v30);
      v26 = v25;
      v27 = v30;

      if (v26)
      {
LABEL_20:

        -[LSOpenStagingDirectoryManager _locked_updatePersonaStagingDirectories](v7, "_locked_updatePersonaStagingDirectories");
        goto LABEL_21;
      }
      _LSDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.2();
    }
    else
    {
      _LSDefaultLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[LSOpenStagingDirectoryManager initWithIOPersonality:].cold.1();
      v27 = v24;
    }

    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

+ (id)sharedServerInstance
{
  _QWORD block[5];

  _LSAssertRunningInServer((uint64_t)"+[LSOpenStagingDirectoryManager sharedServerInstance]");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken != -1)
    dispatch_once(&+[LSOpenStagingDirectoryManager sharedServerInstance]::onceToken, block);
  return (id)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;
}

void __53__LSOpenStagingDirectoryManager_sharedServerInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  LSServerOpenStagingIOPersonality *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = objc_alloc_init(LSServerOpenStagingIOPersonality);
  v2 = objc_msgSend(v1, "initWithIOPersonality:");
  v3 = (void *)+[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance;
  +[LSOpenStagingDirectoryManager sharedServerInstance]::sharedInstance = v2;

}

- (void)_locked_updatePersonaStagingDirectories
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  v2 = 134217984;
  v3 = v0;
  _os_log_debug_impl(&dword_182882000, v1, OS_LOG_TYPE_DEBUG, "Persona generation %llu of staging directory manager is current.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (id)_locked_stagingDirectoryForKey:(unint64_t)a3
{
  id *v3;
  unint64_t v5;

  v5 = a3;
  v3 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::find<unsigned long long>(&self->_stagingDirectoryInfoMap.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3)
  {
    objc_msgSend(v3[4], "URL");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_stagingDirectoryForKeyRefreshingIfNecessary:(unint64_t)a3
{
  os_unfair_lock_s *p_mutex;
  void *v6;

  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  -[LSOpenStagingDirectoryManager _locked_updatePersonaStagingDirectories](self, "_locked_updatePersonaStagingDirectories");
  -[LSOpenStagingDirectoryManager _locked_stagingDirectoryForKey:](self, "_locked_stagingDirectoryForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_mutex);
  return v6;
}

- (id)stagingDirectoryForCloningURL:(id)a3 error:(id *)a4
{
  id v6;
  FSNode *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v6, 0, a4);
  v8 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForNode:error:](self->_ioPersonality, "stagingDirectoryKeyForNode:error:", v7, a4);
  if (!v9)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  -[LSOpenStagingDirectoryManager _stagingDirectoryForKeyRefreshingIfNecessary:](self, "_stagingDirectoryForKeyRefreshingIfNecessary:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find open staging directory for URL %@"), v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (a4)
    {
      v15 = *MEMORY[0x1E0CB2938];
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 2, (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningURL:error:]", 398, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (id)stagingDirectoryForCloningFileHandle:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = -[LSOpenStagingDirectoryManagerIOPersonality stagingDirectoryKeyForFileHandle:error:](self->_ioPersonality, "stagingDirectoryKeyForFileHandle:error:", v6, a4);
  if (v8)
  {
    -[LSOpenStagingDirectoryManager _stagingDirectoryForKeyRefreshingIfNecessary:](self, "_stagingDirectoryForKeyRefreshingIfNecessary:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a4 && !v9)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 2, (uint64_t)"-[LSOpenStagingDirectoryManager stagingDirectoryForCloningFileHandle:error:]", 410, 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)mainDataVolumeStagingURLWithError:(id *)a3
{
  os_unfair_lock_s *p_mutex;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  p_mutex = (os_unfair_lock_s *)&self->_mutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_mutex);
  if (!self->_mainStagingDirectoryKey.__engaged_)
  {
    os_unfair_lock_unlock(p_mutex);
    if (!a3)
    {
LABEL_7:
      v6 = 0;
      return v6;
    }
LABEL_6:
    v9 = *MEMORY[0x1E0CB2938];
    v10[0] = CFSTR("Could not find open staging directory for main data volume?");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 2, (uint64_t)"-[LSOpenStagingDirectoryManager mainDataVolumeStagingURLWithError:]", 428, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  -[LSOpenStagingDirectoryManager _locked_stagingDirectoryForKey:](self, "_locked_stagingDirectoryForKey:", self->_mainStagingDirectoryKey.var0.__val_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_mutex);
  if (!v6)
  {
    if (!a3)
      goto LABEL_7;
    goto LABEL_6;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioPersonality, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,LaunchServices::OpenStaging::StagingDirectoryInfo>>>::~__hash_table((uint64_t)&self->_stagingDirectoryInfoMap);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 80) = 0;
  return self;
}

- (void)initWithIOPersonality:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Could not create and clean main system data volume staging directory: personality %@, error %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithIOPersonality:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_2(&dword_182882000, v0, v1, "Could not find volume identifier for system staging directory node %@: %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithIOPersonality:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Could not create and clean main user data volume staging directory: personality %@, error %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithIOPersonality:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_2(&dword_182882000, v0, v1, "Could not find volume identifier for main staging directory node %@: %@");
  OUTLINED_FUNCTION_1();
}

@end
