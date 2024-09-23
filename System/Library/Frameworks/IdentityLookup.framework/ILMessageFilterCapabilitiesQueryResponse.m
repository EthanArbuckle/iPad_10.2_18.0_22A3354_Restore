@implementation ILMessageFilterCapabilitiesQueryResponse

- (ILMessageFilterCapabilitiesQueryResponse)init
{
  ILMessageFilterCapabilitiesQueryResponse *v2;
  ILMessageFilterCapabilitiesQueryResponse *v3;
  NSArray *promotionalSubActions;
  NSArray *v5;
  NSArray *transactionalSubActions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ILMessageFilterCapabilitiesQueryResponse;
  v2 = -[ILMessageFilterCapabilitiesQueryResponse init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    promotionalSubActions = v2->_promotionalSubActions;
    v5 = (NSArray *)MEMORY[0x24BDBD1A8];
    v2->_promotionalSubActions = (NSArray *)MEMORY[0x24BDBD1A8];

    transactionalSubActions = v3->_transactionalSubActions;
    v3->_transactionalSubActions = v5;

  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILMessageFilterCapabilitiesQueryResponse transactionalSubActions](self, "transactionalSubActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILMessageFilterCapabilitiesQueryResponse promotionalSubActions](self, "promotionalSubActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILMessageFilterCapabilitiesQueryResponse version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p subActions transactionalSubActions=%p promotionalSubActions=%p version=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILMessageFilterCapabilitiesQueryResponse isEqualToCapabilitiesResponse:](self, "isEqualToCapabilitiesResponse:", v4);

  return v5;
}

- (BOOL)isEqualToCapabilitiesResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD14E0]);
  -[ILMessageFilterCapabilitiesQueryResponse transactionalSubActions](self, "transactionalSubActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = objc_alloc(MEMORY[0x24BDD14E0]);
  objc_msgSend(v4, "transactionalSubActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

  v11 = objc_alloc(MEMORY[0x24BDD14E0]);
  -[ILMessageFilterCapabilitiesQueryResponse promotionalSubActions](self, "promotionalSubActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

  v14 = objc_alloc(MEMORY[0x24BDD14E0]);
  objc_msgSend(v4, "promotionalSubActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);

  if (objc_msgSend(v7, "isEqualToSet:", v10) && objc_msgSend(v13, "isEqualToSet:", v16))
  {
    -[ILMessageFilterCapabilitiesQueryResponse version](self, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[ILMessageFilterCapabilitiesQueryResponse transactionalSubActions](self, "transactionalSubActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ILMessageFilterCapabilitiesQueryResponse promotionalSubActions](self, "promotionalSubActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ILMessageFilterCapabilitiesQueryResponse version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterCapabilitiesQueryResponse)initWithCoder:(id)a3
{
  id v4;
  ILMessageFilterCapabilitiesQueryResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *promotionalSubActions;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *transactionalSubActions;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *version;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ILMessageFilterCapabilitiesQueryResponse;
  v5 = -[ILMessageFilterCapabilitiesQueryResponse init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_promotionalSubActions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    promotionalSubActions = v5->_promotionalSubActions;
    v5->_promotionalSubActions = (NSArray *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_transactionalSubActions);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    transactionalSubActions = v5->_transactionalSubActions;
    v5->_transactionalSubActions = (NSArray *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_version);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *promotionalSubActions;
  id v5;
  void *v6;
  NSArray *transactionalSubActions;
  void *v8;
  NSString *version;
  id v10;

  promotionalSubActions = self->_promotionalSubActions;
  v5 = a3;
  NSStringFromSelector(sel_promotionalSubActions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", promotionalSubActions, v6);

  transactionalSubActions = self->_transactionalSubActions;
  NSStringFromSelector(sel_transactionalSubActions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", transactionalSubActions, v8);

  version = self->_version;
  NSStringFromSelector(sel_version);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", version, v10);

}

- (NSArray)transactionalSubActions
{
  return self->_transactionalSubActions;
}

- (void)setTransactionalSubActions:(NSArray *)transactionalSubActions
{
  objc_setProperty_nonatomic_copy(self, a2, transactionalSubActions, 8);
}

- (NSArray)promotionalSubActions
{
  return self->_promotionalSubActions;
}

- (void)setPromotionalSubActions:(NSArray *)promotionalSubActions
{
  objc_setProperty_nonatomic_copy(self, a2, promotionalSubActions, 16);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_promotionalSubActions, 0);
  objc_storeStrong((id *)&self->_transactionalSubActions, 0);
}

@end
