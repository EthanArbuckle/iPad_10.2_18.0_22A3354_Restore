@implementation NTKCompanionFaceRenderer

- (NTKCompanionFaceRenderer)init
{
  NTKCompanionFaceRenderer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  uint64_t v6;
  NSMutableArray *pendingTaskList;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKCompanionFaceRenderer;
  v2 = -[NTKCompanionFaceRenderer init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.nanotimekitcompaniond.render-queue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    pendingTaskList = v2->_pendingTaskList;
    v2->_pendingTaskList = (NSMutableArray *)v6;

    v2->_queueActive = 0;
  }
  return v2;
}

- (void)requestSnapshotOfFace:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  int v10;
  _QWORD block[4];
  id v12;
  NTKCompanionFaceRenderer *v13;
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend((id)objc_opt_class(), "snapshotPathForFace:detailMode:", v6, 0x7FFFFFFFFFFFFFFFLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    v7[2](v7);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__NTKCompanionFaceRenderer_requestSnapshotOfFace_completion___block_invoke;
    block[3] = &unk_1E6BCEA00;
    v12 = v6;
    v13 = self;
    v14 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __61__NTKCompanionFaceRenderer_requestSnapshotOfFace_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  _NTKCompanionFaceRenderingTask *v6;
  _BYTE *v7;
  _NTKCompanionFaceRenderingTask *v8;

  v8 = -[_NTKCompanionFaceRenderingTask initWithFace:detailMode:completionHandler:]([_NTKCompanionFaceRenderingTask alloc], "initWithFace:detailMode:completionHandler:", *(_QWORD *)(a1 + 32), 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:");
  v2 = +[NTKFaceView numberOfDetailModesForFaceStyle:](NTKFaceView, "numberOfDetailModesForFaceStyle:", objc_msgSend(*(id *)(a1 + 32), "faceStyle"));
  if (v2 >= 1)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
      v6 = -[_NTKCompanionFaceRenderingTask initWithFace:detailMode:completionHandler:]([_NTKCompanionFaceRenderingTask alloc], "initWithFace:detailMode:completionHandler:", *(_QWORD *)(a1 + 32), i, 0);
      objc_msgSend(v5, "addObject:", v6);

    }
  }
  v7 = *(_BYTE **)(a1 + 40);
  if (!v7[24])
    objc_msgSend(v7, "_startNextWorkItem");

}

+ (id)_snapshotNameForFace:(id)a3 detailMode:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "dailySnapshotKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("~mode%d"), a4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

+ (id)snapshotPathForFace:(id)a3 detailMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "_storagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_snapshotNameForFace:detailMode:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("png"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_storagePath
{
  if (_storagePath_onceToken != -1)
    dispatch_once(&_storagePath_onceToken, &__block_literal_global_122);
  return (id)_storagePath___storagePath;
}

void __40__NTKCompanionFaceRenderer__storagePath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  NTKCacheDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("SnapshotImages"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_storagePath___storagePath;
  _storagePath___storagePath = v1;

  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _storagePath___storagePath, 1, 0, 0);
}

- (void)_notifyFinishedFaceBatchIfNeeded
{
  void (**faceBatchCompletionHandler)(id, SEL);
  id v4;

  faceBatchCompletionHandler = (void (**)(id, SEL))self->_faceBatchCompletionHandler;
  if (faceBatchCompletionHandler)
  {
    faceBatchCompletionHandler[2](faceBatchCompletionHandler, a2);
    v4 = self->_faceBatchCompletionHandler;
    self->_faceBatchCompletionHandler = 0;

  }
}

