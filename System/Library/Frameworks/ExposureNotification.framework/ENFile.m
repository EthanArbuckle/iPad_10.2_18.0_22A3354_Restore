@implementation ENFile

- (void)dealloc
{
  FILE *fileHandle;
  objc_super v4;

  -[ENArchive close](self->_archive, "close");
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if (fclose(fileHandle) && *__error())
      __error();
    self->_fileHandle = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENFile;
  -[ENFile dealloc](&v4, sel_dealloc);
}

- (BOOL)openWithArchive:(id)a3 error:(id *)a4
{
  ENArchive *v6;
  ENArchive *archive;

  v6 = (ENArchive *)a3;
  if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  archive = self->_archive;
  self->_archive = v6;

  self->_reading = 1;
  return -[ENFile _readPrepareAndReturnError:](self, "_readPrepareAndReturnError:", a4);
}

- (BOOL)openWithFD:(int)a3 reading:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  const char *v9;
  FILE *v10;
  _BOOL4 v11;
  id v12;

  v6 = a4;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (v6)
    v9 = "rb";
  else
    v9 = "wb";
  v10 = fdopen(a3, v9);
  if (v10 || *__error() && !*__error())
  {
    self->_fileHandle = v10;
    self->_reading = v6;
    if (v6)
    {
      if (!-[ENFile _readPrepareAndReturnError:](self, "_readPrepareAndReturnError:", a5))
        goto LABEL_18;
      goto LABEL_15;
    }
    v11 = -[ENFile _writePrepareAndReturnError:](self, "_writePrepareAndReturnError:", a5);
    if (v11)
LABEL_15:
      LOBYTE(v11) = 1;
  }
  else
  {
    if (!a5)
    {
LABEL_18:
      LOBYTE(v11) = 0;
      return v11;
    }
    ENErrorF(2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a5 = v12;
  }
  return v11;
}

- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v13;

  v6 = a4;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
  {
    v9 = "no";
    if (v6)
      v9 = "yes";
    v13 = v9;
    LogPrintF_safe();
  }
  if (v6)
    v10 = open(a3, 0, 384, v13);
  else
    v10 = open(a3, 1537, 384, v13);
  v11 = v10;
  if ((v10 & 0x80000000) == 0 || *__error() && !*__error())
    return -[ENFile openWithFD:reading:error:](self, "openWithFD:reading:error:", v11, v6, a5);
  if (a5)
  {
    ENErrorF(2);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)openForWritingToData:(id)a3 error:(id *)a4
{
  NSMutableData *v6;
  NSMutableData *outputData;

  v6 = (NSMutableData *)a3;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  outputData = self->_outputData;
  self->_outputData = v6;

  self->_reading = 0;
  return -[ENFile _writePrepareAndReturnError:](self, "_writePrepareAndReturnError:", a4);
}

