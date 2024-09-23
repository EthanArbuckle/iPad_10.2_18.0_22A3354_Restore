@implementation FileSinkStopRecording

uint64_t __captureSession_FileSinkStopRecording_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t DerivedStorage;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  result = _FigIsCurrentDispatchQueue();
  if (!(_DWORD)result)
    result = FigDebugAssert3();
  if (!*(_BYTE *)DerivedStorage)
  {
    v4 = objc_msgSend(*(id *)(DerivedStorage + 624), "movieFileSinkPipelineWithSinkID:", v1);
    v5 = v4;
    if (v4)
      v6 = -[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v4);
    else
      v6 = -[FigCaptureAudioFileSinkPipeline fileCoordinatorNode](objc_msgSend(*(id *)(DerivedStorage + 624), "audioFileSinkPipelineWithSinkID:", v1));
    v7 = (void *)v6;
    if (objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5), "temporalNoiseReductionBand0StrengthModulation"))objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v5), "setTemporalNoiseReductionBand0StrengthModulation:", 0);
    if (v7)
    {
      v8 = objc_msgSend(*(id *)(DerivedStorage + 624), "cameraSourcePipelineWithSourceID:", -[FigCaptureMovieFileSinkPipeline videoSourceID](v5));
      objc_msgSend(v7, "stopRecordingWithErrorCode:setupToAllowWaitingForRecordingToStop:", 0, -[FigCaptureCameraSourcePipeline trueVideoCaptureEnabled](v8));
      return objc_msgSend((id)-[FigCaptureCameraSourcePipeline captureDevice](v8), "setFrameSkippingWhenNotRecordingEnabled:", 1);
    }
    else
    {
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

@end
