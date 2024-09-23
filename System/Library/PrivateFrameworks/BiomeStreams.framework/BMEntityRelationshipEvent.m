@implementation BMEntityRelationshipEvent

- (BMEntityRelationshipEvent)initWithClientId:(id)a3 relationship:(id)a4 sourceEntity:(id)a5 targetEntity:(id)a6 attributes:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMEntityRelationshipEvent *v17;
  BMEntityRelationshipEvent *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMEntityRelationshipEvent;
  v17 = -[BMEntityRelationshipEvent init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientId, a3);
    objc_storeStrong((id *)&v18->_relationship, a4);
    objc_storeStrong((id *)&v18->_sourceEntity, a5);
    objc_storeStrong((id *)&v18->_targetEntity, a6);
    objc_storeStrong((id *)&v18->_attributes, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *clientId;
  void *v7;
  NSString *relationship;
  void *v9;
  BMEntity *sourceEntity;
  void *v11;
  BMEntity *targetEntity;
  void *v13;
  NSDictionary *attributes;
  void *v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    clientId = self->_clientId;
    objc_msgSend(v5, "clientId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](clientId, "isEqualToString:", v7))
    {
      relationship = self->_relationship;
      objc_msgSend(v5, "relationship");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](relationship, "isEqualToString:", v9))
      {
        sourceEntity = self->_sourceEntity;
        objc_msgSend(v5, "sourceEntity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[BMEntity isEqual:](sourceEntity, "isEqual:", v11))
        {
          targetEntity = self->_targetEntity;
          objc_msgSend(v5, "targetEntity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[BMEntity isEqual:](targetEntity, "isEqual:", v13))
          {
            attributes = self->_attributes;
            objc_msgSend(v5, "attributes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableDictionaryEqualityForSource:target:", attributes, v15);

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMEntityRelationshipEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMEntityRelationshipEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BMEntityRelationshipEvent *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "sourceEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMEntityRelationshipEvent entityFromPBEntity:](self, "entityFromPBEntity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "targetEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMEntityRelationshipEvent entityFromPBEntity:](self, "entityFromPBEntity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v24 = v9;
      v25 = v7;
      v10 = (void *)objc_opt_new();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v5, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v16, "value", v24, v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "key");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setValue:forKey:", v17, v18);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v13);
      }

      v9 = v24;
      v7 = v25;
    }
    objc_msgSend(v5, "clientId", v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationship");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v10, "copy");
    self = -[BMEntityRelationshipEvent initWithClientId:relationship:sourceEntity:targetEntity:attributes:](self, "initWithClientId:relationship:sourceEntity:targetEntity:attributes:", v19, v20, v7, v9, v21);

    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BMEntityRelationshipEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBEntityRelationshipEvent *v5;
  BMEntityRelationshipEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBEntityRelationshipEvent initWithData:]([BMPBEntityRelationshipEvent alloc], "initWithData:", v4);

    self = -[BMEntityRelationshipEvent initWithProto:](self, "initWithProto:", v5);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BMEntityRelationshipEvent clientId](self, "clientId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientId:", v4);

  -[BMEntityRelationshipEvent relationship](self, "relationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelationship:", v5);

  -[BMEntityRelationshipEvent sourceEntity](self, "sourceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceEntity:", v7);

  -[BMEntityRelationshipEvent targetEntity](self, "targetEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "proto");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetEntity:", v9);

  -[BMEntityRelationshipEvent attributes](self, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[BMEntityRelationshipEvent attributes](self, "attributes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x193FECFB4]();
          v18 = (void *)objc_opt_new();
          objc_msgSend(v18, "setKey:", v16);
          -[BMEntityRelationshipEvent attributes](self, "attributes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValue:", v20);

          objc_msgSend(v11, "addObject:", v18);
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v21 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setAttributes:", v21);

  }
  return v3;
}

- (id)entityFromPBEntity:(id)a3
{
  id v3;
  BMEntity *v4;
  uint64_t v5;
  uint64_t v6;
  BMTopicEntity *v7;
  void *v8;
  BMTopicEntity *v9;
  BMPersonEntity *v10;
  void *v11;
  BMPersonEntity *v12;
  BMEntity *v13;

  v3 = a3;
  v4 = [BMEntity alloc];
  v5 = objc_msgSend(v3, "hasPersonEntity");
  v6 = objc_msgSend(v3, "hasTopicEntity");
  v7 = [BMTopicEntity alloc];
  objc_msgSend(v3, "topicEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BMTopicEntity initWithProto:](v7, "initWithProto:", v8);
  v10 = [BMPersonEntity alloc];
  objc_msgSend(v3, "personEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[BMPersonEntity initWithProto:](v10, "initWithProto:", v11);
  v13 = -[BMEntity initWithIsPersonType:isTopicType:topicEntity:personEntity:](v4, "initWithIsPersonType:isTopicType:topicEntity:personEntity:", v5, v6, v9, v12);

  return v13;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (BMEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (BMEntity)targetEntity
{
  return self->_targetEntity;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_targetEntity, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
}

@end
