@implementation FigCaptureInitializeSingletons

FigContinuityCaptureNotificationMonitor *__FigCaptureInitializeSingletons_block_invoke()
{
  +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  +[BWFigCaptureAttachedAccessoriesMonitor sharedAttachedAccessoriesMonitor](BWFigCaptureAttachedAccessoriesMonitor, "sharedAttachedAccessoriesMonitor");
  +[BWAutoFocusPositionSensorMonitor sharedInstance](BWAutoFocusPositionSensorMonitor, "sharedInstance");
  +[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance");
  +[FigCaptureSessionObservatory sharedObservatory](FigCaptureSessionObservatory, "sharedObservatory");
  +[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor");
  return +[FigContinuityCaptureNotificationMonitor sharedInstance](FigContinuityCaptureNotificationMonitor, "sharedInstance");
}

@end
