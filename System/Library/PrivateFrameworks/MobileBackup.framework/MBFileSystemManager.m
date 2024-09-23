@implementation MBFileSystemManager

+ (BOOL)volumeSupportsLocalSnapshots:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  unsigned int v22;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  uint8_t v28[32];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0);
  if (v4 < 0)
  {
    MBGetDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)v28 = 138412546;
      *(_QWORD *)&v28[4] = v3;
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = v14;
      _os_log_impl(&dword_1D5213000, v13, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d while checking if FS supports snapshot", v28, 0x12u);
      __error();
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to open %@: %{errno}d while checking if FS supports snapshot", v15, v16, v17, v18, v19, v20, (uint64_t)v3);
    }

  }
  else
  {
    v5 = v4;
    v25 = 0;
    v24 = xmmword_1D5259A38;
    v29 = 0;
    memset(v28, 0, sizeof(v28));
    if (!fgetattrlist(v4, &v24, v28, 0x24uLL, 0))
    {
      v22 = *(_DWORD *)&v28[8] & *(_DWORD *)&v28[24];
      close(v5);
      v21 = (v22 >> 17) & 1;
      goto LABEL_11;
    }
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_ERROR, "Couldn't get attr list for filesystem path %@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Couldn't get attr list for filesystem path %@", v7, v8, v9, v10, v11, v12, (uint64_t)v3);
    }

    close(v5);
  }
  LOBYTE(v21) = 0;
LABEL_11:

  return v21;
}

+ (unint64_t)fileSystemCapacity
{
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load(&fileSystemCapacity_sFSCapacity);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v3, "attributesOfFileSystemForPath:error:", CFSTR("/var/mobile"), &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;

    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B10]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v6, "unsignedLongLongValue");

      atomic_store(v2, &fileSystemCapacity_sFSCapacity);
    }
    else
    {
      MBGetDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = CFSTR("/var/mobile");
        v18 = 2112;
        v19 = v5;
        _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_ERROR, "Failed to get filesystem capacity at \"%@\": %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to get filesystem capacity at \"%@\": %@", v8, v9, v10, v11, v12, v13, (uint64_t)CFSTR("/var/mobile"));
      }

      v2 = -1;
    }

  }
  return v2;
}

+ (BOOL)createSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5 cancelationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  double v27;
  double v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v10;
  MBGetDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = v11;
    v48 = 2114;
    v49 = v13;
    _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEFAULT, "Creating filesystem snapshot %{public}@ at %{public}@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Creating filesystem snapshot %{public}@ at %{public}@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v22 = v21;
  v23 = objc_retainAutorelease(v13);
  v24 = open((const char *)objc_msgSend(v23, "fileSystemRepresentation"), 0);
  if ((v24 & 0x80000000) != 0)
  {
    v37 = *__error();
    MBGetDefaultLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v47 = v23;
      v48 = 1024;
      LODWORD(v49) = v37;
      _os_log_impl(&dword_1D5213000, v38, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to open %{public}@: %{errno}d", v39, v40, v41, v42, v43, v44, (uint64_t)v23);
    }

    if (a5)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v37, v23, CFSTR("Failed to open snapshot path"));
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v36 = 0;
    goto LABEL_13;
  }
  v25 = v24;
  v26 = objc_msgSend(a1, "_createSnapshotForVolumeFd:volumeMountPoint:name:error:cancelationHandler:", v24, v23, v11, a5, v12);
  close(v25);
  if (!v26)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v28 = v27;
  MBGetDefaultLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v47 = v11;
    v48 = 2114;
    v49 = v23;
    v50 = 2048;
    v51 = v28 - v22;
    _os_log_impl(&dword_1D5213000, v29, OS_LOG_TYPE_DEFAULT, "Created filesystem snapshot %{public}@ at %{public}@ in %.3fs", buf, 0x20u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Created filesystem snapshot %{public}@ at %{public}@ in %.3fs", v30, v31, v32, v33, v34, v35, (uint64_t)v11);
  }

  v36 = 1;
LABEL_13:

  return v36;
}

