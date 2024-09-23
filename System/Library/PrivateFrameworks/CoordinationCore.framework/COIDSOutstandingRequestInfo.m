@implementation COIDSOutstandingRequestInfo

- (COIDSOutstandingRequestInfo)initWithRequest:(id)a3 at:(unint64_t)a4 callback:(id)a5 activity:(id)a6
{
  id v11;
  id v12;
  id v13;
  COIDSOutstandingRequestInfo *v14;
  COIDSOutstandingRequestInfo *v15;
  uint64_t v16;
  id callback;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)COIDSOutstandingRequestInfo;
  v14 = -[COIDSOutstandingRequestInfo init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_enqeueStart = a4;
    v16 = MEMORY[0x2199F3D40](v12);
    callback = v15->_callback;
    v15->_callback = (id)v16;

    objc_storeStrong((id *)&v15->_activity, a6);
  }

  return v15;
}

- (unint64_t)enqeueStart
{
  return self->_enqeueStart;
}

- (void)setEnqeueStart:(unint64_t)a3
{
  self->_enqeueStart = a3;
}

- (COMeshRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
