@implementation BCNetworkProvider

- (BCNetworkProvider)init
{
  BCNetworkProvider *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSURLSession *session;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCNetworkProvider;
  v2 = -[BCNetworkProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionWithConfiguration:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (NSURLSession *)v5;

  }
  return v2;
}

- (void)performDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v4;

  if (self)
    self = (BCNetworkProvider *)self->_session;
  -[BCNetworkProvider dataTaskWithRequest:completionHandler:](self, "dataTaskWithRequest:completionHandler:", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
