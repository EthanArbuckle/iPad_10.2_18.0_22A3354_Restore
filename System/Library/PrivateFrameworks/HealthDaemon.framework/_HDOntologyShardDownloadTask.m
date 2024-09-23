@implementation _HDOntologyShardDownloadTask

- (_HDOntologyShardDownloadTask)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)initForEntry:(id)a3 downloader:(id)a4 session:(id)a5 group:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDOntologyShardDownloadTask *v15;
  _HDOntologyShardDownloadTask *v16;
  NSError *error;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_HDOntologyShardDownloadTask;
  v15 = -[_HDOntologyShardDownloadTask init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entry, a3);
    objc_storeStrong((id *)&v16->_downloader, a4);
    objc_storeStrong((id *)&v16->_session, a5);
    objc_storeStrong((id *)&v16->_group, a6);
    error = v16->_error;
    v16->_error = 0;

  }
  return v16;
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C92C80];
  -[HKOntologyShardRegistryEntry availableURL](self->_entry, "availableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithURL:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NSURLSession downloadTaskWithRequest:](self->_session, "downloadTaskWithRequest:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);
  dispatch_group_enter((dispatch_group_t)self->_group);
  objc_msgSend(v5, "resume");

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  HKOntologyShardRegistryEntry *entry;
  char v14;
  NSError *v15;
  void *v16;
  HDOntologyShardDownloader *downloader;
  void *v18;
  char v19;
  NSError *v20;
  NSObject *v21;
  NSError *v22;
  NSError *error;
  NSObject *v24;
  NSError *v25;
  HKOntologyShardRegistryEntry *v26;
  id v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  _HDOntologyShardDownloadTask *v31;
  __int16 v32;
  HKOntologyShardRegistryEntry *v33;
  __int16 v34;
  NSError *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_HDOntologyShardDownloadTask _handleResponse:task:](self, "_handleResponse:task:", v9, v8);

  if (v10)
  {
    -[HDOntologyShardDownloader updateCoordinator](self->_downloader, "updateCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shardRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    entry = self->_entry;
    v28 = 0;
    v14 = objc_msgSend(v12, "stageShardFileWithLocalURL:entry:error:", v7, entry, &v28);
    v15 = (NSError *)v28;
    if ((v14 & 1) != 0)
    {
      v16 = (void *)-[HKOntologyShardRegistryEntry copyWithAvailableState:](self->_entry, "copyWithAvailableState:", 2);
      downloader = self->_downloader;
      v29 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v19 = -[HDOntologyShardDownloader _persistStagedEntries:error:]((uint64_t)downloader, v18, (uint64_t)&v27);
      v20 = (NSError *)v27;

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v31 = self;
          v32 = 2114;
          v33 = (HKOntologyShardRegistryEntry *)v16;
          v34 = 2114;
          v35 = v20;
          _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert updated entry %{public}@: %{public}@", buf, 0x20u);
        }

        v22 = (NSError *)-[NSError copy](v20, "copy");
        error = self->_error;
        self->_error = v22;

      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_entry;
        *(_DWORD *)buf = 138543874;
        v31 = self;
        v32 = 2114;
        v33 = v26;
        v34 = 2114;
        v35 = v15;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to stage shard file for entry %{public}@: %{public}@", buf, 0x20u);
      }

      v25 = (NSError *)-[NSError copy](v15, "copy");
      v20 = self->_error;
      self->_error = v25;
    }

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSError *v10;
  NSError *error;
  void *v12;
  int v13;
  _HDOntologyShardDownloadTask *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v8)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch shard file with error: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v10 = (NSError *)objc_msgSend(v8, "copy");
    error = self->_error;
    self->_error = v10;

  }
  else
  {
    objc_msgSend(v7, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDOntologyShardDownloadTask _handleResponse:task:](self, "_handleResponse:task:", v12, v7);

  }
  dispatch_group_leave((dispatch_group_t)self->_group);

}

- (BOOL)_handleResponse:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSError *v14;
  NSError *error;
  void *v17;
  int v18;
  _HDOntologyShardDownloadTask *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "statusCode");
  v9 = v8 - 200;
  if ((unint64_t)(v8 - 200) >= 0x64)
  {
    v10 = v8;
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = self;
      v20 = 2048;
      v21 = v10;
      v22 = 2114;
      v23 = v17;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch shard file with status code %ld, %{public}@", (uint8_t *)&v18, 0x20u);

    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "currentRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_HTTPErrorRepresentingResponse:request:", v6, v13);
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v14;

  }
  return v9 < 0x64;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
