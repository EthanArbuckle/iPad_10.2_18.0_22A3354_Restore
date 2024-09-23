@implementation ENSignatureFile

+ (id)signatureFileWithArchive:(id)a3 error:(id *)a4
{
  id v6;
  ENProtobufCoder *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(ENProtobufCoder);
  -[ENProtobufCoder setReadArchive:](v7, "setReadArchive:", v6);

  objc_msgSend(a1, "_signatureFileWithProtobufCoder:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)signatureFileWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  ENProtobufCoder *v9;
  void *v10;

  v9 = objc_alloc_init(ENProtobufCoder);
  -[ENProtobufCoder setReadMemory:length:](v9, "setReadMemory:length:", a3, a4);
  objc_msgSend(a1, "_signatureFileWithProtobufCoder:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_signatureFileWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id *v9;
  char v10;
  id v11;
  id *v12;
  uint64_t v13;
  ENSignature *v14;
  id *v15;
  ENSignature *v16;
  int v17;
  id *v18;
  int v19;
  ENSignatureFile *v20;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  unsigned __int8 v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __57__ENSignatureFile__signatureFileWithProtobufCoder_error___block_invoke;
  v29[3] = &unk_24C38B3F0;
  v29[4] = &v30;
  v29[5] = a4;
  v6 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v29);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    v8 = (void *)MEMORY[0x20BD2F320]();
    v28 = 0;
    v9 = (id *)(v31 + 5);
    obj = (id)v31[5];
    v27 = 0;
    v10 = objc_msgSend(v5, "readType:tag:eofOkay:error:", &v28, &v27, 1, &obj);
    objc_storeStrong(v9, obj);
    if ((v10 & 1) != 0)
    {
      if (v27 == 1)
      {
        v25 = 0;
        v11 = objc_retainAutorelease(v5);
        v12 = (id *)(v31 + 5);
        v24 = (id)v31[5];
        v13 = objc_msgSend(v11, "readLengthDelimited:error:", &v25, &v24);
        objc_storeStrong(v12, v24);
        if (v13)
        {
          v14 = [ENSignature alloc];
          v15 = (id *)(v31 + 5);
          v23 = (id)v31[5];
          v16 = -[ENSignature initWithBytes:length:error:](v14, "initWithBytes:length:error:", v13, v25, &v23);
          objc_storeStrong(v15, v23);
          if (v16)
          {
            objc_msgSend(v7, "addObject:", v16);

LABEL_11:
            v17 = 0;
            goto LABEL_12;
          }
        }
      }
      else
      {
        v18 = (id *)(v31 + 5);
        v22 = (id)v31[5];
        v19 = objc_msgSend(v5, "skipType:error:", v28, &v22);
        objc_storeStrong(v18, v22);
        if (v19)
          goto LABEL_11;
      }
      v17 = 1;
    }
    else if (v31[5])
    {
      v17 = 1;
    }
    else
    {
      v17 = 2;
    }
LABEL_12:
    objc_autoreleasePoolPop(v8);
  }
  while (!v17);
  if (v17 == 2)
  {
    v20 = objc_alloc_init(ENSignatureFile);
    -[ENSignatureFile setSignatures:](v20, "setSignatures:", v7);
  }
  else
  {
    v20 = 0;
  }

  v6[2](v6);
  _Block_object_dispose(&v30, 8);

  return v20;
}

id __57__ENSignatureFile__signatureFileWithProtobufCoder_error___block_invoke(uint64_t a1)
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

