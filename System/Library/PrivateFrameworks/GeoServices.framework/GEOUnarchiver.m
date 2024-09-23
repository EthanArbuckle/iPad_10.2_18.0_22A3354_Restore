@implementation GEOUnarchiver

+ (BOOL)decompressDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  BOOL v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsString:", CFSTR("2")) & 1) != 0
    || objc_msgSend(v13, "containsString:", CFSTR("bz")))
  {
    v14 = objc_msgSend(a1, "decompressBZip2DataAtURL:toURL:log:error:", v10, v11, v12, a6);
  }
  else
  {
    v14 = objc_msgSend(a1, "decompressGZipDataAtURL:toURL:log:error:", v10, v11, v12, a6);
  }
  v15 = v14;

  return v15;
}

+ (BOOL)decompressBZip2DataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  FILE *v13;
  BZFILE *v14;
  id v15;
  id v16;
  FILE *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v21;
  BOOL v22;
  void *v23;
  FILE *v24;
  id *v25;
  void *v26;
  FILE *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  void *v41;
  BZFILE *v42;
  id v43;
  void *v44;
  uint64_t v45;
  FILE *v46;
  BZFILE *v47;
  FILE *v48;
  void *v49;
  id v50;
  id v51;
  const __CFString *v52;
  int bzerror;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  uint8_t buf[4];
  const __CFString *v59;
  __int16 v60;
  _BYTE v61[14];
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  bzerror = 0;
  v12 = objc_retainAutorelease(v9);
  v13 = fopen((const char *)objc_msgSend(v12, "fileSystemRepresentation"), "r");
  if (v13)
  {
    v14 = BZ2_bzReadOpen(&bzerror, v13, 0, 1, 0, 0);
    if (!v14 || bzerror)
    {
      v18 = 0;
      v17 = 0;
      v52 = CFSTR("Unable to initilize bzip");
      if ((bzerror & 0xFFFFFFFB) != 0)
        goto LABEL_23;
      goto LABEL_44;
    }
    v15 = v10;
    v16 = objc_retainAutorelease(v10);
    v17 = fopen((const char *)objc_msgSend(v16, "fileSystemRepresentation"), "w");
    if (v17)
    {
      v18 = malloc_type_malloc(0x2800uLL, 0xA0126F6CuLL);
      if (v18)
      {
        while (!bzerror)
        {
          v19 = BZ2_bzRead(&bzerror, v14, v18, 10240);
          v20 = (bzerror & 0xFFFFFFFB) != 0 || v19 == 0;
          if (!v20 && fwrite(v18, v19, 1uLL, v17) != 1)
          {
            v21 = *__error();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while writing to \"%@\"), v16);
            goto LABEL_20;
          }
        }
        if (bzerror == 4)
        {
          v22 = 1;
          v10 = v15;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while reading bz2 file"));
        v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v15;
        if ((bzerror & 0xFFFFFFFB) == 0)
          goto LABEL_44;
LABEL_23:
        v49 = v18;
        v51 = v10;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", BZ2_bzerror(v14, &bzerror), 5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v59 = v52;
          v60 = 2112;
          *(_QWORD *)v61 = v12;
          *(_WORD *)&v61[8] = 1024;
          *(_DWORD *)&v61[10] = bzerror;
          v62 = 2112;
          v63 = v23;
          _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "%@ for \"%@\": %d: %@", buf, 0x26u);
          if (!a6)
            goto LABEL_26;
        }
        else if (!a6)
        {
LABEL_26:

          v18 = v49;
          v10 = v51;
LABEL_27:
          v32 = (__CFString *)v52;
          goto LABEL_28;
        }
        v24 = v17;
        v25 = a6;
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v56[0] = CFSTR("BZErrorCode");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", bzerror);
        v47 = v14;
        v27 = v13;
        v28 = v11;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v29;
        v57[1] = v23;
        v56[1] = CFSTR("BZErrorString");
        v56[2] = CFSTR("File");
        objc_msgSend(v12, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "GEOErrorWithCode:userInfo:", -18, v31);
        *v25 = (id)objc_claimAutoreleasedReturnValue();
        v17 = v24;

        v11 = v28;
        v13 = v27;
        v14 = v47;
        goto LABEL_26;
      }
      v21 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to malloc %u byte read buffer"), 10240);
LABEL_20:
      v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open output file \"%@\"), v16);
      v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
    }
    v10 = v15;
  }
  else
  {
    v21 = *__error();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open input file \"%@\"), v12);
    v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v17 = 0;
    v18 = 0;
  }
  if ((bzerror & 0xFFFFFFFB) != 0)
    goto LABEL_23;
  if (v21)
  {
    v48 = v13;
    v50 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", strerror(v21), 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v59 = v52;
      v60 = 1024;
      *(_DWORD *)v61 = v21;
      *(_WORD *)&v61[4] = 2112;
      *(_QWORD *)&v61[6] = v35;
      _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "%@: %d: %@", buf, 0x1Cu);
      if (!a6)
        goto LABEL_42;
    }
    else if (!a6)
    {
LABEL_42:

      v13 = v48;
      v12 = v50;
      goto LABEL_27;
    }
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = v11;
    v38 = *MEMORY[0x1E0CB2FE0];
    v46 = v17;
    v39 = a6;
    v40 = v21;
    v54[0] = *MEMORY[0x1E0CB2D68];
    v54[1] = CFSTR("Input");
    v55[0] = v35;
    v55[1] = v50;
    v54[2] = CFSTR("Output");
    v55[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v41 = v18;
    v42 = v14;
    v43 = v10;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v38;
    v11 = v37;
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v45, v40, v44);
    *v39 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v46;

    v10 = v43;
    v14 = v42;
    v18 = v41;
    goto LABEL_42;
  }
