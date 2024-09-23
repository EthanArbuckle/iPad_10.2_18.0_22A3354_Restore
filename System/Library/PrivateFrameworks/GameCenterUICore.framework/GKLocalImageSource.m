@implementation GKLocalImageSource

- (id)keyForImageSize:(CGSize)a3
{
  double height;
  double width;
  NSMapTable *v6;
  NSMapTable *keysForSizes;
  id v8;
  void *v9;
  void *v10;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  if (!self->_keysForSizes)
  {
    v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 256, 0, 4);
    keysForSizes = self->_keysForSizes;
    self->_keysForSizes = v6;

  }
  v8 = (id)((unint64_t)width | ((unint64_t)height << 32));
  -[NSMapTable objectForKey:](self->_keysForSizes, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12.width = width;
    v12.height = height;
    NSStringFromCGSize(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKImageKey keyForImageIdentifier:withImageSource:](GKImageKey, "keyForImageIdentifier:withImageSource:", v10, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSize:", width, height);
    -[NSMapTable setObject:forKey:](self->_keysForSizes, "setObject:forKey:", v9, v8);

  }
  return v9;
}

- (id)imageForImageSize:(CGSize)a3
{
  void *v4;
  void *v5;

  -[GKLocalImageSource keyForImageSize:](self, "keyForImageSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKImageSource cachedImageForKey:](self, "cachedImageForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[GKImageSource processAndCacheImage:forKey:](self, "processAndCacheImage:forKey:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)cachedImageFromGamedWithSubdirectory:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKImageSource.m", 921, "-[GKLocalImageSource cachedImageFromGamedWithSubdirectory:handler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke;
  v17[3] = &unk_24DC27340;
  v17[4] = self;
  v12 = v6;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  objc_msgSend(v13, "perform:", v17);
  if (v7)
  {
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_255;
    v14[3] = &unk_24DC27910;
    v16 = v7;
    v15 = v13;
    objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v14);

  }
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyForImageIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "setResult:", v7);
    v3[2](v3);
    v8 = (NSObject **)MEMORY[0x24BE3A308];
    v9 = *MEMORY[0x24BE3A308];
    if (!*MEMORY[0x24BE3A308])
    {
      v10 = (id)GKOSLoggers();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_cold_1(v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "utilityService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "basename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254;
    v16[3] = &unk_24DC27F48;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 32);
    v17 = v14;
    v18 = v15;
    v19 = v5;
    v20 = v4;
    v21 = v3;
    objc_msgSend(v11, "loadCachedImageDataFromSubdirectory:withFileName:handler:", v12, v13, v16);

  }
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "_gkImageWithCheckedData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "setResult:", v4);
      objc_msgSend(*(id *)(a1 + 40), "cache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));

      v6 = (NSObject **)MEMORY[0x24BE3A308];
      v7 = *MEMORY[0x24BE3A308];
      if (!*MEMORY[0x24BE3A308])
      {
        v8 = (id)GKOSLoggers();
        v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_3(a1, v7);
    }
    else
    {
      if (!*MEMORY[0x24BE3A308])
        v11 = (id)GKOSLoggers();
      v12 = (void *)*MEMORY[0x24BE3A300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
        __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_2(a1, v12);
    }

  }
  else
  {
    if (!*MEMORY[0x24BE3A308])
      v9 = (id)GKOSLoggers();
    v10 = (void *)*MEMORY[0x24BE3A300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_1(a1, v10);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_255(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)cacheImageUsingGamed:(id)a3 cacheSubdirectory:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKImageSource.m", 966, "-[GKLocalImageSource cacheImageUsingGamed:cacheSubdirectory:withHandler:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke;
  v19[3] = &unk_24DC27340;
  v19[4] = self;
  v15 = v9;
  v20 = v15;
  v16 = v8;
  v21 = v16;
  objc_msgSend(v13, "perform:", v19);
  if (v10)
  {
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_3;
    v17[3] = &unk_24DC275B8;
    v18 = v10;
    objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v17);

  }
}

void __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyForImageIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "cacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

  UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "utilityService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "basename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_2;
  v13[3] = &unk_24DC275B8;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v9, "cacheImageData:inSubdirectory:withFileName:handler:", v8, v10, v11, v13);

}

uint64_t __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteImageUsingGamedWithSubdirectory:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKImageSource.m", 987, "-[GKLocalImageSource deleteImageUsingGamedWithSubdirectory:withHandler:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchGroupWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke;
  v15[3] = &unk_24DC276A8;
  v15[4] = self;
  v12 = v6;
  v16 = v12;
  objc_msgSend(v10, "perform:", v15);
  if (v7)
  {
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_3;
    v13[3] = &unk_24DC275B8;
    v14 = v7;
    objc_msgSend(v10, "notifyOnMainQueueWithBlock:", v13);

  }
}

void __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyForImageIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_msgSend(*(id *)(a1 + 32), "utilityService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "basename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_2;
  v11[3] = &unk_24DC275B8;
  v12 = v3;
  v10 = v3;
  objc_msgSend(v7, "deleteCachedImageDataFromSubdirectory:withFileName:handler:", v8, v9, v11);

}

uint64_t __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSMapTable)keysForSizes
{
  return self->_keysForSizes;
}

- (void)setKeysForSizes:(id)a3
{
  objc_storeStrong((id *)&self->_keysForSizes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysForSizes, 0);
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "basename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v1, v4, "Image found in in-memory cache: %@", v5);

  OUTLINED_FUNCTION_7();
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 56);
  v3 = a2;
  objc_msgSend(v2, "basename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_0_2(&dword_219F71000, v3, v6, "Failed to load cached image from gamed: %@\ncache key: %@", v7);

}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "basename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_219F71000, v2, OS_LOG_TYPE_ERROR, "Failed to create cached image from gamed %@", v4, 0xCu);

  OUTLINED_FUNCTION_7();
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_254_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_8(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "basename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v2, v4, "Loaded cached image from gamed %@", v5);

  OUTLINED_FUNCTION_7();
}

@end
