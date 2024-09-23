@implementation AAAvailabilityResponse

- (AAAvailabilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAAvailabilityResponse *v4;
  AAAvailabilityResponse *v5;
  void *v6;
  uint64_t v7;
  NSString *status;
  void *v9;
  uint64_t v10;
  NSString *eta;
  void *v12;
  uint64_t v13;
  NSString *feature;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AAAvailabilityResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v16, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
    v7 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v7;

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("eta"));
    v10 = objc_claimAutoreleasedReturnValue();
    eta = v5->_eta;
    v5->_eta = (NSString *)v10;

    -[AAResponse responseDictionary](v5, "responseDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("feature"));
    v13 = objc_claimAutoreleasedReturnValue();
    feature = v5->_feature;
    v5->_feature = (NSString *)v13;

  }
  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)eta
{
  return self->_eta;
}

- (NSString)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_eta, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
