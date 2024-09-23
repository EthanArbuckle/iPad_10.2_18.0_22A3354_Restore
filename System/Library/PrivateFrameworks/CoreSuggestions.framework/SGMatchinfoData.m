@implementation SGMatchinfoData

- (SGMatchinfoData)initWithMatchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5
{
  id v9;
  id v10;
  id v11;
  SGMatchinfoData *v12;
  SGMatchinfoData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMatchinfoData;
  v12 = -[SGMatchinfoData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityId, a3);
    objc_storeStrong((id *)&v13->_detailEntityId, a4);
    objc_storeStrong((id *)&v13->_matchinfoData, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSNumber hash](self->_entityId, "hash");
  v4 = -[NSNumber hash](self->_detailEntityId, "hash") - v3 + 32 * v3;
  return -[NSData hash](self->_matchinfoData, "hash") - v4 + 32 * v4;
}

- (SGMatchinfoData)initWithCoder:(id)a3
{
  id v5;
  SGMatchinfoData *v6;
  void *v7;
  void *v8;
  NSNumber *v9;
  void *entityId;
  void *v11;
  void *v12;
  NSNumber *v13;
  void *detailEntityId;
  void *v15;
  void *v16;
  NSData *v17;
  void *matchinfoData;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SGMatchinfoData;
  v6 = -[SGMatchinfoData init](&v20, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("entityId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      entityId = v6->_entityId;
      v6->_entityId = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      entityId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(entityId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGMatchinfoData.m"), 48, CFSTR("nonnull property %s *%s was null when decoded"), "NSNumber", "entityId");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("detailEntityId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      detailEntityId = v6->_detailEntityId;
      v6->_detailEntityId = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      detailEntityId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(detailEntityId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGMatchinfoData.m"), 49, CFSTR("nonnull property %s *%s was null when decoded"), "NSNumber", "detailEntityId");
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("matchinfoData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v16;
      matchinfoData = v6->_matchinfoData;
      v6->_matchinfoData = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      matchinfoData = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(matchinfoData, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGMatchinfoData.m"), 50, CFSTR("nonnull property %s *%s was null when decoded"), "NSData", "matchinfoData");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *entityId;
  id v5;

  entityId = self->_entityId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entityId, CFSTR("entityId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailEntityId, CFSTR("detailEntityId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchinfoData, CFSTR("matchinfoData"));

}

- (BOOL)isEqualToMatchinfoData:(id)a3
{
  id v4;
  NSNumber *entityId;
  void *v6;
  NSNumber *detailEntityId;
  void *v8;
  NSData *matchinfoData;
  void *v10;
  BOOL v11;

  v4 = a3;
  entityId = self->_entityId;
  objc_msgSend(v4, "entityId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSNumber isEqualToNumber:](entityId, "isEqualToNumber:", v6))
  {
    detailEntityId = self->_detailEntityId;
    objc_msgSend(v4, "detailEntityId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSNumber isEqualToNumber:](detailEntityId, "isEqualToNumber:", v8))
    {
      matchinfoData = self->_matchinfoData;
      objc_msgSend(v4, "matchinfoData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSData isEqualToData:](matchinfoData, "isEqualToData:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMatchinfoData: entityId=%@ detailEntityId=%@ matchinfoData=%@"), self->_entityId, self->_detailEntityId, self->_matchinfoData);
}

- (NSNumber)entityId
{
  return self->_entityId;
}

- (NSNumber)detailEntityId
{
  return self->_detailEntityId;
}

- (NSData)matchinfoData
{
  return self->_matchinfoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchinfoData, 0);
  objc_storeStrong((id *)&self->_detailEntityId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
}

+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4 matchinfoData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMatchinfoDataWithEntityId:detailEntityId:matchinfoData:", v10, v9, v8);

  return v11;
}

+ (id)matchinfoDataWithEntityId:(id)a3 detailEntityId:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(v8, "initWithMatchinfoDataWithEntityId:detailEntityId:matchinfoData:", v7, v6, v9);

  return v10;
}

@end
