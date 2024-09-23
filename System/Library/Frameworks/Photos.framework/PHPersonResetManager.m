@implementation PHPersonResetManager

- (PHPersonResetManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PHPersonResetManager *v6;
  PHPersonResetManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHPersonResetManager;
  v6 = -[PHPersonResetManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_library, a3);

  return v7;
}

- (id)resetPersonsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PLProgressFollower *v13;
  PLProgressFollower *progressFollower;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  PHPersonResetManager *v21;
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PHPhotoLibrary assetsdClient](self->_library, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke;
  v24[3] = &unk_1E35DBB00;
  v24[4] = self;
  v9 = v5;
  v25 = v9;
  objc_msgSend(v7, "resetPersonsWithCompletionHandler:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = _Block_copy(self->_progressHandler);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D71A18]);
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_1E35DBB28;
      v23 = a2;
      v20 = v10;
      v21 = self;
      v22 = v11;
      v13 = (PLProgressFollower *)objc_msgSend(v12, "initWithSourceProgress:progressHandler:", v20, v19);
      progressFollower = self->_progressFollower;
      self->_progressFollower = v13;

    }
    v15 = v10;
    goto LABEL_7;
  }
  if (v9)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("Reset persons failed: progress is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v17);

LABEL_7:
  }

  return v10;
}

- (id)resetSocialGroupsWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PLProgressFollower *v13;
  PLProgressFollower *progressFollower;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  PHPersonResetManager *v21;
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PHPhotoLibrary assetsdClient](self->_library, "assetsdClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke;
  v24[3] = &unk_1E35DBB00;
  v24[4] = self;
  v9 = v5;
  v25 = v9;
  objc_msgSend(v7, "resetSocialGroupsWithCompletionHandler:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = _Block_copy(self->_progressHandler);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D71A18]);
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke_2;
      v19[3] = &unk_1E35DBB28;
      v23 = a2;
      v20 = v10;
      v21 = self;
      v22 = v11;
      v13 = (PLProgressFollower *)objc_msgSend(v12, "initWithSourceProgress:progressHandler:", v20, v19);
      progressFollower = self->_progressFollower;
      self->_progressFollower = v13;

    }
    v15 = v10;
    goto LABEL_7;
  }
  if (v9)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("Reset social groups failed: progress is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v17);

LABEL_7:
  }

  return v10;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

void __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke(uint64_t a1, _BOOL8 a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v5;
    a2 = +[PHLibraryScope removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:error:](PHLibraryScope, "removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:error:", v6, &v11);
    v7 = v11;

    v5 = v7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = 0;

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _BOOL8, id))(v10 + 16))(v10, a2, v5);

}

uint64_t __63__PHPersonResetManager_resetSocialGroupsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "completedUnitCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PHPersonResetManager.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress.completedUnitCount >= 0"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PHPersonResetManager.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress.totalUnitCount >= 0"));

  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(v4, "completedUnitCount");
  v7 = objc_msgSend(v4, "totalUnitCount");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v6, v7);
}

void __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke(uint64_t a1, _BOOL8 a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = v5;
    a2 = +[PHLibraryScope removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:error:](PHLibraryScope, "removePersonRulesOnActiveLibraryScopeWithPhotoLibrary:error:", v6, &v11);
    v7 = v11;

    v5 = v7;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = 0;

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, _BOOL8, id))(v10 + 16))(v10, a2, v5);

}

uint64_t __58__PHPersonResetManager_resetPersonsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "completedUnitCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PHPersonResetManager.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress.completedUnitCount >= 0"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PHPersonResetManager.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress.totalUnitCount >= 0"));

  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(v4, "completedUnitCount");
  v7 = objc_msgSend(v4, "totalUnitCount");

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v6, v7);
}

@end
