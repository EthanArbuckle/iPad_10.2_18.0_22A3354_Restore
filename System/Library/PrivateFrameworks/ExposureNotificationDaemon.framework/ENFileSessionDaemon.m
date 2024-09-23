@implementation ENFileSessionDaemon

- (void)dealloc
{
  objc_super v3;

  -[ENFileSessionDaemon invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ENFileSessionDaemon;
  -[ENFileSessionDaemon dealloc](&v3, sel_dealloc);
}

- (ENFileSessionDaemon)init
{
  ENFileSessionDaemon *v2;
  ENFileSessionDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENFileSessionDaemon;
  v2 = -[ENFileSessionDaemon init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ENFileSessionDaemon setBatchSize:](v2, "setBatchSize:", 0);
  return v3;
}

- (void)setBatchSize:(unint64_t)a3
{
  unint64_t v3;

  v3 = 256;
  if (a3)
    v3 = a3;
  self->_batchSize = v3;
}

- (BOOL)activateWithArchiveFD:(int)a3 error:(id *)a4
{
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *signatures;
  id v14;
  int v15;
  id v17;
  id v18;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA2F0]), "initWithFD:error:", *(_QWORD *)&a3, a4);
  if (!v6)
  {
    LOBYTE(v15) = 0;
    goto LABEL_14;
  }
  v18 = 0;
  v7 = -[ENFileSessionDaemon _resetAndAdvanceArchive:toPathWithExtension:error:](self, "_resetAndAdvanceArchive:toPathWithExtension:error:", v6, CFSTR("sig"), &v18);
  v8 = v18;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CAA3C8], "signatureFileWithArchive:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_15;
    v10 = v9;
    objc_msgSend(v9, "signatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSArray *)objc_msgSend(v11, "copy");
    signatures = self->_signatures;
    self->_signatures = v12;

  }
  else if (gLogCategory__ENFileSessionDaemon <= 50
         && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
  {
    v17 = v8;
    LogPrintF_safe();
  }
  if (-[ENFileSessionDaemon _resetAndAdvanceArchive:toPathWithExtension:error:](self, "_resetAndAdvanceArchive:toPathWithExtension:error:", v6, CFSTR("bin"), a4, v17))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CAA358]);
    v15 = objc_msgSend(v14, "openWithArchive:error:", v6, a4);
    if (v15)
    {
      objc_storeStrong((id *)&self->_archive, v6);
      objc_storeStrong((id *)&self->_file, v14);
      -[ENFileSessionDaemon _createTransaction](self, "_createTransaction");
    }

    goto LABEL_13;
  }
LABEL_15:
  LOBYTE(v15) = 0;
LABEL_13:

LABEL_14:
  return v15;
}

- (BOOL)activateWithFileFD:(int)a3 signatureData:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *signatures;
  id v17;
  int v18;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CAA3C8];
    v11 = objc_retainAutorelease(v8);
    objc_msgSend(v10, "signatureFileWithBytes:length:error:", objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      LOBYTE(v18) = 0;
      goto LABEL_7;
    }
    v13 = v12;
    objc_msgSend(v12, "signatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (NSArray *)objc_msgSend(v14, "copy");
    signatures = self->_signatures;
    self->_signatures = v15;

  }
  v17 = objc_alloc_init(MEMORY[0x1E0CAA358]);
  v18 = objc_msgSend(v17, "openWithFD:reading:error:", v6, 1, a5);
  if (v18)
  {
    objc_storeStrong((id *)&self->_file, v17);
    -[ENFileSessionDaemon _createTransaction](self, "_createTransaction");
  }

LABEL_7:
  return v18;
}

- (void)_createTransaction
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;

  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

}

