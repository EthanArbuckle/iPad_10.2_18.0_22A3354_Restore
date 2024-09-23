@implementation FigCaptureMovieFileSinkHeadPipelineConfiguration

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (void)setTransferPipelineStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setMovieFilePipelineStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkHeadPipelineConfiguration;
  -[FigCaptureMovieFileSinkHeadPipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (BWPipelineStage)transferPipelineStage
{
  return self->_transferPipelineStage;
}

- (int)visMotionMetadataPreloadingMode
{
  return self->_visMotionMetadataPreloadingMode;
}

- (void)setVisMotionMetadataPreloadingMode:(int)a3
{
  self->_visMotionMetadataPreloadingMode = a3;
}

@end