+ (BOOL)_createSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  id v9;
  id v10;
  unsigned int (**v11)(_QWORD);
  void *v12;
  int v13;
  void *v14;
  id v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (unsigned int (**)(_QWORD))a7;
  v12 = 0;
  v13 = 0;
  while (1)
  {
    v14 = (void *)MEMORY[0x1D8270CF0]();
    if (v11)
    {
      if (v11[2](v11))
        break;
    }
    v15 = objc_retainAutorelease(v10);
    v16 = fs_snapshot_create(a3, (const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0);
    v17 = v16 == 0;
    if (!v16)
      goto LABEL_12;
    v18 = *__error();
    +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v18, v9, CFSTR("Failed to create snapshot: %d"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    MBGetDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v40 = v10;
      v41 = 2114;
      v42 = v9;
      v43 = 1024;
      v44 = v13;
      v45 = 1024;
      v46 = v18;
      _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_ERROR, "Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d", buf, 0x22u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
    }

    if ((_DWORD)v18 != 36)
    {
      v12 = v19;
LABEL_12:
      v27 = a6;
      goto LABEL_16;
    }
    sleep(0xAu);
    objc_autoreleasePoolPop(v14);
    ++v13;
    v12 = v19;
    if (v13 == 30)
    {
      v17 = 0;
      v27 = a6;
      if (!a6)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  MBGetDefaultLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v27 = a6;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v40 = v10;
    v41 = 2114;
    v42 = v9;
    _os_log_impl(&dword_1D5213000, v28, OS_LOG_TYPE_ERROR, "Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)", v29, v30, v31, v32, v33, v34, (uint64_t)v10);
  }

  +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("Failed to create snapshot"));
  v35 = objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v12 = (void *)v35;
LABEL_16:
  objc_autoreleasePoolPop(v14);
  v19 = v12;
  if (!v27)
    goto LABEL_18;
LABEL_17:
  *v27 = objc_retainAutorelease(v19);
LABEL_18:

  return v17;
}

+ (BOOL)mountSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  char v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
  {
    if (a6)
    {
      +[MBError errorWithCode:description:](MBError, "errorWithCode:description:", 5, CFSTR("No mountpoint specified at which to mount the snapshot"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v16 = 0;
      *a6 = v17;
      goto LABEL_12;
    }
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v13 = objc_retainAutorelease(v10);
  v14 = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0x100000);
  if ((v14 & 0x80000000) != 0)
  {
    v18 = *__error();
    MBGetDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      v29 = 1024;
      v30 = v18;
      _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to open %@: %{errno}d", v20, v21, v22, v23, v24, v25, (uint64_t)v13);
    }

    if (a6)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v18, v13, CFSTR("Unable to open snapshot path"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v15 = v14;
  v16 = objc_msgSend(a1, "_mountSnapshotForVolumeFd:volumeMountPoint:name:mountPoint:error:", v14, v13, v11, v12, a6);
  close(v15);
LABEL_12:

  return v16;
}

+ (id)createAndMountSnapshotForVolume:(id)a3 name:(id)a4 atFirstAvailableMountPoint:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  const char *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  char *v53;
  id v54;
  id v55;
  id v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (!objc_msgSend(v13, "count"))
    +[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:].cold.1();
  v15 = objc_retainAutorelease(v11);
  v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0x100000);
  if ((v16 & 0x80000000) != 0)
  {
    v35 = *__error();
    MBGetDefaultLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v63 = (uint64_t)v15;
      v64 = 1024;
      LODWORD(v65) = v35;
      _os_log_impl(&dword_1D5213000, v36, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to open %@: %{errno}d", v37, v38, v39, v40, v41, v42, (uint64_t)v15);
    }

    if (a6)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v35, v15, CFSTR("Unable to open snapshot path"));
      v34 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    goto LABEL_36;
  }
  v17 = v16;
  if (!objc_msgSend((id)objc_opt_class(), "_createSnapshotForVolumeFd:volumeMountPoint:name:error:cancelationHandler:", v16, v15, v12, a6, v14))
  {
    v34 = 0;
    goto LABEL_34;
  }
  v56 = v14;
  v18 = objc_retainAutorelease(v12);
  v53 = (char *)objc_msgSend(v18, "fileSystemRepresentation");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v13;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (!v19)
    goto LABEL_15;
  v20 = v19;
  v21 = *(_QWORD *)v59;
  v54 = v13;
  v55 = v12;
  v52 = (uint64_t)v18;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v59 != v21)
        objc_enumerationMutation(obj);
      v23 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i));
      v24 = (const char *)objc_msgSend(v23, "fileSystemRepresentation");
      objc_msgSend((id)objc_opt_class(), "volumeMountPointForFile:error:", v23, a6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (!v15)
      {
        v34 = 0;
        v12 = v55;
LABEL_33:
        v14 = v56;

        v13 = v54;
        goto LABEL_34;
      }
      if (!objc_msgSend(v25, "isEqualToString:", v23))
      {
        v12 = v55;
        if (fs_snapshot_mount(v17, v24, v53, 0))
        {
          v43 = *__error();
          MBGetDefaultLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v63 = v52;
            v64 = 2080;
            v65 = v24;
            v66 = 1024;
            v67 = v43;
            _os_log_impl(&dword_1D5213000, v44, OS_LOG_TYPE_ERROR, "Unable to mount snapshot %@ at mount point %s: %{errno}d", buf, 0x1Cu);
            _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d", v45, v46, v47, v48, v49, v50, v52);
          }

          if (a6)
          {
            +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v43, v23, CFSTR("Unable to mount snapshot"));
            v34 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }
        }
        else
        {
          v34 = v23;
        }
        goto LABEL_33;
      }
      MBGetDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = (uint64_t)v26;
        _os_log_impl(&dword_1D5213000, v27, OS_LOG_TYPE_INFO, "Mount point %@ is already in use", buf, 0xCu);
        _MBLog(CFSTR("INFO"), (uint64_t)"Mount point %@ is already in use", v28, v29, v30, v31, v32, v33, (uint64_t)v26);
      }

    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    v13 = v54;
    v12 = v55;
    v18 = (id)v52;
    if (v20)
      continue;
    break;
  }
