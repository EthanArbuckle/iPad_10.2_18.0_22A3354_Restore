@implementation BWFileSinkNode

- (void)setRecordingStatusDelegate:(id)a3
{
  self->_recordingStatusDelegate = (BWNodeFileWriterStatusDelegate *)a3;
}

- (unint64_t)lastFileSize
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (BWNodeFileWriterStatusDelegate)recordingStatusDelegate
{
  return self->_recordingStatusDelegate;
}

@end
