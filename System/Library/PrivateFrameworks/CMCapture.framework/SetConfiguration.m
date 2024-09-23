@implementation SetConfiguration

void __captureSession_SetConfiguration_block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t DerivedStorage;
  void *v6;
  id v7;
  FigCaptureSessionParsedConfiguration *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t);
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned int (*v20)(uint64_t, const __CFString *, uint64_t);
  uint64_t v21;
  unsigned int (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3[92]._os_unfair_lock_opaque - 1 > 1)
  {
    os_unfair_lock_lock(v3 + 80);
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v4 + 376) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 320));
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!_FigIsCurrentDispatchQueue())
    {
      v24 = v1;
      LODWORD(v23) = 0;
      FigDebugAssert3();
    }
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
    v6 = *(void **)(DerivedStorage + 408);
    if (v6 == *(void **)(DerivedStorage + 416))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
      v7 = 0;
    }
    else
    {
      v7 = v6;
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
      if (v7)
      {
        v8 = -[FigCaptureSessionParsedConfiguration initWithSessionConfiguration:clientSetsUserInitiatedCaptureRequestTime:restrictions:]([FigCaptureSessionParsedConfiguration alloc], "initWithSessionConfiguration:clientSetsUserInitiatedCaptureRequestTime:restrictions:", v7, captureSession_clientSetsUserInitiatedCaptureRequestTime(), *(_QWORD *)(DerivedStorage + 400));
        if (v8)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v9 = -[FigCaptureSessionParsedConfiguration parsedCameraSourceConfigurations](v8, "parsedCameraSourceConfigurations");
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "cameraConfiguration", v23, v24);
                if ((objc_msgSend(v14, "hasSetVideoZoomFactorOnCaptureSource") & 1) == 0)
                {
                  v15 = objc_msgSend(v14, "source");
                  v16 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                  if (!v16
                    || v16(v15)
                    || (v17 = objc_msgSend(v14, "source"),
                        v18 = (void *)MEMORY[0x1E0CB37E8],
                        objc_msgSend(v14, "videoZoomFactor"),
                        v19 = objc_msgSend(v18, "numberWithFloat:"),
                        (v20 = *(unsigned int (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56)) == 0)
                    || v20(v17, CFSTR("VideoZoomFactor"), v19)
                    || (v21 = objc_msgSend(v14, "source"),
                        (v22 = *(unsigned int (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16)) == 0)
                    || v22(v21))
                  {
                    FigDebugAssert3();
                    goto LABEL_26;
                  }
                  objc_msgSend(v14, "setHasSetVideoZoomFactorOnCaptureSource:", 1);
                }
              }
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
              if (v11)
                continue;
              break;
            }
          }
        }
        else
        {
          FigSignalErrorAt();
        }
      }
    }
LABEL_26:

  }
  else
  {
    captureSession_commitInflightConfiguration(*(const void **)(a1 + 40));
  }
}

@end