- (void)_startNextWorkItem
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  NTKFaceViewController *v8;
  NTKFace *v9;
  NTKFaceSnapshottingWindow *v10;
  NTKFaceSnapshottingWindow *window;
  NTKFaceSnapshottingWindow *v12;
  void *v13;
  void *v14;
  NTKFaceViewController *v15;
  void *v16;
  void *v17;
  id faceBatchCompletionHandler;
  NTKFace *v19;
  NTKFace *currentFace;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *workQueue;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  int v46;
  char v47;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableArray firstObject](self->_pendingTaskList, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self->_queueActive = 1;
    -[NSMutableArray removeObjectAtIndex:](self->_pendingTaskList, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "completionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isMemberOfBatch");
    objc_msgSend(v3, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEquivalentToFace:", self->_currentFace);

    if ((v7 & 1) != 0)
    {
      -[NTKFaceSnapshottingWindow rootViewController](self->_window, "rootViewController");
      v8 = (NTKFaceViewController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NTKCompanionFaceRenderer _notifyFinishedFaceBatchIfNeeded](self, "_notifyFinishedFaceBatchIfNeeded");
      v10 = objc_alloc_init(NTKFaceSnapshottingWindow);
      window = self->_window;
      self->_window = v10;

      v12 = self->_window;
      objc_msgSend(v3, "face");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceSnapshottingWindow updateForDevice:](v12, "updateForDevice:", v14);

      v15 = [NTKFaceViewController alloc];
      objc_msgSend(v3, "face");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NTKFaceViewController initWithFace:configuration:](v15, "initWithFace:configuration:", v16, &__block_literal_global_39_0);

      -[NTKFaceSnapshottingWindow setRootViewController:](self->_window, "setRootViewController:", v8);
      -[NTKFaceSnapshottingWindow setHidden:](self->_window, "setHidden:", 0);
      if (v5 && v4)
      {
        v17 = _Block_copy(v4);
        faceBatchCompletionHandler = self->_faceBatchCompletionHandler;
        self->_faceBatchCompletionHandler = v17;

      }
    }
    objc_msgSend(v3, "face");
    v19 = (NTKFace *)objc_claimAutoreleasedReturnValue();
    currentFace = self->_currentFace;
    self->_currentFace = v19;

    -[NTKFaceViewController faceView](v8, "faceView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v3, "detailMode");
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend(v21, "setDetailMode:", v22);
    -[NTKFaceSnapshottingWindow setNeedsLayout](self->_window, "setNeedsLayout");
    -[NTKFaceSnapshottingWindow layoutIfNeeded](self->_window, "layoutIfNeeded");
    -[NTKFaceSnapshottingWindow setNeedsDisplay](self->_window, "setNeedsDisplay");
    objc_msgSend(v21, "setNeedsRender");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    -[NTKFaceSnapshottingWindow bounds](self->_window, "bounds");
    v24 = v23;
    v26 = v25;
    -[NTKFaceSnapshottingWindow contentScaleFactor](self->_window, "contentScaleFactor");
    v28 = v27;
    v29 = v24 * v27;
    v30 = v26 * v27;
    v31 = -[NTKFaceSnapshottingWindow _contextId](self->_window, "_contextId");
    v32 = (void *)objc_opt_class();
    objc_msgSend(v3, "face");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_snapshotNameForFace:detailMode:", v33, v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2;
    block[3] = &unk_1E6BD6968;
    v46 = v31;
    v42 = v28;
    v43 = v29;
    v44 = v30;
    block[4] = self;
    v39 = v3;
    v40 = v34;
    v45 = v22;
    v41 = v4;
    v47 = v5;
    v36 = v4;
    v37 = v34;
    dispatch_async(workQueue, block);

  }
  else
  {
    self->_queueActive = 0;
    v9 = self->_currentFace;
    self->_currentFace = 0;

    -[NTKCompanionFaceRenderer _notifyFinishedFaceBatchIfNeeded](self, "_notifyFinishedFaceBatchIfNeeded");
  }

}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDataMode:", 3);
  objc_msgSend(v2, "setShowsCanonicalContent:", 1);
  objc_msgSend(v2, "freeze");

}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  float v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  uint64_t AlignedBytesPerRow;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  __IOSurface *v17;
  CGImage *v18;
  UIImage *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  char v31;
  id v32;
  int v33;
  CATransform3D v34;
  _QWORD v35[6];
  id location[7];

  location[6] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCA7FA8]();
  v33 = *(_DWORD *)(a1 + 96);
  CATransform3DMakeScale(&v34, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");

  v4 = *(double *)(a1 + 72);
  v5 = llroundf(v4);
  v6 = *(double *)(a1 + 80);
  v7 = llroundf(v6);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v9 = AlignedBytesPerRow * v7;
  v35[0] = *MEMORY[0x1E0CBC1E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  location[0] = v10;
  v35[1] = *MEMORY[0x1E0CBC008];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location[1] = v11;
  v35[2] = *MEMORY[0x1E0CBBF08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AlignedBytesPerRow);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  location[2] = v12;
  v35[3] = *MEMORY[0x1E0CBBEE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CBBF00];
  location[3] = v13;
  location[4] = &unk_1E6C9FAA8;
  v15 = *MEMORY[0x1E0CBC070];
  v35[4] = v14;
  v35[5] = v15;
  location[5] = &unk_1E6C9FAC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", location, v35, 6);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = IOSurfaceCreate(v16);
  if (v17)
  {
    IOSurfaceLock(v17, 0, 0);
    CARenderServerRenderDisplayClientListWithTransformList();
    IOSurfaceUnlock(v17, 0, 0);
    v18 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
    CFRelease(v17);
    if (v18)
    {
      v19 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v18);
      CGImageRelease(v18);
      v20 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 40), "face");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "snapshotPathForFace:detailMode:", v21, *(_QWORD *)(a1 + 88));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      UIImagePNGRepresentation(v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v24 = objc_msgSend(v23, "writeToFile:options:error:", v22, 1, &v32);
      v25 = v32;

      if ((v24 & 1) == 0)
      {
        _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_3(a1, (uint64_t)v25, v26);

      }
      goto LABEL_13;
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_2(v27);

  }
  _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  v19 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
    __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_1(a1, &v19->super);
LABEL_13:

  objc_initWeak(location, *(id *)(a1 + 32));
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_44;
  v28[3] = &unk_1E6BD6940;
  v29 = *(id *)(a1 + 56);
  v31 = *(_BYTE *)(a1 + 100);
  objc_copyWeak(&v30, location);
  dispatch_async(MEMORY[0x1E0C80D38], v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(location);
  objc_autoreleasePoolPop(v2);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_44(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && !*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startNextWorkItem");

}

- (NSMutableArray)pendingTaskList
{
  return self->_pendingTaskList;
}

- (void)setPendingTaskList:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTaskList, a3);
}

- (BOOL)isQueueActive
{
  return self->_queueActive;
}

- (void)setQueueActive:(BOOL)a3
{
  self->_queueActive = a3;
}

- (NTKFace)currentFace
{
  return self->_currentFace;
}

- (void)setCurrentFace:(id)a3
{
  objc_storeStrong((id *)&self->_currentFace, a3);
}

- (id)faceBatchCompletionHandler
{
  return self->_faceBatchCompletionHandler;
}

- (void)setFaceBatchCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_faceBatchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentFace, 0);
  objc_storeStrong((id *)&self->_pendingTaskList, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "failed to generate snapshot image for face %@", (uint8_t *)&v3, 0xCu);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "couldn't create IOSurface for snapshot", v1, 2u);
}

void __46__NTKCompanionFaceRenderer__startNextWorkItem__block_invoke_2_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "failed to write image for face %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
