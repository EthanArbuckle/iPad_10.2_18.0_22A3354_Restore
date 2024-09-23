@implementation HMSoftwareUpdateDocumentationManager

- (HMSoftwareUpdateDocumentationManager)initWithContext:(id)a3
{
  id v5;
  HMSoftwareUpdateDocumentationManager *v6;
  HMSoftwareUpdateDocumentationManager *v7;
  uint64_t v8;
  NSMutableDictionary *assetCompletionPairByDigestUUID;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMSoftwareUpdateDocumentationManager;
  v6 = -[HMSoftwareUpdateDocumentationManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    assetCompletionPairByDigestUUID = v7->_assetCompletionPairByDigestUUID;
    v7->_assetCompletionPairByDigestUUID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString(v7, 0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (id)assetForMetadataFromDisk:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  HMSoftwareUpdateDocumentationManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _UNKNOWN **v33;
  void *v34;
  void *v35;
  HMSoftwareUpdateDocumentationManager *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  HMSoftwareUpdateDocumentationManager *v45;
  id v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v45 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing cached assets", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &off_1E3AAB000;
  +[HMSoftwareUpdateDocumentationAsset assetDirectoryURL](HMSoftwareUpdateDocumentationAsset, "assetDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, 0, 0, &v52);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v52;

  v41 = v11;
  if (v10)
  {
    objc_msgSend(v46, "metadataDigestUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v13)
    {
      v14 = v13;
      v40 = v10;
      v15 = *(_QWORD *)v49;
      v42 = v12;
      do
      {
        v16 = 0;
        v44 = v14;
        do
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
          objc_msgSend(v17, "lastPathComponent", v40, v41);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            objc_msgSend(v8[457], "assetWithURL:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              objc_msgSend(v21, "metadata");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "URL");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "URL");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "isEqual:", v25);

              if ((v26 & 1) != 0)
                goto LABEL_19;
              v27 = (void *)MEMORY[0x1A1AC1AAC]();
              v28 = v45;
              HMFGetOSLogHandle();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "URL");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "metadata");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "URL");
                v43 = v27;
                v33 = v8;
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v54 = v30;
                v55 = 2112;
                v56 = v31;
                v57 = 2112;
                v58 = v34;
                _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Remote URL in the metadata %@ and in the asset %@ did not match", buf, 0x20u);

                v8 = v33;
                v27 = v43;

                v12 = v42;
              }

              objc_autoreleasePoolPop(v27);
              v14 = v44;
            }

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v14);
      v22 = 0;
LABEL_19:
      v10 = v40;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = v45;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v38;
      v55 = 2112;
      v56 = v11;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get cached assets with error: %@", buf, 0x16u);

      v10 = 0;
    }

    objc_autoreleasePoolPop(v35);
    v22 = 0;
  }

  return v22;
}

- (void)documentationForMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HMSoftwareUpdateDocumentationManager_documentationForMetadata_completion___block_invoke;
  block[3] = &unk_1E3AB5C58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)removeDocumentationMetadata:(id)a3
{
  id v4;

  -[HMSoftwareUpdateDocumentationManager assetForDocumentationMetadata:](self, "assetForDocumentationMetadata:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationManager removeAssetAndCompletion:](self, "removeAssetAndCompletion:", v4);

}

- (void)addAssetAndCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMSoftwareUpdateAssetCompletionsPair *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMSoftwareUpdateDocumentationManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "documentationIsCached");
  os_unfair_lock_lock_with_options();
  -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](self, "assetCompletionPairByDigestUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "metadataDigestUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "completions");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((v8 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    v14 = _Block_copy(v7);
    objc_msgSend(v13, "addObject:", v14);

  }
LABEL_6:
  v15 = objc_alloc_init(HMSoftwareUpdateAssetCompletionsPair);
  -[HMSoftwareUpdateAssetCompletionsPair setAsset:](v15, "setAsset:", v6);
  -[HMSoftwareUpdateAssetCompletionsPair setCompletions:](v15, "setCompletions:", v13);
  -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](self, "assetCompletionPairByDigestUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadataDigestUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v18);

  os_unfair_lock_unlock(&self->_lock);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "documentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Calling completion with cached documentation: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMSoftwareUpdateDocumentationManager context](v21, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delegateCaller");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __73__HMSoftwareUpdateDocumentationManager_addAssetAndCompletion_completion___block_invoke;
    v27[3] = &unk_1E3AB60A0;
    v28 = v19;
    v29 = v7;
    v26 = v19;
    objc_msgSend(v25, "invokeBlock:", v27);

  }
  else
  {
    objc_msgSend(v6, "startCaching");
  }

}

- (void)removeAssetAndCompletion:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](self, "assetCompletionPairByDigestUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataDigestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)assetForDocumentationMetadata:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](self, "assetCompletionPairByDigestUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_44313);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "metadata", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if ((v15 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)didUpdateDocumentationAssetState:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateDocumentationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@In didUpdateDocumentationAssetState", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "stateNeedsNotification"))
  {
    os_unfair_lock_lock_with_options();
    -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](v6, "assetCompletionPairByDigestUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadataDigestUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "completions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationManager assetCompletionPairByDigestUUID](v6, "assetCompletionPairByDigestUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "metadataDigestUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCompletions:", v14);

    }
    os_unfair_lock_unlock(&v6->_lock);
    if (objc_msgSend(v13, "count"))
    {
      -[HMSoftwareUpdateDocumentationManager context](v6, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__HMSoftwareUpdateDocumentationManager_didUpdateDocumentationAssetState___block_invoke;
      v21[3] = &unk_1E3AB5ED8;
      v22 = v13;
      v23 = v4;
      objc_msgSend(v20, "invokeBlock:", v21);

    }
  }

}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)assetCompletionPairByDigestUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetCompletionPairByDigestUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCompletionPairByDigestUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __73__HMSoftwareUpdateDocumentationManager_didUpdateDocumentationAssetState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "documentation", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "error");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v9);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v10);

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

uint64_t __70__HMSoftwareUpdateDocumentationManager_assetForDocumentationMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asset");
}

uint64_t __73__HMSoftwareUpdateDocumentationManager_addAssetAndCompletion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __76__HMSoftwareUpdateDocumentationManager_documentationForMetadata_completion___block_invoke(uint64_t a1)
{
  HMSoftwareUpdateDocumentationAsset *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  HMSoftwareUpdateDocumentationAsset *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetForDocumentationMetadata:", *(_QWORD *)(a1 + 40));
  v2 = (HMSoftwareUpdateDocumentationAsset *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetForMetadataFromDisk:", *(_QWORD *)(a1 + 40));
    v2 = (HMSoftwareUpdateDocumentationAsset *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v2 = -[HMSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:]([HMSoftwareUpdateDocumentationAsset alloc], "initWithDocumentationMetadata:", *(_QWORD *)(a1 + 40));
      v3 = (void *)MEMORY[0x1A1AC1AAC]();
      v4 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543618;
        v8 = v6;
        v9 = 2112;
        v10 = v2;
        _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Created new documentation asset: %@", (uint8_t *)&v7, 0x16u);

      }
      objc_autoreleasePoolPop(v3);
    }
    -[HMSoftwareUpdateDocumentationAsset setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "addAssetAndCompletion:completion:", v2, *(_QWORD *)(a1 + 48));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_44328 != -1)
    dispatch_once(&logCategory__hmf_once_t8_44328, &__block_literal_global_21);
  return (id)logCategory__hmf_once_v9_44329;
}

void __51__HMSoftwareUpdateDocumentationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_44329;
  logCategory__hmf_once_v9_44329 = v0;

}

@end
