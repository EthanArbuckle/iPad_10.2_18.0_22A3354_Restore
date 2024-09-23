@implementation AMSUIWebJSResponse

- (AMSUIWebJSResponse)initWithRequest:(id)a3 duration:(double)a4
{
  id v7;
  AMSUIWebJSResponse *v8;
  AMSUIWebJSResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebJSResponse;
  v8 = -[AMSUIWebJSResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_duration = a4;
    objc_storeStrong((id *)&v8->_originalRequest, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSUIWebJSResponse originalRequest](self, "originalRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("kCodingKeyRequest"));

  -[AMSUIWebJSResponse body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("kCodingKeyBody"));

  -[AMSUIWebJSResponse duration](self, "duration");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("kCodingKeyDuration"));

}

- (AMSUIWebJSResponse)initWithCoder:(id)a3
{
  id v4;
  AMSUIWebJSResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSDictionary *body;
  uint64_t v12;
  AMSUIWebJSRequest *originalRequest;
  objc_super v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebJSResponse;
  v5 = -[AMSUIWebJSResponse init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCodingKeyDuration"));
    v5->_duration = v9;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCodingKeyBody"));
    v10 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyRequest"));
    v12 = objc_claimAutoreleasedReturnValue();
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSUIWebJSRequest *)v12;

  }
  return v5;
}

- (NSDictionary)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (double)duration
{
  return self->_duration;
}

- (AMSUIWebJSRequest)originalRequest
{
  return self->_originalRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
