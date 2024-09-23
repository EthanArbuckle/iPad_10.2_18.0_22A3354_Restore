@implementation MCMPOSIXUser

- (unsigned)UID
{
  return self->_UID;
}

- (unsigned)primaryGID
{
  return self->_primaryGID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unvalidatedHomeDirectoryURL, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

+ (MCMPOSIXUser)posixUserWithUID:(unsigned int)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MCMPOSIXUser_posixUserWithUID___block_invoke;
  v7[3] = &__block_descriptor_40_e22___MCMPOSIXUser_12__0I8l;
  v7[4] = a1;
  objc_msgSend(a1, "_getCachedUID:flush:onCacheMiss:", *(_QWORD *)&a3, 0, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v9 = a3;
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "Could not generate posix user details for uid=%{public}u", buf, 8u);
    }

  }
  return (MCMPOSIXUser *)v4;
}

+ (id)_getCachedUID:(unsigned int)a3 flush:(BOOL)a4 onCacheMiss:(id)a5
{
  _BOOL4 v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v7 = (void (**)(id, _QWORD))a5;
  if (_getCachedUID_flush_onCacheMiss__onceToken != -1)
    dispatch_once(&_getCachedUID_flush_onCacheMiss__onceToken, &__block_literal_global_12840);
  v8 = (id)_getCachedUID_flush_onCacheMiss__cache;
  objc_sync_enter(v8);
  if (v5)
    objc_msgSend((id)_getCachedUID_flush_onCacheMiss__cache, "removeAllObjects");
  v9 = (void *)_getCachedUID_flush_onCacheMiss__cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!v11)
    {
      v7[2](v7, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)_getCachedUID_flush_onCacheMiss__cache;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      }
    }
  }
  objc_sync_exit(v8);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)(v5 + 12) = self->_UID;
    *(_DWORD *)(v5 + 16) = self->_primaryGID;
    v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;

    v9 = -[NSURL copyWithZone:](self->_homeDirectoryURL, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v9;

    *(_BYTE *)(v6 + 8) = self->_root;
    *(_BYTE *)(v6 + 9) = self->_roleUser;
    *(_BYTE *)(v6 + 10) = self->_useableHomeDirectory;
  }
  return (id)v6;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (BOOL)isRoleUser
{
  return self->_roleUser;
}

- (BOOL)isEqual:(id)a3
{
  MCMPOSIXUser *v4;
  BOOL v5;

  v4 = (MCMPOSIXUser *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMPOSIXUser isEqualToPOSIXUser:](self, "isEqualToPOSIXUser:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPOSIXUser:(id)a3
{
  return self->_UID == *((_DWORD *)a3 + 3);
}

id __27__MCMPOSIXUser_description__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend(*(id *)(a1 + 32), "UID");
  v6 = objc_msgSend(*(id *)(a1 + 32), "primaryGID");
  v7 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v7, "homeDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRedactingHomeContent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%u|%u|%@|%@)"), v5, v6, CFSTR("~~"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(%u|%u|%@|%@)"), v5, v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__MCMPOSIXUser_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

+ (id)_posixUserWithPasswdPtr:(passwd *)a3
{
  void *v5;
  char *pw_dir;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[1025];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  bzero(v27, 0x401uLL);
  if (!a3)
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v23) = 0;
      _os_log_fault_impl(&dword_1CF807000, v14, OS_LOG_TYPE_FAULT, "NULL passwd", (uint8_t *)&v23, 2u);
    }

    v5 = 0;
    v7 = 0;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->pw_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pw_dir = a3->pw_dir;
  if (pw_dir)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", pw_dir, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:", a3->pw_dir);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByRedactingHomeContent:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!container_realpath())
    {
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByRedactingHomeContent:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v9;
        v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "container_realpath([%{public}@]) → [%{public}@]", (uint8_t *)&v23, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v27, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v10 = *__error();
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 2)
    {
      if (v12)
      {
        v23 = 138543362;
        v24 = v9;
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "User home directory at [%{public}@] does not exist", (uint8_t *)&v23, 0xCu);
      }

      v13 = 0;
LABEL_15:
      v15 = objc_msgSend(a1, "_isRoleUserWithUID:homeDirectoryURL:", a3->pw_uid, v7);

      goto LABEL_16;
    }
    if (v12)
    {
      v22 = *__error();
      v23 = 138543618;
      v24 = v9;
      v25 = 1026;
      LODWORD(v26) = v22;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "container_realpath([%{public}@]) failed: %{public, darwin.errno}d", (uint8_t *)&v23, 0x12u);
    }

LABEL_20:
    v13 = 0;
    v19 = 0;
    goto LABEL_21;
  }
  v7 = 0;
  v13 = 0;
  v15 = 1;
LABEL_16:
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUID:primaryGID:homeDirectoryURL:unvalidatedHomeDirectoryURL:name:roleUser:", a3->pw_uid, a3->pw_gid, v13, v7, v5, v15);
LABEL_21:
  v20 = v19;

  return v20;
}

