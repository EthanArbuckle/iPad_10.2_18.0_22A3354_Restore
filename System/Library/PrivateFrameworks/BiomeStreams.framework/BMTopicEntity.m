@implementation BMTopicEntity

- (BMTopicEntity)initWithTopicId:(id)a3 displayName:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMTopicEntity *v12;
  BMTopicEntity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMTopicEntity;
  v12 = -[BMTopicEntity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topicId, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_attributes, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *topicId;
  void *v7;
  NSString *displayName;
  void *v9;
  NSDictionary *attributes;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    topicId = self->_topicId;
    objc_msgSend(v5, "topicId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](topicId, "isEqualToString:", v7))
    {
      displayName = self->_displayName;
      objc_msgSend(v5, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[BMEntityRelationshipEventUtilities checkNullableStringEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableStringEqualityForSource:target:", displayName, v9))
      {
        attributes = self->_attributes;
        objc_msgSend(v5, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[BMEntityRelationshipEventUtilities checkNullableDictionaryEqualityForSource:target:](BMEntityRelationshipEventUtilities, "checkNullableDictionaryEqualityForSource:target:", attributes, v11);

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

  -[BMTopicEntity proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMTopicEntity)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BMTopicEntity *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v6 = (void *)objc_opt_new();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v5, "attributes", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v12, "value");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "key");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setValue:forKey:", v13, v14);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

    }
    objc_msgSend(v5, "topicId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v6, "copy");
    self = -[BMTopicEntity initWithTopicId:displayName:attributes:](self, "initWithTopicId:displayName:attributes:", v15, v16, v17);

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BMTopicEntity)initWithProtoData:(id)a3
{
  id v4;
  BMPBTopicEntity *v5;
  BMTopicEntity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBTopicEntity initWithData:]([BMPBTopicEntity alloc], "initWithData:", v4);

    self = -[BMTopicEntity initWithProto:](self, "initWithProto:", v5);
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BMTopicEntity topicId](self, "topicId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTopicId:", v4);

  -[BMTopicEntity displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayName:", v5);

  -[BMTopicEntity attributes](self, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[BMTopicEntity attributes](self, "attributes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x193FECFB4]();
          v14 = (void *)objc_opt_new();
          objc_msgSend(v14, "setKey:", v12);
          -[BMTopicEntity attributes](self, "attributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setValue:", v16);

          objc_msgSend(v7, "addObject:", v14);
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v17 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setAttributes:", v17);

  }
  return v3;
}

- (NSString)topicId
{
  return self->_topicId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_topicId, 0);
}

@end
