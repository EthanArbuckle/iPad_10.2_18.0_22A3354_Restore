@implementation HRBrandImageManager

+ (double)defaultLogoDimension
{
  return 60.0;
}

+ (id)imageManagerWithHealthRecordsStore:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHealthRecordsStore:", v4);

  return v5;
}

- (HRBrandImageManager)initWithHealthRecordsStore:(id)a3
{
  id v4;
  HRBrandImageManager *v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HRBrandImageManager;
  v5 = -[HRBrandImageManager init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[HRBrandImageManager setFileOperationQueue:](v5, "setFileOperationQueue:", v6);

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRBrandImageManager fileOperationQueue](v5, "fileOperationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v8);

    -[HRBrandImageManager fileOperationQueue](v5, "fileOperationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    objc_msgSend(v10, "addOperation:", v11);

    -[HRBrandImageManager setHealthRecordsStore:](v5, "setHealthRecordsStore:", v4);
    v12 = objc_alloc(MEMORY[0x1E0D2EEE8]);
    objc_msgSend(v4, "healthStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithHealthStore:", v13);
    -[HRBrandImageManager setProviderServiceStore:](v5, "setProviderServiceStore:", v14);

  }
  return v5;
}

- (NSCache)fetchedImages
{
  NSCache *fetchedImages;
  NSCache *v4;
  NSCache *v5;

  fetchedImages = self->_fetchedImages;
  if (!fetchedImages)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_fetchedImages;
    self->_fetchedImages = v4;

    fetchedImages = self->_fetchedImages;
  }
  return fetchedImages;
}

- (NSMutableDictionary)outstandingRequests
{
  NSMutableDictionary *outstandingRequests;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  outstandingRequests = self->_outstandingRequests;
  if (!outstandingRequests)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_outstandingRequests;
    self->_outstandingRequests = v4;

    outstandingRequests = self->_outstandingRequests;
  }
  return outstandingRequests;
}

- (id)_scaleKeyForCurrentDevice
{
  void *v2;
  double v3;
  double v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  v5 = CFSTR("3x");
  if (v4 == 2.0)
    v5 = CFSTR("2x");
  if (v4 == 1.0)
    return CFSTR("1x");
  else
    return (id)v5;
}

- (void)cacheFeaturedBrandLogosWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HRBrandImageManager providerServiceStore](self, "providerServiceStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBrandImageManager _scaleKeyForCurrentDevice](self, "_scaleKeyForCurrentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke;
  v8[3] = &unk_1E74D2068;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchLogoDataForFeaturedBrandsAtScaleKey:completion:", v6, v8);

}

void __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke_2;
  v12[3] = &unk_1E74D1560;
  v13 = v5;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v9;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "addOperationWithBlock:", v12);

}

uint64_t __61__HRBrandImageManager_cacheFeaturedBrandLogosWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 40));
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = *(void **)(a1 + 32);
    v5 = v2;
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_1BC30A000, v5, OS_LOG_TYPE_INFO, "Caching brand logo for %@ featured brands", buf, 0xCu);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB63A8]), "initWithExternalID:batchID:", v13, CFSTR("featured"));
        v15 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "processFetchResponseWithData:error:brand:", v16, 0, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)onMainQueue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v6[2]();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

- (void)retrieveLogoForBrand:(id)a3 size:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  char v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  -[HRBrandImageManager loadStoredLogoForBrand:](self, "loadStoredLogoForBrand:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke;
    v17[3] = &unk_1E74D2090;
    v19 = v10;
    v18 = v11;
    -[HRBrandImageManager onMainQueue:](self, "onMainQueue:", v17);

    v12 = v19;
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isLocalDevelopmentSampleBrand"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_2;
    v15[3] = &unk_1E74D20B8;
    v16 = v10;
    -[HRBrandImageManager onMainQueue:](self, "onMainQueue:", v15);
    v12 = v16;
    goto LABEL_8;
  }
  if ((v7 & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_3;
    v13[3] = &unk_1E74D20B8;
    v14 = v10;
    -[HRBrandImageManager onMainQueue:](self, "onMainQueue:", v13);
    v12 = v14;
    goto LABEL_8;
  }
  -[HRBrandImageManager fetchLogoForBrand:completion:](self, "fetchLogoForBrand:completion:", v9, v10);
LABEL_9:

}

