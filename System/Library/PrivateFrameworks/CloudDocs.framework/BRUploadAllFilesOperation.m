@implementation BRUploadAllFilesOperation

- (BRUploadAllFilesOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRUploadAllFilesOperation;
  return -[BROperation init](&v3, sel_init);
}

- (BRUploadAllFilesOperation)initWithContainer:(id)a3
{
  id v5;
  BRUploadAllFilesOperation *v6;
  BRUploadAllFilesOperation *v7;

  v5 = a3;
  v6 = -[BRUploadAllFilesOperation init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_container, a3);

  return v7;
}

- (void)main
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] wait for uploading all files%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __33__BRUploadAllFilesOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id uploadAllFilesCompletion;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BRPartialErrorsByContainerIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[BRContainer allContainersByContainerID](BRContainer, "allContainersByContainerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__BRUploadAllFilesOperation_finishWithResult_error___block_invoke;
  v21[3] = &unk_1E3DA61C8;
  v12 = v10;
  v22 = v12;
  objc_msgSend(v11, "br_copy_if:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("BRErrorAffectedContainersKey");
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1002, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BRCloudDocsErrorDomain"), 1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = MEMORY[0x1A1AD85E4](self->_uploadAllFilesCompletion);
  v18 = (void *)v17;
  if (v17)
  {
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    uploadAllFilesCompletion = self->_uploadAllFilesCompletion;
    self->_uploadAllFilesCompletion = 0;

  }
  v20.receiver = self;
  v20.super_class = (Class)BRUploadAllFilesOperation;
  -[BROperation finishWithResult:error:](&v20, sel_finishWithResult_error_, v7, v16);

}

uint64_t __52__BRUploadAllFilesOperation_finishWithResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDocumentScopePublic") ^ 1;

  return v3;
}

- (id)uploadAllFilesCompletion
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setUploadAllFilesCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong(&self->_uploadAllFilesCompletion, 0);
}

@end
