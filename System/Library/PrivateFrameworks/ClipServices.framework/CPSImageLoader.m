@implementation CPSImageLoader

- (CPSImageLoader)init
{
  CPSImageLoader *v2;
  CPSImageDownloader *v3;
  CPSImageDownloader *imageDownloader;
  CPSMapsImageLoader *v5;
  CPSMapsImageLoader *mapsImageLoader;
  CPSImageStore *v7;
  CPSImageStore *imageStore;
  CPSImageLoader *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPSImageLoader;
  v2 = -[CPSImageLoader init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CPSImageDownloader);
    imageDownloader = v2->_imageDownloader;
    v2->_imageDownloader = v3;

    v5 = -[CPSMapsImageLoader initWithImageDownloader:]([CPSMapsImageLoader alloc], "initWithImageDownloader:", v2->_imageDownloader);
    mapsImageLoader = v2->_mapsImageLoader;
    v2->_mapsImageLoader = v5;

    v7 = objc_alloc_init(CPSImageStore);
    imageStore = v2->_imageStore;
    v2->_imageStore = v7;

    v9 = v2;
  }

  return v2;
}

- (void)loadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void (**v15)(id, _QWORD, id);
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[CPSImageLoader imageStore](self, "imageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend((id)objc_opt_class(), "keyForImageURL:error:", v6, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    -[CPSImageLoader imageDownloader](self, "imageDownloader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke;
    v12[3] = &unk_24C3BA568;
    v15 = v7;
    v12[4] = self;
    v13 = v9;
    v14 = v6;
    objc_msgSend(v11, "downloadImageWithURL:completionHandler:", v14, v12);

  }
}

void __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  id v12;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    objc_msgSend(v6, "storeImageData:forKey:error:", v5, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke_cold_1(a1, v10);
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v11();

  }
}

- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  void (**v17)(id, _QWORD, id);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[CPSImageLoader imageStore](self, "imageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend((id)objc_opt_class(), "keyForGEOStyleAttributes:error:", v6, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    -[CPSImageLoader imageStore](self, "imageStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storedImageForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      ((void (**)(id, void *, id))v7)[2](v7, v12, 0);
    }
    else
    {
      -[CPSImageLoader mapsImageLoader](self, "mapsImageLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke;
      v14[3] = &unk_24C3BA568;
      v17 = v7;
      v14[4] = self;
      v15 = v9;
      v16 = v6;
      objc_msgSend(v13, "loadImageForGEOStyleAttributes:completionHandler:", v16, v14);

    }
  }

}

void __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  id v12;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    objc_msgSend(v6, "storeImageData:forKey:error:", v5, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke_cold_1(a1, v10);
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v11();

  }
}

- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, _QWORD, id);
  unint64_t v16;
  id v17;

  v6 = (void (**)(id, _QWORD, id))a4;
  -[CPSImageLoader imageStore](self, "imageStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend((id)objc_opt_class(), "keyForPOIMuid:error:", a3, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (v9)
  {
    v6[2](v6, 0, v9);
  }
  else
  {
    -[CPSImageLoader imageStore](self, "imageStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storedImageForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ((void (**)(id, void *, id))v6)[2](v6, v11, 0);
    }
    else
    {
      -[CPSImageLoader mapsImageLoader](self, "mapsImageLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke;
      v13[3] = &unk_24C3BA590;
      v15 = v6;
      v13[4] = self;
      v14 = v8;
      v16 = a3;
      objc_msgSend(v12, "loadImageForMapItemMUID:completionHandler:", a3, v13);

    }
  }

}

void __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void (*v11)(void);
  id v12;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "imageStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    objc_msgSend(v6, "storeImageData:forKey:error:", v5, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_cold_1(a1, v10);
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v11();

  }
}

- (CPSImageDownloader)imageDownloader
{
  return self->_imageDownloader;
}

- (void)setImageDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_imageDownloader, a3);
}

- (CPSMapsImageLoader)mapsImageLoader
{
  return self->_mapsImageLoader;
}

- (void)setMapsImageLoader:(id)a3
{
  objc_storeStrong((id *)&self->_mapsImageLoader, a3);
}

- (CPSImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_mapsImageLoader, 0);
  objc_storeStrong((id *)&self->_imageDownloader, 0);
}

void __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_3_1(a1, a2);
  objc_msgSend(0, "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD44000, v4, v5, "Failed to store image for imageURL %{sensitive}@ - %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5();
}

void __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = OUTLINED_FUNCTION_3_1(a1, a2);
  objc_msgSend(0, "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD44000, v4, v5, "Failed to store image for style attributes %@ - %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5();
}

void __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a2;
  objc_msgSend(0, "cps_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_20AD44000, v4, v5, "Failed to store image for map item with MUID %{private}llu - %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5();
}

@end
