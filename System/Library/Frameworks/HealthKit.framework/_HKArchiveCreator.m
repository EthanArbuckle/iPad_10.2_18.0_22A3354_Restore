@implementation _HKArchiveCreator

- (_HKArchiveCreator)initWithURL:(id)a3 fileHandle:(id)a4 archiveType:(int64_t)a5
{
  unint64_t v8;
  unint64_t v9;
  _HKArchiveCreator *v10;
  _HKArchiveCreator *v11;
  uint64_t v12;
  NSURL *archiveURL;
  uint64_t v14;
  uint64_t v15;
  NSFileHandle *fileHandle;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)_HKArchiveCreator;
    v11 = -[_HKArchiveCreator init](&v20, sel_init);
    if (!v11)
      goto LABEL_13;
    v11->_archive = (archive *)archive_write_new();
    if (a5)
      goto LABEL_13;
    archive_write_set_format_zip();
    if (v8)
    {
      v12 = objc_msgSend((id)v8, "copy");
      archiveURL = v11->_archiveURL;
      v11->_archiveURL = (NSURL *)v12;

      -[NSURL fileSystemRepresentation](v11->_archiveURL, "fileSystemRepresentation");
      v14 = archive_write_open_filename();
    }
    else
    {
      if (!v9)
      {
        v17 = 4294967266;
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 102, CFSTR("Failed to open archive: %s (%d)"), archive_error_string(), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HKArchiveCreator _closeArchiveWithError:](v11, "_closeArchiveWithError:", v18);

LABEL_13:
        self = v11;
        v10 = self;
        goto LABEL_14;
      }
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", dup(objc_msgSend((id)v9, "fileDescriptor")), 1);
      fileHandle = v11->_fileHandle;
      v11->_fileHandle = (NSFileHandle *)v15;

      -[NSFileHandle fileDescriptor](v11->_fileHandle, "fileDescriptor");
      v14 = archive_write_open_fd();
    }
    v17 = v14;
    if (!(_DWORD)v14)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (_HKArchiveCreator)initWithURL:(id)a3 archiveType:(int64_t)a4
{
  return -[_HKArchiveCreator initWithURL:fileHandle:archiveType:](self, "initWithURL:fileHandle:archiveType:", a3, 0, a4);
}

- (_HKArchiveCreator)initWithFileHandle:(id)a3 archiveType:(int64_t)a4
{
  return -[_HKArchiveCreator initWithURL:fileHandle:archiveType:](self, "initWithURL:fileHandle:archiveType:", 0, a3, a4);
}

+ (BOOL)archiveContentsOfDirectoryAtURL:(id)a3 archiveURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  _HKArchiveCreator *v12;
  _HKArchiveCreator *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  _HKArchiveCreator *v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v39);

  if ((v11 & 1) != 0)
  {
    if (v39)
    {
      v32 = v8;
      v12 = -[_HKArchiveCreator initWithURL:archiveType:]([_HKArchiveCreator alloc], "initWithURL:archiveType:", v8, 0);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __70___HKArchiveCreator_archiveContentsOfDirectoryAtURL_archiveURL_error___block_invoke;
      v37[3] = &unk_1E37EA8D0;
      v13 = v12;
      v38 = v13;
      v31 = v9;
      objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 16, v37);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
LABEL_5:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v18);
          if (!-[_HKArchiveCreator archiveIsValid](v13, "archiveIsValid"))
            break;
          if ((objc_msgSend(v19, "hasDirectoryPath") & 1) == 0)
          {
            v20 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v19, "relativePath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "fileURLWithPath:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[_HKArchiveCreator addFileToArchive:pathInArchive:](v13, "addFileToArchive:pathInArchive:", v19, v22);
          }
          if (v16 == ++v18)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
            if (v16)
              goto LABEL_5;
            break;
          }
        }
      }

      v23 = -[_HKArchiveCreator archiveIsValid](v13, "archiveIsValid");
      if (v23)
      {
        -[_HKArchiveCreator closeArchive](v13, "closeArchive");
        v9 = v31;
        v8 = v32;
LABEL_33:

        goto LABEL_34;
      }
      -[_HKArchiveCreator error](v13, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        v28 = v26;
        v29 = a5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2000, CFSTR("Unknown error"));
        v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = a5;
        if (!v28)
        {
          v9 = v31;
          v8 = v32;
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
      }
      if (v29)
        *v29 = objc_retainAutorelease(v28);
      else
        _HKLogDroppedError(v28);
      v9 = v31;
      v8 = v32;

      if (v27)
        goto LABEL_32;
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("%@ is not a directory"), v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError(v24);
    }

  }
  v23 = 0;
