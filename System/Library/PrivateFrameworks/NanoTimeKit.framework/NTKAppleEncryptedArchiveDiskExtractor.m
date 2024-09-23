@implementation NTKAppleEncryptedArchiveDiskExtractor

- (NTKAppleEncryptedArchiveDiskExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NTKAppleEncryptedArchiveDiskExtractor *v17;
  uint64_t v18;
  NSURL *archiveURL;
  uint64_t v20;
  NSData *symmetricKey;
  uint64_t v22;
  NSURL *outputDirectoryURL;
  uint64_t v24;
  id completion;
  dispatch_queue_t v26;
  OS_dispatch_queue *extractionQueue;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractor;
  v17 = -[NTKAppleEncryptedArchiveDiskExtractor init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    archiveURL = v17->_archiveURL;
    v17->_archiveURL = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    symmetricKey = v17->_symmetricKey;
    v17->_symmetricKey = (NSData *)v20;

    v22 = objc_msgSend(v14, "copy");
    outputDirectoryURL = v17->_outputDirectoryURL;
    v17->_outputDirectoryURL = (NSURL *)v22;

    objc_storeStrong((id *)&v17->_fileProtection, a6);
    v24 = objc_msgSend(v16, "copy");
    completion = v17->_completion;
    v17->_completion = (id)v24;

    v17->_outputStream = 0;
    objc_storeStrong((id *)&v17->_completionQueue, MEMORY[0x1E0C80D38]);
    v26 = dispatch_queue_create("com.apple.nanotimekit.facesupport.aeadiskextractor.extractionQueue", 0);
    extractionQueue = v17->_extractionQueue;
    v17->_extractionQueue = (OS_dispatch_queue *)v26;

    v17->_state = 0;
  }

  return v17;
}

