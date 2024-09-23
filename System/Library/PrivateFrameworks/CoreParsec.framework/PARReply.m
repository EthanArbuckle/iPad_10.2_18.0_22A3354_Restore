@implementation PARReply

- (PARReply)initWithCoder:(id)a3
{
  id v4;
  PARReply *v5;
  uint64_t v6;
  NSURLRequest *httpRequest;
  uint64_t v8;
  NSURLResponse *httpResponse;
  uint64_t v10;
  NSData *data;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PARReply;
  v5 = -[PARReply init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_httpRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    httpRequest = v5->_httpRequest;
    v5->_httpRequest = (NSURLRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_httpResponse"));
    v8 = objc_claimAutoreleasedReturnValue();
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSURLResponse *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_scale"));
    v5->_scale = v12;
    v5->_replyType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_replyType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURLRequest *httpRequest;
  id v5;

  httpRequest = self->_httpRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", httpRequest, CFSTR("_httpRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_httpResponse, CFSTR("_httpResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("_data"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_scale"), self->_scale);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_replyType, CFSTR("_replyType"));

}

- (void)setRawResponse:(id)a3
{
  objc_storeStrong((id *)&self->_rawResponse, a3);
}

- (NSArray)rawResponse
{
  NSArray *rawResponse;
  NSData *data;
  void *v5;

  rawResponse = self->_rawResponse;
  if (rawResponse)
    return rawResponse;
  data = self->_data;
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", data, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (int)replyType
{
  return self->_replyType;
}

- (void)setReplyType:(int)a3
{
  self->_replyType = a3;
}

- (NSURLRequest)httpRequest
{
  return self->_httpRequest;
}

- (void)setHttpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_httpRequest, a3);
}

- (NSURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponse, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (PARTask)task
{
  return (PARTask *)objc_loadWeakRetained((id *)&self->_task);
}

- (void)setTask:(id)a3
{
  objc_storeWeak((id *)&self->_task, a3);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpRequest, 0);
  objc_storeStrong((id *)&self->_rawResponse, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