- (BOOL)openWithFileSystemRepresentation:(const char *)a3 reading:(BOOL)a4 error:(id *)a5
{
  FILE *v7;
  BOOL result;
  uint64_t v9;
  id v10;

  if (a4)
  {
    if (a5)
    {
      v9 = 5;
      goto LABEL_10;
    }
  }
  else if (self->_fileHandle || self->_outputData)
  {
    if (a5)
    {
      v9 = 10;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = fopen(a3, "wb");
    self->_fileHandle = v7;
    if (v7 || *__error() && !*__error())
      return 1;
    if (a5)
    {
      v9 = 2;
LABEL_10:
      ENErrorF(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a5 = v10;
      return result;
    }
  }
  return 0;
}

- (BOOL)openForWritingToData:(id)a3 error:(id *)a4
{
  id v7;
  NSMutableData **p_outputData;
  NSMutableData *outputData;
  BOOL v10;

  v7 = a3;
  if (self->_fileHandle || (outputData = self->_outputData, p_outputData = &self->_outputData, outputData))
  {
    if (a4)
    {
      ENErrorF(10);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_storeStrong((id *)p_outputData, a3);
    v10 = 1;
  }

  return v10;
}

- (BOOL)closeAndReturnError:(id *)a3
{
  NSMutableData *outputData;
  FILE *fileHandle;
  int v7;
  BOOL result;
  uint64_t v9;
  id v10;

  outputData = self->_outputData;
  if (outputData)
  {
    self->_outputData = 0;

    return 1;
  }
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    v7 = fclose(fileHandle);
    self->_fileHandle = 0;
    if (!v7)
      return 1;
    if (a3)
    {
      __error();
      v9 = 1;
      goto LABEL_10;
    }
  }
  else if (a3)
  {
    v9 = 10;
LABEL_10:
    ENErrorF(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v10;
    return result;
  }
  return 0;
}

- (BOOL)writeAndReturnError:(id *)a3
{
  __sFILE *fileHandle;
  ENProtobufCoder *v5;
  ENProtobufCoder *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ENProtobufCoder *v13;
  id v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  BOOL v19;
  _BOOL4 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  void (**v25)(_QWORD);
  NSMutableData *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __39__ENSignatureFile_writeAndReturnError___block_invoke;
  v33[3] = &unk_24C38B3F0;
  v33[4] = &v34;
  v33[5] = a3;
  v25 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v33, a2);
  fileHandle = self->_fileHandle;
  v26 = self->_outputData;
  if ((unint64_t)fileHandle | (unint64_t)v26)
  {
    v5 = objc_alloc_init(ENProtobufCoder);
    v6 = v5;
    if (fileHandle)
    {
      -[ENProtobufCoder setFileHandle:](v5, "setFileHandle:", fileHandle);
    }
    else if (v26)
    {
      -[ENProtobufCoder setWriteMutableData:](v5, "setWriteMutableData:", v26);
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_signatures;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x20BD2F320]();
          v13 = objc_alloc_init(ENProtobufCoder);
          v14 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
          -[ENProtobufCoder setWriteMutableData:](v13, "setWriteMutableData:", v14);
          v15 = (id *)(v35 + 5);
          obj = (id)v35[5];
          LOBYTE(v11) = objc_msgSend(v11, "encodeWithProtobufCoder:error:", v13, &obj);
          objc_storeStrong(v15, obj);
          v20 = 0;
          if ((v11 & 1) != 0)
          {
            v16 = objc_msgSend(v14, "length");
            if (!v16
              || (v17 = objc_msgSend(objc_retainAutorelease(v14), "bytes"),
                  v18 = (id *)(v35 + 5),
                  v27 = (id)v35[5],
                  v19 = -[ENProtobufCoder writeLengthDelimitedPtr:length:tag:error:](v6, "writeLengthDelimitedPtr:length:tag:error:", v17, v16, 1, &v27), objc_storeStrong(v18, v27), v19))
            {
              v20 = 1;
            }
          }

          objc_autoreleasePoolPop(v12);
          if (!v20)
          {
            v22 = 0;
            goto LABEL_22;
          }
          ++v10;
        }
        while (v8 != v10);
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        v8 = v21;
      }
      while (v21);
    }
    v22 = 1;
LABEL_22:

  }
  else
  {
    ENErrorF(10);
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v6 = (ENProtobufCoder *)v35[5];
    v35[5] = v24;
  }

  v25[2](v25);
  _Block_object_dispose(&v34, 8);

  return v22;
}

id __39__ENSignatureFile_writeAndReturnError___block_invoke(uint64_t a1)
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

- (NSArray)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
}

@end
