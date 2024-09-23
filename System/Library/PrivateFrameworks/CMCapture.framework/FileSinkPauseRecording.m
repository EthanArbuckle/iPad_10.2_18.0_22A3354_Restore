@implementation FileSinkPauseRecording

uint64_t __captureSession_FileSinkPauseRecording_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!_FigIsCurrentDispatchQueue())
  {
    v11 = v1;
    LODWORD(v10) = 0;
    FigDebugAssert3();
  }
  *(_BYTE *)(DerivedStorage + 760) = 1;
  v4 = objc_msgSend(*(id *)(DerivedStorage + 624), "movieFileSinkPipelineWithSinkID:", v2, v10, v11);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v4);
    v7 = -[FigCaptureMovieFileSinkPipeline videoCompressorNodes](v5) != 0;
    if (v6)
      goto LABEL_5;
LABEL_10:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  v6 = (void *)-[FigCaptureAudioFileSinkPipeline fileCoordinatorNode](objc_msgSend(*(id *)(DerivedStorage + 624), "audioFileSinkPipelineWithSinkID:", v2));
  v7 = 0;
  if (!v6)
    goto LABEL_10;
LABEL_5:
  objc_msgSend(v6, "pauseRecording");
  v8 = objc_msgSend(*(id *)(DerivedStorage + 624), "cameraSourcePipelineWithSourceID:", -[FigCaptureMovieFileSinkPipeline videoSourceID](v5));
  result = objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v8), "setFrameSkippingWhenNotRecordingEnabled:", 1);
  if (v7)
  {
    result = objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5), "autoImageControlMode");
    if ((_DWORD)result == 2)
      return objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5), "setAutoImageControlMode:", 1);
  }
  return result;
}

@end
