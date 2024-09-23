@implementation _MDRemoteExtensionContext

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, v0, v1, "dealloc, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x18D782104](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  -[_MDRemoteExtensionContext _UUID](self, "_UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UUID=%@"), v6);
  objc_msgSend(v4, "addObject:", v7);

  -[_MDRemoteExtensionContext requestHandler](self, "requestHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("handler=%p"), v8);
    objc_msgSend(v4, "addObject:", v9);

  }
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = objc_opt_class();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("<%@:%p; %@>"), v11, self, v12);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v13;
}

- (id)hostContext
{
  void *v2;
  void *v3;

  -[_MDRemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)handleSingleFileURLRequest:(id)a3 providerIdentifier:(id)a4 index:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _QWORD aBlock[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[_MDRemoteExtensionContext requestHandler](self, "requestHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "jobType");
  v15 = objc_msgSend(v10, "jobType");
  v16 = ((unint64_t)objc_msgSend(v10, "jobOptions") >> 11) & 0xF;
  v17 = v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__5;
    v43 = __Block_byref_object_dispose__5;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__5;
    v38 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87___MDRemoteExtensionContext_handleSingleFileURLRequest_providerIdentifier_index_error___block_invoke;
    aBlock[3] = &unk_1E2401EA8;
    v31 = &v33;
    v32 = &v39;
    v19 = v18;
    v30 = v19;
    v20 = _Block_copy(aBlock);
    objc_msgSend(v10, "providerType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLForSearchableIndex:itemIdentifier:typeIdentifier:options:block:", v12, v11, v21, v16, v20);

    dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    if (a6)
      *a6 = objc_retainAutorelease((id)v40[5]);
    v22 = (id)v34[5];

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25 = v15 != 15;
      objc_msgSend(v10, "providerType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLForSearchableIndex:itemIdentifier:typeIdentifier:inPlace:allowDownload:error:", v12, v11, v26, v14 == 8, v25, a6);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    if (v15 != 15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v27 = v14 == 8;
        objc_msgSend(v10, "providerType");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fileURLForSearchableIndex:itemIdentifier:typeIdentifier:inPlace:error:", v12, v11, v19, v27, a6);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (v14 != 8 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "providerType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "searchableIndexProvideFileURLForIndex:identifier:type:error:", v12, v11, v28, a6);
        v22 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    v22 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v10, "providerType");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileURLForSearchableIndex:itemIdentifier:typeIdentifier:options:error:", v12, v11, v19, v16, a6);
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v22 = (id)v23;
LABEL_8:

LABEL_9:
  return v22;
}

- (void)performJob:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  _MDRemoteExtensionContext *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_MDRemoteExtensionContext performJob:acknowledgementHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  if (performJob_acknowledgementHandler__onceToken != -1)
    dispatch_once(&performJob_acknowledgementHandler__onceToken, &__block_literal_global_84);
  v16 = performJob_acknowledgementHandler__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2;
  block[3] = &unk_1E2401660;
  v20 = v6;
  v21 = self;
  v22 = v7;
  v17 = v7;
  v18 = v6;
  dispatch_async(v16, block);

}

- (void)getLastUpdateTimeWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD, double);
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void (**)(_QWORD, double))a3;
  v4 = (void *)MEMORY[0x18D782104]();
  +[CSSearchableIndex lastUpdateTime](CSSearchableIndex, "lastUpdateTime");
  v6 = v5;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_MDRemoteExtensionContext getLastUpdateTimeWithCompletionHandler:].cold.1(v7, v6, v8, v9);

  if (v3)
    v3[2](v3, v6);
  objc_autoreleasePoolPop(v4);

}

- (CSIndexExtensionRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandler, a3);
}

- (CSImportExtension)importExtension
{
  return self->_importExtension;
}

- (void)setImportExtension:(id)a3
{
  objc_storeStrong((id *)&self->_importExtension, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importExtension, 0);
  objc_storeStrong((id *)&self->_requestHandler, 0);
}

- (void)performJob:(uint64_t)a3 acknowledgementHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[CSJob] In remoteContext's performJob", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)getLastUpdateTimeWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = (unint64_t)a2;
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, a1, a4, "lastUpdateTime:%llu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
