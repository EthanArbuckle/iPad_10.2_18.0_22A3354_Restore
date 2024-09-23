@implementation MFFileArchive

- (void)dealloc
{
  objc_super v3;

  -[MFFileArchive unregisterBlocks](self, "unregisterBlocks");
  v3.receiver = self;
  v3.super_class = (Class)MFFileArchive;
  -[MFFileArchive dealloc](&v3, sel_dealloc);
}

+ (id)archive
{
  return objc_alloc_init(MFFileArchive);
}

- (MFFileArchive)init
{
  MFFileArchive *v2;
  NSMutableData *v3;
  NSMutableData *outputData;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFFileArchive;
  v2 = -[MFFileArchive init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0D46100]);
    outputData = v2->_outputData;
    v2->_outputData = v3;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input range:%lu:%lu\nInput data:%lu\nOutput data:%lu"), self->_inputRange.location, self->_inputRange.length, -[NSData length](self->_inputData, "length"), -[NSMutableData length](self->_outputData, "length"));
}

- (id)_errorForArchiveStatus:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 <= -11)
  {
    switch(a3)
    {
      case -30:
        v4 = CFSTR("MFFileArchiveStatusFatal");
        goto LABEL_18;
      case -25:
        v4 = CFSTR("MFFileArchiveStatusFailed");
        goto LABEL_18;
      case -20:
        v4 = CFSTR("MFFileArchiveStatusWarn");
        goto LABEL_18;
    }
LABEL_16:
    v4 = CFSTR("MFFileArchiveStatusUnknown");
    goto LABEL_18;
  }
  if (a3 > 10000)
  {
    if (a3 == 10001)
    {
      v4 = CFSTR("MFFileArchiveStatusFailedHeaderWrite");
      goto LABEL_18;
    }
    if (a3 == 10002)
    {
      v4 = CFSTR("MFFileArchiveStatusFailedDataWrite");
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (a3 == -10)
  {
    v4 = CFSTR("MFFileArchiveStatusRetry");
    goto LABEL_18;
  }
  if (a3)
    goto LABEL_16;
  v4 = CFSTR("MFFileArchiveStatusOK");
LABEL_18:
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MFFileArchiveDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerBlocks:(id)a3 writer:(id)a4
{
  id v6;
  void *v7;
  id readerBlock;
  void *v9;
  id writerBlock;

  v6 = a4;
  v7 = _Block_copy(a3);
  readerBlock = self->_readerBlock;
  self->_readerBlock = v7;

  v9 = _Block_copy(v6);
  writerBlock = self->_writerBlock;
  self->_writerBlock = v9;

}

- (void)unregisterBlocks
{
  id readerBlock;
  id writerBlock;

  readerBlock = self->_readerBlock;
  self->_readerBlock = 0;

  writerBlock = self->_writerBlock;
  self->_writerBlock = 0;

}

- (id)_compressContents:(id)a3 error:(id *)a4
{
  id v6;
  archive *v7;
  int v8;
  NSMutableData *v9;

  v6 = a3;
  v7 = -[MFFileArchive _compressionArchive](self, "_compressionArchive");
  v8 = archive_write_open();
  if (v8
    || (v8 = -[MFFileArchive _compressContents:withArchive:error:](self, "_compressContents:withArchive:error:", v6, v7, a4)) != 0)
  {
    if (a4)
    {
      -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", v8);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = self->_outputData;
  }

  return v9;
}

- (void)compressContents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MFFileArchive_compressContents_completion___block_invoke;
  block[3] = &unk_1E4E8C1E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __45__MFFileArchive_compressContents_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "_compressContents:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend((id)a1[5], "setContents:", v4);
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)compressFolder:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  MFFileArchiveEntry *v26;
  void *v27;
  MFFileArchiveEntry *v28;
  void *v29;
  NSObject *v30;
  MFFileArchive *v32;
  id *v33;
  id v34;
  void *v35;
  NSObject *v36;
  id obj;
  uint64_t v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  uint8_t buf[4];
  uint64_t v47;
  _BYTE v48[128];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -86;
  objc_msgSend(v34, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = self;
  v33 = a4;
  v7 = objc_msgSend(v35, "fileExistsAtPath:isDirectory:", v6, &v45);
  if (v45)
    v8 = v7;
  else
    v8 = 0;

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v34, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    +[MFFileArchiveDirectory archiveDirectory](MFFileArchiveDirectory, "archiveDirectory");
    v11 = objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x1E0C999D0];
    v49[0] = *MEMORY[0x1E0C999D0];
    v36 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v34, v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v13;
    v14 = 0;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (!v15)
      goto LABEL_20;
    v16 = v10 + 1;
    v17 = *(_QWORD *)v42;
    while (1)
    {
      v18 = 0;
      v19 = v14;
      do
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
        objc_msgSend(v20, "path");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v21, "substringFromIndex:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0;
        v40 = 0;
        LOBYTE(v21) = objc_msgSend(v20, "getResourceValue:forKey:error:", &v40, v38, &v39);
        v23 = v40;
        v14 = v39;

        if ((v21 & 1) != 0)
        {
          if ((objc_msgSend(v23, "BOOLValue") & 1) != 0)
          {
            objc_msgSend(v35, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v20, 0, 0, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count") == 0;

            if (!v25)
              goto LABEL_18;
            v26 = -[MFFileArchiveEntry initWithDirectoryPath:]([MFFileArchiveEntry alloc], "initWithDirectoryPath:", v22);
            -[NSObject setArchiveEntry:](v36, "setArchiveEntry:", v26);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v20, 3, 0);
            v26 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
            v28 = -[MFFileArchiveEntry initWithContents:path:]([MFFileArchiveEntry alloc], "initWithContents:path:", v26, v22);
            -[NSObject setArchiveEntry:](v36, "setArchiveEntry:", v28);

          }
        }
        else
        {
          MFLogGeneral();
          v26 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "ef_publicDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFFileArchive compressFolder:error:].cold.1(v27, buf, &v47, &v26->super);
          }
        }

LABEL_18:
        ++v18;
        v19 = v14;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      if (!v15)
      {
LABEL_20:

        -[MFFileArchive _compressContents:error:](v32, "_compressContents:error:", v36, v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v36;
        goto LABEL_25;
      }
    }
  }
  MFLogGeneral();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[MFFileArchive compressFolder:error:].cold.2(v30);
  v29 = 0;
LABEL_25:

  return v29;
}