LABEL_15:

  objc_msgSend((id)objc_opt_class(), "deleteSnapshotForVolume:name:error:", v15, v18, 0);
  if (a6)
  {
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 14, CFSTR("No free mount points for APFS snapshot"));
    v34 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  v14 = v56;
LABEL_34:
  if (v17 >= 1)
    close(v17);
LABEL_36:

  return v34;
}

+ (BOOL)_mountSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 mountPoint:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  char v29[1024];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = objc_retainAutorelease(a6);
  realpath_DARWIN_EXTSN((const char *)objc_msgSend(v11, "fileSystemRepresentation"), v29);
  v12 = objc_retainAutorelease(v10);
  v13 = fs_snapshot_mount(a3, v29, (const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0);
  if (v13)
  {
    v14 = *__error();
    MBGetDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v12;
      v25 = 2080;
      v26 = v29;
      v27 = 1024;
      v28 = v14;
      _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_ERROR, "Unable to mount snapshot %@ at mount point %s: %{errno}d", buf, 0x1Cu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    }

    if (a7)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v14, v11, CFSTR("Unable to mount snapshot"));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13 == 0;
}

+ (BOOL)unmount:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      +[MBError errorWithCode:description:](MBError, "errorWithCode:description:", 5, CFSTR("No mountpoint specified from which to unmount the current snapshot"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_18:
    v25 = 0;
    goto LABEL_19;
  }
  v7 = objc_retainAutorelease(v5);
  if (unmount((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0))
  {
    v8 = *__error();
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((_DWORD)v8 == 22)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "Nothing to unmount at %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Nothing to unmount at %{public}@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
      }

      if (a4)
      {
        +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 4, v7, CFSTR("Nothing to unmount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        v25 = 0;
        *a4 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v34 = v7;
        v35 = 1024;
        v36 = v8;
        _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_ERROR, "unmount failed at %{public}@: %{errno}d", buf, 0x12u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"unmount failed at %{public}@: %{errno}d", v26, v27, v28, v29, v30, v31, (uint64_t)v7);
      }

      if (a4)
      {
        +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v8, v7, CFSTR("Unable to unmount snapshot"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    goto LABEL_18;
  }
  MBGetDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v7;
    _os_log_impl(&dword_1D5213000, v18, OS_LOG_TYPE_DEFAULT, "Unmounted snapshot at %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Unmounted snapshot at %{public}@", v19, v20, v21, v22, v23, v24, (uint64_t)v7);
  }

  v25 = 1;
LABEL_19:

  return v25;
}

+ (BOOL)deleteSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0);
  if (v10 < 0)
  {
    v23 = *__error();
    MBGetDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v47 = v9;
      v48 = 1024;
      LODWORD(v49) = v23;
      _os_log_impl(&dword_1D5213000, v24, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to open %{public}@: %{errno}d", v25, v26, v27, v28, v29, v30, (uint64_t)v9);
    }

    +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v23, v9, CFSTR("Unable to open snapshot path"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      goto LABEL_19;
  }
  else
  {
    v11 = v10;
    v12 = objc_retainAutorelease(v8);
    if (fs_snapshot_delete(v11, (const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0))
    {
      v13 = *__error();
      MBGetDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((_DWORD)v13 == 2)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v47 = v12;
          v48 = 2114;
          v49 = v9;
          _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ not found at %{public}@", buf, 0x16u);
          _MBLog(CFSTR("DEFAULT"), (uint64_t)"Snapshot %{public}@ not found at %{public}@", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
        }

        +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 4, v9, CFSTR("Snapshot not found"));
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v47 = v12;
          v48 = 2114;
          v49 = v9;
          v50 = 1024;
          v51 = v13;
          _os_log_impl(&dword_1D5213000, v15, OS_LOG_TYPE_ERROR, "Failed to delete snapshot %{public}@ at %{public}@: %{errno}d", buf, 0x1Cu);
          _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to delete snapshot %{public}@ at %{public}@: %{errno}d", v39, v40, v41, v42, v43, v44, (uint64_t)v12);
        }

        +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v13, v9, CFSTR("Unable to delete snapshot"));
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v31 = (void *)v22;
    }
    else
    {
      MBGetDefaultLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = v12;
        v48 = 2114;
        v49 = v9;
        _os_log_impl(&dword_1D5213000, v32, OS_LOG_TYPE_DEFAULT, "Deleted snapshot %{public}@ at %{public}@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"Deleted snapshot %{public}@ at %{public}@", v33, v34, v35, v36, v37, v38, (uint64_t)v12);
      }

      v31 = 0;
    }
    close(v11);
    if (a5)
    {
LABEL_19:
      if (v31)
        *a5 = objc_retainAutorelease(v31);
    }
  }

  return v31 == 0;
}

