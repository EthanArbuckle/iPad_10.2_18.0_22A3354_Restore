@implementation NSFileManager(MobileBackup)

- (uint64_t)mb_moveToTmpDirThenRemoveItemAtPath:()MobileBackup error:
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    -[NSFileManager(MobileBackup) mb_moveToTmpDirThenRemoveItemAtPath:error:].cold.1();
  v7 = v6;
  if ((objc_msgSend(a1, "fileExistsAtPath:", v6) & 1) != 0)
  {
    v18 = 0;
    v8 = objc_msgSend(a1, "_tryMovingThenRemovingItemAtPath:error:", v7, &v18);
    v9 = v18;
    v10 = v9;
    if (a4 && (v8 & 1) == 0)
    {
      v10 = objc_retainAutorelease(v9);
      *a4 = v10;
    }
  }
  else
  {
    MBGetDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1D5213000, v10, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Nothing at %{public}@ to remove", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= rm: Nothing at %{public}@ to remove", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    }
    v8 = 1;
  }

  return v8;
}

- (uint64_t)_tryMovingThenRemovingItemAtPath:()MobileBackup error:
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    -[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:].cold.1();
  if (!a4)
    -[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:].cold.2();
  v7 = v6;
  +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:](MBTemporaryDirectory, "temporaryDirectoryOnSameVolumeAsPath:identifiedBy:error:", v6, CFSTR("move-aside-cleanup"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    MBGetDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v8;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_INFO, "=mbfm= rm: Created move-aside temp dir: %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), (uint64_t)"=mbfm= rm: Created move-aside temp dir: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }

    if ((objc_msgSend(a1, "_moveItemAtPath:toTempDir:", v7, v8) & 1) != 0)
    {
      MBGetDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v17;
        _os_log_impl(&dword_1D5213000, v16, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Removing temporary cleanup dir %{public}@", buf, 0xCu);

        objc_msgSend(v8, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= rm: Removing temporary cleanup dir %{public}@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);

      }
      v25 = objc_msgSend(v8, "disposeWithError:", a4);
    }
    else
    {
      +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", v7, CFSTR("Unable to move to temporary cleanup dir"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      MBGetDefaultLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *a4;
        *(_DWORD *)buf = 138543874;
        v53 = v7;
        v54 = 2114;
        v55 = v27;
        v56 = 2112;
        v57 = v28;
        _os_log_impl(&dword_1D5213000, v26, OS_LOG_TYPE_ERROR, "=mbfm= rm: Unable to move %{public}@ to temporary cleanup dir %{public}@: %@", buf, 0x20u);

        objc_msgSend(v8, "path");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _MBLog(CFSTR("ERROR"), (uint64_t)"=mbfm= rm: Unable to move %{public}@ to temporary cleanup dir %{public}@: %@", v29, v30, v31, v32, v33, v34, (uint64_t)v7);

      }
      objc_msgSend(v8, "dispose");
      v25 = 0;
    }
  }
  else
  {
    if (+[MBError errnoForError:](MBError, "errnoForError:", *a4) == 2)
      goto LABEL_11;
    MBGetDefaultLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)*a4;
      *(_DWORD *)buf = 138543618;
      v53 = v7;
      v54 = 2114;
      v55 = v36;
      _os_log_impl(&dword_1D5213000, v35, OS_LOG_TYPE_ERROR, "=mbfm= rm: Unable to create temporary cleanup dir, removing %{public}@ in place: %{public}@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=mbfm= rm: Unable to create temporary cleanup dir, removing %{public}@ in place: %{public}@", v37, v38, v39, v40, v41, v42, (uint64_t)v7);
    }

    v25 = objc_msgSend(a1, "removeItemAtPath:error:", v7, a4);
    if ((v25 & 1) != 0 || objc_msgSend(a1, "fileExistsAtPath:", v7))
    {
      MBGetDefaultLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v7;
        _os_log_impl(&dword_1D5213000, v43, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Removed %{public}@ in place", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= rm: Removed %{public}@ in place", v44, v45, v46, v47, v48, v49, (uint64_t)v7);
      }

    }
    else
    {
LABEL_11:
      v25 = 1;
    }
  }

  return v25;
}

