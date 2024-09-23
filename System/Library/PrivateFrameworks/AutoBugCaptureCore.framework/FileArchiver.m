@implementation FileArchiver

+ (id)matchFilesInDirectory:(id)a3 filenamePredicate:(id)a4 newerThan:(id)a5 allowDirectories:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  id v29;
  void *v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  int v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  id obj;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _QWORD v62[5];

  v62[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C99A90];
  v14 = *MEMORY[0x1E0C999D0];
  v62[0] = *MEMORY[0x1E0C99A90];
  v62[1] = v14;
  v42 = v14;
  v15 = *MEMORY[0x1E0C998E8];
  v62[2] = *MEMORY[0x1E0C998E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, v16, 0, &v58);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v58;

  v19 = v9;
  v20 = v17;
  if (!v18)
  {
    v39 = 0;
    v40 = v11;
    v44 = v15;
    v45 = v13;
    v49 = v10;
    v41 = v8;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v17;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    v22 = v42;
    if (!v21)
      goto LABEL_30;
    v23 = v21;
    v50 = *(_QWORD *)v55;
    v48 = v19;
    while (1)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v55 != v50)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x1DF0B6314]();
        v53 = 0;
        v27 = v22;
        v28 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v53, v22, 0);
        v29 = v53;
        v30 = v29;
        if (v28 && objc_msgSend(v29, "BOOLValue") && !a6)
        {
          archiverLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v25;
            _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it is a directory and not allowed", buf, 0xCu);
          }
          goto LABEL_27;
        }
        if (!v19)
        {
          v31 = 0;
LABEL_19:
          if (v49)
          {
            v51 = 0;
            v34 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v51, v44, 0);
            v35 = v51;
            v36 = v35;
            if (v34 && objc_msgSend(v35, "compare:", v49) == -1)
            {
              archiverLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v25;
                _os_log_impl(&dword_1DBAE1000, v37, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it didn't match fileCreationDate", buf, 0xCu);
              }
              goto LABEL_26;
            }
          }
          else
          {
            v36 = 0;
          }
          objc_msgSend(v25, "path", v39, v40, v41);
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v37);
LABEL_26:

          v19 = v48;
LABEL_27:
          v22 = v27;
          goto LABEL_28;
        }
        v52 = 0;
        v32 = objc_msgSend(v25, "getResourceValue:forKey:error:", &v52, v45, 0);
        v31 = v52;
        if (!v32 || (objc_msgSend(v19, "evaluateWithObject:", v31) & 1) != 0)
          goto LABEL_19;
        archiverLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        v22 = v27;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v25;
          _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEBUG, "Not archiving %@ because it didn't match name filter", buf, 0xCu);
        }

        v19 = v48;
LABEL_28:

        objc_autoreleasePoolPop(v26);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (!v23)
      {
LABEL_30:

        v11 = v40;
        v8 = v41;
        v10 = v49;
        v18 = v39;
        break;
      }
    }
  }

  return v47;
}

+ (id)archiveWithPath:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  FileArchiver *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  NSObject *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (-[NSObject length](v3, "length"))
  {
    -[NSObject stringByAppendingString:](v3, "stringByAppendingString:", CFSTR(".tar.gz"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[FileArchiver initWithPath:shouldCompress:]([FileArchiver alloc], "initWithPath:shouldCompress:", v4, 1);
      archiverLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412546;
          v13 = v3;
          v14 = 2112;
          v15 = v4;
          _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "archiving %@ into %@", (uint8_t *)&v12, 0x16u);
        }

        -[NSObject lastPathComponent](v3, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FileArchiver moveDirectoryToArchive:withDirName:](v5, "moveDirectoryToArchive:withDirName:", v3, v8);

        if (-[FileArchiver closeArchive](v5, "closeArchive"))
        {
          archiverLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v12 = 138412290;
            v13 = v4;
            _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "closeArchive failed for %@", (uint8_t *)&v12, 0xCu);
          }

        }
        v10 = v4;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "failed to create archive: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      archiverLogHandle();
      v5 = (FileArchiver *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1DBAE1000, &v5->super, OS_LOG_TYPE_ERROR, "failed to create tarball path from: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v10 = 0;
LABEL_20:

    goto LABEL_21;
  }
  archiverLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_ERROR, "no dir_path provided", (uint8_t *)&v12, 2u);
  }
  v10 = 0;
LABEL_21:

  return v10;
}

