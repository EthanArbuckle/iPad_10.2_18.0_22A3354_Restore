@implementation CLSFaceIdentificationOnDemand

- (id)requestIdentificationOfFaces:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D475C0], "analysisService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3398;
  v31 = __Block_byref_object_dispose__3399;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3398;
  v25 = __Block_byref_object_dispose__3399;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__CLSFaceIdentificationOnDemand_requestIdentificationOfFaces_error___block_invoke;
  v17[3] = &unk_1E84F86A8;
  v19 = &v27;
  v20 = &v21;
  v8 = v7;
  v18 = v8;
  v9 = (void *)MEMORY[0x1D1796244](v17);
  v10 = objc_msgSend(v6, "requestIdentificationOfFaces:withCompletionHandler:", v5, v9);
  if ((_DWORD)v10)
  {
    v11 = dispatch_time(0, 60000000000);
    if (!dispatch_group_wait(v8, v11))
      goto LABEL_6;
    objc_msgSend(v6, "cancelRequest:", v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 101);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 100);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v28[5];
  v28[5] = v12;

LABEL_6:
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  v14 = (void *)v22[5];
  if (!v14)
    v14 = (void *)MEMORY[0x1E0C9AA70];
  v15 = v14;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __68__CLSFaceIdentificationOnDemand_requestIdentificationOfFaces_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[CLSMediaAnalysisHelper] -requestIdentificationOfFaces:withCompletionHandler: returned error: %@", (uint8_t *)&v8, 0xCu);
      if (!v6)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (v6)
LABEL_4:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