- (uint64_t)_moveItemAtPath:()MobileBackup toTempDir:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  const std::__fs::filesystem::path *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "makeTemporaryFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v5);
  v9 = (const std::__fs::filesystem::path *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v7);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");
  rename(v9, v11, v12);
  if (v13)
  {
    if (*__error() != 2)
    {
      v30 = 0;
      goto LABEL_10;
    }
    MBGetDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v8;
      v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Nothing at %{public}@ to move to temporary cleanup dir %{public}@", buf, 0x16u);

      objc_msgSend(v6, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= rm: Nothing at %{public}@ to move to temporary cleanup dir %{public}@", v17, v18, v19, v20, v21, v22, (uint64_t)v8);
LABEL_7:

    }
  }
  else
  {
    MBGetDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v8;
      v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: moved item at %{public}@ to temp cleanup dir %{public}@", buf, 0x16u);

      objc_msgSend(v6, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= rm: moved item at %{public}@ to temp cleanup dir %{public}@", v24, v25, v26, v27, v28, v29, (uint64_t)v8);
      goto LABEL_7;
    }
  }

  v30 = 1;
LABEL_10:

  return v30;
}

- (id)mb_moveAsideItemAtPath:()MobileBackup error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    -[NSFileManager(MobileBackup) mb_moveAsideItemAtPath:error:].cold.1();
  v7 = v6;
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("_"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iso8601String");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  LOBYTE(v10) = objc_msgSend(a1, "moveItemAtPath:toPath:error:", v7, v14, &v32);
  v15 = v32;
  MBGetDefaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v34 = v7;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1D5213000, v17, OS_LOG_TYPE_INFO, "=mbfm= ma: Moved aside %{public}@ to %{public}@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), (uint64_t)"=mbfm= ma: Moved aside %{public}@ to %{public}@", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
    }

    v24 = v14;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v7;
      v35 = 2114;
      v36 = v14;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_1D5213000, v17, OS_LOG_TYPE_ERROR, "=mbfm= ma: Unable to move aside %{public}@ to %{public}@: %@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=mbfm= ma: Unable to move aside %{public}@ to %{public}@: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v7);
    }

    v24 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v15);
  }

  return v24;
}

- (BOOL)mb_markAsPurgeableItemAtPath:()MobileBackup error:
{
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 73733;
  v5 = objc_retainAutorelease(a3);
  v6 = fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0xC0084A44uLL, &v22, 0);
  if (v6)
  {
    +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *__error(), v5, CFSTR("Failed to mark item purgeable"));
    v7 = objc_claimAutoreleasedReturnValue();
    MBGetDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v5;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_ERROR, "=mbfm= =purge= Failed to mark %{public}@ as purgeable: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"=mbfm= =purge= Failed to mark %{public}@ as purgeable: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v5);
    }

    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      *a4 = v7;
    }
  }
  else
  {
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v5;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_INFO, "=mbfm= =purge= Marked %{public}@ as purgeable", buf, 0xCu);
      _MBLog(CFSTR("INFO"), (uint64_t)"=mbfm= =purge= Marked %{public}@ as purgeable", v15, v16, v17, v18, v19, v20, (uint64_t)v5);
    }
  }

  return v6 == 0;
}

- (uint64_t)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if ((objc_msgSend(v12, "isAbsolutePath") & 1) == 0)
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:].cold.3();
  if ((objc_msgSend(v14, "isAbsolutePath") & 1) == 0)
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:].cold.2();
  v16 = objc_msgSend(v13, "count");
  if (v16 != objc_msgSend(v15, "count"))
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:].cold.1();
  v55 = a7;
  objc_msgSend(a1, "_pathsRootedAt:subpaths:", v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "_anyPathExists:", v17);
  objc_msgSend(a1, "_pathsRootedAt:subpaths:", v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1, "_anyPathExists:", v19);
  MBGetDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v20)
  {
    v32 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v32)
      {
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v33;
        v58 = 2114;
        v59 = v12;
        v60 = 2114;
        v61 = v14;
        _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Migrating (%{public}@) from %{public}@ to %{public}@", buf, 0x20u);

        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= mg: Migrating (%{public}@) from %{public}@ to %{public}@", v35, v36, v37, v38, v39, v40, (uint64_t)v34);

      }
      v31 = objc_msgSend(a1, "_migratePaths:to:error:", v17, v19, v55);
      goto LABEL_13;
    }
    if (v32)
    {
      *(_DWORD *)buf = 138543618;
      v57 = v12;
      v58 = 2114;
      v59 = v14;
      _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Nothing to migrate from %{public}@ to %{public}@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= mg: Nothing to migrate from %{public}@ to %{public}@", v48, v49, v50, v51, v52, v53, (uint64_t)v12);
    }
