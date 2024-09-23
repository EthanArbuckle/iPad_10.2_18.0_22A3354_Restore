@implementation CAMStopVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoZoomFactor");
  v6 = v5;

  objc_msgSend(v3, "registerVideoEndZoomFactor:", v6);
  objc_msgSend(v3, "currentMovieFileOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "outputFileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "stopRecording: url=%{public}@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v7, "stopRecording");

}

@end