- (archive)_compressionArchive
{
  archive *v2;

  v2 = (archive *)archive_write_new();
  archive_write_set_format_zip();
  archive_write_set_options();
  return v2;
}

- (int)_compressContents:(id)a3 withArchive:(archive *)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a3, "archiveEntries", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if (objc_msgSend(v12, "isDirectory"))
      {
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MFFileArchive _archiveDirectoryName:withArchive:error:](self, "_archiveDirectoryName:withArchive:error:", v13, a4, a5);
      }
      else
      {
        objc_msgSend(v12, "contents");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[MFFileArchive _compressContents:fileName:withArchive:error:](self, "_compressContents:fileName:withArchive:error:", v13, v15, a4, a5);

      }
      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  return -[MFFileArchive _compressionCompleteForArchive:error:](self, "_compressionCompleteForArchive:error:", a4, a5);
}

- (int)_compressWithArchive:(archive *)a3 error:(id *)a4
{
  void (**readerBlock)(id, SEL);
  void *v8;
  int v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  int v13;
  uint8_t v15[16];

  readerBlock = (void (**)(id, SEL))self->_readerBlock;
  if (!readerBlock || !self->_writerBlock)
    return -[MFFileArchive _compressionCompleteForArchive:error:](self, "_compressionCompleteForArchive:error:", a3, a4);
  readerBlock[2](readerBlock, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFFileArchive _compressionArchiveEntryWithName:length:isDirectory:](self, "_compressionArchiveEntryWithName:length:isDirectory:", 0, objc_msgSend(v8, "length"), 0);
  v9 = archive_write_header();
  if (!v9)
  {
    while (1)
    {
      if (!objc_msgSend(v8, "length"))
      {
        v9 = 0;
        goto LABEL_15;
      }
      v10 = objc_retainAutorelease(v8);
      objc_msgSend(v10, "bytes");
      objc_msgSend(v10, "length");
      v11 = archive_write_data();
      if (v11 == -1)
        break;
      if (v11 < objc_msgSend(v10, "length"))
      {
        MFLogGeneral();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "#Attachments Failed to write entire data buffer", v15, 2u);
        }

      }
      (*((void (**)(void))self->_readerBlock + 2))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = 10002;
    v8 = v10;
  }
