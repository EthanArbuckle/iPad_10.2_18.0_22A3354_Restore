@implementation HFCameraClipFeedbackPreparationOperation

- (HFCameraClipFeedbackPreparationOperation)initWithCameraClip:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  HFCameraClipFeedbackPreparationOperation *v9;
  HFCameraClipFeedbackPreparationOperation *v10;
  void *v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraClipFeedbackPreparationOperation;
  v9 = -[HFCameraClipFeedbackPreparationOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cameraClip, a3);
    v11 = _Block_copy(v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = v11;

  }
  return v10;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(_QWORD, _QWORD);
  HFCameraClipFeedbackPreparationOperation *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HFCameraClipFeedbackPreparationOperation cameraClip](self, "cameraClip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCameraUtilities videoDestinationURLForCameraClip:strippedAudio:](HFCameraUtilities, "videoDestinationURLForCameraClip:strippedAudio:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    HFLogForCategory(0x14uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Stripped audio file exists at url:%@.", buf, 0xCu);
    }

    -[HFCameraClipFeedbackPreparationOperation completionHandler](self, "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v4);
  }
  else
  {
    -[HFCameraClipFeedbackPreparationOperation cameraClip](self, "cameraClip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", v10);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

    HFLogForCategory(0x14uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCameraClipFeedbackPreparationOperation cameraClip](self, "cameraClip");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hf_prettyDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Proceed to strip audio file and truncate file to 20 seconds for clip: %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke;
      v23[3] = &unk_1EA7271B0;
      v24 = v18;
      v25 = v9;
      v26 = self;
      v27 = v4;
      v19 = v18;
      objc_msgSend(v19, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EA7CDD68, v23);

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[HFCameraClipFeedbackPreparationOperation cameraClip](self, "cameraClip");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "hf_prettyDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v21;
        v30 = 2112;
        v31 = v22;
        _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "Unable to find file to convert for clip: %@; URL: %@. THIS SHOULD NEVER HAPPEN.",
          buf,
          0x16u);

      }
      -[HFCameraClipFeedbackPreparationOperation completionHandler](self, "completionHandler");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
    }

  }
}

void __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CMTimeEpoch epoch;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  CMTimeRange v24;
  CMTime v25;
  CMTime start;
  CMTimeRange v27;
  CMTime duration;
  CMTimeRange v29;
  CMTime buf;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v2, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tracksWithMediaType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v7, "duration");
    else
      memset(&duration, 0, sizeof(duration));
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    v18 = *(_OWORD *)&buf.value;
    epoch = buf.epoch;
    CMTimeRangeMake(&v29, &buf, &duration);
    *(_OWORD *)&buf.value = v18;
    buf.epoch = epoch;
    objc_msgSend(v4, "insertTimeRange:ofTrack:atTime:error:", &v29, v6, &buf, 0);
    v14 = objc_alloc(MEMORY[0x1E0C8AFC0]);
    v15 = (void *)objc_msgSend(v14, "initWithAsset:presetName:", v2, *MEMORY[0x1E0C89E98]);
    objc_msgSend(v15, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(v15, "setOutputURL:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v15, "setShouldOptimizeForNetworkUse:", 1);
    CMTimeMake(&start, 0, 1000);
    CMTimeMakeWithSeconds(&v25, 20.0, 1000);
    CMTimeRangeMake(&v27, &start, &v25);
    v24 = v27;
    objc_msgSend(v15, "setTimeRange:", &v24);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke_5;
    v19[3] = &unk_1EA7271B0;
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(a1 + 56);
    v20 = v15;
    v21 = v16;
    v22 = v17;
    v23 = *(id *)(a1 + 40);
    v10 = v15;
    -[NSObject exportAsynchronouslyWithCompletionHandler:](v10, "exportAsynchronouslyWithCompletionHandler:", v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v9, 0);

    HFLogForCategory(0x14uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "cameraClip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_prettyDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v12;
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, "Missing video track. Unable to strip audio from clip: %@", (uint8_t *)&buf, 0xCu);

    }
  }

}

void __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

    HFLogForCategory(0x14uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "cameraClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v12 = "Cancelled audio stripping and truncation of clip: %@; error: %@";
LABEL_13:
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x16u);

    goto LABEL_10;
  }
  if (v2 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeItemAtPath:error:", v14, 0);

    HFLogForCategory(0x14uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "cameraClip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_prettyDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v12 = "Failure to strip audio and truncate clip: %@; error: %@";
    goto LABEL_13;
  }
  if (v2 != 3)
    return;
  HFLogForCategory(0x14uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "cameraClip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Finished stripping/truncating file for clip: %@; URL: %@.",
      (uint8_t *)&v16,
      0x16u);

  }
LABEL_10:

  objc_msgSend(*(id *)(a1 + 40), "completionHandler");
  v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v15[2]();

}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
  objc_storeStrong((id *)&self->_cameraClip, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end
