@implementation IrisStillImageSinkBeginMomentCapture

void __captureSession_IrisStillImageSinkBeginMomentCapture_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t DerivedStorage;
  uint64_t v4;
  FigCaptureIrisStillImageSettings *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  FigCaptureIrisStillImageSettings *v9;
  FigCaptureIrisStillImageSettings *v10;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(DerivedStorage + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 32)), "cameraSourcePipeline");
  *(_DWORD *)(DerivedStorage + 312) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
  if (*(_QWORD *)(DerivedStorage + 568))
  {
    v8 = v1;
    LODWORD(v7) = 0;
    FigDebugAssert3();
  }
  *(_QWORD *)(DerivedStorage + 568) = objc_msgSend(*(id *)(a1 + 40), "settingsID", v7, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
  if (cs_touchDownMomentStillCaptureEnabled_onceToken != -1)
    dispatch_once(&cs_touchDownMomentStillCaptureEnabled_onceToken, &__block_literal_global_357);
  v5 = (FigCaptureIrisStillImageSettings *)(id)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings");
  if (!v5)
  {
    v9 = -[FigCaptureStillImageSettings initWithSettingsID:captureRequestIdentifier:]([FigCaptureIrisStillImageSettings alloc], "initWithSettingsID:captureRequestIdentifier:", objc_msgSend(*(id *)(a1 + 40), "settingsID"), objc_msgSend(*(id *)(a1 + 40), "captureRequestIdentifier"));
    -[FigCaptureStillImageSettings setStillImageUserInitiatedRequestTime:](v9, "setStillImageUserInitiatedRequestTime:", objc_msgSend(*(id *)(a1 + 40), "userInitiatedCaptureTime"));
    -[FigCaptureStillImageSettings setFlashMode:](v9, "setFlashMode:", objc_msgSend(*(id *)(a1 + 40), "flashMode"));
    -[FigCaptureStillImageSettings setAutoRedEyeReductionEnabled:](v9, "setAutoRedEyeReductionEnabled:", objc_msgSend(*(id *)(a1 + 40), "autoRedEyeReductionEnabled"));
    -[FigCaptureStillImageSettings setDigitalFlashMode:](v9, "setDigitalFlashMode:", objc_msgSend(*(id *)(a1 + 40), "digitalFlashMode"));
    -[FigCaptureStillImageSettings setQualityPrioritization:](v9, "setQualityPrioritization:", objc_msgSend(*(id *)(a1 + 40), "qualityPrioritization"));
    -[FigCaptureStillImageSettings setClientQualityPrioritization:](v9, "setClientQualityPrioritization:", objc_msgSend(*(id *)(a1 + 40), "clientQualityPrioritization"));
    -[FigCaptureStillImageSettings setHDRMode:](v9, "setHDRMode:", objc_msgSend(*(id *)(a1 + 40), "HDRMode"));
    -[FigCaptureStillImageSettings setProvidesOriginalImage:](v9, "setProvidesOriginalImage:", objc_msgSend(*(id *)(a1 + 40), "isAutoOriginalPhotoDeliveryEnabled"));
    -[FigCaptureStillImageSettings setAutoDeferredProcessingEnabled:](v9, "setAutoDeferredProcessingEnabled:", objc_msgSend(*(id *)(a1 + 40), "isAutoDeferredProcessingEnabled"));
    -[FigCaptureStillImageSettings setRawOutputFormat:](v9, "setRawOutputFormat:", objc_msgSend(*(id *)(a1 + 40), "rawOutputFormat"));
    -[FigCaptureStillImageSettings setOutputWidth:](v9, "setOutputWidth:", objc_msgSend(*(id *)(a1 + 40), "outputWidth"));
    -[FigCaptureStillImageSettings setOutputHeight:](v9, "setOutputHeight:", objc_msgSend(*(id *)(a1 + 40), "outputHeight"));
    -[FigCaptureStillImageSettings setDepthDataDeliveryEnabled:](v9, "setDepthDataDeliveryEnabled:", objc_msgSend(*(id *)(a1 + 40), "depthDataDeliveryEnabled"));
    v5 = v9;
  }
  v10 = v5;
  -[FigCaptureStillImageSettings setSettingsProvider:](v5, "setSettingsProvider:", 1);
  -[FigCaptureStillImageSettings setBeginMomentCaptureSettings:](v10, "setBeginMomentCaptureSettings:", 1);
  -[FigCaptureStillImageSettings setStillImageRequestTime:](v10, "setStillImageRequestTime:", *(_QWORD *)(a1 + 56));
  captureSession_updateOutputDimensionsAndResolutionFlavor(-[FigCaptureStillImageSettings outputWidth](v10, "outputWidth") | (unint64_t)(-[FigCaptureStillImageSettings outputHeight](v10, "outputHeight") << 32), v4, v10);
  v6 = captureSession_captureStillImageNow(*(const void **)(a1 + 48), *(void **)(a1 + 32), v10);
  if (v6)
  {
    FigDebugAssert3();
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 320));
    *(_QWORD *)(DerivedStorage + 568) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 320));
  }
  *(_DWORD *)(DerivedStorage + 312) = v6;

}

uint64_t __captureSession_IrisStillImageSinkBeginMomentCapture_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(result + 312) = *(_DWORD *)(a1 + 40);
  return result;
}

@end
