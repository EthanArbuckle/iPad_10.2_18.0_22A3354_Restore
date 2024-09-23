@implementation NTKAppleEncryptedArchiveHandle

- (NTKAppleEncryptedArchiveHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4
{
  id v6;
  id v7;
  NTKAppleEncryptedArchiveHandle *v8;
  uint64_t v9;
  NSURL *archiveURL;
  uint64_t v11;
  NSData *symmetricKey;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveHandle;
  v8 = -[NTKAppleEncryptedArchiveHandle init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    archiveURL = v8->_archiveURL;
    v8->_archiveURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    symmetricKey = v8->_symmetricKey;
    v8->_symmetricKey = (NSData *)v11;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  AAArchiveStreamClose(self->_archiveStream);
  AAByteStreamClose(self->_decryptedStream);
  AEAContextDestroy(self->_context);
  AAByteStreamClose(self->_encryptedStream);
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveHandle;
  -[NTKAppleEncryptedArchiveHandle dealloc](&v3, sel_dealloc);
}

- (id)errorWithCode:(void *)a1
{
  if (a1)
  {
    -[NTKAppleEncryptedArchiveHandle errorWithCode:userInfo:](a1, a2, MEMORY[0x1E0C9AA70]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)errorWithCode:(void *)a3 userInfo:
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v5 = (void *)objc_msgSend(a3, "mutableCopy");
    v6 = *MEMORY[0x1E0CB3308];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3308]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(a1, "archiveURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v8, v6);

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveHandleErrorDomain"), a2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  AAArchiveStream_impl *archiveStream;
  void *v6;
  void *v7;
  id v8;
  AAByteStream_impl *encryptedStream;
  AEAContext_impl *v10;
  AEAContext_impl *v11;
  id v12;
  const uint8_t *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  AAByteStream_impl *v20;
  void *v21;
  AAByteStream_impl *decryptedStream;
  void *v23;

  if (!self->_encryptedStream)
  {
    -[NTKAppleEncryptedArchiveHandle archiveURL](self, "archiveURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_encryptedStream = AAFileStreamOpenWithPath((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 16777472, 0);

    encryptedStream = self->_encryptedStream;
    if (encryptedStream)
    {
      v10 = AEAContextCreateWithEncryptedStream(encryptedStream);
      self->_context = v10;
      if (!v10)
        goto LABEL_8;
      v11 = v10;
      -[NTKAppleEncryptedArchiveHandle symmetricKey](self, "symmetricKey");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const uint8_t *)objc_msgSend(v12, "bytes");
      -[NTKAppleEncryptedArchiveHandle symmetricKey](self, "symmetricKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = AEAContextSetFieldBlob(v11, 9u, 0, v13, objc_msgSend(v14, "length"));

      if ((_DWORD)v11)
        goto LABEL_8;
      v20 = AEADecryptionInputStreamOpen(self->_encryptedStream, self->_context, 0xC010000000000001, 0);
      self->_decryptedStream = v20;
      if (v20)
      {
        -[NTKAppleEncryptedArchiveHandle archiveEntryEvent](self, "archiveEntryEvent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        decryptedStream = self->_decryptedStream;
        if (v21)
        {
          -[NTKAppleEncryptedArchiveHandle archiveEntryEvent](self, "archiveEntryEvent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          self->_archiveStream = AADecodeArchiveInputStreamOpen(decryptedStream, v23, (AAEntryMessageProc)invokeBlockForArchiveEvent, 0xC010000000000001, 0);

          archiveStream = self->_archiveStream;
        }
        else
        {
          archiveStream = AADecodeArchiveInputStreamOpen(self->_decryptedStream, 0, 0, 0xC010000000000001, 0);
          self->_archiveStream = archiveStream;
        }
        if (archiveStream)
        {
          v17 = 0;
LABEL_18:

          return archiveStream;
        }
        v15 = 3;
      }
      else
      {
LABEL_8:
        v15 = 2;
      }
    }
    else
    {
      v15 = 1;
    }
    -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AAArchiveStreamClose(self->_archiveStream);
    self->_archiveStream = 0;
    AAByteStreamClose(self->_decryptedStream);
    self->_decryptedStream = 0;
    AEAContextDestroy(self->_context);
    self->_context = 0;
    AAByteStreamClose(self->_encryptedStream);
    self->_encryptedStream = 0;
    if (a3)
    {
      if (*a3)
        v18 = *a3;
      else
        v18 = v17;
      archiveStream = 0;
      *a3 = objc_retainAutorelease(v18);
    }
    else
    {
      archiveStream = 0;
    }
    goto LABEL_18;
  }
  if (!a3)
    return 0;
  if (!*a3)
  {
    -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 6);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v16;

    return 0;
  }
  archiveStream = 0;
  *a3 = objc_retainAutorelease(*a3);
  return archiveStream;
}

- (BOOL)closeReturningError:(id *)a3
{
  int v5;
  int v6;
  const __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  BOOL v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_encryptedStream)
  {
    if (a3)
    {
      if (*a3)
      {
        v11 = 0;
        *a3 = objc_retainAutorelease(*a3);
        return v11;
      }
      -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 6);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v14;

    }
    return 0;
  }
  v5 = AAArchiveStreamClose(self->_archiveStream);
  v6 = v5;
  if (v5)
    v7 = CFSTR("archiveStream");
  else
    v7 = CFSTR("decryptedStream");
  if (v5)
    v8 = CFSTR("archiveStream");
  else
    v8 = 0;
  self->_archiveStream = 0;
  v9 = AAByteStreamClose(self->_decryptedStream);
  if (v9)
    v8 = (__CFString *)v7;
  self->_decryptedStream = 0;
  AEAContextDestroy(self->_context);
  self->_context = 0;
  if (AAByteStreamClose(self->_encryptedStream))
  {
    v10 = CFSTR("encryptedStream");
    if (v6)
      v10 = CFSTR("archiveStream");
    if (v9)
      v10 = (__CFString *)v7;
    v8 = v10;
  }
  self->_encryptedStream = 0;
  v11 = v8 == 0;
  if (a3 && v8)
  {
    if (*a3)
    {
      *a3 = objc_retainAutorelease(*a3);
    }
    else
    {
      v16 = CFSTR("failureStep");
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAppleEncryptedArchiveHandle errorWithCode:userInfo:](self, 5, v12);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v13;

    }
  }

  return v11;
}

- (NSURL)archiveURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)symmetricKey
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (id)archiveEntryEvent
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setArchiveEntryEvent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archiveEntryEvent, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end
