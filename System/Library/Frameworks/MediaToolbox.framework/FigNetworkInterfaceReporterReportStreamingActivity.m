@implementation FigNetworkInterfaceReporterReportStreamingActivity

void __FigNetworkInterfaceReporterReportStreamingActivity_block_invoke(uint64_t a1)
{
  BOOL v2;
  xpc_object_t IRATStatusUpdateMessageApplicationEntry;
  void *v4;
  int v5;
  void *IRATStatusUpdateMessage;
  void *v7;
  const void *v8;
  char buffer[256];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 256, 0x8000100u))
    v2 = sFigIRATXPCConnection == 0;
  else
    v2 = 1;
  if (!v2)
  {
    IRATStatusUpdateMessageApplicationEntry = figNetworkMonitorInterfaceCreateIRATStatusUpdateMessageApplicationEntry();
    if (IRATStatusUpdateMessageApplicationEntry)
    {
      v4 = IRATStatusUpdateMessageApplicationEntry;
      xpc_dictionary_set_uint64(IRATStatusUpdateMessageApplicationEntry, "kWRMVideoStreamingStarted", *(_BYTE *)(a1 + 48) != 0);
      if (*(_BYTE *)(a1 + 48))
        v5 = gFigNetworkInterfaceReporter_block_invoke_sFigInterfaceReportingStreamingActivityCount + 1;
      else
        v5 = gFigNetworkInterfaceReporter_block_invoke_sFigInterfaceReportingStreamingActivityCount - 1;
      gFigNetworkInterfaceReporter_block_invoke_sFigInterfaceReportingStreamingActivityCount = v5;
      IRATStatusUpdateMessage = figNetworkMonitorInterfaceCreateIRATStatusUpdateMessage(v4);
      if (IRATStatusUpdateMessage)
      {
        v7 = IRATStatusUpdateMessage;
        xpc_connection_send_message((xpc_connection_t)sFigIRATXPCConnection, IRATStatusUpdateMessage);
        xpc_release(v7);
      }
      xpc_release(v4);
    }
  }
  v8 = *(const void **)(a1 + 40);
  if (v8)
    CFRelease(v8);
}

@end
