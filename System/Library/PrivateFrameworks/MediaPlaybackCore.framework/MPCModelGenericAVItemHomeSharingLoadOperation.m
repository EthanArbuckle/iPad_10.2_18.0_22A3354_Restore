@implementation MPCModelGenericAVItemHomeSharingLoadOperation

- (void)execute
{
  void (**v3)(void *, MPCModelGenericAVItemAssetLoadResult *, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  MPCModelGenericAVItemAssetLoadResult *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__MPCModelGenericAVItemHomeSharingLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_24CAB9748;
  aBlock[4] = self;
  v3 = (void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, _QWORD))_Block_copy(aBlock);
  -[MPCModelGenericAVItemHomeSharingLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeSharingAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAvailable"))
  {
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MPCModelGenericAVItemAssetLoadResult);
      -[MPCModelGenericAVItemAssetLoadResult setAssetURL:](v7, "setAssetURL:", v6);
      objc_msgSend(v6, "pathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelGenericAVItemAssetLoadResult setAssetPathExtension:](v7, "setAssetPathExtension:", v8);

      -[MPCModelGenericAVItemAssetLoadResult setAssetQualityType:](v7, "setAssetQualityType:", 2);
      objc_msgSend(v5, "protectedContentSupportStorageFileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCModelGenericAVItemAssetLoadResult setProtectedContentSupportStorageFileURL:](v7, "setProtectedContentSupportStorageFileURL:", v9);

      -[MPCModelGenericAVItemAssetLoadResult setIsHomeSharingAsset:](v7, "setIsHomeSharingAsset:", 1);
      -[MPCModelGenericAVItemAssetLoadResult setSource:](v7, "setSource:", 2);
      v3[2](v3, v7, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 23, 0);
      v7 = (MPCModelGenericAVItemAssetLoadResult *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, MPCModelGenericAVItemAssetLoadResult *))v3)[2](v3, 0, v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 24, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, MPCModelGenericAVItemAssetLoadResult *, void *))v3)[2](v3, 0, v6);
  }

}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (void)setAssetLoadProperties:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoadProperties, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
}

void __56__MPCModelGenericAVItemHomeSharingLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[35];
  v10 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 280);
    *(_QWORD *)(v8 + 280) = 0;

    v5 = v10;
    v6 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v6, "finishWithError:", v5);

}

@end
