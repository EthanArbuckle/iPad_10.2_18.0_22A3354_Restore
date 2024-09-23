@implementation CATParams

- (CATParams)initWithParams:(id)a3
{
  id v5;
  CATParams *v6;
  CATParams *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATParams;
  v6 = -[CATParams init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->params, a3);

  return v7;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self->params && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[NSDictionary objectForKey:](self->params, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->params, 0);
}

@end