LABEL_15:
  archive_entry_free();

  v13 = -[MFFileArchive _compressionCompleteForArchive:error:](self, "_compressionCompleteForArchive:error:", a3, a4);
  if (!v9)
    return v13;
  return v9;
}

- (archive_entry)_compressionArchiveEntryWithName:(id)a3 length:(unint64_t)a4 isDirectory:(BOOL)a5
{
  id v5;
  archive_entry *v6;
  id v7;
  timeval v9;

  v5 = a3;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v9, 0);
  v6 = (archive_entry *)archive_entry_new();
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "fileSystemRepresentation");
  archive_entry_set_pathname();
  archive_entry_set_size();
  archive_entry_set_filetype();
  archive_entry_set_perm();
  archive_entry_set_mtime();

  return v6;
}

- (int)_compressContents:(id)a3 fileName:(id)a4 withArchive:(archive *)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v16[16];

  v9 = a3;
  v10 = a4;
  -[MFFileArchive _compressionArchiveEntryWithName:length:isDirectory:](self, "_compressionArchiveEntryWithName:length:isDirectory:", v10, objc_msgSend(v9, "length"), 0);
  if (archive_write_header())
  {
    if (a6)
    {
      -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", 10001);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 10001;
  }
  else
  {
    v12 = objc_retainAutorelease(v9);
    objc_msgSend(v12, "bytes");
    objc_msgSend(v12, "length");
    v13 = archive_write_data();
    if (v13 == -1)
    {
      v11 = 10002;
    }
    else
    {
      if (v13 < objc_msgSend(v12, "length"))
      {
        MFLogGeneral();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_INFO, "#Attachments Failed to write entire data buffer", v16, 2u);
        }

      }
      v11 = 0;
    }
  }
  archive_entry_free();

  return v11;
}

