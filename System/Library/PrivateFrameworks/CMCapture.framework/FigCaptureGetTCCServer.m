@implementation FigCaptureGetTCCServer

void __FigCaptureGetTCCServer_block_invoke()
{
  NSObject *v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = dispatch_queue_create("com.apple.coremedia.capture.tccserver", 0);
  FigCaptureGetTCCServer_sFigCaptureTCCServer = tcc_server_create();
  if (!FigCaptureGetTCCServer_sFigCaptureTCCServer)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  dispatch_release(v0);
}

@end
