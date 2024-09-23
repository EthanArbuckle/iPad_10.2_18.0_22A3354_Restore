@implementation FPDVolume

- (BOOL)isDefaultVolume
{
  void *v3;
  NSObject *v4;

  if (self->_role - 1 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Invalid role for %@ - use an FPDExternalVolume instance instead"), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDVolume isDefaultVolume]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 576, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  }
  return 1;
}

- (unsigned)role
{
  return self->_role;
}

- (NSURL)systemDirectory
{
  return self->_systemDirectory;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t role;
  const __CFString *v7;
  uint64_t dev;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  role = (int)self->_role;
  if (role > 3)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E8C76318[role];
  dev = self->_dev;
  -[NSUUID fp_UUID](self->_uuid, "fp_UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_prettyPath](self->_root, "fp_prettyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p role:%@ dev:%d uuid:%@ '%@'>"), v5, self, v7, dev, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (FPDVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5
{
  uint64_t role;
  id v8;
  FPDVolume *v9;
  FPDVolume *v10;
  uint64_t v11;
  NSString *root;
  void *v13;
  uint64_t v14;
  NSUUID *uuid;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *serialQueue;
  objc_super v24;

  role = *(_QWORD *)&a4;
  v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FPDVolume;
  v9 = -[FPDVolume init](&v24, sel_init);
  if (v9)
  {
    v10 = 0;
    if (FPVolumeFPFSSupported())
    {
      v9->_dev = a3->f_fsid.val[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3->f_mntonname);
      v11 = objc_claimAutoreleasedReturnValue();
      root = v9->_root;
      v9->_root = (NSString *)v11;

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9->_root, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fp_volumeUUID");
      v14 = objc_claimAutoreleasedReturnValue();
      uuid = v9->_uuid;
      v9->_uuid = (NSUUID *)v14;

      objc_storeWeak((id *)&v9->_volumeManager, v8);
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[NSString fp_prettyPath](v9->_root, "fp_prettyPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("serial queue for %@"), v17);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = (const char *)objc_msgSend(v18, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_queue_create(v19, v20);
      serialQueue = v9->_serialQueue;
      v9->_serialQueue = (OS_dispatch_queue *)v21;

      v9->_role = role;
      v10 = 0;
      switch((int)role)
      {
        case 0:
          break;
        case 1:
          role = 1;
          v9->_isLibraryConfigured = 1;
          goto LABEL_7;
        case 2:
          v9->_isLibraryConfigured = 1;
          role = 2;
          goto LABEL_7;
        case 3:
          v9->_isLibraryConfigured = -[FPDVolume _hasCloudStorageDirAtRoot](v9, "_hasCloudStorageDirAtRoot");
          role = v9->_role;
          goto LABEL_7;
        default:
LABEL_7:
          if (-[FPDVolume _computeKnownPathsForRole:](v9, "_computeKnownPathsForRole:", role))
            goto LABEL_8;
          v10 = 0;
          break;
      }
    }
  }
  else
  {
LABEL_8:
    v10 = v9;
  }

  return v10;
}

+ (unsigned)volumeRoleForStatFS:(const statfs *)a3
{
  NSObject *v3;

  if (!APFSVolumeRole())
    return 3;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[FPDVolume volumeRoleForStatFS:].cold.1();

  return 0;
}

- (BOOL)_hasCloudStorageDirAtRoot
{
  id v2;
  BOOL v3;

  -[NSString stringByAppendingPathComponent:](self->_root, "stringByAppendingPathComponent:", CFSTR(".CloudStorage"));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = faccessat(-2, (const char *)objc_msgSend(v2, "fileSystemRepresentation"), 0, 32) == 0;

  return v3;
}

- (BOOL)_computeKnownPathsForRole:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *systemDirectory;
  void *v15;
  void *v16;
  NSURL *v17;
  NSURL *syncRootsDirectory;
  NSObject *v20;

  if (a3 - 1 > 1)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    -[NSString stringByAppendingPathComponent:](self->_root, "stringByAppendingPathComponent:", CFSTR(".CloudStorage/System"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    systemDirectory = self->_systemDirectory;
    self->_systemDirectory = v13;

    v15 = (void *)MEMORY[0x1E0C99E98];
    -[NSString stringByAppendingPathComponent:](self->_root, "stringByAppendingPathComponent:", CFSTR(".CloudStorage/Data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v16, 1);
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    syncRootsDirectory = self->_syncRootsDirectory;
    self->_syncRootsDirectory = v17;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 2 * (a3 == 2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userPersonaUniqueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      || (objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isSharedIPad"),
          v7,
          (v8 & 1) != 0))
    {
      v9 = v6;
      FPPerformWithPersona();

      return 1;
    }
    else
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[FPDVolume _computeKnownPathsForRole:].cold.1(a3, v20);

      return 0;
    }
  }
  return v10;
}

void __39__FPDVolume__computeKnownPathsForRole___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ Failed adopting %@ (%d): %@"), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDVolume _computeKnownPathsForRole:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 153, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_supportDirectory");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fp_cloudStorageDirectory");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v7;

}

- (id)rootURLForLocation:(unsigned int)a3 error:(id *)a4
{
  id v5;

  if (a3 > 2)
  {
    v5 = 0;
    if (!a4)
      return v5;
  }
  else
  {
    v5 = *(id *)((char *)&self->super.isa + qword_1CF627D20[a3]);
    if (!a4)
      return v5;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (int)_getProviderDomainIDFromFD:(int)a3 shortDescription:(id)a4 location:(unsigned int)a5 domainID:(id *)a6 error:(id *)a7
{
  id v11;
  const char *v12;
  ssize_t v13;
  ssize_t v14;
  size_t v15;
  BOOL v16;
  int v17;
  _BYTE *v18;
  _BYTE *v19;
  NSObject *v20;
  ssize_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = "com.apple.file-provider-domain-id";
  v13 = fgetxattr(a3, "com.apple.file-provider-domain-id", 0, 0, 0, 0);
  v14 = v13;
  if (v13 != -1)
  {
    v15 = v13;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (*__error() != 93
    || (v12 = "com.apple.file-provider-domain-id#PN",
        v21 = fgetxattr(a3, "com.apple.file-provider-domain-id#PN", 0, 0, 0, 0),
        v21 == -1))
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *__error();
    v24 = v22;
LABEL_17:
    objc_msgSend(v24, "fp_errorWithPOSIXCode:", v23, *(_QWORD *)v28);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    v17 = -1;
    goto LABEL_26;
  }
  v15 = v21;
  if (a5)
  {
LABEL_3:
    v28[0] = 0;
    fpfs_is_detached_root();
    v16 = a5 == 2;
    v17 = -1;
    if (v16)
      goto LABEL_26;
  }
LABEL_4:
  v18 = malloc_type_malloc(v15 + 1, 0xBF9A4A49uLL);
  if (!v18)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v23 = 12;
    goto LABEL_17;
  }
  v19 = v18;
  if (fgetxattr(a3, v12, v18, v15, 0, 0) < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_errorWithPOSIXCode:", *__error());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    a6 = a7;
    goto LABEL_23;
  }
  v19[v15] = 0;
  if (v14 == -1)
  {
    if (fsetxattr(a3, "com.apple.file-provider-domain-id", v19, v15, 0, 0) < 0)
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_20:
        v26 = *__error();
        *(_DWORD *)v28 = 138412546;
        *(_QWORD *)&v28[4] = v11;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v26;
        _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_INFO, "[INFO] couldn't upgrade domain xattr on %@: %d", v28, 0x12u);
      }
LABEL_21:

      goto LABEL_22;
    }
    if (fremovexattr(a3, "com.apple.file-provider-domain-id#PN", 0) < 0)
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      goto LABEL_21;
    }
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19, *(_OWORD *)v28, *(_QWORD *)&v28[16], v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  *a6 = v25;
  free(v19);
  if (*a7)
    v17 = -1;
  else
    v17 = 0;
LABEL_26:

  return v17;
}

+ (BOOL)getProviderDomainID:(id)a3 location:(unsigned int)a4 foundDomainID:(id *)a5 error:(id *)a6
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id *v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v8 = objc_retainAutorelease(a3);
  objc_msgSend(v8, "fileSystemRepresentation");
  v9 = v8;
  if ((fpfs_openat() & 0x80000000) != 0 && v17[5])
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "fp_shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17[5], "fp_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_INFO, "[INFO] couldn't retrieve provider domainID from %@: %@", buf, 0x16u);

    }
    if ((objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 2) & 1) != 0
      || (objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 20) & 1) != 0
      || (objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 13) & 1) != 0
      || objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 93))
    {
      v14 = (id *)(v23 + 5);
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (!a6)
        goto LABEL_12;
      v14 = (id *)(v17 + 5);
      a5 = a6;
    }
    *a5 = objc_retainAutorelease(*v14);