LABEL_44:
  v32 = (__CFString *)v52;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v52;
    _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    if (!a6)
      goto LABEL_28;
    goto LABEL_46;
  }
  if (a6)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v52);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeItemAtURL:error:", v10, 0);

  v22 = 0;
LABEL_29:
  if (v14)
    BZ2_bzReadClose(&bzerror, v14);
  if (v13)
    fclose(v13);
  if (v17)
    fclose(v17);
  if (v18)
    free(v18);

  return v22;
}

+ (BOOL)decompressGZipDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  gzFile_s *v11;
  id v12;
  FILE *v13;
  void *v14;
  unsigned int v15;
  int v16;
  __CFString *v17;
  const char *v18;
  BOOL v19;
  char v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v33;
  void *v34;
  id *v35;
  id v36;
  NSObject *oslog;
  int errnum;
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  _BYTE v46[14];
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  oslog = a5;
  v36 = objc_retainAutorelease(v9);
  v11 = gzopen((const char *)objc_msgSend(v36, "fileSystemRepresentation"), "r");
  if (v11)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = fopen((const char *)objc_msgSend(v12, "fileSystemRepresentation"), "w");
    if (!v13)
    {
      v16 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open output file \"%@\"), v12);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      goto LABEL_26;
    }
    v14 = malloc_type_malloc(0x2800uLL, 0x3ED74605uLL);
    if (!v14)
    {
      v16 = *__error();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to malloc %u byte read buffer"), 10240);
LABEL_25:
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    while (1)
    {
      v15 = gzread(v11, v14, 0x2800u);
      if (!v15)
      {
        v31 = 1;
        goto LABEL_35;
      }
      if ((v15 & 0x80000000) != 0)
        break;
      if (fwrite(v14, v15, 1uLL, v13) != 1)
      {
        v16 = *__error();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while writing to \"%@\"), v12);
        goto LABEL_25;
      }
    }
    v17 = CFSTR("Failed while reading");
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v17 = CFSTR("Unable to initilize gzip");
  }
  errnum = 0;
  v18 = gzerror(v11, &errnum);
  if (v18)
    v19 = errnum == -1;
  else
    v19 = 1;
  v20 = !v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v44 = v17;
      v45 = 2112;
      *(_QWORD *)v46 = v36;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)&v46[10] = errnum;
      v47 = 2112;
      v48 = v21;
      _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "%@ for \"%@\": %d: %@", buf, 0x26u);
      if (!a6)
      {
LABEL_19:

        v16 = 0;
        if ((v20 & 1) != 0)
          goto LABEL_31;
LABEL_26:
        if (!v16)
          goto LABEL_31;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", strerror(v16), 5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v44 = v17;
          v45 = 1024;
          *(_DWORD *)v46 = v16;
          *(_WORD *)&v46[4] = 2112;
          *(_QWORD *)&v46[6] = v26;
          _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "%@: %d: %@", buf, 0x1Cu);
          if (!a6)
            goto LABEL_30;
        }
        else if (!a6)
        {
LABEL_30:

          goto LABEL_34;
        }
        v35 = a6;
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2FE0];
        v39[0] = *MEMORY[0x1E0CB2D68];
        v39[1] = CFSTR("Input");
        v40[0] = v26;
        v40[1] = v36;
        v39[2] = CFSTR("Output");
        v40[2] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v16, v29);
        *v35 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_30;
      }
    }
    else if (!a6)
    {
      goto LABEL_19;
    }
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v41[0] = CFSTR("BZErrorCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", errnum);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v34;
    v42[1] = v21;
    v41[1] = CFSTR("BZErrorString");
    v41[2] = CFSTR("File");
    objc_msgSend(v36, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v23 = v17;
    v24 = a6;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "GEOErrorWithCode:userInfo:", -18, v25);
    *v24 = (id)objc_claimAutoreleasedReturnValue();

    a6 = v24;
    v17 = v23;

    goto LABEL_19;
  }
  v16 = *__error();
  if ((v20 & 1) == 0)
    goto LABEL_26;
