@implementation AAPaymentSummaryResponse

- (AAPaymentSummaryResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  AAPaymentSummaryResponse *v7;
  AAPaymentSummaryResponse *v8;
  uint64_t v9;
  id v10;
  NSDictionary *responseParameters;
  NSObject *v12;
  void *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AAPaymentSummaryResponse;
  v7 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v16, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, v6, 0);
  v8 = v7;
  if (v6 && v7 && objc_msgSend(v6, "length"))
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v15);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v15;
    responseParameters = v8->_responseParameters;
    v8->_responseParameters = (NSDictionary *)v9;

    if (v10)
    {
      _AALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Error: Could not parse server response data: %@. Details: %@", buf, 0x16u);

      }
    }

  }
  return v8;
}

- (unint64_t)numberOfCards
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKey:](self->_responseParameters, "objectForKey:", CFSTR("numberOfCards"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSString)description
{
  return (NSString *)-[NSDictionary objectForKey:](self->_responseParameters, "objectForKey:", CFSTR("description"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseParameters, 0);
}

@end
