@implementation CAMUpdateFocusAndExposureForStartVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CAMFocusCommand *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CAMFocusCommand *v23;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "autoFocusSystem") == 2)
  {
    if (objc_msgSend(v4, "focusMode") != 2)
      goto LABEL_12;
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CAMUpdateFocusAndExposureForStartVideoRecordingCommand executeWithContext:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = -[CAMFocusCommand initWithFocusMode:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:smooth:", 3, 1);
  }
  else
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CAMUpdateFocusAndExposureForStartVideoRecordingCommand executeWithContext:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    v14 = -[CAMFocusCommand initWithFocusMode:]([CAMFocusCommand alloc], "initWithFocusMode:", 0);
  }
  v23 = v14;
  if (v14)
    -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v14);

LABEL_12:
}

- (void)executeWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, a1, a3, "Enabling smooth autofocus for start video recording (phase detect focus)", a5, a6, a7, a8, 0);
}

- (void)executeWithContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DB760000, a1, a3, "Locking focus for start video recording (contrast based focus)", a5, a6, a7, a8, 0);
}

@end
