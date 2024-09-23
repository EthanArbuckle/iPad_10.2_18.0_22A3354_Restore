@implementation FigFlashlightCreate

void __FigFlashlightCreate_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t DerivedStorage;
  int v8;
  NSObject *v9;
  _QWORD block[6];
  int v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "retainReferencedObject");
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = *(_QWORD *)(a1 + 32);
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v8 = *(_DWORD *)(DerivedStorage + 96);
    v9 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __flashlight_videoDeviceAvailabilityListener_block_invoke;
    block[3] = &unk_1E491EEF8;
    block[4] = v6;
    block[5] = a2;
    v11 = v8;
    dispatch_async(v9, block);
    CFRelease(v5);
  }
}

void __FigFlashlightCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  const void *v5;
  float v6;
  float v7;
  uint64_t DerivedStorage;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "retainReferencedObject");
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend(a2, "maxTorchLevel");
    v7 = v6;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    pthread_mutex_lock(*(pthread_mutex_t **)(DerivedStorage + 80));
    if (*(float *)(DerivedStorage + 24) > v7)
    {
      v9 = flashlight_setLevelInternal(v5, v7);
      if (v9)
      {
        v11 = v2;
        LODWORD(v10) = v9;
        FigDebugAssert3();
      }
      if (v7 == 0.0)
        flashlight_teardownDevice(v5, 0);
    }
    flashlight_postNotificationWithPayload(v5, CFSTR("FlashlightOverheated"), (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 < 1.0, v10, v11));
    pthread_mutex_unlock(*(pthread_mutex_t **)(DerivedStorage + 80));
    CFRelease(v5);
  }
}

@end
