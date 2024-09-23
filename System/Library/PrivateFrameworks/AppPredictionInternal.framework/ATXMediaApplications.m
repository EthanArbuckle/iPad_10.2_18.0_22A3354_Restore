@implementation ATXMediaApplications

- (ATXMediaApplications)init
{
  ATXMediaApplications *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXMediaApplications;
  v2 = -[ATXMediaApplications init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ATXMediaApplicationsQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    -[ATXMediaApplications _updateMediaApps](v2, "_updateMediaApps");
  }
  return v2;
}

- (void)_updateMediaApps
{
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;

  dispatch_suspend((dispatch_object_t)self->_queue);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("get-media-apps", v3);

  MRMediaRemoteGetAppsSupportingBrowsableContentAPIs();
}

void __40__ATXMediaApplications__updateMediaApps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __40__ATXMediaApplications__updateMediaApps__block_invoke_cold_1(a3, v5);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", a2);
    objc_msgSend(v6, "addObject:", CFSTR("com.apple.Music"));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)appSupportsMedia:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  char v8;
  void *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXMediaApplications.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ATXMediaApplications_appSupportsMedia___block_invoke;
  block[3] = &unk_1E82DF880;
  v12 = v5;
  v13 = &v14;
  block[4] = self;
  v7 = v5;
  dispatch_sync(queue, block);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __41__ATXMediaApplications_appSupportsMedia___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaApps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__ATXMediaApplications__updateMediaApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch media apps with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
