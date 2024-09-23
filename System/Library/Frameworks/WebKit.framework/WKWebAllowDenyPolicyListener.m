@implementation WKWebAllowDenyPolicyListener

- (WKWebAllowDenyPolicyListener)initWithCompletionHandler:(void *)a3
{
  WKWebAllowDenyPolicyListener *v4;
  WKWebAllowDenyPolicyListener *v5;
  void *v6;
  void *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKWebAllowDenyPolicyListener;
  v4 = -[WKWebAllowDenyPolicyListener init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)a3;
    *(_QWORD *)a3 = 0;
    value = v4->_completionHandler.m_callableWrapper.__ptr_.__value_;
    v5->_completionHandler.m_callableWrapper.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (void)allow
{
  (*(void (**)(void *, uint64_t))(*(_QWORD *)self->_completionHandler.m_callableWrapper.__ptr_.__value_ + 16))(self->_completionHandler.m_callableWrapper.__ptr_.__value_, 1);
}

- (void)deny
{
  (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_completionHandler.m_callableWrapper.__ptr_.__value_ + 16))(self->_completionHandler.m_callableWrapper.__ptr_.__value_, 0);
}

- (void).cxx_destruct
{
  void *value;

  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
