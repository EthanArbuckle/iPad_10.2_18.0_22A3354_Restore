@implementation NTKUnzipUtilities

+ (BOOL)unzipFile:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int next_header;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  char v37[1024];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  archive_read_new();
  archive_read_support_format_zip();
  archive_read_support_filter_gzip();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, 0, &v36);
  v10 = v36;

  if (!v10)
  {
    v34 = v8;
    v35 = a1;
    objc_msgSend(v7, "path");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");

    if (realpath_DARWIN_EXTSN(v17, v37))
    {
      v18 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURLWithPath:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_retainAutorelease(v6);
      objc_msgSend(v21, "fileSystemRepresentation");
      if (!archive_read_open_filename())
      {
        while (1)
        {
          next_header = archive_read_next_header();
          if (next_header)
            break;
          v24 = archive_entry_filetype();
          if (v24 != 0x8000 && v24 != 0x4000)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decompression failed. This file type is not valid."));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_printError:", v32);

            goto LABEL_18;
          }
          v25 = v6;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", archive_entry_pathname());
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v20;
          objc_msgSend(v20, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringByAppendingPathComponent:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = objc_retainAutorelease(v29);
          objc_msgSend(v30, "UTF8String");
          archive_entry_set_pathname();
          objc_msgSend(v35, "_read_extract_flags");
          if (archive_read_extract())
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decompression failed. Could not extract entry: %@"), v26);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_printError:", v31);

            v15 = 0;
            v6 = v25;
            v20 = v27;
            goto LABEL_19;
          }

          v6 = v25;
          v20 = v27;
        }
        if (next_header == 1)
        {
          v15 = 1;
          goto LABEL_19;
        }
        objc_msgSend(v35, "_printError:", CFSTR("Decompression failed. Bad header."));
LABEL_18:
        v15 = 0;
LABEL_19:
        archive_read_free();
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decompression failed. Could not open source: %s"), objc_msgSend(objc_retainAutorelease(v21), "fileSystemRepresentation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_printError:", v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decompression failed. Could not resolve destination path: %s"), v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_printError:", v20);
    }
    v15 = 0;
LABEL_20:

    v8 = v34;
    goto LABEL_21;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("Decompression failed. Could not create ouput folder, path: %@ due to error: %@."), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_printError:", v14);

  v15 = 0;
LABEL_21:

  return v15;
}

+ (int)_read_extract_flags
{
  if (_read_extract_flags_onceToken != -1)
    dispatch_once(&_read_extract_flags_onceToken, &__block_literal_global_166);
  if (_read_extract_flags_flags)
    return 776;
  else
    return 0;
}

void __40__NTKUnzipUtilities__read_extract_flags__block_invoke()
{
  _read_extract_flags_flags = 1;
}

+ (void)_printError:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[NTKUnzipUtilities _printError:].cold.1((uint64_t)a3);
}

+ (void)_printError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1B72A3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end
