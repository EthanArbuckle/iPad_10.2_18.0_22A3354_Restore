@implementation IrisStillImageSinkPrepareToCapture

void __captureSession_IrisStillImageSinkPrepareToCapture_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)a1[5];
  v2 = (const void *)a1[6];
  v4 = (void *)a1[4];
  v5 = (void *)objc_msgSend(*(id *)(CMBaseObjectGetDerivedStorage() + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", v4);
  v6 = (void *)objc_msgSend(v5, "stillImageSinkPipeline");
  v7 = (void *)objc_msgSend(v6, "stillImageCoordinatorNode");
  v8 = objc_msgSend(v5, "cameraSourcePipeline");
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (v6)
      goto LABEL_3;
LABEL_8:
    v16 = v1;
    LODWORD(v15) = 0;
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_8;
LABEL_3:
  if (!v7)
  {
    v16 = v1;
    LODWORD(v15) = 0;
    FigDebugAssert3();
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend(v6, "sinkID")) & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v3, "figCaptureStillImageSettingsRepresentation");
    objc_msgSend(v9, "setClientInitiatedPrepareSettings:", 1);
    v10 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, v9);
    captureSession_updateOutputDimensionsAndResolutionFlavor(v10, v8, v9);
    objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v8), "zoomFactor");
    BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v9, v11);
    v12 = objc_msgSend(v7, "prepareStillImageCaptureNowWithSettings:", v9);
    if (!(_DWORD)v12)
      return;
    v13 = v12;
    v16 = v1;
    LODWORD(v15) = v12;
    FigDebugAssert3();
LABEL_15:
    v14 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus((uint64_t)v4, objc_msgSend(v3, "settingsID", v15, v16), v13);
    captureSession_postNotificationWithPayload(v2, CFSTR("IrisPreparationComplete"), v14);
    return;
  }
  v16 = v1;
  LODWORD(v15) = 0;
LABEL_11:
  FigDebugAssert3();
LABEL_12:
  v13 = FigSignalErrorAt();
  if ((_DWORD)v13)
    goto LABEL_15;
}

@end