LABEL_12:

    goto LABEL_13;
  }

  *a5 = objc_retainAutorelease((id)v23[5]);
  v10 = 1;
LABEL_13:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

uint64_t __62__FPDVolume_getProviderDomainID_location_foundDomainID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id obj;

  v4 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  v8 = *(unsigned int *)(a1 + 64);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(id *)(v9 + 40);
  obj = v7;
  v10 = objc_msgSend(v4, "_getProviderDomainIDFromFD:shortDescription:location:domainID:error:", a2, v5, v8, &obj, &v12);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v9 + 40), v12);

  return v10;
}

- (id)_findDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  char v22;
  void *v23;
  id obj;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[FPDVolume rootURLForLocation:error:](self, "rootURLForLocation:error:", v6, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v10, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;

  if (v11)
  {
    v23 = v11;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v18 = +[FPDVolume getProviderDomainID:location:foundDomainID:error:](FPDVolume, "getProviderDomainID:location:foundDomainID:error:", v17, v6, &v26, a5);
          v19 = v26;
          v20 = v19;
          if (v18 && (objc_msgSend(v19, "isEqualToString:", v25) & 1) != 0)
          {

            goto LABEL_15;
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v14)
          continue;
        break;
      }
    }

    v17 = 0;
LABEL_15:
    v11 = v23;
  }
  else if ((objc_msgSend(v12, "fp_isCocoaErrorCode:", 4) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    v22 = objc_msgSend(v12, "fp_isCocoaErrorCode:", 260);
    v17 = 0;
    if (a5 && (v22 & 1) == 0)
    {
      v17 = 0;
      *a5 = objc_retainAutorelease(v12);
    }
  }

  return v17;
}

