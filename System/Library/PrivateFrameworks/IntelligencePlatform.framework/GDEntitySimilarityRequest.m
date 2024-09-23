@implementation GDEntitySimilarityRequest

- (GDEntitySimilarityRequest)initWithEntityId1:(id)a3 entityId2:(id)a4 entitySimilarityMode:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  GDEntitySimilarityRequest *v12;
  uint64_t v13;
  GDEntityIdentifier *entityId1;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  GDEntityIdentifier *entityId2;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)GDEntitySimilarityRequest;
  v12 = -[GDEntitySimilarityRequest init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    entityId1 = v12->_entityId1;
    v12->_entityId1 = (GDEntityIdentifier *)v13;

    v17 = objc_msgSend_copy(v9, v15, v16);
    entityId2 = v12->_entityId2;
    v12->_entityId2 = (GDEntityIdentifier *)v17;

    v12->_entitySimilarityMode = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  GDEntityIdentifier *entityId1;
  id v5;
  void *v6;
  const char *v7;
  GDEntityIdentifier *entityId2;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;

  entityId1 = self->_entityId1;
  v5 = a3;
  NSStringFromSelector(sel_entityId1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)entityId1, v6);

  entityId2 = self->_entityId2;
  NSStringFromSelector(sel_entityId2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)entityId2, v9);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v11, self->_entitySimilarityMode);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_entitySimilarityMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v14, v12);

}

- (GDEntitySimilarityRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  GDEntitySimilarityRequest *v21;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_entityId1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_entityId2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  NSStringFromSelector(sel_entitySimilarityMode);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (int)objc_msgSend_intValue(v16, v17, v18);
  v21 = (GDEntitySimilarityRequest *)objc_msgSend_initWithEntityId1_entityId2_entitySimilarityMode_(self, v20, (uint64_t)v8, v12, v19);

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  return (id)objc_msgSend_initWithEntityId1_entityId2_entitySimilarityMode_(v7, v8, (uint64_t)self->_entityId1, self->_entityId2, self->_entitySimilarityMode);
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("GDEntitySimilarityRequest<entityId1: %@, entityId2: %@, entitySimilarityMode: %ld>"), self->_entityId1, self->_entityId2, self->_entitySimilarityMode);
}

- (int64_t)entitySimilarityMode
{
  return self->_entitySimilarityMode;
}

- (GDEntityIdentifier)entityId1
{
  return self->_entityId1;
}

- (GDEntityIdentifier)entityId2
{
  return self->_entityId2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId2, 0);
  objc_storeStrong((id *)&self->_entityId1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
