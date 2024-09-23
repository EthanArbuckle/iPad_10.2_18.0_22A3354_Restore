@implementation DCArchiveReader

- (DCArchiveReader)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  id v6;
  id v7;
  DCArchiveReader *v8;
  uint64_t v9;
  NSString *sourcePath;
  uint64_t v11;
  NSString *destinationPath;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DCArchiveReader;
  v8 = -[DCArchiveReader init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    sourcePath = v8->_sourcePath;
    v8->_sourcePath = (NSString *)v9;

    objc_msgSend(v7, "path");
    v11 = objc_claimAutoreleasedReturnValue();
    destinationPath = v8->_destinationPath;
    v8->_destinationPath = (NSString *)v11;

    v8->_writesTemporaryFilesInsideDestination = 1;
  }

  return v8;
}

- (BOOL)unarchiveResultURLs:(id *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCArchiveReader destinationPath](self, "destinationPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, a4);

  if (v9)
  {
    -[DCArchiveReader temporaryDirectory](self, "temporaryDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4))
    {
      -[DCArchiveReader sourcePath](self, "sourcePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[DCArchiveReader unarchiveSourcePath:toDestinationPath:error:](self, "unarchiveSourcePath:toDestinationPath:error:", v11, v10, a4);

      if (v12)
      {
        -[DCArchiveReader destinationPath](self, "destinationPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[DCArchiveReader moveContentsOfDirectory:toDirectory:resultURLs:error:](self, "moveContentsOfDirectory:toDirectory:resultURLs:error:", v10, v13, a3, a4);

      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v7, "removeItemAtPath:error:", v10, 0);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)temporaryDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DCArchiveReader writesTemporaryFilesInsideDestination](self, "writesTemporaryFilesInsideDestination"))
  {
    -[DCArchiveReader destinationPath](self, "destinationPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)unarchiveSourcePath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5
{
  id v7;
  _BOOL4 v8;
  id v9;
  signed int open_filename;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unsigned int next_header;
  void *v21;
  id v22;
  int v23;
  signed int v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unsigned int data_block;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  void *v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *context;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v53 = a4;
  archive_read_new();
  MEMORY[0x212B984A0]();
  archive_read_support_format_all();
  archive_write_disk_new();
  archive_write_disk_set_standard_lookup();
  v8 = -[DCArchiveReader skipsInvisibleHeaders](self, "skipsInvisibleHeaders");
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "fileSystemRepresentation");
  v48 = v9;
  objc_msgSend(v9, "length");
  open_filename = archive_read_open_filename();
  if (open_filename)
  {
    v11 = open_filename;
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = open_filename;
    v57[0] = CFSTR("Unable to open archive");
    v14 = *MEMORY[0x24BDD0FD8];
    v56[0] = *MEMORY[0x24BDD0FC8];
    v56[1] = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), archive_error_string());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v13, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v17;
  }
  else
  {
    v18 = 0;
    v51 = *MEMORY[0x24BDD0FC8];
    v19 = 0x24BDD1000uLL;
    v52 = *MEMORY[0x24BDD0FD8];
    v50 = v8;
    while (1)
    {
      next_header = archive_read_next_header();
      if (next_header)
        break;
      context = (void *)MEMORY[0x212B98734]();
      objc_msgSend(*(id *)(v19 + 1992), "stringWithUTF8String:", archive_entry_pathname());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "stringByAppendingPathComponent:", v21);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v22, "fileSystemRepresentation");
      archive_entry_set_pathname();
      if (v8 && (objc_msgSend(v21, "hasPrefix:", CFSTR("/.")) & 1) != 0)
      {
        v11 = 0;
        v23 = 2;
      }
      else
      {
        v54 = v18;
        v24 = archive_write_header();
        if (v24)
        {
          v11 = v24;
          v25 = (void *)MEMORY[0x24BDD1540];
          v26 = v19;
          v27 = v24;
          v58[0] = v51;
          v58[1] = v52;
          v59[0] = CFSTR("Unable to write header");
          objc_msgSend(*(id *)(v26 + 1992), "stringWithFormat:", CFSTR("%s"), archive_error_string());
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v59[1] = v28;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v27, v29);
          v30 = objc_claimAutoreleasedReturnValue();

          v8 = v50;
          v23 = 3;
          v18 = (void *)v30;
        }
        else
        {
          while (1)
          {
            data_block = archive_read_data_block();
            v11 = data_block;
            if (data_block)
              break;
            if (archive_write_data_block())
            {
              v46 = (void *)MEMORY[0x24BDD1540];
              v64[0] = v51;
              v64[1] = v52;
              v65[0] = CFSTR("Unable to write data");
              objc_msgSend(*(id *)(v19 + 1992), "stringWithFormat:", CFSTR("%s"), archive_error_string());
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v65[1] = v32;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), -25, v33);
              v47 = objc_claimAutoreleasedReturnValue();

              v34 = v52;
              v35 = 0x24BDD1000;
              v54 = (void *)v47;
              v36 = v19;
              goto LABEL_17;
            }
          }
          if (data_block != 1)
          {
            v36 = v19;
            v35 = 0x24BDD1000uLL;
            v34 = v52;
LABEL_17:
            v42 = *(void **)(v35 + 1344);
            v62[1] = v34;
            v63[0] = CFSTR("Unable to read data");
            v62[0] = v51;
            objc_msgSend(*(id *)(v36 + 1992), "stringWithFormat:", CFSTR("%s"), archive_error_string());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v63[1] = v38;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v42;
            v41 = (int)v11;
LABEL_18:
            objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), v41, v39);
            v43 = objc_claimAutoreleasedReturnValue();

            v23 = 3;
            v18 = (void *)v43;
            v8 = v50;
            goto LABEL_19;
          }
          if (archive_write_finish_entry())
          {
            v37 = (void *)MEMORY[0x24BDD1540];
            v61[0] = CFSTR("Unable to finish writing data");
            v60[0] = v51;
            v60[1] = v52;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), archive_error_string());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v61[1] = v38;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v37;
            v41 = 1;
            goto LABEL_18;
          }
          v23 = 0;
        }
      }
