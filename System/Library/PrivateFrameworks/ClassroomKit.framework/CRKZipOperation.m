@implementation CRKZipOperation

- (CRKZipOperation)initWithDirectoryURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CRKZipOperation *v9;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("zip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CRKZipOperation initWithDirectoryURL:destinationZipName:](self, "initWithDirectoryURL:destinationZipName:", v5, v8);
  return v9;
}

- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CRKZipOperation *v11;
  void *v13;

  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKZipOperation.m"), 38, CFSTR("Empty zip file name"));

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CRKZipOperation initWithDirectoryURL:destinationZipURL:](self, "initWithDirectoryURL:destinationZipURL:", v8, v10);
  return v11;
}

- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipURL:(id)a4
{
  id v8;
  id v9;
  void *v10;
  CRKZipOperation *v11;
  CRKZipOperation *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKZipOperation.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKZipOperation.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zipURL"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKZipOperation;
  v11 = -[CRKZipOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_directoryURL, a3);
    objc_storeStrong((id *)&v12->_destinationZipFileURL, a4);
  }

  return v12;
}

- (void)main
{
  BOOL v3;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v14 = 0;
  v3 = -[CRKZipOperation validateParametersWithError:](self, "validateParametersWithError:", &v14);
  v4 = v14;
  v5 = v4;
  if (!v3)
    goto LABEL_5;
  v13 = v4;
  v6 = -[CRKZipOperation createDestinationDirectoryWithError:](self, "createDestinationDirectoryWithError:", &v13);
  v7 = v13;

  if (!v6)
  {
    -[CRKZipOperation endOperationWithError:](self, "endOperationWithError:", v7);
    v5 = v7;
    goto LABEL_7;
  }
  -[CRKZipOperation directoryURL](self, "directoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKZipOperation destinationZipFileURL](self, "destinationZipFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v10 = -[CRKZipOperation writeArchiveOfDirectoryAtURL:toURL:error:](self, "writeArchiveOfDirectoryAtURL:toURL:error:", v8, v9, &v12);
  v5 = v12;

  if (v10)
  {
    -[CRKZipOperation destinationZipFileURL](self, "destinationZipFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKZipOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);

  }
  else
  {
LABEL_5:
    -[CRKZipOperation endOperationWithError:](self, "endOperationWithError:", v5);
  }
LABEL_7:

}

- (BOOL)validateParametersWithError:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  BOOL result;
  void *v10;
  id v11;

  -[CRKZipOperation directoryURL](self, "directoryURL");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "fileSystemRepresentation");

  if (v6)
  {
    -[CRKZipOperation destinationZipFileURL](self, "destinationZipFileURL");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "fileSystemRepresentation");

    result = v8 != 0;
    if (a3 && !v8)
    {
      v10 = &unk_24DA07B20;
LABEL_7:
      CRKErrorWithCodeAndUserInfo(2, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v11;
    }
  }
  else
  {
    if (a3)
    {
      v10 = &unk_24DA07AF8;
      goto LABEL_7;
    }
    return 0;
  }
  return result;
}

- (BOOL)createDestinationDirectoryWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CRKZipOperation destinationZipFileURL](self, "destinationZipFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, a3);

  return (char)a3;
}

- (BOOL)writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  archive *v7;
  archive *v8;
  BOOL v9;

  v7 = -[CRKZipOperation makeArchiveWithError:](self, "makeArchiveWithError:", a5, a4);
  if (v7)
  {
    v8 = v7;
    v9 = -[CRKZipOperation populateArchive:error:](self, "populateArchive:error:", v7, a5);
    -[CRKZipOperation finalizeArchive:](self, "finalizeArchive:", v8);
    LOBYTE(v7) = v9;
  }
  return (char)v7;
}

- (archive)makeArchiveWithError:(id *)a3
{
  archive *v5;
  NSObject *v6;
  id v7;
  int v8;

  v5 = (archive *)archive_write_new();
  archive_write_set_format_zip();
  if (archive_write_set_options())
  {
    _CRKLogGeneral_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRKZipOperation makeArchiveWithError:].cold.1(self, (uint64_t)v5);

  }
  -[CRKZipOperation destinationZipFileURL](self, "destinationZipFileURL");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");
  v8 = archive_write_open_filename();

  if (v8)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    free(v5);
    return 0;
  }
  return v5;
}

- (void)finalizeArchive:(archive *)a3
{
  NSObject *v5;

  if (archive_write_free())
  {
    _CRKLogGeneral_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRKZipOperation finalizeArchive:].cold.1(self, (uint64_t)a3);

  }
}

- (BOOL)populateArchive:(archive *)a3 error:(id *)a4
{
  uint64_t disk_new;
  BOOL v8;
  NSObject *v9;

  disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  v8 = -[CRKZipOperation populateArchive:usingDisk:error:](self, "populateArchive:usingDisk:error:", a3, disk_new, a4);
  if (archive_read_free())
  {
    _CRKLogGeneral_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CRKZipOperation populateArchive:error:].cold.1(self, disk_new);

  }
  return v8;
}