+ (id)prettyNameForDomain:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  NSObject *v17;

  v3 = a3;
  objc_msgSend(v3, "nsDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ no provider for %@"), v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

      __assert_rtn("+[FPDVolume prettyNameForDomain:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 318, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
    }
    objc_msgSend(v3, "nsDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", &stru_1E8C795D8))
    {
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v10, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;

    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8C795D8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)findProviderDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDVolume _findDomainDirectory:location:error:](self, "_findDomainDirectory:location:error:", v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    -[FPDVolume rootURLForLocation:error:](self, "rootURLForLocation:error:", v6, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerDomainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDVolume _findDomainDirectory:location:error:](self, "_findDomainDirectory:location:error:", v13, (_DWORD)v6 == 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v15, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v16, 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (id)supportPathForDomain:(id)a3 failIfNotExisting:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0CB3620];
  v9 = a3;
  objc_msgSend(v8, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDVolume findProviderDomainDirectory:location:error:](self, "findProviderDomainDirectory:location:error:", v9, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "path"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "fileExistsAtPath:", v13),
        v13,
        v12,
        !v14))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = v11;
  }

  return v15;
}

- (id)_subAppSupportPathForDomain:(id)a3 fileName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  -[FPDVolume supportPathForDomain:failIfNotExisting:error:](self, "supportPathForDomain:failIfNotExisting:error:", a3, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)stateDirectoryURL:(id)a3 error:(id *)a4
{
  return -[FPDVolume _subAppSupportPathForDomain:fileName:error:](self, "_subAppSupportPathForDomain:fileName:error:", a3, CFSTR("state"), a4);
}

