@implementation _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation

- (_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5
{
  _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation *v5;
  _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation *v6;
  _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation;
  v5 = -[PHPhotoLibraryFeatureAvailabilityTask initWithFeature:photoLibrary:availabilityConfig:](&v9, sel_initWithFeature_photoLibrary_availabilityConfig_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  PHPhotoLibraryFeatureAvailability *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  PHPhotoLibraryFeatureAvailability *v13;
  NSObject *v14;
  NSObject *v15;
  PHPhotoLibraryFeatureAvailability *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  PHPhotoLibraryFeatureAvailability *v21;
  _QWORD v22[4];
  PHPhotoLibraryFeatureAvailability *v23;
  id v24;
  _QWORD *v25;
  uint8_t *v26;
  id v27;
  NSObject *v28;
  os_signpost_id_t v29;
  _QWORD v30[4];
  PHPhotoLibraryFeatureAvailability *v31;
  NSObject *v32;
  _QWORD *v33;
  uint8_t *v34;
  id v35;
  _QWORD block[4];
  PHPhotoLibraryFeatureAvailability *v37;
  NSObject *v38;
  _QWORD *v39;
  uint8_t *v40;
  id v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];
  char v49;
  id location[2];

  v4 = a3;
  PLPhotosSearchGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MemoriesCreationFeatureAvailability", ", buf, 2u);
  }

  v9 = -[PHPhotoLibraryFeatureAvailability initWithFeature:]([PHPhotoLibraryFeatureAvailability alloc], "initWithFeature:", -[PHPhotoLibraryFeatureAvailabilityTask feature](self, "feature"));
  v10 = dispatch_group_create();
  objc_initWeak(location, self);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 1;
  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__20604;
  v46 = __Block_byref_object_dispose__20605;
  v47 = 0;
  dispatch_group_enter(v10);
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E35DA918;
  objc_copyWeak(&v41, location);
  v13 = v9;
  v37 = v13;
  v39 = v48;
  v40 = buf;
  v14 = v10;
  v38 = v14;
  dispatch_async(v11, block);

  dispatch_group_enter(v14);
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke_2;
  v30[3] = &unk_1E35DA918;
  objc_copyWeak(&v35, location);
  v16 = v13;
  v31 = v16;
  v33 = v48;
  v34 = buf;
  v17 = v14;
  v32 = v17;
  dispatch_async(v15, v30);

  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3254779904;
  v22[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke_3;
  v22[3] = &unk_1E35D5200;
  objc_copyWeak(&v27, location);
  v23 = v16;
  v24 = v4;
  v25 = v48;
  v26 = buf;
  v28 = v8;
  v29 = v6;
  v19 = v8;
  v20 = v4;
  v21 = v16;
  dispatch_group_notify(v17, v18, v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v41);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v48, 8);
  objc_destroyWeak(location);

}

- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3
{
  NSObject *v4;
  unsigned int v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  -[PHPhotoLibraryFeatureAvailabilityTask queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_msgSend(v16, "photosKnowledgeGraphIsReady");
  objc_msgSend(v16, "fractionOfStillAssetsWithEmbeddingsInIndex");
  v7 = v6;
  -[PHPhotoLibraryFeatureAvailabilityTask availabilityConfig](self, "availabilityConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
  v10 = v9;

  v11 = objc_msgSend(v16, "numberOfCuratedAssets");
  -[PHPhotoLibraryFeatureAvailabilityTask availabilityConfig](self, "availabilityConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "minimumNumberOfCuratedAssets");

  if (v7 >= v10)
    v14 = v5;
  else
    v14 = 0;
  if (v11 >= v13)
    v15 = v14;
  else
    v15 = 0;
  objc_msgSend(v16, "setFeatureAvailability:", v15);
  objc_msgSend(v16, "setStillAssetEmbeddingsAreIndexedEnough:", v7 >= v10);
  objc_msgSend(v16, "setLibraryHasEnoughCuratedAssets:", v11 >= v13);

}

@end
