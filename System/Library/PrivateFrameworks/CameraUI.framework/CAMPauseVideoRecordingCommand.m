@implementation CAMPauseVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentMovieFileOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "outputFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "pauseRecording: url=%{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(v3, "pauseRecording");

}

@end
