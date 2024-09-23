@implementation StillImageSinkPrepareToCaptureBracket

void __captureSession_StillImageSinkPrepareToCaptureBracket_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void *)a1[5];
  v2 = (const void *)a1[6];
  v4 = (void *)a1[4];
  v5 = (void *)objc_msgSend(*(id *)(CMBaseObjectGetDerivedStorage() + 624), "stillImageSinkPipelineSessionStorageWithSinkID:", v4);
  v6 = (void *)objc_msgSend(v5, "stillImageSinkPipeline");
  v7 = (void *)objc_msgSend(v6, "stillImageCoordinatorNode");
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (v6)
      goto LABEL_3;
LABEL_8:
    v15 = v1;
    LODWORD(v14) = 0;
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_8;
LABEL_3:
  if (!v7)
  {
    v15 = v1;
    LODWORD(v14) = 0;
    FigDebugAssert3();
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend(v6, "sinkID")) & 1) != 0)
  {
    objc_msgSend(v3, "setClientInitiatedPrepareSettings:", 1);
    v8 = stillImageSinkPipelineSessionStorage_stillImageOutputDimensionsForSettings(v5, v3);
    v9 = HIDWORD(v8);
    objc_msgSend(v3, "setOutputWidth:", v8);
    objc_msgSend(v3, "setOutputHeight:", v9);
    objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](objc_msgSend(v5, "cameraSourcePipeline")), "zoomFactor");
    BWUpdateThumbnailAndPreviewDimensionsForRequestedSettings(v3, v10);
    v11 = objc_msgSend(v7, "prepareStillImageCaptureNowWithSettings:", v3);
    if (!(_DWORD)v11)
      return;
    v12 = v11;
    v15 = v1;
    LODWORD(v14) = v11;
    FigDebugAssert3();
LABEL_15:
    v13 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus((uint64_t)v4, objc_msgSend(v3, "settingsID", v14, v15), v12);
    captureSession_postNotificationWithPayload(v2, CFSTR("BracketPreparationComplete"), v13);
    return;
  }
  v15 = v1;
  LODWORD(v14) = 0;
LABEL_11:
  FigDebugAssert3();
LABEL_12:
  v12 = FigSignalErrorAt();
  if ((_DWORD)v12)
    goto LABEL_15;
}

@end
