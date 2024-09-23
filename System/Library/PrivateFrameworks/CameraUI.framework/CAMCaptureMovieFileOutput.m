@implementation CAMCaptureMovieFileOutput

- (CAMCaptureMovieFileOutput)initWithEngine:(id)a3
{
  id v4;
  CAMCaptureMovieFileOutput *v5;
  CAMCaptureMovieFileOutput *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *userInfoQueue;
  NSObject *v10;
  CAMCaptureMovieFileOutput *v11;
  CAMCaptureMovieFileOutput *v12;
  _QWORD block[4];
  CAMCaptureMovieFileOutput *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMCaptureMovieFileOutput;
  v5 = -[AVCaptureMovieFileOutput init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__captureEngine, v4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.camera.movie-file-output.user-info", v7);
    userInfoQueue = v6->__userInfoQueue;
    v6->__userInfoQueue = (OS_dispatch_queue *)v8;

    v10 = v6->__userInfoQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CAMCaptureMovieFileOutput_initWithEngine___block_invoke;
    block[3] = &unk_1EA328868;
    v11 = v6;
    v15 = v11;
    dispatch_sync(v10, block);
    v12 = v11;

  }
  return v6;
}

void __44__CAMCaptureMovieFileOutput_initWithEngine___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v5;

}

- (void)startRecordingToOutputFileURL:(id)a3 recordingDelegate:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[CAMCaptureMovieFileOutput setWrappedDelegate:](self, "setWrappedDelegate:", a4);
  v7.receiver = self;
  v7.super_class = (Class)CAMCaptureMovieFileOutput;
  -[AVCaptureMovieFileOutput startRecordingToOutputFileURL:recordingDelegate:](&v7, sel_startRecordingToOutputFileURL_recordingDelegate_, v6, self);

}

- (void)stopRecording
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMCaptureMovieFileOutput;
  -[AVCaptureMovieFileOutput stopRecording](&v4, sel_stopRecording);
  -[CAMCaptureMovieFileOutput _captureEngine](self, "_captureEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRecording");

}

- (NSDictionary)userInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[CAMCaptureMovieFileOutput _userInfoQueue](self, "_userInfoQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CAMCaptureMovieFileOutput_userInfo__block_invoke;
  v6[3] = &unk_1EA32C0D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __37__CAMCaptureMovieFileOutput_userInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "currentUserInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setUserInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (void *)objc_msgSend(v4, "copy");
    -[CAMCaptureMovieFileOutput _userInfoQueue](self, "_userInfoQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CAMCaptureMovieFileOutput_setUserInfo___block_invoke;
    block[3] = &unk_1EA329360;
    block[4] = self;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    dispatch_sync(v6, block);

    v4 = v8;
  }

}

uint64_t __41__CAMCaptureMovieFileOutput_setUserInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentUserInfo:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setUserInfoForNextCapture:", *(_QWORD *)(a1 + 48));
}

- (void)handleNotification:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD v12[6];
  objc_super v13;
  _QWORD block[4];
  id v15;
  CAMCaptureMovieFileOutput *v16;
  _QWORD *v17;
  uint64_t *v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  objc_msgSend(v7, "objectForKey:", CFSTR("SettingsID"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v20 = objc_msgSend((id)v22[5], "longLongValue");
  -[CAMCaptureMovieFileOutput _userInfoQueue](self, "_userInfoQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke;
  block[3] = &unk_1EA32C100;
  v10 = v6;
  v15 = v10;
  v16 = self;
  v17 = v19;
  v18 = &v21;
  dispatch_sync(v8, block);

  v13.receiver = self;
  v13.super_class = (Class)CAMCaptureMovieFileOutput;
  -[AVCaptureMovieFileOutput handleNotification:payload:](&v13, sel_handleNotification_payload_, v10, v7);
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("DidStopRecording")))
  {
    -[CAMCaptureMovieFileOutput _userInfoQueue](self, "_userInfoQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke_15;
    v12[3] = &unk_1EA32AB70;
    v12[4] = self;
    v12[5] = &v21;
    dispatch_sync(v11, v12);

  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

}

void __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("DidStartRecording")))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfoForNextCapture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_userInfoBySettingsID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

    objc_msgSend(*(id *)(a1 + 40), "setUserInfoForNextCapture:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "_userInfoBySettingsID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v7)
  {
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40), "longLongValue");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(v6, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfoForNextCapture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v17 = 134217984;
        v18 = v14;
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to userInfoForNextCapture due to missing user info for settingsID %lld", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v15);

      v16 = v12;
      objc_msgSend(*(id *)(a1 + 40), "setUserInfoForNextCapture:", 0);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setCurrentUserInfo:", v12);

}

