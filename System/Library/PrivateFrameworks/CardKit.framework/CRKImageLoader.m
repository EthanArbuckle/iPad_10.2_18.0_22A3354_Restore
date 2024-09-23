@implementation CRKImageLoader

uint64_t __53___CRKImageLoader_sharedInstanceWithInitialDelegate___block_invoke(uint64_t a1)
{
  _CRKImageLoader *v2;
  void *v3;

  v2 = objc_alloc_init(_CRKImageLoader);
  v3 = (void *)sharedInstanceWithInitialDelegate__sImageLoader;
  sharedInstanceWithInitialDelegate__sImageLoader = (uint64_t)v2;

  return objc_msgSend((id)sharedInstanceWithInitialDelegate__sImageLoader, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __51___CRKImageLoader_loadImage_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BE84E60];
  v6 = a3;
  objc_msgSend(a2, "_imageData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithData:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);

}

void __49___CRKImageLoader__loadSFImageForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "statusCode");
  if (v7)
  {
    v11 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_218FCB000, v11, OS_LOG_TYPE_INFO, "Image fetch success statusCode:%ld URL:%@", buf, 0x16u);
    }
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BE84E60], "imageWithData:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);
  }
  else
  {
    if (v8)
    {
      v22 = CFSTR("NSURLResponse");
      v23[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)MEMORY[0x24BE154D8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Image fetch failed statusCode:%zd URL:%@"), v10, *(_QWORD *)(a1 + 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithCode:description:underlyingError:userInfo:", 204, v16, v9, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[_CRKImageLoader loadImage:withCompletionHandler:].cold.1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
