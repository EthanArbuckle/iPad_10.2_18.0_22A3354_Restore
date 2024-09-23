@implementation MSSearchProxy

- (MSSearchProxy)initWithSearch:(id)a3
{
  id v4;
  MSSearchProxy *v5;
  MSSearchProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSSearchProxy;
  v5 = -[MSSearchProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_search, v4);

  return v6;
}

- (void)foundResults:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MSSearchProxy search](self, "search");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "foundResults:error:", v8, v6);

}

- (MSSearch)search
{
  return (MSSearch *)objc_loadWeakRetained((id *)&self->_search);
}

- (void)setSearch:(id)a3
{
  objc_storeWeak((id *)&self->_search, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_search);
}

@end
