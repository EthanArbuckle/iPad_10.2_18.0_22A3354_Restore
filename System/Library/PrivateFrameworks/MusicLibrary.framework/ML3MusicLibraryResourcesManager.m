@implementation ML3MusicLibraryResourcesManager

+ (ML3MusicLibraryResourcesManager)sharedManager
{
  if (sharedManager_onceToken[0] != -1)
    dispatch_once(sharedManager_onceToken, &__block_literal_global_16395);
  return (ML3MusicLibraryResourcesManager *)(id)sharedManager___sharedManager;
}

- (id)pathForResourceFileOrFolder:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResourceFileOrFolder:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_ML3BaseMusicLibraryResourcesManager)implementation
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _ML3BaseMusicLibraryResourcesManager *v20;
  _ML3BaseMusicLibraryResourcesManager *implementation;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _ML3MultiUserMusicLibraryResourcesManager *v28;
  _ML3BaseMusicLibraryResourcesManager *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _ML3BaseMusicLibraryResourcesManager *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  _ML3BaseMusicLibraryResourcesManager *v44;
  _ML3BaseMusicLibraryResourcesManager *v45;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_implementation)
  {
    -[ML3MusicLibraryResourcesManager context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isMultiUserSupported") & 1) != 0)
    {
      -[ML3MusicLibraryResourcesManager context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isRunningInDaemon");

      if (v7)
      {
        -[ML3MusicLibraryResourcesManager context](self, "context");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accountInfo");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          -[ML3MusicLibraryResourcesManager context](self, "context");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "accountChangeObserver");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
LABEL_7:
            v14 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v48) = 0;
              _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEBUG, "Creating a multi-users daemon library resource manager", (uint8_t *)&v48, 2u);
            }

            v15 = [_ML3MultiUserDaemonMusicLibraryResourcesManager alloc];
            -[ML3MusicLibraryResourcesManager context](self, "context");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "accountInfo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[ML3MusicLibraryResourcesManager context](self, "context");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "accountChangeObserver");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[_ML3MultiUserDaemonMusicLibraryResourcesManager initWithAccountInfo:accountChangeObserver:](v15, "initWithAccountInfo:accountChangeObserver:", v17, v19);
            implementation = self->_implementation;
            self->_implementation = v20;

            goto LABEL_32;
          }
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MusicLibraryResourcesManager.m"), 159, CFSTR("Daemon multi-users resources manager context must specify both account info provider and a media library account change observer"));

        goto LABEL_7;
      }
    }
    else
    {

    }
    -[ML3MusicLibraryResourcesManager context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isMultiUserSupported") & 1) != 0)
    {
      -[ML3MusicLibraryResourcesManager context](self, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isRunningInDaemon");

      if ((v24 & 1) == 0)
      {
        -[ML3MusicLibraryResourcesManager context](self, "context");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "resourcesService");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MusicLibraryResourcesManager.m"), 164, CFSTR("Non-daemon multi-users resources manager context must specify the resources service"));

        }
        v27 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v48) = 0;
          _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEBUG, "Creating a multi-users client resource manager", (uint8_t *)&v48, 2u);
        }

        v28 = [_ML3MultiUserMusicLibraryResourcesManager alloc];
        -[ML3MusicLibraryResourcesManager context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resourcesService");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[_ML3MultiUserMusicLibraryResourcesManager initWithLibraryResourcesService:](v28, "initWithLibraryResourcesService:", v17);
LABEL_31:
        v45 = self->_implementation;
        self->_implementation = v29;

LABEL_32:
        goto LABEL_33;
      }
    }
    else
    {

    }
    -[ML3MusicLibraryResourcesManager context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isMultiUserSupported");

    if ((v31 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3MusicLibraryResourcesManager.m"), 184, CFSTR("No implementation of ML3MusicLibraryResourcesManager supports the current configuration"));
LABEL_33:

      goto LABEL_34;
    }
    -[ML3MusicLibraryResourcesManager context](self, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "libraryContainerIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        -[ML3MusicLibraryResourcesManager context](self, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "libraryContainerIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543362;
        v49 = v36;
        _os_log_impl(&dword_1AC149000, v34, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager with library container: %{public}@", (uint8_t *)&v48, 0xCu);

      }
      v37 = [_ML3BaseMusicLibraryResourcesManager alloc];
      -[ML3MusicLibraryResourcesManager context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "libraryContainerIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_ML3BaseMusicLibraryResourcesManager initWithLibraryContainerIdentifier:](v37, "initWithLibraryContainerIdentifier:", v17);
    }
    else
    {
      -[ML3MusicLibraryResourcesManager context](self, "context");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "accountInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
      if (v39)
      {
        if (v41)
        {
          -[ML3MusicLibraryResourcesManager context](self, "context");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "accountInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 138543362;
          v49 = v43;
          _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager for account info: %{public}@", (uint8_t *)&v48, 0xCu);

        }
      }
      else if (v41)
      {
        LOWORD(v48) = 0;
        _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_DEBUG, "Creating a single library resource manager for the default media folder", (uint8_t *)&v48, 2u);
      }

      v44 = [_ML3BaseMusicLibraryResourcesManager alloc];
      -[ML3MusicLibraryResourcesManager context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accountInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_ML3BaseMusicLibraryResourcesManager initWithAccountInfo:](v44, "initWithAccountInfo:", v17);
    }
    goto LABEL_31;
  }
LABEL_34:
  os_unfair_lock_unlock(p_lock);
  return self->_implementation;
}

