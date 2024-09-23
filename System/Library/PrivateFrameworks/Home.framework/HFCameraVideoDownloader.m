@implementation HFCameraVideoDownloader

- (HFCameraVideoDownloader)initWithCameraProfile:(id)a3
{
  id v4;
  HFCameraVideoDownloader *v5;
  HFCameraVideoDownloader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCameraVideoDownloader;
  v5 = -[HFCameraVideoDownloader init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_cameraProfile, v4);

  return v6;
}

- (id)priorityDownloadOperationForClip:(id)a3
{
  void *v3;

  -[HFCameraVideoDownloader _downloadOperationForClip:](self, "_downloadOperationForClip:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueuePriority:", 4);
  objc_msgSend(v3, "setQualityOfService:", 25);
  return v3;
}

- (id)downloadOperationForClip:(id)a3
{
  void *v3;

  -[HFCameraVideoDownloader _downloadOperationForClip:](self, "_downloadOperationForClip:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueuePriority:", 0);
  objc_msgSend(v3, "setQualityOfService:", 25);
  return v3;
}

- (id)_downloadOperationForClip:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x1DuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Called download block for clip: %@", buf, 0xCu);

  }
  +[HFCameraVideoDownloadOperation downloadOperationForClip:](HFCameraVideoDownloadOperation, "downloadOperationForClip:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke;
  v10[3] = &unk_1EA72BE50;
  objc_copyWeak(&v12, (id *)buf);
  v10[4] = self;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "setDownloadBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v7;
}

void __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_fetchOperationForClip:withClipManager:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_2;
  v15[3] = &unk_1EA73AA40;
  v10 = WeakRetained;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  objc_msgSend(v7, "setFetchVideoAssetContextCompletionBlock:", v15);
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_3;
  v13[3] = &unk_1EA73AA68;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v7, "setDownloadProgressHandler:", v13);
  objc_msgSend(v7, "start");
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    objc_msgSend(v7, "waitUntilFinishedOrTimeout:", 0.5);
  else
    objc_msgSend(v7, "waitUntilFinished");

}

uint64_t __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;

  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "fileDownloadFailedWithError:");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v7 = v6;

  return objc_msgSend(*(id *)(a1 + 32), "fileDownloadFinishedWithElapsedTime:", v7);
}

uint64_t __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fileDownloadProgress:", a2);
}

- (id)_fetchOperationForClip:(id)a3 withClipManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoDownloader.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clipManager"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCameraVideoDownloader.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraClip"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3E0]), "initWithClipManager:clip:", v8, v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities videoCachesDirectoryURL](HFCameraUtilities, "videoCachesDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipDestinationFileURL:", v12);

  return v9;
}

- (HMCameraProfile)cameraProfile
{
  return (HMCameraProfile *)objc_loadWeakRetained((id *)&self->_cameraProfile);
}

- (void)setCameraProfile:(id)a3
{
  objc_storeWeak((id *)&self->_cameraProfile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraProfile);
}

@end
