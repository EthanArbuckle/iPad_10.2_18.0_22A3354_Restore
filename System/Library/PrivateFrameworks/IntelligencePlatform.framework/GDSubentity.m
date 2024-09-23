@implementation GDSubentity

- (GDSubentity)initWithParentEntityIdentifier:(id)a3 relationshipIdentifier:(id)a4 facts:(id)a5 entityClass:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  GDSubentity *v14;
  GDSubentity *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GDSubentity;
  v14 = -[GDSubentity init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_parentEntityIdentifier, a3);
    objc_storeStrong((id *)&v15->_relationshipIdentifier, a4);
    objc_storeStrong((id *)&v15->_facts, a5);
    v15->_entityClass = a6;
  }

  return v15;
}

- (GDEntityIdentifier)parentEntityIdentifier
{
  return self->_parentEntityIdentifier;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
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
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
  objc_storeStrong((id *)&self->_parentEntityIdentifier, 0);
}

@end
