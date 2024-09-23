@implementation SGCuratedEventKey

- (SGCuratedEventKey)initWithSerialized:(id)a3
{
  id v5;
  SGCuratedEventKey *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGCuratedEventKey.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  v6 = -[SGCuratedEventKey initWithExternalId:](self, "initWithExternalId:", v5);

  return v6;
}

- (id)serialize
{
  return self->_externalId;
}

- (SGCuratedEventKey)initWithExternalId:(id)a3
{
  id v6;
  SGCuratedEventKey *v7;
  SGCuratedEventKey *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGCuratedEventKey.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGCuratedEventKey;
  v7 = -[SGCuratedEventKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_externalId, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SGCuratedEventKey *v4;
  SGCuratedEventKey *v5;
  BOOL v6;

  v4 = (SGCuratedEventKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGCuratedEventKey isEqualToCuratedEventKey:](self, "isEqualToCuratedEventKey:", v5);

  return v6;
}

- (BOOL)isEqualToCuratedEventKey:(id)a3
{
  SGCuratedEventKey *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (SGCuratedEventKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = self->_externalId;
    v6 = v5;
    if (v5 == v4->_externalId)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_externalId, "hash");
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGCuratedEvent externalId: %@>"), self->_externalId);
}

- (NSString)externalId
{
  return self->_externalId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalId, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 1;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGCuratedEventKey.m"), 77, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
