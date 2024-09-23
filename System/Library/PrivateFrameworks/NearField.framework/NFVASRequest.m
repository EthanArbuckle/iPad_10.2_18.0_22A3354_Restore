@implementation NFVASRequest

+ (BOOL)validateDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      v4 = v3;
      goto LABEL_17;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TerminalCap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TerminalProtocol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MerchantId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SignupUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_16:
      v6 = 0;
      v4 = v5;
      goto LABEL_17;
    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Filter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_14:
      v6 = 0;
      goto LABEL_17;
    }
  }
  v6 = 1;
LABEL_17:

  return v6;
}

- (NFVASRequest)initWithDictionary:(id)a3
{
  id v4;
  NFVASRequest *v5;
  uint64_t v6;
  NSNumber *terminalCap;
  uint64_t v8;
  NSNumber *terminalProtocol;
  uint64_t v10;
  NSString *merchantId;
  uint64_t v12;
  NSURL *signupUrl;
  uint64_t v14;
  NSData *filter;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NFVASRequest;
  v5 = -[NFVASRequest init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalCap"));
    v6 = objc_claimAutoreleasedReturnValue();
    terminalCap = v5->_terminalCap;
    v5->_terminalCap = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TerminalProtocol"));
    v8 = objc_claimAutoreleasedReturnValue();
    terminalProtocol = v5->_terminalProtocol;
    v5->_terminalProtocol = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MerchantId"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignupUrl"));
    v12 = objc_claimAutoreleasedReturnValue();
    signupUrl = v5->_signupUrl;
    v5->_signupUrl = (NSURL *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Filter"));
    v14 = objc_claimAutoreleasedReturnValue();
    filter = v5->_filter;
    v5->_filter = (NSData *)v14;

  }
  return v5;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  NSNumber *terminalCap;
  NSNumber *terminalProtocol;
  NSString *merchantId;
  NSURL *signupUrl;
  NSData *filter;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  terminalCap = self->_terminalCap;
  if (terminalCap)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", terminalCap, CFSTR("TerminalCap"));
  terminalProtocol = self->_terminalProtocol;
  if (terminalProtocol)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", terminalProtocol, CFSTR("TerminalProtocol"));
  merchantId = self->_merchantId;
  if (merchantId)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", merchantId, CFSTR("MerchantId"));
  signupUrl = self->_signupUrl;
  if (signupUrl)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", signupUrl, CFSTR("SignupUrl"));
  filter = self->_filter;
  if (filter)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", filter, CFSTR("Filter"));
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)NFVASRequest;
  -[NFVASRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ protocol=0x%04x capability=0x%04x merchantId=%@ url=%@ filter=%@"), v4, -[NSNumber unsignedIntValue](self->_terminalProtocol, "unsignedIntValue"), -[NSNumber unsignedIntValue](self->_terminalCap, "unsignedIntValue"), self->_merchantId, self->_signupUrl, self->_filter);

  return v5;
}

- (NSNumber)terminalCap
{
  return self->_terminalCap;
}

- (void)setTerminalCap:(id)a3
{
  objc_storeStrong((id *)&self->_terminalCap, a3);
}

- (NSNumber)terminalProtocol
{
  return self->_terminalProtocol;
}

- (void)setTerminalProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_terminalProtocol, a3);
}

- (NSString)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (NSURL)signupUrl
{
  return self->_signupUrl;
}

- (void)setSignupUrl:(id)a3
{
  objc_storeStrong((id *)&self->_signupUrl, a3);
}

- (NSData)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_signupUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_terminalProtocol, 0);
  objc_storeStrong((id *)&self->_terminalCap, 0);
}

@end