LABEL_18:

    v41 = 1;
    goto LABEL_19;
  }
  if (!v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v57 = v12;
      v58 = 2114;
      v59 = v14;
      _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_INFO, "=mbfm= mg: Nothing to migrate from %{public}@, already present in %{public}@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), (uint64_t)"=mbfm= mg: Nothing to migrate from %{public}@, already present in %{public}@", v42, v43, v44, v45, v46, v47, (uint64_t)v12);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v23;
    v58 = 2114;
    v59 = v12;
    v60 = 2114;
    v61 = v14;
    _os_log_impl(&dword_1D5213000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Cleaning up un-migrated (%{public}@) from %{public}@, already present in %{public}@", buf, 0x20u);

    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"=mbfm= mg: Cleaning up un-migrated (%{public}@) from %{public}@, already present in %{public}@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);

  }
  v31 = objc_msgSend(a1, "_removeAllPaths:error:", v17, v55);
LABEL_13:
  v41 = v31;
LABEL_19:

  return v41;
}

- (id)_pathsRootedAt:()MobileBackup subpaths:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    -[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:].cold.1();
  v7 = v6;
  if (!v6)
    -[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:].cold.2();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v5, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (uint64_t)_anyPathExists:()MobileBackup
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a1, "fileExistsAtPath:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)_removeAllPaths:()MobileBackup error:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke;
  v10[3] = &unk_1E995D0D0;
  v10[4] = a1;
  v11 = v6;
  v7 = v6;
  v8 = objc_msgSend(a1, "_perform:times:error:", v10, objc_msgSend(v7, "count", v10[0], 3221225472, __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke, &unk_1E995D0D0, a1), a4);

  return v8;
}

- (uint64_t)_migratePaths:()MobileBackup to:error:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__NSFileManager_MobileBackup___migratePaths_to_error___block_invoke;
  v14[3] = &unk_1E995D0F8;
  v14[4] = a1;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = objc_msgSend(a1, "_perform:times:error:", v14, objc_msgSend(v11, "count"), a5);

  return v12;
}

- (BOOL)_perform:()MobileBackup times:error:
{
  uint64_t (**v7)(id, _QWORD, id *);
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  _BOOL8 v12;
  id v14;

  v7 = a3;
  if (a4)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v14 = 0;
      v10 = v7[2](v7, v8, &v14);
      v11 = v14;
      if ((v10 & 1) == 0 && +[MBError codeForNSError:](MBError, "codeForNSError:", v11) != 4)
      {
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "addObject:", v11);
      }

      ++v8;
    }
    while (a4 != v8);
    v12 = v9 == 0;
    if (a5 && v9)
    {
      +[MBError errorWithErrors:](MBError, "errorWithErrors:", v9);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
    v12 = 1;
  }

  return v12;
}

- (void)mb_moveToTmpDirThenRemoveItemAtPath:()MobileBackup error:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_moveToTmpDirThenRemoveItemAtPath:error:]", "NSFileManager+MobileBackup.m", 23, "path");
}

- (void)_tryMovingThenRemovingItemAtPath:()MobileBackup error:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:]", "NSFileManager+MobileBackup.m", 39, "path");
}

- (void)_tryMovingThenRemovingItemAtPath:()MobileBackup error:.cold.2()
{
  __assert_rtn("-[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:]", "NSFileManager+MobileBackup.m", 40, "error");
}

- (void)mb_moveAsideItemAtPath:()MobileBackup error:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_moveAsideItemAtPath:error:]", "NSFileManager+MobileBackup.m", 95, "path");
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]", "NSFileManager+MobileBackup.m", 132, "sourceSubPaths.count == destinationSubPaths.count");
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.2()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]", "NSFileManager+MobileBackup.m", 131, "destinationDirectory.isAbsolutePath");
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.3()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]", "NSFileManager+MobileBackup.m", 130, "sourceDirectory.isAbsolutePath");
}

- (void)_pathsRootedAt:()MobileBackup subpaths:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:]", "NSFileManager+MobileBackup.m", 163, "parentDirectory");
}

- (void)_pathsRootedAt:()MobileBackup subpaths:.cold.2()
{
  __assert_rtn("-[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:]", "NSFileManager+MobileBackup.m", 164, "subpaths");
}

@end
