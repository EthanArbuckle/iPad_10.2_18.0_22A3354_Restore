@implementation AMSHTTPArchiveTaskInfo

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSHTTPArchiveTaskInfo metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyMetrics"));

  -[AMSHTTPArchiveTaskInfo HTTPBody](self, "HTTPBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyHTTPBody"));

  -[AMSHTTPArchiveTaskInfo responseData](self, "responseData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCodingKeyResponseData"));

}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSData)HTTPBody
{
  return self->_HTTPBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_HTTPBody, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

- (AMSHTTPArchiveTaskInfo)initWithCoder:(id)a3
{
  id v4;
  AMSHTTPArchiveTaskInfo *v5;
  uint64_t v6;
  NSURLSessionTaskMetrics *metrics;
  uint64_t v8;
  NSData *HTTPBody;
  uint64_t v10;
  NSData *responseData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSHTTPArchiveTaskInfo;
  v5 = -[AMSHTTPArchiveTaskInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyMetrics"));
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSURLSessionTaskMetrics *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyHTTPBody"));
    v8 = objc_claimAutoreleasedReturnValue();
    HTTPBody = v5->_HTTPBody;
    v5->_HTTPBody = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyResponseData"));
    v10 = objc_claimAutoreleasedReturnValue();
    responseData = v5->_responseData;
    v5->_responseData = (NSData *)v10;

  }
  return v5;
}

- (AMSHTTPArchiveTaskInfo)initWithURLTaskInfo:(id)a3
{
  id v4;
  AMSHTTPArchiveTaskInfo *v5;
  uint64_t v6;
  NSURLSessionTaskMetrics *metrics;
  void *v8;
  void *v9;
  uint64_t v10;
  NSData *HTTPBody;
  uint64_t v12;
  NSData *responseData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSHTTPArchiveTaskInfo;
  v5 = -[AMSHTTPArchiveTaskInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "metrics");
    v6 = objc_claimAutoreleasedReturnValue();
    metrics = v5->_metrics;
    v5->_metrics = (NSURLSessionTaskMetrics *)v6;

    objc_msgSend(v4, "task");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "HTTPBody");
    v10 = objc_claimAutoreleasedReturnValue();
    HTTPBody = v5->_HTTPBody;
    v5->_HTTPBody = (NSData *)v10;

    objc_msgSend(v4, "data");
    v12 = objc_claimAutoreleasedReturnValue();
    responseData = v5->_responseData;
    v5->_responseData = (NSData *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
