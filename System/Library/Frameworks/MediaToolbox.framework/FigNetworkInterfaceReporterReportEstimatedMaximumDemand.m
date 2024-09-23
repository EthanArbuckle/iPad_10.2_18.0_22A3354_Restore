@implementation FigNetworkInterfaceReporterReportEstimatedMaximumDemand

void __FigNetworkInterfaceReporterReportEstimatedMaximumDemand_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t IRATStatusUpdateMessageApplicationEntry;
  void *v5;
  xpc_object_t v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;
  void *v11;
  const void *v12;

  v2 = *(_QWORD *)(a1 + 32);
  if ((unint64_t)(v2 - 1) < 0x3FF)
    v3 = 1;
  else
    v3 = v2 >> 10;
  if (sFigIRATXPCConnection)
  {
    IRATStatusUpdateMessageApplicationEntry = figNetworkMonitorInterfaceCreateIRATStatusUpdateMessageApplicationEntry();
    if (IRATStatusUpdateMessageApplicationEntry)
    {
      v5 = IRATStatusUpdateMessageApplicationEntry;
      xpc_dictionary_set_uint64(IRATStatusUpdateMessageApplicationEntry, "kMaxElgBrate", v3);
      if (!*(_QWORD *)(a1 + 40) || !FigXPCMessageSetCFString())
      {
        v6 = xpc_array_create(0, 0);
        if (v6)
        {
          v7 = v6;
          xpc_array_append_value(v6, v5);
          v8 = xpc_dictionary_create(0, 0, 0);
          if (v8)
          {
            v9 = v8;
            xpc_dictionary_set_value(v8, "kWRMApplicationTypeList", v7);
            v10 = xpc_dictionary_create(0, 0, 0);
            if (v10)
            {
              v11 = v10;
              xpc_dictionary_set_uint64(v10, "kMessageId", 0x1A2uLL);
              xpc_dictionary_set_value(v11, "kMessageArgs", v9);
              xpc_release(v7);
              xpc_release(v9);
              xpc_connection_send_message((xpc_connection_t)sFigIRATXPCConnection, v11);
              v9 = v11;
            }
            else
            {
              xpc_release(v7);
            }
          }
          else
          {
            v9 = v7;
          }
          xpc_release(v9);
        }
      }
      xpc_release(v5);
    }
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
}

@end
