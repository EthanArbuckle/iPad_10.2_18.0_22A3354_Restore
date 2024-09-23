@implementation CAMIrisVideoController

- (CAMIrisVideoController)initWithNebulaDaemonProxyManager:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CAMIrisVideoController *v9;
  CAMIrisVideoController *v10;
  NSMutableArray *v11;
  NSMutableArray *jobsToBeSent;
  NSMutableDictionary *v13;
  NSMutableDictionary *pendingJobs;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *mutexQueue;
  CAMIrisVideoController *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMIrisVideoController;
  v9 = -[CAMIrisVideoController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->__nebulaDaemonProxyManager, a3);
    -[CAMNebulaDaemonProxyManager setIrisClientDelegate:](v10->__nebulaDaemonProxyManager, "setIrisClientDelegate:", v10);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    jobsToBeSent = v10->__jobsToBeSent;
    v10->__jobsToBeSent = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingJobs = v10->__pendingJobs;
    v10->__pendingJobs = v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.camera.iris-video-controller", v15);
    mutexQueue = v10->__mutexQueue;
    v10->__mutexQueue = (OS_dispatch_queue *)v16;

    v18 = v10;
  }

  return v10;
}

- (BOOL)shouldHandleLivePhotoRenderingForRequest:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "effectFilterType") - 1) < 0xF;
}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v6;
  id v7;
  CAMIrisVideoControllerJob *v8;
  NSObject *v9;
  CAMIrisVideoControllerJob *v10;
  _QWORD block[5];
  CAMIrisVideoControllerJob *v12;

  v6 = a4;
  v7 = a3;
  v8 = -[CAMIrisVideoControllerJob initWithRequest:videoCaptureResult:]([CAMIrisVideoControllerJob alloc], "initWithRequest:videoCaptureResult:", v7, v6);

  -[CAMIrisVideoController _mutexQueue](self, "_mutexQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CAMIrisVideoController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, block);

}

void __78__CAMIrisVideoController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_jobsToBeSent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  -[CAMIrisVideoController _mutexQueue](self, "_mutexQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke;
  block[3] = &unk_1EA32C0D8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v8, block);

  v10 = (void *)v14[5];
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_3;
  v11[3] = &unk_1EA32C480;
  v11[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  _Block_object_dispose(&v13, 8);

}

void __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_jobsToBeSent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_26);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_jobsToBeSent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

uint64_t __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "videoCaptureResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinationInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "resultSpecifiers");

  objc_msgSend(v4, "videoCaptureResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "coordinationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "resultSpecifiers");

  if ((v10 & 1) != 0)
    v11 = 0;
  else
    v11 = -1;
  if ((v7 & 1) != 0)
    return v11;
  else
    return v10 & ((v7 & 1) == 0);
}

uint64_t __68__CAMIrisVideoController_stillImageRequestDidCompleteCapture_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitJob:", a2);
}

