@implementation HMDXPCRequest

- (id)responseHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (HMDXPCRequest)initWithName:(id)a3 qualityOfService:(int64_t)a4 timeoutDate:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDXPCRequest *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSDate *timeoutDate;
  uint64_t v19;
  id responseHandler;
  HMDXPCRequest *v22;
  SEL v23;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v22 = (HMDXPCRequest *)_HMFPreconditionFailure();
    return (HMDXPCRequest *)-[HMDXPCRequest name](v22, v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDXPCRequest;
  v14 = -[HMDXPCRequest init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v14->_qualityOfService = a4;
    v17 = objc_msgSend(v11, "copy");
    timeoutDate = v14->_timeoutDate;
    v14->_timeoutDate = (NSDate *)v17;

    v19 = objc_msgSend(v13, "copy");
    responseHandler = v14->_responseHandler;
    v14->_responseHandler = (id)v19;

  }
  return v14;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSDate)timeoutDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
