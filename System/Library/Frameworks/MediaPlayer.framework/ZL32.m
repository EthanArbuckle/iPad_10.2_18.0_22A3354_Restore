@implementation ZL32

MPArtworkCatalog *___ZL32_MPMLInitPropertySocialPersonMapv_block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  MPArtworkCatalog *v6;
  MPArtworkCatalog *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v9[0] = CFSTR("url");
  v9[1] = CFSTR("width");
  v10[0] = v1;
  v10[1] = &unk_1E31E4E88;
  v9[2] = CFSTR("height");
  v10[2] = &unk_1E31E4E88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC070]), "initWithArtworkResponseDictionary:", v2);
  +[MPStoreArtworkRequestToken tokenWithImageArtworkInfo:](MPStoreArtworkRequestToken, "tokenWithImageArtworkInfo:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPArtworkCatalog initWithToken:dataSource:]([MPArtworkCatalog alloc], "initWithToken:dataSource:", v4, v5);
  if ((objc_msgSend(v5, "areRepresentationsAvailableForCatalog:", v6) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

void *___ZL32_MPMLInitPropertySocialPersonMapv_block_invoke_5()
{
  return &unk_1E31E4DF8;
}

@end
