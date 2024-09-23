@implementation MPModelLibraryDownloadQueueRequest

+ (BOOL)requiresNetwork
{
  return 0;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB34C8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__MPModelLibraryDownloadQueueRequest_newOperationWithResponseHandler___block_invoke;
  v9[3] = &unk_1E3162560;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "blockOperationWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__MPModelLibraryDownloadQueueRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1)
{
  MPLazySectionedCollection *v2;
  MPModelLibraryDownloadQueueResponse *v3;
  _MPModelLibraryDownloadQueueDataSource *v4;

  v4 = -[_MPModelLibraryDownloadQueueDataSource initWithRequest:]([_MPModelLibraryDownloadQueueDataSource alloc], "initWithRequest:", *(_QWORD *)(a1 + 32));
  v2 = -[MPLazySectionedCollection initWithDataSource:]([MPLazySectionedCollection alloc], "initWithDataSource:", v4);
  v3 = -[MPModelLibraryDownloadQueueResponse initWithRequest:]([MPModelLibraryDownloadQueueResponse alloc], "initWithRequest:", *(_QWORD *)(a1 + 32));
  -[MPModelResponse setResults:](v3, "setResults:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
