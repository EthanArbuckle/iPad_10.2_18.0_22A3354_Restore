@implementation NDOImageManager

+ (NDOImageManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__NDOImageManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (NDOImageManager *)(id)sharedManager_shared;
}

void __32__NDOImageManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initPrivate");
  v2 = (void *)sharedManager_shared;
  sharedManager_shared = v1;

}

- (id)initPrivate
{
  NDOImageManager *v2;
  NSCache *v3;
  NSCache *imageCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NDOImageManager;
  v2 = -[NDOImageManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

  }
  return v2;
}

- (void)resetCache
{
  -[NSCache removeAllObjects](self->_imageCache, "removeAllObjects");
}

- (id)fetchImageWithURLString:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  void (**v21)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[NDOImageManager imageCache](self, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v7[2](v7, v9, 0);
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke;
      v19[3] = &unk_24F334A38;
      v21 = v7;
      v19[4] = self;
      v20 = v6;
      objc_msgSend(v12, "dataTaskWithURL:completionHandler:", v11, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "resume");
      v13 = v21;
    }
    else
    {
      _NDOLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NDOImageManager fetchImageWithURLString:completion:].cold.1();

      v15 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v17, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, void *, void *))v7)[2](v7, 0, v13);
      v10 = 0;
    }

  }
  return v10;
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _NDOLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_3();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_5;
    block[3] = &unk_24F334A10;
    v39 = *(id *)(a1 + 48);
    v38 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v11 = v39;
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "imageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, *(_QWORD *)(a1 + 40));

      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_2;
      v28[3] = &unk_24F334A10;
      v30 = *(id *)(a1 + 48);
      v29 = v11;
      dispatch_async(MEMORY[0x24BDAC9B8], v28);

      v13 = v30;
    }
    else
    {
      _NDOLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_2();

      v40[0] = CFSTR("data");
      v40[1] = CFSTR("response");
      v41[0] = v7;
      v21 = v8;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41[1] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)

      v22 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v24, 2, v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_13;
      v31[3] = &unk_24F334A10;
      v26 = *(id *)(a1 + 48);
      v32 = v25;
      v33 = v26;
      v27 = v25;
      dispatch_async(MEMORY[0x24BDAC9B8], v31);

    }
  }
  else
  {
    _NDOLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_1();

    v15 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_6;
    v34[3] = &unk_24F334A10;
    v19 = *(id *)(a1 + 48);
    v35 = v18;
    v36 = v19;
    v11 = v18;
    dispatch_async(MEMORY[0x24BDAC9B8], v34);

  }
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)fetchImageWithURLString:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_229EC7000, v0, v1, "Image url conversion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_229EC7000, v0, v1, "data error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_229EC7000, v0, v1, "no image error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_229EC7000, v0, v1, "task error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
