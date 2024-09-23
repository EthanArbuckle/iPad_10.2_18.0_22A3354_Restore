@implementation CAMUpdateFocusAndExposureForStopVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  void *v4;
  NSObject *v5;
  CAMFocusCommand *v6;

  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "focusMode") == 2
    && objc_msgSend(v4, "isSmoothAutoFocusSupported")
    && objc_msgSend(v4, "isSmoothAutoFocusEnabled"))
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CAMUpdateFocusAndExposureForStopVideoRecordingCommand executeWithContext:].cold.1(v5);

    v6 = -[CAMFocusCommand initWithFocusMode:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:smooth:", 3, 0);
    if (v6)
      -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:", v6);

  }
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB760000, log, OS_LOG_TYPE_DEBUG, "Disabling smooth autofocus for stop video recording", v1, 2u);
}

@end