- (id)temporaryDirectoryURL:(id)a3 error:(id *)a4
{
  return -[FPDVolume _subAppSupportPathForDomain:fileName:error:](self, "_subAppSupportPathForDomain:fileName:error:", a3, CFSTR("tmp"), a4);
}

- (NSURL)purgatoryDirectory
{
  void *v2;
  void *v3;

  -[FPDVolume systemDirectory](self, "systemDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Purgatory"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)removedURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDVolume purgatoryDirectory](self, "purgatoryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_createPathIfNeeded:", v5);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("removed_domain_"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDVolume purgatoryDirectory](self, "purgatoryDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSURL)rootURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_root, 1);
}

- (BOOL)isDefaultVolumeForCurrentPersona
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPersona");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEnterprisePersona"))
    v5 = 2;
  else
    v5 = 1;
  v6 = self->_role == v5;

  return v6;
}

- (int64_t)requiredDiskSpaceThreshold
{
  NSNumber *requiredDiskSpaceThresholdOverride;
  void *v4;
  void *v5;
  int64_t v6;

  requiredDiskSpaceThresholdOverride = self->_requiredDiskSpaceThresholdOverride;
  if (requiredDiskSpaceThresholdOverride)
    return -[NSNumber longLongValue](requiredDiskSpaceThresholdOverride, "longLongValue");
  if (os_variant_has_internal_content())
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
    objc_msgSend(v4, "objectForKey:", CFSTR("low-disk-threshold"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v4, "integerForKey:", CFSTR("low-disk-threshold"));

      return v6;
    }

  }
  return 104857600;
}

- (void)monitorLowDiskSpaceRecoveryForConcreteError:(id)a3
{
  id v4;
  int64_t v5;
  NSNumber *v6;
  NSNumber *requiredDiskSpaceThresholdOverride;
  NSObject *v8;
  FPDVolume *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  v5 = -[FPDVolume currentAvailableDiskSpace](self, "currentAvailableDiskSpace");
  if (v5 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[diskspace] low disk space detected through error, setting up fallback could not determine available disk space. Exiting."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDVolume monitorLowDiskSpaceRecoveryForConcreteError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 501, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5 + 209715200);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  requiredDiskSpaceThresholdOverride = self->_requiredDiskSpaceThresholdOverride;
  self->_requiredDiskSpaceThresholdOverride = v6;

  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[FPDVolume monitorLowDiskSpaceRecoveryForConcreteError:].cold.3((uint64_t)v4, (id *)&self->_requiredDiskSpaceThresholdOverride, v8);

  -[FPDVolume monitorLowDiskSpaceRecovery](self, "monitorLowDiskSpaceRecovery");
  v9 = self;
  objc_sync_enter(v9);
  if (!v9->_diskSpaceRecoveryTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[diskspace] low disk space detected through an error, setting up fallback failed. Exiting."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDVolume monitorLowDiskSpaceRecoveryForConcreteError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 510, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  objc_sync_exit(v9);

}

- (int64_t)currentAvailableDiskSpace
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[272];

  v11[271] = *MEMORY[0x1E0C80C00];
  bzero(v11, 0x878uLL);
  if ((FPStatFSFromPath() & 0x80000000) == 0)
    return FPFileSystemFreeBytes();
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FPDVolume currentAvailableDiskSpace].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return -1;
}

