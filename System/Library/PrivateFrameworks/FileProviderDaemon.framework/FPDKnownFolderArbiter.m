@implementation FPDKnownFolderArbiter

+ (NSURL)desktopURL
{
  return 0;
}

+ (NSURL)documentsURL
{
  return 0;
}

- (FPDKnownFolderArbiter)initWithServer:(id)a3
{
  id v4;
  FPDKnownFolderArbiter *v5;
  FPDKnownFolderArbiter *v6;
  uint64_t v7;
  NSOperationQueue *operationQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPDKnownFolderArbiter;
  v5 = -[FPDKnownFolderArbiter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_server, v4);
    v7 = objc_opt_new();
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = (NSOperationQueue *)v7;

    -[NSOperationQueue setName:](v6->_operationQueue, "setName:", CFSTR("Known Folder Arbiter"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1);
  }

  return v6;
}

- (void)detachKnownFolders:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  FPDClaimKnownFolderOperation *v11;
  id WeakRetained;
  FPDClaimKnownFolderOperation *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [FPDClaimKnownFolderOperation alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v13 = -[FPDClaimKnownFolderOperation initWithDescriptors:server:request:](v11, "initWithDescriptors:server:request:", v10, WeakRetained, v9);

  LODWORD(v10) = objc_msgSend(v9, "qos");
  -[FPDClaimKnownFolderOperation setQualityOfService:](v13, "setQualityOfService:", v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__FPDKnownFolderArbiter_detachKnownFolders_request_completionHandler___block_invoke;
  v15[3] = &unk_1E8C78FF0;
  v16 = v8;
  v14 = v8;
  -[FPOperation setFinishedBlock:](v13, "setFinishedBlock:", v15);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v13);

}

uint64_t __70__FPDKnownFolderArbiter_detachKnownFolders_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  FPDAttachKnownFolderOperation *v13;
  id WeakRetained;
  FPDAttachKnownFolderOperation *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = [FPDAttachKnownFolderOperation alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  v15 = -[FPDAttachKnownFolderOperation initWithKnownFolderURLs:onlyForDomain:server:options:request:](v13, "initWithKnownFolderURLs:onlyForDomain:server:options:request:", v12, 0, WeakRetained, a4, v11);

  LODWORD(a4) = objc_msgSend(v11, "qos");
  -[FPDAttachKnownFolderOperation setQualityOfService:](v15, "setQualityOfService:", a4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__FPDKnownFolderArbiter_attachKnownFolders_options_request_completionHandler___block_invoke;
  v17[3] = &unk_1E8C78FF0;
  v18 = v10;
  v16 = v10;
  -[FPOperation setFinishedBlock:](v15, "setFinishedBlock:", v17);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v15);

}

uint64_t __78__FPDKnownFolderArbiter_attachKnownFolders_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)claimKnownFolders:(id)a3 domain:(id)a4 localizedReason:(id)a5 request:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  FPDClaimKnownFolderOperation *v23;
  id WeakRetained;
  FPDClaimKnownFolderOperation *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  fp_current_or_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "providerDomainID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fp_obfuscatedProviderDomainID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v40 = v12;
    v41 = 2114;
    v42 = v33;
    v43 = 2114;
    v44 = v15;
    _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  claiming known folders %@ from %{public}@ for %{public}@", buf, 0x20u);

  }
  objc_msgSend(v12, "desktopLocation");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    && (v19 = (void *)v18,
        objc_msgSend(v12, "documentsLocation"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    objc_msgSend(v13, "volume");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "role");

    if (v22 == 1)
    {
      v23 = [FPDClaimKnownFolderOperation alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      v25 = -[FPDClaimKnownFolderOperation initWithKnownFolderLocations:domain:server:localizedReason:request:](v23, "initWithKnownFolderLocations:domain:server:localizedReason:request:", v12, v13, WeakRetained, v14, v15);

      -[FPDClaimKnownFolderOperation setQualityOfService:](v25, "setQualityOfService:", objc_msgSend(v15, "qos"));
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __92__FPDKnownFolderArbiter_claimKnownFolders_domain_localizedReason_request_completionHandler___block_invoke;
      v35[3] = &unk_1E8C78FF0;
      v36 = v16;
      -[FPOperation setFinishedBlock:](v25, "setFinishedBlock:", v35);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v25);

    }
    else
    {
      objc_msgSend(v13, "provider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "providerDomainForDomain:", v13);
      v25 = (FPDClaimKnownFolderOperation *)objc_claimAutoreleasedReturnValue();

      if (-[FPDClaimKnownFolderOperation isiCloudDriveProvider](v25, "isiCloudDriveProvider"))
      {
        FPLoc();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[FPDClaimKnownFolderOperation domainFullDisplayName](v25, "domainFullDisplayName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        FPLoc();
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2FE0];
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v34);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 18, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v31);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Desktop and Documents must be claimed"));
    v25 = (FPDClaimKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, FPDClaimKnownFolderOperation *))v16 + 2))(v16, v25);
  }

}

