@implementation NMSModelForYouRecommendationsRequestOperation

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  _QWORD v14[5];

  -[MPStoreModelRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "nms_useCachedDataOnly"))
  {
    kdebug_trace();
    objc_msgSend(v3, "nms_cachedRecommendationsArray");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          objc_msgSend(v3, "nms_cachedStoreItemMetadataResults"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      objc_msgSend(v3, "nms_cachedRecommendationsArray");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "nms_cachedStoreItemMetadataResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = 3221225472;
      v14[2] = __56__NMSModelForYouRecommendationsRequestOperation_execute__block_invoke;
      v14[3] = &unk_24D647E98;
      v14[4] = self;
      v13.receiver = self;
      v13.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
      v14[0] = MEMORY[0x24BDAC760];
      -[MPModelForYouRecommendationsRequestOperation _produceResponseWithRecommendationsArray:storeItemMetadataResults:completion:](&v13, sel__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion_, v7, v8, v14);

    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDDC888]);
      -[MPStoreModelRequestOperation request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithRequest:", v10);
      -[MPStoreModelRequestOperation _finishWithResponse:error:](self, "_finishWithResponse:error:", v11, 0);

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
    -[MPStoreModelRequestOperation execute](&v12, sel_execute);
  }

}

void __56__NMSModelForYouRecommendationsRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", v6, v5);

}

- (void)_produceResponseWithRecommendationsArray:(id)a3 storeItemMetadataResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPStoreModelRequestOperation request](self, "request");
  v16[1] = 3221225472;
  v16[2] = __126__NMSModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke;
  v16[3] = &unk_24D647EC0;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15.receiver = self;
  v15.super_class = (Class)NMSModelForYouRecommendationsRequestOperation;
  v16[0] = MEMORY[0x24BDAC760];
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v17;
  -[MPModelForYouRecommendationsRequestOperation _produceResponseWithRecommendationsArray:storeItemMetadataResults:completion:](&v15, sel__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion_, v13, v12, v16);

}

void __126__NMSModelForYouRecommendationsRequestOperation__produceResponseWithRecommendationsArray_storeItemMetadataResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "nms_useCachedDataOnly") & 1) == 0)
  {
    objc_msgSend(v7, "nms_setCachedRecommendationsArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "nms_setCachedStoreItemMetadataResults:", *(_QWORD *)(a1 + 48));
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

@end
