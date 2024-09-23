@implementation APActivationPayload

- (APActivationPayload)initWithURL:(id)a3
{
  id v4;
  APActivationPayload *v5;
  uint64_t v6;
  NSURL *URL;
  APActivationPayload *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APActivationPayload;
  v5 = -[APActivationPayload init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)confirmAcquiredInRegion:(CLRegion *)region completionHandler:(void *)completionHandler
{
  id v6;
  void *v7;
  NSURL *URL;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = completionHandler;
  v7 = (void *)MEMORY[0x24BE16E98];
  URL = self->_URL;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__APActivationPayload_confirmAcquiredInRegion_completionHandler___block_invoke;
  v10[3] = &unk_24F258880;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "confirmLocationWithURL:inRegion:completion:", URL, region, v10);

}

void __65__APActivationPayload_confirmAcquiredInRegion_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v12 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "code") == 15)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = 1;
    }
    else
    {
      v11 = objc_msgSend(v12, "code");
      v8 = (void *)MEMORY[0x24BDD1540];
      if (v11 == 10)
        v9 = 2;
      else
        v9 = -1;
    }
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("APActivationPayloadErrorDomain"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_URL, CFSTR("URL"));
}

- (APActivationPayload)initWithCoder:(id)a3
{
  id v4;
  APActivationPayload *v5;
  uint64_t v6;
  NSURL *URL;
  APActivationPayload *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APActivationPayload;
  v5 = -[APActivationPayload init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSURL copy](self->_URL, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