- (void)_submitJob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CAMIrisVideoJob *v15;
  uint64_t v16;
  uint64_t v17;
  CAMIrisVideoJob *v18;
  void *v19;
  uint64_t v20;
  char *__ptr32 *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  CAMIrisVideoJob *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  id v38;
  id v39;
  CAMIrisVideoJob *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  CAMIrisVideoController *v45;
  id v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;

  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoCaptureResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localDestinationURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEV0LocalVideoDestinationURL:");
  objc_msgSend(v5, "irisStillImagePersistenceUUIDForEV0:", v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCTMVideo"))
    objc_msgSend(v5, "persistenceUUID");
  else
    objc_msgSend(v5, "irisVideoPersistenceUUIDForEV0:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "irisIdentifierForEV0:", v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v5, "captureDevice");
  v9 = objc_msgSend(v5, "captureOrientation");
  +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", objc_msgSend(v5, "effectFilterType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0uLL;
  v54 = 0;
  if (v6)
  {
    objc_msgSend(v6, "duration");
    v51 = 0uLL;
    v52 = 0;
    objc_msgSend(v6, "stillDisplayTime");
  }
  else
  {
    v51 = 0uLL;
    v52 = 0;
  }
  objc_msgSend(v6, "captureDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v6, "error");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [CAMIrisVideoJob alloc];
  v16 = objc_msgSend(v5, "persistenceOptions");
  v17 = objc_msgSend(v5, "temporaryPersistenceOptions");
  v49 = v53;
  v50 = v54;
  v47 = v51;
  v48 = v52;
  v31 = (void *)v12;
  v18 = -[CAMIrisVideoJob initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:](v15, "initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:", v36, v35, v8, v34, v30, v9, v11, &v49, &v47, v12, v33, 0, v16, v17, v14);
  -[CAMIrisVideoController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x1E0C809B0];
  v21 = &off_1DB9A4000;
  if (v19)
  {
    -[CAMIrisVideoController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "irisVideoController:willPersistVideoCaptureResult:forRequest:", self, v6, v5);
    v24 = v23;

    if (v24 > 0.0)
    {
      dispatch_get_global_queue(25, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
      v41 = v20;
      v42 = 3221225472;
      v43 = __37__CAMIrisVideoController__submitJob___block_invoke;
      v44 = &unk_1EA328A40;
      v45 = self;
      v46 = v8;
      v21 = &off_1DB9A4000;
      pl_dispatch_after();

    }
  }
  -[CAMIrisVideoController _mutexQueue](self, "_mutexQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = v20;
  block[1] = *((_QWORD *)v21 + 271);
  block[2] = __37__CAMIrisVideoController__submitJob___block_invoke_2;
  block[3] = &unk_1EA3290F0;
  block[4] = self;
  v38 = v8;
  v39 = v4;
  v40 = v18;
  v27 = v18;
  v28 = v4;
  v29 = v8;
  dispatch_sync(v26, block);

}

uint64_t __37__CAMIrisVideoController__submitJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfVideoLocalPersistenceResult:forVideoPersistenceUUID:", 0, *(_QWORD *)(a1 + 40));
}

void __37__CAMIrisVideoController__submitJob___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_pendingJobs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ensureConnectionToDaemon");
  }
  v6[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enqueueIrisVideoJobs:", v5);

}

- (void)_notifyDelegateOfVideoLocalPersistenceResult:(id)a3 forVideoPersistenceUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CAMIrisVideoController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__10;
    v23 = __Block_byref_object_dispose__10;
    v24 = 0;
    -[CAMIrisVideoController _mutexQueue](self, "_mutexQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__CAMIrisVideoController__notifyDelegateOfVideoLocalPersistenceResult_forVideoPersistenceUUID___block_invoke;
    block[3] = &unk_1EA32C4A8;
    v18 = &v19;
    block[4] = self;
    v17 = v7;
    dispatch_sync(v9, block);

    if (v20[5])
    {
      if (!v6)
      {
        v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)v20[5], "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v11;
          _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "Timed out while waiting for persistence result from nebulad for request %{public}@", buf, 0xCu);

        }
      }
      -[CAMIrisVideoController delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20[5], "videoCaptureResult");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20[5], "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject irisVideoController:didPersistVideoCaptureResult:forCaptureResult:request:](v12, "irisVideoController:didPersistVideoCaptureResult:forCaptureResult:request:", self, v6, v13, v14);

    }
    else
    {
      if (!v6)
        goto LABEL_9;
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v20[5], "request");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v15;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Received persistence result from nebulad but ignoring since we already timed out for %{public}@", buf, 0xCu);

      }
    }

LABEL_9:
    _Block_object_dispose(&v19, 8);

  }
}

void __95__CAMIrisVideoController__notifyDelegateOfVideoLocalPersistenceResult_forVideoPersistenceUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_pendingJobs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pendingJobs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "closeConnectionToDaemon");
  }
}

- (BOOL)isWaitingOnNebuladForRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v4 = a3;
  -[CAMIrisVideoController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMIrisVideoController isWaitingOnNebuladForRequest:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_8;
  }
  if (!v4)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMIrisVideoController isWaitingOnNebuladForRequest:].cold.2(v8, v16, v17, v18, v19, v20, v21, v22);
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  -[CAMIrisVideoController _mutexQueue](self, "_mutexQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CAMIrisVideoController_isWaitingOnNebuladForRequest___block_invoke;
  block[3] = &unk_1EA32C4A8;
  v26 = &v27;
  block[4] = self;
  v25 = v4;
  dispatch_sync(v6, block);

  v7 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
LABEL_9:

  return v7;
}

void __55__CAMIrisVideoController_isWaitingOnNebuladForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_pendingJobs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "videoPersistenceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_pendingJobs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "EV0VideoPersistenceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 != 0;

  }
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "localPersistenceUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMIrisVideoController _notifyDelegateOfVideoLocalPersistenceResult:forVideoPersistenceUUID:](self, "_notifyDelegateOfVideoLocalPersistenceResult:forVideoPersistenceUUID:", v4, v5);

}

- (CAMIrisVideoControllerDelegate)delegate
{
  return (CAMIrisVideoControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)_mutexQueue
{
  return self->__mutexQueue;
}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (NSMutableArray)_jobsToBeSent
{
  return self->__jobsToBeSent;
}

- (NSMutableDictionary)_pendingJobs
{
  return self->__pendingJobs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingJobs, 0);
  objc_storeStrong((id *)&self->__jobsToBeSent, 0);
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->__mutexQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)isWaitingOnNebuladForRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Cannot track nebulad requests if we don't have a delegate set up", a5, a6, a7, a8, 0);
}

- (void)isWaitingOnNebuladForRequest:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Cannot track nebulad requests for nil request", a5, a6, a7, a8, 0);
}

@end
