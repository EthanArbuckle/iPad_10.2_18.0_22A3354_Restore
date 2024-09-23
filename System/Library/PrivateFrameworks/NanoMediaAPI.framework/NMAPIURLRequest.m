@implementation NMAPIURLRequest

- (NMAPIURLRequest)initWithURL:(id)a3
{
  id v4;
  NMAPIURLRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NMAPIURLRequest;
  v5 = -[MPStoreModelRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("URL : %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMAPIURLRequest setLabel:](v5, "setLabel:", v6);

    -[NMAPIURLRequest setURL:](v5, "setURL:", v4);
  }

  return v5;
}

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  NSURL *URL;
  void *v5;
  NSObject *v7;
  id v8;

  URL = self->_URL;
  if (URL)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", URL, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NMLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NMAPIURLRequest urlComponentsWithStoreURLBag:error:].cold.1(v7);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC8580], -7101, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      *a4 = v8;
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NMAPIURLRequest;
  v4 = -[NMAPIRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 16, self->_URL);
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)urlComponentsWithStoreURLBag:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A803000, log, OS_LOG_TYPE_ERROR, "[NMAPIRequest] Missing URL parameter.", v1, 2u);
}

@end
