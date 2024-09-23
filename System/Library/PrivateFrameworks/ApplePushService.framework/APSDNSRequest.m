@implementation APSDNSRequest

- (APSDNSRequest)initWithHostname:(id)a3 timeoutInSeconds:(double)a4 requestFlags:(int64_t)a5 responseBlock:(id)a6
{
  id v10;
  id v11;
  APSDNSRequest *v12;
  uint64_t v13;
  NSString *hostname;
  uint64_t v15;
  id responseBlock;
  NSDate *requestStartTime;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)APSDNSRequest;
  v12 = -[APSDNSRequest init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    hostname = v12->_hostname;
    v12->_hostname = (NSString *)v13;

    v12->_timeout = a4;
    v15 = objc_msgSend(v11, "copy");
    responseBlock = v12->_responseBlock;
    v12->_responseBlock = (id)v15;

    requestStartTime = v12->_requestStartTime;
    v12->_flags = a5;
    v12->_requestStartTime = 0;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APSDNSRequest)initWithCoder:(id)a3
{
  id v4;
  APSDNSRequest *v5;
  uint64_t v6;
  NSString *hostname;
  uint64_t v8;
  NSString *environment;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APSDNSRequest;
  v5 = -[APSDNSRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSDNSHostname"));
    v6 = objc_claimAutoreleasedReturnValue();
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APSDNSEnvironment"));
    v8 = objc_claimAutoreleasedReturnValue();
    environment = v5->_environment;
    v5->_environment = (NSString *)v8;

    v5->_flags = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("APSDNSRequestFlags"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *hostname;
  id v5;

  hostname = self->_hostname;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", hostname, CFSTR("APSDNSHostname"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("APSDNSEnvironment"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_flags, CFSTR("APSDNSRequestFlags"));

}

- (NSString)hostname
{
  return self->_hostname;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)responseBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_requestStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStartTime, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end
