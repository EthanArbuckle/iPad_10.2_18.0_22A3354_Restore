@implementation ManagedInputStream

- (ManagedInputStream)initWithPaused:(BOOL)a3 attributedTo:(id)a4 definition:(id)a5 canRecord:(BOOL)a6 fader:(shared_ptr<caulk:(id)a8 :synchronized<Phase::Controller::ExternalStreamFader>>)a7 pauseStateDidUpdateCallback:
{
  __shared_weak_count *cntrl;
  uint64_t *ptr;
  id v15;
  id v16;
  __shared_weak_count *v17;
  ManagedInputStream *v18;
  ManagedInputStream *v19;
  void *v20;
  id pauseStateDidUpdateCallback;
  objc_super v23;

  cntrl = a7.__cntrl_;
  ptr = (uint64_t *)a7.__ptr_;
  v15 = a4;
  v16 = a5;
  v17 = cntrl;
  v23.receiver = self;
  v23.super_class = (Class)ManagedInputStream;
  v18 = -[ManagedInputStream init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_streamPaused = a3;
    objc_storeStrong((id *)&v18->_definition, a5);
    objc_storeStrong((id *)&v19->_attributedClientID, a4);
    v19->_canRecord = a6;
    v19->_isMuted = 0;
    std::shared_ptr<Phase::Controller::SpatialModelerInstance::SubmixInfo>::operator=[abi:ne180100](&v19->_fader.__ptr_, *ptr, ptr[1]);
    v19->_isFading = 0;
    v20 = _Block_copy(v17);
    pauseStateDidUpdateCallback = v19->_pauseStateDidUpdateCallback;
    v19->_pauseStateDidUpdateCallback = v20;

  }
  return v19;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (PHASEExternalInputStreamDefinition)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_definition, a3);
}

- (NSUUID)attributedClientID
{
  return self->_attributedClientID;
}

- (void)setAttributedClientID:(id)a3
{
  objc_storeStrong((id *)&self->_attributedClientID, a3);
}

- (BOOL)canRecord
{
  return self->_canRecord;
}

- (void)setCanRecord:(BOOL)a3
{
  self->_canRecord = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)fader
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>> result;

  cntrl = self->_fader.__cntrl_;
  *v2 = self->_fader.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setFader:(shared_ptr<caulk::synchronized<Phase::Controller::ExternalStreamFader>>)a3
{
  std::shared_ptr<Phase::Controller::SpatialModelerInstance::SubmixInfo>::operator=[abi:ne180100](&self->_fader.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (BOOL)isFading
{
  return self->_isFading;
}

- (void)setIsFading:(BOOL)a3
{
  self->_isFading = a3;
}

- (BOOL)shouldResumeWithSession
{
  return self->_shouldResumeWithSession;
}

- (void)setShouldResumeWithSession:(BOOL)a3
{
  self->_shouldResumeWithSession = a3;
}

- (id)pauseStateDidUpdateCallback
{
  return self->_pauseStateDidUpdateCallback;
}

- (void)setPauseStateDidUpdateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  std::shared_ptr<Phase::Geometry::SystemState>::~shared_ptr[abi:ne180100]((uint64_t)&self->_fader);
  objc_storeStrong(&self->_pauseStateDidUpdateCallback, 0);
  objc_storeStrong((id *)&self->_attributedClientID, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