- (id)errorWithCode:(void *)a1
{
  if (a1)
  {
    -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:userInfo:](a1, a2, MEMORY[0x1E0C9AA70]);
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
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveDiskExtractor"), a2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)requiredDiskSpaceWithError:(id *)a3
{
  NTKAppleEncryptedArchiveHandle *v5;
  void *v6;
  void *v7;
  NTKAppleEncryptedArchiveHandle *v8;
  uint64_t v9;
  AAArchiveStream_impl *v10;
  uint64_t i;
  int v12;
  AAHeader_impl *v13;
  AAFieldKey v14;
  uint32_t KeyIndex;
  uint64_t PayloadSize;
  void *v17;
  uint64_t v19;
  AAHeader header;

  v5 = [NTKAppleEncryptedArchiveHandle alloc];
  -[NTKAppleEncryptedArchiveDiskExtractor archiveURL](self, "archiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor symmetricKey](self, "symmetricKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKAppleEncryptedArchiveHandle initWithArchiveURL:symmetricKey:](v5, "initWithArchiveURL:symmetricKey:", v6, v7);

  v9 = -[NTKAppleEncryptedArchiveHandle openReturningError:](v8, "openReturningError:", a3);
  if (!v9)
  {
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  v10 = (AAArchiveStream_impl *)v9;
  for (i = 0; ; i += PayloadSize)
  {
    header = 0;
    v12 = AAArchiveStreamReadHeader(v10, &header);
    if (v12 != 1)
      break;
    v19 = 0;
    v13 = header;
    v14.ikey = 5917011;
    KeyIndex = AAHeaderGetKeyIndex(header, v14);
    if ((KeyIndex & 0x80000000) != 0 || AAHeaderGetFieldUInt(v13, KeyIndex, &v19) > 1)
      PayloadSize = AAHeaderGetPayloadSize(header);
    else
      PayloadSize = v19;
  }
  if (v12 && !i)
  {
    if (a3)
    {
      -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:](self, 8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NTKAppleEncryptedArchiveHandle closeReturningError:](v8, "closeReturningError:", 0);
    goto LABEL_15;
  }
  -[NTKAppleEncryptedArchiveHandle closeReturningError:](v8, "closeReturningError:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", i);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v17;
}

- (BOOL)verifyExtractedContentsWithError:(id *)a3
{
  void *v5;
  NTKAppleEncryptedArchiveVerificationHandle *v6;
  void *v7;
  void *v8;
  void *v9;
  NTKAppleEncryptedArchiveVerificationHandle *v10;
  void *v11;
  id v12;
  AAArchiveStream_impl *v13;
  AAArchiveStream_impl *v14;
  void *v15;
  ssize_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  _QWORD v28[4];
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CTM"), CFSTR("MTM"), CFSTR("BTM"), CFSTR("UID"), CFSTR("GID"), CFSTR("MOD"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [NTKAppleEncryptedArchiveVerificationHandle alloc];
  -[NTKAppleEncryptedArchiveDiskExtractor archiveURL](self, "archiveURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor symmetricKey](self, "symmetricKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor outputDirectoryURL](self, "outputDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NTKAppleEncryptedArchiveVerificationHandle initWithArchiveURL:symmetricKey:outputDirectoryURL:excludeFields:](v6, "initWithArchiveURL:symmetricKey:outputDirectoryURL:excludeFields:", v7, v8, v9, v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __74__NTKAppleEncryptedArchiveDiskExtractor_verifyExtractedContentsWithError___block_invoke;
  v28[3] = &unk_1E6BD53E0;
  v12 = v11;
  v29 = v12;
  -[NTKAppleEncryptedArchiveHandle setArchiveEntryEvent:](v10, "setArchiveEntryEvent:", v28);
  v13 = -[NTKAppleEncryptedArchiveVerificationHandle openReturningError:](v10, "openReturningError:", a3);
  if (v13)
  {
    v14 = -[NTKAppleEncryptedArchiveVerificationHandle archiveStream](v10, "archiveStream");
    -[NTKAppleEncryptedArchiveHandle archiveEntryEvent](v10, "archiveEntryEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = AAArchiveStreamProcess(v14, v13, v15, (AAEntryMessageProc)invokeBlockForArchiveEvent_0, 0xC010000000000001, 0);

    LOBYTE(v13) = v16 >= 0;
    if (v16 < 0)
    {
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, CFSTR("FailingPaths"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:userInfo:](self, 7, v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v27 = 0;
    v21 = -[NTKAppleEncryptedArchiveVerificationHandle closeReturningError:](v10, "closeReturningError:", &v27);
    v22 = v27;
    v23 = v22;
    if (!v21)
    {
      if (v17)
        v24 = v17;
      else
        v24 = v22;
      v25 = v24;

      LOBYTE(v13) = 0;
      v17 = v25;
    }
    if (a3)
      *a3 = objc_retainAutorelease(v17);

  }
  return (char)v13;
}

uint64_t __74__NTKAppleEncryptedArchiveDiskExtractor_verifyExtractedContentsWithError___block_invoke(uint64_t a1, int a2, void *a3, AAFieldKeySet_impl *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _OWORD v15[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a2 <= 71)
  {
    if (a2 != 12)
    {
      if (a2 == 71)
      {
        v10 = *(void **)(a1 + 32);
        v11 = CFSTR("-");
LABEL_10:
        objc_msgSend(v10, "setObject:forKey:", v11, v8);
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_11:
    v9 = 0xFFFFFFFFLL;
    goto LABEL_12;
  }
  if (a2 == 72)
  {
    if (!objc_msgSend(v7, "length"))
    {
      v9 = 1;
      goto LABEL_12;
    }
    v10 = *(void **)(a1 + 32);
    v11 = CFSTR("+");
    goto LABEL_10;
  }
  if (a2 == 74)
  {
    memset(v15, 0, sizeof(v15));
    AAFieldKeySetSerialize(a4, 0x7FuLL, (char *)v15);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v8);

    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

- (void)resume
{
  NTKAppleEncryptedArchiveDiskExtractor *v2;
  NTKAppleEncryptedArchiveDiskExtractionHandle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NTKAppleEncryptedArchiveDiskExtractionHandle *v8;
  uint64_t v9;
  NSObject *extractionQueue;
  NTKAppleEncryptedArchiveDiskExtractionHandle *v11;
  _QWORD block[4];
  NTKAppleEncryptedArchiveDiskExtractionHandle *v13;
  NTKAppleEncryptedArchiveDiskExtractor *v14;
  _QWORD v15[5];

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    v2->_state = 1;
  objc_sync_exit(v2);

  v3 = [NTKAppleEncryptedArchiveDiskExtractionHandle alloc];
  -[NTKAppleEncryptedArchiveDiskExtractor archiveURL](v2, "archiveURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor symmetricKey](v2, "symmetricKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor outputDirectoryURL](v2, "outputDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAppleEncryptedArchiveDiskExtractor fileProtection](v2, "fileProtection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NTKAppleEncryptedArchiveDiskExtractionHandle initWithArchiveURL:symmetricKey:outputDirectoryURL:fileProtection:](v3, "initWithArchiveURL:symmetricKey:outputDirectoryURL:fileProtection:", v4, v5, v6, v7);

  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke;
  v15[3] = &unk_1E6BD53E0;
  v15[4] = v2;
  -[NTKAppleEncryptedArchiveHandle setArchiveEntryEvent:](v8, "setArchiveEntryEvent:", v15);
  if (v2)
    extractionQueue = v2->_extractionQueue;
  else
    extractionQueue = 0;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke_2;
  block[3] = &unk_1E6BCD778;
  v13 = v8;
  v14 = v2;
  v11 = v8;
  dispatch_async(extractionQueue, block);

}

- (uint64_t)setState:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

uint64_t __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;

  v7 = a3;
  if (a2 == 22)
  {
    v10 = 0xFFFFFFFFLL;
  }
  else if (a2 == 26)
  {
    *(_BYTE *)a4 |= 8u;
    objc_msgSend(*(id *)(a1 + 32), "fileProtection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2AB0]);

    if (v9)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fileProtection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2AB8]);

      if (v13)
      {
        v10 = 0;
        v11 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "fileProtection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

        if (v15)
        {
          v10 = 0;
          v11 = 3;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "fileProtection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB2AE0]);

          v10 = 0;
          if (v17)
            v11 = 4;
          else
            v11 = -1;
        }
      }
    }
    *(_DWORD *)(a4 + 4) = v11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __47__NTKAppleEncryptedArchiveDiskExtractor_resume__block_invoke_2(uint64_t a1)
{
  void *v2;
  AAArchiveStream_impl *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  AAArchiveStream_impl *v8;
  void *v9;
  ssize_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  v22 = 0;
  v3 = (AAArchiveStream_impl *)objc_msgSend(v2, "openReturningError:", &v22);
  v4 = v22;
  v5 = *(_QWORD **)(a1 + 40);
  if (v3)
  {
    v6 = v5;
    objc_sync_enter(v6);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      *(_QWORD *)(v7 + 48) = v3;
    objc_sync_exit(v6);

    v8 = (AAArchiveStream_impl *)objc_msgSend(*(id *)(a1 + 32), "archiveStream");
    objc_msgSend(*(id *)(a1 + 32), "archiveEntryEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = AAArchiveStreamProcess(v8, v3, v9, (AAEntryMessageProc)invokeBlockForArchiveEvent_0, 0xC010000000000001, 0);

    v11 = *(id *)(a1 + 40);
    objc_sync_enter(v11);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      *(_QWORD *)(v12 + 72) = 2;
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        *(_QWORD *)(v13 + 48) = 0;
    }
    objc_sync_exit(v11);

    if (v10 < 0)
    {
      -[NTKAppleEncryptedArchiveDiskExtractor errorWithCode:](*(void **)(a1 + 40), 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v15 = *(void **)(a1 + 32);
    v21 = 0;
    v16 = objc_msgSend(v15, "closeReturningError:", &v21);
    v17 = v21;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      if (v14)
        v19 = v14;
      else
        v19 = v17;
      v20 = v19;

      v14 = v20;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(v5[5] + 16))();
  }

}

- (uint64_t)setOutputStream:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 48) = a2;
  return result;
}

- (void)cancel
{
  NTKAppleEncryptedArchiveDiskExtractor *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_state == 2)
    {
      objc_sync_exit(obj);

    }
    else
    {
      obj->_state = 2;
      objc_sync_exit(obj);

      AAArchiveStreamCancel(obj->_outputStream);
    }
  }
  else
  {
    objc_sync_exit(0);
    AAArchiveStreamCancel(0);
  }
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSURL)outputDirectoryURL
{
  return self->_outputDirectoryURL;
}

- (NSString)fileProtection
{
  return self->_fileProtection;
}

- (void)setCompletion:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
}

- (void)setExtractionQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end
