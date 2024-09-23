@implementation NTKAppleEncryptedArchiveMemoryExtractor

- (NTKAppleEncryptedArchiveMemoryExtractor)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 extractingFileAtArchivedPath:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NTKAppleEncryptedArchiveMemoryExtractor *v14;
  uint64_t v15;
  NSURL *archiveURL;
  uint64_t v17;
  NSData *symmetricKey;
  uint64_t v19;
  NSString *targetArchivedPath;
  uint64_t v21;
  id completion;
  dispatch_queue_t v23;
  OS_dispatch_queue *extractionQueue;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NTKAppleEncryptedArchiveMemoryExtractor;
  v14 = -[NTKAppleEncryptedArchiveMemoryExtractor init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    archiveURL = v14->_archiveURL;
    v14->_archiveURL = (NSURL *)v15;

    v17 = objc_msgSend(v11, "copy");
    symmetricKey = v14->_symmetricKey;
    v14->_symmetricKey = (NSData *)v17;

    v19 = objc_msgSend(v12, "copy");
    targetArchivedPath = v14->_targetArchivedPath;
    v14->_targetArchivedPath = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    completion = v14->_completion;
    v14->_completion = (id)v21;

    v14->_outputStream = 0;
    objc_storeStrong((id *)&v14->_completionQueue, MEMORY[0x1E0C80D38]);
    v23 = dispatch_queue_create("com.apple.nanotimekit.facesupport.aeamemoryextractor.extractionQueue", 0);
    extractionQueue = v14->_extractionQueue;
    v14->_extractionQueue = (OS_dispatch_queue *)v23;

    v14->_state = 0;
  }

  return v14;
}

- (void)resume
{
  NTKAppleEncryptedArchiveMemoryExtractor *v2;
  NSObject *extractionQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    v2->_state = 1;
    objc_sync_exit(v2);

    extractionQueue = v2->_extractionQueue;
  }
  else
  {
    objc_sync_exit(0);
    extractionQueue = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = v2;
  dispatch_async(extractionQueue, block);
}

- (uint64_t)setState:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 64) = a2;
  return result;
}