- (int)_archiveDirectoryName:(id)a3 withArchive:(archive *)a4 error:(id *)a5
{
  id v7;
  int v8;

  v7 = a3;
  -[MFFileArchive _compressionArchiveEntryWithName:length:isDirectory:](self, "_compressionArchiveEntryWithName:length:isDirectory:", v7, 0, 1);
  if (archive_write_header())
  {
    if (a5)
    {
      -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", 10001);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = 10001;
  }
  else
  {
    v8 = 0;
  }
  archive_entry_free();

  return v8;
}

- (int)_compressionCompleteForArchive:(archive *)a3 error:(id *)a4
{
  int v6;
  int v7;

  v6 = archive_write_free();
  v7 = v6;
  if (a4 && v6)
  {
    -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_decompressContents:(id)a3 inMemoryWithError:(id *)a4 mainEntry:(BOOL)a5
{
  id v7;
  archive *v8;
  id v9;
  int open_memory;
  BOOL v11;
  int v12;

  v7 = a3;
  v8 = -[MFFileArchive _decompressionArchive](self, "_decompressionArchive");
  objc_msgSend(v7, "contents");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  open_memory = archive_read_open_memory();
  if (open_memory)
  {
    if (a4)
    {
      -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", open_memory);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = -[MFFileArchive _decompressArchive:intoArchiveDirectory:error:](self, "_decompressArchive:intoArchiveDirectory:error:", v8, v7, a4);
  }
  v12 = -[MFFileArchive _decompressionCompleteForArchive:error:](self, "_decompressionCompleteForArchive:error:", v8, a4);
  if (a4 && v12)
  {
    -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)decompressContents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MFFileArchive_decompressContents_completion___block_invoke;
  block[3] = &unk_1E4E8C1E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __47__MFFileArchive_decompressContents_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_decompressContents:inMemoryWithError:mainEntry:", *(_QWORD *)(a1 + 40), 0, 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (archive)_decompressionArchive
{
  archive *v2;

  v2 = (archive *)archive_read_new();
  archive_read_support_filter_all();
  archive_read_support_format_all();
  return v2;
}

- (BOOL)_decompressArchive:(archive *)a3 intoArchiveDirectory:(id)a4 error:(id *)a5
{
  NSUInteger v7;
  char v8;
  uint64_t v9;
  int next_header;
  void *v11;
  void (**writerBlock)(id, void *, _QWORD);
  int is_set;
  uint64_t v14;
  void *v15;
  int data_block;
  MFFileArchiveEntry *v17;
  id v19;

  v19 = a4;
  v7 = NSPageSize();
  v8 = 1;
  v9 = 1000;
  while (1)
  {
    next_header = archive_read_next_header();
    if (next_header)
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", archive_entry_pathname(), 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_readerBlock)
    {
      writerBlock = (void (**)(id, void *, _QWORD))self->_writerBlock;
      if (writerBlock)
        writerBlock[2](writerBlock, v11, 0);
    }
    is_set = archive_entry_size_is_set();
    v14 = v7;
    if (is_set)
      v14 = archive_entry_size();
    objc_msgSend(MEMORY[0x1E0D46100], "dataWithCapacity:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      data_block = archive_read_data_block();
      if (data_block)
        break;
      if (self->_readerBlock && self->_writerBlock)
      {
        objc_msgSend(v15, "setLength:", 0);
        objc_msgSend(v15, "appendBytes:length:", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
        (*((void (**)(void))self->_writerBlock + 2))();
      }
      else
      {
        objc_msgSend(v15, "appendBytes:length:", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
      }
    }
    if (a5 && data_block != 1)
    {
      -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", data_block);
      v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!self->_readerBlock || !self->_writerBlock)
    {
      v17 = -[MFFileArchiveEntry initWithContents:path:]([MFFileArchiveEntry alloc], "initWithContents:path:", v15, v11);
      objc_msgSend(v19, "setArchiveEntry:", v17);

    }
    if (!--v9)
      goto LABEL_25;
  }
  if (a5 && next_header != 1)
  {
    -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", next_header);
    v8 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_25:

  return v8 & 1;
}

- (int)_decompressionCompleteForArchive:(archive *)a3 error:(id *)a4
{
  int free;
  int v7;

  free = archive_read_free();
  v7 = free;
  if (a4 && free)
  {
    -[MFFileArchive _errorForArchiveStatus:](self, "_errorForArchiveStatus:", free);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (NSData)inputData
{
  return self->_inputData;
}

- (void)setInputData:(id)a3
{
  objc_storeStrong((id *)&self->_inputData, a3);
}

- (_NSRange)inputRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_inputRange.length;
  location = self->_inputRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInputRange:(_NSRange)a3
{
  self->_inputRange = a3;
}

- (NSMutableData)outputData
{
  return self->_outputData;
}

- (void)setOutputData:(id)a3
{
  objc_storeStrong((id *)&self->_outputData, a3);
}

- (id)readerBlock
{
  return self->_readerBlock;
}

- (void)setReaderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)writerBlock
{
  return self->_writerBlock;
}

- (void)setWriterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writerBlock, 0);
  objc_storeStrong(&self->_readerBlock, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

- (void)compressFolder:(_QWORD *)a3 error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#Attachments Couldn't add file to archive. Error: %{public}@", buf, 0xCu);

}

- (void)compressFolder:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#Attachments Couldn't create archive, input is not a directory.", v1, 2u);
}

@end
