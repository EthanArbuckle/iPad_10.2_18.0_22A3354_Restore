@implementation NSData(MobileInstallationAdditions)

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:error:
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:", a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
}

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:error:
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:", a3, a4, a5, a6, a7, 0, a8);
}

- (uint64_t)MI_writeAtomicallyToURL:()MobileInstallationAdditions withMode:owner:group:protectionClass:withBarrier:error:
{
  _QWORD *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  const std::__fs::filesystem::path *v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  const void *v46;
  uint64_t v47;
  ssize_t v48;
  uint64_t v49;
  int *v50;
  int v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const std::__fs::filesystem::path *v56;
  std::error_code *v57;
  int v58;
  int v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v64;
  id v65;
  id v66;

  v14 = a9;
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v16, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v15, 1, &v66);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v66;

  if (!v17)
  {
    v29 = 0;
    v30 = 0;
    if (!a9)
      goto LABEL_24;
    goto LABEL_22;
  }
  v65 = v15;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = objc_retainAutorelease(v21);
  v22 = (const char *)objc_msgSend(v64, "fileSystemRepresentation");
  v23 = (const std::__fs::filesystem::path *)v22;
  if (a7 == -1)
  {
    v24 = open(v22, 2818, a4);
    if (v24 < 0)
    {
      v40 = *__error();
      v41 = (void *)*MEMORY[0x1E0CB2FE0];
      v42 = v40;
      strerror(v40);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 67, v41, v42, 0, 0, CFSTR("open failed for %s : %s"), v43, (uint64_t)v23);
      goto LABEL_14;
    }
  }
  else
  {
    v24 = open_dprotected_np(v22, 2818, a7, 0, a4);
    if (v24 < 0)
    {
      v25 = *__error();
      v26 = (void *)*MEMORY[0x1E0CB2FE0];
      v27 = v25;
      strerror(v25);
      _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 56, v26, v27, 0, 0, CFSTR("open_dprotected_np failed for %s for class %d : %s"), v28, (uint64_t)v23);
LABEL_14:
      v39 = objc_claimAutoreleasedReturnValue();
      v14 = a9;
      goto LABEL_15;
    }
  }
  v14 = a9;
  if (fchmod(v24, a4))
  {
    v31 = *__error();
    v32 = (void *)*MEMORY[0x1E0CB2FE0];
    v33 = v31;
    strerror(v31);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 75, v32, v33, 0, 0, CFSTR("Failed to set mode to 0%o for %s : %s"), v34, a4);
LABEL_12:
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v30 = v64;
    goto LABEL_16;
  }
  if (fchown(v24, a5, a6))
  {
    v35 = *__error();
    v36 = (void *)*MEMORY[0x1E0CB2FE0];
    v37 = v35;
    strerror(v35);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 82, v36, v37, 0, 0, CFSTR("Failed to set owner for %s : %s"), v38, (uint64_t)v23);
    goto LABEL_12;
  }
  v45 = objc_retainAutorelease(a1);
  v46 = (const void *)objc_msgSend(v45, "bytes");
  v47 = objc_msgSend(v45, "length");
  v48 = write(v24, v46, v47);
  if (v48 < 0)
  {
    v51 = *__error();
    v52 = (void *)*MEMORY[0x1E0CB2FE0];
    v53 = v51;
    strerror(v51);
    v54 = v53;
    v14 = a9;
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 92, v52, v54, 0, 0, CFSTR("Failed to write %lu bytes to %s : %s"), v55, v47);
    goto LABEL_12;
  }
  if (v48 != v47)
  {
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 96, (void *)*MEMORY[0x1E0CB2FE0], 5, 0, 0, CFSTR("write() returned %zd but we expected %lu when writing to %s"), v49, v48);
    goto LABEL_12;
  }
  if (a8)
  {
    v30 = v64;
    if (!fcntl(v24, 85))
      goto LABEL_38;
    v50 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3)
        goto LABEL_38;
    }
  }
  else
  {
    v30 = v64;
    if (!fsync(v24))
      goto LABEL_38;
    v50 = __error();
    if (gLogHandle)
    {
      if (*(int *)(gLogHandle + 44) < 3)
        goto LABEL_38;
    }
  }
  strerror(*v50);
  MOLogWrite();
LABEL_38:
  close(v24);
  v56 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v65), "fileSystemRepresentation");
  rename(v23, v56, v57);
  if (!v58)
  {
    v29 = 1;
    v24 = -1;
    goto LABEL_19;
  }
  v59 = *__error();
  v60 = (void *)*MEMORY[0x1E0CB2FE0];
  v61 = v59;
  strerror(v59);
  _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:]", 126, v60, v61, 0, 0, CFSTR("Failed to rename %s to %s : %s"), v62, (uint64_t)v23);
  v39 = objc_claimAutoreleasedReturnValue();
  v24 = -1;
LABEL_16:

  if (v23)
    unlink((const char *)v23);
  v29 = 0;
  v18 = (id)v39;
LABEL_19:
  unlink((const char *)objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation"));
  if ((v24 & 0x80000000) == 0)
    close(v24);
  v15 = v65;
  if (v14)
  {
LABEL_22:
    if ((v29 & 1) == 0)
      *v14 = objc_retainAutorelease(v18);
  }
LABEL_24:

  return v29;
}

- (uint64_t)MI_writeAtomicallyToURLMatchingCurrentFileMetadata:()MobileInstallationAdditions error:
{
  id v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  stat v28;

  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  memset(&v28, 0, sizeof(v28));
  v8 = open(v7, 256);
  if (v8 < 0)
  {
    v15 = *__error();
    v16 = (void *)*MEMORY[0x1E0CB2FE0];
    v17 = v15;
    strerror(v15);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 166, v16, v17, 0, 0, CFSTR("open failed for %s : %s"), v18, (uint64_t)v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v19 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v9 = v8;
  if (fstat(v8, &v28))
  {
    v10 = *__error();
    v11 = (void *)*MEMORY[0x1E0CB2FE0];
    v12 = v10;
    strerror(v10);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 172, v11, v12, 0, 0, CFSTR("fstat failed for %s : %s"), v13, (uint64_t)v7);
LABEL_4:
    v14 = (id)objc_claimAutoreleasedReturnValue();
    close(v9);
    goto LABEL_6;
  }
  v21 = fcntl(v9, 63);
  if ((v21 & 0x80000000) != 0)
  {
    v23 = *__error();
    v24 = (void *)*MEMORY[0x1E0CB2FE0];
    v25 = *__error();
    strerror(v23);
    _CreateError((uint64_t)"-[NSData(MobileInstallationAdditions) MI_writeAtomicallyToURLMatchingCurrentFileMetadata:error:]", 180, v24, v25, 0, 0, CFSTR("Failed to getclass of file %s: %s"), v26, (uint64_t)v7);
    goto LABEL_4;
  }
  v22 = v21;
  close(v9);
  v27 = 0;
  v19 = objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:error:", v6, v28.st_mode, v28.st_uid, v28.st_gid, v22, &v27);
  v14 = v27;
  if (!a4)
    goto LABEL_9;
LABEL_7:
  if ((v19 & 1) == 0)
    *a4 = objc_retainAutorelease(v14);
LABEL_9:

  return v19;
}

@end
