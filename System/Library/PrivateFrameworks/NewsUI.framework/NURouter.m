@implementation NURouter

- (NURouter)initWithURLHandler:(id)a3
{
  id v5;
  NURouter *v6;
  NURouter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NURouter;
  v6 = -[NURouter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_urlHandler, a3);

  return v7;
}

- (void)routeToNewsAppForYouFeed
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("applenews:///foryou"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NURouter urlHandler](self, "urlHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completion:", v4, 0, 0);

}

- (NUURLHandling)urlHandler
{
  return self->_urlHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHandler, 0);
}

@end
