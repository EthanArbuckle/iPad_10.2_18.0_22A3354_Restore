@implementation MPModelVerifyLocalFileAssetIntegrityRequest

- (MPModelVerifyLocalFileAssetIntegrityRequest)initWithFileAsset:(id)a3 sourceItemIdentifiers:(id)a4
{
  id v7;
  id v8;
  MPModelVerifyLocalFileAssetIntegrityRequest *v9;
  MPModelVerifyLocalFileAssetIntegrityRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelVerifyLocalFileAssetIntegrityRequest;
  v9 = -[MPModelVerifyLocalFileAssetIntegrityRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileAsset, a3);
    objc_storeStrong((id *)&v10->_sourceItemIdentifiers, a4);
  }

  return v10;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  -[MPIdentifierSet library](self->_sourceItemIdentifiers, "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "persistentID");

  if (v6)
  {
    -[MPModelVerifyLocalFileAssetIntegrityRequest mediaLibraryForItemIdentifiers:](self, "mediaLibraryForItemIdentifiers:", self->_sourceItemIdentifiers);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__MPModelVerifyLocalFileAssetIntegrityRequest_performWithResponseHandler___block_invoke;
    v10[3] = &unk_1E315C618;
    v11 = v7;
    v13 = v6;
    v12 = v4;
    v9 = v7;
    objc_msgSend(v8, "addOperationWithBlock:", v10);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (id)mediaLibraryForItemIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    goto LABEL_3;
  objc_msgSend(v3, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    objc_msgSend(v3, "personalizedStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    if (v12 < 1)
      goto LABEL_5;
    v13 = (void *)MEMORY[0x1E0DDC100];
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "personalizedStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "specificAccountWithDSID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_5:
      +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (MPIdentifierSet)sourceItemIdentifiers
{
  return self->_sourceItemIdentifiers;
}

- (void)setSourceItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItemIdentifiers, a3);
}

- (MPModelFileAsset)fileAsset
{
  return self->_fileAsset;
}

- (void)setFileAsset:(id)a3
{
  objc_storeStrong((id *)&self->_fileAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAsset, 0);
  objc_storeStrong((id *)&self->_sourceItemIdentifiers, 0);
}

void __74__MPModelVerifyLocalFileAssetIntegrityRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "itemWithPersistentID:verifyExistence:", *(_QWORD *)(a1 + 48), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", CFSTR("verifiedIntegrity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "BOOLValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)_operationQueue
{
  if (_operationQueue_sOnceToken != -1)
    dispatch_once(&_operationQueue_sOnceToken, &__block_literal_global_28255);
  return (id)_operationQueue_sOperationQueue;
}

uint64_t __62__MPModelVerifyLocalFileAssetIntegrityRequest__operationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_operationQueue_sOperationQueue;
  _operationQueue_sOperationQueue = (uint64_t)v0;

  objc_msgSend((id)_operationQueue_sOperationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPModelVerifyLocalFileAssetIntegrityRequest.operationQueue"));
  objc_msgSend((id)_operationQueue_sOperationQueue, "setQualityOfService:", 25);
  return objc_msgSend((id)_operationQueue_sOperationQueue, "setMaxConcurrentOperationCount:", 2);
}

@end