+ (BOOL)renameSnapshotForVolume:(id)a3 name:(id)a4 newName:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  int v14;
  id v15;
  const char *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_retainAutorelease(v9);
  v13 = open((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0x100000);
  if (v13 < 0)
  {
    v27 = *__error();
    MBGetDefaultLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      v39 = 1024;
      LODWORD(v40) = v27;
      _os_log_impl(&dword_1D5213000, v28, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to open %@: %{errno}d", v29, v30, v31, v32, v33, v34, (uint64_t)v12);
    }

    if (a6)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v27, v12, CFSTR("Unable to open snapshot path"));
      v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v14 = v13;
    v15 = objc_retainAutorelease(v10);
    v16 = (const char *)objc_msgSend(v15, "fileSystemRepresentation");
    v17 = objc_retainAutorelease(v11);
    if (fs_snapshot_rename(v14, v16, (const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0))
    {
      v18 = *__error();
      MBGetDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v38 = v15;
        v39 = 2112;
        v40 = v17;
        v41 = 1024;
        v42 = v18;
        _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_ERROR, "Unable to rename snapshot: %@ -> %@: %{errno}d", buf, 0x1Cu);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Unable to rename snapshot: %@ -> %@: %{errno}d", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      }

      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v18, v12, CFSTR("Unable to rename snapshot"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    close(v14);
    v35 = v26 == 0;
    if (a6 && v26)
      *a6 = objc_retainAutorelease(v26);

  }
  return v35;
}

+ (BOOL)unmountAndDeleteSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16 = 0;
  v12 = objc_msgSend((id)objc_opt_class(), "unmount:error:", v11, &v16);

  v13 = v16;
  if ((v12 & 1) != 0)
    goto LABEL_4;
  if (+[MBError isError:withCode:](MBError, "isError:withCode:", v13, 4))
  {

    v13 = 0;
LABEL_4:
    v14 = objc_msgSend((id)objc_opt_class(), "deleteSnapshotForVolume:name:error:", v9, v10, a6);
    goto LABEL_5;
  }
  if (a6)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a6 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_5:

  return v14;
}

+ (BOOL)unmountAndRenameSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 newName:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  char v16;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  v15 = objc_msgSend((id)objc_opt_class(), "unmount:error:", v14, a7);

  if (v15)
    v16 = objc_msgSend((id)objc_opt_class(), "renameSnapshotForVolume:name:newName:error:", v11, v12, v13, a7);
  else
    v16 = 0;

  return v16;
}

+ (id)_deleteFileSystemSnapshots:(id)a3 block:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  id v43;
  void *v44;
  id obj;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  v43 = a1;
  v51 = 0;
  v44 = v6;
  objc_msgSend((id)objc_opt_class(), "listSnapshotsForVolume:error:", v6, &v51);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v51;
  v10 = v9;
  if (!v8)
  {
    v10 = v9;
    v33 = v10;
    goto LABEL_24;
  }
  if (objc_msgSend(v8, "count"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (!v11)
      goto LABEL_19;
    v12 = v11;
    v13 = *(_QWORD *)v48;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D8270CF0]();
        if ((v7[2](v7, v15) & 1) == 0)
        {
          MBGetDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v54 = v15;
            _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_DEBUG, "Ignoring snapshot: %{public}@", buf, 0xCu);
            _MBLog(CFSTR("DEBUG"), (uint64_t)"Ignoring snapshot: %{public}@", v27, v28, v29, v30, v31, v32, (uint64_t)v15);
          }
          goto LABEL_15;
        }
        objc_msgSend(v15, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v10;
        v18 = objc_msgSend(v43, "deleteSnapshotForVolume:name:error:", v44, v17, &v46);
        v19 = v46;

        if (v18)
        {
          MBGetDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v54 = v15;
            _os_log_impl(&dword_1D5213000, v20, OS_LOG_TYPE_DEFAULT, "Deleted snapshot: %{public}@", buf, 0xCu);
            _MBLog(CFSTR("DEFAULT"), (uint64_t)"Deleted snapshot: %{public}@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
          }
          v10 = v19;
LABEL_15:

          goto LABEL_17;
        }
        v10 = v19;
LABEL_17:
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (!v12)
      {
LABEL_19:

        v33 = 0;
        v8 = v42;
        goto LABEL_24;
      }
    }
  }
  MBGetDefaultLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_1D5213000, v34, OS_LOG_TYPE_INFO, "No snapshots to delete for %{public}@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), (uint64_t)"No snapshots to delete for %{public}@", v35, v36, v37, v38, v39, v40, (uint64_t)v6);
  }

  v33 = 0;
LABEL_24:

  return v33;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_error___block_invoke;
  v13[3] = &unk_1E995D5C8;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "_deleteFileSystemSnapshots:block:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

  return v11 == 0;
}

