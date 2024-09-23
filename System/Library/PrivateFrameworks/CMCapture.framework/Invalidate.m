@implementation Invalidate

void __captureSession_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 320));
  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 324) = 0;
  *(_WORD *)(v2 + 332) = 0;

  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 352) = 0;
  if (*(_BYTE *)(v3 + 335))
  {
    objc_msgSend(*(id *)(v3 + 392), "setClientApplicationID:", *(_QWORD *)(v3 + 56));
    -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392));
    v3 = *(_QWORD *)(a1 + 32);
  }

  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v4 + 392) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 320));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
  {
    objc_msgSend(+[FigCaptureDisplayLayoutMonitor sharedDisplayLayoutMonitor](FigCaptureDisplayLayoutMonitor, "sharedDisplayLayoutMonitor"), "removeLayoutObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 672));
    v5 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v5 + 80) = 0;
    v6 = *(_QWORD *)(v5 + 56);
    if (v6)
    {
      os_unfair_lock_lock(&sFigCaptureSessionPrewarming);
      v7 = (void *)objc_msgSend((id)qword_1ECFE9DE0, "objectForKeyedSubscript:", v6);
      if (v7)
      {
        v8 = objc_msgSend(v7, "referencedObject");
        if (!v8 || v8 == *(_QWORD *)(a1 + 40))
          objc_msgSend((id)qword_1ECFE9DE0, "setObject:forKeyedSubscript:", 0, v6);
      }
      os_unfair_lock_unlock(&sFigCaptureSessionPrewarming);
    }
  }
  captureSession_stopRunningInternal(*(const void **)(a1 + 40), 1, 0);
  captureSession_teardownGraph(*(const void **)(a1 + 40), 0, 0, 0, 0, 0);
  objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "unregisterClient:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 712));

  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v9 + 720) = 0;
  objc_msgSend(*(id *)(v9 + 88), "invalidate");

  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v10 + 88) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 716));
  v11 = *(os_unfair_lock_s **)(a1 + 32);
  v11[178]._os_unfair_lock_opaque = 0;
  os_unfair_lock_unlock(v11 + 179);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 320));

  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v12 + 464) = 0;

  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v13 + 464) = 0;

  v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v14 + 480) = 0;

  v15 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v15 + 488) = 0;

  v16 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v16 + 400) = 0;

  v17 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v17 + 408) = 0;

  v18 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v18 + 416) = 0;

  v19 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v19 + 424) = 0;

  v20 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v20 + 440) = 0;

  v21 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v21 + 448) = 0;

  v22 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v22 + 456) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 320));

  v23 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v23 + 672) = 0;

  v24 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v24 + 680) = 0;

  v25 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v25 + 696) = 0;

  v26 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v26 + 704) = 0;
  v27 = *(NSObject **)(v26 + 264);
  if (v27)
  {
    dispatch_source_cancel(v27);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  }
  v28 = (void *)objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  objc_msgSend(v28, "removeObserverForType:observer:name:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240), *MEMORY[0x1E0CFF058]);
  v29 = (void *)objc_msgSend(MEMORY[0x1E0CFF1C8], "sharedInstance");
  objc_msgSend(v29, "removeObserverForType:observer:name:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), *MEMORY[0x1E0CFF070]);

  v30 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v30 + 240) = 0;

  v31 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v31 + 248) = 0;

  v32 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v32 + 216) = 0;
  cs_clearPocketDetectionNeeded(0, *(_QWORD *)(v32 + 56));
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(const void **)(v33 + 224);
  if (v34)
  {
    CFRelease(v34);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
    v33 = *(_QWORD *)(a1 + 32);
  }
  v35 = *(const void **)(v33 + 304);
  if (v35)
  {
    CFRelease(v35);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  }
  captureSession_cancelPrewarmingTimeoutTimer();

  v36 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v36 + 752) = 0;

  v37 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v37 + 744) = 0;
  v38 = *(const void **)(v37 + 736);
  if (v38)
  {
    CFRelease(v38);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736) = 0;
    v37 = *(_QWORD *)(a1 + 32);
  }
  dispatch_sync(*(dispatch_queue_t *)(v37 + 112), &__block_literal_global_657);
}

void __captureDeferredPhotoProcessor_Invalidate_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  v2 = *(const void **)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  captureDeferredPhotoProcessor_cleanupForCurrentProcessingRequest(v2);
  -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "closeTransaction:", 1);

  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 40) = 0;

  v4 = *(_QWORD **)(a1 + 32);
  v4[12] = 0;
  v5 = (void *)v4[10];
  if (v5)
  {
    v4[10] = 0;
    xpc_release(v5);
    v4 = *(_QWORD **)(a1 + 32);
  }
  v4[11] = 0;
}

@end
