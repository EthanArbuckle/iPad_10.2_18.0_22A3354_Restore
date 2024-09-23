@implementation GDFactObjectRelationship

- (GDFactObjectRelationship)initWithSubentity:(id)a3
{
  id v5;
  GDFactObjectRelationship *v6;
  GDFactObjectRelationship *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectRelationship;
  v6 = -[GDFactObjectRelationship init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subentity, a3);

  return v7;
}

- (GDSubentity)subentity
{
  return self->_subentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subentity, 0);
}

@end
