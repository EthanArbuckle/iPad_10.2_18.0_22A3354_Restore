@implementation HMDAccessCodeWriteRequestModificationRequestPair

- (HMDAccessCodeWriteRequestModificationRequestPair)initWithWriteRequest:(id)a3 modificationRequests:(id)a4
{
  id v7;
  id v8;
  HMDAccessCodeWriteRequestModificationRequestPair *v9;
  HMDAccessCodeWriteRequestModificationRequestPair *v10;
  uint64_t v11;
  NSArray *modificationRequests;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessCodeWriteRequestModificationRequestPair;
  v9 = -[HMDAccessCodeWriteRequestModificationRequestPair init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_writeRequest, a3);
    v11 = objc_msgSend(v8, "copy");
    modificationRequests = v10->_modificationRequests;
    v10->_modificationRequests = (NSArray *)v11;

  }
  return v10;
}

- (HMDCharacteristicWriteRequest)writeRequest
{
  return (HMDCharacteristicWriteRequest *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)modificationRequests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationRequests, 0);
  objc_storeStrong((id *)&self->_writeRequest, 0);
}

@end
