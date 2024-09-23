@implementation IrisStillImageSinkCaptureImage

uint64_t __captureSession_IrisStillImageSinkCaptureImage_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(CMBaseObjectGetDerivedStorage() + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", *(_QWORD *)(a1 + 32)), "cameraSourcePipeline");
  objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v2), "nonDestructiveCropSize");
  objc_msgSend(*(id *)(a1 + 40), "setNonDestructiveCropSize:");
  cs_updateSmartStyleSupport(*(_QWORD *)(a1 + 48), *(void **)(a1 + 40), (void *)objc_msgSend(*(id *)(a1 + 40), "movieRecordingSettings"));
  result = captureSession_captureStillImageNow(*(const void **)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40));
  if (!(_DWORD)result)
    return cs_IrisStillImageSinkPrepareMovieRecording(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return result;
}

@end
