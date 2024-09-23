@implementation Teardown

void __apEndpointRemoteControlSession_Teardown_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD block[6];

  v2 = *(const void **)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!apEndpointRemoteControlSession_isInvalidated())
  {
    v4 = dispatch_semaphore_create(0);
    if (v4)
    {
      v5 = v4;
      CFRetain(v2);
      dispatch_retain(v5);
      v6 = *(NSObject **)(DerivedStorage + 160);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __apEndpointRemoteControlSession_teardownInternal_block_invoke;
      block[3] = &__block_descriptor_tmp_53;
      block[4] = v2;
      block[5] = v5;
      dispatch_async(v6, block);
      v7 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v5, v7)
        && gLogCategory_APEndpointRemoteControlSessionAirPlay <= 60
        && (gLogCategory_APEndpointRemoteControlSessionAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      apEndpointRemoteControlSession_invalidateInternal(v2);
      if (gLogCategory_APEndpointRemoteControlSessionAirPlay <= 50
        && (gLogCategory_APEndpointRemoteControlSessionAirPlay != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      dispatch_release(v5);
    }
    else
    {
      APSLogErrorAt();
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