- (BOOL)closeAndReturnError:(id *)a3
{
  ENArchive *archive;
  void *outputData;
  BOOL result;
  FILE *fileHandle;
  int v9;
  uint64_t v10;
  id v11;

  archive = self->_archive;
  if (archive)
  {
    -[ENArchive close](archive, "close", a3);
    outputData = self->_archive;
    self->_archive = 0;
LABEL_5:

    return 1;
  }
  outputData = self->_outputData;
  if (outputData)
  {
    self->_outputData = 0;
    goto LABEL_5;
  }
  fileHandle = self->_fileHandle;
  if (gLogCategory_ENFile <= 30 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (fileHandle)
  {
    v9 = fclose(fileHandle);
    self->_fileHandle = 0;
    if (!v9)
      return 1;
    if (a3)
    {
      __error();
      v10 = 1;
LABEL_17:
      ENErrorF(v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v11;
      return result;
    }
  }
  else if (a3)
  {
    v10 = 10;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)_readPrepareAndReturnError:(id *)a3
{
  ENArchive *v5;
  __sFILE *fileHandle;
  NSMutableDictionary *v7;
  NSMutableDictionary *mutableMetadata;
  ENProtobufCoder *v9;
  ENProtobufCoder *v10;
  BOOL v11;
  ENProtobufCoder *v12;
  ENProtobufCoder *protobufCoder;
  uint64_t v14;

  v5 = self->_archive;
  fileHandle = self->_fileHandle;
  if (!((unint64_t)v5 | (unint64_t)fileHandle))
  {
    if (!a3)
      goto LABEL_16;
    v14 = 10;
    goto LABEL_13;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mutableMetadata = self->_mutableMetadata;
  self->_mutableMetadata = v7;

  objc_storeStrong((id *)&self->_metadata, self->_mutableMetadata);
  if (!v5)
  {
    if (fileHandle)
    {
      if (-[ENFile _readHeaderFromFile:error:](self, "_readHeaderFromFile:error:", fileHandle, a3)
        && -[ENFile _readHashFromFile:error:](self, "_readHashFromFile:error:", fileHandle, a3))
      {
        v12 = objc_alloc_init(ENProtobufCoder);
        protobufCoder = self->_protobufCoder;
        self->_protobufCoder = v12;

        -[ENProtobufCoder setFileHandle:](self->_protobufCoder, "setFileHandle:", fileHandle);
        v11 = -[ENFile _readMetadataFromFileHandle:error:](self, "_readMetadataFromFileHandle:error:", fileHandle, a3);
        goto LABEL_17;
      }
LABEL_16:
      v11 = 0;
      goto LABEL_17;
    }
    if (!a3)
      goto LABEL_16;
    v14 = 16;
LABEL_13:
    ENErrorF(v14);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!-[ENFile _readHashFromArchive:error:](self, "_readHashFromArchive:error:", v5, a3)
    || !-[ENFile _readMetadataFromArchive:error:](self, "_readMetadataFromArchive:error:", v5, a3)
    || !-[ENFile _resetAndReadHeaderFromArchive:error:](self, "_resetAndReadHeaderFromArchive:error:", v5, a3))
  {
    goto LABEL_16;
  }
  v9 = objc_alloc_init(ENProtobufCoder);
  v10 = self->_protobufCoder;
  self->_protobufCoder = v9;

  -[ENProtobufCoder setReadArchive:](self->_protobufCoder, "setReadArchive:", v5);
  v11 = 1;
LABEL_17:

  return v11;
}

- (BOOL)_resetAndReadHeaderFromArchive:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "resetToCurrentEntryAndReturnError:", a4))
    {
      v15 = 0;
      v16 = 0;
      v14 = 0;
      v7 = objc_msgSend(v6, "readDataIntoBuffer:length:error:", &v15, 16, &v14);
      v8 = v14;
      v9 = v8;
      if ((v7 & 1) != 0)
      {
        if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
          LogPrintF_safe();
        if (v15 == 0x726F707845204B45 && v16 == 0x2020202031762074)
        {
          v11 = 1;
          goto LABEL_23;
        }
        if (a4)
        {
          ENErrorF(15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
      }
      else if (a4)
      {
        ENNestedErrorF(v8, 15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v11 = 0;
        *a4 = v10;
LABEL_23:

        goto LABEL_24;
      }
      v11 = 0;
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  if (!a4)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_24;
  }
  ENErrorF(10);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v11;
}

- (BOOL)_readHeaderFromFile:(__sFILE *)a3 error:(id *)a4
{
  id v6;
  BOOL result;
  uint64_t __ptr;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  __ptr = 0;
  v10 = 0;
  if (fread(&__ptr, 1uLL, 0x10uLL, a3) != 16)
  {
    if (feof(a3))
    {
      if (!a4)
        return 0;
    }
    else
    {
      __error();
      if (!a4)
        return 0;
    }
LABEL_9:
    ENErrorF(15);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v6;
    return result;
  }
  if (gLogCategory_ENFile <= 10 && (gLogCategory_ENFile != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  if (__ptr == 0x726F707845204B45 && v10 == 0x2020202031762074)
    return 1;
  if (a4)
    goto LABEL_9;
  return 0;
}

- (BOOL)_readHashFromArchive:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  NSData *v14;
  NSData *sha256Data;
  _OWORD v17[2];
  _OWORD v18[8];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "resetToCurrentEntryAndReturnError:", a4))
  {
    v7 = ccsha256_di();
    MEMORY[0x24BDAC7A8]();
    v9 = (char *)v17 - v8;
    bzero((char *)v17 - v8, v10);
    ccdigest_init();
    memset(v18, 0, sizeof(v18));
    v11 = objc_msgSend(v6, "readDataIntoBuffer:maxLength:error:", v18, 128, a4);
    if (v11 < 0)
    {
LABEL_6:
      v13 = 0;
    }
    else
    {
      v12 = v11;
      while (v12)
      {
        ccdigest_update();
        v12 = objc_msgSend(v6, "readDataIntoBuffer:maxLength:error:", v18, 128, a4);
        if (v12 < 0)
          goto LABEL_6;
      }
      memset(v17, 0, sizeof(v17));
      (*(void (**)(uint64_t, char *, _OWORD *))(v7 + 56))(v7, v9, v17);
      v14 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v17, 32);
      sha256Data = self->_sha256Data;
      self->_sha256Data = v14;

      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_readHashFromFile:(__sFILE *)a3 error:(id *)a4
{
  int v6;
  off_t st_size;
  void *v8;
  void (**v9)(_QWORD);
  NSData *v10;
  NSData *sha256Data;
  BOOL result;
  id v13;
  void *v14;
  _QWORD v15[6];
  stat v16;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (a4)
    {
      ENErrorF(10);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    return 0;
  }
  v6 = fileno(a3);
  memset(&v16, 0, sizeof(v16));
  if (fstat(v6, &v16) && (!*__error() || *__error()))
  {
    if (!a4)
      return 0;
LABEL_13:
    NSErrorF();
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v14 = v13;
    result = 0;
    *a4 = v14;
    return result;
  }
  st_size = v16.st_size;
  if (v16.st_size == -1)
  {
    if (!a4)
      return 0;
    goto LABEL_13;
  }
  v8 = mmap(0, v16.st_size, 1, 2, v6, 0);
  if (v8 != (void *)-1 || *__error() && !*__error())
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__ENFile__readHashFromFile_error___block_invoke;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = v8;
    v15[5] = st_size;
    v9 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v15);
    memset(v17, 0, sizeof(v17));
    ccsha256_di();
    ccdigest();
    v10 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v17, 32);
    sha256Data = self->_sha256Data;
    self->_sha256Data = v10;

    v9[2](v9);
    return 1;
  }
  if (a4)
    goto LABEL_13;
  return 0;
}

uint64_t __34__ENFile__readHashFromFile_error___block_invoke(uint64_t a1)
{
  return munmap(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)_readMetadataFromArchive:(id)a3 error:(id *)a4
{
  id v6;
  ENProtobufCoder *v7;
  BOOL v8;

  v6 = a3;
  if (-[ENFile _resetAndReadHeaderFromArchive:error:](self, "_resetAndReadHeaderFromArchive:error:", v6, a4))
  {
    v7 = objc_alloc_init(ENProtobufCoder);
    -[ENProtobufCoder setReadArchive:](v7, "setReadArchive:", v6);
    v8 = -[ENFile _readMetadataFromCoder:error:](self, "_readMetadataFromCoder:error:", v7, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_readMetadataFromFileHandle:(__sFILE *)a3 error:(id *)a4
{
  void (**v7)(_QWORD);
  BOOL v8;
  _QWORD v10[6];
  fpos_t v11;

  v11 = 0;
  if (fgetpos(a3, &v11) && (!*__error() || *__error()))
  {
    if (a4)
    {
      NSErrorF();
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__ENFile__readMetadataFromFileHandle_error___block_invoke;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a3;
    v10[5] = v11;
    v7 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v10);
    v8 = -[ENFile _readMetadataFromCoder:error:](self, "_readMetadataFromCoder:error:", self->_protobufCoder, a4);
    v7[2](v7);

  }
  return v8;
}

uint64_t __44__ENFile__readMetadataFromFileHandle_error___block_invoke(uint64_t a1)
{
  return fsetpos(*(FILE **)(a1 + 32), (const fpos_t *)(a1 + 40));
}

- (BOOL)_readMetadataFromCoder:(id)a3 error:(id *)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id *v9;
  char v10;
  id *v11;
  char v12;
  void *v13;
  unsigned int v14;
  int v15;
  id *v16;
  char v17;
  void *v18;
  id *v19;
  void *v20;
  id *v21;
  char v22;
  void *v23;
  id *v24;
  char v25;
  void *v26;
  id *v27;
  int v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  unsigned __int8 v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v6 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __39__ENFile__readMetadataFromCoder_error___block_invoke;
  v43[3] = &unk_24C38B3F0;
  v43[4] = &v44;
  v43[5] = a4;
  v7 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v43);
  if (v6)
  {
    while ((~self->_metadataFlags & 0x7E) != 0)
    {
      v8 = (void *)MEMORY[0x20BD2F320]();
      v42 = 0;
      v9 = (id *)(v45 + 5);
      obj = (id)v45[5];
      v41 = 0;
      v10 = objc_msgSend(v6, "readType:tag:eofOkay:error:", &v42, &v41, 1, &obj);
      objc_storeStrong(v9, obj);
      if ((v10 & 1) != 0)
      {
        switch(v41)
        {
          case 1:
            v11 = (id *)(v45 + 5);
            v38 = (id)v45[5];
            v39 = 0;
            v12 = objc_msgSend(v6, "readFixedUInt64:error:", &v39, &v38);
            objc_storeStrong(v11, v38);
            if ((v12 & 1) == 0)
              goto LABEL_23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v39);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableMetadata, "setObject:forKeyedSubscript:", v13, CFSTR("startTS"));

            v14 = self->_metadataFlags | 2;
            goto LABEL_18;
          case 2:
            v39 = 0;
            v24 = (id *)(v45 + 5);
            v37 = (id)v45[5];
            v25 = objc_msgSend(v6, "readFixedUInt64:error:", &v39, &v37);
            objc_storeStrong(v24, v37);
            if ((v25 & 1) == 0)
              goto LABEL_23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v39);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableMetadata, "setObject:forKeyedSubscript:", v26, CFSTR("endTS"));

            v14 = self->_metadataFlags | 4;
            goto LABEL_18;
          case 3:
            v19 = (id *)(v45 + 5);
            v36 = (id)v45[5];
            objc_msgSend(v6, "readNSStringAndReturnError:", &v36);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v19, v36);
            if (!v20)
              goto LABEL_23;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableMetadata, "setObject:forKeyedSubscript:", v20, CFSTR("region"));
            self->_metadataFlags |= 8u;

            goto LABEL_20;
          case 4:
            LODWORD(v39) = 0;
            v21 = (id *)(v45 + 5);
            v35 = (id)v45[5];
            v22 = objc_msgSend(v6, "readVarIntUInt32:error:", &v39, &v35);
            objc_storeStrong(v21, v35);
            if ((v22 & 1) == 0)
              goto LABEL_23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v39);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableMetadata, "setObject:forKeyedSubscript:", v23, CFSTR("batchNum"));

            v14 = self->_metadataFlags | 0x10;
            goto LABEL_18;
          case 5:
            LODWORD(v39) = 0;
            v16 = (id *)(v45 + 5);
            v34 = (id)v45[5];
            v17 = objc_msgSend(v6, "readVarIntUInt32:error:", &v39, &v34);
            objc_storeStrong(v16, v34);
            if ((v17 & 1) == 0)
              goto LABEL_23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v39);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableMetadata, "setObject:forKeyedSubscript:", v18, CFSTR("batchSize"));

            v14 = self->_metadataFlags | 0x20;
