@implementation NTKTimelineRemoteDataSourceProvider

- (NTKTimelineRemoteDataSourceProvider)initWithDataSource:(id)a3
{
  id v4;
  NTKTimelineRemoteDataSourceProvider *v5;
  NTKTimelineRemoteDataSourceProvider *v6;
  NTKTimelineDataSourceWrapper *v7;
  NTKTimelineDataSourceWrapper *wrapper;
  NSOperationQueue *v9;
  NSOperationQueue *operationQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKTimelineRemoteDataSourceProvider;
  v5 = -[NTKTimelineRemoteDataSourceProvider init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[NTKTimelineDataSourceWrapper initWithDataSource:]([NTKTimelineDataSourceWrapper alloc], "initWithDataSource:", v4);
    wrapper = v6->_wrapper;
    v6->_wrapper = v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v6->_timeout = 10.0;
  }

  return v6;
}

- (void)getCurrentEntryForComplication:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF130]), "initWithIdentifiable:timeout:entryLimit:", v6, 1, self->_timeout);
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke;
  v19[3] = &unk_1E6BD03A8;
  v10 = v6;
  v20 = v10;
  v21 = v7;
  v11 = v7;
  objc_msgSend(v8, "setOperationCompletionBlock:", v19);
  v12 = objc_alloc(MEMORY[0x1E0DBF128]);
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithProvider:operations:providerTimeout:operationTimeout:", self, v13, self->_timeout, self->_timeout);

  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke_68;
  v17[3] = &unk_1E6BCE728;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v14, "setSessionCompletionBlock:", v17);
  -[NTKTimelineRemoteDataSourceProvider operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v14);

}

void __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Current entry fetched for complication %@ : %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__NTKTimelineRemoteDataSourceProvider_getCurrentEntryForComplication_completion___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Current entry session for complication %@ finished.", (uint8_t *)&v4, 0xCu);
  }

}

- (void)getEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0DBF120];
  v13 = a4;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithIdentifiable:afterDate:timeout:entryLimit:", v10, v13, a5, self->_timeout);

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke;
  v25[3] = &unk_1E6BD03D0;
  v16 = v10;
  v26 = v16;
  v27 = v11;
  v17 = v11;
  objc_msgSend(v14, "setOperationCompletionBlock:", v25);
  v18 = objc_alloc(MEMORY[0x1E0DBF128]);
  v28[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithProvider:operations:providerTimeout:operationTimeout:", self, v19, self->_timeout, self->_timeout);

  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke_72;
  v23[3] = &unk_1E6BCE728;
  v24 = v16;
  v21 = v16;
  objc_msgSend(v20, "setSessionCompletionBlock:", v23);
  -[NTKTimelineRemoteDataSourceProvider operationQueue](self, "operationQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addOperation:", v20);

}

void __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "timelineEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Entries fetched for complication %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __92__NTKTimelineRemoteDataSourceProvider_getEntriesForComplication_afterDate_limit_completion___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Extend session for complication %@ finished.", (uint8_t *)&v4, 0xCu);
  }

}

- (CLKComplicationDataSource)dataSource
{
  void *v2;
  void *v3;

  -[NTKTimelineRemoteDataSourceProvider wrapper](self, "wrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLKComplicationDataSource *)v3;
}

- (void)tl_getDataSourceWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  -[NTKTimelineRemoteDataSourceProvider wrapper](self, "wrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[2](v6, v4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKComplicationTimelineDomain"), 404, &unk_1E6CA8780);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v5);

  }
}

- (NTKTimelineDataSourceWrapper)wrapper
{
  return self->_wrapper;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end