uint64_t __68__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 latestCreationDate:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
    +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:latestCreationDate:error:].cold.1();
  v12 = v11;
  v13 = (void *)objc_opt_class();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_latestCreationDate_error___block_invoke;
  v19[3] = &unk_1E995D5F0;
  v20 = v12;
  v21 = v10;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v13, "_deleteFileSystemSnapshots:block:", v9, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);

  return v17 == 0;
}

uint64_t __87__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_latestCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "compare:", *(_QWORD *)(a1 + 32)) == -1)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)removeDriveBackupSnapshotsWithLatestCreationDate:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  char v17;
  NSObject *v18;
  id v19;
  int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Caches/Backup"), 1);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C999D0];
  v6 = *MEMORY[0x1E0C998E8];
  v79[0] = *MEMORY[0x1E0C999D0];
  v79[1] = v6;
  v62 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v60 = v4;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v64)
  {
    v63 = *(_QWORD *)v71;
    v59 = v5;
    v61 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v71 != v63)
          objc_enumerationMutation(v7);
        v9 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8270CF0]();
        v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v9, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

        if (v13)
        {
          v68 = 0;
          v69 = 0;
          v14 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v69, v5, &v68);
          v15 = v69;
          v16 = v68;
          if ((v14 & 1) != 0)
          {
            if (objc_msgSend(v15, "BOOLValue"))
            {
              v66 = 0;
              v67 = 0;
              v17 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v67, v62, &v66);
              v18 = v67;
              v19 = v66;

              if ((v17 & 1) != 0)
              {
                if (v18 && objc_msgSend(v58, "compare:", v18) == -1)
                {
                  MBGetDefaultLog();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    -[NSObject timeIntervalSince1970](v18, "timeIntervalSince1970");
                    *(_DWORD *)buf = 138412546;
                    v75 = v9;
                    v76 = 2048;
                    v77 = v48;
                    _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_INFO, "Ignoring %@ since it was created at %.3f", buf, 0x16u);
                    -[NSObject timeIntervalSince1970](v18, "timeIntervalSince1970");
                    _MBLog(CFSTR("INFO"), (uint64_t)"Ignoring %@ since it was created at %.3f", v49, v50, v51, v52, v53, v54, (uint64_t)v9);
                  }
                }
                else
                {
                  v65 = v19;
                  v20 = objc_msgSend(v60, "removeItemAtURL:error:", v9, &v65);
                  v21 = v65;

                  MBGetDefaultLog();
                  v22 = objc_claimAutoreleasedReturnValue();
                  v23 = v22;
                  if (v20)
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v75 = v9;
                      _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_DEFAULT, "Removed drive backup snapshot directory: %@", buf, 0xCu);
                      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removed drive backup snapshot directory: %@", v24, v25, v26, v27, v28, v29, (uint64_t)v9);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v75 = v9;
                    v76 = 2112;
                    v77 = v21;
                    _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_ERROR, "Failed to remove drive backup snapshot directory %@: %@", buf, 0x16u);
                    _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to remove drive backup snapshot directory %@: %@", v42, v43, v44, v45, v46, v47, (uint64_t)v9);
                  }
                  v19 = v21;
                  v5 = v59;
                }
              }
              else
              {
                MBGetDefaultLog();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v75 = v9;
                  v76 = 2112;
                  v77 = v19;
                  _os_log_impl(&dword_1D5213000, v23, OS_LOG_TYPE_ERROR, "Failed to get NSURLCreationDateKey for %@: %@", buf, 0x16u);
                  _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to get NSURLCreationDateKey for %@: %@", v36, v37, v38, v39, v40, v41, (uint64_t)v9);
                }
              }
              v7 = v61;

              v16 = v19;
              goto LABEL_24;
            }
          }
          else
          {
            MBGetDefaultLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v75 = v9;
              v76 = 2112;
              v77 = v16;
              _os_log_impl(&dword_1D5213000, v18, OS_LOG_TYPE_ERROR, "Failed to get NSURLIsDirectoryKey for %@: %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to get NSURLIsDirectoryKey for %@: %@", v30, v31, v32, v33, v34, v35, (uint64_t)v9);
            }
LABEL_24:

          }
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v64 != v8);
      v55 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      v64 = v55;
    }
    while (v55);
  }

}

uint64_t __72__MBFileSystemManager_removeDriveBackupSnapshotsWithLatestCreationDate___block_invoke()
{
  return 1;
}

