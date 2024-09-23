@implementation BMEntity

- (BMEntity)initWithTopicEntity:(id)a3
{
  return -[BMEntity initWithIsPersonType:isTopicType:topicEntity:personEntity:](self, "initWithIsPersonType:isTopicType:topicEntity:personEntity:", 0, 1, a3, 0);
}

- (BMEntity)initWithPersonEntity:(id)a3
{
  return -[BMEntity initWithIsPersonType:isTopicType:topicEntity:personEntity:](self, "initWithIsPersonType:isTopicType:topicEntity:personEntity:", 1, 0, 0, a3);
}

- (BMEntity)initWithIsPersonType:(BOOL)a3 isTopicType:(BOOL)a4 topicEntity:(id)a5 personEntity:(id)a6
{
  id v11;
  id v12;
  BMEntity *v13;
  BMEntity *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMEntity;
  v13 = -[BMEntity init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_isPersonType = a3;
    v13->_isTopicType = a4;
    objc_storeStrong((id *)&v13->_topicEntity, a5);
    objc_storeStrong((id *)&v14->_personEntity, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int isTopicType;
  int isPersonType;
  BMPersonEntity *personEntity;
  void *v9;
  BMTopicEntity *topicEntity;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    isTopicType = self->_isTopicType;
    if (isTopicType == objc_msgSend(v5, "isTopicType")
      && (isPersonType = self->_isPersonType, isPersonType == objc_msgSend(v5, "isPersonType")))
    {
      personEntity = self->_personEntity;
      objc_msgSend(v5, "personEntity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[BMEntityRelationshipEventUtilities checkNullablePersonEntityEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullablePersonEntityEqualityForSource:target:", personEntity, v9))
      {
        topicEntity = self->_topicEntity;
        objc_msgSend(v5, "topicEntity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[BMEntityRelationshipEventUtilities checkNullableTopicEntityEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableTopicEntityEqualityForSource:target:", topicEntity, v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMEntity proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMEntity)initWithProto:(id)a3
{
  id v4;
  id v5;
  BMPersonEntity *v6;
  void *v7;
  BMPersonEntity *v8;
  BMEntity *v9;
  BMTopicEntity *v10;
  void *v11;
  BMTopicEntity *v12;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    if (objc_msgSend(v5, "hasPersonEntity"))
    {
      v6 = [BMPersonEntity alloc];
      objc_msgSend(v5, "personEntity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BMPersonEntity initWithProto:](v6, "initWithProto:", v7);

    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v5, "hasTopicEntity"))
    {
      v10 = [BMTopicEntity alloc];
      objc_msgSend(v5, "topicEntity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[BMTopicEntity initWithProto:](v10, "initWithProto:", v11);

    }
    else
    {
      v12 = 0;
    }
    self = -[BMEntity initWithIsPersonType:isTopicType:topicEntity:personEntity:](self, "initWithIsPersonType:isTopicType:topicEntity:personEntity:", objc_msgSend(v5, "hasPersonEntity"), objc_msgSend(v5, "hasTopicEntity"), v12, v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMEntity)initWithProtoData:(id)a3
{
  id v4;
  BMPBEntity *v5;
  BMEntity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBEntity initWithData:]([BMPBEntity alloc], "initWithData:", v4);

    self = -[BMEntity initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (-[BMEntity isTopicType](self, "isTopicType"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v3, "setEntityType:", v4);
  if (-[BMEntity isTopicType](self, "isTopicType"))
  {
    -[BMEntity topicEntity](self, "topicEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTopicEntity:", v6);

  }
  if (-[BMEntity isPersonType](self, "isPersonType"))
  {
    -[BMEntity personEntity](self, "personEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "proto");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPersonEntity:", v8);

  }
  return v3;
}

- (BOOL)isPersonType
{
  return self->_isPersonType;
}

- (BOOL)isTopicType
{
  return self->_isTopicType;
}

- (BMTopicEntity)topicEntity
{
  return self->_topicEntity;
}

- (BMPersonEntity)personEntity
{
  return self->_personEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personEntity, 0);
  objc_storeStrong((id *)&self->_topicEntity, 0);
}

@end
