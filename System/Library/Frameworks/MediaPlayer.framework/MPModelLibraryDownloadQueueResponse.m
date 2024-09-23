@implementation MPModelLibraryDownloadQueueResponse

- (MPModelLibraryDownloadQueueResponse)initWithRequest:(id)a3
{
  id v4;
  MPModelLibraryDownloadQueueResponse *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPModelLibraryDownloadQueueResponse;
  v5 = -[MPModelResponse initWithRequest:](&v8, sel_initWithRequest_, v4);
  if (v5)
  {
    +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerObserver:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MPMediaDownloadManager sharedManager](MPMediaDownloadManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPModelLibraryDownloadQueueResponse;
  -[MPModelLibraryDownloadQueueResponse dealloc](&v4, sel_dealloc);
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  MPModelLibraryDownloadQueueResponse *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    dispatch_get_global_queue(33, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke;
    block[3] = &unk_1E3161780;
    v10 = v6;
    v11 = self;
    v12 = v7;
    dispatch_async(v8, block);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MPModelLibraryDownloadQueueResponse;
    -[MPModelResponse getChangeDetailsFromPreviousResponse:completion:](&v13, sel_getChangeDetailsFromPreviousResponse_completion_, v6, v7);
  }

}

void __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = a1[4];
  objc_msgSend(v2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_2;
  v14[3] = &unk_1E315E5F8;
  v6 = v3;
  v15 = v6;
  v16 = v4;
  v7 = v4;
  objc_msgSend(v6, "changeDetailsToSectionedCollection:isEqualBlock:isUpdatedBlock:", v7, v14, &__block_literal_global_39243);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_4;
  v11[3] = &unk_1E3162560;
  v9 = a1[6];
  v12 = v8;
  v13 = v9;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifiersForItemAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifiersForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __87__MPModelLibraryDownloadQueueResponse_getChangeDetailsFromPreviousResponse_completion___block_invoke_3()
{
  return 0;
}

@end