- (BOOL)populateArchive:(archive *)a3 usingDisk:(archive *)a4 error:(id *)a5
{
  CRKFTSEnumeration *v9;
  void *v10;
  void *v11;
  CRKFTSEnumeration *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v25;
  CRKFTSEnumeration *v26;
  id *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = [CRKFTSEnumeration alloc];
  -[CRKZipOperation directoryURL](self, "directoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKFTSEnumeration initWithDirectoryPath:](v9, "initWithDirectoryPath:", v11);

  -[CRKFTSEnumeration entriesWithError:](v12, "entriesWithError:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v25 = v14;
      v26 = v12;
      v27 = a5;
      v17 = 0;
      v18 = *(_QWORD *)v31;
      while (2)
      {
        v19 = 0;
        v20 = v17;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19);
          v22 = (void *)MEMORY[0x219A22538]();
          v29 = v20;
          LODWORD(v21) = -[CRKZipOperation writeFTSEntry:toArchive:usingDisk:error:](self, "writeFTSEntry:toArchive:usingDisk:error:", v21, a3, a4, &v29);
          v17 = v29;

          objc_autoreleasePoolPop(v22);
          if (!(_DWORD)v21)
          {
            v23 = 0;
            goto LABEL_12;
          }
          ++v19;
          v20 = v17;
        }
        while (v16 != v19);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v16)
          continue;
        break;
      }
      v23 = 1;
LABEL_12:
      v12 = v26;
      a5 = v27;
      v14 = v25;
    }
    else
    {
      v17 = 0;
      v23 = 1;
    }

    if (a5)
      *a5 = objc_retainAutorelease(v17);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)writeFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;

  v10 = a3;
  v11 = (void *)MEMORY[0x24BDD1578];
  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v10, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileHandleForReadingFromURL:error:", v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v15
     && (v16 = objc_msgSend(v15, "fileDescriptor"),
         -[CRKZipOperation writeHeaderForFTSEntry:toArchive:usingDisk:fileDescriptor:error:](self, "writeHeaderForFTSEntry:toArchive:usingDisk:fileDescriptor:error:", v10, a4, a5, v16, a6))&& -[CRKZipOperation writeDataForFTSEntry:toArchive:fileDescriptor:error:](self, "writeDataForFTSEntry:toArchive:fileDescriptor:error:", v10, a4, v16, a6);

  return v17;
}

- (BOOL)writeHeaderForFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 fileDescriptor:(int)a6 error:(id *)a7
{
  id v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v11 = a3;
  archive_entry_new();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKZipOperation relativePathForPathOnDisk:](self, "relativePathForPathOnDisk:", v12);
  archive_entry_set_pathname();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  if (v11)
    objc_msgSend(v11, "stat", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  if (archive_read_disk_entry_from_file())
  {
    if (!a7)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (!archive_write_header())
  {
    v13 = 0;
    goto LABEL_10;
  }
  a5 = a4;
  if (a7)
  {
LABEL_8:
    -[CRKZipOperation errorFromArchive:](self, "errorFromArchive:", a5, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v13 = 1;
LABEL_10:
  archive_entry_free();

  return v13 == 0;
}

- (const)relativePathForPathOnDisk:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  size_t v8;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  -[CRKZipOperation directoryURL](self, "directoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = strlen((const char *)objc_msgSend(v7, "fileSystemRepresentation")) + v4;

  return (const char *)(v8 + 1);
}

- (BOOL)writeDataForFTSEntry:(id)a3 toArchive:(archive *)a4 fileDescriptor:(int)a5 error:(id *)a6
{
  uint64_t v7;
  int64_t v10;
  void *v11;
  BOOL v12;
  _OWORD v14[9];

  v7 = *(_QWORD *)&a5;
  if (a3)
    objc_msgSend(a3, "stat");
  else
    memset(v14, 0, sizeof(v14));
  v10 = -[CRKZipOperation lengthOfBufferForFileDescriptor:stat:](self, "lengthOfBufferForFileDescriptor:stat:", v7, v14);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKZipOperation writeDataFromFileDescriptor:toArchive:usingBuffer:error:](self, "writeDataFromFileDescriptor:toArchive:usingBuffer:error:", v7, a4, v11, a6);

  return v12;
}

- (int64_t)lengthOfBufferForFileDescriptor:(int)a3 stat:(stat *)a4
{
  off_t v5;
  off_t st_size;

  v5 = +[CRKChunkedFile preferredChunkSizeForFileDescriptor:](CRKChunkedFile, "preferredChunkSizeForFileDescriptor:", *(_QWORD *)&a3);
  if (v5 >= a4->st_size)
    st_size = a4->st_size;
  else
    st_size = v5;
  if (v5 <= 0)
    return a4->st_size;
  else
    return st_size;
}

- (BOOL)writeDataFromFileDescriptor:(int)a3 toArchive:(archive *)a4 usingBuffer:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  CRKChunkedFile *v11;
  uint64_t v12;
  BOOL v13;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = -[CRKChunkedFile initWithFileDescriptor:]([CRKChunkedFile alloc], "initWithFileDescriptor:", v8);
  do
  {
    v12 = -[CRKChunkedFile readNextChunkIntoBuffer:error:](v11, "readNextChunkIntoBuffer:error:", v10, a6);
    if (v12 < 1)
    {
      v13 = v12 == 0;
      goto LABEL_8;
    }
    objc_msgSend(objc_retainAutorelease(v10), "bytes");
  }
  while (archive_write_data() != -1);
  if (a6)
  {
    -[CRKZipOperation errorFromArchive:](self, "errorFromArchive:", a4);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)errorFromArchive:(archive *)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = archive_errno();
  v4 = archive_error_string();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v10 = *MEMORY[0x24BDD0FC8];
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)destinationZipFileURL
{
  return self->_destinationZipFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationZipFileURL, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

- (void)makeArchiveWithError:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "errorFromArchive:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v3, v4, "Failed to set compression type to deflate: %{public}@", v5, v6, v7, v8, 2u);

}

- (void)finalizeArchive:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "errorFromArchive:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v4, v5, "Failed to finalize archive: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)populateArchive:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "errorFromArchive:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v4, v5, "Failed to close disk archive: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
