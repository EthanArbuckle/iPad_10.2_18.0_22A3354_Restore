@implementation AMSCURLSessionTaskContext

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  -[AMSCURLSessionTaskContext setMetrics:](self, "setMetrics:", a5, a4);
}

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  _QWORD *value;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;

  objc_storeStrong((id *)&self->_metrics, 0);
  value = self->_stopCallback.__ptr_.__value_;
  self->_stopCallback.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = value[9];
    if (v4)
    {
      std::__stop_state::__remove_callback[abi:fe180100](v4, value);
      v5 = value[9];
      if (v5)
      {
        v6 = (unsigned int *)(v5 + 4);
        do
        {
          v7 = __ldaxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
          MEMORY[0x18D789BDC]();
      }
    }
    v9 = (_QWORD *)value[8];
    if (v9 == value + 5)
    {
      v10 = 4;
      v9 = value + 5;
    }
    else
    {
      if (!v9)
        goto LABEL_14;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_14:
    JUMPOUT(0x18D789BDCLL);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
