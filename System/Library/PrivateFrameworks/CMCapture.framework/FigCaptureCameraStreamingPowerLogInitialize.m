@implementation FigCaptureCameraStreamingPowerLogInitialize

uint64_t __FigCaptureCameraStreamingPowerLogInitialize_block_invoke()
{
  dispatch_assert_queue_V2((dispatch_queue_t)sCameraPowerLogEventQueue);
  return sCameraStreamingPowerEventsByPortType;
}

uint64_t __FigCaptureCameraStreamingPowerLogInitialize_block_invoke_2()
{
  uint64_t v0;
  _BOOL8 v1;

  cpls_logCameraStreamingPowerEvents((void *)objc_msgSend((id)sCameraStreamingPowerEventsByPortType, "allValues"));
  v0 = getpid();
  v1 = !FigContinuityCaptureGetUserPreferenceDisabled();
  return FigCaptureLogContinuityCameraPowerEvent(v0, v1);
}

@end