+ (id)listSnapshotsForVolume:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  int v14;
  uint64_t v15;
  int v16;
  uint8_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint8_t *v34;
  int v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t *v38;
  void *v39;
  MBFileSystemSnapshot *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v77;
  id v78;
  void *v79;
  int v80;
  attrlist v81;
  _BYTE v82[18];
  uint8_t buf[4];
  id v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MBGetDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v84 = v4;
    _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEBUG, "Listing all snapshots at %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"Listing all snapshots at %{public}@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }

  v78 = objc_retainAutorelease(v4);
  v77 = open((const char *)objc_msgSend(v78, "fileSystemRepresentation"), 0);
  if (v77 == -1)
  {
    v51 = *__error();
    MBGetDefaultLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v84 = v78;
      v85 = 1024;
      LODWORD(v86) = v51;
      _os_log_impl(&dword_1D5213000, v52, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to open %{public}@: %{errno}d", v53, v54, v55, v56, v57, v58, (uint64_t)v78);
    }

    if (a4)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v51, v78, CFSTR("Unable to open snapshot path"));
      v59 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = 0;
    }
    goto LABEL_49;
  }
  v12 = (void *)objc_opt_new();
  v13 = *MEMORY[0x1E0C9ADF8];
LABEL_5:
  *(_OWORD *)&v81.bitmapcount = xmmword_1D5259A50;
  *(_QWORD *)&v81.fileattr = 0;
  v14 = fs_snapshot_list(v77, &v81, buf, 0x400uLL, 0);
  if ((v14 & 0x80000000) == 0)
  {
    if (!v14)
    {
      v50 = 0;
      goto LABEL_41;
    }
    v80 = v14;
    v79 = 0;
    v15 = 0;
    v16 = 1;
    while (1)
    {
      v17 = &buf[v15];
      v18 = v15 + 24;
      v20 = *(unsigned int *)&buf[v15];
      v19 = *(_DWORD *)&buf[v15 + 4];
      if ((v19 & 0x20000000) == 0)
        goto LABEL_14;
      v21 = *(unsigned int *)&buf[v18];
      if (!(_DWORD)v21)
        break;
      MBGetDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v82 = 67109120;
        *(_DWORD *)&v82[4] = v21;
        _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_ERROR, "Failed to read attributes for directory entry: %{errno}d\n", v82, 8u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to read attributes for directory entry: %{errno}d\n", v23, v24, v25, v26, v27, v28, v21);
      }

      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v21, v78, CFSTR("Failed to read snapshot attributes"));
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v79 = (void *)v29;
LABEL_29:

      if (v33)
      {
        v15 += v20;
        if (v16++ < v80)
          continue;
      }
      v50 = v79;
      if (v79)
        goto LABEL_41;
      goto LABEL_5;
    }
    v18 = v15 + 28;
LABEL_14:
    if ((v19 & 1) != 0 && (v34 = &buf[v18], v18 += 8, (v35 = *((_DWORD *)v34 + 1)) != 0))
    {
      v36 = &v34[*(int *)v34];
      v37 = (v35 - 1);
      if (v36[v37])
        +[MBFileSystemManager listSnapshotsForVolume:error:].cold.2();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v36, v37, 4);
      v19 = *((_DWORD *)v17 + 1);
      if ((v19 & 0x200) != 0)
      {
LABEL_18:
        v38 = (uint64_t *)&buf[v18];
        v18 += 16;
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)*v38 - v13 + (double)v38[1] * 0.000000001);
        if ((*((_DWORD *)v17 + 1) & 0x800000) != 0)
          goto LABEL_19;
        goto LABEL_23;
      }
    }
    else
    {
      v30 = 0;
      if ((v19 & 0x200) != 0)
        goto LABEL_18;
    }
    v32 = 0;
    if ((v19 & 0x800000) != 0)
    {
LABEL_19:
      *(_OWORD *)v82 = *(_OWORD *)&buf[v18];
      v18 += 16;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v82);
      objc_msgSend(v39, "UUIDString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_27;
      goto LABEL_24;
    }
LABEL_23:
    v31 = 0;
    if (!v30)
    {
LABEL_27:
      if (v18 >= 1025)
        +[MBFileSystemManager listSnapshotsForVolume:error:].cold.1();
      v33 = 1;
      goto LABEL_29;
    }
LABEL_24:
    v40 = -[MBFileSystemSnapshot initWithName:uuid:creationDate:]([MBFileSystemSnapshot alloc], "initWithName:uuid:creationDate:", v30, v31, v32);
    v41 = v12;
    objc_msgSend(v12, "addObject:", v40);
    MBGetDefaultLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v82 = 138543362;
      *(_QWORD *)&v82[4] = v40;
      _os_log_impl(&dword_1D5213000, v42, OS_LOG_TYPE_INFO, "Found file system snapshot: %{public}@", v82, 0xCu);
      _MBLog(CFSTR("INFO"), (uint64_t)"Found file system snapshot: %{public}@", v43, v44, v45, v46, v47, v48, (uint64_t)v40);
    }

    v12 = v41;
    goto LABEL_27;
  }
  v60 = *__error();
  MBGetDefaultLog();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v82 = 138543618;
    *(_QWORD *)&v82[4] = v78;
    *(_WORD *)&v82[12] = 1024;
    *(_DWORD *)&v82[14] = v60;
    _os_log_impl(&dword_1D5213000, v61, OS_LOG_TYPE_ERROR, "fs_snapshot_list failed at %{public}@: %{errno}d", v82, 0x12u);
    _MBLog(CFSTR("ERROR"), (uint64_t)"fs_snapshot_list failed at %{public}@: %{errno}d", v62, v63, v64, v65, v66, v67, (uint64_t)v78);
  }

  +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v60, v78, CFSTR("fs_snapshot_list failed"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:
  close(v77);
  if (v50)
  {
    MBGetDefaultLog();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v84 = v78;
      v85 = 2114;
      v86 = v50;
      _os_log_impl(&dword_1D5213000, v68, OS_LOG_TYPE_ERROR, "Failed to list file system snapshots at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to list file system snapshots at %{public}@: %{public}@", v69, v70, v71, v72, v73, v74, (uint64_t)v78);
    }

    v59 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v50);
  }
  else
  {
    v59 = v12;
  }

