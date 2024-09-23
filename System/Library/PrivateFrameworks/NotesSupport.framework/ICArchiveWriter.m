@implementation ICArchiveWriter

- (ICArchiveWriter)initWithDestinationURL:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  ICArchiveWriter *v9;
  ICArchiveWriter *v10;
  void *v11;
  uint64_t v12;
  NSString *basePath;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICArchiveWriter;
  v9 = -[ICArchiveWriter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_destinationURL, a3);
    objc_msgSend(v8, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByStandardizingPath");
    v12 = objc_claimAutoreleasedReturnValue();
    basePath = v10->_basePath;
    v10->_basePath = (NSString *)v12;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_archive)
    -[ICArchiveWriter finish:](self, "finish:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICArchiveWriter;
  -[ICArchiveWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)writeURLs:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
    *a4 = 0;
  if (self->_archive || -[ICArchiveWriter open:](self, "open:", a4))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = *(_QWORD *)v27;
      v9 = *MEMORY[0x1E0C999D0];
      v22 = v6;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v25 = 0;
          v12 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v25, v9, a4, v22);
          v13 = v25;
          if (!v12)
            goto LABEL_24;
          objc_msgSend(v11, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByStandardizingPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v13, "BOOLValue")
            || (-[ICArchiveWriter basePath](self, "basePath"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v15, "isEqualToString:", v16),
                v16,
                (v17 & 1) == 0))
          {
            if (!-[ICArchiveWriter writeURL:isDirectory:error:](self, "writeURL:isDirectory:error:", v11, objc_msgSend(v13, "BOOLValue"), a4))
            {

LABEL_24:
LABEL_25:
              v20 = 0;
              v6 = v22;
              goto LABEL_26;
            }
          }
          if ((objc_msgSend(v13, "BOOLValue") & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, 0, 0, a4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v18) = -[ICArchiveWriter writeURLs:error:](self, "writeURLs:error:", v19, a4);
            if (!(_DWORD)v18)
              goto LABEL_25;
          }
          else
          {

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v20 = 1;
        v6 = v22;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v20 = 1;
    }
LABEL_26:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)finish:(id *)a3
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = archive_write_finish();
  v6 = v5;
  if (a3 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Unable to create archive");
    v9 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), archive_error_string(), v8, v9, CFSTR("Unable to create archive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes"), v6, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  self->_archive = 0;
  return v6 == 0;
}

- (BOOL)open:(id *)a3
{
  int v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  self->_archive = (archive *)archive_write_new();
  if (-[ICArchiveWriter usesCompression](self, "usesCompression"))
    v5 = archive_write_set_compression_bzip2();
  else
    v5 = archive_write_set_compression_none();
  v6 = v5;
  if (!v5)
  {
    v7 = -[ICArchiveWriter usesCompression](self, "usesCompression")
       ? archive_write_set_format_pax()
       : archive_write_set_format_zip();
    v6 = v7;
    if (!v7)
    {
      -[ICArchiveWriter destinationURL](self, "destinationURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "fileSystemRepresentation");
      v6 = archive_write_open_filename();

    }
  }
  if (a3 && v6)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Unable to create archive");
    v12 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), archive_error_string(), v11, v12, CFSTR("Unable to create archive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes"), v6, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 0;
}

- (BOOL)writeURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  id v21;
  int v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  id v28;
  ssize_t v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  int v38;
  id v40;
  char v41;
  stat v42;
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  char v47[8192];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v44 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v44, *MEMORY[0x1E0C99A28], a5);
  v8 = v44;
  v9 = objc_msgSend(v8, "BOOLValue");
  v43 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v43, *MEMORY[0x1E0C999D0], a5);
  v10 = v43;
  if (!-[ICArchiveWriter flatten](self, "flatten") || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByStandardizingPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v42, 0, sizeof(v42));
    v14 = objc_retainAutorelease(v13);
    if (lstat((const char *)objc_msgSend(v14, "fileSystemRepresentation"), &v42))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        v11 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

        goto LABEL_30;
      }
LABEL_23:
      v11 = 0;
      goto LABEL_29;
    }
    if (objc_msgSend(v14, "hasPrefix:", CFSTR("/private/var/folders/")))
    {
      objc_msgSend(v14, "substringFromIndex:", objc_msgSend(CFSTR("/private/var/folders/"), "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/var/folders/"), "stringByAppendingString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v16;
    }
    if (-[ICArchiveWriter flatten](self, "flatten"))
    {
      -[ICArchiveWriter flattenFolderName](self, "flattenFolderName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_sanitizedFilenameString");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v19 = -[__CFString length](v18, "length");
      v20 = CFSTR("archive");
      if (v19)
        v20 = v18;
      v40 = v8;
      v21 = v10;
      v22 = v9;
      v23 = v20;
      objc_msgSend(v14, "lastPathComponent");
      v24 = objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingPathComponent:](v23, "stringByAppendingPathComponent:", v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v9 = v22;
      v10 = v21;
      v8 = v40;

      v14 = (id)v24;
    }
    else
    {
      -[ICArchiveWriter basePath](self, "basePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v14, "hasPrefix:", v26);

      if (!v27)
      {
LABEL_16:
        v14 = objc_retainAutorelease(v14);
        objc_msgSend(v14, "fileSystemRepresentation");
        archive_entry_new();
        archive_entry_copy_stat();
        if (v9)
        {
          v41 = v9;
          objc_msgSend(v7, "path");
          v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v29 = readlink((const char *)objc_msgSend(v28, "fileSystemRepresentation"), v47, 0x3FFuLL);

          if (v29 != -1)
          {
            v47[v29] = 0;
            archive_entry_set_symlink();
          }
          LOBYTE(v9) = v41;
        }
        archive_entry_set_pathname();
        v30 = archive_write_header();
        if (!v30)
        {
          if ((v9 & 1) == 0)
          {
            objc_msgSend(v7, "path");
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v38 = open((const char *)objc_msgSend(v37, "fileSystemRepresentation"), 0);

            if (read(v38, v47, 0x2000uLL) >= 1)
            {
              do
                archive_write_data();
              while (read(v38, v47, 0x2000uLL) > 0);
            }
            close(v38);
          }
          archive_entry_free();
          v11 = 1;
          goto LABEL_29;
        }
        if (a5)
        {
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v32 = v30;
          v33 = *MEMORY[0x1E0CB2D50];
          v46[0] = CFSTR("Unable to write archive header");
          v34 = *MEMORY[0x1E0CB2D68];
          v45[0] = v33;
          v45[1] = v34;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), archive_error_string());
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v46[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes"), v32, v36);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_23;
      }
      -[ICArchiveWriter basePath](self, "basePath");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringFromIndex:", -[__CFString length](v18, "length"));
      v25 = objc_claimAutoreleasedReturnValue();
    }

    v14 = (id)v25;
    goto LABEL_16;
  }
  v11 = 1;
LABEL_30:

  return v11;
}

- (BOOL)usesCompression
{
  return self->_usesCompression;
}

- (void)setUsesCompression:(BOOL)a3
{
  self->_usesCompression = a3;
}

- (BOOL)flatten
{
  return self->_flatten;
}

- (void)setFlatten:(BOOL)a3
{
  self->_flatten = a3;
}

- (NSString)flattenFolderName
{
  return self->_flattenFolderName;
}

- (void)setFlattenFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationURL, a3);
}

- (NSString)basePath
{
  return self->_basePath;
}

- (void)setBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_basePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_flattenFolderName, 0);
}

@end
