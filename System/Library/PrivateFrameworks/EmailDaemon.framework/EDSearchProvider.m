@implementation EDSearchProvider

- (EDSearchProvider)initWithLocalSearchProvider:(id)a3 remoteSearchProvider:(id)a4
{
  id v7;
  id v8;
  EDSearchProvider *v9;
  EDSearchProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDSearchProvider;
  v9 = -[EDSearchProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localSearchProvider, a3);
    objc_storeStrong((id *)&v10->_remoteSearchProvider, a4);
  }

  return v10;
}

- (EDRemoteSearchProvider)remoteSearchProvider
{
  return (EDRemoteSearchProvider *)objc_getProperty(self, a2, 8, 1);
}

- (EDLocalSearchProvider)localSearchProvider
{
  return (EDLocalSearchProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchProvider, 0);
  objc_storeStrong((id *)&self->_remoteSearchProvider, 0);
}

@end
