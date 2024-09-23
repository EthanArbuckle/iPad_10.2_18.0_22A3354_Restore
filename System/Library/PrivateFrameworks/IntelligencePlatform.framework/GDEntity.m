@implementation GDEntity

- (GDEntity)initWithEntityIdentifier:(id)a3 facts:(id)a4 entityClass:(unint64_t)a5
{
  id v9;
  id v10;
  GDEntity *v11;
  GDEntity *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GDEntity;
  v11 = -[GDEntity init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entityIdentifier, a3);
    objc_storeStrong((id *)&v12->_facts, a4);
    v12->_entityClass = a5;
  }

  return v12;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)facts
{
  return self->_facts;
}

- (unint64_t)entityClass
{
  return self->_entityClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facts, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
