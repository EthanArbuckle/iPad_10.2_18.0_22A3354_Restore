@implementation ARScreenRecording

- (ARScreenRecording)init
{
  ARScreenRecording *v2;
  ARScreenRecording *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARScreenRecording;
  v2 = -[ARScreenRecording init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_saveInPhotosLibrary = 0;
    v2->_startRecordingRequested = 0;
    objc_msgSend(MEMORY[0x1E0CD55B8], "sharedRecorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARScreenRecording setRecorder:](v3, "setRecorder:", v4);

    -[ARScreenRecording recorder](v3, "recorder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v3);

  }
  return v3;
}

- (void)startRecordingWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  -[ARScreenRecording recorder](self, "recorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecording");

  if (v6)
    goto LABEL_5;
  -[ARScreenRecording recorder](self, "recorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAvailable");

  if ((v8 & 1) == 0)
  {
    self->_startRecordingRequested = 1;
LABEL_5:
    v4[2](v4, 0);
    goto LABEL_6;
  }
  -[ARScreenRecording recorder](self, "recorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__ARScreenRecording_startRecordingWithHandler___block_invoke;
  v10[3] = &unk_1EA586700;
  v11 = v4;
  objc_msgSend(v9, "startRecordingWithHandler:", v10);

LABEL_6:
}

uint64_t __47__ARScreenRecording_startRecordingWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopRecordingWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *temporaryOutputURL;
  void *v10;
  NSURL *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  if (-[ARScreenRecording saveInPhotosLibrary](self, "saveInPhotosLibrary"))
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("/screenRecording.mov"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:", v7);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    temporaryOutputURL = self->temporaryOutputURL;
    self->temporaryOutputURL = v8;

    -[ARScreenRecording removeTemporaryOutputFile](self, "removeTemporaryOutputFile");
    -[ARScreenRecording recorder](self, "recorder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->temporaryOutputURL;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __46__ARScreenRecording_stopRecordingWithHandler___block_invoke;
    v18[3] = &unk_1EA586728;
    v18[4] = self;
    v19 = v4;
    v12 = v4;
    objc_msgSend(v10, "stopRecordingWithOutputURL:completionHandler:", v11, v18);

    v13 = v19;
  }
  else
  {
    -[ARScreenRecording recorder](self, "recorder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__ARScreenRecording_stopRecordingWithHandler___block_invoke_2;
    v16[3] = &unk_1EA586700;
    v17 = v4;
    v15 = v4;
    objc_msgSend(v14, "stopCaptureWithHandler:", v16);

    v13 = v17;
  }

}

void __46__ARScreenRecording_stopRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSString *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "path");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    UISaveVideoAtPathToSavedPhotosAlbum(v4, *(id *)(a1 + 32), sel_video_didFinishSavingWithError_contextInfo_, 0);

    v3 = 0;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

uint64_t __46__ARScreenRecording_stopRecordingWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)video:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  ARScreenRecording *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    _ARLogGeneral_0();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v9;
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1DCC73000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to save screen recording: %@", (uint8_t *)&v10, 0x20u);

    }
  }
  -[ARScreenRecording removeTemporaryOutputFile](self, "removeTemporaryOutputFile");

}

- (void)removeTemporaryOutputFile
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->temporaryOutputURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", self->temporaryOutputURL, 0);

  }
}

- (void)screenRecorderDidChangeAvailability:(id)a3
{
  _BOOL4 startRecordingRequested;
  id v5;

  -[ARScreenRecording recorder](self, "recorder", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAvailable"))
  {
    startRecordingRequested = self->_startRecordingRequested;

    if (!startRecordingRequested)
      return;
    self->_startRecordingRequested = 0;
    -[ARScreenRecording recorder](self, "recorder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startRecordingWithHandler:", &__block_literal_global_4);
  }

}

void __57__ARScreenRecording_screenRecorderDidChangeAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _ARLogGeneral_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1DCC73000, v3, OS_LOG_TYPE_ERROR, "ARScreenRecording: Failed to start screen recording: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)saveInPhotosLibrary
{
  return self->_saveInPhotosLibrary;
}

- (void)setSaveInPhotosLibrary:(BOOL)a3
{
  self->_saveInPhotosLibrary = a3;
}

- (RPScreenRecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_recorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->temporaryOutputURL, 0);
}

@end