LABEL_31:
  if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    if (!a6)
      goto LABEL_34;
    goto LABEL_33;
  }
  *(_DWORD *)buf = 138412290;
  v44 = v17;
  _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  if (a6)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeItemAtURL:error:", v10, 0);

  v31 = 0;
  if (v11)
LABEL_35:
    gzclose(v11);
  if (v13)
    fclose(v13);
  if (v14)
    free(v14);

  return v31;
}

+ (BOOL)unarchiveData:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD);
  id v18;
  __int128 v19;
  void *v20;
  char v21;
  int next_header;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  id v32[2];
  _QWORD v33[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v35 = (uint64_t)v10;
    _os_log_debug_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive to location: %{public}@", buf, 0xCu);
  }
  v12 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  archive_read_support_filter_bzip2();
  archive_read_support_filter_gzip();
  NSTemporaryDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __47__GEOUnarchiver_unarchiveData_toURL_log_error___block_invoke;
  v33[3] = &__block_descriptor_40_e5_v8__0l;
  v33[4] = v12;
  v17 = (void (**)(_QWORD))MEMORY[0x18D765024](v33);
  v18 = objc_retainAutorelease(v9);
  objc_msgSend(v18, "bytes");
  objc_msgSend(v18, "length");
  if (archive_read_open_memory())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_error_string());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17[2](v17);

    v21 = 0;
    goto LABEL_31;
  }
  v32[1] = 0;
  *(_QWORD *)&v19 = 138543618;
  v31 = v19;
  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header != 1)
      {
        v27 = archive_error_string();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v35 = v27;
          _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27, v31);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v23);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17[2](v17);
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = 0;
      v21 = objc_msgSend(v25, "moveItemAtURL:toURL:error:", v26, v10, v32);
      v23 = v32[0];

      if ((v21 & 1) == 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v35 = (uint64_t)v23;
          _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to move unarchived data to destination: %{public}@", buf, 0xCu);
          if (!a6)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (a6)
LABEL_17:
          *a6 = objc_retainAutorelease(v23);
      }
LABEL_18:
      v17[2](v17);
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    archive_entry_set_pathname();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v31;
      v35 = (uint64_t)v23;
      v36 = 2114;
      v37 = v24;
      _os_log_debug_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);
    }
    if (archive_read_extract())
      break;

  }
  v28 = archive_error_string();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v35 = v28;
    _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v29);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17[2](v17);

LABEL_29:
  v21 = 0;
LABEL_30:

LABEL_31:
  return v21;
}

uint64_t __47__GEOUnarchiver_unarchiveData_toURL_log_error___block_invoke()
{
  archive_read_close();
  return archive_read_free();
}

