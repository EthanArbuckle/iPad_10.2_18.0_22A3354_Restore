@implementation HDEncryptedArchive

+ (id)archiveForDecryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7;
  int v8;
  AAByteStream_impl *v9;
  AAByteStream_impl *v10;
  AEAContext v11;
  AEAContext_impl *v12;
  void *v13;
  int v14;
  id v15;
  const uint8_t *v16;
  size_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id *v21;
  uint64_t v22;
  HDEncryptedArchive *v23;
  uint64_t v24;

  v7 = a4;
  v8 = dup(objc_msgSend(a3, "fileDescriptor"));
  v9 = AAFileStreamOpenWithFD(v8, 1);
  if (v9)
  {
    v10 = v9;
    v11 = AEAContextCreateWithEncryptedStream(v9);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v7, "keyDataForDecryptionWithError:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_msgSend(v7, "symmetric");
        v15 = objc_retainAutorelease(v13);
        v16 = (const uint8_t *)objc_msgSend(v15, "bytes");
        v17 = objc_msgSend(v15, "length");
        if (v14)
        {
          v18 = AEAContextSetFieldBlob(v12, 9u, 0, v16, v17);
          if ((v18 & 0x80000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 921, CFSTR("Failed to set symmetric key: %d"), v18);
            goto LABEL_14;
          }
        }
        else
        {
          v24 = AEAContextSetFieldBlob(v12, 0xBu, 1u, v16, v17);
          if ((v24 & 0x80000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 921, CFSTR("Failed to set recipient private key: %d"), v24);
            goto LABEL_14;
          }
        }
        v23 = (HDEncryptedArchive *)AEADecryptionRandomAccessInputStreamOpen(v10, v12, 0, 0, 1);
        if (v23)
          v23 = -[HDEncryptedArchive initWithContext:fileStream:byteStream:mode:]([HDEncryptedArchive alloc], "initWithContext:fileStream:byteStream:mode:", v12, v10, v23, 1);
        goto LABEL_15;
      }
LABEL_14:
      v23 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("Failed to construct context from encrypted stream.");
    v21 = a5;
    v22 = 921;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("Failed to open file stream.");
    v21 = a5;
    v22 = 922;
  }
  objc_msgSend(v19, "hk_assignError:code:format:", v21, v22, v20);
  v23 = 0;
LABEL_16:

  return v23;
}

+ (id)archiveForEncryptionWithFileHandle:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  AEAProfile v9;
  AEAContext v10;
  AEAContext_impl *v11;
  void *v12;
  int v13;
  id v14;
  const uint8_t *v15;
  size_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  HDEncryptedArchive *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  AAByteStream_impl *v24;
  void *v25;
  id *v26;
  uint64_t v27;
  uint64_t v29;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "symmetric"))
    v9 = 1;
  else
    v9 = 3;
  v10 = AEAContextCreateWithProfile(v9);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v8, "keyDataForEncryptionWithError:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_19:
      v20 = 0;
      goto LABEL_20;
    }
    v13 = objc_msgSend(v8, "symmetric");
    v14 = objc_retainAutorelease(v12);
    v15 = (const uint8_t *)objc_msgSend(v14, "bytes");
    v16 = objc_msgSend(v14, "length");
    if (v13)
    {
      v17 = AEAContextSetFieldBlob(v11, 9u, 0, v15, v16);
      if ((v17 & 0x80000000) != 0)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v29 = v17;
        v19 = CFSTR("Failed to set symmetric key: %d");
        goto LABEL_16;
      }
    }
    else
    {
      v21 = AEAContextSetFieldBlob(v11, 0xAu, 1u, v15, v16);
      if ((v21 & 0x80000000) != 0)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v29 = v21;
        v19 = CFSTR("Failed to set recipient public key: %d");
        goto LABEL_16;
      }
    }
    v22 = AEAContextSetFieldUInt(v11, 3u, 0);
    if ((v22 & 0x80000000) == 0)
    {
      v23 = dup(objc_msgSend(v7, "fileDescriptor"));
      v24 = AAFileStreamOpenWithFD(v23, 1);
      if (v24)
      {
        v20 = -[HDEncryptedArchive initWithContext:fileStream:byteStream:mode:]([HDEncryptedArchive alloc], "initWithContext:fileStream:byteStream:mode:", v11, v24, AEAEncryptionOutputStreamOpen(v24, v11, 0, 1), 0);
LABEL_20:

        goto LABEL_21;
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v19 = CFSTR("Failed to open file stream.");
      v26 = a5;
      v27 = 922;
      goto LABEL_18;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v29 = v22;
    v19 = CFSTR("Failed to set compression algorithm key: %d");
LABEL_16:
    v25 = v18;
    v26 = a5;
    v27 = 921;
LABEL_18:
    objc_msgSend(v25, "hk_assignError:code:format:", v26, v27, v19, v29);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 921, CFSTR("Failed to create context."));
  v20 = 0;
LABEL_21:

  return v20;
}

