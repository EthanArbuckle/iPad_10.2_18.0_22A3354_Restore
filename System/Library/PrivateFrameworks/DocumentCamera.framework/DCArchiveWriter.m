@implementation DCArchiveWriter

- (DCArchiveWriter)initWithDestinationURL:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  DCArchiveWriter *v9;
  DCArchiveWriter *v10;
  void *v11;
  uint64_t v12;
  NSString *basePath;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DCArchiveWriter;
  v9 = -[DCArchiveWriter init](&v15, sel_init);
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
    -[DCArchiveWriter finish:](self, "finish:", 0);
  v3.receiver = self;
  v3.super_class = (Class)DCArchiveWriter;
  -[DCArchiveWriter dealloc](&v3, sel_dealloc);
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

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
    *a4 = 0;
  if (self->_archive || -[DCArchiveWriter open:](self, "open:", a4))
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
      v9 = *MEMORY[0x24BDBCC60];
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
            || (-[DCArchiveWriter basePath](self, "basePath"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v15, "isEqualToString:", v16),
                v16,
                (v17 & 1) == 0))
          {
            if (!-[DCArchiveWriter writeURL:isDirectory:error:](self, "writeURL:isDirectory:error:", v11, objc_msgSend(v13, "BOOLValue"), a4))
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
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, 0, 0, a4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v18) = -[DCArchiveWriter writeURLs:error:](self, "writeURLs:error:", v19, a4);
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

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = archive_write_finish();
  v6 = v5;
  if (a3 && v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("Unable to create archive");
    v9 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), archive_error_string(), v8, v9, CFSTR("Unable to create archive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v6, v11);
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

  v17[2] = *MEMORY[0x24BDAC8D0];
  self->_archive = (archive *)archive_write_new();
  if (-[DCArchiveWriter usesCompression](self, "usesCompression"))
    v5 = archive_write_set_compression_bzip2();
  else
    v5 = archive_write_set_compression_none();
  v6 = v5;
  if (!v5)
  {
    v7 = -[DCArchiveWriter usesCompression](self, "usesCompression")
       ? archive_write_set_format_pax()
       : archive_write_set_format_zip();
    v6 = v7;
    if (!v7)
    {
      -[DCArchiveWriter destinationURL](self, "destinationURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "fileSystemRepresentation");
      v6 = archive_write_open_filename();

    }
  }
  if (a3 && v6)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("Unable to create archive");
    v12 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), archive_error_string(), v11, v12, CFSTR("Unable to create archive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v6, v14);
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
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  id v20;
  int v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  ssize_t v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  id v39;
  char v40;
  stat v41;
  id v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  char v46[8192];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v43 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v43, *MEMORY[0x24BDBCCA0], a5);
  v8 = v43;
  v9 = objc_msgSend(v8, "BOOLValue");
  v42 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v42, *MEMORY[0x24BDBCC60], a5);
  v10 = v42;
  if (!-[DCArchiveWriter flatten](self, "flatten") || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByStandardizingPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v41, 0, sizeof(v41));
    v14 = objc_retainAutorelease(v13);
    if (lstat((const char *)objc_msgSend(v14, "fileSystemRepresentation"), &v41))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
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
    if (-[DCArchiveWriter flatten](self, "flatten"))
    {
      -[DCArchiveWriter flattenFolderName](self, "flattenFolderName");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v18 = -[__CFString length](v17, "length");
      v19 = CFSTR("archive");
      if (v18)
        v19 = v17;
      v39 = v8;
      v20 = v10;
      v21 = v9;
      v22 = v19;
      objc_msgSend(v14, "lastPathComponent");
      v23 = objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingPathComponent:](v22, "stringByAppendingPathComponent:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = v21;
      v10 = v20;
      v8 = v39;

      v14 = (id)v23;
    }
    else
    {
      -[DCArchiveWriter basePath](self, "basePath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v14, "hasPrefix:", v25);

      if (!v26)
      {
LABEL_16:
        v14 = objc_retainAutorelease(v14);
        objc_msgSend(v14, "fileSystemRepresentation");
        archive_entry_new();
        archive_entry_copy_stat();
        if (v9)
        {
          v40 = v9;
          objc_msgSend(v7, "path");
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = readlink((const char *)objc_msgSend(v27, "fileSystemRepresentation"), v46, 0x3FFuLL);

          if (v28 != -1)
          {
            v46[v28] = 0;
            archive_entry_set_symlink();
          }
          LOBYTE(v9) = v40;
        }
        archive_entry_set_pathname();
        v29 = archive_write_header();
        if (!v29)
        {
          if ((v9 & 1) == 0)
          {
            objc_msgSend(v7, "path");
            v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v37 = open((const char *)objc_msgSend(v36, "fileSystemRepresentation"), 0);

            if (read(v37, v46, 0x2000uLL) >= 1)
            {
              do
                archive_write_data();
              while (read(v37, v46, 0x2000uLL) > 0);
            }
            close(v37);
          }
          archive_entry_free();
          v11 = 1;
          goto LABEL_29;
        }
        if (a5)
        {
          v30 = (void *)MEMORY[0x24BDD1540];
          v31 = v29;
          v32 = *MEMORY[0x24BDD0FC8];
          v45[0] = CFSTR("Unable to write archive header");
          v33 = *MEMORY[0x24BDD0FD8];
          v44[0] = v32;
          v44[1] = v33;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), archive_error_string());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = v34;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v31, v35);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_23;
      }
      -[DCArchiveWriter basePath](self, "basePath");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "substringFromIndex:", -[__CFString length](v17, "length"));
      v24 = objc_claimAutoreleasedReturnValue();
    }

    v14 = (id)v24;
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