+ (id)archiveWithPaths:(id)a3 destinationDir:(id)a4 deleteSource:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  char v34;
  id v35;
  NSObject *v36;
  _BOOL4 v38;
  NSObject *v39;
  id v40;
  id v41;
  FileArchiver *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  unsigned __int8 v52;
  uint8_t buf[4];
  _BYTE v54[18];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v5 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "length"))
  {
    archiverLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "destination path is invalid", buf, 2u);
    }
    v25 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(".tar.gz"));
  v9 = objc_claimAutoreleasedReturnValue();
  v42 = -[FileArchiver initWithPath:shouldCompress:]([FileArchiver alloc], "initWithPath:shouldCompress:", v9, 1);
  if (!v42)
  {
    archiverLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v9;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "failed to create archive: %@", buf, 0xCu);
    }
    v25 = 0;
    goto LABEL_50;
  }
  v38 = v5;
  v39 = v9;
  v52 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v40 = v7;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (!v12)
    goto LABEL_32;
  v13 = v12;
  v14 = *(_QWORD *)v49;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v49 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if (!-[NSObject fileExistsAtPath:isDirectory:](v10, "fileExistsAtPath:isDirectory:", v16, &v52))
      {
        archiverLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v54 = v16;
          v21 = v20;
          v22 = "fileExistsAtPath says %@ doesn't exist!";
          v23 = 12;
          goto LABEL_18;
        }
LABEL_19:

        continue;
      }
      v17 = v52;
      objc_msgSend(v16, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        v19 = -[FileArchiver addDirectoryToArchive:withDirName:](v42, "addDirectoryToArchive:withDirName:", v16, v18);
      else
        v19 = -[FileArchiver addFileToArchive:withFileName:](v42, "addFileToArchive:withFileName:", v16, v18);
      v24 = v19;

      if (v24)
      {
        if (v24 == -30)
        {
          archiverLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v54 = v16;
            _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_ERROR, "ARCHIVE_FATAL for %@", buf, 0xCu);
          }

          goto LABEL_32;
        }
        archiverLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = v24;
          *(_WORD *)&v54[4] = 2112;
          *(_QWORD *)&v54[6] = v16;
          v21 = v20;
          v22 = "Archive ERROR (%d) for %@";
          v23 = 18;
LABEL_18:
          _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, v22, buf, v23);
        }
        goto LABEL_19;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v13)
      continue;
    break;
  }
LABEL_32:

  if (-[FileArchiver closeArchive](v42, "closeArchive"))
  {
    archiverLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v39;
      _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_ERROR, "closeArchive failed for %@", buf, 0xCu);
    }

  }
  v7 = v40;
  if (v38)
  {
    v41 = v8;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v28 = v11;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
          v43 = 0;
          v34 = -[NSObject removeItemAtPath:error:](v10, "removeItemAtPath:error:", v33, &v43);
          v35 = v43;
          if ((v34 & 1) == 0)
          {
            archiverLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v54 = v33;
              *(_WORD *)&v54[8] = 2112;
              *(_QWORD *)&v54[10] = v35;
              _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_ERROR, "Unable to delete: %@ (%@)", buf, 0x16u);
            }

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      }
      while (v30);
    }

    v7 = v40;
    v8 = v41;
  }
  v9 = v39;
  v25 = v39;
LABEL_50:

LABEL_51:
  return v25;
}

+ (id)archiveWithPath:(id)a3 destinationDir:(id)a4 nameMatches:(id)a5 maxAge:(double)a6 allowDirectories:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v7 = a7;
  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!objc_msgSend(v11, "length"))
  {
    archiverLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      v15 = "source directory path is invalid";
      goto LABEL_11;
    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (!objc_msgSend(v12, "length"))
  {
    archiverLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      v15 = "destination directory path is invalid";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v13 && a6 == 0.0)
  {
    archiverLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      v15 = "no filename predicate nor file age filter";
LABEL_11:
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a6 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a6);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  +[FileArchiver matchFilesInDirectory:filenamePredicate:newerThan:allowDirectories:](FileArchiver, "matchFilesInDirectory:filenamePredicate:newerThan:allowDirectories:", v11, v13, v14, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  archiverLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, "archiving filtered contents of %@ into %@.tar.gz", (uint8_t *)&v20, 0x16u);
  }

  +[FileArchiver archiveWithPaths:destinationDir:deleteSource:](FileArchiver, "archiveWithPaths:destinationDir:deleteSource:", v18, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v16;
}