uint64_t __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 608, CFSTR("This is a develompent sample brand, not requesting logo."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __68__HRBrandImageManager_retrieveLogoForBrand_size_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 608, CFSTR("Fetching brand image at most once per launch."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)loadStoredLogoForBrand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "externalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBrandImageManager fetchedImages](self, "fetchedImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[HRBrandImageManager _logoURLForBrand:](self, "_logoURLForBrand:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC3870]);
      objc_msgSend(v9, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v10, "initWithContentsOfFile:", v11);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)fetchLogoForBrand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBrandImageManager outstandingRequests](self, "outstandingRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = _Block_copy(v7);
  if (v10)
  {
    objc_msgSend(v10, "addObject:", v11);

  }
  else
  {
    v19[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    -[HRBrandImageManager outstandingRequests](self, "outstandingRequests");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v8);

    -[HRBrandImageManager providerServiceStore](self, "providerServiceStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRBrandImageManager _scaleKeyForCurrentDevice](self, "_scaleKeyForCurrentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__HRBrandImageManager_fetchLogoForBrand_completion___block_invoke;
    v17[3] = &unk_1E74D20E0;
    v17[4] = self;
    v18 = v6;
    objc_msgSend(v15, "fetchLogoDataForBrand:scaleKey:completion:", v18, v16, v17);

  }
}

uint64_t __52__HRBrandImageManager_fetchLogoForBrand_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFetchResponseWithData:error:brand:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)processFetchResponseWithData:(id)a3 error:(id)a4 brand:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HRBrandImageManager _writeImageData:brand:](self, "_writeImageData:brand:", v8, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Image decoding error for brand"));
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v16;
    }
    -[HRBrandImageManager dispatchResponsesForBrand:image:error:](self, "dispatchResponsesForBrand:image:error:", v10, v11, v9);

  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      -[HRBrandImageManager processFetchResponseWithData:error:brand:].cold.1(v12, v10);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    HKSensitiveLogItem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_error:format:", 100, CFSTR("Unable to fetch image for brand: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRBrandImageManager dispatchResponsesForBrand:image:error:](self, "dispatchResponsesForBrand:image:error:", v10, 0, v15);

  }
}

- (void)dispatchResponsesForBrand:(id)a3 image:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "externalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HRBrandImageManager_dispatchResponsesForBrand_image_error___block_invoke;
  v14[3] = &unk_1E74D1288;
  v14[4] = self;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[HRBrandImageManager onMainQueue:](self, "onMainQueue:", v14);

}