LABEL_34:

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  -[_HKArchiveCreator closeArchive](self, "closeArchive");
  v3.receiver = self;
  v3.super_class = (Class)_HKArchiveCreator;
  -[_HKArchiveCreator dealloc](&v3, sel_dealloc);
}

- (BOOL)archiveIsValid
{
  return self->_archive != 0;
}

- (int64_t)writeData:(const void *)a3 ofLength:(unint64_t)a4
{
  int64_t result;

  result = (int64_t)self->_archive;
  if (result)
    return archive_write_data();
  return result;
}

- (void)addFileToArchive:(id)a3 pathInArchive:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _HKArchiveCreator *v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  if (-[_HKArchiveCreator archiveIsValid](self, "archiveIsValid"))
  {
    if ((objc_msgSend(v7, "isFileURL") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;

      if (v11)
      {
        v21 = 0;
        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v7, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        if (v13)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "longLongValue");
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke;
          v18[3] = &unk_1E37EA8F8;
          v19 = v13;
          v20 = self;
          -[_HKArchiveCreator _addDataOfSize:toPathInArchive:fromByteProvider:](self, "_addDataOfSize:toPathInArchive:fromByteProvider:", v16, v8, v18);

        }
        else
        {
          -[_HKArchiveCreator _closeArchiveWithError:](self, "_closeArchiveWithError:", v14);
        }

      }
      else
      {
        -[_HKArchiveCreator _closeArchiveWithError:](self, "_closeArchiveWithError:", v12);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@ is not a file URL"), v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKArchiveCreator _closeArchiveWithError:](self, "_closeArchiveWithError:", v17);

    }
  }

}

- (void)addDataToArchive:(id)a3 pathInArchive:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52___HKArchiveCreator_addDataToArchive_pathInArchive___block_invoke;
  v10[3] = &unk_1E37EA920;
  v11 = v6;
  v9 = v6;
  -[_HKArchiveCreator _addDataOfSize:toPathInArchive:fromByteProvider:](self, "_addDataOfSize:toPathInArchive:fromByteProvider:", v8, v7, v10);

}

- (void)_addDataOfSize:(int64_t)a3 toPathInArchive:(id)a4 fromByteProvider:(id)a5
{
  uint64_t (**v8)(id, _HKArchiveCreator *);
  uint64_t v9;
  int64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = (uint64_t (**)(id, _HKArchiveCreator *))a5;
  if (-[_HKArchiveCreator archiveIsValid](self, "archiveIsValid"))
  {
    archive_entry_new();
    objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation");
    archive_entry_set_pathname();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    time(0);
    archive_entry_set_birthtime();
    archive_entry_set_ctime();
    archive_entry_set_mtime();
    archive_entry_set_atime();
    if (archive_write_header())
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 102, CFSTR("Failed to write archive header"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8[2](v8, self);
      if (v10 >= a3)
      {
LABEL_7:
        archive_entry_free();
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 102, CFSTR("Wrote %ld bytes, expected %ld"), v10, a3);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    -[_HKArchiveCreator _closeArchiveWithError:](self, "_closeArchiveWithError:", v9);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)closeArchive
{
  -[_HKArchiveCreator _closeArchiveWithError:](self, "_closeArchiveWithError:", 0);
}

- (void)_closeArchiveWithError:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (self->_archive)
  {
    archive_write_close();
    archive_write_free();
    self->_archive = 0;
    if (v5)
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[_HKArchiveCreator _closeArchiveWithError:].cold.1((uint64_t)self, (uint64_t)v5, v6);

    }
    objc_storeStrong((id *)&self->_error, a3);
  }

}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (void)_closeArchiveWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "%@: closing archive unexpectedly: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
