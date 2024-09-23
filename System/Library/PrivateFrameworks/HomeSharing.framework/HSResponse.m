@implementation HSResponse

- (HSResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HSResponse *v16;
  HSResponse *v17;
  uint64_t v18;
  NSString *MIMEType;
  uint64_t v20;
  NSData *responseData;
  uint64_t v22;
  NSDictionary *responseHeaderFields;
  objc_super v25;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HSResponse;
  v16 = -[HSResponse init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_error, a7);
    v18 = objc_msgSend(v14, "copy");
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v18;

    v17->_responseCode = a3;
    v20 = objc_msgSend(v13, "copy");
    responseData = v17->_responseData;
    v17->_responseData = (NSData *)v20;

    v22 = objc_msgSend(v12, "copy");
    responseHeaderFields = v17->_responseHeaderFields;
    v17->_responseHeaderFields = (NSDictionary *)v22;

  }
  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSResponse;
  -[HSResponse description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%ld]: %ld bytes (%@)\n%@"), self->_responseCode, -[NSData length](self->_responseData, "length"), self->_MIMEType, self->_responseHeaderFields);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (unint64_t)responseCode
{
  return self->_responseCode;
}

- (NSDictionary)responseHeaderFields
{
  return self->_responseHeaderFields;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSURL)responseDataFileURL
{
  return self->_responseDataFileURL;
}

- (void)setResponseDataFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseDataFileURL, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_responseHeaderFields, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
}

+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:headerFields:data:MIMEType:error:", a3, v14, v13, v12, v11);

  return v15;
}

+ (id)responseWithResponse:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "responseCode");
  objc_msgSend(v3, "responseHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v4, "initWithCode:headerFields:data:MIMEType:error:", v5, v6, v7, v8, v9);
  return v10;
}

@end