- (ML3MusicLibraryResourcesManagerContext)context
{
  return self->_context;
}

void __48__ML3MusicLibraryResourcesManager_sharedManager__block_invoke()
{
  ML3MusicLibraryResourcesManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ML3MusicLibraryResourcesManager alloc];
  +[ML3MusicLibraryResourcesManagerContext contextForAutoupdatingSharedLibrary](ML3MusicLibraryResourcesManagerContext, "contextForAutoupdatingSharedLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ML3MusicLibraryResourcesManager initWithContext:](v0, "initWithContext:", v3);
  v2 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = v1;

}

- (ML3MusicLibraryResourcesManager)initWithContext:(id)a3
{
  id v5;
  ML3MusicLibraryResourcesManager *v6;
  ML3MusicLibraryResourcesManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3MusicLibraryResourcesManager;
  v6 = -[ML3MusicLibraryResourcesManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setContext:(id)a3
{
  id v4;
  ML3MusicLibraryResourcesManagerContext *v5;
  ML3MusicLibraryResourcesManagerContext *context;
  _ML3BaseMusicLibraryResourcesManager *implementation;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = (ML3MusicLibraryResourcesManagerContext *)v4;
  }
  else
  {
    +[ML3MusicLibraryResourcesManagerContext contextForAutoupdatingSharedLibrary](ML3MusicLibraryResourcesManagerContext, "contextForAutoupdatingSharedLibrary");
    v5 = (ML3MusicLibraryResourcesManagerContext *)objc_claimAutoreleasedReturnValue();
  }
  context = self->_context;
  self->_context = v5;

  implementation = self->_implementation;
  self->_implementation = 0;

}

- (id)libraryContainerPath
{
  void *v2;
  void *v3;

  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryContainerPathByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryContainerRelativePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)musicAssetsContainerPath
{
  void *v2;
  void *v3;

  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "musicAssetsContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:", v8, v10, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  void *v4;
  void *v5;

  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForBaseLocationPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ML3MusicLibraryResourcesManager implementation](self, "implementation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaFolderRelativePath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ML3MusicLibraryResourcesManager)initWithBaseResourcesManager:(id)a3
{
  id v5;
  ML3MusicLibraryResourcesManager *v6;
  ML3MusicLibraryResourcesManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3MusicLibraryResourcesManager;
  v6 = -[ML3MusicLibraryResourcesManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_implementation, a3);

  return v7;
}

- (ML3MusicLibraryResourcesManager)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ML3MusicLibraryResourcesManager *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManagingResourceForSingleUserWithAccountInfoKey")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("implementationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ML3MusicLibraryResourcesManager initWithBaseResourcesManager:](self, "initWithBaseResourcesManager:", v5);

    v6 = self;
  }
  else
  {
    +[ML3MusicLibraryResourcesManager sharedManager](ML3MusicLibraryResourcesManager, "sharedManager");
    v6 = (ML3MusicLibraryResourcesManager *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ML3MusicLibraryResourcesManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMultiUserSupported"))
  {

    objc_msgSend(v7, "encodeBool:forKey:", 0, CFSTR("isManagingResourceForSingleUserWithAccountInfoKey"));
  }
  else
  {
    -[ML3MusicLibraryResourcesManager context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "encodeBool:forKey:", v6 != 0, CFSTR("isManagingResourceForSingleUserWithAccountInfoKey"));
    if (v6)
      objc_msgSend(v7, "encodeObject:forKey:", self->_implementation, CFSTR("implementationKey"));
  }

}

- (void)setImplementation:(id)a3
{
  objc_storeStrong((id *)&self->_implementation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_implementation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