+ (BOOL)encryptContentsOfFileHandle:(id)a3 to:(id)a4 key:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  v9 = a3;
  +[HDEncryptedArchive archiveForEncryptionWithFileHandle:key:error:](HDEncryptedArchive, "archiveForEncryptionWithFileHandle:key:error:", a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    while (1)
    {
      objc_msgSend(v9, "readDataUpToLength:error:", 0x8000, a6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
        break;
      v12 = objc_msgSend(v10, "writeData:error:", v11, a6);

      if (!v12)
        goto LABEL_4;
    }

    objc_msgSend(v10, "close");
    v13 = 1;
  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

+ (id)randomSymmetricKeyWithError:(id *)a3
{
  void *v4;
  const __SecRandom *v5;
  size_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_msgSend(v4, "length");
  v7 = objc_retainAutorelease(v4);
  v8 = SecRandomCopyBytes(v5, v6, (void *)objc_msgSend(v7, "mutableBytes"));
  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 2000, CFSTR("Failed to generate random symmetric key: %d"), v8);
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (HDEncryptedArchive)initWithContext:(AEAContext_impl *)a3 fileStream:(AAByteStream_impl *)a4 byteStream:(AAByteStream_impl *)a5 mode:(int64_t)a6
{
  HDEncryptedArchive *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HDEncryptedArchive;
  result = -[HDEncryptedArchive init](&v11, sel_init);
  if (result)
  {
    result->_byteStream = a5;
    result->_mode = a6;
    result->_context = a3;
    result->_fileStream = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[HDEncryptedArchive close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HDEncryptedArchive;
  -[HDEncryptedArchive dealloc](&v3, sel_dealloc);
}

- (void)close
{
  AAByteStream_impl *byteStream;
  AAByteStream_impl *fileStream;
  AEAContext_impl *context;

  byteStream = self->_byteStream;
  if (byteStream)
  {
    AAByteStreamClose(byteStream);
    self->_byteStream = 0;
  }
  fileStream = self->_fileStream;
  if (fileStream)
  {
    AAByteStreamClose(fileStream);
    self->_fileStream = 0;
  }
  context = self->_context;
  if (context)
  {
    AEAContextDestroy(context);
    self->_context = 0;
  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id *v10;
  uint64_t v11;
  BOOL v12;
  AAByteStream_impl *byteStream;
  id v15;
  ssize_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = v6;
  if (self->_mode)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = CFSTR("Archive is not open for encryption.");
    v10 = a4;
    v11 = 126;
LABEL_3:
    objc_msgSend(v8, "hk_assignError:code:format:", v10, v11, v9, v17);
    goto LABEL_4;
  }
  byteStream = self->_byteStream;
  if (!byteStream)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = CFSTR("Archive is not open.");
    v10 = a4;
    v11 = 3;
    goto LABEL_3;
  }
  v15 = objc_retainAutorelease(v6);
  v16 = AAByteStreamWrite(byteStream, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
  if ((v16 & 0x8000000000000000) == 0)
  {
    v12 = 1;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 923, CFSTR("Failed to write encrypted data: %ld"), v16);
LABEL_4:
  v12 = 0;
LABEL_5:

  return v12;
}

- (id)readDataOfLength:(int64_t)a3 offset:(int64_t)a4 error:(id *)a5
{
  void *v9;
  AAByteStream_impl *byteStream;
  id v11;
  ssize_t v12;
  id v13;
  void *v14;
  const __CFString *v15;
  id *v16;
  uint64_t v17;

  if (self->_mode != 1)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Archive is not open for decryption.");
    v16 = a5;
    v17 = 126;
LABEL_9:
    objc_msgSend(v14, "hk_assignError:code:format:", v16, v17, v15);
    v13 = 0;
    return v13;
  }
  if (!self->_byteStream)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Archive is not open.");
    v16 = a5;
    v17 = 3;
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
  byteStream = self->_byteStream;
  v11 = objc_retainAutorelease(v9);
  v12 = AAByteStreamPRead(byteStream, (void *)objc_msgSend(v11, "mutableBytes"), a3, a4);
  if (v12 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 923, CFSTR("Failed to read encrypted data at %lld (length %ld): %ld (errno: %d)"), a4, a3, v12, *__error());
    v13 = 0;
  }
  else
  {
    if (a3 > v12)
      objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", v12, a3 - v12, 0, 0);
    v13 = v11;
  }

  return v13;
}

@end
