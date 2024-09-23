@implementation HMDEntityCodingDescription

id __51__HMDEntityCodingDescription_initWithModel_entity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id result;
  uint64_t v5;
  void *v6;

  result = (id)objc_msgSend(a3, "isConditional");
  if ((_DWORD)result)
  {
    objc_msgSend(a3, "shortDescription");
    objc_claimAutoreleasedReturnValue();
    v5 = _HMFPreconditionFailureWithFormat();
    return -[HMDManagedObjectCodingModel codingKeyForProperty:](v5, v6);
  }
  return result;
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (NSString)name
{
  return -[NSEntityDescription name](self->_entity, "name");
}

- (NSString)typeID
{
  return self->_typeID;
}

- (BOOL)hasConcreteSubentities
{
  return self->_concreteSubentitiesByTypeID != 0;
}

- (NSString)refContextCodingKey
{
  return self->_refContextCodingKey;
}

- (NSString)refContextKeyPath
{
  return self->_refContextKeyPath;
}

- (NSEntityDescription)refContextEntity
{
  return self->_refContextEntity;
}

- (NSDictionary)keyAttributesByCodingKey
{
  return self->_keyAttributesByCodingKey;
}

- (NSDictionary)attributesByCodingKey
{
  return self->_attributesByCodingKey;
}

- (NSDictionary)relationshipsByCodingKey
{
  return self->_relationshipsByCodingKey;
}

- (NSDictionary)concreteSubentitiesByTypeID
{
  return self->_concreteSubentitiesByTypeID;
}

- (id)descriptionForAttribute:(id)a3
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  NSEntityDescription *entity;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;

  objc_msgSend(a3, "entity");
  v5 = (NSEntityDescription *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  entity = self->_entity;
  if (v5 == entity || -[NSEntityDescription isKindOfEntity:](v5, "isKindOfEntity:", self->_entity))
  {

  }
  else
  {
    v18 = -[NSEntityDescription isKindOfEntity:](entity, "isKindOfEntity:", v6);

    if (!v18)
    {
      v17 = 0;
      return v17;
    }
  }
  objc_msgSend(a3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_attributeCodingKeysByPropertyName, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  -[NSDictionary objectForKeyedSubscript:](self->_attributesByCodingKey, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v8))
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)descriptionForRelationship:(id)a3
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  NSEntityDescription *entity;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;

  objc_msgSend(a3, "entity");
  v5 = (NSEntityDescription *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  entity = self->_entity;
  if (v5 == entity || -[NSEntityDescription isKindOfEntity:](v5, "isKindOfEntity:", self->_entity))
  {

  }
  else
  {
    v18 = -[NSEntityDescription isKindOfEntity:](entity, "isKindOfEntity:", v6);

    if (!v18)
    {
      v17 = 0;
      return v17;
    }
  }
  objc_msgSend(a3, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_relationshipCodingKeysByPropertyName, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  -[NSDictionary objectForKeyedSubscript:](self->_relationshipsByCodingKey, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v8))
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSArray)parentRelationships
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteSubentitiesByTypeID, 0);
  objc_storeStrong((id *)&self->_parentRelationships, 0);
  objc_storeStrong((id *)&self->_relationshipCodingKeysByPropertyName, 0);
  objc_storeStrong((id *)&self->_relationshipsByCodingKey, 0);
  objc_storeStrong((id *)&self->_attributeCodingKeysByPropertyName, 0);
  objc_storeStrong((id *)&self->_attributesByCodingKey, 0);
  objc_storeStrong((id *)&self->_keyAttributesByCodingKey, 0);
  objc_storeStrong((id *)&self->_refContextEntity, 0);
  objc_storeStrong((id *)&self->_refContextKeyPath, 0);
  objc_storeStrong((id *)&self->_refContextCodingKey, 0);
  objc_storeStrong((id *)&self->_typeID, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