LABEL_49:
  return v59;
}

+ (id)volumeMountPointForFile:(id)a3 error:(id *)a4
{
  id v5;
  int *v6;
  void *v7;
  statfs v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, 512);
  v5 = objc_retainAutorelease(a3);
  if (statfs((const char *)objc_msgSend(v5, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0),
         &v9))
  {
    v6 = __error();
    if (a4)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v6, v5, CFSTR("statfs failed"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "mb_stringWithFileSystemRepresentation:", v9.f_mntonname);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)fetchAllAPFSVolumeMountPoints
{
  int v2;
  void *v3;
  uint64_t v4;
  char *f_mntonname;
  void *v6;
  statfs v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = getfsstat(&v8, 43360, 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2 & ~(v2 >> 31));
  if (v2 >= 1)
  {
    v4 = v2;
    f_mntonname = v8.f_mntonname;
    do
    {
      if (!strcmp("apfs", f_mntonname - 16) && (*(f_mntonname - 22) & 0x10) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "mb_stringWithFileSystemRepresentation:", f_mntonname);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);

      }
      f_mntonname += 2168;
      --v4;
    }
    while (v4);
  }
  return v3;
}

+ (BOOL)startFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    +[MBFileSystemManager startFilesystemKeyRollingWithPath:error:].cold.1();
  v24 = xmmword_1D5259A80;
  v6 = objc_retainAutorelease(v5);
  v7 = fsctl((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0xC0104A3DuLL, &v24, 0);
  if (v7 == -1)
  {
    v15 = *__error();
    MBGetDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      _os_log_impl(&dword_1D5213000, v16, OS_LOG_TYPE_ERROR, "fsctl(APFS_KEY_ROLLING_START) failed: %{errno}d", buf, 8u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"fsctl(APFS_KEY_ROLLING_START) failed: %{errno}d", v17, v18, v19, v20, v21, v22, v15);
    }

    if (a4)
    {
      +[MBError errorWithErrno:format:](MBError, "errorWithErrno:format:", v15, CFSTR("Failed to start APFS key rolling"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    MBGetDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v6;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "Started APFS key rolling for %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Started APFS key rolling for %{public}@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

  }
  return v7 != -1;
}

+ (BOOL)stopFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    +[MBFileSystemManager stopFilesystemKeyRollingWithPath:error:].cold.1();
  v24 = xmmword_1D5259A90;
  v6 = objc_retainAutorelease(v5);
  v7 = fsctl((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0xC0104A3DuLL, &v24, 0);
  if (v7 == -1)
  {
    v15 = *__error();
    MBGetDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      _os_log_impl(&dword_1D5213000, v16, OS_LOG_TYPE_ERROR, "fsctl(APFS_KEY_ROLLING_STOP) failed: %{errno}d", buf, 8u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"fsctl(APFS_KEY_ROLLING_STOP) failed: %{errno}d", v17, v18, v19, v20, v21, v22, v15);
    }

    if (a4)
    {
      +[MBError errorWithErrno:format:](MBError, "errorWithErrno:format:", v15, CFSTR("Failed to stop APFS key rolling"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    MBGetDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v6;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "Stopped APFS key rolling for %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Stopped APFS key rolling for %{public}@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

  }
  return v7 != -1;
}

+ (void)removeDeviceTransferDirectoryWithEarliestCreationDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  char v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  id v49;
  uint8_t buf[4];
  const __CFString *v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Caches/Backup/DT")))
  {
    v49 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", CFSTR("/var/mobile/Library/Caches/Backup/DT"), &v49);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = COERCE_DOUBLE(v49);
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (v3 && objc_msgSend(v3, "compare:", v7) == -1)
        {
          MBGetDefaultLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            -[NSObject timeIntervalSince1970](v7, "timeIntervalSince1970");
            *(_DWORD *)buf = 138412546;
            v51 = CFSTR("/var/mobile/Library/Caches/Backup/DT");
            v52 = 2048;
            v53 = v41;
            _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_INFO, "Ignoring %@ since it was created at %.3f", buf, 0x16u);
            -[NSObject timeIntervalSince1970](v7, "timeIntervalSince1970");
            _MBLog(CFSTR("INFO"), (uint64_t)"Ignoring %@ since it was created at %.3f", v42, v43, v44, v45, v46, v47, (uint64_t)CFSTR("/var/mobile/Library/Caches/Backup/DT"));
          }
        }
        else
        {
          MBGetDefaultLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject timeIntervalSince1970](v7, "timeIntervalSince1970");
            *(_DWORD *)buf = 138412546;
            v51 = CFSTR("/var/mobile/Library/Caches/Backup/DT");
            v52 = 2048;
            v53 = v9;
            _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ created at %.3f", buf, 0x16u);
            -[NSObject timeIntervalSince1970](v7, "timeIntervalSince1970");
            _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing %@ created at %.3f", v10, v11, v12, v13, v14, v15, (uint64_t)CFSTR("/var/mobile/Library/Caches/Backup/DT"));
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v17 = v16;
          v48 = v6;
          v18 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/Caches/Backup/DT"), &v48);
          v19 = COERCE_DOUBLE(*(id *)&v48);

          if ((v18 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v21 = v20;
            MBGetDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v51 = CFSTR("/var/mobile/Library/Caches/Backup/DT");
              v52 = 2048;
              v53 = v21 - v17;
              _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_DEFAULT, "Removed %@ in %.3fs", buf, 0x16u);
              _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removed %@ in %.3fs", v23, v24, v25, v26, v27, v28, (uint64_t)CFSTR("/var/mobile/Library/Caches/Backup/DT"));
            }
          }
          else
          {
            MBGetDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v51 = CFSTR("/var/mobile/Library/Caches/Backup/DT");
              v52 = 2112;
              v53 = v19;
              _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
              _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to remove %@: %@", v35, v36, v37, v38, v39, v40, (uint64_t)CFSTR("/var/mobile/Library/Caches/Backup/DT"));
            }
          }
          v6 = v19;
        }

      }
    }
    else
    {
      MBGetDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v51 = CFSTR("/var/mobile/Library/Caches/Backup/DT");
        v52 = 2112;
        v53 = v6;
        _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch attributes at %@: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to fetch attributes at %@: %@", v29, v30, v31, v32, v33, v34, (uint64_t)CFSTR("/var/mobile/Library/Caches/Backup/DT"));
      }
    }

  }
}

