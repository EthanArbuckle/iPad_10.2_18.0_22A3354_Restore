@implementation FigRoutingManagerSendCarPlayDisableBluetoothCommand

void __FigRoutingManagerSendCarPlayDisableBluetoothCommand_block_invoke(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  CFTypeRef v6;
  CFTypeRef v7;
  uint64_t v8;
  void (*v9)(CFTypeRef, uint64_t, _QWORD);
  NSObject *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v12;
  CFArrayRef theArray;
  CFTypeRef v14;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v14 = 0;
  FigRoutingManagerContextUtilities_CopySystemAudioContextUUID((uint64_t)&v14);
  theArray = 0;
  FigRoutingManagerContextUtilities_CopyActivatedEndpoints((uint64_t)v14, (uint64_t)&theArray);
  if (!theArray)
    goto LABEL_13;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    goto LABEL_9;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, v4);
    if (FigRoutingManagerIsEndpointOfType((uint64_t)ValueAtIndex))
      break;
    if (v3 == ++v4)
      goto LABEL_9;
  }
  if (ValueAtIndex)
    v6 = CFRetain(ValueAtIndex);
  else
LABEL_9:
    v6 = 0;
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
  if (!v6)
  {
LABEL_13:
    cf[0] = 0;
    FigRoutingManagerContextUtilities_CopyMostRecentCurrentlyActivatingEndpoint((uint64_t)v14, cf);
    if (FigRoutingManagerIsEndpointOfType((uint64_t)cf[0]))
    {
      if (!cf[0])
        goto LABEL_25;
      v6 = CFRetain(cf[0]);
    }
    else
    {
      v6 = 0;
    }
    if (cf[0])
      CFRelease(cf[0]);
    if (!v6)
      goto LABEL_25;
  }
  FigEndpointExtendedGetClassID();
  if (CMBaseObjectIsMemberOfClass())
  {
    v7 = CFRetain(v6);
    CFRelease(v6);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void (**)(CFTypeRef, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 40);
      if (v9)
        v9(v7, v8, 0);
      if (dword_1EE2B3E28)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CFRelease(v7);
      goto LABEL_30;
    }
  }
  else
  {
    CFRelease(v6);
  }
LABEL_25:
  if (dword_1EE2B3E28)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_30:
  v12 = *(const void **)(a1 + 32);
  if (v12)
    CFRelease(v12);
  if (v14)
    CFRelease(v14);
}

@end