uint64_t __92__FPDKnownFolderArbiter_claimKnownFolders_domain_localizedReason_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)releaseKnownFolders:(unint64_t)a3 domain:(id)a4 localizedReason:(id)a5 options:(unint64_t)a6 request:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, void *);
  NSObject *v16;
  FPDAttachKnownFolderOperation *v17;
  id WeakRetained;
  FPDAttachKnownFolderOperation *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, void *);
  uint8_t buf[4];
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  v15 = (void (**)(id, void *))a8;
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "providerDomainID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v25 = a3;
    v26 = 2114;
    v27 = v21;
    v28 = 2114;
    v29 = v14;
    _os_log_debug_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  releasing known folders %x from %{public}@ for %{public}@", buf, 0x1Cu);

  }
  if ((~(_BYTE)a3 & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Desktop and Documents must be released together"));
    v19 = (FPDAttachKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v19);
  }
  else
  {
    v17 = [FPDAttachKnownFolderOperation alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    v19 = -[FPDAttachKnownFolderOperation initWithKnownFolders:onlyForDomain:server:options:request:](v17, "initWithKnownFolders:onlyForDomain:server:options:request:", a3, v13, WeakRetained, a6, v14);

    -[FPDAttachKnownFolderOperation setQualityOfService:](v19, "setQualityOfService:", objc_msgSend(v14, "qos"));
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __102__FPDKnownFolderArbiter_releaseKnownFolders_domain_localizedReason_options_request_completionHandler___block_invoke;
    v22[3] = &unk_1E8C78FF0;
    v23 = v15;
    -[FPOperation setFinishedBlock:](v19, "setFinishedBlock:", v22);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v19);

  }
}

uint64_t __102__FPDKnownFolderArbiter_releaseKnownFolders_domain_localizedReason_options_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)selectNewDomain:(id)a3 knownFolders:(unint64_t)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *v13;
  FPDClaimKnownFolderOperation *v14;
  id WeakRetained;
  FPDClaimKnownFolderOperation *v16;
  void (**v17)(id, void *);
  FPDAttachKnownFolderOperation *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  void (**v26)(id, void *);
  _QWORD v27[4];
  void (**v28)(id, void *);
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fp_obfuscatedProviderDomainID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v21;
    v31 = 1024;
    v32 = a4;
    v33 = 2112;
    v34 = v11;
    _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] 🖥️  select %{public}@ to back known folders %x for %@", buf, 0x1Cu);

  }
  if ((~(_BYTE)a4 & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Desktop and Documents must be selected together"));
    v16 = (FPDClaimKnownFolderOperation *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v16);
  }
  else
  {
    if (v10)
    {
      v14 = [FPDClaimKnownFolderOperation alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      v16 = -[FPDClaimKnownFolderOperation initWithKnownFolders:domain:server:request:](v14, "initWithKnownFolders:domain:server:request:", a4, v10, WeakRetained, v11);

      -[FPDClaimKnownFolderOperation setQualityOfService:](v16, "setQualityOfService:", objc_msgSend(v11, "qos"));
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke_2;
      v25 = &unk_1E8C78FF0;
      v26 = v12;
      -[FPOperation setFinishedBlock:](v16, "setFinishedBlock:", &v22);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v22, v23, v24, v25);
      v17 = v26;
    }
    else
    {
      v18 = [FPDAttachKnownFolderOperation alloc];
      v19 = objc_loadWeakRetained((id *)&self->_server);
      v16 = -[FPDAttachKnownFolderOperation initWithKnownFolders:onlyForDomain:server:options:request:](v18, "initWithKnownFolders:onlyForDomain:server:options:request:", a4, 0, v19, 3, v11);

      -[FPDClaimKnownFolderOperation setQualityOfService:](v16, "setQualityOfService:", objc_msgSend(v11, "qos"));
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke;
      v27[3] = &unk_1E8C78FF0;
      v28 = v12;
      -[FPOperation setFinishedBlock:](v16, "setFinishedBlock:", v27);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16);
      v17 = v28;
    }

  }
}

uint64_t __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__FPDKnownFolderArbiter_selectNewDomain_knownFolders_request_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_server);
}

@end