void __56__CAMCaptureMovieFileOutput_handleNotification_payload___block_invoke_15(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_removeOnCompletionSettingsIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v3 = v2;
    objc_msgSend(v2, "addObject:");
    v2 = v3;
  }

}

- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[CAMCaptureMovieFileOutput wrappedDelegate](self, "wrappedDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didStartRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v11, "captureOutput:didStartRecordingToOutputFileAtURL:fromConnections:", v10, v8, v9);
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[CAMCaptureMovieFileOutput wrappedDelegate](self, "wrappedDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didFinishRecordingToOutputFileAtURL: url=%{public}@, error=%{public}@", buf, 0x16u);
  }

  objc_msgSend(v14, "captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:", v13, v10, v12, v11);
  -[CAMCaptureMovieFileOutput setWrappedDelegate:](self, "setWrappedDelegate:", 0);
  -[CAMCaptureMovieFileOutput _userInfoQueue](self, "_userInfoQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__CAMCaptureMovieFileOutput_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v16, block);

}

void __101__CAMCaptureMovieFileOutput_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeOnCompletionSettingsIDs");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_userInfoBySettingsID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", v2);

  }
  objc_msgSend(v4, "removeObject:", v2);

}

- (void)captureOutput:(id)a3 didPauseRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didPauseRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "AVCaptureFileOutputRecordingDelegate didResumeRecordingToOutputFileAtURL: url=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  -[CAMCaptureMovieFileOutput wrappedDelegate](self, "wrappedDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureOutput:didResumeRecordingToOutputFileAtURL:fromConnections:", v10, v8, v9);

}

- (CAMCaptureEngine)_captureEngine
{
  return (CAMCaptureEngine *)objc_loadWeakRetained((id *)&self->__captureEngine);
}

- (OS_dispatch_queue)_userInfoQueue
{
  return self->__userInfoQueue;
}

- (NSMutableDictionary)_userInfoBySettingsID
{
  return self->__userInfoBySettingsID;
}

- (NSMutableArray)_removeOnCompletionSettingsIDs
{
  return self->__removeOnCompletionSettingsIDs;
}

- (NSDictionary)currentUserInfo
{
  return self->_currentUserInfo;
}

- (void)setCurrentUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)userInfoForNextCapture
{
  return self->_userInfoForNextCapture;
}

- (void)setUserInfoForNextCapture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AVCaptureFileOutputRecordingDelegate)wrappedDelegate
{
  return (AVCaptureFileOutputRecordingDelegate *)objc_loadWeakRetained((id *)&self->_wrappedDelegate);
}

- (void)setWrappedDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_wrappedDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wrappedDelegate);
  objc_storeStrong((id *)&self->_userInfoForNextCapture, 0);
  objc_storeStrong((id *)&self->_currentUserInfo, 0);
  objc_storeStrong((id *)&self->__removeOnCompletionSettingsIDs, 0);
  objc_storeStrong((id *)&self->__userInfoBySettingsID, 0);
  objc_storeStrong((id *)&self->__userInfoQueue, 0);
  objc_destroyWeak((id *)&self->__captureEngine);
}

@end
