@implementation CKMediaRequestDetails

- (CKMediaRequestDetails)initWithRequestID:(int64_t)a3 transferGUID:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  CKMediaRequestDetails *v11;
  CKMediaRequestDetails *v12;
  void *v13;
  id resultHandler;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKMediaRequestDetails;
  v11 = -[CKMediaRequestDetails init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_requestID = a3;
    v13 = _Block_copy(v10);
    resultHandler = v12->_resultHandler;
    v12->_resultHandler = v13;

    objc_storeStrong((id *)&v12->_transferGUID, a4);
  }

  return v12;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
