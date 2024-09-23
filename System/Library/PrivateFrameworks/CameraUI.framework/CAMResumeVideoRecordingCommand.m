@implementation CAMResumeVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  void *v3;
  dispatch_semaphore_t v4;
  double Current;
  os_log_t v6;
  dispatch_time_t v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  intptr_t (*v14)(uint64_t);
  void *v15;
  os_log_t v16;
  double v17;
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentMovieFileOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRecordingPaused") & 1) != 0)
  {
    v4 = dispatch_semaphore_create(0);
    Current = CFAbsoluteTimeGetCurrent();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __53__CAMResumeVideoRecordingCommand_executeWithContext___block_invoke;
    v15 = &unk_1EA328B18;
    v17 = Current;
    v6 = v4;
    v16 = v6;
    AudioServicesPlaySystemSoundWithCompletion(0x45Du, &v12);
    v7 = dispatch_time(0, 1200000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      v8 = CFAbsoluteTimeGetCurrent();
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v19 = v8 - Current;
        _os_log_error_impl(&dword_1DB760000, v9, OS_LOG_TYPE_ERROR, "resumeRecording: timed out while waiting for system sound (after %.3f seconds)", buf, 0xCu);
      }

    }
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "outputFileURL", v12, v13, v14, v15);
      v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "resumeRecording: url=%{public}@", buf, 0xCu);

    }
    objc_msgSend(v3, "resumeRecording");

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring request to resume capturing video because we weren't paused.", buf, 2u);
    }
  }

}

intptr_t __53__CAMResumeVideoRecordingCommand_executeWithContext___block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v2 > 0.1)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = v2;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Resume video recording sound took %.3f seconds", (uint8_t *)&v5, 0xCu);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