+ (BOOL)unarchiveDataAtURL:(id)a3 toURL:(id)a4 log:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD);
  id v19;
  __int128 v20;
  void *v21;
  char v22;
  int next_header;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  id *v33;
  id v34[2];
  _QWORD v35[5];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v37 = (uint64_t)v9;
    _os_log_debug_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive at location: %{public}@", buf, 0xCu);
  }
  v12 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  objc_msgSend(v9, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a6;
  if ((objc_msgSend(v13, "containsString:", CFSTR("2")) & 1) != 0
    || objc_msgSend(v13, "containsString:", CFSTR("bz")))
  {
    archive_read_support_filter_bzip2();
  }
  else
  {
    archive_read_support_filter_gzip();
  }
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __52__GEOUnarchiver_unarchiveDataAtURL_toURL_log_error___block_invoke;
  v35[3] = &__block_descriptor_40_e5_v8__0l;
  v35[4] = v12;
  v18 = (void (**)(_QWORD))MEMORY[0x18D765024](v35);
  v19 = objc_retainAutorelease(v9);
  objc_msgSend(v19, "fileSystemRepresentation");
  if (archive_read_open_filename())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_error_string());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v21);
      *v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18[2](v18);

    v22 = 0;
    goto LABEL_35;
  }
  v34[1] = 0;
  *(_QWORD *)&v20 = 138543618;
  v32 = v20;
  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header != 1)
      {
        v28 = archive_error_string();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v37 = v28;
          _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28, v32);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v24);
          *v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18[2](v18);
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = 0;
      v22 = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v27, v10, v34);
      v24 = v34[0];

      if ((v22 & 1) == 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v37 = (uint64_t)v24;
          _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to move unarchived data to destination: %{public}@", buf, 0xCu);
          if (!v33)
            goto LABEL_22;
          goto LABEL_21;
        }
        if (v33)
LABEL_21:
          *v33 = objc_retainAutorelease(v24);
      }
LABEL_22:
      v18[2](v18);
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v24);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v25, "UTF8String");
    archive_entry_set_pathname();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v32;
      v37 = (uint64_t)v24;
      v38 = 2114;
      v39 = v25;
      _os_log_debug_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);
    }
    if (archive_read_extract())
      break;

  }
  v29 = archive_error_string();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v37 = v29;
    _os_log_error_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v30);
    *v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18[2](v18);

LABEL_33:
  v22 = 0;
LABEL_34:

LABEL_35:
  return v22;
}

uint64_t __52__GEOUnarchiver_unarchiveDataAtURL_toURL_log_error___block_invoke()
{
  archive_read_close();
  return archive_read_free();
}

+ (BOOL)unarchiveDataAtURL:(id)a3 log:(id)a4 inMemoryDataSizeThreshold:(unint64_t)a5 fileVisitor:(id)a6 error:(id *)a7
{
  id v10;
  NSObject *v11;
  void (**v12)(id, void *, id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void (**v22)(_QWORD);
  id v23;
  __int128 v24;
  void *v25;
  BOOL v26;
  void *v27;
  int next_header;
  void *v29;
  unint64_t v30;
  id v31;
  int data_block;
  BOOL v33;
  int v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  void (**v45)(_QWORD);
  id v46;
  void *v47;
  id v49;
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, id, _QWORD))a6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v10;
    _os_log_debug_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "[Unarchive] Decompressing archive at location: %{public}@", buf, 0xCu);
  }
  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:isDirectory:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  objc_msgSend(v10, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "containsString:", CFSTR("2")) & 1) != 0
    || objc_msgSend(v20, "containsString:", CFSTR("bz")))
  {
    archive_read_support_filter_bzip2();
  }
  else
  {
    archive_read_support_filter_gzip();
  }
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __84__GEOUnarchiver_unarchiveDataAtURL_log_inMemoryDataSizeThreshold_fileVisitor_error___block_invoke;
  v50[3] = &unk_1E1C01420;
  v53 = v19;
  v49 = v18;
  v51 = v49;
  v21 = v11;
  v52 = v21;
  v22 = (void (**)(_QWORD))MEMORY[0x18D765024](v50);
  v23 = objc_retainAutorelease(v10);
  objc_msgSend(v23, "fileSystemRepresentation");
  if (archive_read_open_filename())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_error_string());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22[2](v22);

    v26 = 0;
    goto LABEL_43;
  }
  v45 = v22;
  v46 = v23;
  v47 = v20;
  *(_QWORD *)&v24 = 138543618;
  v44 = v24;
  while (1)
  {
    v27 = (void *)MEMORY[0x18D764E2C]();
    next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header != 1)
      {
        v39 = archive_error_string();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v39;
          _os_log_error_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39, v44);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v29);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v40 = a7;
        goto LABEL_38;
      }
      objc_autoreleasePoolPop(v27);
      v38 = 0;
      v26 = 1;
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = archive_entry_size();
    if (!a5 || v30 >= a5)
      break;
    v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v30);
    *(_QWORD *)buf = 0;
    v54 = 0;
    v55 = 0;
    data_block = archive_read_data_block();
    v33 = data_block == 1;
    if (data_block != 1 && (data_block & 0x80000000) == 0)
    {
      do
      {
        objc_msgSend(v31, "appendBytes:length:", *(_QWORD *)buf, v55, v44);
        v34 = archive_read_data_block();
        v33 = v34 == 1;
      }
      while (v34 != 1 && (v34 & 0x80000000) == 0);
    }

    if (!v33)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to read bytes for archive entry", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, CFSTR("Failed to read bytes for archive entry"), v44);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
    v12[2](v12, v29, v31, 0);