id __33__MCMPOSIXUser_posixUserWithUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_posixUserWithUID:name:useUID:", a2, &stru_1E8CB6A50, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    container_log_handle_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "fullDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1CF807000, v3, OS_LOG_TYPE_DEFAULT, "Created new POSIX user: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  return v2;
}

id __31__MCMPOSIXUser_fullDescription__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v7, "UID");
  v9 = objc_msgSend(*(id *)(a1 + 32), "primaryGID");
  v10 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v10, "homeDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByRedactingHomeContent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>"),
      v6,
      v7,
      v8,
      v9,
      CFSTR("~~"),
      v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeDirectoryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>"),
      v6,
      v7,
      v8,
      v9,
      v11,
      v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (MCMPOSIXUser)initWithUID:(unsigned int)a3 primaryGID:(unsigned int)a4 homeDirectoryURL:(id)a5 unvalidatedHomeDirectoryURL:(id)a6 name:(id)a7 roleUser:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  MCMPOSIXUser *v18;
  MCMPOSIXUser *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MCMPOSIXUser;
  v18 = -[MCMPOSIXUser init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_UID = a3;
    v18->_primaryGID = a4;
    objc_storeStrong((id *)&v18->_homeDirectoryURL, a5);
    objc_storeStrong((id *)&v19->_unvalidatedHomeDirectoryURL, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    v19->_root = a3 == 0;
    v19->_roleUser = a8;
    if (v16)
    {
      objc_msgSend(v16, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "hasPrefix:", CFSTR("/var/empty")) & 1) != 0)
      {
        v19->_useableHomeDirectory = 0;
      }
      else
      {
        objc_msgSend(v16, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "hasPrefix:", CFSTR("/private/var/empty")) & 1) != 0)
        {
          v19->_useableHomeDirectory = 0;
        }
        else
        {
          objc_msgSend(v16, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v19->_useableHomeDirectory = objc_msgSend(v22, "hasPrefix:", CFSTR("/System/Volumes/Data/private/var/empty")) ^ 1;

        }
      }

    }
    else
    {
      v19->_useableHomeDirectory = 0;
    }
  }

  return v19;
}

- (id)fullDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MCMPOSIXUser_fullDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

+ (id)_posixUserWithUID:(unsigned int)a3 name:(id)a4 useUID:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  size_t v9;
  size_t v10;
  char *v11;
  int v12;
  NSObject *v13;
  void *v14;
  passwd *v16;
  passwd v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = sysconf(71);
  if (v9)
  {
    v10 = v9;
    v11 = (char *)malloc_type_calloc(1uLL, v9, 0x4D0EC876uLL);
    memset(&v17, 0, sizeof(v17));
    v16 = 0;
    if (v5)
      v12 = getpwuid_r(a3, &v17, v11, v10, &v16);
    else
      v12 = getpwnam_r((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), &v17, v11, v10, &v16);
    v14 = 0;
    if (!v12 && v16)
    {
      objc_msgSend(a1, "_posixUserWithPasswdPtr:", &v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    free(v11);
  }
  else
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17.pw_name) = 0;
      _os_log_fault_impl(&dword_1CF807000, v13, OS_LOG_TYPE_FAULT, "Could not get _SC_GETPW_R_SIZE_MAX sysconf.", (uint8_t *)&v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

+ (BOOL)_isRoleUserWithUID:(unsigned int)a3 homeDirectoryURL:(id)a4
{
  return a3 < 0x1F5;
}

- (unint64_t)hash
{
  return self->_UID;
}

- (NSURL)unvalidatedHomeDirectoryURL
{
  return self->_unvalidatedHomeDirectoryURL;
}

- (BOOL)isRoot
{
  return self->_root;
}

- (BOOL)hasUseableHomeDirectory
{
  return self->_useableHomeDirectory;
}

+ (id)currentPOSIXUser
{
  return (id)objc_msgSend(a1, "posixUserWithUID:", geteuid());
}

+ (MCMPOSIXUser)posixUserWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_posixUserWithUID:name:useUID:", 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "Could not generate posix user details for user=%{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  return (MCMPOSIXUser *)v5;
}

+ (id)nobody
{
  return (id)objc_msgSend(a1, "posixUserWithUID:", 4294967294);
}

+ (id)root
{
  return (id)objc_msgSend(a1, "posixUserWithUID:", 0);
}

+ (void)flush
{
  id v2;

  v2 = (id)objc_msgSend(a1, "_getCachedUID:flush:onCacheMiss:", 0, 1, 0);
}

void __48__MCMPOSIXUser__getCachedUID_flush_onCacheMiss___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getCachedUID_flush_onCacheMiss__cache;
  _getCachedUID_flush_onCacheMiss__cache = v0;

}

@end