LABEL_19:

      objc_autoreleasePoolPop(context);
      v44 = v23 == 3;
      v19 = 0x24BDD1000;
      if (v44)
        goto LABEL_24;
    }
    v11 = next_header;
  }
LABEL_24:
  archive_read_close();
  archive_read_finish();
  archive_write_close();
  archive_write_finish();
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v11 < 2;
}

- (BOOL)moveContentsOfDirectory:(id)a3 toDirectory:(id)a4 resultURLs:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v38 = v10;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "contentsOfDirectoryAtPath:error:", v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v37 = a6;
  if (*a6)
  {
    v14 = 0;
  }
  else
  {
    v31 = a5;
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v32 = v13;
    obj = v13;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v42;
      v33 = v15;
      while (2)
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v42 != v35)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v38, "stringByAppendingPathComponent:", v17, v31);
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingPathComponent:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[DCArchiveReader overwrite](self, "overwrite"))
          {
            v20 = (void *)v18;
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 0;
            v23 = objc_msgSend(v39, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v22, v21, 0, 1, &v40, v37);
            v24 = v40;
            v25 = v24;
            if (!v23)
            {

              v26 = v19;
              v15 = v33;
LABEL_21:

              v14 = 0;
              goto LABEL_22;
            }
            objc_msgSend(v24, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v33;
          }
          else
          {
            objc_msgSend(v17, "stringByDeletingPathExtension");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "pathExtension");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DCArchiveReader incrementalPathInDirectory:withFilename:andExtension:](self, "incrementalPathInDirectory:withFilename:andExtension:", v11, v27, v28);
            v20 = (void *)v18;
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v39, "moveItemAtPath:toPath:error:", v18, v26, v37) & 1) == 0)
              goto LABEL_21;
          }
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v29);

        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v36)
          continue;
        break;
      }
    }

    if (v15)
      *v31 = objc_retainAutorelease(v15);
    v14 = 1;
LABEL_22:
    v13 = v32;

  }
  return v14;
}

- (id)incrementalPathInDirectory:(id)a3 withFilename:(id)a4 andExtension:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v10, "stringByAppendingPathExtension:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "fileExistsAtPath:", v10))
  {
    v13 = 2;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %lu"), v8, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(v15, "stringByAppendingPathExtension:", v9);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      ++v13;
      v10 = v15;
    }
    while ((objc_msgSend(v12, "fileExistsAtPath:", v15) & 1) != 0);
  }
  else
  {
    v15 = v10;
  }

  return v15;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (void)setOverwrite:(BOOL)a3
{
  self->_overwrite = a3;
}

- (BOOL)writesTemporaryFilesInsideDestination
{
  return self->_writesTemporaryFilesInsideDestination;
}

- (void)setWritesTemporaryFilesInsideDestination:(BOOL)a3
{
  self->_writesTemporaryFilesInsideDestination = a3;
}

- (BOOL)skipsInvisibleHeaders
{
  return self->_skipsInvisibleHeaders;
}

- (void)setSkipsInvisibleHeaders:(BOOL)a3
{
  self->_skipsInvisibleHeaders = a3;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end
