@implementation AVMomentCaptureMovieRequest

+ (id)requestWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDelegate:movieRecordingSettings:momentSettings:", a3, a4, a5);
}

- (id)_initWithDelegate:(id)a3 movieRecordingSettings:(id)a4 momentSettings:(id)a5
{
  AVMomentCaptureMovieRequest *v8;
  AVWeakReferencingDelegateStorage *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMomentCaptureMovieRequest;
  v8 = -[AVMomentCaptureMovieRequest init](&v11, sel_init);
  if (v8)
  {
    v9 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
    v8->_delegateStorage = v9;
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](v9, "setDelegate:queue:", a3, MEMORY[0x1E0C80D38]);
    v8->_unresolvedSettings = (AVMomentCaptureMovieRecordingSettings *)a4;
    v8->_momentCaptureSettings = (AVMomentCaptureSettings *)a5;
    if (-[AVMomentCaptureMovieRecordingSettings movieFileURL](v8->_unresolvedSettings, "movieFileURL"))
      v8->_expectedMovieCount = 1;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRequest;
  -[AVMomentCaptureMovieRequest dealloc](&v3, sel_dealloc);
}

- (AVMomentCaptureMovieRecordingResolvedSettings)resolvedSettings
{
  return self->_resolvedSettings;
}

- (void)setResolvedSettings:(id)a3
{
  self->_expectedMovieCount = 0;
  if (objc_msgSend(a3, "movieURL"))
    ++self->_expectedMovieCount;
  if (objc_msgSend(a3, "spatialOverCaptureURL"))
    ++self->_expectedMovieCount;

  self->_resolvedSettings = (AVMomentCaptureMovieRecordingResolvedSettings *)a3;
}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (AVMomentCaptureMovieRecordingSettings)unresolvedSettings
{
  return self->_unresolvedSettings;
}

- (AVMomentCaptureSettings)momentCaptureSettings
{
  return self->_momentCaptureSettings;
}

- (unint64_t)expectedMovieCount
{
  return self->_expectedMovieCount;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (AVMomentCaptureMovie)movie
{
  return self->_movie;
}

- (void)setMovie:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (AVMomentCaptureMovie)spatialOverCaptureMovie
{
  return self->_spatialOverCaptureMovie;
}

- (void)setSpatialOverCaptureMovie:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
