@implementation PHPhotoLibraryFeatureAvailabilityReporter

- (PHPhotoLibraryFeatureAvailabilityReporter)initWithPhotoLibrary:(id)a3
{
  id v5;
  PHPhotoLibraryFeatureAvailabilityReporter *v6;
  PHPhotoLibraryFeatureAvailabilityReporter *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *tasks;
  PHPhotoLibraryFeatureAvailabilityReporter *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHPhotoLibraryFeatureAvailabilityReporter;
  v6 = -[PHPhotoLibraryFeatureAvailabilityReporter init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.photolibrary.availability-reporter", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasks = v7->_tasks;
    v7->_tasks = v11;

    v7->_lock_tasks._os_unfair_lock_opaque = 0;
    v13 = v7;
  }

  return v7;
}

- (void)availabilityStatusForFeature:(unint64_t)a3 availabilityConfig:(id)a4 completionHandler:(id)a5
{
  id v8;
  PHPhotoLibrary *photoLibrary;
  void *v10;
  id v11;
  NSMutableDictionary *tasks;
  void *v13;
  NSObject *queue;
  _QWORD v15[4];
  id v16;
  PHPhotoLibraryFeatureAvailabilityReporter *v17;
  id v18;
  id v19;

  v8 = a5;
  photoLibrary = self->_photoLibrary;
  v19 = 0;
  +[PHPhotoLibraryFeatureAvailabilityTask availabilityStatusTaskForFeature:photoLibrary:availabilityConfig:error:](PHPhotoLibraryFeatureAvailabilityTask, "availabilityStatusTaskForFeature:photoLibrary:availabilityConfig:error:", a3, photoLibrary, a4, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock_tasks);
    tasks = self->_tasks;
    objc_msgSend(v10, "taskID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](tasks, "setObject:forKeyedSubscript:", v10, v13);

    os_unfair_lock_unlock(&self->_lock_tasks);
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke;
    v15[3] = &unk_1E35DF3B8;
    v16 = v10;
    v17 = self;
    v18 = v8;
    dispatch_async(queue, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
  }

}

- (void)availabilityStatusForFeature:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  PHFeatureAvailabilityConfig *v7;

  v6 = a4;
  v7 = -[PHFeatureAvailabilityConfig initWithFeature:]([PHFeatureAvailabilityConfig alloc], "initWithFeature:", a3);
  -[PHPhotoLibraryFeatureAvailabilityReporter availabilityStatusForFeature:availabilityConfig:completionHandler:](self, "availabilityStatusForFeature:availabilityConfig:completionHandler:", a3, v7, v6);

}

- (void)availabilityForFeature:(unint64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, id);
  PHFeatureAvailabilityReadOptions *v7;
  PHPhotoLibrary *photoLibrary;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = objc_alloc_init(PHFeatureAvailabilityReadOptions);
  photoLibrary = self->_photoLibrary;
  v11 = 0;
  -[PHPhotoLibrary featureAvailabilityForFeature:readOptions:error:](photoLibrary, "featureAvailabilityForFeature:readOptions:error:", a3, v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke_2;
  v4[3] = &unk_1E35DBE60;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "executeWithCompletionHandler:", v4);

}

void __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  os_unfair_lock_s *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a3;
  v9 = a2;
  os_unfair_lock_lock(v5);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "taskID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
