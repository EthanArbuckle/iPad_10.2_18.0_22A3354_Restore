@implementation GDFactObjectEntityReference

- (GDFactObjectEntityReference)initWithEntityIdentifier:(id)a3
{
  id v5;
  GDFactObjectEntityReference *v6;
  GDFactObjectEntityReference *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectEntityReference;
  v6 = -[GDFactObjectEntityReference init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entityIdentifier, a3);

  return v7;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
