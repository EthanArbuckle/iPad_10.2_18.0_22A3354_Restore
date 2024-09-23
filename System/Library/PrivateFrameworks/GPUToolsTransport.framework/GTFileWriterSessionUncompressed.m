@implementation GTFileWriterSessionUncompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileEntries:relativeToURL:options:error:", v12, v11, v10, a6);

  return v13;
}

- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  GTFileWriterSessionUncompressed *v14;
  GTFileWriterSessionUncompressed *v15;
  os_log_t v16;
  OS_os_log *log;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  objc_class *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  GTFileWriterSessionUncompressed *v56;
  GTFileWriterSessionUncompressed *v58;
  id v59;
  id v60;
  id *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id obj;
  uint64_t v67;
  objc_super v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v68.receiver = self;
  v68.super_class = (Class)GTFileWriterSessionUncompressed;
  v14 = -[GTFileWriterSessionUncompressed init](&v68, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_33;
  v61 = a6;
  v62 = v13;
  objc_storeStrong((id *)&v14->_fileEntries, a3);
  objc_storeStrong((id *)&v15->_baseURL, a4);
  v15->_currentFileIndex = 0;
  v15->_currentFileBytesWritten = 0;
  v15->_fd = -1;
  v16 = os_log_create("com.apple.gputools.transport", "FileWriterSession");
  log = v15->_log;
  v15->_log = (OS_os_log *)v16;

  v18 = v11;
  v19 = v12;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  v65 = v19;
  if (!v20)
  {
    v22 = 0;
    v36 = 1;
    goto LABEL_30;
  }
  v21 = v20;
  v58 = v15;
  v59 = v12;
  v60 = v11;
  v22 = 0;
  v67 = *(_QWORD *)v71;
  v64 = *MEMORY[0x24BDD1128];
  v63 = *MEMORY[0x24BDD0FC8];
  do
  {
    v23 = 0;
    v24 = v22;
    do
    {
      if (*(_QWORD *)v71 != v67)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v23);
      v26 = (void *)MEMORY[0x22E30C9D4]();
      v69 = v24;
      v27 = v25;
      v28 = (objc_class *)MEMORY[0x24BDBCF48];
      v29 = v19;
      v30 = [v28 alloc];
      objc_msgSend(v27, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initFileURLWithPath:isDirectory:relativeToURL:", v31, 0, v29);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "URLByDeletingLastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, 0, &v69);

      v36 = 0;
      if (v35)
      {
        objc_msgSend(v27, "destination");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "destination");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v38, "createSymbolicLinkAtPath:withDestinationPath:error:", v39, v40, &v69);

          if ((v41 & 1) != 0)
            goto LABEL_10;
LABEL_22:
          v36 = 0;
LABEL_23:
          v19 = v65;
          goto LABEL_24;
        }
        v42 = objc_alloc_init(MEMORY[0x24BDBCE50]);
        v43 = objc_msgSend(v42, "writeToURL:options:error:", v32, 0, &v69);

        if (!v43)
          goto LABEL_19;
        v44 = open((const char *)objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation"), 1, 0);
        if (v44 < 0)
        {
          v49 = (void *)MEMORY[0x24BDD1540];
          v50 = *__error();
          v75 = v63;
          v76[0] = CFSTR("Failed to open file for writing");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", v64, v50, v51);
          v69 = (id)objc_claimAutoreleasedReturnValue();

          v19 = v65;
LABEL_19:
          v36 = 0;
          goto LABEL_24;
        }
        v45 = v44;
        if (ftruncate(v44, objc_msgSend(v27, "fileSize")) < 0)
        {
          v52 = (void *)MEMORY[0x24BDD1540];
          v53 = *__error();
          v75 = v63;
          v76[0] = CFSTR("Failed to resize file");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", v64, v53, v54);
          v69 = (id)objc_claimAutoreleasedReturnValue();

          v19 = v65;
          close(v45);
          goto LABEL_19;
        }
        if (fsync(v45) < 0)
        {
          v46 = (void *)MEMORY[0x24BDD1540];
          v47 = *__error();
          v75 = v63;
          v48 = CFSTR("Failed to flush file");
        }
        else
        {
          if ((close(v45) & 0x80000000) == 0)
          {
LABEL_10:
            v36 = 1;
            goto LABEL_23;
          }
          v46 = (void *)MEMORY[0x24BDD1540];
          v47 = *__error();
          v75 = v63;
          v48 = CFSTR("Failed to close file");
        }
        v76[0] = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", v64, v47, v55);
        v69 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
LABEL_24:

      v22 = v69;
      objc_autoreleasePoolPop(v26);
      if (!v36)
        goto LABEL_28;
      ++v23;
      v24 = v22;
    }
    while (v21 != v23);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  }
  while (v21);
  v36 = 1;
