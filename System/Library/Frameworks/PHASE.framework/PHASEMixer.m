@implementation PHASEMixer

- (PHASEMixer)init
{
  -[PHASEMixer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMixer)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (PHASEMixer)initWithIdentifier:(id)a3
{
  id v5;
  PHASEMixer *v6;
  PHASEMixer *v7;
  PHASEMetaParameter *gainMetaParameter;
  PHASEMixer *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEMixer;
  v6 = -[PHASEMixer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    gainMetaParameter = v6->_gainMetaParameter;
    v6->_gain = 1.0;
    v6->_gainMetaParameter = 0;

    objc_storeStrong((id *)&v7->_identifier, a3);
    v9 = v7;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)gain
{
  return self->_gain;
}

- (PHASEMetaParameter)gainMetaParameter
{
  return self->_gainMetaParameter;
}

- (weak_ptr<Phase::ActionTreeObject>)weakActionTreeObject
{
  ActionTreeObject **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  weak_ptr<Phase::ActionTreeObject> result;

  cntrl = self->_weakActionTreeObject.__cntrl_;
  *v2 = self->_weakActionTreeObject.__ptr_;
  v2[1] = (ActionTreeObject *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ActionTreeObject *)self;
  return result;
}

- (void)setWeakActionTreeObject:(weak_ptr<Phase::ActionTreeObject>)a3
{
  __shared_weak_count *v3;
  ActionTreeObject *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;

  v4 = *(ActionTreeObject **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 16);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_weakActionTreeObject.__cntrl_;
  self->_weakActionTreeObject.__ptr_ = v4;
  self->_weakActionTreeObject.__cntrl_ = v3;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;

  cntrl = self->_weakActionTreeObject.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  objc_storeStrong((id *)&self->_gainMetaParameter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
