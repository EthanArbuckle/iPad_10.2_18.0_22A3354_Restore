@implementation MPModelRecentlyPlayedRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  MPStoreModelRequestConfiguration *v9;
  MPStoreModelRequestConfiguration *v10;

  objc_storeStrong((id *)&self->_storeURLBag, a3);
  v6 = a3;
  -[MPModelRecentlyPlayedRequestOperation recentlyPlayedURLWithStoreURLBag:](self, "recentlyPlayedURLWithStoreURLBag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v7);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
  -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
  objc_msgSend(v8, "setTimeoutInterval:");
  objc_msgSend(v8, "setCachePolicy:", 1);
  v9 = [MPStoreModelRequestConfiguration alloc];

  v10 = -[MPStoreModelRequestConfiguration initWithURLRequest:](v9, "initWithURLRequest:", v8);
  return v10;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (!_NSIsNSDictionary())
    goto LABEL_6;
  objc_msgSend(v9, "objectForKey:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSArray() & 1) == 0)
  {

    goto LABEL_6;
  }
  -[MPModelRecentlyPlayedRequestOperation _produceResponseWithRecentlyPlayedArray:completion:](self, "_produceResponseWithRecentlyPlayedArray:completion:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
    goto LABEL_7;
  }
  ((void (**)(id, void *, void *))v6)[2](v6, v8, 0);
LABEL_7:

}

- (id)_produceResponseWithRecentlyPlayedArray:(id)a3 completion:(id)a4
{
  id v5;
  MPMutableSectionedCollection *v6;
  MPMutableSectionedCollection *v7;
  void *v8;
  void *v9;
  void *v10;
  MPModelForYouRecommendationMusicKitGroupBuilder *v11;
  void *v12;
  void *v13;
  MPModelRecentlyPlayedResponse *v14;
  void *v15;
  MPModelRecentlyPlayedResponse *v16;

  v5 = a3;
  v6 = objc_alloc_init(MPMutableSectionedCollection);
  v7 = objc_alloc_init(MPMutableSectionedCollection);
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPModelForYouRecommendationMusicKitGroupBuilder initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:]([MPModelForYouRecommendationMusicKitGroupBuilder alloc], "initWithRequestedGroupPropertySet:requestedItemPropertySet:storeItemMetadataResults:flatSectionedItems:storeURLBag:isListenNow:", v9, v10, 0, v7, self->_storeURLBag, 0);
  if (objc_msgSend(v5, "count"))
  {
    -[MPAsyncOperation userIdentity](self, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelForYouRecommendationMusicKitGroupBuilder modelObjectForRecentlyPlayedArray:userIdentity:](v11, "modelObjectForRecentlyPlayedArray:userIdentity:", v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPMutableSectionedCollection appendSection:](v6, "appendSection:", v13);
  }
  v14 = [MPModelRecentlyPlayedResponse alloc];
  -[MPStoreModelRequestOperation request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPModelResponse initWithRequest:](v14, "initWithRequest:", v15);

  -[MPModelResponse setResults:](v16, "setResults:", v6);
  return v16;
}

- (id)recentlyPlayedURLWithStoreURLBag:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  MusicURLComponentsWithURLBag(v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", CFSTR("/v1/me/recent/played"));
  objc_msgSend(v3, "stringForBagKey:", *MEMORY[0x1E0DDBE88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("l"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = v10;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__MPModelRecentlyPlayedRequestOperation_recentlyPlayedURLWithStoreURLBag___block_invoke;
    v16[3] = &unk_1E315F288;
    v12 = v6;
    v17 = v12;
    v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v16);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v11, "addObject:", v12);
    else
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v13, v12);
    objc_msgSend(v4, "setQueryItems:", v11);

  }
  objc_msgSend(v4, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLBag, 0);
}

uint64_t __74__MPModelRecentlyPlayedRequestOperation_recentlyPlayedURLWithStoreURLBag___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
