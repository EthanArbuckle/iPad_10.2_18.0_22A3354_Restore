@implementation CPSMapsImageLoader

- (CPSMapsImageLoader)initWithImageDownloader:(id)a3
{
  id v5;
  CPSMapsImageLoader *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  CPSMapsImageLoader *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPSMapsImageLoader;
  v6 = -[CPSMapsImageLoader init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ClipServices.%@.%p"), objc_opt_class(), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_imageDownloader, a3);
    v12 = v6;
  }

  return v6;
}

- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CPSMapsImageLoader *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CPSMapsImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke;
  block[3] = &unk_24C3B9350;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __71__CPSMapsImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3CBE0]), "initWithPlaceStyleAttributes:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_loadImageForGEOFeatureStyleAttributes:completionHandler:", v2, *(_QWORD *)(a1 + 48));

}

- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke;
  block[3] = &unk_24C3BAB78;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CF50]), "initWithMUID:coordinate:", a1[6], -180.0, -180.0);
  objc_msgSend(MEMORY[0x24BE3CF68], "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setWantsBrandIcon:", 1);
  objc_msgSend(MEMORY[0x24BE3CF68], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ticketForIdentifiers:resultProviderID:contentProvider:traits:", v6, 0, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2;
  v9[3] = &unk_24C3BAB50;
  v8 = (void *)a1[5];
  v9[4] = a1[4];
  v10 = v8;
  objc_msgSend(v7, "submitWithHandler:networkActivity:", v9, 0);

}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bestAvatarBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_styleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "downloadImageWithURL:completionHandler:", v7, *(_QWORD *)(a1 + 40));
  }
  else if (v8)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_3;
    block[3] = &unk_24C3B9350;
    block[4] = v10;
    v23 = v8;
    v24 = *(id *)(a1 + 40);
    dispatch_async(v11, block);

  }
  else
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

    }
  }

}

uint64_t __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadImageForGEOFeatureStyleAttributes:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_loadImageForGEOFeatureStyleAttributes:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  CGImage *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGImage *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v6 = (void (**)(id, void *, _QWORD))a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  v9 = objc_alloc_init(MEMORY[0x24BEBFBC8]);
  objc_msgSend(v9, "setGlyphOnly:", 1);
  objc_msgSend(MEMORY[0x24BEBFBC0], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _CPSScreenScale();
  *(float *)&v11 = v11;
  objc_msgSend(v10, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v8, CFSTR("default-search"), 9, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBFBC0], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = _CPSScreenScale();
  *(float *)&v14 = v14;
  objc_msgSend(v13, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v8, CFSTR("default-search"), 9, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v12, "image");
  if (v12 && v15)
  {
    v17 = (CGImage *)v16;
    objc_msgSend(v15, "imageSize");
    v19 = v18;
    v21 = v20;
    v22 = _CPSScreenScale();
    objc_msgSend(v15, "imageSize");
    v24 = v23;
    objc_msgSend(v15, "imageSize");
    v26 = CPSCreateImageFromImageAndBackgroundColor(v17, (CGColor *)objc_msgSend(v15, "fillColor"), v19, v21, v22, 0.0, 0.0, v24, v25);
    CPSImagePNGRepresentation(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      CGImageRelease(v26);
    if (v27)
    {
      v6[2](v6, v27, 0);
    }
    else
    {
      v36 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        -[CPSMapsImageLoader _loadImageForGEOFeatureStyleAttributes:completionHandler:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v44);

    }
  }
  else
  {
    v28 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CPSMapsImageLoader _loadImageForGEOFeatureStyleAttributes:completionHandler:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v27);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloader, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __64__CPSMapsImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Failed to get map item for muid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_loadImageForGEOFeatureStyleAttributes:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Failed to get png representation from maps icon image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_loadImageForGEOFeatureStyleAttributes:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Failed to get maps icon image for style attributes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