LABEL_25:

    objc_autoreleasePoolPop(v27);
  }
  objc_msgSend(v49, "URLByAppendingPathComponent:isDirectory:", v29, 0, v44);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "path");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v35, "UTF8String");
  archive_entry_set_pathname();

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v36 = v21;
    objc_msgSend(v31, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v44;
    *(_QWORD *)&buf[4] = v29;
    v57 = 2114;
    v58 = v37;
    _os_log_debug_impl(&dword_1885A9000, v36, OS_LOG_TYPE_DEBUG, "[Unarchive] Extracting file from archive: %{public}@ -> %{public}@", buf, 0x16u);

  }
  if (!archive_read_extract())
  {
    ((void (**)(id, void *, id, id))v12)[2](v12, v29, 0, v31);
    goto LABEL_25;
  }
  v41 = archive_error_string();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v41;
    _os_log_error_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_extract(): %{public}s", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v42);
  v38 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
  v40 = a7;

LABEL_38:
  objc_autoreleasePoolPop(v27);
  v26 = 0;
  if (!v40)
  {
LABEL_41:
    v23 = v46;
    v20 = v47;
    v22 = v45;
    goto LABEL_42;
  }
  v23 = v46;
  v20 = v47;
  v22 = v45;
  if (v38)
  {
    v38 = objc_retainAutorelease(v38);
    v26 = 0;
    *v40 = v38;
  }
LABEL_42:
  v22[2](v22);

LABEL_43:
  return v26;
}

void __84__GEOUnarchiver_unarchiveDataAtURL_log_inMemoryDataSizeThreshold_fileVisitor_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  archive_read_close();
  archive_read_free();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      v9 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v8;
        _os_log_error_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to clean up temporary directory: %{public}@", buf, 0xCu);
      }
    }

  }
}