void __61__HRBrandImageManager_dispatchResponsesForBrand_image_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "outstandingRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "outstandingRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchedImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_writeImageData:(id)a3 brand:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  -[HRBrandImageManager _logoURLForBrand:](self, "_logoURLForBrand:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HRBrandImageManager fileOperationQueue](self, "fileOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__HRBrandImageManager__writeImageData_brand___block_invoke;
    v17[3] = &unk_1E74D1A90;
    v18 = v6;
    v19 = v7;
    objc_msgSend(v8, "addOperationWithBlock:", v17);

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      -[HRBrandImageManager _writeImageData:brand:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __45__HRBrandImageManager__writeImageData_brand___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v3 = objc_msgSend(v2, "writeToURL:options:error:", v1, 805306369, &v12);
  v4 = v12;
  if ((v3 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      __45__HRBrandImageManager__writeImageData_brand___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (id)_logoURLForBrand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;

  objc_msgSend(a3, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRBrandImageManager _hashedSaltedStringFromString:](self, "_hashedSaltedStringFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("BrandLogos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v41);
      v14 = v41;

      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB52D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
          -[HRBrandImageManager _logoURLForBrand:].cold.3((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
      }

    }
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v22, 0);
    }
    else
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[HRBrandImageManager _logoURLForBrand:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);
      v23 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
      -[HRBrandImageManager _logoURLForBrand:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    v23 = 0;
  }

  return v23;
}

- (id)_hashedSaltedStringFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_fetchOrCreateSalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_MD5");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_retainAutorelease(v7);
      v10 = objc_msgSend(v9, "bytes");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v9, "length"));
      if (objc_msgSend(v9, "length"))
      {
        v12 = 0;
        do
          objc_msgSend(v11, "appendFormat:", CFSTR("%02.2hhX"), *(char *)(v10 + v12++));
        while (v12 < objc_msgSend(v9, "length"));
      }
      v13 = (void *)objc_msgSend(v11, "copy");

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_fetchOrCreateSalt
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFTypeRef result;

  v2 = a1;
  objc_sync_enter(v2);
  if (_fetchOrCreateSalt__salt)
  {
    v3 = (id)_fetchOrCreateSalt__salt;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.HealthUI.BrandImageManager"), *MEMORY[0x1E0CD6900]);
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD68F0], *MEMORY[0x1E0CD68A0]);
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE40], *MEMORY[0x1E0CD6B80]);
    v5 = *MEMORY[0x1E0C9AE50];
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD69D8]);
    objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7018]);
    result = 0;
    v6 = SecItemCopyMatching((CFDictionaryRef)v4, &result);
    v7 = v6;
    if ((_DWORD)v6 != -25300 && (_DWORD)v6)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        +[HRBrandImageManager _fetchOrCreateSalt].cold.1(v7, v11, v12, v13, v14, v15, v16, v17);
      v3 = 0;
    }
    else
    {
      v8 = (void *)result;
      if (result)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", result, 4);
        v10 = (void *)_fetchOrCreateSalt__salt;
        _fetchOrCreateSalt__salt = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "UUIDString");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)_fetchOrCreateSalt__salt;
        _fetchOrCreateSalt__salt = v19;

        v10 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend((id)_fetchOrCreateSalt__salt, "dataUsingEncoding:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v21, *MEMORY[0x1E0CD70D8]);

        v22 = SecItemAdd((CFDictionaryRef)v10, 0);
        if ((_DWORD)v22)
        {
          _HKInitializeLogging();
          v23 = *MEMORY[0x1E0CB52D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
            +[HRBrandImageManager _fetchOrCreateSalt].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
        }
      }

      v3 = (id)_fetchOrCreateSalt__salt;
    }

  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setFetchedImages:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedImages, a3);
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (void)setHealthRecordsStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthRecordsStore, a3);
}

- (NSOperationQueue)fileOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HKClinicalProviderServiceStore)providerServiceStore
{
  return self->_providerServiceStore;
}

- (void)setProviderServiceStore:(id)a3
{
  objc_storeStrong((id *)&self->_providerServiceStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerServiceStore, 0);
  objc_storeStrong((id *)&self->_fileOperationQueue, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_fetchedImages, 0);
}

- (void)processFetchResponseWithData:(void *)a1 error:(void *)a2 brand:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "externalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1BC30A000, v3, OS_LOG_TYPE_ERROR, "Unable to fetch image for brand %@. error: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_writeImageData:(uint64_t)a3 brand:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "Cannot create logo URL for brand", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __45__HRBrandImageManager__writeImageData_brand___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Caching logo for brand failed. This isn't harmful but will degrade perceived UI performance. %@", a5, a6, a7, a8, 2u);
}

- (void)_logoURLForBrand:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "Unable to generate brand logo filename", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)_logoURLForBrand:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1BC30A000, a1, a3, "Unable to determine brand logo file URL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)_logoURLForBrand:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Unable to create logo cache directory: %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)_fetchOrCreateSalt
{
  OUTLINED_FUNCTION_2_1(&dword_1BC30A000, a2, a3, "Error inserting salt into keychain: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
