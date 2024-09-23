@implementation PHASERouteChangeInfoImpl

- (PHASERouteChangeInfoImpl)initWithDescription:(id)a3
{
  id v5;
  PHASERouteChangeInfoImpl *v6;
  PHASERouteChangeInfoImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASERouteChangeInfoImpl;
  v6 = -[PHASERouteChangeInfoImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_description, a3);

  return v7;
}

- (NSDictionary)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