LABEL_18:
            self->_metadataFlags = v14;
LABEL_20:
            v15 = 0;
            break;
          default:
            v27 = (id *)(v45 + 5);
            v33 = (id)v45[5];
            v28 = objc_msgSend(v6, "skipType:error:", v42, &v33);
            objc_storeStrong(v27, v33);
            if (v28)
              goto LABEL_20;
LABEL_23:
            v15 = 1;
            break;
        }
      }
      else if (v45[5])
      {
        v15 = 1;
      }
      else
      {
        v15 = 5;
      }
      objc_autoreleasePoolPop(v8);
      if (v15)
      {
        if (v15 != 5)
          goto LABEL_27;
        break;
      }
    }
    v29 = 1;
  }
  else
  {
    ENErrorF(10);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v45[5];
    v45[5] = v30;

LABEL_27:
    v29 = 0;
  }
  v7[2](v7);

  _Block_object_dispose(&v44, 8);
  return v29;
}

id __39__ENFile__readMetadataFromCoder_error___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      result = objc_retainAutorelease(result);
      **(_QWORD **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)_writePrepareAndReturnError:(id *)a3
{
  FILE *fileHandle;
  unint64_t v6;
  void *v7;
  ENProtobufCoder *v8;
  ENProtobufCoder *v9;
  ENProtobufCoder *v10;
  ENProtobufCoder *protobufCoder;
  BOOL v12;
  uint64_t v14;

  fileHandle = self->_fileHandle;
  v6 = self->_outputData;
  v7 = (void *)v6;
  if (!((unint64_t)fileHandle | v6))
  {
    if (a3)
    {
      v14 = 10;
      goto LABEL_13;
    }
LABEL_16:
    v12 = 0;
    goto LABEL_10;
  }
  if (!fileHandle)
  {
    if (v6)
    {
      objc_msgSend((id)v6, "appendBytes:length:", "EK Export v1    ", 16);
      v10 = objc_alloc_init(ENProtobufCoder);
      protobufCoder = self->_protobufCoder;
      self->_protobufCoder = v10;

      -[ENProtobufCoder setWriteMutableData:](self->_protobufCoder, "setWriteMutableData:", v7);
    }
    goto LABEL_9;
  }
  if (fwrite("EK Export v1    ", 1uLL, 0x10uLL, fileHandle) != 16 && (!*__error() || *__error()))
  {
    if (a3)
    {
      v14 = 1;
LABEL_13:
      ENErrorF(v14);
      v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  v8 = objc_alloc_init(ENProtobufCoder);
  v9 = self->_protobufCoder;
  self->_protobufCoder = v8;

  -[ENProtobufCoder setFileHandle:](self->_protobufCoder, "setFileHandle:", fileHandle);
LABEL_9:
  v12 = -[ENFile _writeMetadataAndReturnError:](self, "_writeMetadataAndReturnError:", a3);
LABEL_10:

  return v12;
}

- (BOOL)_writeMetadataAndReturnError:(id *)a3
{
  void *v5;
  BOOL v6;

  if (!self->_protobufCoder)
  {
    if (a3)
    {
      ENErrorF(12);
      v6 = 0;
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_13:
    v6 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  if (!-[ENProtobufCoder writeFixedUInt64:tag:error:](self->_protobufCoder, "writeFixedUInt64:tag:error:", CFDictionaryGetInt64(), 1, a3)|| !-[ENProtobufCoder writeFixedUInt64:tag:error:](self->_protobufCoder, "writeFixedUInt64:tag:error:", CFDictionaryGetInt64(), 2, a3))
  {
    goto LABEL_13;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (!v5 || -[ENProtobufCoder writeNSString:tag:error:](self->_protobufCoder, "writeNSString:tag:error:", v5, 3, a3))&& -[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_protobufCoder, "writeVarIntUInt32:tag:error:", CFDictionaryGetInt64Ranged(), 4, a3)&& -[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_protobufCoder, "writeVarIntUInt32:tag:error:", CFDictionaryGetInt64Ranged(), 5, a3);
LABEL_9:

  return v6;
}

- (id)readTEKAndReturnError:(id *)a3
{
  return -[ENFile readTEKWithFlags:error:](self, "readTEKWithFlags:error:", 3, a3);
}

- (id)readTEKWithFlags:(unsigned int)a3 error:(id *)a4
{
  unsigned __int8 v5;
  ENProtobufCoder *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  BOOL v11;
  BOOL v12;
  _BOOL4 v13;
  id v14;
  BOOL v15;
  void *v16;
  ENProtobufCoder *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unsigned __int8 v28;

  v5 = a3;
  v7 = self->_protobufCoder;
  if (v7)
  {
    v8 = (void *)MEMORY[0x20BD2F320]();
    v28 = 0;
    v26 = 0;
    v27 = 0;
    v9 = -[ENProtobufCoder readType:tag:eofOkay:error:](v7, "readType:tag:eofOkay:error:", &v28, &v27, 1, &v26);
    v10 = v26;
    if (v9)
    {
      while (1)
      {
        v11 = (v5 & 2) != 0 && v27 == 8;
        v12 = !v11;
        if ((v5 & (v27 == 7)) != 0 || !v12)
          break;
        v22 = v10;
        v13 = -[ENProtobufCoder skipType:error:](v7, "skipType:error:", v28, &v22);
        v14 = v22;

        if (!v13)
        {
          v16 = 0;
          goto LABEL_19;
        }
        objc_autoreleasePoolPop(v8);
        v8 = (void *)MEMORY[0x20BD2F320]();
        v28 = 0;
        v26 = v14;
        v27 = 0;
        v15 = -[ENProtobufCoder readType:tag:eofOkay:error:](v7, "readType:tag:eofOkay:error:", &v28, &v27, 1, &v26);
        v10 = v26;

        if (!v15)
          goto LABEL_13;
      }
      v25 = 0;
      v17 = objc_retainAutorelease(v7);
      v24 = v10;
      v18 = -[ENProtobufCoder readLengthDelimited:error:](v17, "readLengthDelimited:error:", &v25, &v24);
      v14 = v24;

      if (v18)
      {
        v23 = v14;
        -[ENFile _readKeyWithPtr:length:error:](self, "_readKeyWithPtr:length:error:", v18, v25, &v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23;

        v14 = v19;
      }
      else
      {
        v16 = 0;
      }
      objc_msgSend(v16, "setRevised:", v27 == 8);
    }
    else
    {
LABEL_13:
      v16 = 0;
      v14 = v10;
    }
LABEL_19:
    objc_autoreleasePoolPop(v8);
    if (a4)
    {
      if (v16)
        v20 = 0;
      else
        v20 = v14;
      *a4 = objc_retainAutorelease(v20);
    }

  }
  else if (a4)
  {
    ENErrorF(10);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_readKeyWithPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  ENProtobufCoder **p_tekProtobufCoder;
  ENProtobufCoder *v9;
  ENTemporaryExposureKey *v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  ENTemporaryExposureKey *v18;
  unsigned int v20;
  id v21;
  uint64_t v22;
  unsigned __int8 v23;

  p_tekProtobufCoder = &self->_tekProtobufCoder;
  v9 = self->_tekProtobufCoder;
  if (!v9)
  {
    v9 = objc_alloc_init(ENProtobufCoder);
    objc_storeStrong((id *)p_tekProtobufCoder, v9);
  }
  -[ENProtobufCoder setReadMemory:length:](v9, "setReadMemory:length:", a3, a4);
  v10 = objc_alloc_init(ENTemporaryExposureKey);
  v23 = 0;
  v21 = 0;
  v22 = 0;
  v11 = -[ENProtobufCoder readType:tag:eofOkay:error:](v9, "readType:tag:eofOkay:error:", &v23, &v22, 1, &v21);
  v12 = v21;
  v13 = v12;
  if (v11 || v12)
  {
    while (v11)
    {
      switch(v22)
      {
        case 1:
          -[ENProtobufCoder readNSDataAndReturnError:](v9, "readNSDataAndReturnError:", a5);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_32;
          v15 = (void *)v14;
          -[ENTemporaryExposureKey setKeyData:](v10, "setKeyData:", v14);

          break;
        case 2:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntUInt32:error:](v9, "readVarIntUInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setTransmissionRiskLevel:](v10, "setTransmissionRiskLevel:", v20);
          break;
        case 3:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntUInt32:error:](v9, "readVarIntUInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setRollingStartNumber:](v10, "setRollingStartNumber:", v20);
          break;
        case 4:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntUInt32:error:](v9, "readVarIntUInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setRollingPeriod:](v10, "setRollingPeriod:", v20);
          break;
        case 5:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntUInt32:error:](v9, "readVarIntUInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setDiagnosisReportType:](v10, "setDiagnosisReportType:", v20);
          break;
        case 6:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntSInt32:error:](v9, "readVarIntSInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setDaysSinceOnsetOfSymptoms:](v10, "setDaysSinceOnsetOfSymptoms:", (int)v20);
          break;
        case 7:
          LOBYTE(v20) = 0;
          if (!-[ENProtobufCoder readVarIntBoolean:error:](v9, "readVarIntBoolean:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setVaccinated:](v10, "setVaccinated:", v20);
          break;
        case 8:
          v20 = 0;
          if (!-[ENProtobufCoder readVarIntUInt32:error:](v9, "readVarIntUInt32:error:", &v20, a5))
            goto LABEL_32;
          -[ENTemporaryExposureKey setVariantOfConcernType:](v10, "setVariantOfConcernType:", v20);
          break;
        default:
          if (!-[ENProtobufCoder skipType:error:](v9, "skipType:error:", v23, a5))
            goto LABEL_32;
          break;
      }

      v23 = 0;
      v21 = 0;
      v22 = 0;
      v11 = -[ENProtobufCoder readType:tag:eofOkay:error:](v9, "readType:tag:eofOkay:error:", &v23, &v22, 1, &v21);
      v16 = v21;
      v13 = v16;
      if (!v11 && !v16)
        goto LABEL_27;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v13);
LABEL_32:

LABEL_33:
    v18 = 0;
    goto LABEL_29;
  }
LABEL_27:
  -[ENTemporaryExposureKey keyData](v10, "keyData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (a5)
    {
      ENErrorF(1);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  v18 = v10;
LABEL_29:

  return v18;
}

- (BOOL)writeTEK:(id)a3 error:(id *)a4
{
  return -[ENFile writeTEK:flags:error:](self, "writeTEK:flags:error:", a3, 1, a4);
}

- (BOOL)writeTEK:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  char v6;
  id v8;
  __sFILE *fileHandle;
  unint64_t v10;
  ENProtobufCoder *tekProtobufCoder;
  ENProtobufCoder *v12;
  ENProtobufCoder *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _OWORD v25[8];
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  fileHandle = self->_fileHandle;
  v10 = self->_outputData;
  if (!((unint64_t)fileHandle | v10))
  {
    if (a5)
    {
      v23 = 10;
LABEL_31:
      ENErrorF(v23);
      v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  tekProtobufCoder = self->_tekProtobufCoder;
  if (!tekProtobufCoder)
  {
    v12 = objc_alloc_init(ENProtobufCoder);
    v13 = self->_tekProtobufCoder;
    self->_tekProtobufCoder = v12;

    tekProtobufCoder = self->_tekProtobufCoder;
  }
  memset(v25, 0, sizeof(v25));
  -[ENProtobufCoder setWriteMemory:length:](tekProtobufCoder, "setWriteMemory:length:", v25, 128);
  if (objc_msgSend(v8, "daysSinceOnsetOfSymptoms") != 0x7FFFFFFFFFFFFFFFLL
    && !-[ENProtobufCoder writeVarIntSInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntSInt32:tag:error:", objc_msgSend(v8, "daysSinceOnsetOfSymptoms"), 6, a5))
  {
    goto LABEL_33;
  }
  v14 = objc_msgSend(v8, "diagnosisReportType");
  if ((_DWORD)v14)
  {
    if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", v14, 5, a5))goto LABEL_33;
  }
  objc_msgSend(v8, "keyData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && !-[ENProtobufCoder writeNSData:tag:error:](self->_tekProtobufCoder, "writeNSData:tag:error:", v15, 1, a5))
  {

    goto LABEL_33;
  }

  if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", objc_msgSend(v8, "rollingStartNumber"), 3, a5))goto LABEL_33;
  v16 = objc_msgSend(v8, "rollingPeriod");
  if ((_DWORD)v16)
  {
    if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", v16, 4, a5))goto LABEL_33;
  }
  if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", objc_msgSend(v8, "transmissionRiskLevel"), 2, a5))goto LABEL_33;
  if (!-[ENProtobufCoder writeVarIntBoolean:tag:error:](self->_tekProtobufCoder, "writeVarIntBoolean:tag:error:", objc_msgSend(v8, "vaccinated"), 7, a5))goto LABEL_33;
  v17 = objc_msgSend(v8, "variantOfConcernType");
  if ((_DWORD)v17)
  {
    if (!-[ENProtobufCoder writeVarIntUInt32:tag:error:](self->_tekProtobufCoder, "writeVarIntUInt32:tag:error:", v17, 8, a5))goto LABEL_33;
  }
  v18 = -[ENProtobufCoder writeBase](self->_tekProtobufCoder, "writeBase");
  if (!v18)
  {
    if (a5)
      goto LABEL_30;
    goto LABEL_33;
  }
  v19 = v18;
  v20 = -[ENProtobufCoder writeDst](self->_tekProtobufCoder, "writeDst");
  if (!v20)
  {
    if (a5)
    {
LABEL_30:
      v23 = 16;
      goto LABEL_31;
    }
LABEL_33:
    v22 = 0;
    goto LABEL_34;
  }
  if (v20 != v19)
  {
    v21 = (v6 & 2) != 0 ? 8 : 7;
    if (!-[ENProtobufCoder writeLengthDelimitedPtr:length:tag:error:](self->_protobufCoder, "writeLengthDelimitedPtr:length:tag:error:", v19, v20 - v19, v21, a5))goto LABEL_33;
  }
  v22 = 1;
LABEL_34:

  return v22;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)sha256Data
{
  return self->_sha256Data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha256Data, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tekProtobufCoder, 0);
  objc_storeStrong((id *)&self->_protobufCoder, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);
  objc_storeStrong((id *)&self->_archive, 0);
}

@end