- (BOOL)isInLowDiskSpaceState
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[FPDVolume currentAvailableDiskSpace](self, "currentAvailableDiskSpace");
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[FPDVolume isInLowDiskSpaceState].cold.3((uint64_t)self, v3, v4);

  if (v3 < 0)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FPDVolume isInLowDiskSpaceState].cold.1((uint64_t)self, v5);
  }
  else
  {
    if (v3 < -[FPDVolume requiredDiskSpaceThreshold](self, "requiredDiskSpaceThreshold"))
    {
      fp_current_or_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[NSString fp_prettyPath](self->_root, "fp_prettyPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v7;
        v19 = 2048;
        v20 = v3;
        _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] [diskspace] (%@) In low disk space: %lld bytes", (uint8_t *)&v17, 0x16u);

      }
      goto LABEL_10;
    }
    if (!os_variant_has_internal_content())
      return 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.fileproviderd"));
    if (!-[NSObject BOOLForKey:](v5, "BOOLForKey:", CFSTR("force-low-disk-state")))
    {
      v6 = 0;
      goto LABEL_10;
    }
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FPDVolume isInLowDiskSpaceState].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

  }
  v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)monitorLowDiskSpaceRecovery
{
  FPDVolume *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  dispatch_block_t v8;
  OS_dispatch_source *diskSpaceRecoveryTimer;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[FPDVolume isInLowDiskSpaceState](v2, "isInLowDiskSpaceState");
  if (v3 && !v2->_diskSpaceRecoveryTimer)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Setting up to monitor low disk space recovery.", buf, 2u);
    }

    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v2->_serialQueue);
    v6 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
    dispatch_set_qos_class_fallback();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__FPDVolume_monitorLowDiskSpaceRecovery__block_invoke;
    block[3] = &unk_1E8C75E48;
    block[4] = v2;
    v7 = v5;
    v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v7, v8);

    dispatch_resume(v7);
    diskSpaceRecoveryTimer = v2->_diskSpaceRecoveryTimer;
    v2->_diskSpaceRecoveryTimer = (OS_dispatch_source *)v7;
    v10 = v7;

  }
  objc_sync_exit(v2);

  return v3;
}

uint64_t __40__FPDVolume_monitorLowDiskSpaceRecovery__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Trying to recover from disconnect due to low disk space.", buf, 2u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "isInLowDiskSpaceState");
  if ((result & 1) == 0)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Disk space now available, restarting fileproviderd", v5, 2u);
    }

    _Exit(0);
  }
  return result;
}

- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Domains.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("Domains.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 1, a5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)removeBrokenEbihilLinksFromRoot
{
  OUTLINED_FUNCTION_19(&dword_1CF55F000, a1, a3, "[CRIT] %s shouldn't be called on default volumes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8_0();
}

- (int)dev
{
  return self->_dev;
}

- (NSString)root
{
  return self->_root;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isLibraryConfigured
{
  return self->_isLibraryConfigured;
}

- (FPDVolumeManager)volumeManager
{
  return (FPDVolumeManager *)objc_loadWeakRetained((id *)&self->_volumeManager);
}

- (NSURL)syncRootsDirectory
{
  return self->_syncRootsDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncRootsDirectory, 0);
  objc_storeStrong((id *)&self->_systemDirectory, 0);
  objc_destroyWeak((id *)&self->_volumeManager);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_requiredDiskSpaceThresholdOverride, 0);
  objc_storeStrong((id *)&self->_diskSpaceRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

+ (void)volumeRoleForStatFS:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1CF55F000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Unable to resolve role for volume %{public}s: %u", v2, 0x12u);
  OUTLINED_FUNCTION_8_0();
}

- (void)_computeKnownPathsForRole:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed gathering persona for role: %d - failing volume init", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5();
}

- (void)monitorLowDiskSpaceRecoveryForConcreteError:(NSObject *)a3 .cold.3(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "longLongValue");
  v6 = 138412546;
  v7 = a1;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] [diskspace] low disk space detected through an error %@. Monitoring with incremented recovery amount %lld", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)currentAvailableDiskSpace
{
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, a1, a3, "[ERROR] [diskspace] failed to get disk space: error doing statfs.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)isInLowDiskSpaceState
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "fp_prettyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v7 = 2048;
  v8 = a2;
  _os_log_debug_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] [diskspace] (%@) Available disk space is: %lld bytes", v6, 0x16u);

}

@end
