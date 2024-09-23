@implementation FigCaptureMovieFileSinkTailPipelineConfiguration

- (void)setVitalityScoringEnabled:(BOOL)a3
{
  self->_vitalityScoringEnabled = a3;
}

- (void)setVideoSourceOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setMovieFilePipelineStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setMetadataSourceOutputs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setIrisIntermediateJPEGPhotoDecompressorNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setIndexesOfDetectedObjectsInMetadataOutputs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setIndexOfVideoOrientationInMetadataOutputs:(int)a3
{
  self->_indexOfVideoOrientationInMetadataOutputs = a3;
}

- (void)setDelayedCompressorCleanupEnabled:(BOOL)a3
{
  self->_delayedCompressorCleanupEnabled = a3;
}

- (void)setAudioSourceOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (FigCaptureMovieFileSinkTailPipelineConfiguration)init
{
  FigCaptureMovieFileSinkTailPipelineConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipelineConfiguration;
  result = -[FigCaptureMovieFileSinkTailPipelineConfiguration init](&v3, sel_init);
  if (result)
    result->_indexOfVideoOrientationInMetadataOutputs = -1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipelineConfiguration;
  -[FigCaptureMovieFileSinkTailPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (BWNodeOutput)videoSourceOutput
{
  return self->_videoSourceOutput;
}

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (int)indexOfVideoOrientationInMetadataOutputs
{
  return self->_indexOfVideoOrientationInMetadataOutputs;
}

- (BWNodeOutput)audioSourceOutput
{
  return self->_audioSourceOutput;
}

- (BOOL)vitalityScoringEnabled
{
  return self->_vitalityScoringEnabled;
}

- (NSArray)metadataSourceOutputs
{
  return self->_metadataSourceOutputs;
}

- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode
{
  return self->_irisIntermediateJPEGPhotoDecompressorNode;
}

- (NSArray)indexesOfDetectedObjectsInMetadataOutputs
{
  return self->_indexesOfDetectedObjectsInMetadataOutputs;
}

- (BOOL)delayedCompressorCleanupEnabled
{
  return self->_delayedCompressorCleanupEnabled;
}

- (BWNodeOutput)cinematicAudioSourceOutput
{
  return self->_cinematicAudioSourceOutput;
}

- (void)setCinematicAudioSourceOutput:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
