@implementation CSFGMOptIn

- (CSFGMOptIn)init
{
  CSFGMOptIn *v2;
  void *v3;
  CSFGMOptIn *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSFGMOptIn;
  v2 = -[CSFGMOptIn init](&v6, sel_init);
  if (!v2
    || (+[GMOptIn current](_TtC25CloudSubscriptionFeatures7GMOptIn, "current"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CSFGMOptIn setGmOptIn:](v2, "setGmOptIn:", v3),
        v3,
        -[CSFGMOptIn gmOptIn](v2, "gmOptIn"),
        v4 = (CSFGMOptIn *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v4 = v2;
  }

  return v4;
}

- (BOOL)isOptedIn
{
  void *v2;
  char v3;

  -[CSFGMOptIn gmOptIn](self, "gmOptIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOptedIn");

  return v3;
}

- (void)setIsOptedIn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CSFGMOptIn gmOptIn](self, "gmOptIn");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsOptedIn:", v3);

}

- (_TtC25CloudSubscriptionFeatures7GMOptIn)gmOptIn
{
  return self->_gmOptIn;
}

- (void)setGmOptIn:(id)a3
{
  objc_storeStrong((id *)&self->_gmOptIn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmOptIn, 0);
}

@end
