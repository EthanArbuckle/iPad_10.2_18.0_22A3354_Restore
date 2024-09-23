@implementation AASecondaryAuthenticationResponse

- (AASecondaryAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  AASecondaryAuthenticationResponse *v8;
  void *v9;
  uint64_t v10;
  NSString *secondFactorToken;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AASecondaryAuthenticationResponse;
  v8 = -[AAResponse initWithHTTPResponse:data:](&v13, sel_initWithHTTPResponse_data_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "allHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("X-Apple-2SV-Authenticate"));
    v10 = objc_claimAutoreleasedReturnValue();
    secondFactorToken = v8->_secondFactorToken;
    v8->_secondFactorToken = (NSString *)v10;

    objc_storeStrong((id *)&v8->_buddyML, a4);
  }

  return v8;
}

- (NSString)secondFactorToken
{
  return self->_secondFactorToken;
}

- (NSData)buddyML
{
  return self->_buddyML;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyML, 0);
  objc_storeStrong((id *)&self->_secondFactorToken, 0);
}

@end
