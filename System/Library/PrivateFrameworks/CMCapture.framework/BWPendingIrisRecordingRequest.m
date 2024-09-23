@implementation BWPendingIrisRecordingRequest

+ (id)irisRecordingRequestWithFigCaptureMovieFileRecordingSettings:(id)a3
{
  return -[BWPendingIrisRecordingRequest _initWithFigCaptureMovieFileRecordingSettings:]([BWPendingIrisRecordingRequest alloc], a3);
}

- (_QWORD)_initWithFigCaptureMovieFileRecordingSettings:(void *)a1
{
  _QWORD *v3;
  objc_super v5;

  if (!a1)
    return 0;
  v5.receiver = a1;
  v5.super_class = (Class)BWPendingIrisRecordingRequest;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3)
    v3[1] = a2;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPendingIrisRecordingRequest;
  -[BWPendingIrisRecordingRequest dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = -[BWPendingIrisRecordingRequest _initWithFigCaptureMovieFileRecordingSettings:](+[BWPendingIrisRecordingRequest allocWithZone:](BWPendingIrisRecordingRequest, "allocWithZone:", a3), self->_settings);
  objc_msgSend(v4, "setEnqueuedHostTime:", self->_enqueuedHostTime);
  objc_msgSend(v4, "setPairedRequestCreated:", self->_pairedRequestCreated);
  objc_msgSend(v4, "setIrisMovieInfo:", self->_irisMovieInfo);
  return v4;
}

- (id)description
{
  void *v3;
  double v4;
  uint64_t v5;
  int64_t v6;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  mach_absolute_time();
  v4 = (double)FigHostTimeToNanoseconds() / 1000000000.0;
  v5 = objc_opt_class();
  v6 = -[FigCaptureRecordingSettings settingsID](self->_settings, "settingsID");
  v7 = CFSTR("YES");
  if (!self->_pairedRequestCreated)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %p: captureID:%lld [enqueuedInterval: %.4f seconds, pairedRequestCreated: %@, irisMovieInfo: %@]"), v5, self, v6, *(_QWORD *)&v4, v7, self->_irisMovieInfo);
  return v3;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3
{
  __int128 v3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3 = *(_OWORD *)&a3->var0;
  self->_momentCaptureMovieRecordingMasterEndTime.epoch = a3->var3;
  *(_OWORD *)&self->_momentCaptureMovieRecordingMasterEndTime.value = v3;
  v4 = *a3;
  -[BWIrisMovieInfo setMomentCaptureMovieRecordingMasterEndTime:](self->_irisMovieInfo, "setMomentCaptureMovieRecordingMasterEndTime:", &v4);
}

- (BOOL)isEmpty
{
  return self->_irisMovieInfo == 0;
}

- (void)setIrisMovieInfo:(id)a3
{

  self->_irisMovieInfo = (BWIrisMovieInfo *)a3;
  -[BWIrisMovieInfo setEnqueuedHostTime:](self->_irisMovieInfo, "setEnqueuedHostTime:", -[BWPendingIrisRecordingRequest enqueuedHostTime](self, "enqueuedHostTime"));
}

- (FigCaptureMovieFileRecordingSettings)settings
{
  return self->_settings;
}

- (int64_t)enqueuedHostTime
{
  return self->_enqueuedHostTime;
}

- (void)setEnqueuedHostTime:(int64_t)a3
{
  self->_enqueuedHostTime = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)momentCaptureMovieRecordingMasterEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (BOOL)isPairedRequestCreated
{
  return self->_pairedRequestCreated;
}

- (void)setPairedRequestCreated:(BOOL)a3
{
  self->_pairedRequestCreated = a3;
}

- (BWIrisMovieInfo)irisMovieInfo
{
  return self->_irisMovieInfo;
}

@end