+ (id)getContentsOfArchiveAtURL:(id)a3 log:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  size_t v11;
  id v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (**v22)(_QWORD);
  void *v23;
  int next_header;
  void *v25;
  uint64_t v26;
  size_t v27;
  GEOArchiveFileInfo *v28;
  id v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int *v35;
  char *v36;
  int *v37;
  char *v38;
  NSObject *oslog;
  id *v41;
  uint64_t v42;
  _QWORD v43[7];
  int v44;
  id v45;
  uint8_t buf[4];
  _BYTE v47[10];
  _QWORD v48[4];

  *(_QWORD *)((char *)&v48[2] + 2) = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v45 = 0;
  LODWORD(a4) = objc_msgSend(v7, "getResourceValue:forKey:error:", &v45, *MEMORY[0x1E0C99998], a5);
  v9 = v45;
  v10 = v9;
  if (!(_DWORD)a4)
  {
LABEL_10:
    v18 = 0;
    goto LABEL_37;
  }
  v11 = objc_msgSend(v9, "unsignedLongLongValue");
  v12 = objc_retainAutorelease(v7);
  v13 = open((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0);
  if (v13 < 0)
  {
    v17 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v37 = __error();
      v38 = strerror(*v37);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v47 = v12;
      *(_WORD *)&v47[8] = 2080;
      v48[0] = v38;
      _os_log_error_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "[Unarchiver] Error opening file at %@: %s", buf, 0x16u);
    }

    goto LABEL_10;
  }
  v14 = v13;
  v15 = mmap(0, v11, 1, 2, v13, 0);
  if ((unint64_t)v15 + 1 <= 1)
  {
    v16 = v8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v34 = *__error();
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v47 = v14;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v34;
      LOWORD(v48[0]) = 2080;
      *(_QWORD *)((char *)v48 + 2) = v36;
      _os_log_error_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "[Unarchiver] Could not memory-map file descriptor: %d with error %d: %s", buf, 0x18u);
    }

    close(v14);
    goto LABEL_10;
  }
  v19 = (uint64_t)v15;
  v41 = a5;
  v20 = archive_read_new();
  archive_read_support_format_tar();
  archive_read_support_format_cpio();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __53__GEOUnarchiver_getContentsOfArchiveAtURL_log_error___block_invoke;
  v43[3] = &__block_descriptor_60_e5_v8__0l;
  v43[4] = v20;
  v43[5] = v19;
  v43[6] = v11;
  v44 = v14;
  v42 = MEMORY[0x18D765024](v43);
  if (archive_read_open_memory())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_error_string());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -18, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = (void (**)(_QWORD))v42;
    (*(void (**)(uint64_t))(v42 + 16))(v42);

    v18 = 0;
  }
  else
  {
    oslog = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      v23 = (void *)MEMORY[0x18D764E2C]();
      next_header = archive_read_next_header();
      if (next_header)
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = archive_entry_size();
      if (archive_read_data_block() || v26)
      {
        v32 = archive_error_string();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v47 = v32;
          _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_data_block(): %s", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v33);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        v18 = (void *)v33;
        v31 = v41;
        v22 = (void (**)(_QWORD))v42;
        goto LABEL_30;
      }
      v27 = -v19;
      if (v19 || v27 >= v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: bufferHasValidOffset", buf, 2u);
        }
        v31 = v41;
        v22 = (void (**)(_QWORD))v42;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Invalid file offset within archive", buf, 2u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Bad file offset within archive"));
        v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
      v28 = -[GEOArchiveFileInfo initWithFilePath:offset:length:]([GEOArchiveFileInfo alloc], "initWithFilePath:offset:length:", v25, v27, v26);
      objc_msgSend(v18, "addObject:", v28);

      archive_read_data_skip();
      objc_autoreleasePoolPop(v23);
    }
    if (next_header == 1)
    {
      objc_autoreleasePoolPop(v23);
      v29 = 0;
      v8 = oslog;
      v22 = (void (**)(_QWORD))v42;
      goto LABEL_35;
    }
    v30 = archive_error_string();
    v22 = (void (**)(_QWORD))v42;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)v47 = v30;
      _os_log_error_impl(&dword_1885A9000, oslog, OS_LOG_TYPE_ERROR, "[Unarchive] Failed to archive_read_next_header(): %{public}s", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v25);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    v31 = v41;
LABEL_31:

    objc_autoreleasePoolPop(v23);
    v18 = 0;
    if (v31)
    {
      v8 = oslog;
      if (v29)
      {
        v29 = objc_retainAutorelease(v29);
        v18 = 0;
        *v31 = v29;
      }
    }
    else
    {
      v8 = oslog;
    }
LABEL_35:
    v22[2](v22);

  }
LABEL_37:

  return v18;
}

uint64_t __53__GEOUnarchiver_getContentsOfArchiveAtURL_log_error___block_invoke(uint64_t a1)
{
  archive_read_close();
  archive_read_free();
  munmap(*(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
  return close(*(_DWORD *)(a1 + 56));
}

@end
