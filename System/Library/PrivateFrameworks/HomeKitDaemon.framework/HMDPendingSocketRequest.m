@implementation HMDPendingSocketRequest

- (HMDPendingSocketRequest)initWithApplicationProtocolName:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  HMDPendingSocketRequest *v9;
  HMDPendingSocketRequest *v10;
  void *v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDPendingSocketRequest;
  v9 = -[HMDPendingSocketRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationProtocolName, a3);
    v11 = _Block_copy(v8);
    completion = v10->_completion;
    v10->_completion = v11;

  }
  return v10;
}

- (NSString)applicationProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_applicationProtocolName, 0);
}

@end