- (uint64_t)extractionQueue
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void (**v6)(void *, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  AAByteStream v10;
  AAByteStream_impl *v11;
  void *v12;
  AEAContext v13;
  AEAContext_impl *v14;
  void *v15;
  id v16;
  const uint8_t *v17;
  void *v18;
  AAByteStream v19;
  AAByteStream_impl *v20;
  void *v21;
  AAArchiveStream v22;
  AAArchiveStream_impl *v23;
  void *v24;
  AAArchiveStream v25;
  AAArchiveStream_impl *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  ssize_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD *v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD aBlock[4];
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_2;
  aBlock[3] = &unk_1E6BCDCE0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v78 = v4;
  v79 = v5;
  v6 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "archiveURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = objc_retainAutorelease(v9);
  v10 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v70, "fileSystemRepresentation"), 16777472, 0);
  v11 = v10;
  if (v10)
  {
    v76[0] = v3;
    v76[1] = 3221225472;
    v76[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_4;
    v76[3] = &__block_descriptor_40_e5_v8__0l;
    v76[4] = v10;
    v12 = _Block_copy(v76);
    objc_msgSend(v4, "addObject:", v12);

    v13 = AEAContextCreateWithEncryptedStream(v11);
    v14 = v13;
    if (v13)
    {
      v75[0] = v3;
      v75[1] = 3221225472;
      v75[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_5;
      v75[3] = &__block_descriptor_40_e5_v8__0l;
      v75[4] = v13;
      v15 = _Block_copy(v75);
      objc_msgSend(v4, "addObject:", v15);

      objc_msgSend(*(id *)(a1 + 32), "symmetricKey");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const uint8_t *)objc_msgSend(v16, "bytes");
      objc_msgSend(*(id *)(a1 + 32), "symmetricKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AEAContextSetFieldBlob(v14, 9u, 0, v17, objc_msgSend(v18, "length"));

      v19 = AEADecryptionInputStreamOpen(v11, v14, 0xC000000000000001, 0);
      v20 = v19;
      if (v19)
      {
        v74[0] = v3;
        v74[1] = 3221225472;
        v74[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_6;
        v74[3] = &__block_descriptor_40_e5_v8__0l;
        v74[4] = v19;
        v21 = _Block_copy(v74);
        objc_msgSend(v4, "addObject:", v21);

        v22 = AADecodeArchiveInputStreamOpen(v20, 0, (AAEntryMessageProc)archiveEvent, 0xC000000000000001, 0);
        v23 = v22;
        if (v22)
        {
          v73[0] = v3;
          v73[1] = 3221225472;
          v73[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_7;
          v73[3] = &__block_descriptor_40_e5_v8__0l;
          v73[4] = v22;
          v24 = _Block_copy(v73);
          objc_msgSend(v4, "addObject:", v24);

          v25 = AACustomArchiveStreamOpen();
          v26 = v25;
          if (v25)
          {
            v72[0] = v3;
            v72[1] = 3221225472;
            v72[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_8;
            v72[3] = &__block_descriptor_40_e5_v8__0l;
            v72[4] = v25;
            v27 = _Block_copy(v72);
            objc_msgSend(v4, "addObject:", v27);

            AACustomArchiveStreamSetData(v26, *(id *)(a1 + 32));
            AACustomArchiveStreamSetWriteHeaderProc(v26, (AAArchiveStreamWriteHeaderProc)_NTKAppleEncryptedArchiveMemoryExtractorWriteHeader);
            AACustomArchiveStreamSetWriteBlobProc(v26, (AAArchiveStreamWriteBlobProc)_NTKAppleEncryptedArchiveMemoryExtractorWriteBlob);
            AACustomArchiveStreamSetCancelProc(v26, (AAArchiveStreamCancelProc)_NTKAppleEncryptedArchiveMemoryExtractorCancel);
            AACustomArchiveStreamSetCloseProc(v26, (AAArchiveStreamCloseProc)_NTKAppleEncryptedArchiveMemoryExtractorClose);
            v28 = *(id *)(a1 + 32);
            objc_sync_enter(v28);
            v29 = *(_QWORD *)(a1 + 32);
            if (v29)
              *(_QWORD *)(v29 + 40) = v26;
            objc_sync_exit(v28);

            v71[0] = v3;
            v71[1] = 3221225472;
            v71[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_9;
            v71[3] = &unk_1E6BCD5F0;
            v71[4] = *(_QWORD *)(a1 + 32);
            v30 = _Block_copy(v71);
            objc_msgSend(v4, "addObject:", v30);

            v31 = AAArchiveStreamProcess(v23, v26, 0, (AAEntryMessageProc)archiveEvent, 0, 0);
            v32 = *(id *)(a1 + 32);
            objc_sync_enter(v32);
            if (*(_QWORD *)(a1 + 32)
              && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 4, (v33 = *(_QWORD *)(a1 + 32)) != 0)
              && (v34 = *(id *)(v33 + 72)) != 0)
            {
              v35 = v34;
              v36 = (void *)MEMORY[0x1E0C99D50];
              v37 = *(_QWORD **)(a1 + 32);
              if (v37)
                v37 = (_QWORD *)v37[9];
              v38 = v37;
              objc_msgSend(v36, "dataWithData:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v39 = 0;
            }
            v60 = *(_QWORD **)(a1 + 32);
            if (v60)
              v60 = (_QWORD *)v60[10];
            v61 = v60;
            objc_sync_exit(v32);

            if (v31 < 0)
            {
              v62 = (void *)MEMORY[0x1E0CB35C8];
              v82 = *MEMORY[0x1E0CB3308];
              objc_msgSend(*(id *)(a1 + 32), "archiveURL");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = v63;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 4, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v6[2](v6, 0, v65);

            }
            else if (v39)
            {
              ((void (**)(void *, void *, void *))v6)[2](v6, v39, 0);
            }
            else if (v61)
            {
              v6[2](v6, 0, v61);
            }
            else
            {
              v66 = (void *)MEMORY[0x1E0CB35C8];
              v80 = *MEMORY[0x1E0CB3308];
              objc_msgSend(*(id *)(a1 + 32), "archiveURL");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = v67;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 5, v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v6[2](v6, 0, v69);

            }
          }
          else
          {
            v56 = (void *)MEMORY[0x1E0CB35C8];
            v84 = *MEMORY[0x1E0CB3308];
            objc_msgSend(*(id *)(a1 + 32), "archiveURL");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 4, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, 0, v59);

          }
        }
        else
        {
          v52 = (void *)MEMORY[0x1E0CB35C8];
          v86 = *MEMORY[0x1E0CB3308];
          objc_msgSend(*(id *)(a1 + 32), "archiveURL");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 2, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, 0, v55);

        }
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v88 = *MEMORY[0x1E0CB3308];
        objc_msgSend(*(id *)(a1 + 32), "archiveURL");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 2, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, 0, v51);

      }
    }
    else
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v90 = *MEMORY[0x1E0CB3308];
      objc_msgSend(*(id *)(a1 + 32), "archiveURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 2, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v47);

    }
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB3308];
    objc_msgSend(*(id *)(a1 + 32), "archiveURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("NTKAppleEncryptedArchiveMemoryExtractor"), 1, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v43);

  }
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    v13 = *(NSObject **)(v12 + 48);
  else
    v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_3;
  block[3] = &unk_1E6BCDCB8;
  block[4] = *(_QWORD *)(a1 + 40);
  v17 = v5;
  v18 = v6;
  v14 = v6;
  v15 = v5;
  dispatch_async(v13, block);

}

- (uint64_t)completionQueue
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1[4] + 32) + 16))(*(_QWORD *)(a1[4] + 32), a1[5], a1[6]);
}

- (uint64_t)completion
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_4(uint64_t a1)
{
  return AAByteStreamClose(*(AAByteStream *)(a1 + 32));
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_5(uint64_t a1)
{
  AEAContextDestroy(*(AEAContext *)(a1 + 32));
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_6(uint64_t a1)
{
  return AAByteStreamClose(*(AAByteStream *)(a1 + 32));
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_7(uint64_t a1)
{
  return AAArchiveStreamClose(*(AAArchiveStream *)(a1 + 32));
}

uint64_t __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_8(uint64_t a1)
{
  return AAArchiveStreamClose(*(AAArchiveStream *)(a1 + 32));
}

- (uint64_t)setOutputStream:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 40) = a2;
  return result;
}

void __49__NTKAppleEncryptedArchiveMemoryExtractor_resume__block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_QWORD *)(v2 + 40) = 0;
  objc_sync_exit(obj);

}

- (uint64_t)outputData
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)outputError
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (void)cancel
{
  NTKAppleEncryptedArchiveMemoryExtractor *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj)
  {
    if (obj->_state == 4)
    {
      objc_sync_exit(obj);

    }
    else
    {
      obj->_state = 4;
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

- (uint64_t)state
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)outputStream
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSString)targetArchivedPath
{
  return self->_targetArchivedPath;
}

- (void)setCompletion:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
}

- (void)setCompletionQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setExtractionQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setOutputData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setOutputError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputError, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_extractionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_targetArchivedPath, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end
