@implementation FigCaptureMovieFileSinkMiddlePipelineConfiguration

- (void)setMovieFileSinkPipelineConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setMovieFilePipelineStage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BWPipelineStage)movieFilePipelineStage
{
  return self->_movieFilePipelineStage;
}

- (FigCaptureMovieFileSinkMiddlePipelineConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipelineConfiguration;
  return -[FigCaptureMovieFileSinkMiddlePipelineConfiguration init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipelineConfiguration;
  -[FigCaptureMovieFileSinkMiddlePipelineConfiguration dealloc](&v3, sel_dealloc);
}

- (FigCaptureMovieFileSinkPipelineConfiguration)movieFileSinkPipelineConfiguration
{
  return self->_movieFileSinkPipelineConfiguration;
}

@end
