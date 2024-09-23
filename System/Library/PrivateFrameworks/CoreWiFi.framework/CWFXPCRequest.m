@implementation CWFXPCRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_receivedAt, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)isFinished
{
  unsigned int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CWFXPCRequest;
  v3 = -[CWFXPCRequest isFinished](&v9, sel_isFinished);
  if (v3)
    LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7);
  return v3;
}

- (BOOL)didSendResponse
{
  return self->_didSendResponse;
}

- (BOOL)isExecuting
{
  unsigned int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFXPCRequest;
  if (-[CWFXPCRequest isExecuting](&v10, sel_isExecuting))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CWFXPCRequest;
    v3 = -[CWFXPCRequest isFinished](&v9, sel_isFinished);
    if (v3)
      LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7) ^ 1;
  }
  return v3;
}

- (id)response
{
  return self->_response;
}

- (void)setDidSendResponse:(BOOL)a3
{
  self->_didSendResponse = a3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setRequestParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setReceivedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setIsSubrequest:(BOOL)a3
{
  self->_isSubrequest = a3;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (CWFXPCRequest)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFXPCRequest *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFXPCRequest;
  v6 = -[NSBlockOperation init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (void)setResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id response;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B0630540;
  v8[3] = &unk_1E6133A30;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1B5E0A4F8](v8);
  response = self->_response;
  self->_response = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0CB3940];
  sub_1B063544C(self->_type, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->_requestParameters, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("[%@] %@"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSDate)receivedAt
{
  return self->_receivedAt;
}

- (BOOL)isSubrequest
{
  return self->_isSubrequest;
}

@end
