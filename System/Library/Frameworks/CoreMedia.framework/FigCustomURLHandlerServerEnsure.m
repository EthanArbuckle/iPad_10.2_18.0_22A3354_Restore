@implementation FigCustomURLHandlerServerEnsure

dispatch_queue_t __FigCustomURLHandlerServerEnsure_block_invoke()
{
  dispatch_queue_t result;

  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigCustomURLHandler2RemoteNote[1], CFSTR("customurlhandler_xpc_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, gFigCustomURLHandler2RemoteNote);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1ECDA84B8, CFSTR("customurlhandler_xpc_trace"), CFSTR("com.apple.coremedia"), (uint64_t)", (uint64_t)"com.apple.coremedia", 0, 0, &qword_1ECDA84B0);
  FigCustomURLHandlerServerEnsure_sFigCustomURLHandlerStartError = FigXPCServerStartWithNewXPCEndpoint((uint64_t)"com.apple.coremedia.customurlhandler.xpc", (uint64_t)&figCustomURLHandlerServerStart_callbacks, 0, &gFigCustomURLHandlerServer);
  result = dispatch_queue_create("com.apple.coremedia.customurlhandlerserver.data", 0);
  gFigCustomURLHandlerServerCallbackQueue = (uint64_t)result;
  return result;
}

@end
