@implementation DDSTRIClient

- (DDSTRIClient)initWithClient:(id)a3
{
  id v5;
  DDSTRIClient *v6;
  DDSTRIClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDSTRIClient;
  v6 = -[DDSTRIClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_client, a3);

  return v7;
}

- (id)experimentIdentifiersWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DDSTRIClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentIdentifiersWithNamespaceName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[DDSTRIClient client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "levelForFactor:withNamespaceName:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DDSTRIClient client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addUpdateHandlerForNamespaceName:queue:usingBlock:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDSTRIClient client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeUpdateHandlerForToken:", v4);

}

- (void)refresh
{
  id v2;

  -[DDSTRIClient client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

- (TRIClient)client
{
  return (TRIClient *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
