@implementation FigCaptureSessionMovieFileSinkPipeline

- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3
{
  self->_checkIfFileAlreadyExistForMFO = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionMovieFileSinkPipeline;
  -[FigCaptureMovieFileSinkPipeline dealloc](&v3, sel_dealloc);
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
  -[FigCaptureMovieFileSinkPipeline setRecordingForAllTailPipelines:]((unint64_t)self, a3);
}

- (BOOL)recording
{
  return self->_recording;
}

- (BOOL)momentCaptureMovieRecordingEnabled
{
  return self->_momentCaptureMovieRecordingEnabled;
}

- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3
{
  self->_momentCaptureMovieRecordingEnabled = a3;
}

- (BOOL)recordedWhileMultitasking
{
  return self->_recordedWhileMultitasking;
}

- (void)setRecordedWhileMultitasking:(BOOL)a3
{
  self->_recordedWhileMultitasking = a3;
}

- (NSMutableArray)pendingIrisRecordings
{
  return self->_pendingIrisRecordings;
}

- (void)setPendingIrisRecordings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (BOOL)checkIfFileAlreadyExistForMFO
{
  return self->_checkIfFileAlreadyExistForMFO;
}

@end