LABEL_28:
  v12 = v59;
  v11 = v60;
  v15 = v58;
LABEL_30:

  v13 = v62;
  if (v61)
    *v61 = objc_retainAutorelease(v22);

  if (v36)
LABEL_33:
    v56 = v15;
  else
    v56 = 0;

  return v56;
}

- (int)_openNextFile:(id *)a3
{
  unint64_t currentFileIndex;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  currentFileIndex = self->_currentFileIndex;
  if (currentFileIndex >= -[NSArray count](self->_fileEntries, "count"))
  {
    if (!a3)
      return -1;
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD1128];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = CFSTR("No more files to write to");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 2, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = objc_alloc(MEMORY[0x24BDBCF48]);
  -[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", self->_currentFileIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initFileURLWithPath:isDirectory:relativeToURL:", v8, 0, self->_baseURL);

  v10 = objc_retainAutorelease(v9);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 1, 0);
  if (v11 < 0)
  {
    if (a3)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD1128];
      v17 = *__error();
      v20 = *MEMORY[0x24BDD0FC8];
      v21 = CFSTR("Failed to open file for writing");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:
    v12 = -1;
    goto LABEL_9;
  }
  v12 = v11;
LABEL_9:

  return v12;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = objc_retainAutorelease(a3);
  v7 = (void (**)(id, id))a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v12 = 0;
  -[GTFileWriterSessionUncompressed _writeUncompressedFileData:length:error:](self, "_writeUncompressedFileData:length:error:", v9, v10, &v12);
  v11 = v12;
  v7[2](v7, v11);

}

- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  unint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  ssize_t v16;
  unint64_t currentFileIndex;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v9 = 0;
    while (1)
    {
      v10 = -[GTFileWriterSessionUncompressed _getCurrentFileDescriptor:](self, "_getCurrentFileDescriptor:", a5);
      if (v10 < 0)
        break;
      v11 = v10;
      v12 = a4 - v9;
      -[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", self->_currentFileIndex);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "fileSize") - self->_currentFileBytesWritten;

      v15 = 0;
      if (a4 - v9 >= v14)
        v12 = v14;
      do
      {
        v16 = write(v11, &a3[v9 + v15], v12 - v15);
        if (v16 < 0)
          goto LABEL_14;
        v15 += v16;
      }
      while (v15 != v12);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_14:
        if (a5)
        {
          v22 = (void *)MEMORY[0x24BDD1540];
          v23 = *MEMORY[0x24BDD1128];
          v24 = *__error();
          v27 = *MEMORY[0x24BDD0FC8];
          v28[0] = CFSTR("Failed to write to file");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v25);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        break;
      }
      currentFileIndex = self->_currentFileIndex;
      v18 = self->_currentFileBytesWritten + v12;
      self->_currentFileBytesWritten = v18;
      -[NSArray objectAtIndexedSubscript:](self->_fileEntries, "objectAtIndexedSubscript:", currentFileIndex);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "fileSize");

      if (v18 == v20)
      {
        v21 = -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a5);
        if (!v21)
          return v21;
        ++self->_currentFileIndex;
        self->_currentFileBytesWritten = 0;
      }
      v9 += v12;
      if (v9 >= a4)
        goto LABEL_13;
    }
    LOBYTE(v21) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (int)_getCurrentFileDescriptor:(id *)a3
{
  int result;

  result = self->_fd;
  if (result < 0)
  {
    result = -[GTFileWriterSessionUncompressed _openNextFile:](self, "_openNextFile:", a3);
    self->_fd = result;
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  NSURL *baseURL;
  NSArray *fileEntries;

  baseURL = self->_baseURL;
  self->_baseURL = 0;

  fileEntries = self->_fileEntries;
  self->_fileEntries = 0;

  self->_currentFileIndex = 0;
  self->_currentFileBytesWritten = 0;
  return -[GTFileWriterSessionUncompressed _closeCurrentFileDescriptor:](self, "_closeCurrentFileDescriptor:", a3);
}

- (BOOL)_closeCurrentFileDescriptor:(id *)a3
{
  int fd;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString **v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  fd = self->_fd;
  if (fd < 0)
    return 1;
  self->_fd = -1;
  if (fsync(fd) < 0)
  {
    if (a3)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = *MEMORY[0x24BDD1128];
      v8 = *__error();
      v15 = *MEMORY[0x24BDD0FC8];
      v16[0] = CFSTR("Failed to flush file");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = (const __CFString **)v16;
      v11 = &v15;
LABEL_9:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if ((close(fd) & 0x80000000) == 0)
      return 1;
    if (a3)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = *MEMORY[0x24BDD1128];
      v8 = *__error();
      v13 = *MEMORY[0x24BDD0FC8];
      v14 = CFSTR("Failed to close file");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = &v14;
      v11 = &v13;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileEntries, 0);
}

@end
