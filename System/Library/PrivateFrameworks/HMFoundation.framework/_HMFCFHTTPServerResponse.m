@implementation _HMFCFHTTPServerResponse

- (_HMFCFHTTPServerResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4
{
  id v7;
  HMFActivity *v8;
  void *v9;
  HMFActivity *v10;
  _HMFCFHTTPServerResponse *v11;
  _HMFCFHTTPServerResponse *v12;
  uint64_t ResponseMessage;
  const void *v14;
  _HMFCFHTTPMessage *v15;
  _HMFCFHTTPMessage *response;
  _HMFCFHTTPServerResponse *v17;
  void *v18;
  _HMFCFHTTPServerResponse *v19;
  NSObject *v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = [HMFActivity alloc];
  objc_msgSend(v7, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMFActivity initWithName:parent:options:](v8, "initWithName:parent:options:", CFSTR("HTTPResponse"), v9, 1);

  v23.receiver = self;
  v23.super_class = (Class)_HMFCFHTTPServerResponse;
  v11 = -[HMFHTTPResponseInternal initWithStatusCode:headerFields:body:activity:](&v23, sel_initWithStatusCode_headerFields_body_activity_, a4, MEMORY[0x1E0C9AA70], 0, v10);
  v12 = v11;
  if (!v11)
    goto LABEL_4;
  objc_storeStrong((id *)&v11->_request, a3);
  objc_msgSend(v7, "requestRef");
  ResponseMessage = _CFHTTPServerRequestCreateResponseMessage();
  if (ResponseMessage)
  {
    v14 = (const void *)ResponseMessage;
    v15 = -[_HMFCFHTTPMessage initWithMessageRef:]([_HMFCFHTTPMessage alloc], "initWithMessageRef:", ResponseMessage);
    response = v12->_response;
    v12->_response = v15;

    CFRelease(v14);
LABEL_4:
    v17 = v12;
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x1A1AC355C]();
  v19 = v12;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v21;
    _os_log_impl(&dword_19B546000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  v17 = 0;
LABEL_8:

  return v17;
}

- (void)dealloc
{
  _CFHTTPServerResponse *responseRef;
  objc_super v4;

  responseRef = self->_responseRef;
  if (responseRef)
    CFRelease(responseRef);
  v4.receiver = self;
  v4.super_class = (Class)_HMFCFHTTPServerResponse;
  -[_HMFCFHTTPServerResponse dealloc](&v4, sel_dealloc);
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  void *v6;
  HMFAttributeDescription *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[_HMFCFHTTPServerResponse request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Request"), v6);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HMFCFHTTPServerResponse;
  v4 = -[HMFHTTPResponseInternal copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v4)
  {
    -[_HMFCFHTTPServerResponse request](self, "request");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[6];
    v4[6] = v5;

    -[_HMFCFHTTPServerResponse response](self, "response");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[8];
    v4[8] = v7;

  }
  return v4;
}

- (id)headerFields
{
  void *v2;
  void *v3;

  -[_HMFCFHTTPServerResponse response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_HMFCFHTTPServerResponse response](self, "response");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHeaderField:", v7, v6);

}

- (id)body
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_HMFCFHTTPServerResponse response](self, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_HMFCFHTTPServerResponse response](self, "response");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "body");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setBody:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_HMFCFHTTPServerResponse response](self, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_HMFCFHTTPServerResponse response](self, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v6);

  }
}

- (_CFHTTPServerResponse)responseRef
{
  _CFHTTPServerResponse *result;
  void *v4;
  void *v5;
  void *v6;

  result = self->_responseRef;
  if (!result)
  {
    -[_HMFCFHTTPServerResponse request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestRef");
    -[_HMFCFHTTPServerResponse response](self, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "message");
    -[_HMFCFHTTPServerResponse response](self, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "body");
    self->_responseRef = (_CFHTTPServerResponse *)_CFHTTPServerResponseCreateWithData();

    -[_HMFCFHTTPServerResponse responseRef](self, "responseRef");
    _CFHTTPServerResponseSetClient();
    return self->_responseRef;
  }
  return result;
}

- (_HMFCFHTTPServerRequest)request
{
  return self->_request;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_HMFCFHTTPMessage)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
