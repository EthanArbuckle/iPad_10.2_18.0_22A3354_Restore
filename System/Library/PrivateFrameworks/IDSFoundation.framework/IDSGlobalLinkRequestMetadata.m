@implementation IDSGlobalLinkRequestMetadata

- (IDSGlobalLinkRequestMetadata)initWithStartTime:(double)a3 token:(id)a4 metricsRequest:(id)a5
{
  id v9;
  id v10;
  IDSGlobalLinkRequestMetadata *v11;
  IDSGlobalLinkRequestMetadata *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IDSGlobalLinkRequestMetadata;
  v11 = -[IDSGlobalLinkRequestMetadata init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_startTime = a3;
    objc_storeStrong((id *)&v11->_token, a4);
    objc_storeStrong((id *)&v12->_metricsRequest, a5);
  }

  return v12;
}

- (double)startTime
{
  return self->_startTime;
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (IDSGFTMetricsRequest)metricsRequest
{
  return (IDSGFTMetricsRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsRequest, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
