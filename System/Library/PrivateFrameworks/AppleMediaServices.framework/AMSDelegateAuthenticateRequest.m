@implementation AMSDelegateAuthenticateRequest

- (AMSDelegateAuthenticateRequest)initWithChallenge:(id)a3 userAgent:(id)a4
{
  id v6;
  id v7;
  AMSDelegateAuthenticateRequest *v8;
  uint64_t v9;
  NSString *challenge;
  uint64_t v11;
  NSString *userAgent;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSDelegateAuthenticateRequest;
  v8 = -[AMSDelegateAuthenticateRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    challenge = v8->_challenge;
    v8->_challenge = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    userAgent = v8->_userAgent;
    v8->_userAgent = (NSString *)v11;

  }
  return v8;
}

+ (id)preferredUserAgent
{
  void *v2;
  void *v3;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *challenge;
  id v5;

  challenge = self->_challenge;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", challenge, CFSTR("ch"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userAgent, CFSTR("ua"));

}

- (AMSDelegateAuthenticateRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AMSDelegateAuthenticateRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ua"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AMSDelegateAuthenticateRequest initWithChallenge:userAgent:](self, "initWithChallenge:userAgent:", v5, v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