- (void)invalidate
{
  ENFile *v3;
  ENFile *v4;
  char v5;
  id v6;
  ENFile *file;
  ENArchive *archive;
  OS_os_transaction *transaction;
  void *v10;
  id v11;

  v3 = self->_file;
  v4 = v3;
  if (v3)
  {
    v11 = 0;
    v5 = -[ENFile closeAndReturnError:](v3, "closeAndReturnError:", &v11);
    v6 = v11;
    if ((v5 & 1) == 0
      && gLogCategory__ENFileSessionDaemon <= 90
      && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    file = self->_file;
    self->_file = 0;

  }
  -[ENArchive close](self->_archive, "close");
  archive = self->_archive;
  self->_archive = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (BOOL)_resetAndAdvanceArchive:(id)a3 toPathWithExtension:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "resetAndReturnError:", a5))
  {
    while (1)
    {
      v9 = objc_msgSend(v7, "advanceEntryAndReturnError:", a5);
      if (!v9)
        break;
      if (objc_msgSend(v7, "entryFileType") == 0x8000)
      {
        objc_msgSend(v7, "entryPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if ((v12 & 1) != 0)
          break;
      }
      if (objc_msgSend(v7, "endOfArchive"))
      {
        if (!a5)
          goto LABEL_8;
        ENErrorF();
        LOBYTE(v9) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        break;
      }
    }
  }
  else
  {
LABEL_8:
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)readSignaturesAndReturnError:(id *)a3
{
  NSArray *v4;
  xpc_object_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  xpc_object_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = self->_signatures;
  if (v4)
  {
    v5 = xpc_array_create(0, 0);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v11, "encodeWithXPCObject:", v12, (_QWORD)v14);
          xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v12);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else if (a3)
  {
    ENErrorF();
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)readTEKBatchAndReturnError:(id *)a3
{
  OS_xpc_object *v5;
  void *v6;
  OS_xpc_object *nextTEKBatch;

  v5 = self->_nextTEKBatch;
  if (v5)
  {
    v6 = v5;
    nextTEKBatch = self->_nextTEKBatch;
    self->_nextTEKBatch = 0;

  }
  else
  {
    -[ENFileSessionDaemon _readTEKBatchAndReturnError:](self, "_readTEKBatchAndReturnError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_readTEKBatchAndReturnError:(id *)a3
{
  ENFile *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  xpc_object_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  xpc_object_t v27;
  void *v29;
  void *v30;
  id *v31;
  ENFile *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = self->_file;
  if (v5)
  {
    -[ENFile sha256Data](self->_file, "sha256Data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    v33 = v7;
    if (self->_batchSize)
    {
      v31 = a3;
      v32 = v5;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v38 = 0;
        -[ENFile readTEKAndReturnError:](v5, "readTEKAndReturnError:", &v38, v29, v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v38;
        v12 = v11;
        if (!v10)
          break;
        if (objc_msgSend(v10, "isValid"))
        {
          objc_msgSend(v7, "addObject:", v10);
        }
        else
        {
          objc_msgSend(v10, "keyData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v13;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D58], "data");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;

          if (v6)
          {
            v17 = v6;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D58], "data");
            v17 = (id)objc_claimAutoreleasedReturnValue();
          }
          v18 = v17;
          if (gLogCategory__ENFileSessionDaemon <= 90
            && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSDataHex();
            v19 = v6;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            CUPrintNSDataHex();
            v29 = v20;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

            v6 = v19;
            v5 = v32;
            v7 = v33;
          }
          ++v9;

        }
        if (++v8 >= self->_batchSize)
          goto LABEL_22;
      }
      if (v11)
      {
        v21 = 0;
        if (v31)
          *v31 = objc_retainAutorelease(v11);
        goto LABEL_32;
      }
    }
    else
    {
      v9 = 0;
    }
LABEL_22:
    self->_invalidKeyCount += v9;
    if ((self->_flags & 1) != 0)
      objc_msgSend(v7, "enRandomlyShuffle");
    v21 = xpc_array_create(0, 0);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = v7;
    v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v12);
          v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v27 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v26, "encodeWithXPCObject:", v27);
          xpc_array_set_value(v21, 0xFFFFFFFFFFFFFFFFLL, v27);

        }
        v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v23);
      v7 = v33;
    }
LABEL_32:

    goto LABEL_33;
  }
  if (a3)
  {
    ENErrorF();
    v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_33:

  return v21;
}

- (void)prepareNextTEKBatchIfNecessary
{
  OS_xpc_object *v3;
  id v4;
  OS_xpc_object *nextTEKBatch;
  void *v6;
  id v7;

  if (self->_file && !self->_nextTEKBatch)
  {
    v7 = 0;
    -[ENFileSessionDaemon _readTEKBatchAndReturnError:](self, "_readTEKBatchAndReturnError:", &v7);
    v3 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    nextTEKBatch = self->_nextTEKBatch;
    self->_nextTEKBatch = v3;

    if (!self->_nextTEKBatch
      && gLogCategory__ENFileSessionDaemon <= 90
      && (gLogCategory__ENFileSessionDaemon != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (ENFile)file
{
  return self->_file;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unint64_t)invalidKeyCount
{
  return self->_invalidKeyCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_nextTEKBatch, 0);
  objc_storeStrong((id *)&self->_archive, 0);
}

@end