- (FileArchiver)initWithPath:(id)a3 shouldCompress:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  FileArchiver *v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FileArchiver;
  v7 = -[FileArchiver init](&v13, sel_init);
  if (v7)
  {
    v7->_archive = (archive *)archive_write_new();
    if (v4)
      archive_write_add_filter_gzip();
    archive_write_set_format_pax();
    v8 = objc_retainAutorelease(v6);
    objc_msgSend(v8, "UTF8String");
    v9 = archive_write_open_filename();
    if (v9)
    {
      v10 = v9;
      archiverLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 1024;
        v17 = v10;
        _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Error creating archive at path %@ %d", buf, 0x12u);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (int)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const char *v9;
  int v10;
  int v11;
  id v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v22;
  NSObject *v23;
  int v24;
  ssize_t v25;
  ssize_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  stat v31;
  uint8_t v32[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  ssize_t v37;
  __int16 v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0);
  if (!v8)
  {
    archiverLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "No filename!";
LABEL_13:
      v19 = v17;
      v20 = 2;
LABEL_14:
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
LABEL_15:

LABEL_16:
    v13 = -1;
    goto LABEL_17;
  }
  v9 = (const char *)v8;
  if (!archive_entry_new())
  {
    archiverLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "archive_entry_new() failed!";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v10 = open(v9, 0);
  if (v10 == -1)
  {
    archiverLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v22 = *__error();
    *(_DWORD *)buf = 138412546;
    v41 = (uint64_t)v7;
    v42 = 1024;
    v43 = v22;
    v18 = "Error opening file %@  %{errno}d";
    v19 = v17;
    v20 = 18;
    goto LABEL_14;
  }
  v11 = v10;
  if (stat(v9, &v31) == -1)
  {
    archiverLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *__error();
      *(_DWORD *)buf = 136315394;
      v41 = (uint64_t)v9;
      v42 = 1024;
      v43 = v24;
      _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_ERROR, "stat() failed for %s: %{errno}d", buf, 0x12u);
    }

    close(v11);
    goto LABEL_16;
  }
  archive_entry_copy_stat();
  v12 = objc_retainAutorelease(v6);
  objc_msgSend(v12, "UTF8String");
  archive_entry_set_pathname();
  if (archive_write_header())
  {
    v13 = archive_errno();
    archiverLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      v16 = archive_error_string();
      *(_DWORD *)buf = 136315650;
      v41 = v15;
      v42 = 1024;
      v43 = v13;
      v44 = 2080;
      v45 = v16;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "failed to write header for file, %s, status, %d, reason: %s", buf, 0x1Cu);
    }

  }
  else
  {
    v25 = read(v11, buf, 0x2000uLL);
    if (v25 < 1)
    {
LABEL_27:
      v13 = 0;
    }
    else
    {
      v26 = v25;
      while (1)
      {
        v27 = archive_write_data();
        if (v27 != v26)
          break;
        v26 = read(v11, buf, 0x2000uLL);
        if (v26 <= 0)
          goto LABEL_27;
      }
      v28 = v27;
      archiverLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = archive_error_string();
        *(_DWORD *)v32 = 136315906;
        v33 = v30;
        v34 = 2112;
        v35 = v7;
        v36 = 2048;
        v37 = v26;
        v38 = 2048;
        v39 = v28;
        _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_ERROR, "Error (%s) writing file %@: request to write %ld bytes but wrote %ld bytes", v32, 0x2Au);
      }

      v13 = archive_errno();
    }
  }
  archive_entry_free();
  close(v11);
LABEL_17:

  return v13;
}

- (int)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v31 = 0;
    v8 = (void *)MEMORY[0x1DF0B6314]();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v23 = v8;
      v24 = v7;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v5, "stringByAppendingPathComponent:", v14, v23, v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v15, &v31);

          if (v17)
          {
            objc_msgSend(v14, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringByAppendingPathComponent:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
              v20 = -[FileArchiver addDirectoryToArchive:withDirName:](self, "addDirectoryToArchive:withDirName:", v15, v19);
            else
              v20 = -[FileArchiver addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v15, v19);
            if (v20 == -30)
            {

              v21 = -30;
              goto LABEL_18;
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v11)
          continue;
        break;
      }
      v21 = 0;
LABEL_18:
      v8 = v23;
      v7 = v24;
    }
    else
    {
      v21 = 0;
    }

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)moveDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FileArchiver addDirectoryToArchive:withDirName:](self, "addDirectoryToArchive:withDirName:", v5, v6);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "removeItemAtPath:error:", v5, &v13);
  v8 = v13;

  if (v8)
  {
    archiverLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      objc_msgSend(v8, "description");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2080;
      v17 = v12;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Failed to clean up source dir: %s, error: %s", buf, 0x16u);

    }
  }

}

- (int)closeArchive
{
  int result;

  result = archive_write_free();
  self->_archive = 0;
  return result;
}

@end
