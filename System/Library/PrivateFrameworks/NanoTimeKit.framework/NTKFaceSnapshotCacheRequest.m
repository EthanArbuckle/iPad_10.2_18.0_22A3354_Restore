@implementation NTKFaceSnapshotCacheRequest

- (NTKFaceSnapshotCacheRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKFaceSnapshotCacheRequest *v12;
  uint64_t v13;
  NSDate *creationDate;
  void *v15;
  uint64_t v16;
  NSString *faceSnapshotKey;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id completion;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  id location;
  _QWORD v35[3];
  char v36;
  objc_super v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)NTKFaceSnapshotCacheRequest;
  v12 = -[NTKFaceSnapshotCacheRequest init](&v37, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_face, a3);
    objc_msgSend(v9, "dailySnapshotKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    faceSnapshotKey = v12->_faceSnapshotKey;
    v12->_faceSnapshotKey = (NSString *)v16;

    objc_storeStrong((id *)&v12->_options, a4);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v36 = 0;
    objc_initWeak(&location, v12);
    objc_msgSend(v9, "unsafeDailySnapshotKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke;
    v28 = &unk_1E6BD6330;
    objc_copyWeak(&v33, &location);
    v32 = v35;
    v29 = v9;
    v20 = v19;
    v30 = v20;
    v31 = v11;
    v21 = _Block_copy(&v25);
    v22 = objc_msgSend(v21, "copy", v25, v26, v27, v28);
    completion = v12->_completion;
    v12->_completion = (id)v22;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(v35, 8);
  }

  return v12;
}

void __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _QWORD *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v9 + 24))
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke_cold_1((uint64_t)v8, v10);

      objc_sync_exit(v8);
LABEL_18:

      goto LABEL_19;
    }
    *(_BYTE *)(v9 + 24) = 1;
    objc_sync_exit(v8);

    objc_msgSend(*(id *)(a1 + 32), "dailySnapshotKey");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "unsafeDailySnapshotKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v8[5];
        v19 = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Snapshot request cancelled for %@ (%@)", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", v8[5]))
      {
        v15 = v5;
LABEL_15:
        v16 = *(_QWORD *)(a1 + 48);
        if (v16)
          (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v15);

        v8 = v11;
        goto LABEL_18;
      }
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = (_QWORD *)v8[5];
        v18 = *(_QWORD *)(a1 + 40);
        v19 = 138413058;
        v20 = v17;
        v21 = 2112;
        v22 = v18;
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        _os_log_error_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_ERROR, "Invalid snapshot: key changed from %@ / %@ to %@ / %@", (uint8_t *)&v19, 0x2Au);
      }
    }

    v15 = 0;
    goto LABEL_15;
  }
LABEL_19:

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NTKFace)face
{
  return self->_face;
}

- (NTKFaceSnapshotCacheRequestOptions)options
{
  return self->_options;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)faceSnapshotKey
{
  return self->_faceSnapshotKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceSnapshotKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

void __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Snapshot handler called again for %@ (%@)", (uint8_t *)&v3, 0x16u);
}

@end