+ (id)volumeUUIDWithVolumeMountPoint:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int v29;
  _QWORD v30[2];
  int v31;
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:].cold.1();
  if (!a4)
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:].cold.2();
  v6 = objc_retainAutorelease(v5);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);
  if (v7 < 0)
  {
    v10 = *__error();
    MBGetDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v32 = 138543618;
      *(_QWORD *)&v32[4] = v6;
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = v10;
      _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_ERROR, "open failed at %{public}@: %{errno}d", v32, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"open failed at %{public}@: %{errno}d", v18, v19, v20, v21, v22, v23, (uint64_t)v6);
    }
    goto LABEL_9;
  }
  v8 = v7;
  *(_QWORD *)&v32[16] = 0;
  *(_OWORD *)v32 = xmmword_1D5259A68;
  v30[0] = 0;
  v30[1] = 0;
  v31 = 0;
  v9 = fgetattrlist(v7, v32, v30, 0x14uLL, 0);
  v10 = *__error();
  close(v8);
  if (v9)
  {
    MBGetDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 1024;
      v29 = v10;
      _os_log_impl(&dword_1D5213000, v11, OS_LOG_TYPE_ERROR, "fgetattrlist failed at %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"fgetattrlist failed at %{public}@: %{errno}d", v12, v13, v14, v15, v16, v17, (uint64_t)v6);
    }
LABEL_9:

    +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v10, v6, CFSTR("open error"));
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)v30 + 4);
  if (!v24)
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:].cold.3();
LABEL_11:

  return v24;
}

+ (void)createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:]", "MBFileSystemManager.m", 186, "mountPoints.count > 0");
}

+ (void)deleteAllSnapshotsForVolume:withPrefix:latestCreationDate:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:latestCreationDate:error:]", "MBFileSystemManager.m", 381, "latestCreationDate");
}

+ (void)listSnapshotsForVolume:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 505, "p <= attrBuf + sizeof(attrBuf)");
}

+ (void)listSnapshotsForVolume:error:.cold.2()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 484, "namePtr[nameLength - 1] == '\\0'");
}

+ (void)startFilesystemKeyRollingWithPath:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager startFilesystemKeyRollingWithPath:error:]", "MBFileSystemManager.m", 556, "path");
}

+ (void)stopFilesystemKeyRollingWithPath:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager stopFilesystemKeyRollingWithPath:error:]", "MBFileSystemManager.m", 589, "path");
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]", "MBFileSystemManager.m", 650, "volumeMountPoint");
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.2()
{
  __assert_rtn("+[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]", "MBFileSystemManager.m", 651, "error");
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.3()
{
  __assert_rtn("+[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]", "MBFileSystemManager.m", 680, "volumeUUID");
}

@end
